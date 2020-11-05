--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows Herbalism Reagents.
Site: http://www.curse.com/addons/wow/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "TITAN_RESHERBM_BFA"
local reagentOne = 0
local startReagentOne = 0

local reagentTwo = 0
local startReagentTwo = 0

local reagentThree = 0
local startReagentThree = 0

local reagentFour = 0
local startReagentFour = 0

local reagentFive = 0
local startReagentFive = 0

local reagentSix = 0
local startReagentSix = 0

local reagentSeven = 0
local startReagentSeven = 0

local reagentEight = 0
local startReagentEight = 0
-----------------------------------------------
local function getReagentOne()
	return GetItemCount(168487, true) or 0 -- Zin'anthid
end
-----------------------------------------------
local function getReagentTwo()
	return GetItemCount(152505, true) or 0 -- Riverbud
end
-----------------------------------------------
local function getReagentThree()
	return GetItemCount(152511, true) or 0 -- Sea Stalk
end
-----------------------------------------------
local function getReagentFour()
	return GetItemCount(152506, true) or 0 -- Star Moss
end
-----------------------------------------------
local function getReagentFive()
	return GetItemCount(152507, true) or 0 -- Akunda's Bite
end
-----------------------------------------------
local function getReagentSix()
	return GetItemCount(152508, true) or 0 -- Winter's Kiss
end
-----------------------------------------------
local function getReagentSeven()
	return GetItemCount(152509, true) or 0 -- Siren's Pollen
end
-----------------------------------------------
local function getReagentEight()
	return GetItemCount(152510, true) or 0 -- Anchor Weed
end
-----------------------------------------------
local function GetButtonText(self, id)
	-- Reagente 1
	local reagentOneText
	if not reagentOne then
		reagentOneText = "  |TInterface\\Icons\\inv_misc_herb_zoanthid:0|t "..TitanUtils_GetHighlightText("0")
	else
		reagentOneText = "  |TInterface\\Icons\\inv_misc_herb_zoanthid:0|t "..TitanUtils_GetHighlightText(reagentOne)
	end

	local barBalanceReagentOne = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (reagentOne - startReagentOne) > 0 then
			barBalanceReagentOne = " |cFF69FF69["..(reagentOne - startReagentOne).."]"
		elseif (reagentOne - startReagentOne) < 0 then
			barBalanceReagentOne = " |cFFFF2e2e["..(reagentOne - startReagentOne).."]"
		end
	end

	local reagentOneBar = reagentOneText..barBalanceReagentOne.." "
	if TitanGetVar(id, "HideHerbOneBfA") then
		reagentOneBar = ""
	end
	-- Fim Reagente 1
	-- Reagente 2
	local reagentTwoText
	if not reagentTwo then
		reagentTwoText = "  |TInterface\\Icons\\inv_misc_herb_riverbud:0|t "..TitanUtils_GetHighlightText("0")
	else
		reagentTwoText = "  |TInterface\\Icons\\inv_misc_herb_riverbud:0|t "..TitanUtils_GetHighlightText(reagentTwo)
	end

	local barBalanceReagentTwo = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (reagentTwo - startReagentTwo) > 0 then
			barBalanceReagentTwo = " |cFF69FF69["..(reagentTwo - startReagentTwo).."]"
		elseif (reagentTwo - startReagentTwo) < 0 then
			barBalanceReagentTwo = " |cFFFF2e2e["..(reagentTwo - startReagentTwo).."]"
		end
	end

	local reagentTwoBar = reagentTwoText..barBalanceReagentTwo.." "
	if TitanGetVar(id, "HideHerbTwoBfA") then
		reagentTwoBar = ""
	end
	-- Fim Reagente 2
	-- Reagente 3
	local reagentThreeText
	if not reagentThree then
		reagentThreeText = "  |TInterface\\Icons\\inv_misc_herb_seastalk:0|t "..TitanUtils_GetHighlightText("0")
	else
		reagentThreeText = "  |TInterface\\Icons\\inv_misc_herb_seastalk:0|t "..TitanUtils_GetHighlightText(reagentThree)
	end

	local barBalanceReagentThree = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (reagentThree - startReagentThree) > 0 then
			barBalanceReagentThree = " |cFF69FF69["..(reagentThree - startReagentThree).."]"
		elseif (reagentThree - startReagentThree) < 0 then
			barBalanceReagentThree = " |cFFFF2e2e["..(reagentThree - startReagentThree).."]"
		end
	end

	local reagentThreeBar = reagentThreeText..barBalanceReagentThree.." "
	if TitanGetVar(id, "HideHerbThreeBfA") then
		reagentThreeBar = ""
	end
	-- Fim Reagente 3
	-- Reagente 4
	local reagentFourText
	if not reagentFour then
		reagentFourText = "  |TInterface\\Icons\\inv_misc_herb_starmoss:0|t "..TitanUtils_GetHighlightText("0")
	else
		reagentFourText = "  |TInterface\\Icons\\inv_misc_herb_starmoss:0|t "..TitanUtils_GetHighlightText(reagentFour)
	end

	local barBalanceReagentFour = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (reagentFour - startReagentFour) > 0 then
			barBalanceReagentFour = " |cFF69FF69["..(reagentFour - startReagentFour).."]"
		elseif (reagentFour - startReagentFour) < 0 then
			barBalanceReagentFour = " |cFFFF2e2e["..(reagentFour - startReagentFour).."]"
		end
	end

	local reagentFourBar = reagentFourText..barBalanceReagentFour.." "
	if TitanGetVar(id, "HideHerbFourBfA") then
		reagentFourBar = ""
	end
	-- Fim Reagente 4
	-- Reagente 5
	local reagentFiveText
	if not reagentFive then
		reagentFiveText = "  |TInterface\\Icons\\inv_misc_herb_akundasbite:0|t "..TitanUtils_GetHighlightText("0")
	else
		reagentFiveText = "  |TInterface\\Icons\\inv_misc_herb_akundasbite:0|t "..TitanUtils_GetHighlightText(reagentFive)
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
	if TitanGetVar(id, "HideHerbFiveBfA") then
		reagentFiveBar = ""
	end
	-- Fim Reagente 5
	-- Reagente 6
	local reagentSixText
	if not reagentSix then
		reagentSixText = "  |TInterface\\Icons\\inv_misc_herb_winterskiss:0|t "..TitanUtils_GetHighlightText("0")
	else
		reagentSixText = "  |TInterface\\Icons\\inv_misc_herb_winterskiss:0|t "..TitanUtils_GetHighlightText(reagentSix)
	end

	local barBalanceReagentSix = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (reagentSix - startReagentSix) > 0 then
			barBalanceReagentSix = " |cFF69FF69["..(reagentSix - startReagentSix).."]"
		elseif (reagentSix - startReagentSix) < 0 then
			barBalanceReagentSix = " |cFFFF2e2e["..(reagentSix - startReagentSix).."]"
		end
	end

	local reagentSixBar = reagentSixText..barBalanceReagentSix.." "
	if TitanGetVar(id, "HideHerbSixBfA") then
		reagentSixBar = ""
	end
	-- Fim Reagente 6
	-- Reagente 7
	local reagentSevenText
	if not reagentSeven then
		reagentSevenText = "  |TInterface\\Icons\\inv_misc_herb_pollen:0|t "..TitanUtils_GetHighlightText("0")
	else
		reagentSevenText = "  |TInterface\\Icons\\inv_misc_herb_pollen:0|t "..TitanUtils_GetHighlightText(reagentSeven)
	end

	local barBalanceReagentSeven = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (reagentSeven - startReagentSeven) > 0 then
			barBalanceReagentSeven = " |cFF69FF69["..(reagentSeven - startReagentSeven).."]"
		elseif (reagentSeven - startReagentSeven) < 0 then
			barBalanceReagentSeven = " |cFFFF2e2e["..(reagentSeven - startReagentSeven).."]"
		end
	end

	local reagentSevenBar = reagentSevenText..barBalanceReagentSeven
	if TitanGetVar(id, "HideHerbSevenBfA") then
		reagentSevenBar = ""
	end
	-- Fim Reagente 7
	-- Reagente 8
	local reagentEightText
	if not reagentEight then
		reagentEightText = "  |TInterface\\Icons\\inv_misc_herb_anchorweed:0|t "..TitanUtils_GetHighlightText("0")
	else
		reagentEightText = "  |TInterface\\Icons\\inv_misc_herb_anchorweed:0|t "..TitanUtils_GetHighlightText(reagentEight)
	end

	local barBalanceReagentEight = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (reagentEight - startReagentEight) > 0 then
			barBalanceReagentEight = " |cFF69FF69["..(reagentEight - startReagentEight).."]"
		elseif (reagentEight - startReagentEight) < 0 then
			barBalanceReagentEight = " |cFFFF2e2e["..(reagentEight - startReagentEight).."]"
		end
	end

	local reagentEightBar = reagentEightText..barBalanceReagentEight
	if TitanGetVar(id, "HideHerbEightBfA") then
		reagentEightBar = ""
	end
	-- Fim Reagente 8

	return reagentOneBar..reagentTwoBar..reagentThreeBar..reagentFourBar..reagentFiveBar..reagentSixBar..reagentSevenBar..reagentEightBar
end
-----------------------------------------------
local function GetTooltipText(self, id)

	local reagentOneBag = " \n|TInterface\\Icons\\inv_misc_herb_zoanthid:0|t "..L["zinanthid"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(168487))
	local reagentOneBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(168487, true) - GetItemCount(168487))

	local reagentTwoBag = "\n \n|TInterface\\Icons\\inv_misc_herb_riverbud:0|t "..L["riverbud"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152505))
	local reagentTwoBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152505, true) - GetItemCount(152505))

	local reagentThreeBag = "\n \n|TInterface\\Icons\\inv_misc_herb_seastalk:0|t "..L["seastalk"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152511))
	local reagentThreeBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152511, true) - GetItemCount(152511))

	local reagentFourBag = "\n \n|TInterface\\Icons\\inv_misc_herb_starmoss:0|t "..L["starmoss"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152506))
	local reagentFourBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152506, true) - GetItemCount(152506))

	local reagentFiveBag = "\n \n|TInterface\\Icons\\inv_misc_herb_akundasbite:0|t "..L["akunda"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152507))
	local reagentFiveBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152507, true) - GetItemCount(152507))

	local reagentSixBag = "\n \n|TInterface\\Icons\\inv_misc_herb_winterskiss:0|t "..L["wkiss"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152508))
	local reagentSixBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152508, true) - GetItemCount(152508))

	local reagentSevenBag = "\n \n|TInterface\\Icons\\inv_misc_herb_pollen:0|t "..L["spollen"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152509))
	local reagentSevenBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152509, true) - GetItemCount(152509))

	local reagentEightBag = "\n \n|TInterface\\Icons\\inv_misc_herb_anchorweed:0|t "..L["aweed"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152510))
	local reagentEightBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152510, true) - GetItemCount(152510))

	local valueText = "" -- Difere com e sem reagente
	if reagentOne == 0 and reagentTwo == 0 and reagentThree == 0 and reagentFour == 0 and reagentFive == 0 and reagentSix == 0 and reagentSeven == 0 and reagentEight == 0 then
		valueText = "\r"..L["info"].."\r|cFFFF2e2e"..L["noreagent"]
	else
		valueText = reagentOneBag..reagentOneBank..reagentTwoBag..reagentTwoBank..reagentThreeBag..reagentThreeBank..reagentFourBag..reagentFourBank..reagentFiveBag..reagentFiveBank..reagentSixBag..reagentSixBank..reagentSevenBag..reagentSevenBank..reagentEightBag..reagentEightBank
	end

	return valueText
end
-----------------------------------------------
local eventsTable = {
	PLAYER_ENTERING_WORLD = function(self)
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.PLAYER_ENTERING_WORLD = nil

		startReagentOne = getReagentOne()
		reagentOne = startReagentOne

		startReagentTwo = getReagentTwo()
		reagentTwo = startReagentTwo

		startReagentThree = getReagentThree()
		reagentThree = startReagentThree

		startReagentFour = getReagentFour()
		reagentFour = startReagentFour

		startReagentFive = getReagentFive()
		reagentFive = startReagentFive

		startReagentSix = getReagentSix()
		reagentSix = startReagentSix

		startReagentSeven = getReagentSeven()
		reagentSeven = startReagentSeven

		startReagentEight = getReagentEight()
		reagentEight = startReagentEight

		TitanPanelButton_UpdateButton(self.registry.id)

		self.BAG_UPDATE = function(self, bagID)
			local rgOne = getReagentOne()
			local rgTwo = getReagentTwo()
			local rgThree = getReagentThree()
			local rgFour = getReagentFour()
			local rgFive = getReagentFive()
			local rgSix = getReagentSix()
			local rgSeven = getReagentSeven()
			local rgEight = getReagentEight()
			if reagentOne == rgOne and reagentTwo == rgTwo and reagentThree == rgThree and reagentFour == rgFour and reagentFive == rgFive and reagentSix == rgSix and reagentSeven == rgSeven and reagentEight == rgEight then return end

			reagentOne = rgOne
			reagentTwo = rgTwo
			reagentThree = rgThree
			reagentFour = rgFour
			reagentFive = rgFive
			reagentSix = rgSix
			reagentSeven = rgSeven
			reagentEight = rgEight
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
	info.text = L["hide"].." "..L["zinanthid"];
	info.func = function() TitanToggleVar(id, "HideHerbOneBfA"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideHerbOneBfA");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["riverbud"];
	info.func = function() TitanToggleVar(id, "HideHerbTwoBfA"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideHerbTwoBfA");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["seastalk"];
	info.func = function() TitanToggleVar(id, "HideHerbThreeBfA"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideHerbThreeBfA");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["starmoss"];
	info.func = function() TitanToggleVar(id, "HideHerbFourBfA"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideHerbFourBfA");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["akunda"];
	info.func = function() TitanToggleVar(id, "HideHerbFiveBfA"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideHerbFiveBfA");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["wkiss"];
	info.func = function() TitanToggleVar(id, "HideHerbSixBfA"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideHerbSixBfA");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["spollen"];
	info.func = function() TitanToggleVar(id, "HideHerbSevenBfA"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideHerbSevenBfA");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["aweed"];
	info.func = function() TitanToggleVar(id, "HideHerbEightBfA"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideHerbEightBfA");
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
	name = "Titan|cFFec7b39 "..L["herbalism"].."|r [|cFFEC7A37"..L["rBfA"].."|r] Multi",
	tooltip = L["herbalism"].."|r [|cFFEC7A37"..L["rBfA"].."|r]",
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
		HideHerbOneBfA = false,
		HideHerbTwoBfA = false,
		HideHerbThreeBfA = false,
		HideHerbFourBfA = false,
		HideHerbFiveBfA = false,
		HideHerbSixBfA = false,
		HideHerbSevenBfA = false,
		HideHerbEightBfA = false,
	},
	eventsTable = eventsTable
})
