--[[
	Description: This plugin is part of the "Titan Panel [Professions] Multi" addon.
	Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
	Author: Canettieri
	Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
L.Elib = LibStub("Elib-4.0").Register

local function ToggleRightSideDisplay(self, id) -- Right side display
	TitanToggleVar(id, "DisplayOnRightSide");
	TitanPanel_InitPanelButtons();
end

local function ToggleHideMax(self, id) -- Hide Max display
	TitanToggleVar(id, "HideMax");
	TitanPanelButton_UpdateButton(id)
end

local function ToggleHideCombination(self, id) -- Hide Profession Combination
	TitanToggleVar(id, "HideCombination");
	TitanPanelButton_UpdateButton(id)
end

local function ToggleShowBarBalance(self, id) -- Show Balance in Titan Bar
	TitanToggleVar(id, "ShowBarBalance");
	TitanPanelButton_UpdateButton(id)
end

local function ToggleSimpleBonus(self, id) -- Simples bonus display
	TitanToggleVar(id, "SimpleBonus");
	TitanPanelButton_UpdateButton(id)
end
----------------------------------------------
function L.PrepareProfessionsMenu(eddm, self, id)
	eddm.UIDropDownMenu_AddButton({
		text = TitanPlugins[id].menuText,
		hasArrow = false,
		isTitle = true,
		isUninteractable = true,
		notCheckable = true
	})

	local info = {};
	info.text = L["buttonText"];
	info.notClickable = true
	info.notCheckable = true
	info.isTitle = true
	eddm.UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["simpleb"];
	info.func = ToggleSimpleBonus;
	info.arg1 = id
	info.checked = TitanGetVar(id, "SimpleBonus");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["hidemax"];
	info.func = ToggleHideMax;
	info.arg1 = id
	info.checked = TitanGetVar(id, "HideMax");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["showbb"];
	info.func = ToggleShowBarBalance;
	info.arg1 = id
	info.checked = TitanGetVar(id, "ShowBarBalance");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	info = {};
	info.text = ACE["TITAN_CLOCK_MENU_DISPLAY_ON_RIGHT_SIDE"];
	info.func = ToggleRightSideDisplay;
	info.arg1 = id
	info.checked = TitanGetVar(id, "DisplayOnRightSide");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["tooltip"];
	info.notClickable = true
	info.notCheckable = true
	info.isTitle = true
	eddm.UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["hideCombination"];
	info.func = ToggleHideCombination;
	info.arg1 = id
	info.checked = TitanGetVar(id, "HideCombination");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	eddm.UIDropDownMenu_AddSpace();

	eddm.UIDropDownMenu_AddButton({
		notCheckable = true,
		text = ACE["TITAN_PANEL_MENU_HIDE"],
		func = function() TitanPanelRightClickMenu_Hide(id) end
	})

	eddm.UIDropDownMenu_AddSeparator();

	info = {};
	info.text = CLOSE;
	info.notCheckable = true
	info.keepShownOnClick = false
	eddm.UIDropDownMenu_AddButton(info);
end
