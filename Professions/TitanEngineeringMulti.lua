--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows your Engineering skill level.
Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "ENGM"
local ENGM, prevENGM = 0.0, -2
local ENGMmax = 0
local ENGMIncrease = 0
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
		if skillLine == 202 then
			ENGM = skillLevel
			ENGMmax = maxSkillLevel
			ENGMIncrease = IncreaseSkillLevel
			profOffset = offset
			if not startskill then startskill = skillLevel end
		elseif prof2 ~= nil then
			local name, _, skillLevel, maxSkillLevel, _, offset, skillLine, IncreaseSkillLevel = GetProfessionInfo(prof2)
			if skillLine == 202 then
				ENGM = skillLevel
				ENGMmax = maxSkillLevel
				ENGMIncrease = IncreaseSkillLevel
				profOffset = offset
				if not startskill then startskill = skillLevel end
			end
		end
	end

	if ENGM == prevENGM and ENGMmax == preENGMmax and prevENGMIncrease == ENGMIncrease then
		return
	end

	preENGMmax = ENGMmax
	prevENGM = ENGM
	prevENGMIncrease = ENGMIncrease

	TitanPanelButton_UpdateButton(id)
	return true
end
-----------------------------------------------
local function GetMaxProfessionCap()
	if LE_EXPANSION_LEVEL_CURRENT == LE_EXPANSION_MISTS_OF_PANDARIA then
		return 600
	elseif LE_EXPANSION_LEVEL_CURRENT == LE_EXPANSION_WARLORDS_OF_DRAENOR then
		return 700
	elseif LE_EXPANSION_LEVEL_CURRENT == LE_EXPANSION_LEGION then
		return 800
	elseif LE_EXPANSION_LEVEL_CURRENT == LE_EXPANSION_BATTLE_FOR_AZEROTH then
		return 150
	elseif LE_EXPANSION_LEVEL_CURRENT == LE_EXPANSION_SHADOWLANDS then
		return 100
	elseif LE_EXPANSION_LEVEL_CURRENT == LE_EXPANSION_DRAGONFLIGHT then
		return 100
	elseif LE_EXPANSION_LEVEL_CURRENT == LE_EXPANSION_THE_WAR_WITHIN then
		return 100
	else
		return 600  -- fallback to Mists of Pandaria
	end
end
-----------------------------------------------
local function GetButtonText(self, id)
	local ENGMtext
	local bonusText = ""
	if ENGMIncrease and ENGMIncrease > 0 then -- Bônus da profissão
		bonusText = "|r|cFFFFFFFF".." + |r|cFF69FF69"..ENGMIncrease.."|r|cFFFFFFFF "..L["bonus"].." =|r|cFF69FF69 "..(ENGM+ENGMIncrease)
	end
	local HideText = "" -- Texto HideMax
	if not TitanGetVar(ID, "HideMax") then
		HideText = "|r/|cFFFF2e2e"..ENGMmax
	end
	local SimpleText = bonusText -- Texto de bônus simples
	if TitanGetVar(ID, "SimpleBonus") and ENGMIncrease > 0 then
		SimpleText = "|r|cFFFFFFFF".." (+|r|cFF69FF69"..ENGMIncrease.."|r|cFFFFFFFF)"
	end

	local BarBalanceText = ""
	if ENGMmax ~= 0 and (ENGM - startskill) > 0 and TitanGetVar(ID, "ShowBarBalance") then
		BarBalanceText = " |cFF69FF69["..(ENGM - startskill).."]"
	end

	if ENGMmax == 0 then
		ENGMtext = "|cFFFF2e2e" .. L["noprof"]
	elseif ENGM == ENGMmax then
		local maxCap = GetMaxProfessionCap()
		if ENGMmax == maxCap then
			ENGMtext = "|cFF69FF69" .. L["maximum"] .. "!" .. SimpleText
		else
			ENGMtext = "|cFFFFFFFF" .. ENGM .. "|cFF69FF69! [" .. L["maximum"] .. "]" .. SimpleText .. BarBalanceText
		end
	else
		ENGMtext = "|cFFFFFFFF" .. ENGM .. HideText .. SimpleText .. BarBalanceText
	end

	return L["engineering"]..": ", ENGMtext
end
-----------------------------------------------
local function GetTooltipText(self, id)
	local totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFFFFFFFF"..ENGM -- Valor atual da prof.
	if ENGMIncrease > 0 then
		totalTooltip = "\n"..L["craftsmanship"].."|r\t|cFF69FF69"..ENGM+ENGMIncrease
	end
	local bonusText = "" -- Texto bónus só aparece se você tiver bônus para mostrar!
	if ENGMIncrease > 0 then
		bonusText = "\n"..L["bonustext"].."\t|cFF69FF69"..ENGMIncrease
	end
	local maxSkill = "\n"..L["maxtext"].."\t"..TitanUtils_GetHighlightText(ENGMmax) -- O máximo que você pode ter no nível atual de perícia

	local Goodwith = "\n \n"..L["goodwith"].."\n"..L["mining"] -- Texto de combinação

	local CombinationText = Goodwith -- Tecto das combinações
	if TitanGetVar(ID, "HideCombination") then
		CombinationText = ""
	end

	local ColorValueAccount -- Conta de ganho de perícia
	if not ENGM then
		ColorValueAccount = ""
	elseif ENGM == GetMaxProfessionCap() then
		ColorValueAccount = "\n"..L["maxskill"]
	elseif not startskill  or (ENGM - startskill) == 0 then
		ColorValueAccount = "\n"..L["session"].."\t"..TitanUtils_GetHighlightText("0")
	elseif (ENGM - startskill) > 0 then
		ColorValueAccount = "\n"..L["session"].."\t".."|cFF69FF69"..(ENGM - startskill).."|r"
	elseif (ENGM - startskill) < 0 then -- Segurança quando existe mudança de exp.
		ColorValueAccount = ""
	end

	--[[
    local warning -- Aviso de que não está mais aprendendo
    if ENGMmax == 800 then
        warning = ""
    elseif ENGM == ENGMmax and level < 50 and ENGM ~= 175 then
        warning = L["warning"]
    elseif ENGM == 175 and level > 49 then -- Não deixa abvisar no BfA se estiver com 175
        warning = ""
    else
        warning = ""
    end
    ]]--

	local ValueText = "" -- Difere com e sem profissão
	if ENGM == 0 then
		ValueText = L["noskill"]..Goodwith
	else
		ValueText = L["hint"].."\n \n"..L["info"]..bonusText..totalTooltip..maxSkill..ColorValueAccount..CombinationText..warning
	end

	return ValueText
end
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|c22fdce08 "..L["engineering"].."|r".." Multi",
	tooltip = L["engineering"],
	icon = "Interface\\Icons\\Trade_engineering.blp",
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
