--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows Tailoring Reagents.
Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "TITAN_RESTAILM_BFA"
local tidesprayLinen = 0
local startTidesprayLinen = 0

local nylonT = 0
local startNylon = 0

local deepSS = 0
local startSeaSatin = 0

local embroideredDSS = 0
local startEmbroidered = 0

local reagentFive = 0
local startReagentFive = 0
-----------------------------------------------
local function getTidespray()
	return GetItemCount(152576, true) or 0
end
-----------------------------------------------
local function getNylon()
	return GetItemCount(159959, true) or 0
end
-----------------------------------------------
local function getDeepSea()
	return GetItemCount(152577, true) or 0
end
-----------------------------------------------
local function getEDSS()
	return GetItemCount(158378, true) or 0
end
-----------------------------------------------
local function getReagentFive()
	return GetItemCount(167738, true) or 0 -- Gilded Seaweave
end
-----------------------------------------------
local function GetButtonText(self, id)
	local tLinenText
	if not tidesprayLinen then
		tLinenText = "  |TInterface\\Icons\\inv_tailoring_80_tidespraylinen:0|t "..TitanUtils_GetHighlightText("0")
	else
		tLinenText = "  |TInterface\\Icons\\inv_tailoring_80_tidespraylinen:0|t "..TitanUtils_GetHighlightText(tidesprayLinen)
	end

	local nylonText
	if not nylonT then
		nylonText = "  |TInterface\\Icons\\inv_tailoring_80_nylonthread:0|t "..TitanUtils_GetHighlightText("0")
	else
		nylonText = "  |TInterface\\Icons\\inv_tailoring_80_nylonthread:0|t "..TitanUtils_GetHighlightText(nylonT)
	end

	local deepSeaText
	if not deepSS then
		deepSeaText = "  |TInterface\\Icons\\inv_tailoring_80_deepseasatin:0|t "..TitanUtils_GetHighlightText("0")
	else
		deepSeaText = "  |TInterface\\Icons\\inv_tailoring_80_deepseasatin:0|t "..TitanUtils_GetHighlightText(deepSS)
	end

	local edssText
	if not embroideredDSS then
		edssText = "  |TInterface\\Icons\\inv_tailoring_80_embroidereddeepseasatin:0|t "..TitanUtils_GetHighlightText("0")
	else
		edssText = "  |TInterface\\Icons\\inv_tailoring_80_embroidereddeepseasatin:0|t "..TitanUtils_GetHighlightText(embroideredDSS)
	end

	local barBalanceTidespray = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (tidesprayLinen - startTidesprayLinen) > 0 then
			barBalanceTidespray = " |cFF69FF69["..(tidesprayLinen - startTidesprayLinen).."]"
		elseif (tidesprayLinen - startTidesprayLinen) < 0 then
			barBalanceTidespray = " |cFFFF2e2e["..(tidesprayLinen - startTidesprayLinen).."]"
		end
	end

	local barBalanceNylon = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (nylonT - startNylon) > 0 then
			barBalanceNylon = " |cFF69FF69["..(nylonT - startNylon).."]"
		elseif (nylonT - startNylon) < 0 then
			barBalanceNylon = " |cFFFF2e2e["..(nylonT - startNylon).."]"
		end
	end

	local barBalanceSS = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (deepSS - startSeaSatin) > 0 then
			barBalanceSS = " |cFF69FF69["..(deepSS - startSeaSatin).."]"
		elseif (deepSS - startSeaSatin) < 0 then
			barBalanceSS = " |cFFFF2e2e["..(deepSS - startSeaSatin).."]"
		end
	end

	local barBalanceEDSS = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (embroideredDSS - startEmbroidered) > 0 then
			barBalanceEDSS = " |cFF69FF69["..(embroideredDSS - startEmbroidered).."]"
		elseif (embroideredDSS - startEmbroidered) < 0 then
			barBalanceEDSS = " |cFFFF2e2e["..(embroideredDSS - startEmbroidered).."]"
		end
	end

	local tLinenBar = tLinenText..barBalanceTidespray.." "
	if TitanGetVar(id, "HideTidespray") then
		tLinenBar = ""
	end

	local nylonBar = nylonText..barBalanceNylon.." "
	if TitanGetVar(id, "HideNylon") then
		nylonBar = ""
	end

	local sSBar = deepSeaText..barBalanceSS.." "
	if TitanGetVar(id, "HideSeaSatin") then
		sSBar = ""
	end

	local eDSSBar = edssText..barBalanceEDSS
	if TitanGetVar(id, "HideEmbroidered") then
		eDSSBar = ""
	end
	-- Reagente 5
	local reagentFiveText
	if not reagentFive then
		reagentFiveText = "  |TInterface\\Icons\\inv_fabric_seaweave:0|t "..TitanUtils_GetHighlightText("0")
	else
		reagentFiveText = "  |TInterface\\Icons\\inv_fabric_seaweave:0|t "..TitanUtils_GetHighlightText(reagentFive)
	end

	local barBalanceReagentFive = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (reagentFive - startReagentFive) > 0 then
			barBalanceReagentFive = " |cFF69FF69["..(reagentFive - startReagentFive).."]"
		elseif (reagentFive - startReagentFive) < 0 then
			barBalanceReagentFive = " |cFFFF2e2e["..(reagentFive - startReagentFive).."]"
		end
	end

	local reagentFiveBar = reagentFiveText..barBalanceReagentFive.." "
	if TitanGetVar(id, "HideTailFiveBfA") then
		reagentFiveBar = ""
	end
	-- Fim Reagente 5

	return tLinenBar..nylonBar..sSBar..eDSSBar..reagentFiveBar
end
-----------------------------------------------
local function GetTooltipText(self, id)

	local tidesprayLinenBag = " \n|TInterface\\Icons\\inv_tailoring_80_tidespraylinen:0|t "..L["tidespray"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152576))
	local tidesprayLinenBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152576, true) - GetItemCount(152576))

	local nylonBag = "\n \n|TInterface\\Icons\\inv_tailoring_80_nylonthread:0|t "..L["nylonthread"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(159959))
	local nylonBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(159959, true) - GetItemCount(159959))

	local ssBag = "\n \n|TInterface\\Icons\\inv_tailoring_80_deepseasatin:0|t "..L["deepseasatin"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152577))
	local ssBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152577, true) - GetItemCount(152577))

	local edssBag = "\n \n|TInterface\\Icons\\inv_tailoring_80_embroidereddeepseasatin:0|t "..L["embroideredsatin"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(158378))
	local edssBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(158378, true) - GetItemCount(158378))

	local reagentFiveBag = "\n \n|TInterface\\Icons\\inv_fabric_seaweave:0|t "..L["gseaweave"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(167738))
	local reagentFiveBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(167738, true) - GetItemCount(167738))

	local valueText = "" -- Difere com e sem reagente
	if tidesprayLinen == 0 and deepSS == 0 and deepSS == 0 and embroideredDSS == 0 and reagentFive == 0 then
		valueText = "\r"..L["info"].."\r|cFFFF2e2e"..L["noreagent"]
	else
		valueText = tidesprayLinenBag..tidesprayLinenBank..nylonBag..nylonBank..ssBag..ssBank..edssBag..edssBank..reagentFiveBag..reagentFiveBank
	end

	return valueText
end
-----------------------------------------------
local eventsTable = {
	PLAYER_ENTERING_WORLD = function(self)
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.PLAYER_ENTERING_WORLD = nil

		startTidesprayLinen = getTidespray()
		tidesprayLinen = startTidesprayLinen

		startNylon = getNylon()
		nylonT = startNylon

		startSeaSatin = getDeepSea()
		deepSS = startSeaSatin

		startEmbroidered = getEDSS()
		embroideredDSS = startEmbroidered

		startReagentFive = getReagentFive()
		reagentFive = startReagentFive

		TitanPanelButton_UpdateButton(self.registry.id)

		self.BAG_UPDATE = function(self, bagID)
			local tides = getTidespray()
			local nyl = getNylon()
			local deep = getDeepSea()
			local embro = getEDSS()
			local rgFive = getReagentFive()
			if tidesprayLinen == tides and nylonT == nyl and deepSS == deep and embroideredDSS == embro and reagentFive == rgFive then return end

			tidesprayLinen = tides
			nylonT = nyl
			deepSS = deep
			embroideredDSS = embro
			reagentFive = rgFive
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
	info.text = L["hide"].." "..L["tidespray"];
	info.func = function() TitanToggleVar(id, "HideTidespray"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideTidespray");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["nylonthread"];
	info.func = function() TitanToggleVar(id, "HideNylon"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideNylon");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["deepseasatin"];
	info.func = function() TitanToggleVar(id, "HideSeaSatin"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideSeaSatin");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["embroideredsatin"];
	info.func = function() TitanToggleVar(id, "HideEmbroidered"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideEmbroidered");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["gseaweave"];
	info.func = function() TitanToggleVar(id, "HideTailFiveBfA"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideTailFiveBfA");
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
	name = "Titan|cFFec7b39 "..L["tailoring"].."|r [|cFFEC7A37"..L["rBfA"].."|r] Multi",
	tooltip = L["tailoring"].."|r [|cFFEC7A37"..L["rBfA"].."|r]",
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
		HideTidespray = false,
		HideNylon = false,
		HideSeaSatin = false,
		HideEmbroidered = false,
		HideTailFiveBfA = false,
	},
	eventsTable = eventsTable
})
