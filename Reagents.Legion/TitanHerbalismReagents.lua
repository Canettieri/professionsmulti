--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows Herbalism Reagents.
Site: http://www.curse.com/addons/wow/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "TITAN_RESHERBM"
local yserallineSeed = 0
local startYseralline = 0

local felwort = 0
local startFelwort = 0

local starlightRose = 0
local startStarlight = 0

local fjarnskaggl = 0
local startFjarnskaggl = 0

local foxflower = 0
local startFox = 0

local dreamleaf = 0
local startDreamleaf = 0

local aethril = 0
local startAethril = 0

local bloodSargeras = 0
local startBlood = 0
-----------------------------------------------
local function getYseralline()
	return GetItemCount(128304, true) or 0
end
-----------------------------------------------
local function getFelwort()
	return GetItemCount(124106, true) or 0
end
-----------------------------------------------
local function getStarlight()
	return GetItemCount(124105, true) or 0
end
-----------------------------------------------
local function getFjarnskaggl()
	return GetItemCount(124104, true) or 0
end
-----------------------------------------------
local function getFoxFlower()
	return GetItemCount(124103, true) or 0
end
-----------------------------------------------
local function getDreamleaf()
	return GetItemCount(124102, true) or 0
end
-----------------------------------------------
local function getAethril()
	return GetItemCount(124101, true) or 0
end
-----------------------------------------------
local function getBlood()
	return GetItemCount(124124, true) or 0
end
-----------------------------------------------
local function GetButtonText(self, id)
	local yserallineText
	if not yserallineSeed then
		yserallineText = "  |TInterface\\Icons\\inv_herbalism_70_yserallineseed:0|t "..TitanUtils_GetHighlightText("0")
	else
		yserallineText = "  |TInterface\\Icons\\inv_herbalism_70_yserallineseed:0|t "..TitanUtils_GetHighlightText(yserallineSeed)
	end

	local felwortText
	if not felwort then
		felwortText = "  |TInterface\\Icons\\inv_herbalism_70_felwort:0|t "..TitanUtils_GetHighlightText("0")
	else
		felwortText = "  |TInterface\\Icons\\inv_herbalism_70_felwort:0|t "..TitanUtils_GetHighlightText(felwort)
	end

	local starlightText
	if not starlightRose then
		starlightText = "  |TInterface\\Icons\\inv_herbalism_70_starlightrosepetals:0|t "..TitanUtils_GetHighlightText("0")
	else
		starlightText = "  |TInterface\\Icons\\inv_herbalism_70_starlightrosepetals:0|t "..TitanUtils_GetHighlightText(starlightRose)
	end

	local fjarnskagglText
	if not fjarnskaggl then
		fjarnskagglText = "  |TInterface\\Icons\\inv_herbalism_70_fjarnskaggl:0|t "..TitanUtils_GetHighlightText("0")
	else
		fjarnskagglText = "  |TInterface\\Icons\\inv_herbalism_70_fjarnskaggl:0|t "..TitanUtils_GetHighlightText(fjarnskaggl)
	end

	local foxFlowerText
	if not foxflower then
		foxFlowerText = "  |TInterface\\Icons\\inv_herbalism_70_foxflower:0|t "..TitanUtils_GetHighlightText("0")
	else
		foxFlowerText = "  |TInterface\\Icons\\inv_herbalism_70_foxflower:0|t "..TitanUtils_GetHighlightText(foxflower)
	end

	local dreamleafText
	if not dreamleaf then
		dreamleafText = "  |TInterface\\Icons\\inv_herbalism_70_dreamleaf:0|t "..TitanUtils_GetHighlightText("0")
	else
		dreamleafText = "  |TInterface\\Icons\\inv_herbalism_70_dreamleaf:0|t "..TitanUtils_GetHighlightText(dreamleaf)
	end

	local aethrilText
	if not aethril then
		aethrilText = "  |TInterface\\Icons\\inv_herbalism_70_aethril:0|t "..TitanUtils_GetHighlightText("0")
	else
		aethrilText = "  |TInterface\\Icons\\inv_herbalism_70_aethril:0|t "..TitanUtils_GetHighlightText(aethril)
	end

	local bloodText
	if not bloodSargeras then
		bloodText = "  |T1417744:0|t "..TitanUtils_GetHighlightText("0")
	else
		bloodText = "  |T1417744:0|t "..TitanUtils_GetHighlightText(bloodSargeras)
	end

	local barBalanceYseralline = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (yserallineSeed - startYseralline) > 0 then
			barBalanceYseralline = " |cFF69FF69["..(yserallineSeed - startYseralline).."]"
		elseif (yserallineSeed - startYseralline) < 0 then
			barBalanceYseralline = " |cFFFF2e2e["..(yserallineSeed - startYseralline).."]"
		end
	end

	local barBalanceFelwort = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (felwort - startFelwort) > 0 then
			barBalanceFelwort = " |cFF69FF69["..(felwort - startFelwort).."]"
		elseif (felwort - startFelwort) < 0 then
			barBalanceFelwort = " |cFFFF2e2e["..(felwort - startFelwort).."]"
		end
	end

	local barBalanceStarlight = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (starlightRose - startStarlight) > 0 then
			barBalanceStarlight = " |cFF69FF69["..(starlightRose - startStarlight).."]"
		elseif (starlightRose - startStarlight) < 0 then
			barBalanceStarlight = " |cFFFF2e2e["..(starlightRose - startStarlight).."]"
		end
	end

	local barBalanceFjarnskaggl = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (fjarnskaggl - startFjarnskaggl) > 0 then
			barBalanceFjarnskaggl = " |cFF69FF69["..(fjarnskaggl - startFjarnskaggl).."]"
		elseif (fjarnskaggl - startFjarnskaggl) < 0 then
			barBalanceFjarnskaggl = " |cFFFF2e2e["..(fjarnskaggl - startFjarnskaggl).."]"
		end
	end

	local barBalanceStartFox = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (foxflower - startFox) > 0 then
			barBalanceStartFox = " |cFF69FF69["..(foxflower - startFox).."]"
		elseif (foxflower - startFox) < 0 then
			barBalanceStartFox = " |cFFFF2e2e["..(foxflower - startFox).."]"
		end
	end

	local barBalanceDreamleaf = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (dreamleaf - startDreamleaf) > 0 then
			barBalanceDreamleaf = " |cFF69FF69["..(dreamleaf - startDreamleaf).."]"
		elseif (dreamleaf - startDreamleaf) < 0 then
			barBalanceDreamleaf = " |cFFFF2e2e["..(dreamleaf - startDreamleaf).."]"
		end
	end

	local barBalanceAethril = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (aethril - startAethril) > 0 then
			barBalanceAethril = " |cFF69FF69["..(aethril - startAethril).."]"
		elseif (aethril - startAethril) < 0 then
			barBalanceAethril = " |cFFFF2e2e["..(aethril - startAethril).."]"
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

	local yserallineBar = yserallineText..barBalanceYseralline.." "
	if TitanGetVar(id, "HideYseralline") then
		yserallineBar = ""
	end

	local felwortBar = felwortText..barBalanceFelwort.." "
	if TitanGetVar(id, "HideFelwort") then
		felwortBar = ""
	end

	local starlightBar = starlightText..barBalanceStarlight.." "
	if TitanGetVar(id, "HideStarlight") then
		starlightBar = ""
	end

	local fjarnskagglBar = fjarnskagglText..barBalanceFjarnskaggl.." "
	if TitanGetVar(id, "HideFjarnskaggl") then
		fjarnskagglBar = ""
	end

	local foxBar = foxFlowerText..barBalanceStartFox.." "
	if TitanGetVar(id, "HideFox") then
		foxBar = ""
	end

	local dreamleafBar = dreamleafText..barBalanceDreamleaf.." "
	if TitanGetVar(id, "HideDreamleaf") then
		dreamleafBar = ""
	end

	local aethrilBar = aethrilText..barBalanceAethril
	if TitanGetVar(id, "HideAethril") then
		aethrilBar = ""
	end

	local bloodBar = bloodText..barBalanceBlood
	if TitanGetVar(id, "HideBlood") then
		bloodBar = ""
	end

	return yserallineBar..felwortBar..starlightBar..fjarnskagglBar..foxBar..dreamleafBar..aethrilBar..bloodBar
end
-----------------------------------------------
local function GetTooltipText(self, id)

	local yserallineBag = " \n|TInterface\\Icons\\inv_herbalism_70_yserallineseed:0|t "..L["yseralline"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(128304))
	local yserallineBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(128304, true) - GetItemCount(128304))

	local felwortBag = "\n \n|TInterface\\Icons\\inv_herbalism_70_felwort:0|t "..L["felwort"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124106))
	local felwortBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124106, true) - GetItemCount(124106))

	local starlightBag = "\n \n|TInterface\\Icons\\inv_herbalism_70_starlightrosepetals:0|t "..L["starlight"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124105))
	local starlightBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124105, true) - GetItemCount(124105))

	local fjarnskagglBag = "\n \n|TInterface\\Icons\\inv_herbalism_70_fjarnskaggl:0|t "..L["fjarn"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124104))
	local fjarnskagglBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124104, true) - GetItemCount(124104))

	local foxFlowerBag = "\n \n|TInterface\\Icons\\inv_herbalism_70_foxflower:0|t "..L["foxflower"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124103))
	local foxFlowerBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124103, true) - GetItemCount(124103))

	local dreamleafBag = "\n \n|TInterface\\Icons\\inv_herbalism_70_dreamleaf:0|t "..L["dreamleaf"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124102))
	local dreamleafBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124102, true) - GetItemCount(124102))

	local aethrilBag = "\n \n|TInterface\\Icons\\inv_herbalism_70_aethril:0|t "..L["aethril"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124101))
	local aethrilBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124101, true) - GetItemCount(124101))

	local bloodBag = "\n \n|T1417744:0|t "..L["blood"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124124))
	local bloodBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124124, true) - GetItemCount(124124))

	local valueText = "" -- Difere com e sem reagente
	if yserallineSeed == 0 and felwort == 0 and starlightRose == 0 and fjarnskaggl == 0 and foxflower == 0 and dreamleaf == 0 and aethril == 0 and bloodSargeras == 0 then
		valueText = "\r"..L["info"].."\r|cFFFF2e2e"..L["noreagent"]
	else
		valueText = yserallineBag..yserallineBank..felwortBag..felwortBank..starlightBag..starlightBank..fjarnskagglBag..fjarnskagglBank..foxFlowerBag..foxFlowerBank..dreamleafBag..dreamleafBank..aethrilBag..aethrilBank..bloodBag..bloodBank
	end

	return valueText
end
-----------------------------------------------
local eventsTable = {
	PLAYER_ENTERING_WORLD = function(self)
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.PLAYER_ENTERING_WORLD = nil

		startYseralline = getYseralline()
		yserallineSeed = startYseralline

		startFelwort = getFelwort()
		felwort = startFelwort

		startStarlight = getStarlight()
		starlightRose = startStarlight

		startFjarnskaggl = getFjarnskaggl()
		fjarnskaggl = startFjarnskaggl

		startFox = getFoxFlower()
		foxflower = startFox

		startDreamleaf = getDreamleaf()
		dreamleaf = startDreamleaf

		startAethril = getAethril()
		aethril = startAethril

		startBlood = getBlood()
		bloodSargeras = startBlood

		TitanPanelButton_UpdateButton(self.registry.id)

		self.BAG_UPDATE = function(self, bagID)
			local yser = getYseralline()
			local felw = getFelwort()
			local slig = getStarlight()
			local fjar = getFjarnskaggl()
			local fflw = getFoxFlower()
			local drl = getDreamleaf()
			local aeth = getAethril()
			local blood = getBlood()
			if yserallineSeed == yser and felwort == felw and starlightRose == slig and fjarnskaggl == fjar and foxflower == fflw and dreamleaf == drl and aethril == aeth and bloodSargeras == blood then return end

			yserallineSeed = yser
			felwort = felw
			starlightRose = slig
			fjarnskaggl = fjar
			foxflower = fflw
			dreamleaf = drl
			aethril = aeth
			bloodSargeras = blood
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
	info.text = L["hide"].." "..L["yseralline"];
	info.func = function() TitanToggleVar(id, "HideYseralline"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideYseralline");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["felwort"];
	info.func = function() TitanToggleVar(id, "HideFelwort"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideFelwort");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["starlight"];
	info.func = function() TitanToggleVar(id, "HideStarlight"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideStarlight");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["fjarn"];
	info.func = function() TitanToggleVar(id, "HideFjarnskaggl"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideFjarnskaggl");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["foxflower"];
	info.func = function() TitanToggleVar(id, "HideFox"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideFox");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["dreamleaf"];
	info.func = function() TitanToggleVar(id, "HideDreamleaf"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideDreamleaf");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["aethril"];
	info.func = function() TitanToggleVar(id, "HideAethril"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideAethril");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["blood"];
	info.func = function() TitanToggleVar(id, "HideBlood"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideBlood");
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
	name = "Titan|cFFec7b3a "..L["herbalism"].."|r [|cFFEC7A37"..L["rLegion"].."|r] Multi",
	tooltip = L["herbalism"].."|r [|cFFEC7A37"..L["rLegion"].."|r]",
	icon = "Interface\\Icons\\Trade_herbalism",
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
		HideYseralline = false,
		HideFelwort = false,
		HideStarlight = false,
		HideFjarnskaggl = false,
		HideFox = false,
		HideDreamleaf = false,
		HideAethril = false,
		HideBlood = false,
	},
	eventsTable = eventsTable
})
