--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows your Archaeology skill level.
Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "ARCM"
local ARCM, prevARCM = 0.0, -2
local ARCMmax = 0
local ARCMIncrease = 0
local startskill
local profOffset
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

	if archaeology ~= nil then
		local name, _, skillLevel, maxSkillLevel, _, offset, _, IncreaseSkillLevel = GetProfessionInfo(archaeology)
		ARCM = skillLevel
		ARCMmax = maxSkillLevel
		ARCMIncrease = IncreaseSkillLevel
		profOffset = offset
		if not startskill then startskill = skillLevel end

		if ARCM == prevARCM and prevARCMmax == ARCMmax and prevARCMIncrease == ARCMIncrease then
			return
		end

		prevARCMmax = ARCMmax
		prevARCM  = ARCM
		prevARCMIncrease = ARCMIncrease

		TitanPanelButton_UpdateButton(id)
		return true
	end
end
-----------------------------------------------
local function GetButtonText(self, id)
	local ARCMtext
	local bonusText = ""
	if ARCMIncrease and ARCMIncrease > 0 then -- Bônus da profissão
		bonusText = "|r|cFFFFFFFF".." + |r|cFF69FF69"..ARCMIncrease.."|r|cFFFFFFFF "..L["bonus"].." =|r|cFF69FF69 "..(ARCM+ARCMIncrease)
	end
	local HideText = "" -- Texto HideMax
	if not TitanGetVar(ID, "HideMax") then
		HideText = "|r/|cFFFF2e2e"..ARCMmax
	end
	local SimpleText = bonusText -- Texto de bônus simples
	if TitanGetVar(ID, "SimpleBonus") and ARCMIncrease > 0 then
		SimpleText = "|r|cFFFFFFFF".." (+|r|cFF69FF69"..ARCMIncrease.."|r|cFFFFFFFF)"
	end

	local BarBalanceText = ""
	if ARCMmax ~= 0 and (ARCM - startskill) > 0 and TitanGetVar(ID, "ShowBarBalance") then
		BarBalanceText = " |cFF69FF69["..(ARCM - startskill).."]"
	end

	if ARCM == 950 then
		ARCMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif ARCMmax == 0 then
		ARCMtext = "|cFFFF2e2e"..L["noprof"]
	elseif ARCM == ARCMmax then
		ARCMtext = "|cFFFFFFFF"..ARCM.."|cFFFF2e2e! ["..L["maximum"].."]"..SimpleText..BarBalanceText
	else
		ARCMtext = "|cFFFFFFFF"..ARCM..HideText..SimpleText..BarBalanceText
	end

	return L["archaeology"]..": ", ARCMtext
end
-----------------------------------------------
local function GetTooltipText(self, id)
	local totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFFFFFFFF"..ARCM -- Valor atual da prof.
	if ARCMIncrease > 0 then
		totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFF69FF69"..ARCM+ARCMIncrease
	end
	local bonusText = "" -- Texto bónus só aparece se você tiver bônus para mostrar!
	if ARCMIncrease > 0 then
		bonusText = "\n"..L["bonustext"].."\t|cFF69FF69"..ARCMIncrease
	end
	local maxSkill = "\n"..L["maxtext"].."\t"..TitanUtils_GetHighlightText(ARCMmax) -- O máximo que você pode ter no nível atual de perícia

	local ColorValueAccount -- Conta de ganho de perícia
	if not ARCM then
		ColorValueAccount = ""
	elseif ARCM == 950 then
		ColorValueAccount = "\n"..L["maxskill"]
	elseif not startskill  or (ARCM - startskill) == 0 then
		ColorValueAccount = "\n"..L["session"].."\t"..TitanUtils_GetHighlightText("0")
	elseif (ARCM - startskill) > 0 then
		ColorValueAccount = "\n"..L["session"].."\t".."|cFF69FF69"..(ARCM - startskill).."|r"
	end

	local warning -- Aviso de que não está mais aprendendo
	if ARCMmax == 950 then
		warning = ""
	elseif ARCM == ARCMmax then
		warning = L["warning"]
	else
		warning = ""
	end

	local ValueText = "" -- Difere com e sem profissão
	if ARCM == 0 then
		ValueText = L["noskill"]
	else
		ValueText = L["hint"].."\n \n"..L["info"]..bonusText..totalTooltip..maxSkill..ColorValueAccount..warning
	end

	return ValueText
end
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|c113bafe3 "..L["archaeology"].."|r".." Multi",
	tooltip = L["archaeology"],
	icon = "Interface\\Icons\\Trade_archaeology.blp",
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
		HideCombination = true, -- Arqueologia não tem combinação... Mas como está no core, paciência...
	}
})
