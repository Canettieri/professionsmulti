--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows your Blacksmithing skill level.
Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "BLAM"
local BLAM, prevBLAM = 0.0, -2
local BLAMmax = 0
local BLAMIncrease = 0
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
		if skillLine == 164 then
			BLAM = skillLevel
			BLAMmax = maxSkillLevel
			BLAMIncrease = IncreaseSkillLevel
			profOffset = offset
			if not startskill then startskill = skillLevel end
		elseif prof2 ~= nil then
			local name, _, skillLevel, maxSkillLevel, _, offset, skillLine, IncreaseSkillLevel = GetProfessionInfo(prof2)
			if skillLine == 164 then
				BLAM = skillLevel
				BLAMmax = maxSkillLevel
				BLAMIncrease = IncreaseSkillLevel
				profOffset = offset
				if not startskill then startskill = skillLevel end
			end
		end
	end

	if BLAM == prevBLAM and BLAMmax == preBLAMmax and prevBLAMIncrease == BLAMIncrease then
		return
	end

	preBLAMmax = BLAMmax
	prevBLAM = BLAM
	prevBLAMIncrease = BLAMIncrease

	TitanPanelButton_UpdateButton(id)
	return true
end
-----------------------------------------------
local function GetButtonText(self, id)
	local BLAMtext
	local bonusText = ""
	if BLAMIncrease and BLAMIncrease > 0 then -- Bônus da profissão
		bonusText = "|r|cFFFFFFFF".." + |r|cFF69FF69"..BLAMIncrease.."|r|cFFFFFFFF "..L["bonus"].." =|r|cFF69FF69 "..(BLAM+BLAMIncrease)
	end
	local HideText = "" -- Texto HideMax
	if not TitanGetVar(ID, "HideMax") then
		HideText = "|r/|cFFFF2e2e"..BLAMmax
	end
	local SimpleText = bonusText -- Texto de bônus simples
	if TitanGetVar(ID, "SimpleBonus") and BLAMIncrease > 0 then
		SimpleText = "|r|cFFFFFFFF".." (+|r|cFF69FF69"..BLAMIncrease.."|r|cFFFFFFFF)"
	end

	local BarBalanceText = ""
	if BLAMmax ~= 0 and (BLAM - startskill) > 0 and TitanGetVar(ID, "ShowBarBalance") then
		BarBalanceText = " |cFF69FF69["..(BLAM - startskill).."]"
	end

	if BLAM == 800 then
		BLAMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif level > 49 and BLAM == 175 then
		BLAMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif BLAMmax == 0 then
		BLAMtext = "|cFFFF2e2e"..L["noprof"]
	elseif BLAM == BLAMmax and level < 50 then
		BLAMtext = "|cFFFFFFFF"..BLAM.."|cFFFF2e2e! ["..L["maximum"].."]"..SimpleText..BarBalanceText
	else
		BLAMtext = "|cFFFFFFFF"..BLAM..HideText..SimpleText..BarBalanceText
	end

	return L["blacksmithing"]..": ", BLAMtext
end
-----------------------------------------------
local function GetTooltipText(self, id)
	local totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFFFFFFFF"..BLAM
	if BLAMIncrease > 0 then
		totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFF69FF69"..BLAM+BLAMIncrease
	end
	local bonusText = ""
	if BLAMIncrease > 0 then
		bonusText = "\n"..L["bonustext"].."\t|cFF69FF69"..BLAMIncrease
	end
	local maxSkill = "\n"..L["maxtext"].."\t"..TitanUtils_GetHighlightText(BLAMmax)

	local Goodwith = "\n \n"..L["goodwith"].."\n"..L["mining"] -- Texto de combinação

	local CombinationText = Goodwith -- Tecto das combinações
	if TitanGetVar(ID, "HideCombination") then
		CombinationText = ""
	end

	local ColorValueAccount -- Conta de ganho de perícia
	if not BLAM then
		ColorValueAccount = ""
	elseif BLAM == 800 then
		ColorValueAccount = "\n"..L["maxskill"]
	elseif not startskill  or (BLAM - startskill) == 0 then
		ColorValueAccount = "\n"..L["session"].."\t"..TitanUtils_GetHighlightText("0")
	elseif (BLAM - startskill) > 0 then
		ColorValueAccount = "\n"..L["session"].."\t".."|cFF69FF69"..(BLAM - startskill).."|r"
	elseif (BLAM - startskill) < 0 then -- Segurança quando existe mudança de exp.
		ColorValueAccount = ""
	end

	local warning -- Aviso de que não está mais aprendendo
	if BLAMmax == 800 then
		warning = ""
	elseif BLAM == BLAMmax and level < 50 and BLAM ~= 175 then
		warning = L["warning"]
	elseif BLAM == 175 and level > 49 then -- Não deixa abvisar no BfA se estiver com 175
		warning = ""
	else
		warning = ""
	end

	local ValueText = "" -- Difere com e sem profissão
	if BLAM == 0 then
		ValueText = L["noskill"]..Goodwith
	else
		ValueText = L["hint"].."\n \n"..L["info"]..bonusText..totalTooltip..maxSkill..ColorValueAccount..CombinationText..warning
	end

	return ValueText
end
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|c22fdce08 "..L["blacksmithing"].."|r".." Multi",
	tooltip = L["blacksmithing"],
	icon
	if expansionLevel > 9 then
		icon = "Interface\\Icons\\ui_profession_blacksmithing"
	else
		icon = "Interface\\Icons\\trade_blacksmithing"
	end
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
