--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows Fishing Reagents.
Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "TITAN_RESFISHM_BFA"
local sandShifter = 0
local startSandShifter = 0

local gSeaCatfish = 0
local startGSeaCatfish = 0

local tiragardePerch = 0
local startTiragardePerch = 0

local laneSnapper = 0
local startLaneSnapper = 0

local frenziedFangtooth = 0
local startFrenziedFangtooth = 0

local redtailLoach = 0
local startRedtailLoach = 0

local slimyMackerel = 0
local startSlimyMackerel = 0

local midnightSalmon = 0
local startMidnightSalmon = 0
-----------------------------------------------
local function getSandShifter()
	return GetItemCount(152543, true) or 0
end
-----------------------------------------------
local function getGSeaCatfish()
	return GetItemCount(152547, true) or 0
end
-----------------------------------------------
local function getTiragardePerch()
	return GetItemCount(152548, true) or 0
end
-----------------------------------------------
local function getLaneSnapper()
	return GetItemCount(152546, true) or 0
end
-----------------------------------------------
local function getFrenziedFangtooth()
	return GetItemCount(152545, true) or 0
end
-----------------------------------------------
local function getRedtailLoach()
	return GetItemCount(152549, true) or 0
end
-----------------------------------------------
local function getSlimyMackerel()
	return GetItemCount(152544, true) or 0
end
-----------------------------------------------
local function getMidnightSalmon()
	return GetItemCount(162515, true) or 0
end
-----------------------------------------------
local function GetButtonText(self, id)
	local sandShifterText
	if not sandShifter then
		sandShifterText = "  |TInterface\\Icons\\inv_fishing_sandshifter:0|t "..TitanUtils_GetHighlightText("0")
	else
		sandShifterText = "  |TInterface\\Icons\\inv_fishing_sandshifter:0|t "..TitanUtils_GetHighlightText(sandShifter)
	end

	local gSeaCatfishText
	if not gSeaCatfish then
		gSeaCatfishText = "  |TInterface\\Icons\\inv_fishing_greatseacatfish:0|t "..TitanUtils_GetHighlightText("0")
	else
		gSeaCatfishText = "  |TInterface\\Icons\\inv_fishing_greatseacatfish:0|t "..TitanUtils_GetHighlightText(gSeaCatfish)
	end

	local tiragardePerchText
	if not tiragardePerch then
		tiragardePerchText = "  |TInterface\\Icons\\inv_fishing_tiragardeperch:0|t "..TitanUtils_GetHighlightText("0")
	else
		tiragardePerchText = "  |TInterface\\Icons\\inv_fishing_tiragardeperch:0|t "..TitanUtils_GetHighlightText(tiragardePerch)
	end

	local laneSnapperText
	if not laneSnapper then
		laneSnapperText = "  |TInterface\\Icons\\inv_fishing_lanesnapper:0|t "..TitanUtils_GetHighlightText("0")
	else
		laneSnapperText = "  |TInterface\\Icons\\inv_fishing_lanesnapper:0|t "..TitanUtils_GetHighlightText(laneSnapper)
	end

	local frenziedFangtoothText
	if not frenziedFangtooth then
		frenziedFangtoothText = "  |TInterface\\Icons\\inv_fishing_frenziedfangtooth:0|t "..TitanUtils_GetHighlightText("0")
	else
		frenziedFangtoothText = "  |TInterface\\Icons\\inv_fishing_frenziedfangtooth:0|t "..TitanUtils_GetHighlightText(frenziedFangtooth)
	end

	local redtailLoachText
	if not redtailLoach then
		redtailLoachText = "  |TInterface\\Icons\\inv_fishing_redtailloach:0|t "..TitanUtils_GetHighlightText("0")
	else
		redtailLoachText = "  |TInterface\\Icons\\inv_fishing_redtailloach:0|t "..TitanUtils_GetHighlightText(redtailLoach)
	end

	local slimyMackerelText
	if not slimyMackerel then
		slimyMackerelText = "  |TInterface\\Icons\\inv_fishing_slimymackerel:0|t "..TitanUtils_GetHighlightText("0")
	else
		slimyMackerelText = "  |TInterface\\Icons\\inv_fishing_slimymackerel:0|t "..TitanUtils_GetHighlightText(slimyMackerel)
	end

	local midnightSalmonText
	if not midnightSalmon then
		midnightSalmonText = "  |TInterface\\Icons\\inv_misc_fish_51:0|t "..TitanUtils_GetHighlightText("0")
	else
		midnightSalmonText = "  |TInterface\\Icons\\inv_misc_fish_51:0|t "..TitanUtils_GetHighlightText(midnightSalmon)
	end

	local barBalanceSandShifter = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (sandShifter - startSandShifter) > 0 then
			barBalanceSandShifter = " |cFF69FF69["..(sandShifter - startSandShifter).."]"
		elseif (sandShifter - startSandShifter) < 0 then
			barBalanceSandShifter = " |cFFFF2e2e["..(sandShifter - startSandShifter).."]"
		end
	end

	local barBalanceGSea = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (gSeaCatfish - startGSeaCatfish) > 0 then
			barBalanceGSea = " |cFF69FF69["..(gSeaCatfish - startGSeaCatfish).."]"
		elseif (gSeaCatfish - startGSeaCatfish) < 0 then
			barBalanceGSea = " |cFFFF2e2e["..(gSeaCatfish - startGSeaCatfish).."]"
		end
	end

	local barBalanceTPerch = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (tiragardePerch - startTiragardePerch) > 0 then
			barBalanceTPerch = " |cFF69FF69["..(tiragardePerch - startTiragardePerch).."]"
		elseif (tiragardePerch - startTiragardePerch) < 0 then
			barBalanceTPerch = " |cFFFF2e2e["..(tiragardePerch - startTiragardePerch).."]"
		end
	end

	local barBalanceLaneS = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (laneSnapper - startLaneSnapper) > 0 then
			barBalanceLaneS = " |cFF69FF69["..(laneSnapper - startLaneSnapper).."]"
		elseif (laneSnapper - startLaneSnapper) < 0 then
			barBalanceLaneS = " |cFFFF2e2e["..(laneSnapper - startLaneSnapper).."]"
		end
	end

	local barBalanceFFtooth = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (frenziedFangtooth - startFrenziedFangtooth) > 0 then
			barBalanceFFtooth = " |cFF69FF69["..(frenziedFangtooth - startFrenziedFangtooth).."]"
		elseif (frenziedFangtooth - startFrenziedFangtooth) < 0 then
			barBalanceFFtooth = " |cFFFF2e2e["..(frenziedFangtooth - startFrenziedFangtooth).."]"
		end
	end

	local barBalanceRedtailL = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (redtailLoach - startRedtailLoach) > 0 then
			barBalanceRedtailL = " |cFF69FF69["..(redtailLoach - startRedtailLoach).."]"
		elseif (redtailLoach - startRedtailLoach) < 0 then
			barBalanceRedtailL = " |cFFFF2e2e["..(redtailLoach - startRedtailLoach).."]"
		end
	end

	local barBalanceSlimyM = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (slimyMackerel - startSlimyMackerel) > 0 then
			barBalanceSlimyM = " |cFF69FF69["..(slimyMackerel - startSlimyMackerel).."]"
		elseif (slimyMackerel - startSlimyMackerel) < 0 then
			barBalanceSlimyM = " |cFFFF2e2e["..(slimyMackerel - startSlimyMackerel).."]"
		end
	end

	local barBalanceMSalmon = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (midnightSalmon - startMidnightSalmon) > 0 then
			barBalanceMSalmon = " |cFF69FF69["..(midnightSalmon - startMidnightSalmon).."]"
		elseif (midnightSalmon - startMidnightSalmon) < 0 then
			barBalanceMSalmon = " |cFFFF2e2e["..(midnightSalmon - startMidnightSalmon).."]"
		end
	end

	local sandShifterBar = sandShifterText..barBalanceSandShifter.." "
	if TitanGetVar(id, "HideSShifter") then
		sandShifterBar = ""
	end

	local gSeaCatfishBar = gSeaCatfishText..barBalanceGSea.." "
	if TitanGetVar(id, "HideGSea") then
		gSeaCatfishBar = ""
	end

	local tPerchBar = tiragardePerchText..barBalanceTPerch.." "
	if TitanGetVar(id, "HideTPerch") then
		tPerchBar = ""
	end

	local laneSBar = laneSnapperText..barBalanceLaneS.." "
	if TitanGetVar(id, "HideLSnapper") then
		laneSBar = ""
	end

	local fFtoothBar = frenziedFangtoothText..barBalanceFFtooth.." "
	if TitanGetVar(id, "HideFFtooth") then
		fFtoothBar = ""
	end

	local redtailLBar = redtailLoachText..barBalanceRedtailL.." "
	if TitanGetVar(id, "HideRedtailL") then
		redtailLBar = ""
	end

	local slimyMackerelBar = slimyMackerelText..barBalanceSlimyM
	if TitanGetVar(id, "HideSlimyM") then
		slimyMackerelBar = ""
	end

	local midnightSalmonBar = midnightSalmonText..barBalanceMSalmon
	if TitanGetVar(id, "HideMSalmon") then
		midnightSalmonBar = ""
	end

	return sandShifterBar..gSeaCatfishBar..tPerchBar..laneSBar..fFtoothBar..redtailLBar..slimyMackerelBar..midnightSalmonBar
end
-----------------------------------------------
local function GetTooltipText(self, id)

	local sandShifterBag = " \n|TInterface\\Icons\\inv_fishing_sandshifter:0|t "..L["sshifter"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152543))
	local sandShifterBank = "\r\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152543, true) - GetItemCount(152543))

	local gSeaCatBag = "\n \n|TInterface\\Icons\\inv_fishing_greatseacatfish:0|t "..L["gscatfish"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152547))
	local gSeaCatBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152547, true) - GetItemCount(152547))

	local tPerchBag = "\n \n|TInterface\\Icons\\inv_fishing_tiragardeperch:0|t "..L["tperch"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152548))
	local tPerchBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152548, true) - GetItemCount(152548))

	local laneSBag = "\n \n|TInterface\\Icons\\inv_fishing_lanesnapper:0|t "..L["lsnapper"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152546))
	local laneSBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152546, true) - GetItemCount(152546))

	local fFtoothBag = "\n\n|TInterface\\Icons\\inv_fishing_frenziedfangtooth:0|t "..L["ffangtooth"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152545))
	local fFtoothBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152545, true) - GetItemCount(152545))

	local redtailLBag = "\n \n|TInterface\\Icons\\inv_fishing_redtailloach:0|t "..L["redtaill"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152549))
	local redtailLBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152549, true) - GetItemCount(152549))

	local slimyMBag = "\n \n|TInterface\\Icons\\inv_fishing_slimymackerel:0|t "..L["smackerel"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152544))
	local slimyMBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152544, true) - GetItemCount(152544))

	local midnightSBag = "\n \n|TInterface\\Icons\\inv_misc_fish_51:0|t "..L["msalmon"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(162515))
	local midnightSBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(162515, true) - GetItemCount(162515))

	local valueText = "" -- Difere com e sem reagente
	if sandShifter == 0 and gSeaCatfish == 0 and tiragardePerch == 0 and laneSnapper == 0 and frenziedFangtooth == 0 and redtailLoach == 0 and slimyMackerel == 0 and midnightSalmon == 0 then
		valueText = "\r"..L["info"].."\r|cFFFF2e2e"..L["noreagent"]
	else
		valueText = sandShifterBag..sandShifterBank..gSeaCatBag..gSeaCatBank..tPerchBag..tPerchBank..laneSBag..laneSBank..fFtoothBag..fFtoothBank..redtailLBag..redtailLBank..slimyMBag..slimyMBank..midnightSBag..midnightSBank
	end

	return valueText
end
-----------------------------------------------
local eventsTable = {
	PLAYER_ENTERING_WORLD = function(self)
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.PLAYER_ENTERING_WORLD = nil

		startSandShifter = getSandShifter()
		sandShifter = startSandShifter

		startGSeaCatfish = getGSeaCatfish()
		gSeaCatfish = startGSeaCatfish

		startTiragardePerch = getTiragardePerch()
		tiragardePerch = startTiragardePerch

		startLaneSnapper = getLaneSnapper()
		laneSnapper = startLaneSnapper

		startFrenziedFangtooth = getFrenziedFangtooth()
		frenziedFangtooth = startFrenziedFangtooth

		startRedtailLoach = getRedtailLoach()
		redtailLoach = startRedtailLoach

		startSlimyMackerel = getSlimyMackerel()
		slimyMackerel = startSlimyMackerel

		startMidnightSalmon = getMidnightSalmon()
		midnightSalmon = startMidnightSalmon

		TitanPanelButton_UpdateButton(self.registry.id)

		self.BAG_UPDATE = function(self, bagID)
			local sand = getSandShifter()
			local gSeaC = getGSeaCatfish()
			local tiraP = getTiragardePerch()
			local lanePe = getLaneSnapper()
			local fFT = getFrenziedFangtooth()
			local redTL = getRedtailLoach()
			local sliM = getSlimyMackerel()
			local mnight = getMidnightSalmon()
			if sandShifter == sand and gSeaCatfish == gSeaC and tiragardePerch == tiraP and laneSnapper == lanePe and frenziedFangtooth == fFT and redtailLoach == redTL and slimyMackerel == sliM and midnightSalmon == mnight then return end

			sandShifter = sand
			gSeaCatfish = gSeaC
			tiragardePerch = tiraP
			laneSnapper = lanePe
			frenziedFangtooth = fFT
			redtailLoach = redTL
			slimyMackerel = sliM
			midnightSalmon = mnight
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
	info.text = L["hide"].." "..L["sshifter"];
	info.func = function() TitanToggleVar(id, "HideSShifter"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideSShifter");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["gscatfish"];
	info.func = function() TitanToggleVar(id, "HideGSea"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideGSea");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["tperch"];
	info.func = function() TitanToggleVar(id, "HideTPerch"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideTPerch");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["lsnapper"];
	info.func = function() TitanToggleVar(id, "HideLSnapper"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideLSnapper");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["ffangtooth"];
	info.func = function() TitanToggleVar(id, "HideFFtooth"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideFFtooth");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["redtaill"];
	info.func = function() TitanToggleVar(id, "HideRedtailL"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideRedtailL");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["smackerel"];
	info.func = function() TitanToggleVar(id, "HideSlimyM"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideSlimyM");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["msalmon"];
	info.func = function() TitanToggleVar(id, "HideMSalmon"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideMSalmon");
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
	name = "Titan|cFFec7b39 "..L["fishing"].."|r [|cFFEC7A37"..L["rBfA"].."|r] Multi",
	tooltip = L["fishing"].."|r [|cFFEC7A37"..L["rBfA"].."|r]",
	icon = "Interface\\Icons\\Trade_fishing",
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
		HideSShifter = false,
		HideGSea = false,
		HideTPerch = false,
		HideLSnapper = false,
		HideFFtooth = false,
		HideRedtailL = false,
		HideSlimyM = false,
		HideMSalmon = false,
	},
	eventsTable = eventsTable
})
