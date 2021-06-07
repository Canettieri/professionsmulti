--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows your Inscription skill level.
Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "INSM"
local INSM, prevINSM = 0.0, -2
local INSMmax = 0
local INSMIncrease = 0
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
		if skillLine == 773 then
			INSM = skillLevel
			INSMmax = maxSkillLevel
			INSMIncrease = IncreaseSkillLevel
			profOffset = offset
			if not startskill then startskill = skillLevel end
		elseif prof2 ~= nil then
			local name, _, skillLevel, maxSkillLevel, _, offset, skillLine, IncreaseSkillLevel = GetProfessionInfo(prof2)
			if skillLine == 773 then
				INSM = skillLevel
				INSMmax = maxSkillLevel
				INSMIncrease = IncreaseSkillLevel
				profOffset = offset
				if not startskill then startskill = skillLevel end
			end
		end
	end

	if INSM == prevINSM and INSMmax == preINSMmax and prevINSMIncrease == INSMIncrease then
		return
	end

	preINSMmax = INSMmax
	prevINSM = INSM
	prevINSMIncrease = INSMIncrease

	TitanPanelButton_UpdateButton(id)
	return true
end
-----------------------------------------------
local function GetButtonText(self, id)
	local INSMtext
	local bonusText = ""
	if INSMIncrease and INSMIncrease > 0 then -- Bônus da profissão
		bonusText = "|r|cFFFFFFFF".." + |r|cFF69FF69"..INSMIncrease.."|r|cFFFFFFFF "..L["bonus"].." =|r|cFF69FF69 "..(INSM+INSMIncrease)
	end
	local HideText = "" -- Texto HideMax
	if not TitanGetVar(ID, "HideMax") then
		HideText = "|r/|cFFFF2e2e"..INSMmax
	end
	local SimpleText = bonusText -- Texto de bônus simples
	if TitanGetVar(ID, "SimpleBonus") and INSMIncrease > 0 then
		SimpleText = "|r|cFFFFFFFF".." (+|r|cFF69FF69"..INSMIncrease.."|r|cFFFFFFFF)"
	end

	local BarBalanceText = ""
	if INSMmax ~= 0 and (INSM - startskill) > 0 and TitanGetVar(ID, "ShowBarBalance") then
		BarBalanceText = " |cFF69FF69["..(INSM - startskill).."]"
	end

	if INSM == 800 then
		INSMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif level > 49 and INSM == 175 then
		INSMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif INSMmax == 0 then
		INSMtext = "|cFFFF2e2e"..L["noprof"]
	elseif INSM == INSMmax and level < 50 then
		INSMtext = "|cFFFFFFFF"..INSM.."|cFFFF2e2e! ["..L["maximum"].."]"..SimpleText..BarBalanceText
	else
		INSMtext = "|cFFFFFFFF"..INSM..HideText..SimpleText..BarBalanceText
	end

	return L["inscription"]..": ", INSMtext
end
-----------------------------------------------
local function GetTooltipText(self, id)
	local totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFFFFFFFF"..INSM -- Valor atual da prof.
	if INSMIncrease > 0 then
		totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFF69FF69"..INSM+INSMIncrease
	end
	local bonusText = "" -- Texto bónus só aparece se você tiver bônus para mostrar!
	if INSMIncrease > 0 then
		bonusText = "\n"..L["bonustext"].."\t|cFF69FF69"..INSMIncrease
	end
	local maxSkill = "\n"..L["maxtext"].."\t"..TitanUtils_GetHighlightText(INSMmax) -- O máximo que você pode ter no nível atual de perícia

	local Goodwith = "\n \n"..L["goodwith"].."\n"..L["herbalism"] -- Texto de combinação

	local CombinationText = Goodwith -- Tecto das combinações
	if TitanGetVar(ID, "HideCombination") then
		CombinationText = ""
	end

	local ColorValueAccount -- Conta de ganho de perícia
	if not INSM then
		ColorValueAccount = ""
	elseif INSM == 800 then
		ColorValueAccount = "\n"..L["maxskill"]
	elseif not startskill  or (INSM - startskill) == 0 then
		ColorValueAccount = "\n"..L["session"].."\t"..TitanUtils_GetHighlightText("0")
	elseif (INSM - startskill) > 0 then
		ColorValueAccount = "\n"..L["session"].."\t".."|cFF69FF69"..(INSM - startskill).."|r"
	elseif (INSM - startskill) < 0 then -- Segurança quando existe mudança de exp.
		ColorValueAccount = ""
	end

	local warning -- Aviso de que não está mais aprendendo
	if INSMmax == 800 then
		warning = ""
	elseif INSM == INSMmax and level < 50 and INSM ~= 175 then
		warning = L["warning"]
	elseif INSM == 175 and level > 49 then -- Não deixa abvisar no BfA se estiver com 175
		warning = ""
	else
		warning = ""
	end

	local ValueText = "" -- Difere com e sem profissão
	if INSM == 0 then
		ValueText = L["noskill"]..Goodwith
	else
		ValueText = L["hint"].."\n \n"..L["info"]..bonusText..totalTooltip..maxSkill..ColorValueAccount..CombinationText..warning
	end

	return ValueText
end
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|c22fdce08 "..L["inscription"].."|r".." Multi",
	tooltip = L["inscription"],
	icon = "Interface\\Icons\\Inv_inscription_tradeskill01.blp",
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
