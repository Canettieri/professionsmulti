--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows your Enchanting skill level.
Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "ENCM"
local ENCM, prevENCM = 0.0, -2
local ENCMmax = 0
local ENCMIncrease = 0
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
		if skillLine == 333 then
			ENCM = skillLevel
			ENCMmax = maxSkillLevel
			ENCMIncrease = IncreaseSkillLevel
			profOffset = offset
			if not startskill then startskill = skillLevel end
		elseif prof2 ~= nil then
			local name, _, skillLevel, maxSkillLevel, _, offset, skillLine, IncreaseSkillLevel = GetProfessionInfo(prof2)
			if skillLine == 333 then
				ENCM = skillLevel
				ENCMmax = maxSkillLevel
				ENCMIncrease = IncreaseSkillLevel
				profOffset = offset
				if not startskill then startskill = skillLevel end
			end
		end
	end

	if ENCM == prevENCM and ENCMmax == preENCMmax and prevENCMIncrease == ENCMIncrease then
		return
	end

	preENCMmax = ENCMmax
	prevENCM = ENCM
	prevENCMIncrease = ENCMIncrease

	TitanPanelButton_UpdateButton(id)
	return true
end
-----------------------------------------------
local function GetButtonText(self, id)
	local ENCMtext
	local bonusText = ""
	if ENCMIncrease and ENCMIncrease > 0 then -- Bônus da profissão
		bonusText = "|r|cFFFFFFFF".." + |r|cFF69FF69"..ENCMIncrease.."|r|cFFFFFFFF "..L["bonus"].." =|r|cFF69FF69 "..(ENCM+ENCMIncrease)
	end
	local HideText = "" -- Texto HideMax
	if not TitanGetVar(ID, "HideMax") then
		HideText = "|r/|cFFFF2e2e"..ENCMmax
	end
	local SimpleText = bonusText -- Texto de bônus simples
	if TitanGetVar(ID, "SimpleBonus") and ENCMIncrease > 0 then
		SimpleText = "|r|cFFFFFFFF".." (+|r|cFF69FF69"..ENCMIncrease.."|r|cFFFFFFFF)"
	end

	local BarBalanceText = ""
	if ENCMmax ~= 0 and (ENCM - startskill) > 0 and TitanGetVar(ID, "ShowBarBalance") then
		BarBalanceText = " |cFF69FF69["..(ENCM - startskill).."]"
	end

	if ENCM == 800 then
		ENCMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif level > 49 and ENCM == 175 then
		ENCMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif ENCMmax == 0 then
		ENCMtext = "|cFFFF2e2e"..L["noprof"]
	elseif ENCM == ENCMmax and level < 50 then
		ENCMtext = "|cFFFFFFFF"..ENCM.."|cFFFF2e2e! ["..L["maximum"].."]"..SimpleText..BarBalanceText
	else
		ENCMtext = "|cFFFFFFFF"..ENCM..HideText..SimpleText..BarBalanceText
	end

	return L["enchanting"]..": ", ENCMtext
end
-----------------------------------------------
local function GetTooltipText(self, id)
	local totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFFFFFFFF"..ENCM -- Valor atual da prof.
	if ENCMIncrease > 0 then
		totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFF69FF69"..ENCM+ENCMIncrease
	end
	local bonusText = "" -- Texto bónus só aparece se você tiver bônus para mostrar!
	if ENCMIncrease > 0 then
		bonusText = "\n"..L["bonustext"].."\t|cFF69FF69"..ENCMIncrease
	end
	local maxSkill = "\n"..L["maxtext"].."\t"..TitanUtils_GetHighlightText(ENCMmax) -- O máximo que você pode ter no nível atual de perícia

	local Goodwith = "\n \n"..L["goodwith"].."\n"..L["tailoring"] -- Texto de combinação

	local CombinationText = Goodwith -- Tecto das combinações
	if TitanGetVar(ID, "HideCombination") then
		CombinationText = ""
	end

	local ColorValueAccount -- Conta de ganho de perícia
	if not ENCM then
		ColorValueAccount = ""
	elseif ENCM == 800 then
		ColorValueAccount = "\n"..L["maxskill"]
	elseif not startskill  or (ENCM - startskill) == 0 then
		ColorValueAccount = "\n"..L["session"].."\t"..TitanUtils_GetHighlightText("0")
	elseif (ENCM - startskill) > 0 then
		ColorValueAccount = "\n"..L["session"].."\t".."|cFF69FF69"..(ENCM - startskill).."|r"
	elseif (ENCM - startskill) < 0 then -- Segurança quando existe mudança de exp.
		ColorValueAccount = ""
	end

	local warning -- Aviso de que não está mais aprendendo
	if ENCMmax == 800 then
		warning = ""
	elseif ENCM == ENCMmax and level < 50 and ENCM ~= 175 then
		warning = L["warning"]
	elseif ENCM == 175 and level > 49 then -- Não deixa abvisar no BfA se estiver com 175
		warning = ""
	else
		warning = ""
	end

	local ValueText = "" -- Difere com e sem profissão
	if ENCM == 0 then
		ValueText = L["noskill"]..Goodwith
	else
		ValueText = L["hint"].."\n \n"..L["info"]..bonusText..totalTooltip..maxSkill..ColorValueAccount..CombinationText..warning
	end

	return ValueText
end
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|c22fdce08 "..L["enchanting"].."|r".." Multi",
	tooltip = L["enchanting"],
	icon = (expansionLevel >= 9) and "Interface\\Icons\\ui_profession_enchanting" or "Interface\\Icons\\trade_engraving",
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
