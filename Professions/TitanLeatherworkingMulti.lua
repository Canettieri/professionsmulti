--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows your Leatherworking skill level.
Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "LEAM"
local LEAM, prevLEAM = 0.0, -2
local LEAMmax = 0
local LEAMIncrease = 0
local startskill
local profOffset
local level = UnitLevel("player")
local expansionLevel = LE_EXPANSION_LEVEL_CURRENT
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
		if skillLine == 165 then
			LEAM = skillLevel
			LEAMmax = maxSkillLevel
			LEAMIncrease = IncreaseSkillLevel
			profOffset = offset
			if not startskill then startskill = skillLevel end
		elseif prof2 ~= nil then
			local name, _, skillLevel, maxSkillLevel, _, offset, skillLine, IncreaseSkillLevel = GetProfessionInfo(prof2)
			if skillLine == 165 then
				LEAM = skillLevel
				LEAMmax = maxSkillLevel
				LEAMIncrease = IncreaseSkillLevel
				profOffset = offset
				if not startskill then startskill = skillLevel end
			end
		end
	end

	if LEAM == prevLEAM and LEAMmax == preLEAMmax and prevLEAMIncrease == LEAMIncrease then
		return
	end

	preLEAMmax = LEAMmax
	prevLEAM = LEAM
	prevLEAMIncrease = LEAMIncrease

	TitanPanelButton_UpdateButton(id)
	return true
end
-----------------------------------------------
local function GetButtonText(self, id)
	local LEAMtext
	local bonusText = ""
	if LEAMIncrease and LEAMIncrease > 0 then -- Bônus da profissão
		bonusText = "|r|cFFFFFFFF".." + |r|cFF69FF69"..LEAMIncrease.."|r|cFFFFFFFF "..L["bonus"].." =|r|cFF69FF69 "..(LEAM+LEAMIncrease)
	end
	local HideText = "" -- Texto HideMax
	if not TitanGetVar(ID, "HideMax") then
		HideText = "|r/|cFFFF2e2e"..LEAMmax
	end
	local SimpleText = bonusText -- Texto de bônus simples
	if TitanGetVar(ID, "SimpleBonus") and LEAMIncrease > 0 then
		SimpleText = "|r|cFFFFFFFF".." (+|r|cFF69FF69"..LEAMIncrease.."|r|cFFFFFFFF)"
	end

	local BarBalanceText = ""
	if LEAMmax ~= 0 and (LEAM - startskill) > 0 and TitanGetVar(ID, "ShowBarBalance") then
		BarBalanceText = " |cFF69FF69["..(LEAM - startskill).."]"
	end

	if LEAM == 800 then
		LEAMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif level > 49 and LEAM == 175 then
		LEAMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif LEAMmax == 0 then
		LEAMtext = "|cFFFF2e2e"..L["noprof"]
	elseif LEAM == LEAMmax and level < 50 then
		LEAMtext = "|cFFFFFFFF"..LEAM.."|cFFFF2e2e! ["..L["maximum"].."]"..SimpleText..BarBalanceText
	else
		LEAMtext = "|cFFFFFFFF"..LEAM..HideText..SimpleText..BarBalanceText
	end

	return L["leatherworking"]..": ", LEAMtext
end
-----------------------------------------------
local function GetTooltipText(self, id)
	local totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFFFFFFFF"..LEAM -- Valor atual da prof.
	if LEAMIncrease > 0 then
		totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFF69FF69"..LEAM+LEAMIncrease
	end
	local bonusText = "" -- Texto bónus só aparece se você tiver bônus para mostrar!
	if LEAMIncrease > 0 then
		bonusText = "\n"..L["bonustext"].."\t|cFF69FF69"..LEAMIncrease
	end
	local maxSkill = "\n"..L["maxtext"].."\t"..TitanUtils_GetHighlightText(LEAMmax) -- O máximo que você pode ter no nível atual de perícia

	local Goodwith = "\n \n"..L["goodwith"].."\n"..L["skinning"] -- Texto de combinação

	local CombinationText = Goodwith -- Tecto das combinações
	if TitanGetVar(ID, "HideCombination") then
		CombinationText = ""
	end

	local ColorValueAccount -- Conta de ganho de perícia
	if not LEAM then
		ColorValueAccount = ""
	elseif LEAM == 800 then
		ColorValueAccount = "\n"..L["maxskill"]
	elseif not startskill  or (LEAM - startskill) == 0 then
		ColorValueAccount = "\n"..L["session"].."\t"..TitanUtils_GetHighlightText("0")
	elseif (LEAM - startskill) > 0 then
		ColorValueAccount = "\n"..L["session"].."\t".."|cFF69FF69"..(LEAM - startskill).."|r"
	elseif (LEAM - startskill) < 0 then -- Segurança quando existe mudança de exp.
		ColorValueAccount = ""
	end

	local warning -- Aviso de que não está mais aprendendo
	if LEAMmax == 800 then
		warning = ""
	elseif LEAM == LEAMmax and level < 50 and LEAM ~= 175 then
		warning = L["warning"]
	elseif LEAM == 175 and level > 49 then -- Não deixa abvisar no BfA se estiver com 175
		warning = ""
	else
		warning = ""
	end

	local ValueText = "" -- Difere com e sem profissão
	if LEAM == 0 then
		ValueText = L["noskill"]..Goodwith
	else
		ValueText = L["hint"].."\n \n"..L["info"]..bonusText..totalTooltip..maxSkill..ColorValueAccount..CombinationText..warning
	end

	return ValueText
end
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|c22fdce08 "..L["leatherworking"].."|r".." Multi",
	tooltip = L["leatherworking"],
	icon = "Interface\\Icons\\Trade_leatherworking.blp",
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
