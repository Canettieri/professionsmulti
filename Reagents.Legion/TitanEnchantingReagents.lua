--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows Enchanting Reagents.
Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "TITAN_RESENCHM"
local arkhana = 0
local startArkhana = 0

local leylightShard = 0
local startLeylight = 0

local chaosCrystal = 0
local startChaos = 0

local bloodSargeras = 0
local startBlood = 0
-----------------------------------------------
local function getArkhana()
	return GetItemCount(124440, true) or 0
end
-----------------------------------------------
local function getLeylight()
	return GetItemCount(124441, true) or 0
end
-----------------------------------------------
local function getChaos()
	return GetItemCount(124442, true) or 0
end
-----------------------------------------------
local function getBlood()
	return GetItemCount(124124, true) or 0
end
-----------------------------------------------
local function GetButtonText(self, id)
	local arkhanaText
	if not arkhana then
		arkhanaText = "  |TInterface\\Icons\\inv_enchanting_70_arkhana:0|t "..TitanUtils_GetHighlightText("0")
	else
		arkhanaText = "  |TInterface\\Icons\\inv_enchanting_70_arkhana:0|t "..TitanUtils_GetHighlightText(arkhana)
	end

	local leylightText
	if not leylightShard then
		leylightText = "  |TInterface\\Icons\\inv_enchanting_70_leylightcrystal:0|t "..TitanUtils_GetHighlightText("0")
	else
		leylightText = "  |TInterface\\Icons\\inv_enchanting_70_leylightcrystal:0|t "..TitanUtils_GetHighlightText(leylightShard)
	end

	local chaosText
	if not chaosCrystal then
		chaosText = "  |TInterface\\Icons\\inv_enchanting_70_chaosshard:0|t "..TitanUtils_GetHighlightText("0")
	else
		chaosText = "  |TInterface\\Icons\\inv_enchanting_70_chaosshard:0|t "..TitanUtils_GetHighlightText(chaosCrystal)
	end

	local bloodText
	if not bloodSargeras then
		bloodText = "  |T1417744:0|t "..TitanUtils_GetHighlightText("0")
	else
		bloodText = "  |T1417744:0|t "..TitanUtils_GetHighlightText(bloodSargeras)
	end

	local barBalanceArkhana = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (arkhana - startArkhana) > 0 then
			barBalanceArkhana = " |cFF69FF69["..(arkhana - startArkhana).."]"
		elseif (arkhana - startArkhana) < 0 then
			barBalanceArkhana = " |cFFFF2e2e["..(arkhana - startArkhana).."]"
		end
	end

	local barBalanceLeylight = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (leylightShard - startLeylight) > 0 then
			barBalanceLeylight = " |cFF69FF69["..(leylightShard - startLeylight).."]"
		elseif (leylightShard - startLeylight) < 0 then
			barBalanceLeylight = " |cFFFF2e2e["..(leylightShard - startLeylight).."]"
		end
	end

	local barBalanceChaos = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (chaosCrystal - startChaos) > 0 then
			barBalanceChaos = " |cFF69FF69["..(chaosCrystal - startChaos).."]"
		elseif (chaosCrystal - startChaos) < 0 then
			barBalanceChaos = " |cFFFF2e2e["..(chaosCrystal - startChaos).."]"
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

	local arkhanaBar = arkhanaText..barBalanceArkhana.." "
	if TitanGetVar(id, "HideArkhana") then
		arkhanaBar = ""
	end

	local leylightBar = leylightText..barBalanceLeylight.." "
	if TitanGetVar(id, "HideLeylight") then
		leylightBar = ""
	end

	local chaosBar = chaosText..barBalanceChaos
	if TitanGetVar(id, "HideChaos") then
		chaosBar = ""
	end

	local bloodBar = bloodText..barBalanceBlood
	if TitanGetVar(id, "HideBlood") then
		bloodBar = ""
	end

	return arkhanaBar..leylightBar..chaosBar..bloodBar
end
-----------------------------------------------
local function GetTooltipText(self, id)

	local arkhanaBag = " \n|TInterface\\Icons\\inv_enchanting_70_arkhana:0|t "..L["arkhana"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124440))
	local arkhanaBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124440, true) - GetItemCount(124440))

	local leylightBag = "\n \n|TInterface\\Icons\\inv_enchanting_70_leylightcrystal:0|t "..L["leylight"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124441))
	local leylightBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124441, true) - GetItemCount(124441))

	local chaosBag = "\n \n|TInterface\\Icons\\inv_enchanting_70_chaosshard:0|t "..L["chaosCrystal"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124442))
	local chaosBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124442, true) - GetItemCount(124442))

	local bloodBag = "\n \n|T1417744:0|t "..L["blood"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124124))
	local bloodBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(124124, true) - GetItemCount(124124))

	local valueText = "" -- Difere com e sem reagente
	if arkhana == 0 and chaosCrystal == 0 and chaosCrystal == 0 and bloodSargeras == 0 then
		valueText = "\r"..L["info"].."\r|cFFFF2e2e"..L["noreagent"]
	else
		valueText = arkhanaBag..arkhanaBank..leylightBag..leylightBank..chaosBag..chaosBank..bloodBag..bloodBank
	end

	return valueText
end
-----------------------------------------------
local eventsTable = {
	PLAYER_ENTERING_WORLD = function(self)
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.PLAYER_ENTERING_WORLD = nil

		startArkhana = getArkhana()
		arkhana = startArkhana

		startLeylight = getLeylight()
		leylightShard = startLeylight

		startChaos = getChaos()
		chaosCrystal = startChaos

		startBlood = getBlood()
		bloodSargeras = startBlood

		TitanPanelButton_UpdateButton(self.registry.id)

		self.BAG_UPDATE = function(self, bagID)
			local arkh = getArkhana()
			local leyl = getLeylight()
			local chao = getChaos()
			local blood = getBlood()
			if arkhana == arkh and leylightShard == leyl and chaosCrystal == chao and bloodSargeras == blood then return end

			leylightShard = leyl
			arkhana = arkh
			chaosCrystal = chao
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
	info.text = L["hide"].." "..L["arkhana"];
	info.func = function() TitanToggleVar(id, "HideArkhana"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideArkhana");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = L["hide"].." "..L["leylight"];
	info.func = function() TitanToggleVar(id, "HideLeylight"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideLeylight");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = L["hide"].." "..L["chaosCrystal"];
	info.func = function() TitanToggleVar(id, "HideChaos"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideChaos");
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
	name = "Titan|cFFec7b3a "..L["enchanting"].."|r [|cFFEC7A37"..L["rLegion"].."|r] Multi",
	tooltip = L["enchanting"].."|r [|cFFEC7A37"..L["rLegion"].."|r]",
	icon = "Interface\\Icons\\Trade_engraving",
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
		HideArkhana = false,
		HideLeylight = false,
		HideChaos = false,
		HideBlood = false,
	},
	eventsTable = eventsTable
})
