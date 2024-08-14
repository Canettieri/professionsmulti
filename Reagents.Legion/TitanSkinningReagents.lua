--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows Skinning Reagents.
Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "TITAN_RESSKINM"
local stormscale = 0
local startStormscale = 0

local stonehideLeather = 0
local startStonehide = 0

local felhide = 0
local startFelhide = 0

local unbrokenTooth = 0
local startTooth = 0

local unbrokenClaw = 0
local startClaw = 0

local bloodSargeras = 0
local startBlood = 0
-----------------------------------------------
local function getStormscale()
	return GetItemCount(124115, true) or 0
end
-----------------------------------------------
local function getStonehide()
	return GetItemCount(124113, true) or 0
end
-----------------------------------------------
local function getFelhide()
	return GetItemCount(124116, true) or 0
end
-----------------------------------------------
local function getTooth()
	return GetItemCount(124439, true) or 0
end
-----------------------------------------------
local function getClaw()
	return GetItemCount(124438, true) or 0
end
-----------------------------------------------
local function getBlood()
	return GetItemCount(124124, true) or 0
end
-----------------------------------------------
local function GetButtonText(self, id)
	local stormscaleText
	if not stormscale then
		stormscaleText = "  |TInterface\\Icons\\inv_misc_leatherstormscale:0|t "..TitanUtils_GetHighlightText("0")
	else
		stormscaleText = "  |TInterface\\Icons\\inv_misc_leatherstormscale:0|t "..TitanUtils_GetHighlightText(stormscale)
	end

	local stonehideText
	if not stonehideLeather then
		stonehideText = "  |TInterface\\Icons\\inv_misc_leatherstonehide:0|t "..TitanUtils_GetHighlightText("0")
	else
		stonehideText = "  |TInterface\\Icons\\inv_misc_leatherstonehide:0|t "..TitanUtils_GetHighlightText(stonehideLeather)
	end

	local felhideText
	if not felhide then
		felhideText = "  |TInterface\\Icons\\inv_misc_leatherfelhide:0|t "..TitanUtils_GetHighlightText("0")
	else
		felhideText = "  |TInterface\\Icons\\inv_misc_leatherfelhide:0|t "..TitanUtils_GetHighlightText(felhide)
	end

	local toothText
	if not unbrokenTooth then
		toothText = "  |TInterface\\Icons\\inv_misc_bone_08:0|t "..TitanUtils_GetHighlightText("0")
	else
		toothText = "  |TInterface\\Icons\\inv_misc_bone_08:0|t "..TitanUtils_GetHighlightText(unbrokenTooth)
	end

	local clawText
	if not unbrokenClaw then
		clawText = "  |TInterface\\Icons\\inv_misc_wailingbone:0|t "..TitanUtils_GetHighlightText("0")
	else
		clawText = "  |TInterface\\Icons\\inv_misc_wailingbone:0|t "..TitanUtils_GetHighlightText(unbrokenClaw)
	end

	local bloodText
	if not bloodSargeras then
		bloodText = "  |T1417744:0|t "..TitanUtils_GetHighlightText("0")
	else
		bloodText = "  |T1417744:0|t "..TitanUtils_GetHighlightText(bloodSargeras)
	end

	local barBalanceStormscale = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (stormscale - startStormscale) > 0 then
			barBalanceStormscale = " |cFF69FF69["..(stormscale - startStormscale).."]"
		elseif (stormscale - startStormscale) < 0 then
			barBalanceStormscale = " |cFFFF2e2e["..(stormscale - startStormscale).."]"
		end
	end

	local barBalanceStonehide = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (stonehideLeather - startStonehide) > 0 then
			barBalanceStonehide = " |cFF69FF69["..(stonehideLeather - startStonehide).."]"
		elseif (stonehideLeather - startStonehide) < 0 then
			barBalanceStonehide = " |cFFFF2e2e["..(stonehideLeather - startStonehide).."]"
		end
	end

	local barBalanceFelhide = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (felhide - startFelhide) > 0 then
			barBalanceFelhide = " |cFF69FF69["..(felhide - startFelhide).."]"
		elseif (felhide - startFelhide) < 0 then
			barBalanceFelhide = " |cFFFF2e2e["..(felhide - startFelhide).."]"
		end
	end

	local barBalanceTooth = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (unbrokenTooth - startTooth) > 0 then
			barBalanceTooth = " |cFF69FF69["..(unbrokenTooth - startTooth).."]"
		elseif (unbrokenTooth - startTooth) < 0 then
			barBalanceTooth = " |cFFFF2e2e["..(unbrokenTooth - startTooth).."]"
		end
	end

	local barBalanceClaw = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (unbrokenClaw - startClaw) > 0 then
			barBalanceClaw = " |cFF69FF69["..(unbrokenClaw - startClaw).."]"
		elseif (unbrokenClaw - startClaw) < 0 then
			barBalanceClaw = " |cFFFF2e2e["..(unbrokenClaw - startClaw).."]"
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

	local stormscaleBar = stormscaleText..barBalanceStormscale.." "
	if TitanGetVar(id, "HideStormscale") then
		stormscaleBar = ""
	end

	local stonehideBar = stonehideText..barBalanceStonehide.." "
	if TitanGetVar(id, "HideStonehide") then
		stonehideBar = ""
	end

	local felhideBar = felhideText..barBalanceFelhide.." "
	if TitanGetVar(id, "HideFelhide") then
		felhideBar = ""
	end

	local toothBar = toothText..barBalanceTooth.." "
	if TitanGetVar(id, "HideTooth") then
		toothBar = ""
	end

	local clawBar = clawText..barBalanceClaw
	if TitanGetVar(id, "HideClaw") then
		clawBar = ""
	end

	local bloodBar = bloodText..barBalanceBlood
	if TitanGetVar(id, "HideBlood") then
		bloodBar = ""
	end

	return stormscaleBar..stonehideBar..felhideBar..toothBar..clawBar..bloodBar
end
-----------------------------------------------
local function GetTooltipText(self, id)

	local stormscaleBag = " \n|TInterface\\Icons\\inv_misc_leatherstormscale:0|t "..L["stormscale"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124115))
	local stormscaleBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124115, true) - GetItemCount(124115))

	local stonehideBag = "\n \n|TInterface\\Icons\\inv_misc_leatherstonehide:0|t "..L["stonehide"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124113))
	local stonehideBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124113, true) - GetItemCount(124113))

	local felhideBag = "\n \n|TInterface\\Icons\\inv_misc_leatherfelhide:0|t "..L["felhide"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124116))
	local felhideBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124116, true) - GetItemCount(124116))

	local toothBag = "\n \n|TInterface\\Icons\\inv_misc_bone_08:0|t "..L["tooth"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124439))
	local toothBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124439, true) - GetItemCount(124439))

	local clawBag = "\n \n|TInterface\\Icons\\inv_misc_wailingbone:0|t "..L["claw"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124438))
	local clawBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124438, true) - GetItemCount(124438))

	local bloodBag = "\n \n|T1417744:0|t "..L["blood"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124124))
	local bloodBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124124, true) - GetItemCount(124124))

	local valueText = "" -- Difere com e sem reagente
	if stormscale == 0 and stonehideLeather == 0 and felhide == 0 and unbrokenTooth == 0 and unbrokenClaw == 0 and bloodSargeras == 0 then
		valueText = "\r"..L["info"].."\r|cFFFF2e2e"..L["noreagent"]
	else
		valueText = stormscaleBag..stormscaleBank..stonehideBag..stonehideBank..felhideBag..felhideBank..toothBag..toothBank..clawBag..clawBank..bloodBag..bloodBank
	end

	return valueText
end
-----------------------------------------------
local eventsTable = {
	PLAYER_ENTERING_WORLD = function(self)
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.PLAYER_ENTERING_WORLD = nil

		startStormscale = getStormscale()
		stormscale = startStormscale

		startStonehide = getStonehide()
		stonehideLeather = startStonehide

		startFelhide = getFelhide()
		felhide = startFelhide

		startTooth = getTooth()
		unbrokenTooth = startTooth

		startClaw = getClaw()
		unbrokenClaw = startClaw

		startBlood = getBlood()
		bloodSargeras = startBlood

		TitanPanelButton_UpdateButton(self.registry.id)

		self.BAG_UPDATE = function(self, bagID)
			local storm = getStormscale()
			local stone = getStonehide()
			local fel = getFelhide()
			local tth = getTooth()
			local clw = getClaw()
			local blood = getBlood()
			if stormscale == storm and stonehideLeather == stone and felhide == fel and unbrokenTooth == tth and unbrokenClaw == clw and bloodSargeras == blood then return end

			stormscale = storm
			stonehideLeather = stone
			felhide = fel
			unbrokenTooth = tth
			unbrokenClaw = clw
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
	info.text = L["hide"].." "..L["stormscale"];
	info.func = function() TitanToggleVar(id, "HideStormscale"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideStormscale");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = L["hide"].." "..L["stonehide"];
	info.func = function() TitanToggleVar(id, "HideStonehide"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideStonehide");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = L["hide"].." "..L["felhide"];
	info.func = function() TitanToggleVar(id, "HideFelhide"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideFelhide");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = L["hide"].." "..L["tooth"];
	info.func = function() TitanToggleVar(id, "HideTooth"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideTooth");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = L["hide"].." "..L["claw"];
	info.func = function() TitanToggleVar(id, "HideClaw"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideClaw");
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
	name = "Titan|cFFec7b3a "..L["skinning"].."|r [|cFFEC7A37"..L["rLegion"].."|r] Multi",
	tooltip = L["skinning"].."|r [|cFFEC7A37"..L["rLegion"].."|r]",
	icon = "Interface\\Icons\\Inv_misc_pelt_wolf_01",
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
		HideStormscale = false,
		HideStonehide = false,
		HideFelhide = false,
		HideTooth = false,
		HideClaw = false,
		HideBlood = false,
	},
	eventsTable = eventsTable
})
