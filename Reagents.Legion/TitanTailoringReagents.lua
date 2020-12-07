--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows Tailoring Reagents.
Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "TITAN_RESTAILM"
local shaldorei = 0
local startShaldorei = 0

local silkweave = 0
local startSilkweave = 0

local bloodSargeras = 0
local startBlood = 0
-----------------------------------------------
local function getShaldorei()
	return GetItemCount(124437, true) or 0
end
-----------------------------------------------
local function getSilkweave()
	return GetItemCount(127004, true) or 0
end
-----------------------------------------------
local function getBlood()
	return GetItemCount(124124, true) or 0
end
-----------------------------------------------
local function GetButtonText(self, id)
	local shaldoreiText
	if not shaldorei then
		shaldoreiText = "  |TInterface\\Icons\\inv_tailoring_70_silkweave:0|t "..TitanUtils_GetHighlightText("0")
	else
		shaldoreiText = "  |TInterface\\Icons\\inv_tailoring_70_silkweave:0|t "..TitanUtils_GetHighlightText(shaldorei)
	end

	local silkweaveText
	if not silkweave then
		silkweaveText = "  |TInterface\\Icons\\inv_tailoring_70_silkweaveimbued:0|t "..TitanUtils_GetHighlightText("0")
	else
		silkweaveText = "  |TInterface\\Icons\\inv_tailoring_70_silkweaveimbued:0|t "..TitanUtils_GetHighlightText(silkweave)
	end

	local bloodText
	if not bloodSargeras then
		bloodText = "  |T1417744:0|t "..TitanUtils_GetHighlightText("0")
	else
		bloodText = "  |T1417744:0|t "..TitanUtils_GetHighlightText(bloodSargeras)
	end

	local barBalanceShaldorei = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (shaldorei - startShaldorei) > 0 then
			barBalanceShaldorei = " |cFF69FF69["..(shaldorei - startShaldorei).."]"
		elseif (shaldorei - startShaldorei) < 0 then
			barBalanceShaldorei = " |cFFFF2e2e["..(shaldorei - startShaldorei).."]"
		end
	end

	local barBalanceSilkweave = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (silkweave - startSilkweave) > 0 then
			barBalanceSilkweave = " |cFF69FF69["..(silkweave - startSilkweave).."]"
		elseif (silkweave - startSilkweave) < 0 then
			barBalanceSilkweave = " |cFFFF2e2e["..(silkweave - startSilkweave).."]"
		end
	end

	local barBalanceBlood = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (bloodSargeras - startBlood) > 0 then
			barBalanceBlood = " |cFF69FF69["..(bloodSargeras - startBlood).."]"
		elseif (bloodSargeras - startBlood) < 0 then
			barBalanceBlood = " |cFFFF2e2e["..(bloodSargeras - startBlood).."]"
		end
	end

	local shaldoreiBar = shaldoreiText..barBalanceShaldorei.." "
	if TitanGetVar(id, "HideShaldorei") then
		shaldoreiBar = ""
	end

	local silkweaveBar = silkweaveText..barBalanceSilkweave.." "
	if TitanGetVar(id, "HideSilkweave") then
		silkweaveBar = ""
	end

	local bloodBar = bloodText..barBalanceBlood
	if TitanGetVar(id, "HideBlood") then
		bloodBar = ""
	end

	return shaldoreiBar..silkweaveBar..bloodBar
end
-----------------------------------------------
local function GetTooltipText(self, id)

	local shaldoreiBag = " \n|TInterface\\Icons\\inv_tailoring_70_silkweave:0|t "..L["shaldorei"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124437))
	local shaldoreiBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124437, true) - GetItemCount(124437))

	local silkweaveBag = "\n \n|TInterface\\Icons\\inv_tailoring_70_silkweaveimbued:0|t "..L["silkweave"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(127004))
	local silkweaveBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(127004, true) - GetItemCount(127004))

	local bloodBag = "\n \n|T1417744:0|t "..L["blood"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124124))
	local bloodBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124124, true) - GetItemCount(124124))

	local valueText = "" -- Difere com e sem reagente
	if shaldorei == 0 and silkweave == 0 and bloodSargeras == 0 then
		valueText = "\r"..L["info"].."\r|cFFFF2e2e"..L["noreagent"]
	else
		valueText = shaldoreiBag..shaldoreiBank..silkweaveBag..silkweaveBank..bloodBag..bloodBank
	end

	return valueText
end
-----------------------------------------------
local eventsTable = {
	PLAYER_ENTERING_WORLD = function(self)
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.PLAYER_ENTERING_WORLD = nil

		startShaldorei = getShaldorei()
		shaldorei = startShaldorei

		startSilkweave = getSilkweave()
		silkweave = startSilkweave

		startBlood = getBlood()
		bloodSargeras = startBlood

		TitanPanelButton_UpdateButton(self.registry.id)

		self.BAG_UPDATE = function(self, bagID)
			local shald = getShaldorei()
			local silkw = getSilkweave()
			local blood = getBlood()
			if shaldorei == shald and silkweave == silkw and bloodSargeras == blood then return end

			shaldorei = shald
			silkweave = silkw
			bloodSargeras = blood
			TitanPanelButton_UpdateButton(self.registry.id)
		end
		self:RegisterEvent("BAG_UPDATE")
	end
}
-----------------------------------------------
function PrepareMenu(eddm, self, id)
	eddm.UIDropDownMenu_AddButton({
		text = TitanPlugins[id].menuText,
		hasArrow = false,
		isTitle = true,
		isUninteractable = true,
		notCheckable = true
	})

	eddm.UIDropDownMenu_AddButton({
		text = ACE["TITAN_PANEL_MENU_SHOW_ICON"],
		func = function() TitanPanelRightClickMenu_ToggleVar({ id, "ShowIcon", nil }) end,
		checked = TitanGetVar(id, "ShowIcon"),
		keepShownOnClick = 1
	})

	local info = {};
	info.text = L["showbb"];
	info.func = function() TitanToggleVar(id, "ShowBarBalance"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "ShowBarBalance");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	eddm.UIDropDownMenu_AddSeparator();

	local info = {};
	info.text = L["hide"].." "..L["shaldorei"];
	info.func = function() TitanToggleVar(id, "HideShaldorei"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideShaldorei");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = L["hide"].." "..L["silkweave"];
	info.func = function() TitanToggleVar(id, "HideSilkweave"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideSilkweave");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = L["hide"].." "..L["blood"];
	info.func = function() TitanToggleVar(id, "HideBlood"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideBlood");
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
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|cFFec7b3a "..L["tailoring"].."|r [|cFFEC7A37"..L["rLegion"].."|r] Multi",
	tooltip = L["tailoring"].."|r [|cFFEC7A37"..L["rLegion"].."|r]",
	icon = "Interface\\Icons\\Trade_tailoring",
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
		HideShaldorei = false,
		HideSilkweave = false,
		HideBlood = false,
	},
	eventsTable = eventsTable
})
