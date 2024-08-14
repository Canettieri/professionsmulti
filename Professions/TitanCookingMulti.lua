--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows your Cooking skill level.
Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "COOM"
local COOM, prevCOOM = 0.0, -2
local COOMmax = 0
local COOMIncrease = 0
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
	local prof1, prof2, archaeology, fishing, cooking, firstAid = GetProfessions();

	profOffset = nil

	if cooking ~= nil then
		local name, _, skillLevel, maxSkillLevel, _, offset, _, IncreaseSkillLevel = GetProfessionInfo(cooking)
		COOM = skillLevel
		COOMmax = maxSkillLevel
		COOMIncrease = IncreaseSkillLevel
		profOffset = offset
		if not startskill then startskill = skillLevel end

		if COOM == prevCOOM and prevCOOMmax == COOMmax and prevCOOMIncrease == COOMIncrease then
			return
		end

		prevCOOMmax = COOMmax
		prevCOOM  = COOM
		prevCOOMIncrease = COOMIncrease

		TitanPanelButton_UpdateButton(id)
		return true
	end
end
-----------------------------------------------
local function GetButtonText(self, id)
	local COOMtext
	local bonusText = ""
	if COOMIncrease and COOMIncrease > 0 then -- Bônus da profissão
		bonusText = "|r|cFFFFFFFF".." + |r|cFF69FF69"..COOMIncrease.."|r|cFFFFFFFF "..L["bonus"].." =|r|cFF69FF69 "..(COOM+COOMIncrease)
	end
	local HideText = "" -- Texto HideMax
	if not TitanGetVar(ID, "HideMax") then
		HideText = "|r/|cFFFF2e2e"..COOMmax
	end
	local SimpleText = bonusText -- Texto de bônus simples
	if TitanGetVar(ID, "SimpleBonus") and COOMIncrease > 0 then
		SimpleText = "|r|cFFFFFFFF".." (+|r|cFF69FF69"..COOMIncrease.."|r|cFFFFFFFF)"
	end

	local BarBalanceText = ""
	if COOMmax ~= 0 and (COOM - startskill) > 0 and TitanGetVar(ID, "ShowBarBalance") then
		BarBalanceText = " |cFF69FF69["..(COOM - startskill).."]"
	end

	if COOM == 800 then
		COOMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif level > 49 and COOM == 175 then
		COOMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif COOMmax == 0 then
		COOMtext = "|cFFFF2e2e"..L["noprof"]
	elseif COOM == COOMmax and level < 50 then
		COOMtext = "|cFFFFFFFF"..COOM.."|cFFFF2e2e! ["..L["maximum"].."]"..SimpleText..BarBalanceText
	else
		COOMtext = "|cFFFFFFFF"..COOM..HideText..SimpleText..BarBalanceText
	end

	return L["cooking"]..": ", COOMtext
end
-----------------------------------------------
local function GetTooltipText(self, id)
	local totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFFFFFFFF"..COOM -- Valor atual da prof.
	if COOMIncrease > 0 then
		totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFF69FF69"..COOM+COOMIncrease
	end
	local bonusText = "" -- Texto bónus só aparece se você tiver bônus para mostrar!
	if COOMIncrease > 0 then
		bonusText = "\n"..L["bonustext"].."\t|cFF69FF69"..COOMIncrease
	end
	local maxSkill = "\n"..L["maxtext"].."\t"..TitanUtils_GetHighlightText(COOMmax) -- O máxim oque vocêr pode ter no nível atual de perícia

	local Goodwith = "\n \n"..L["goodwith"].."\n"..L["fishing"] -- Texto de combinação

	local CombinationText = Goodwith -- Tecto das combinações
	if TitanGetVar(ID, "HideCombination") then
		CombinationText = ""
	end

	local ColorValueAccount -- Conta de ganho de perícia
	if not COOM then
		ColorValueAccount = ""
	elseif COOM == 800 then
		ColorValueAccount = "\n"..L["maxskill"]
	elseif not startskill  or (COOM - startskill) == 0 then
		ColorValueAccount = "\n"..L["session"].."\t"..TitanUtils_GetHighlightText("0")
	elseif (COOM - startskill) > 0 then
		ColorValueAccount = "\n"..L["session"].."\t".."|cFF69FF69"..(COOM - startskill).."|r"
	elseif (COOM - startskill) < 0 then -- Segurança quando existe mudança de exp.
		ColorValueAccount = ""
	end

	local warning -- Aviso de que não está mais aprendendo
	if COOMmax == 800 then
		warning = ""
	elseif COOM == COOMmax and level < 50 and COOM ~= 175 then
		warning = L["warning"]
	elseif COOM == 175 and level > 49 then -- Não deixa abvisar no BfA se estiver com 175
		warning = ""
	else
		warning = ""
	end

	local ValueText = "" -- Difere com e sem profissão
	if COOM == 0 then
		ValueText = L["noskill"]..Goodwith
	else
		ValueText = L["hint"].."\n \n"..L["info"]..bonusText..totalTooltip..maxSkill..ColorValueAccount..CombinationText..warning
	end

	return ValueText
end
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|c113bafe3 "..L["cooking"].."|r".." Multi",
	tooltip = L["cooking"],
	icon = (expansionLevel >= 9) and "Interface\\Icons\\ui_profession_cooking" or "Interface\\Icons\\inv_misc_food_15",
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
