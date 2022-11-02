--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows your Fishing skill level.
Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "FISM"
local FISM, prevFISM = 0.0, -2
local FISMmax = 0
local FISMIncrease = 0
local startskill
local level = UnitLevel("player")
local expansionLevel = LE_EXPANSION_LEVEL_CURRENT
-----------------------------------------------
local function OnUpdate(self, id)
	local prof1, prof2, archaeology, fishing, cooking, firstAid = GetProfessions();

	profOffset = nil

	if fishing ~= nil then
		local name, _, skillLevel, maxSkillLevel, _, offset, _, IncreaseSkillLevel = GetProfessionInfo(fishing)
		FISM = skillLevel
		FISMmax = maxSkillLevel
		FISMIncrease = IncreaseSkillLevel
		profOffset = offset
		if not startskill then startskill = skillLevel end

		if FISM == prevFISM and prevFISMmax == FISMmax and prevFISMIncrease == FISMIncrease then
			return
		end

		prevFISMmax = FISMmax
		prevFISM  = FISM
		prevFISMIncrease = FISMIncrease

		TitanPanelButton_UpdateButton(id)
		return true
	end
end
-----------------------------------------------
local function GetButtonText(self, id)
	local FISMtext
	local bonusText = ""
	if FISMIncrease and FISMIncrease > 0 then -- Bônus da profissão
		bonusText = "|r|cFFFFFFFF".." + |r|cFF69FF69"..FISMIncrease.."|r|cFFFFFFFF "..L["bonus"].." =|r|cFF69FF69 "..(FISM+FISMIncrease)
	end
	local HideText = "" -- Texto HideMax
	if not TitanGetVar(ID, "HideMax") then
		HideText = "|r/|cFFFF2e2e"..FISMmax
	end
	local SimpleText = bonusText -- Texto de bônus simples
	if TitanGetVar(ID, "SimpleBonus") and FISMIncrease > 0 then
		SimpleText = "|r|cFFFFFFFF".." (+|r|cFF69FF69"..FISMIncrease.."|r|cFFFFFFFF)"
	end

	local BarBalanceText = ""
	if FISMmax ~= 0 and (FISM - startskill) > 0 and TitanGetVar(ID, "ShowBarBalance") then
		BarBalanceText = " |cFF69FF69["..(FISM - startskill).."]"
	end

	if FISM == 800 then
		FISMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif level > 49 and FISM == 175 then
		FISMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif FISMmax == 0 then
		FISMtext = "|cFFFF2e2e"..L["noprof"]
	elseif FISM == FISMmax and level < 50 then
		FISMtext = "|cFFFFFFFF"..FISM.."|cFFFF2e2e! ["..L["maximum"].."]"..SimpleText..BarBalanceText
	else
		FISMtext = "|cFFFFFFFF"..FISM..HideText..SimpleText..BarBalanceText
	end

	return L["fishing"]..": ", FISMtext
end
-----------------------------------------------
local function GetTooltipText(self, id)
	local totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFFFFFFFF"..FISM -- Valor atual da prof.
	if FISMIncrease > 0 then
		totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFF69FF69"..FISM+FISMIncrease
	end
	local bonusText = "" -- Texto bónus só aparece se você tiver bônus para mostrar!
	if FISMIncrease > 0 then
		bonusText = "\n"..L["bonustext"].."\t|cFF69FF69"..FISMIncrease
	end
	local maxSkill = "\n"..L["maxtext"].."\t"..TitanUtils_GetHighlightText(FISMmax) -- O máxim oque vocêr pode ter no nível atual de perícia

	local Goodwith = "\n \n"..L["goodwith"].."\n"..L["cooking"] -- Texto de combinação

	local CombinationText = Goodwith -- Tecto das combinações
	if TitanGetVar(ID, "HideCombination") then
		CombinationText = ""
	end

	local ColorValueAccount -- Conta de ganho de perícia
	if not FISM then
		ColorValueAccount = ""
	elseif FISM == 800 then
		ColorValueAccount = "\n"..L["maxskill"]
	elseif not startskill  or (FISM - startskill) == 0 then
		ColorValueAccount = "\n"..L["session"].."\t"..TitanUtils_GetHighlightText("0")
	elseif (FISM - startskill) > 0 then
		ColorValueAccount = "\n"..L["session"].."\t".."|cFF69FF69"..(FISM - startskill).."|r"
	elseif (FISM - startskill) < 0 then -- Segurança quando existe mudança de exp.
		ColorValueAccount = ""
	end

	local warning -- Aviso de que não está mais aprendendo
	if FISMmax == 800 then
		warning = ""
	elseif FISM == FISMmax and level < 50 and FISM ~= 175 then
		warning = L["warning"]
	elseif FISM == 175 and level > 49 then -- Não deixa abvisar no BfA se estiver com 175
		warning = ""
	else
		warning = ""
	end

	local ValueText = "" -- Difere com e sem profissão
	if FISM == 0 then
		ValueText = L["noskill"]..Goodwith
	else
		ValueText = L["info"]..bonusText..totalTooltip..maxSkill..ColorValueAccount..CombinationText..warning
	end

	return ValueText
end
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|c113bafe3 "..L["fishing"].."|r".." Multi",
	tooltip = L["fishing"],
	icon = (expansionLevel >= 9) and "Interface\\Icons\\ui_profession_fishing" or "Interface\\Icons\\trade_fishing",
	category = "Profession",
	version = version,
	onUpdate = OnUpdate,
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
