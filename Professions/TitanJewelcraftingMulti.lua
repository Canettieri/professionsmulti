--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows your Jewelcrafting skill level.
Site: http://www.curse.com/addons/wow/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "JEWM"
local JEWM, prevJEWM = 0.0, -2
local JEWMmax = 0
local JEWMIncrease = 0
local startskill
local profOffset
local level = UnitLevel("player")
-----------------------------------------------
local function OnClick(self, button)
	if (button == "LeftButton" and profOffset) then
		CastSpell(profOffset + 1, "Spell")
	end
end
-----------------------------------------------
local function OnUpdate(self, id)
	local prof1, prof2 = GetProfessions();

	local skillLevel = 0
	local maxSkillLevel = 0
	profOffset = nil

	if prof1 ~= nil then
		local name, _, skillLevel, maxSkillLevel, _, offset, _, IncreaseSkillLevel = GetProfessionInfo(prof1)
		if name == L["jewelcrafting"] then
			JEWM = skillLevel
			JEWMmax = maxSkillLevel
			JEWMIncrease = IncreaseSkillLevel
			profOffset = offset
			if not startskill then startskill = skillLevel end
		elseif prof2 ~= nil then
			local name, _, skillLevel, maxSkillLevel, _, offset, _, IncreaseSkillLevel = GetProfessionInfo(prof2)
			if name == L["jewelcrafting"] then
				JEWM = skillLevel
				JEWMmax = maxSkillLevel
				JEWMIncrease = IncreaseSkillLevel
				profOffset = offset
				if not startskill then startskill = skillLevel end
			end
		end
	end

	if JEWM == prevJEWM and JEWMmax == preJEWMmax and prevJEWMIncrease == JEWMIncrease then
		return
	end

	preJEWMmax = JEWMmax
	prevJEWM = JEWM
	prevJEWMIncrease = JEWMIncrease

	TitanPanelButton_UpdateButton(id)
	return true
end
-----------------------------------------------
local function GetButtonText(self, id)
	local JEWMtext
	local bonusText = ""
	if JEWMIncrease and JEWMIncrease > 0 then -- Bônus da profissão
		bonusText = "|r|cFFFFFFFF".." + |r|cFF69FF69"..JEWMIncrease.."|r|cFFFFFFFF "..L["bonus"].." =|r|cFF69FF69 "..(JEWM+JEWMIncrease)
	end
	local HideText = "" -- Texto HideMax
	if not TitanGetVar(ID, "HideMax") then
		HideText = "|r/|cFFFF2e2e"..JEWMmax
	end
	local SimpleText = bonusText -- Texto de bônus simples
	if TitanGetVar(ID, "SimpleBonus") and JEWMIncrease > 0 then
		SimpleText = "|r|cFFFFFFFF".." (+|r|cFF69FF69"..JEWMIncrease.."|r|cFFFFFFFF)"
	end

	local BarBalanceText = ""
	if JEWMmax ~= 0 and (JEWM - startskill) > 0 and TitanGetVar(ID, "ShowBarBalance") then
		BarBalanceText = " |cFF69FF69["..(JEWM - startskill).."]"
	end

	if JEWM == 800 then
		JEWMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif level > 49 and JEWM == 175 then
		JEWMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif JEWMmax == 0 then
		JEWMtext = "|cFFFF2e2e"..L["noprof"]
	elseif JEWM == JEWMmax and level < 50 then
		JEWMtext = "|cFFFFFFFF"..JEWM.."|cFFFF2e2e! ["..L["maximum"].."]"..SimpleText..BarBalanceText
	else
		JEWMtext = "|cFFFFFFFF"..JEWM..HideText..SimpleText..BarBalanceText
	end

	return L["jewelcrafting"]..": ", JEWMtext
end
-----------------------------------------------
local function GetTooltipText(self, id)
	local totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFFFFFFFF"..JEWM -- Valor atual da prof.
	if JEWMIncrease > 0 then
		totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFF69FF69"..JEWM+JEWMIncrease
	end
	local bonusText = "" -- Texto bónus só aparece se você tiver bônus para mostrar!
	if JEWMIncrease > 0 then
		bonusText = "\n"..L["bonustext"].."\t|cFF69FF69"..JEWMIncrease
	end
	local maxSkill = "\n"..L["maxtext"].."\t"..TitanUtils_GetHighlightText(JEWMmax) -- O máximo que você pode ter no nível atual de perícia

	local Goodwith = "\n \n"..L["goodwith"].."\n"..L["mining"] -- Texto de combinação

	local CombinationText = Goodwith -- Tecto das combinações
	if TitanGetVar(ID, "HideCombination") then
		CombinationText = ""
	end

	local ColorValueAccount -- Conta de ganho de perícia
	if not JEWM then
		ColorValueAccount = ""
	elseif JEWM == 800 then
		ColorValueAccount = "\n"..L["maxskill"]
	elseif not startskill  or (JEWM - startskill) == 0 then
		ColorValueAccount = "\n"..L["session"].."\t"..TitanUtils_GetHighlightText("0")
	elseif (JEWM - startskill) > 0 then
		ColorValueAccount = "\n"..L["session"].."\t".."|cFF69FF69"..(JEWM - startskill).."|r"
	elseif (JEWM - startskill) < 0 then -- Segurança quando existe mudança de exp.
		ColorValueAccount = ""
	end

	local warning -- Aviso de que não está mais aprendendo
	if JEWMmax == 800 then
		warning = ""
	elseif JEWM == JEWMmax and level < 50 and JEWM ~= 175 then
		warning = L["warning"]
	elseif JEWM == 175 and level > 49 then -- Não deixa abvisar no BfA se estiver com 175
		warning = ""
	else
		warning = ""
	end

	local ValueText = "" -- Difere com e sem profissão
	if JEWM == 0 then
		ValueText = L["noskill"]..Goodwith
	else
		ValueText = L["hint"].."\n \n"..L["info"]..bonusText..totalTooltip..maxSkill..ColorValueAccount..CombinationText..warning
	end

	return ValueText
end
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|c22fdce08 "..L["jewelcrafting"].."|r".." Multi",
	tooltip = L["jewelcrafting"],
	icon = "Interface\\Icons\\Inv_misc_gem_02.blp",
	category = "Profession",
	version = version,
	onUpdate = OnUpdate,
	onClick = OnClick,
	getButtonText = GetButtonText,
	getTooltipText = GetTooltipText,
	prepareMenu = L.PrepareProfessionsMenu,
	savedVariables = {
		ShowIcon = 1,
		DisplayOnRightSide = false,
		HideMax = false,
		SimpleBonus = true,
		ShowBarBalance = false,
		ShowLabelText = false,
		HideCombination = true,
	}
})
