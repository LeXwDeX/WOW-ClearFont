-- =============================================================================
--  A. ClearFont framework and font configuration
-- =============================================================================

local ClearFont = CreateFrame("Frame", "ClearFont")

-- Font paths
local CLEAR_FONT_BASE = "Fonts/"
local CLEAR_FONT_ZDSZ = CLEAR_FONT_BASE .. "YHSZ.ttf"
local CLEAR_FONT_NUMBER = CLEAR_FONT_BASE .. "RIZQT_.TTF" 
local CLEAR_FONT_EXP = CLEAR_FONT_BASE .. "ARIALN.TTF"
local CLEAR_FONT_QUEST = CLEAR_FONT_BASE .. "ARIALN.TTF"
local CLEAR_FONT_DAMAGE = CLEAR_FONT_BASE .. "ARKai_C.TTF"
local CLEAR_FONT = CLEAR_FONT_BASE .. "ARKai_T.TTF"
local CLEAR_FONT_ITEM = CLEAR_FONT_BASE .. "ARHei.TTF"
local CLEAR_FONT_CHAT = CLEAR_FONT_BASE .. "ARHei.TTF"

-- Global font scale
local CF_SCALE = 0.9

-- Cache for CanSetFont function
local canSetFontCache = {}
local function CanSetFont(object)
    if not object then return false end
    local cached = canSetFontCache[object]
    if cached ~= nil then return cached end
    local result = type(object) == "table" and object.SetFont and object.IsObjectType and not object:IsObjectType("SimpleHTML")
    canSetFontCache[object] = result
    return result
end

-- Font configurations
local fontConfigurations = {
    -- Format: [FontObjectName] = {font = ..., size = ..., style = ..., color = {r, g, b, a}, shadowColor = {r, g, b, a}, shadowOffset = {x, y}}

    -- Main game fonts
    ["GameFontNormal"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },
    ["GameFontHighlight"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },
    ["GameFontNormalMed3"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "OUTLINE", color = {1.0, 0.82, 0} },
    ["GameFontDisable"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE", color = {0.5, 0.5, 0.5} },
    ["GameFontGreen"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },
    ["GameFontRed"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },
    ["GameFontBlack"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },
    ["GameFontWhite"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },

    -- Small fonts
    ["GameFontNormalSmall"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "OUTLINE" },
    ["GameFontHighlightSmall"] = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "" },
    ["GameFontHighlightSmallOutline"] = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["GameFontDisableSmall"] = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "OUTLINE", color = {0.5, 0.5, 0.5} },
    ["GameFontDarkGraySmall"] = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "OUTLINE", color = {0.35, 0.35, 0.35} },
    ["GameFontGreenSmall"] = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["GameFontRedSmall"] = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["GameFontHighlightExtraSmall"] = { font = CLEAR_FONT, size = 11 * CF_SCALE, style = "OUTLINE" },

    -- Large fonts
    ["GameFontDisableLarge"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "", color = {0.5, 0.5, 0.5} },
    ["GameFontGreenLarge"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },
    ["GameFontRedLarge"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },

    -- Huge fonts
    ["GameFontNormalHuge"] = { font = CLEAR_FONT, size = 20 * CF_SCALE, style = "OUTLINE" },
    ["GameFontNormalHugeBlack"] = { font = CLEAR_FONT, size = 20 * CF_SCALE, style = "OUTLINE" },

    -- Boss emote font
    ["BossEmoteNormalHuge"] = { font = CLEAR_FONT, size = 25 * CF_SCALE, style = "OUTLINE" },

    -- Number fonts
    ["NumberFontNormal"] = { font = CLEAR_FONT_NUMBER, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["NumberFontNormalYellow"] = { font = CLEAR_FONT_NUMBER, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["NumberFontNormalSmall"] = { font = CLEAR_FONT_NUMBER, size = 11 * CF_SCALE, style = "OUTLINE" },
    ["NumberFontNormalLarge"] = { font = CLEAR_FONT_NUMBER, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["NumberFontNormalSmallGray"] = { font = CLEAR_FONT_NUMBER, size = 11 * CF_SCALE, style = "THICKOUTLINE" },
    ["NumberFontNormalHuge"] = { font = CLEAR_FONT_DAMAGE, size = 15 * CF_SCALE, style = "THICKOUTLINE" },
    -- Chat fonts
    ["ChatFontNormal"] = { font = CLEAR_FONT_CHAT, size = 14 * CF_SCALE, style = "OUTLINE" },
    ["ChatFontSmall"] = { font = CLEAR_FONT_CHAT, size = 13 * CF_SCALE, style = "OUTLINE" },

    -- Quest fonts
    ["QuestTitleFont"] = { font = CLEAR_FONT_QUEST, size = 15 * CF_SCALE, style = "", shadowColor = {0, 0, 0} },
    ["QuestTitleFontBlackShadow"] = { font = CLEAR_FONT_QUEST, size = 15 * CF_SCALE, style = "OUTLINE", color = {1.0, 0.82, 0}, shadowColor = {0, 0, 0} },
    ["QuestFont"] = { font = CLEAR_FONT_QUEST, size = 14 * CF_SCALE, style = "", color = {0, 0, 0} },
    ["QuestFontNormalSmall"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "", shadowColor = {0.3, 0.18, 0} },
    ["QuestFontHighlightHuge"] = { font = CLEAR_FONT_QUEST, size = 13 * CF_SCALE, style = "" },

    -- Item text font
    ["ItemTextFontNormal"] = { font = CLEAR_FONT_QUEST, size = 14 * CF_SCALE, style = "OUTLINE" },

    -- Mail fonts
    ["MailTextFontNormal"] = { font = CLEAR_FONT_QUEST, size = 14 * CF_SCALE, style = "", color = {0.18, 0.12, 0.06} },

    -- Spell fonts
    ["SubSpellFont"] = { font = CLEAR_FONT_QUEST, size = 12 * CF_SCALE, style = "", color = {0.35, 0.2, 0} },

    -- Dialog button fonts
    ["DialogButtonNormalText"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "OUTLINE" },
    ["DialogButtonHighlightText"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "OUTLINE" },

    -- Zone text fonts
    ["ZoneTextFont"] = { font = CLEAR_FONT, size = 32 * CF_SCALE, style = "THICKOUTLINE"},
    ["SubZoneTextFont"] = { font = CLEAR_FONT, size = 26 * CF_SCALE, style = "OUTLINE" },

    -- PVP info text font
    ["PVPInfoTextFont"] = { font = CLEAR_FONT, size = 20 * CF_SCALE, style = "OUTLINE" },

    -- Error font
    ["ErrorFont"] = { font = CLEAR_FONT, size = 17 * CF_SCALE, style = "OUTLINE", shadowColor = {0, 0, 0, 0.25}, shadowOffset = {1, -1} },

    -- Status bar text fonts
    ["TextStatusBarText"] = { font = CLEAR_FONT_EXP, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["TextStatusBarTextLarge"] = { font = CLEAR_FONT_EXP, size = 14 * CF_SCALE, style = "OUTLINE" },

    -- Combat log font
    ["CombatLogFont"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },

    -- Tooltip fonts
    ["GameTooltipText"] = { font = CLEAR_FONT_ITEM, size = 13 * CF_SCALE, style = "" },
    ["GameTooltipTextSmall"] = { font = CLEAR_FONT_ITEM, size = 12 * CF_SCALE, style = "" },
    ["GameTooltipHeaderText"] = { font = CLEAR_FONT, size = 15 * CF_SCALE, style = "OUTLINE" },

    -- World map font
    ["WorldMapTextFont"] = { font = CLEAR_FONT, size = 30 * CF_SCALE, style = "THICKOUTLINE"},

    -- Invoice fonts
    ["InvoiceTextFontNormal"] = { font = CLEAR_FONT_QUEST, size = 13 * CF_SCALE, style = "", color = {0.18, 0.12, 0.06} },
    ["InvoiceTextFontSmall"] = { font = CLEAR_FONT_QUEST, size = 11 * CF_SCALE, style = "", color = {0.18, 0.12, 0.06} },

    -- Combat text font
    ["CombatTextFont"] = { font = CLEAR_FONT_DAMAGE, size = 25 * CF_SCALE, style = "" },

    -- Movie subtitle font
    ["MovieSubtitleFont"] = { font = CLEAR_FONT, size = 25 * CF_SCALE, style = "OUTLINE", color = {1.0, 0.78, 0} },

    -- Achievement fonts
    ["AchievementPointsFont"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "" },
    ["AchievementPointsFontSmall"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "" },
    ["AchievementDescriptionFont"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "" },
    ["AchievementCriteriaFont"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "" },
    ["AchievementDateFont"] = { font = CLEAR_FONT, size = 11 * CF_SCALE, style = "" },

    -- Vehicle status bar text
    ["VehicleMenuBarStatusBarText"] = { font = CLEAR_FONT, size = 15 * CF_SCALE, style = "OUTLINE", color = {1.0, 1.0, 1.0} },

    -- Focus frame font
    ["FocusFontSmall"] = { font = CLEAR_FONT, size = 15 * CF_SCALE, style = "OUTLINE" },

    -- Player hit indicator
    ["PlayerHitIndicator"] = { font = "Fonts/ARIALN.ttf", size = 30, style = "OUTLINE" },
}

-- =============================================================================
--  B. Function to apply font settings
-- =============================================================================

function ClearFont:ApplyFontSettings()
    -- Apply fonts to font objects
    for fontName, settings in pairs(fontConfigurations) do
        local fontObject = _G[fontName]
        if fontObject and type(settings) == "table" and settings.font and settings.size then
            if CanSetFont(fontObject) then
                fontObject:SetFont(settings.font, settings.size, settings.style)
                if settings.color then
                    fontObject:SetTextColor(unpack(settings.color))
                end
                if settings.shadowColor then
                    fontObject:SetShadowColor(unpack(settings.shadowColor))
                end
                if settings.shadowOffset then
                    fontObject:SetShadowOffset(unpack(settings.shadowOffset))
                end
            end
        end
    end

    -- Update system fonts
    STANDARD_TEXT_FONT = CLEAR_FONT_CHAT
    UNIT_NAME_FONT = CLEAR_FONT
    NAMEPLATE_FONT = CLEAR_FONT

    -- Dropdown menu default text height
    UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = 12 * CF_SCALE

    -- Update chat font heights
    CHAT_FONT_HEIGHTS = {
        [1] = 7,
        [2] = 8,
        [3] = 9,
        [4] = 10,
        [5] = 11,
        [6] = 12,
        [7] = 13,
        [8] = 14,
        [9] = 15,
        [10] = 16,
        [11] = 17,
        [12] = 18,
        [13] = 19,
        [14] = 20,
        [15] = 21,
        [16] = 22,
        [17] = 23,
        [18] = 24
    }
end

-- =============================================================================
--  C. Special updates for UI elements
-- =============================================================================

-- Define update functions for special UI elements
local function UpdateClockFont()
    local clockButton = _G["TimeManagerClockButton"]
    if clockButton then
        local FONT_X_OFFSET = 0.1
        local FONT_Y_OFFSET = -0.1
        local regions = {clockButton:GetRegions()}
        for _, region in ipairs(regions) do
            if region:GetObjectType() == "FontString" then
                region:SetFont(CLEAR_FONT, 8 * CF_SCALE, "")
                local point, relativeTo, relativePoint, xOfs, yOfs = region:GetPoint()
                if point then
                    region:ClearAllPoints()
                    region:SetPoint(point, relativeTo, relativePoint, (xOfs or 0) + FONT_X_OFFSET, (yOfs or 0) + FONT_Y_OFFSET)
                end
            end
        end
    end
end

local function UpdatePlayerLevel()
    if PlayerLevelText then
        local FONT_X_OFFSET = -0.01
        local FONT_Y_OFFSET = -0.05
        PlayerLevelText:SetFont(CLEAR_FONT, 10 * CF_SCALE, "OUTLINE")
        local point, relativeTo, relativePoint, xOfs, yOfs = PlayerLevelText:GetPoint()
        if point then
            PlayerLevelText:ClearAllPoints()
            PlayerLevelText:SetPoint(point, relativeTo, relativePoint, (xOfs or 0) + FONT_X_OFFSET, (yOfs or 0) + FONT_Y_OFFSET)
        end
    end
end

local function UpdateTargetLevel()
    if TargetFrameTextureFrameLevelText then
        local FONT_X_OFFSET = 2
        local FONT_Y_OFFSET = -0.16
        TargetFrameTextureFrameLevelText:SetFont(CLEAR_FONT, 10 * CF_SCALE, "OUTLINE")
        local point, relativeTo, relativePoint, xOfs, yOfs = TargetFrameTextureFrameLevelText:GetPoint()
        if point then
            TargetFrameTextureFrameLevelText:ClearAllPoints()
            TargetFrameTextureFrameLevelText:SetPoint(point, relativeTo, relativePoint, (xOfs or 0) + FONT_X_OFFSET, (yOfs or 0) + FONT_Y_OFFSET)
        end
    end
end

local function UpdateActionBarFonts()
    local actionBars = {
        "ActionButton",
        "MultiBarBottomLeftButton",
        "MultiBarBottomRightButton",
        "MultiBarRightButton",
        "MultiBarLeftButton",
        "MultiBar5Button",
        "MultiBar6Button",
        "MultiBar7Button"
    }

    for _, barName in ipairs(actionBars) do
        for i = 1, 12 do
            local button = _G[barName .. i]
            if button then
                local hotkey = _G[button:GetName() .. "HotKey"]
                local name = _G[button:GetName() .. "Name"]
                if hotkey and CanSetFont(hotkey) then
                    hotkey:SetFont(CLEAR_FONT, 15 * CF_SCALE, "OUTLINE")
                end
                if name and CanSetFont(name) then
                    name:SetFont(CLEAR_FONT, 8 * CF_SCALE, "OUTLINE")
                end
            end
        end
    end
end

-- Define special updates table
local specialUpdates = {
    {
        update_function = UpdateClockFont,
        events = {"PLAYER_ENTERING_WORLD", "ADDON_LOADED", "PLAYER_LOGIN"},
        delay = 0
    },
    {
        update_function = UpdatePlayerLevel,
        events = {"PLAYER_LEVEL_UP", "PLAYER_ENTERING_WORLD", "ADDON_LOADED", "UNIT_LEVEL", "PLAYER_LOGIN"},
        delay = 0
    },
    {
        update_function = UpdateTargetLevel,
        events = {"PLAYER_TARGET_CHANGED", "PLAYER_ENTERING_WORLD", "ADDON_LOADED", "PLAYER_LOGIN", "UNIT_LEVEL"},
        delay = 0
    },
    {
        update_function = UpdateActionBarFonts,
        events = {"PLAYER_LOGIN", "ACTIONBAR_SHOWGRID", "ACTIONBAR_HIDEGRID"},
        delay = 0
    },
}

-- Build event handlers table
local eventHandlers = {}
for _, updateInfo in ipairs(specialUpdates) do
    for _, event in ipairs(updateInfo.events) do
        eventHandlers[event] = eventHandlers[event] or {}
        table.insert(eventHandlers[event], updateInfo)
    end
end

-- =============================================================================
--  D. Event handling and initialization
-- =============================================================================

ClearFont:SetScript("OnEvent", function(self, event)
    ClearFont:ApplyFontSettings()
    if eventHandlers[event] then
        for _, updateInfo in ipairs(eventHandlers[event]) do
            local delay = updateInfo.delay or 0
            if delay > 0 then
                C_Timer.After(delay, updateInfo.update_function)
            else
                updateInfo.update_function()
            end
        end
    end
end)

-- Register events
for event in pairs(eventHandlers) do
    ClearFont:RegisterEvent(event)
end

ClearFont:RegisterEvent("ADDON_LOADED")
ClearFont:RegisterEvent("PLAYER_LOGIN")

-- Apply font settings on startup
ClearFont:ApplyFontSettings()
