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
local ID = "TITAN_RESSKINM_BFA"
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
	return GetItemCount(154165, true) or 0 -- Calcified Bone
end
-----------------------------------------------
local function getReagentTwo()
	return GetItemCount(154164, true) or 0 -- Blood-Stained Bone
end
-----------------------------------------------
local function getReagentThree()
	return GetItemCount(153051, true) or 0 -- Mistscale
end
-----------------------------------------------
local function getReagentFour()
	return GetItemCount(153050, true) or 0 -- Shimmerscale
end
-----------------------------------------------
local function getReagentFive()
	return GetItemCount(154722, true) or 0 -- Tempest Hide
end
-----------------------------------------------
local function getReagentSix()
	return GetItemCount(152541, true) or 0 -- Coarse Leather
end
-----------------------------------------------
local function getReagentSeven()
	return GetItemCount(168649, true) or 0 -- Dredged Leather
end
-----------------------------------------------
local function getReagentEight()
	return GetItemCount(168650, true) or 0 -- Cragscale
end
-----------------------------------------------
local function GetButtonText(self, id)
	-- Reagente 1
	local reagentOneText
	if not reagentOne then
		reagentOneText = "  |TInterface\\Icons\\inv_skinning_80_calcifiedbone:0|t "..TitanUtils_GetHighlightText("0")
	else
		reagentOneText = "  |TInterface\\Icons\\inv_skinning_80_calcifiedbone:0|t "..TitanUtils_GetHighlightText(reagentOne)
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
	if TitanGetVar(id, "HideSkinOneBfA") then
		reagentOneBar = ""
	end
	-- Fim Reagente 1
	-- Reagente 2
	local reagentTwoText
	if not reagentTwo then
		reagentTwoText = "  |TInterface\\Icons\\inv_skinning_80_bloodsoakedbone:0|t "..TitanUtils_GetHighlightText("0")
	else
		reagentTwoText = "  |TInterface\\Icons\\inv_skinning_80_bloodsoakedbone:0|t "..TitanUtils_GetHighlightText(reagentTwo)
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
	if TitanGetVar(id, "HideSkinTwoBfA") then
		reagentTwoBar = ""
	end
	-- Fim Reagente 2
	-- Reagente 3
	local reagentThreeText
	if not reagentThree then
		reagentThreeText = "  |TInterface\\Icons\\inv_skinning_80_mistscale:0|t "..TitanUtils_GetHighlightText("0")
	else
		reagentThreeText = "  |TInterface\\Icons\\inv_skinning_80_mistscale:0|t "..TitanUtils_GetHighlightText(reagentThree)
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
	if TitanGetVar(id, "HideSkinThreeBfA") then
		reagentThreeBar = ""
	end
	-- Fim Reagente 3
	-- Reagente 4
	local reagentFourText
	if not reagentFour then
		reagentFourText = "  |TInterface\\Icons\\inv_skinning_80_shimmerscale:0|t "..TitanUtils_GetHighlightText("0")
	else
		reagentFourText = "  |TInterface\\Icons\\inv_skinning_80_shimmerscale:0|t "..TitanUtils_GetHighlightText(reagentFour)
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
	if TitanGetVar(id, "HideSkinFourBfA") then
		reagentFourBar = ""
	end
	-- Fim Reagente 4
	-- Reagente 5
	local reagentFiveText
	if not reagentFive then
		reagentFiveText = "  |TInterface\\Icons\\inv_skinning_80_tempesthide:0|t "..TitanUtils_GetHighlightText("0")
	else
		reagentFiveText = "  |TInterface\\Icons\\inv_skinning_80_tempesthide:0|t "..TitanUtils_GetHighlightText(reagentFive)
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
	if TitanGetVar(id, "HideSkinFiveBfA") then
		reagentFiveBar = ""
	end
	-- Fim Reagente 5
	-- Reagente 6
	local reagentSixText
	if not reagentSix then
		reagentSixText = "  |TInterface\\Icons\\inv_skinning_80_coarseleather:0|t "..TitanUtils_GetHighlightText("0")
	else
		reagentSixText = "  |TInterface\\Icons\\inv_skinning_80_coarseleather:0|t "..TitanUtils_GetHighlightText(reagentSix)
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
	if TitanGetVar(id, "HideSkinSixBfA") then
		reagentSixBar = ""
	end
	-- Fim Reagente 6
	-- Reagente 7
	local reagentSevenText
	if not reagentSeven then
		reagentSevenText = "  |TInterface\\Icons\\inv_misc_startannedleather:0|t "..TitanUtils_GetHighlightText("0")
	else
		reagentSevenText = "  |TInterface\\Icons\\inv_misc_startannedleather:0|t "..TitanUtils_GetHighlightText(reagentSeven)
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
	if TitanGetVar(id, "HideSkinSevenBfA") then
		reagentSevenBar = ""
	end
	-- Fim Reagente 7
	-- Reagente 8
	local reagentEightText
	if not reagentEight then
		reagentEightText = "  |TInterface\\Icons\\inv_skinning_80_shimmerscale:0|t "..TitanUtils_GetHighlightText("0")
	else
		reagentEightText = "  |TInterface\\Icons\\inv_skinning_80_shimmerscale:0|t "..TitanUtils_GetHighlightText(reagentEight)
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
	if TitanGetVar(id, "HideSkinEightBfA") then
		reagentEightBar = ""
	end
	-- Fim Reagente 8

	return reagentOneBar..reagentTwoBar..reagentThreeBar..reagentFourBar..reagentFiveBar..reagentSixBar..reagentSevenBar..reagentEightBar
end
-----------------------------------------------
local function GetTooltipText(self, id)

	local reagentOneBag = " \n|TInterface\\Icons\\inv_skinning_80_calcifiedbone:0|t "..L["cbone"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(154165))
	local reagentOneBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(154165, true) - GetItemCount(154165))

	local reagentTwoBag = "\n \n|TInterface\\Icons\\inv_skinning_80_bloodsoakedbone:0|t "..L["bloodstained"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(154164))
	local reagentTwoBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(154164, true) - GetItemCount(154164))

	local reagentThreeBag = "\n \n|TInterface\\Icons\\inv_skinning_80_mistscale:0|t "..L["mistscale"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(153051))
	local reagentThreeBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(153051, true) - GetItemCount(153051))

	local reagentFourBag = "\n \n|TInterface\\Icons\\inv_skinning_80_shimmerscale:0|t "..L["shimmerscale"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(153050))
	local reagentFourBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(153050, true) - GetItemCount(153050))

	local reagentFiveBag = "\n \n|TInterface\\Icons\\inv_skinning_80_tempesthide:0|t "..L["tempesth"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(154722))
	local reagentFiveBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(154722, true) - GetItemCount(154722))

	local reagentSixBag = "\n \n|TInterface\\Icons\\inv_skinning_80_coarseleather:0|t "..L["coarsel"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152541))
	local reagentSixBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152541, true) - GetItemCount(152541))

	local reagentSevenBag = "\n \n|TInterface\\Icons\\inv_misc_startannedleather:0|t "..L["dredgedl"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(168649))
	local reagentSevenBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(168649, true) - GetItemCount(168649))

	local reagentEightBag = "\n \n|TInterface\\Icons\\inv_skinning_80_shimmerscale:0|t "..L["cragscale"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(168650))
	local reagentEightBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(168650, true) - GetItemCount(168650))

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
	info.text = L["hide"].." "..L["cbone"];
	info.func = function() TitanToggleVar(id, "HideSkinOneBfA"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideSkinOneBfA");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = L["hide"].." "..L["bloodstained"];
	info.func = function() TitanToggleVar(id, "HideSkinTwoBfA"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideSkinTwoBfA");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = L["hide"].." "..L["mistscale"];
	info.func = function() TitanToggleVar(id, "HideSkinThreeBfA"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideSkinThreeBfA");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = L["hide"].." "..L["shimmerscale"];
	info.func = function() TitanToggleVar(id, "HideSkinFourBfA"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideSkinFourBfA");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = L["hide"].." "..L["tempesth"];
	info.func = function() TitanToggleVar(id, "HideSkinFiveBfA"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideSkinFiveBfA");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = L["hide"].." "..L["coarsel"];
	info.func = function() TitanToggleVar(id, "HideSkinSixBfA"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideSkinSixBfA");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = L["hide"].." "..L["dredgedl"];
	info.func = function() TitanToggleVar(id, "HideSkinSevenBfA"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideSkinSevenBfA");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = L["hide"].." "..L["cragscale"];
	info.func = function() TitanToggleVar(id, "HideSkinEightBfA"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideSkinEightBfA");
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
	name = "Titan|cFFec7b39 "..L["skinning"].."|r [|cFFEC7A37"..L["rBfA"].."|r] Multi",
	tooltip = L["skinning"].."|r [|cFFEC7A37"..L["rBfA"].."|r]",
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
		HideSkinOneBfA = false,
		HideSkinTwoBfA = false,
		HideSkinThreeBfA = false,
		HideSkinFourBfA = false,
		HideSkinFiveBfA = false,
		HideSkinSixBfA = false,
		HideSkinSevenBfA = false,
		HideSkinEightBfA = false,
	},
	eventsTable = eventsTable
})
