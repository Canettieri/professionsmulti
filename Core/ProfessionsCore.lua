--[[
	Description: This plugin is part of the "Titan Panel [Professions] Multi" addon.
	Site: http://www.curse.com/addons/wow/titan-panel-professions-multi
	Author: Canettieri
	Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)

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

function L.PrepareProfessionsMenu(self, id)
	TitanPanelRightClickMenu_AddTitle(TitanPlugins[id].menuText)

	info = {};
	info.text = L["buttonText"];
	info.notClickable = true
	info.notCheckable = true
	info.isTitle = true
	L_UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["simpleb"];
	info.func = ToggleSimpleBonus;
	info.arg1 = id
	info.checked = TitanGetVar(id, "SimpleBonus");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	TitanPanelRightClickMenu_AddToggleIcon(id)
	TitanPanelRightClickMenu_AddToggleLabelText(id)

	info = {};
	info.text = L["hidemax"];
	info.func = ToggleHideMax;
	info.arg1 = id
	info.checked = TitanGetVar(id, "HideMax");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["showbb"];
	info.func = ToggleShowBarBalance;
	info.arg1 = id
	info.checked = TitanGetVar(id, "ShowBarBalance");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	info = {};
	info.text = ACE["TITAN_CLOCK_MENU_DISPLAY_ON_RIGHT_SIDE"];
	info.func = ToggleRightSideDisplay;
	info.arg1 = id
	info.checked = TitanGetVar(id, "DisplayOnRightSide");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["tooltip"];
	info.notClickable = true
	info.notCheckable = true
	info.isTitle = true
	L_UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["hideCombination"];
	info.func = ToggleHideCombination;
	info.arg1 = id
	info.checked = TitanGetVar(id, "HideCombination");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	TitanPanelRightClickMenu_AddSpacer();
	TitanPanelRightClickMenu_AddCommand(ACE["TITAN_PANEL_MENU_HIDE"], id, TITAN_PANEL_MENU_FUNC_HIDE);
	L_UIDropDownMenu_AddSeparator()

	info = {};
	info.text = CLOSE;
	info.notCheckable = true
	info.keepShownOnClick = false
	L_UIDropDownMenu_AddButton(info);
end
----------------------------------------------
