-- Run from the addon root with Lua 5.1: lua tests/forever-reagents.lua
local function loadAddon(file, namespace)
	assert(loadfile(file))("TitanProfessionsMulti", namespace)
end

local data = {}
loadAddon("Reagents/ClassicData.lua", data)
local base = data.CreateClassicReagentExpansion()
local function same(a, b)
	assert(type(a) == type(b))
	if type(a) ~= "table" then assert(a == b); return end
	for key, value in pairs(a) do same(value, b[key]) end
	for key in pairs(b) do assert(a[key] ~= nil) end
end
local fresh = data.CreateClassicReagentExpansion()
fresh.professions[1].items[1].ids[1] = -1
assert(data.CreateClassicReagentExpansion().professions[1].items[1].ids[1] == 10940)

local catalogue
local L = {
	CreateClassicReagentExpansion = data.CreateClassicReagentExpansion,
	ReagentTracker = { RegisterExpansion = function(expansion) catalogue = expansion end },
}
loadAddon("Reagents/Forever.lua", L)
assert(catalogue.name == "Forever" and catalogue.labelKey == "rForever")
local additions = { enchanting = 2, fishing = 2, herbalism = 10, mining = 9, skinning = 5, tailoring = 3 }
local seen, total = {}, 0
for index, profession in ipairs(catalogue.professions) do
	local original = base.professions[index]
	assert(profession.id == original.id)
	assert(#profession.items == #original.items + additions[profession.professionKey])
	for itemIndex, item in ipairs(original.items) do same(item, profession.items[itemIndex]) end
	for _, item in ipairs(profession.items) do
		for _, id in ipairs(item.ids) do
			assert(not seen[id], "Duplicate item ID: " .. id)
			seen[id] = true
		end
	end
	total = total + #profession.items - #original.items
end
assert(total == 31 and seen[249391] and seen[274030] and seen[268418])
loadAddon("Reagents/Classic.lua", L)
same(catalogue, base)
for _, flavor in ipairs({ "Vanilla", "Camelot" }) do
	local file = assert(io.open("TitanProfessionsMulti_" .. flavor .. ".toc"))
	local toc = file:read("*a"); file:close()
	local dataPosition = assert(toc:find("Reagents\\ClassicData.lua", 1, true))
	local entry = flavor == "Camelot" and "Forever" or "Classic"
	assert(dataPosition < assert(toc:find("Reagents\\" .. entry .. ".lua", 1, true)))
	local excluded = flavor == "Camelot" and "Classic" or "Forever"
	assert(not toc:find("Reagents\\" .. excluded .. ".lua", 1, true))
end
print("PASS: separate catalogues, fresh data, 31 unique additions, stable IDs, TOC routing")

-- Exercise the real tracker with modern item APIs and Titan callbacks.
local bags, bank, queried = 3, 7, {}
GetItemCount = nil
C_Item = {
	GetItemCount = function(id, includeBank, uses, reagentBank)
		assert(uses == false and reagentBank == includeBank)
		queried[id] = true
		return id == 249391 and (bags + (includeBank and bank or 0)) or 0
	end,
	GetItemNameByID = function(id) return id == 249391 and "Pyrite" or tostring(id) end,
	GetItemIconByID = function() return 1 end,
}
C_AddOns = { GetAddOnMetadata = function() return "test" end }
LibStub = function() return { GetLocale = function() return {} end } end
TitanPlugins = {}
local vars, callbacks, event
CreateFrame = function()
	return { RegisterEvent = function() end, SetScript = function(_, _, callback) event = callback end }
end
TitanGetVar = function(id, key) return vars[id][key] end
TitanToggleVar = function(id, key) vars[id][key] = not vars[id][key] end
TitanUtils_GetHighlightText = tostring
TitanPanelButton_UpdateButton = function() end

local function integration(flavor)
	queried, vars, callbacks = {}, {}, {}
	local namespace = {
		RestoreTitanMenuColor = function() end, AddMenuTitle = function() end,
		AddBarPositionMenu = function() end, AddMenuFooter = function() end,
	}
	namespace.Elib = function(config)
		vars[config.id], callbacks[config.id] = config.savedVariables, config
		TitanPlugins[config.id] = { menuText = config.name }
		return { registry = { id = config.id } }
	end
	loadAddon("Core/languages/enUS-default.lua", namespace)
	loadAddon("Core/ReagentTracker.lua", namespace)
	loadAddon("Reagents/ClassicData.lua", namespace)
	loadAddon("Reagents/" .. flavor .. ".lua", namespace)
	assert(#namespace.ReagentRegistrationErrors == 0)
	event({ RegisterEvent = function() end }, "PLAYER_ENTERING_WORLD")
	assert(#namespace.ReagentRuntimeErrors == 0)
	if flavor == "Classic" then assert(not queried[249391]); return end
	assert(queried[249391])
	local id = "TITAN_RESMINIM_CL"
	local config = callbacks[id]
	assert(config.name:find("Forever", 1, true))
	local tooltip = config.getTooltipText()
	assert(tooltip:find("Total in Bag: \t3", 1, true) and tooltip:find("Total in Bank: \t7", 1, true))
	vars[id].ShowBarBalance = true
	bags = 5
	event(nil, "BAG_UPDATE_DELAYED")
	assert(config.getButtonText(nil, id):find("[+2]", 1, true))
	local menu = {}
	config.prepareMenu({
		UIDropDownMenu_AddSpace = function() end,
		UIDropDownMenu_AddButton = function(info) menu[#menu + 1] = info end,
	})
	local found = false
	for _, entry in ipairs(menu) do
		if entry.text == "Hide Pyrite" then entry.func(); found = true end
	end
	assert(found and vars[id].HideItem_249391)
	assert(not config.getButtonText(nil, id):find("[+2]", 1, true))
	assert(#namespace.ReagentRuntimeErrors == 0)
end
integration("Classic")
integration("Forever")
print("PASS: modern APIs, Classic isolation, bag/bank totals, session gains, item hiding")
