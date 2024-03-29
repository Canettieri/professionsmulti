--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows your Jewelcrafting skill level.
Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local LibAddonCompat = LibStub("LibAddonCompat-1.0")
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "JEWM"
local JEWM, prevJEWM = 0.0, -2
local JEWMmax = 0
local JEWMIncrease = 0
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
	local prof1, prof2 = LibAddonCompat:GetProfessions();

	local skillLevel = 0
	local maxSkillLevel = 0
	profOffset = nil

	if prof1 ~= nil then
		local name, _, skillLevel, maxSkillLevel, _, offset, skillLine, IncreaseSkillLevel = LibAddonCompat:GetProfessionInfo(prof1)
		if skillLine == 755 then
			JEWM = skillLevel
			JEWMmax = maxSkillLevel
			JEWMIncrease = IncreaseSkillLevel
			profOffset = offset
			if not startskill then startskill = skillLevel end
		elseif prof2 ~= nil then
			local name, _, skillLevel, maxSkillLevel, _, offset, skillLine, IncreaseSkillLevel = LibAddonCompat:GetProfessionInfo(prof2)
			if skillLine == 755 then
				JEWM = skillLevel
				JEWMmax = maxSkillLevel
				JEWMIncrease = IncreaseSkillLevel
				profOffset = offset
				if not startskill then startskill = skillLevel end
			end
		end
	end

	if JEWM == prevJEWM and JEWMmax == preJEWMmax and prevJEWMIncrease == JEWMIncrease then
		return
	end

	preJEWMmax = JEWMmax
	prevJEWM = JEWM
	prevJEWMIncrease = JEWMIncrease

	TitanPanelButton_UpdateButton(id)
	return true
end
-----------------------------------------------
local function GetButtonText(self, id)
	local JEWMtext
	local bonusText = ""
	if JEWMIncrease and JEWMIncrease > 0 then -- Bônus da profissão
		bonusText = "|r|cFFFFFFFF".." + |r|cFF69FF69"..JEWMIncrease.."|r|cFFFFFFFF "..L["bonus"].." =|r|cFF69FF69 "..(JEWM+JEWMIncrease)
	end
	local HideText = "" -- Texto HideMax
	if not TitanGetVar(ID, "HideMax") then
		HideText = "|r/|cFFFF2e2e"..JEWMmax
	end
	local SimpleText = bonusText -- Texto de bônus simples
	if TitanGetVar(ID, "SimpleBonus") and JEWMIncrease > 0 then
		SimpleText = "|r|cFFFFFFFF".." (+|r|cFF69FF69"..JEWMIncrease.."|r|cFFFFFFFF)"
	end

	local BarBalanceText = ""
	if JEWMmax ~= 0 and (JEWM - startskill) > 0 and TitanGetVar(ID, "ShowBarBalance") then
		BarBalanceText = " |cFF69FF69["..(JEWM - startskill).."]"
	end

	if JEWM == 450 then
		JEWMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif JEWMmax == 0 then
		JEWMtext = "|cFFFF2e2e"..L["noprof"]
	elseif JEWM == JEWMmax then
		JEWMtext = "|cFFFFFFFF"..JEWM.."|cFFFF2e2e! ["..L["maximum"].."]"..SimpleText..BarBalanceText
	else
		JEWMtext = "|cFFFFFFFF"..JEWM..HideText..SimpleText..BarBalanceText
	end

	return L["jewelcrafting"]..": ", JEWMtext
end
-----------------------------------------------
local function GetTooltipText(self, id)
	local BonusTooltip = "\n"..L["craftsmanship"].."|r|cFFFFFFFF"..JEWM.." + |r|cFF69FF69"..JEWMIncrease.."|r|cFFFFFFFF "..L["bonus"].." =|r|cFF69FF69 "..(JEWM+JEWMIncrease) -- Bônus da profissão

	local Goodwith = "\n \n"..L["goodwith"].."\n"..L["mining"] -- Texto de combinação

	local maxtext = "\n"..L["maxtext"]..TitanUtils_GetHighlightText(JEWMmax)

	local ColorValueAccount -- Conta de ganho de perícia
	if not JEWM then
		ColorValueAccount = ""
	elseif JEWM == 450 then
		ColorValueAccount = "\n"..L["maxskill"]
	elseif not startskill  or (JEWM - startskill) == 0 then
		ColorValueAccount = "\n"..L["session"]..TitanUtils_GetHighlightText("0")
	elseif (JEWM - startskill) > 0 then
		ColorValueAccount = "\n"..L["session"].."|cFF69FF69"..(JEWM - startskill).."|r"
	end

	local warning -- Aviso de que não está mais aprendendo
	if JEWMmax == 450 then
		warning = ""
	elseif JEWM == JEWMmax then
		warning = L["warning"]
	else
		warning = ""
	end

	local ValueText = "" -- Difere com e sem profissão
	if JEWM == 0 then
		ValueText = L["noskill"]..Goodwith
	else
		ValueText = L["hint"].."\n \n"..L["info"]..BonusTooltip..maxtext..ColorValueAccount..Goodwith..warning
	end

	return ValueText
end
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|c22fdce08 "..L["jewelcrafting"].."|r".." Multi",
	tooltip = L["jewelcrafting"],
	icon = "Interface\\Icons\\Inv_misc_gem_02.blp",
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
	}
})
