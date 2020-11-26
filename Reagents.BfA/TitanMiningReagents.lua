--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows Mining Reagents.
Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "TITAN_RESMINIM_BFA"
local moneliteOre = 0
local startMonelite = 0

local stormSilver = 0
local startStormSilver = 0

local platinumOre = 0
local startPlatinum = 0

local osmeniteOre = 0
local startOsmenite = 0
-----------------------------------------------
local function getMoneliteOre()
	return GetItemCount(152512, true) or 0
end
-----------------------------------------------
local function getStormSilver()
	return GetItemCount(152579, true) or 0
end
-----------------------------------------------
local function getPlatinumOre()
	return GetItemCount(152513, true) or 0
end
-----------------------------------------------
local function getOsmeniteOre()
	return GetItemCount(168185, true) or 0
end
-----------------------------------------------
local function GetButtonText(self, id)
	local moneliteText
	if not moneliteOre then
		moneliteText = "  |TInterface\\Icons\\inv_ore_monalite:0|t "..TitanUtils_GetHighlightText("0")
	else
		moneliteText = "  |TInterface\\Icons\\inv_ore_monalite:0|t "..TitanUtils_GetHighlightText(moneliteOre)
	end

	local stormSilverText
	if not stormSilver then
		stormSilverText = "  |TInterface\\Icons\\inv_ore_stormsilver:0|t "..TitanUtils_GetHighlightText("0")
	else
		stormSilverText = "  |TInterface\\Icons\\inv_ore_stormsilver:0|t "..TitanUtils_GetHighlightText(stormSilver)
	end

	local platinumText
	if not platinumOre then
		platinumText = "  |TInterface\\Icons\\inv_ore_platinum:0|t "..TitanUtils_GetHighlightText("0")
	else
		platinumText = "  |TInterface\\Icons\\inv_ore_platinum:0|t "..TitanUtils_GetHighlightText(platinumOre)
	end

	local osmeniteText
	if not osmeniteOre then
		osmeniteText = "  |TInterface\\Icons\\inv_ore_osmenite:0|t "..TitanUtils_GetHighlightText("0")
	else
		osmeniteText = "  |TInterface\\Icons\\inv_ore_osmenite:0|t "..TitanUtils_GetHighlightText(osmeniteOre)
	end

	local barBalanceMonelite = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (moneliteOre - startMonelite) > 0 then
			barBalanceMonelite = " |cFF69FF69["..(moneliteOre - startMonelite).."]"
		elseif (moneliteOre - startMonelite) < 0 then
			barBalanceMonelite = " |cFFFF2e2e["..(moneliteOre - startMonelite).."]"
		end
	end

	local barBalanceStormSilver = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (stormSilver - startStormSilver) > 0 then
			barBalanceStormSilver = " |cFF69FF69["..(stormSilver - startStormSilver).."]"
		elseif (stormSilver - startStormSilver) < 0 then
			barBalanceStormSilver = " |cFFFF2e2e["..(stormSilver - startStormSilver).."]"
		end
	end

	local barBalancePlatinum = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (platinumOre - startPlatinum) > 0 then
			barBalancePlatinum = " |cFF69FF69["..(platinumOre - startPlatinum).."]"
		elseif (platinumOre - startPlatinum) < 0 then
			barBalancePlatinum = " |cFFFF2e2e["..(platinumOre - startPlatinum).."]"
		end
	end

	local barBalanceOsmenite = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (osmeniteOre - startOsmenite) > 0 then
			barBalanceOsmenite = " |cFF69FF69["..(osmeniteOre - startOsmenite).."]"
		elseif (osmeniteOre - startOsmenite) < 0 then
			barBalanceOsmenite = " |cFFFF2e2e["..(osmeniteOre - startOsmenite).."]"
		end
	end

	local moneliteBar = moneliteText..barBalanceMonelite.." "
	if TitanGetVar(id, "HideMonelite") then
		moneliteBar = ""
	end

	local stormSilverBar = stormSilverText..barBalanceStormSilver.." "
	if TitanGetVar(id, "HideStormSilver") then
		stormSilverBar = ""
	end

	local platinumBar = platinumText..barBalancePlatinum.." "
	if TitanGetVar(id, "HidePlatinum") then
		platinumBar = ""
	end

	local osmeniteBar = osmeniteText..barBalanceOsmenite.." "
	if TitanGetVar(id, "HideOsmenite") then
		osmeniteBar = ""
	end

	return moneliteBar..stormSilverBar..platinumBar..osmeniteBar
end
-----------------------------------------------
local function GetTooltipText(self, id)

	local moneliteBag = " \n|TInterface\\Icons\\inv_ore_monalite:0|t "..L["monelite"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152512))
	local moneliteBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152512, true) - GetItemCount(152512))

	local stormSilverBag = "\n \n|TInterface\\Icons\\inv_ore_stormsilver:0|t "..L["stormSilver"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152579))
	local stormSilverBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152579, true) - GetItemCount(152579))

	local platinumBag = "\n \n|TInterface\\Icons\\inv_ore_platinum:0|t "..L["platinumOre"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152513))
	local platinumBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152513, true) - GetItemCount(152513))

	local osmeniteBag = "\n \n|TInterface\\Icons\\inv_ore_osmenite:0|t "..L["osmeniteOre"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(168185))
	local osmeniteBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(168185, true) - GetItemCount(168185))

	local valueText = "" -- Difere com e sem reagente
	if moneliteOre == 0 and stormSilver == 0 and platinumOre == 0 and osmeniteOre == 0 then
		valueText = "\r"..L["info"].."\r|cFFFF2e2e"..L["noreagent"]
	else
		valueText = moneliteBag..moneliteBank..stormSilverBag..stormSilverBank..platinumBag..platinumBank..osmeniteBag..osmeniteBank
	end

	return valueText
end
-----------------------------------------------
local eventsTable = {
	PLAYER_ENTERING_WORLD = function(self)
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.PLAYER_ENTERING_WORLD = nil

		startMonelite = getMoneliteOre()
		moneliteOre = startMonelite

		startStormSilver = getStormSilver()
		stormSilver = startStormSilver

		startPlatinum = getPlatinumOre()
		platinumOre = startPlatinum

		startOsmenite = getOsmeniteOre()
		osmeniteOre = startOsmenite

		TitanPanelButton_UpdateButton(self.registry.id)

		self.BAG_UPDATE = function(self, bagID)
			local mlite = getMoneliteOre()
			local ssilver = getStormSilver()
			local plat = getPlatinumOre()
			local osmer = getOsmeniteOre()
			if moneliteOre == mlite and stormSilver == ssilver and platinumOre == plat and osmeniteOre == osmer then return end

			moneliteOre = mlite
			stormSilver = ssilver
			platinumOre = plat
			osmeniteOre = osmer
			TitanPanelButton_UpdateButton(self.registry.id)
		end
		self:RegisterEvent("BAG_UPDATE")
	end
}
-----------------------------------------------
local function PrepareMenu(self, id)
	TitanPanelRightClickMenu_AddTitle(TitanPlugins[id].menuText)
	TitanPanelRightClickMenu_AddToggleIcon(id)

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["showbb"];
	info.func = function() TitanToggleVar(id, "ShowBarBalance"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "ShowBarBalance");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	TitanPanelRightClickMenu_AddSpacer()

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["monelite"];
	info.func = function() TitanToggleVar(id, "HideMonelite"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideMonelite");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["stormSilver"];
	info.func = function() TitanToggleVar(id, "HideStormSilver"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideStormSilver");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["platinumOre"];
	info.func = function() TitanToggleVar(id, "HidePlatinum"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HidePlatinum");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["osmeniteOre"];
	info.func = function() TitanToggleVar(id, "HideOsmenite"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideOsmenite");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	TitanPanelRightClickMenu_AddSpacer()
	TitanPanelRightClickMenu_AddCommand(ACE["TITAN_PANEL_MENU_HIDE"], id, TITAN_PANEL_MENU_FUNC_HIDE);
	L_UIDropDownMenu_AddSeparator()

	info = {};
	info.text = CLOSE;
	info.notCheckable = true
	info.keepShownOnClick = false
	L_UIDropDownMenu_AddButton(info);
end
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|cFFec7b39 "..L["mining"].."|r [|cFFEC7A37"..L["rBfA"].."|r] Multi",
	tooltip = L["mining"].."|r [|cFFEC7A37"..L["rBfA"].."|r]",
	icon = "Interface\\Icons\\Trade_mining",
	category = "Profession",
	version = version,
	getButtonText = GetButtonText,
	getTooltipText = GetTooltipText,
	prepareMenu = PrepareMenu,
	savedVariables = {
		ShowIcon = 1,
		DisplayOnRightSide = false,
		ShowBarBalance = false,
		ShowLabelText = false,
		HideMonelite = false,
		HideStormSilver = false,
		HidePlatinum = false,
		HideOsmenite = false,
	},
	eventsTable = eventsTable
})
