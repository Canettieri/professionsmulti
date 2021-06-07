--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows your Mining skill level.
Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "MINM"
local MINM, prevMINM = 0.0, -2
local MINMmax = 0
local MINMIncrease = 0
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
		local name, _, skillLevel, maxSkillLevel, _, offset, skillLine, IncreaseSkillLevel = GetProfessionInfo(prof1)
		if skillLine == 186 then
			MINM = skillLevel
			MINMmax = maxSkillLevel
			MINMIncrease = IncreaseSkillLevel
			profOffset = offset
			if not startskill then startskill = skillLevel end
		elseif prof2 ~= nil then
			local name, _, skillLevel, maxSkillLevel, _, offset, skillLine, IncreaseSkillLevel = GetProfessionInfo(prof2)
			if skillLine == 186 then
				MINM = skillLevel
				MINMmax = maxSkillLevel
				MINMIncrease = IncreaseSkillLevel
				profOffset = offset
				if not startskill then startskill = skillLevel end
			end
		end
	end

	if MINM == prevMINM and prevMINMmax == MINMmax and prevMINMIncrease == MINMIncrease then
		return
	end

	preMINMmax = MINMmax
	prevMINM = MINM
	prevMINMIncrease = MINMIncrease

	TitanPanelButton_UpdateButton(id)
	return true
end
-----------------------------------------------
local function GetButtonText(self, id)
	local MINMtext
	local bonusText = ""
	if MINMIncrease and MINMIncrease > 0 then -- Bônus da profissão
		bonusText = "|r|cFFFFFFFF".." + |r|cFF69FF69"..MINMIncrease.."|r|cFFFFFFFF "..L["bonus"].." =|r|cFF69FF69 "..(MINM+MINMIncrease)
	end
	local HideText = "" -- Texto HideMax
	if not TitanGetVar(ID, "HideMax") then
		HideText = "|r/|cFFFF2e2e"..MINMmax
	end
	local SimpleText = bonusText -- Texto de bônus simples
	if TitanGetVar(ID, "SimpleBonus") and MINMIncrease > 0 then
		SimpleText = "|r|cFFFFFFFF".." (+|r|cFF69FF69"..MINMIncrease.."|r|cFFFFFFFF)"
	end

	local BarBalanceText = ""
	if MINMmax ~= 0 and (MINM - startskill) > 0 and TitanGetVar(ID, "ShowBarBalance") then
		BarBalanceText = " |cFF69FF69["..(MINM - startskill).."]"
	end

	if MINM == 800 then
		MINMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif level > 49 and MINM == 175 then
		MINMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif MINMmax == 0 then
		MINMtext = "|cFFFF2e2e"..L["noprof"]
	elseif MINM == MINMmax and level < 50 then
		MINMtext = "|cFFFFFFFF"..MINM.."|cFFFF2e2e! ["..L["maximum"].."]"..SimpleText..BarBalanceText
	else
		MINMtext = "|cFFFFFFFF"..MINM..HideText..SimpleText..BarBalanceText
	end

	return L["mining"]..": ", MINMtext
end
-----------------------------------------------
local function GetTooltipText(self, id)
	local totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFFFFFFFF"..MINM -- Valor atual da prof.
	if MINMIncrease > 0 then
		totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFF69FF69"..MINM+MINMIncrease
	end
	local bonusText = "" -- Texto bónus só aparece se você tiver bônus para mostrar!
	if MINMIncrease > 0 then
		bonusText = "\n"..L["bonustext"].."\t|cFF69FF69"..MINMIncrease
	end
	local maxSkill = "\n"..L["maxtext"].."\t"..TitanUtils_GetHighlightText(MINMmax) -- O máximo que você pode ter no nível atual de perícia

	local Goodwith = "\n \n"..L["goodwith"].."\n"..L["blacksmithing"]..", "..L["engineering"]..", "..L["jewelcrafting"] -- Texto de combinação

	local CombinationText = Goodwith -- Tecto das combinações
	if TitanGetVar(ID, "HideCombination") then
		CombinationText = ""
	end

	local ColorValueAccount -- Conta de ganho de perícia
	if not MINM then
		ColorValueAccount = ""
	elseif MINM == 800 then
		ColorValueAccount = "\n"..L["maxskill"]
	elseif not startskill  or (MINM - startskill) == 0 then
		ColorValueAccount = "\n"..L["session"].."\t"..TitanUtils_GetHighlightText("0")
	elseif (MINM - startskill) > 0 then
		ColorValueAccount = "\n"..L["session"].."\t".."|cFF69FF69"..(MINM - startskill).."|r"
	elseif (MINM - startskill) < 0 then -- Segurança quando existe mudança de exp.
		ColorValueAccount = ""
	end

	local warning -- Aviso de que não está mais aprendendo
	if MINMmax == 800 then
		warning = ""
	elseif MINM == MINMmax and level < 50 and MINM ~= 175 then
		warning = L["warning"]
	elseif MINM == 175 and level > 49 then -- Não deixa abvisar no BfA se estiver com 175
		warning = ""
	else
		warning = ""
	end

	local ValueText = "" -- Difere com e sem profissão
	if MINM == 0 then
		ValueText = L["noskill"]..Goodwith
	else
		ValueText = L["hint"].."\n \n"..L["info"]..bonusText..totalTooltip..maxSkill..ColorValueAccount..CombinationText..warning
	end

	return ValueText
end
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|c00a7f200 "..L["mining"].."|r".." Multi",
	tooltip = L["mining"],
	icon = "Interface\\Icons\\Trade_mining.blp",
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
