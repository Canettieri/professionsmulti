--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows your Herbalism skill level.
Site: http://www.curse.com/addons/wow/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "HERM"
local HERM, prevHERM = 0.0, -2
local HERMmax = 0
local HERMIncrease = 0
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
		if name == L["herbalism"] then
			HERM = skillLevel
			HERMmax = maxSkillLevel
			HERMIncrease = IncreaseSkillLevel
			profOffset = offset
			if not startskill then startskill = skillLevel end
		elseif prof2 ~= nil then
			local name, _, skillLevel, maxSkillLevel, _, offset, _, IncreaseSkillLevel = GetProfessionInfo(prof2)
			if name == L["herbalism"] then
				HERM = skillLevel
				HERMmax = maxSkillLevel
				HERMIncrease = IncreaseSkillLevel
				profOffset = offset
				if not startskill then startskill = skillLevel end
			end
		end
	end

	if HERM == prevHERM and HERMmax == preHERMmax and prevHERMIncrease == HERMIncrease then
		return
	end

	preHERMmax = HERMmax
	prevHERM = HERM
	prevHERMIncrease = HERMIncrease

	TitanPanelButton_UpdateButton(id)
	return true
end
-----------------------------------------------
local function GetButtonText(self, id)
	local HERMtext
	local bonusText = ""
	if HERMIncrease and HERMIncrease > 0 then -- Bônus da profissão
		bonusText = "|r|cFFFFFFFF".." + |r|cFF69FF69"..HERMIncrease.."|r|cFFFFFFFF "..L["bonus"].." =|r|cFF69FF69 "..(HERM+HERMIncrease)
	end
	local HideText = "" -- Texto HideMax
	if not TitanGetVar(ID, "HideMax") then
		HideText = "|r/|cFFFF2e2e"..HERMmax
	end
	local SimpleText = bonusText -- Texto de bônus simples
	if TitanGetVar(ID, "SimpleBonus") and HERMIncrease > 0 then
		SimpleText = "|r|cFFFFFFFF".." (+|r|cFF69FF69"..HERMIncrease.."|r|cFFFFFFFF)"
	end

	local BarBalanceText = ""
	if HERMmax ~= 0 and (HERM - startskill) > 0 and TitanGetVar(ID, "ShowBarBalance") then
		BarBalanceText = " |cFF69FF69["..(HERM - startskill).."]"
	end

	if HERM == 800 then
		HERMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif level > 49 and HERM == 175 then
		HERMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif HERMmax == 0 then
		HERMtext = "|cFFFF2e2e"..L["noprof"]
	elseif HERM == HERMmax and level < 50 then
		HERMtext = "|cFFFFFFFF"..HERM.."|cFFFF2e2e! ["..L["maximum"].."]"..SimpleText..BarBalanceText
	else
		HERMtext = "|cFFFFFFFF"..HERM..HideText..SimpleText..BarBalanceText
	end

	return L["herbalism"]..": ", HERMtext
end
-----------------------------------------------
local function GetTooltipText(self, id)
	local totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFFFFFFFF"..HERM -- Valor atual da prof.
	if HERMIncrease > 0 then
		totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFF69FF69"..HERM+HERMIncrease
	end
	local bonusText = "" -- Texto bónus só aparece se você tiver bônus para mostrar!
	if HERMIncrease > 0 then
		bonusText = "\n"..L["bonustext"].."\t|cFF69FF69"..HERMIncrease
	end
	local maxSkill = "\n"..L["maxtext"].."\t"..TitanUtils_GetHighlightText(HERMmax) -- O máximo que você pode ter no nível atual de perícia

	local Goodwith = "\n \n"..L["goodwith"].."\n"..L["alchemy"]..", "..L["inscription"] -- Texto de combinação

	local CombinationText = Goodwith -- Tecto das combinações
	if TitanGetVar(ID, "HideCombination") then
		CombinationText = ""
	end

	local ColorValueAccount -- Conta de ganho de perícia
	if not HERM then
		ColorValueAccount = ""
	elseif HERM == 800 then
		ColorValueAccount = "\n"..L["maxskill"]
	elseif not startskill  or (HERM - startskill) == 0 then
		ColorValueAccount = "\n"..L["session"].."\t"..TitanUtils_GetHighlightText("0")
	elseif (HERM - startskill) > 0 then
		ColorValueAccount = "\n"..L["session"].."\t".."|cFF69FF69"..(HERM - startskill).."|r"
	end

	local warning -- Aviso de que não está mais aprendendo
	if HERMmax == 800 then
		warning = ""
	elseif HERM == HERMmax and level < 50 and HERM ~= 175 then
		warning = L["warning"]
	elseif HERM == 175 and level > 49 then -- Não deixa abvisar no BfA se estiver com 175
		warning = ""
	else
		warning = ""
	end

	local ValueText = "" -- Difere com e sem profissão
	if HERM == 0 then
		ValueText = L["noskill"]..Goodwith
	else
		ValueText = L["hint"].."\n \n"..L["info"]..bonusText..totalTooltip..maxSkill..ColorValueAccount..CombinationText..warning
	end

	return ValueText
end
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|c00a7f200 "..L["herbalism"].."|r".." Multi",
	tooltip = L["herbalism"],
	icon = "Interface\\Icons\\Trade_herbalism.blp",
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
