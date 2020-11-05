--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows Enchanting Reagents.
Site: http://www.curse.com/addons/wow/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "TITAN_RESENCHM_BFA"
local gloomDust = 0
local startGloomDust = 0

local umbraShard = 0
local startUmbraShard = 0

local veiledCrystal = 0
local startVCrystal = 0
-----------------------------------------------
local function getGloomDust()
	return GetItemCount(152875, true) or 0
end
-----------------------------------------------
local function getUmbraShard()
	return GetItemCount(152876, true) or 0
end
-----------------------------------------------
local function getVeiledCrystal()
	return GetItemCount(152877, true) or 0
end
-----------------------------------------------
local function GetButtonText(self, id)
	local gloomText
	if not gloomDust then
		gloomText = "  |TInterface\\Icons\\inv_enchanting_80_shadowdust:0|t "..TitanUtils_GetHighlightText("0")
	else
		gloomText = "  |TInterface\\Icons\\inv_enchanting_80_shadowdust:0|t "..TitanUtils_GetHighlightText(gloomDust)
	end

	local umbraShardText
	if not umbraShard then
		umbraShardText = "  |TInterface\\Icons\\inv_enchanting_80_umbrashard:0|t "..TitanUtils_GetHighlightText("0")
	else
		umbraShardText = "  |TInterface\\Icons\\inv_enchanting_80_umbrashard:0|t "..TitanUtils_GetHighlightText(umbraShard)
	end

	local veiledCText
	if not veiledCrystal then
		veiledCText = "  |TInterface\\Icons\\inv_enchanting_80_veiledcrystal:0|t "..TitanUtils_GetHighlightText("0")
	else
		veiledCText = "  |TInterface\\Icons\\inv_enchanting_80_veiledcrystal:0|t "..TitanUtils_GetHighlightText(veiledCrystal)
	end

	local barBalanceGloom = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (gloomDust - startGloomDust) > 0 then
			barBalanceGloom = " |cFF69FF69["..(gloomDust - startGloomDust).."]"
		elseif (gloomDust - startGloomDust) < 0 then
			barBalanceGloom = " |cFFFF2e2e["..(gloomDust - startGloomDust).."]"
		end
	end

	local barBalanceUmbraShard = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (umbraShard - startUmbraShard) > 0 then
			barBalanceUmbraShard = " |cFF69FF69["..(umbraShard - startUmbraShard).."]"
		elseif (umbraShard - startUmbraShard) < 0 then
			barBalanceUmbraShard = " |cFFFF2e2e["..(umbraShard - startUmbraShard).."]"
		end
	end

	local barBalanceVeiledC = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (veiledCrystal - startVCrystal) > 0 then
			barBalanceVeiledC = " |cFF69FF69["..(veiledCrystal - startVCrystal).."]"
		elseif (veiledCrystal - startVCrystal) < 0 then
			barBalanceVeiledC = " |cFFFF2e2e["..(veiledCrystal - startVCrystal).."]"
		end
	end

	local gloomBar = gloomText..barBalanceGloom.." "
	if TitanGetVar(id, "HideGloom") then
		gloomBar = ""
	end

	local umbraShardBar = umbraShardText..barBalanceUmbraShard.." "
	if TitanGetVar(id, "HideUmbraShard") then
		umbraShardBar = ""
	end

	local vcBar = veiledCText..barBalanceVeiledC.." "
	if TitanGetVar(id, "HideVC") then
		vcBar = ""
	end

	return gloomBar..umbraShardBar..vcBar
end
-----------------------------------------------
local function GetTooltipText(self, id)

	local gloomBag = " \n|TInterface\\Icons\\inv_enchanting_80_shadowdust:0|t "..L["gdust"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152875))
	local gloomBank = "\r\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152875, true) - GetItemCount(152875))

	local umbraShardBag = "\n \n|TInterface\\Icons\\inv_enchanting_80_umbrashard:0|t "..L["umbrashard"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152876))
	local umbraShardBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152876, true) - GetItemCount(152876))

	local vcBag = "\n \n|TInterface\\Icons\\inv_enchanting_80_veiledcrystal:0|t "..L["veiledcrystal"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152877))
	local vcBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(152877, true) - GetItemCount(152877))

	local valueText = "" -- Difere com e sem reagente
	if gloomDust == 0 and umbraShard == 0 and veiledCrystal == 0 then
		valueText = "\r"..L["info"].."\r|cFFFF2e2e"..L["noreagent"]
	else
		valueText = gloomBag..gloomBank..umbraShardBag..umbraShardBank..vcBag..vcBank
	end

	return valueText
end
-----------------------------------------------
local eventsTable = {
	PLAYER_ENTERING_WORLD = function(self)
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.PLAYER_ENTERING_WORLD = nil

		startGloomDust = getGloomDust()
		gloomDust = startGloomDust

		startUmbraShard = getUmbraShard()
		umbraShard = startUmbraShard

		startVCrystal = getVeiledCrystal()
		veiledCrystal = startVCrystal

		TitanPanelButton_UpdateButton(self.registry.id)

		self.BAG_UPDATE = function(self, bagID)
			local gdust = getGloomDust()
			local ushard = getUmbraShard()
			local vcrys = getVeiledCrystal()
			if gloomDust == gdust and umbraShard == ushard and veiledCrystal == vcrys then return end

			gloomDust = gdust
			umbraShard = ushard
			veiledCrystal = vcrys
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
	info.text = L["hide"].." "..L["gdust"];
	info.func = function() TitanToggleVar(id, "HideGloom"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideGloom");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["umbrashard"];
	info.func = function() TitanToggleVar(id, "HideUmbraShard"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideUmbraShard");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	local info = L_UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["veiledcrystal"];
	info.func = function() TitanToggleVar(id, "HideVC"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideVC");
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
	name = "Titan|cFFec7b39 "..L["enchanting"].."|r [|cFFEC7A37"..L["rBfA"].."|r] Multi",
	tooltip = L["enchanting"].."|r [|cFFEC7A37"..L["rBfA"].."|r]",
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
		HideGloom = false,
		HideUmbraShard = false,
		HideVC = false,
	},
	eventsTable = eventsTable
})
