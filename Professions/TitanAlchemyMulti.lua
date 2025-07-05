--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows your Alchemy skill level.
Site: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "ALCM"
local ALCM, prevALCM = 0.0, -2
local ALCMmax = 0
local ALCMIncrease = 0
local startskill
local profOffset
local level = UnitLevel("player")
local expansionLevel = LE_EXPANSION_LEVEL_CURRENT
-----------------------------------------------
local function OnClick(self, button)
    if (button == "LeftButton" and profOffset) then
        CastSpell(profOffset + 1, "Spell")
    end
end
-----------------------------------------------
local function OnUpdate(self, id)
    local prof1, prof2 = GetProfessions();

    local skillLevel = 0
    local maxSkillLevel = 0
    profOffset = nil

    if prof1 ~= nil then
        local name, _, skillLevel, maxSkillLevel, _, offset, skillLine, IncreaseSkillLevel = GetProfessionInfo(prof1)
        if skillLine == 171 then
            ALCM = skillLevel
            ALCMmax = maxSkillLevel
            ALCMIncrease = IncreaseSkillLevel
            profOffset = offset
            if not startskill then
                startskill = skillLevel
            end
        elseif prof2 ~= nil then
            local name, _, skillLevel, maxSkillLevel, _, offset, skillLine, IncreaseSkillLevel = GetProfessionInfo(prof2)
            if skillLine == 171 then
                ALCM = skillLevel
                ALCMmax = maxSkillLevel
                ALCMIncrease = IncreaseSkillLevel
                profOffset = offset
                if not startskill then
                    startskill = skillLevel
                end
            end
        end
    end

    if ALCM == prevALCM and ALCMmax == preALCMmax and prevALCMIncrease == ALCMIncrease then
        return
    end

    preALCMmax = ALCMmax
    prevALCM = ALCM
    prevALCMIncrease = ALCMIncrease

    TitanPanelButton_UpdateButton(id)
    return true
end
-----------------------------------------------
local function GetButtonText(self, id)
    local ALCMtext
    local bonusText = ""
    if ALCMIncrease and ALCMIncrease > 0 then
        -- Bônus da profissão
        bonusText = "|r|cFFFFFFFF" .. " + |r|cFF69FF69" .. ALCMIncrease .. "|r|cFFFFFFFF " .. L["bonus"] .. " =|r|cFF69FF69 " .. (ALCM + ALCMIncrease)
    end
    local HideText = "" -- Texto HideMax
    if not TitanGetVar(ID, "HideMax") then
        HideText = "|r/|cFFFF2e2e" .. ALCMmax
    end
    local SimpleText = bonusText -- Texto de bônus simples
    if TitanGetVar(ID, "SimpleBonus") and ALCMIncrease > 0 then
        SimpleText = "|r|cFFFFFFFF" .. " (+|r|cFF69FF69" .. ALCMIncrease .. "|r|cFFFFFFFF)"
    end

    local BarBalanceText = ""
    if ALCMmax ~= 0 and (ALCM - startskill) > 0 and TitanGetVar(ID, "ShowBarBalance") then
        BarBalanceText = " |cFF69FF69[" .. (ALCM - startskill) .. "]"
    end

    if ALCM == 600 then -- Valor máximo do MoP (clássico)
        ALCMtext = "|cFF69FF69" .. L["maximum"] .. "!" .. SimpleText
    --[[elseif level > 84 and ALCM == 600 then
        ALCMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText --]] -- Eu usava essa linha para o clássico, mas não faz mais sentido
    elseif ALCMmax == 0 then -- Sem profissão
        ALCMtext = "|cFFFF2e2e" .. L["noprof"]
    elseif ALCM == ALCMmax --[[and level < 50--]] then
        ALCMtext = "|cFFFFFFFF" .. ALCM .. "|cFF69FF69! [" .. L["maximum"] .. "]" .. SimpleText .. BarBalanceText
    else
        ALCMtext = "|cFFFFFFFF" .. ALCM .. HideText .. SimpleText .. BarBalanceText
    end
    return L["alchemy"] .. ": ", ALCMtext
end
-----------------------------------------------
local function GetTooltipText(self, id)
    local totalTooltip = "\n" .. L["craftsmanship"] .. "|r\t|cFFFFFFFF" .. ALCM -- Valor atual da prof.
    if ALCMIncrease > 0 then
        totalTooltip = "\n" .. L["craftsmanship"] .. "|r\t|cFF69FF69" .. ALCM + ALCMIncrease
    end
    local bonusText = "" -- Texto bónus só aparece se você tiver bônus para mostrar!
    if ALCMIncrease > 0 then
        bonusText = "\n" .. L["bonustext"] .. "\t|cFF69FF69" .. ALCMIncrease
    end
    local maxSkill = "\n" .. L["maxtext"] .. "\t" .. TitanUtils_GetHighlightText(ALCMmax) -- O máximo que você pode ter no nível atual de perícia

    local Goodwith = "\n \n" .. L["goodwith"] .. "\n" .. L["herbalism"] -- Texto de combinação

    local CombinationText = Goodwith -- Tecto das combinações
    if TitanGetVar(ID, "HideCombination") then
        CombinationText = ""
    end

    local ColorValueAccount -- Conta de ganho de perícia
    if not ALCM then
        ColorValueAccount = ""
    elseif ALCM == 600 then
        ColorValueAccount = "\n" .. L["maxskill"]
    elseif not startskill or (ALCM - startskill) == 0 then
        ColorValueAccount = "\n" .. L["session"] .. "\t" .. TitanUtils_GetHighlightText("0")
    elseif (ALCM - startskill) > 0 then
        ColorValueAccount = "\n" .. L["session"] .. "\t" .. "|cFF69FF69" .. (ALCM - startskill) .. "|r"
    elseif (ALCM - startskill) < 0 then
        -- Segurança quando existe mudança de exp.
        ColorValueAccount = ""
    end

    --[[
    local warning -- Aviso de que não está mais aprendendo
    if ALCMmax == 800 then
        warning = ""
    elseif ALCM == ALCMmax and level < 50 and ALCM ~= 175 then
        warning = L["warning"]
    elseif ALCM == 175 and level > 49 then -- Não deixa abvisar no BfA se estiver com 175
        warning = ""
    else
        warning = ""
    end
    --]]

    local ValueText = "" -- Difere com e sem profissão
    if ALCM == 0 then
        ValueText = L["noskill"] .. Goodwith
    else
        ValueText = L["hint"] .. "\n \n" .. L["info"] .. bonusText .. totalTooltip .. maxSkill .. ColorValueAccount .. CombinationText--[[..warning--]]
    end

    return ValueText
end
-----------------------------------------------
L.Elib({
    id = ID,
    name = "Titan|c22fdce08 " .. L["alchemy"] .. "|r" .. " Multi",
    tooltip = L["alchemy"],
    icon = (expansionLevel >= 9) and "Interface\\Icons\\ui_profession_alchemy" or "Interface\\Icons\\trade_alchemy",
    category = "Profession",
    version = version,
    onUpdate = OnUpdate,
    onClick = OnClick,
    getButtonText = GetButtonText,
    getTooltipText = GetTooltipText,
    prepareMenu = L.PrepareProfessionsMenu,
    savedVariables = {
        ShowIcon = 1,
        DisplayOnRightSide = false,
        HideMax = false,
        SimpleBonus = true,
        ShowBarBalance = false,
        ShowLabelText = false,
        HideCombination = true,
    }
})
