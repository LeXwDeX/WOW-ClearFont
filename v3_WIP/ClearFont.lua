-- =============================================================================
--  A. ClearFont 框架和字体配置
-- =============================================================================

local ClearFont = CreateFrame("Frame", "ClearFont")

-- 添加保存配置的变量
ClearFontDB = ClearFontDB or {}

-- 字体配置
local CLEAR_FONT_BASE = "Fonts/"
local CLEAR_FONT = CLEAR_FONT_BASE .. "ARKai_T.TTF"
-- local CLEAR_FONT_ZDSZ = CLEAR_FONT_BASE .. "YHSZ.ttf"
local CLEAR_FONT_NUMBER = CLEAR_FONT_BASE .. "RIZQT_.TTF"
local CLEAR_FONT_EXP = CLEAR_FONT_BASE .. "ARIALN.TTF"
local CLEAR_FONT_QUEST = CLEAR_FONT_BASE .. "ARIALN.TTF"
local CLEAR_FONT_DAMAGE = CLEAR_FONT_BASE .. "ARKai_C.TTF"
local CLEAR_FONT_ITEM = CLEAR_FONT_BASE .. "ARHei.TTF"
local CLEAR_FONT_CHAT = CLEAR_FONT_BASE .. "ARHei.TTF"

-- 全局字体大小
local CF_SCALE = 0.9

-- 缓存频繁访问的函数
local pairs = pairs
local type = type
local unpack = unpack

-- 缓存 CanSetFont 函数
local canSetFontCache = {}
local function CanSetFont(object)
    if not object then return false end
    local cached = canSetFontCache[object]
    if cached ~= nil then return cached end
    local result = type(object) == "table" and object.SetFont and object.IsObjectType and
        not object:IsObjectType("SimpleHTML")
    canSetFontCache[object] = result
    return result
end

-- 字体样式配置
local fontStyles = {
    { "普通", "" },
    { "轮廓", "OUTLINE" },
    { "厚轮廓", "THICKOUTLINE" },
    { "单色", "MONOCHROME" },
    { "单色轮廓", "MONOCHROME,OUTLINE" },
    { "单色厚轮廓", "MONOCHROME,THICKOUTLINE" }
}

-- 字体配置
local fontConfigurations = {
    -- 格式：[FontObjectName] = {font = ..., size = ..., style = ..., color = {r, g, b, a}, shadowColor = {r, g, b, a}, shadowOffset = {x, y}}

    -- 主游戏字体
    ["GameFontNormal"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },
    ["GameFontHighlight"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },
    ["GameFontNormalMed3"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "OUTLINE", color = { 1.0, 0.82, 0 } },
    ["GameFontDisable"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE", color = { 0.5, 0.5, 0.5 } },
    ["GameFontGreen"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },
    ["GameFontRed"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },
    ["GameFontBlack"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },
    ["GameFontWhite"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },

    -- 小字体
    ["GameFontNormalSmall"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "OUTLINE" },
    ["GameFontHighlightSmall"] = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "" },
    ["GameFontHighlightSmallOutline"] = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["GameFontDisableSmall"] = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "OUTLINE", color = { 0.5, 0.5, 0.5 } },
    ["GameFontDarkGraySmall"] = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "OUTLINE", color = { 0.35, 0.35, 0.35 } },
    ["GameFontGreenSmall"] = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["GameFontRedSmall"] = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["GameFontHighlightExtraSmall"] = { font = CLEAR_FONT, size = 11 * CF_SCALE, style = "OUTLINE" },

    -- 大字体
    ["GameFontDisableLarge"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "", color = { 0.5, 0.5, 0.5 } },
    ["GameFontGreenLarge"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },
    ["GameFontRedLarge"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },

    -- 超大字体
    ["GameFontNormalHuge"] = { font = CLEAR_FONT, size = 20 * CF_SCALE, style = "OUTLINE" },
    ["GameFontNormalHugeBlack"] = { font = CLEAR_FONT, size = 20 * CF_SCALE, style = "OUTLINE" },

    -- Boss 喊话字体
    ["BossEmoteNormalHuge"] = { font = CLEAR_FONT, size = 25 * CF_SCALE, style = "OUTLINE" },

    -- 数字字体
    ["NumberFontNormal"] = { font = CLEAR_FONT_NUMBER, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["NumberFontNormalYellow"] = { font = CLEAR_FONT_NUMBER, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["NumberFontNormalSmall"] = { font = CLEAR_FONT_NUMBER, size = 11 * CF_SCALE, style = "OUTLINE" },
    ["NumberFontNormalLarge"] = { font = CLEAR_FONT_NUMBER, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["NumberFontNormalSmallGray"] = { font = CLEAR_FONT_NUMBER, size = 11 * CF_SCALE, style = "THICKOUTLINE" },
    ["NumberFontNormalHuge"] = { font = CLEAR_FONT_DAMAGE, size = 15 * CF_SCALE, style = "THICKOUTLINE" },

    -- 聊天字体
    ["ChatFontNormal"] = { font = CLEAR_FONT_CHAT, size = 14 * CF_SCALE, style = "OUTLINE" },
    ["ChatFontSmall"] = { font = CLEAR_FONT_CHAT, size = 13 * CF_SCALE, style = "OUTLINE" },

    -- 任务字体
    ["QuestTitleFont"] = { font = CLEAR_FONT_QUEST, size = 15 * CF_SCALE, style = "", shadowColor = { 0, 0, 0 } },
    ["QuestTitleFontBlackShadow"] = { font = CLEAR_FONT_QUEST, size = 15 * CF_SCALE, style = "OUTLINE", color = { 1.0, 0.82, 0 }, shadowColor = { 0, 0, 0 } },
    ["QuestFont"] = { font = CLEAR_FONT_QUEST, size = 14 * CF_SCALE, style = "", color = { 0, 0, 0 } },
    ["QuestFontNormalSmall"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "", shadowColor = { 0.3, 0.18, 0 } },
    ["QuestFontHighlightHuge"] = { font = CLEAR_FONT_QUEST, size = 13 * CF_SCALE, style = "" },

    -- 物品文字字体
    ["ItemTextFontNormal"] = { font = CLEAR_FONT_QUEST, size = 14 * CF_SCALE, style = "OUTLINE" },

    -- 邮件字体
    ["MailTextFontNormal"] = { font = CLEAR_FONT_QUEST, size = 14 * CF_SCALE, style = "", color = { 0.18, 0.12, 0.06 } },

    -- 法术字体
    ["SubSpellFont"] = { font = CLEAR_FONT_QUEST, size = 12 * CF_SCALE, style = "", color = { 0.35, 0.2, 0 } },

    -- 对话框按钮字体
    ["DialogButtonNormalText"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "OUTLINE" },
    ["DialogButtonHighlightText"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "OUTLINE" },

    -- 区域文字字体
    ["ZoneTextFont"] = { font = CLEAR_FONT, size = 32 * CF_SCALE, style = "THICKOUTLINE" },
    ["SubZoneTextFont"] = { font = CLEAR_FONT, size = 26 * CF_SCALE, style = "OUTLINE" },

    -- PVP 信息文字字体
    ["PVPInfoTextFont"] = { font = CLEAR_FONT, size = 20 * CF_SCALE, style = "OUTLINE" },

    -- 错误字体
    ["ErrorFont"] = { font = CLEAR_FONT, size = 17 * CF_SCALE, style = "OUTLINE", shadowColor = { 0, 0, 0, 0.25 }, shadowOffset = { 1, -1 } },

    -- 状态栏文字字体
    ["TextStatusBarText"] = { font = CLEAR_FONT_EXP, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["TextStatusBarTextLarge"] = { font = CLEAR_FONT_EXP, size = 14 * CF_SCALE, style = "OUTLINE" },

    -- 战斗日志字体
    ["CombatLogFont"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },

    -- 鼠标提示字体
    ["GameTooltipText"] = { font = CLEAR_FONT_ITEM, size = 13 * CF_SCALE, style = "" },
    ["GameTooltipTextSmall"] = { font = CLEAR_FONT_ITEM, size = 12 * CF_SCALE, style = "" },
    ["GameTooltipHeaderText"] = { font = CLEAR_FONT, size = 15 * CF_SCALE, style = "OUTLINE" },

    -- 世界地图字体
    ["WorldMapTextFont"] = { font = CLEAR_FONT, size = 30 * CF_SCALE, style = "THICKOUTLINE" },

    -- Invoice字体
    ["InvoiceTextFontNormal"] = { font = CLEAR_FONT_QUEST, size = 13 * CF_SCALE, style = "", color = { 0.18, 0.12, 0.06 } },
    ["InvoiceTextFontSmall"] = { font = CLEAR_FONT_QUEST, size = 11 * CF_SCALE, style = "", color = { 0.18, 0.12, 0.06 } },

    -- 战斗文字字体
    ["CombatTextFont"] = { font = CLEAR_FONT_DAMAGE, size = 25 * CF_SCALE, style = "" },

    -- 字幕字体
    ["MovieSubtitleFont"] = { font = CLEAR_FONT, size = 24 * CF_SCALE, style = "OUTLINE", color = { 1.0, 0.78, 0 } },

    -- 成就字体
    ["AchievementPointsFont"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "" },
    ["AchievementPointsFontSmall"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "" },
    ["AchievementDescriptionFont"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "" },
    ["AchievementCriteriaFont"] = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "" },
    ["AchievementDateFont"] = { font = CLEAR_FONT, size = 11 * CF_SCALE, style = "" },

    -- 载具状态栏文字
    ["VehicleMenuBarStatusBarText"] = { font = CLEAR_FONT, size = 15 * CF_SCALE, style = "OUTLINE", color = { 1.0, 1.0, 1.0 } },

    -- 焦点框字体
    ["FocusFontSmall"] = { font = CLEAR_FONT, size = 15 * CF_SCALE, style = "OUTLINE" },

    -- 玩家角色头像被命中指示器
    ["PlayerHitIndicator"] = { font = "Fonts/ARIALN.ttf", size = 30, style = "OUTLINE", shadowColor = { 0, 0, 0, 0.25 }, shadowOffset = { 1, -1 } },
}



-- =============================================================================
--  B. 应用字体设置的函数
-- =============================================================================

function ClearFont:ApplyFontSettings()
    -- 应用字体到字体对象
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

    -- 更新系统字体
    STANDARD_TEXT_FONT = CLEAR_FONT_CHAT
    UNIT_NAME_FONT = CLEAR_FONT
    NAMEPLATE_FONT = CLEAR_FONT

    -- 下拉菜单默认文本高度
    UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = 12 * CF_SCALE

    -- 更新聊天字体高度
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
--  C. 特殊UI元素数据
-- =============================================================================

local specialFontSettings = {
    PlayerName = {
        font = CLEAR_FONT,
        size = 12 * CF_SCALE,
        style = "OUTLINE",
        xOffset = 0,
        yOffset = 0,
        originalPos = nil,
        shadowColor = { 0, 0, 0, 1 },
        shadowOffset = { 1, -1 }
    },
    PlayerLevel = {
        font = CLEAR_FONT,
        size = 12 * CF_SCALE,
        style = "OUTLINE",
        xOffset = 0,
        yOffset = 0,
        originalPos = nil,
        shadowColor = { 0, 0, 0, 1 },
        shadowOffset = { 1, -1 }
    },
    TargetName = {
        font = CLEAR_FONT,
        size = 10 * CF_SCALE,
        style = "OUTLINE",
        xOffset = 0,
        yOffset = 0,
        originalPos = nil,
        shadowColor = { 0, 0, 0, 1 },
        shadowOffset = { 1, -1 }
    },
    TargetLevel = {
        font = CLEAR_FONT,
        size = 12 * CF_SCALE,
        style = "OUTLINE",
        xOffset = 0,
        yOffset = 0,
        originalPos = nil,
        shadowColor = { 0, 0, 0, 1 },
        shadowOffset = { 1, -1 }
    },
    ActionHotkey = {
        font = CLEAR_FONT,
        size = 15 * CF_SCALE,
        style = "OUTLINE",
        alpha = 1,
    },
    ClockText = {
        font = CLEAR_FONT,
        size = 8 * CF_SCALE,
        style = "",
        xOffset = 0,
        yOffset = 0,
        originalPos = nil,
        shadowColor = { 0, 0, 0, 1 },
        shadowOffset = { 1, -1 }
    },
}

-- 定义特殊字体处理钩子
local fontHooks = {
    PlayerName = {
        element = function() return PlayerFrame.name end,
        settings = specialFontSettings.PlayerName,
        apply = function(element, settings)
            if not element then return end
            
            -- 保存原始位置
            if not settings.originalPos then
                local point, relativeTo, relativePoint, xOfs, yOfs = element:GetPoint()
                settings.originalPos = {
                    point = point,
                    relativeTo = relativeTo,
                    relativePoint = relativePoint,
                    xOfs = xOfs or 0,
                    yOfs = yOfs or 0
                }
            end

            -- 应用字体设置
            element:SetFont(settings.font, settings.size, settings.style)
            element:ClearAllPoints()
            element:SetPoint(
                settings.originalPos.point,
                settings.originalPos.relativeTo,
                settings.originalPos.relativePoint,
                settings.originalPos.xOfs + settings.xOffset,
                settings.originalPos.yOfs + settings.yOffset
            )
            element:SetShadowColor(unpack(settings.shadowColor))
            element:SetShadowOffset(unpack(settings.shadowOffset))
        end
    },
    
    PlayerLevel = {
        element = function() return PlayerLevelText end,
        settings = specialFontSettings.PlayerLevel,
        apply = function(element, settings)
            -- 类似 PlayerName 的实现
        end
    },
    
    TargetName = {
        element = function() return TargetFrame.name end,
        settings = specialFontSettings.TargetName,
        apply = function(element, settings)
            -- 类似 PlayerName 的实现
        end
    },
    
    TargetLevel = {
        element = function() return TargetFrameTextureFrameLevelText end,
        settings = specialFontSettings.TargetLevel,
        apply = function(element, settings)
            -- 类似 PlayerName 的实现
        end
    },
    
    ClockText = {
        element = function() 
            local clockButton = _G["TimeManagerClockButton"]
            if not clockButton then return end
            local regions = {clockButton:GetRegions()}
            for _, region in ipairs(regions) do
                if region:GetObjectType() == "FontString" then
                    return region
                end
            end
        end,
        settings = specialFontSettings.ClockText,
        apply = function(element, settings)
            -- 时钟特殊实现
        end
    },
    
    ActionHotkey = {
        element = function() return true end, -- 特殊处理，返回true表示需要处理
        settings = specialFontSettings.ActionHotkey,
        apply = function(_, settings)
            -- 动作条特殊实现
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
                            hotkey:SetFont(settings.font, settings.size, settings.style)
                            hotkey:SetAlpha(settings.alpha)
                        end
                        if name and CanSetFont(name) then
                            name:SetFont(CLEAR_FONT, 8 * CF_SCALE, "OUTLINE")
                        end
                    end
                end
            end
        end
    }
}

-- 统一的特殊字体更新函数
function ClearFont:UpdateSpecialFonts()
    for hookName, hook in pairs(fontHooks) do
        local element = hook.element()
        if element then
            hook.apply(element, hook.settings)
        end
    end
    SaveSettings()
end

local function LoadSavedSettings()
    if ClearFontDB.fontSettings then
        for key, savedSettings in pairs(ClearFontDB.fontSettings) do
            if specialFontSettings[key] then
                for setting, value in pairs(savedSettings) do
                    specialFontSettings[key][setting] = value
                end
            end
        end
    end
    
    -- 直接更新字体
    UpdateActionBarFonts()
    UpdateClockFont()
end

-- 在设置更改的地方添加保存函数
local function SaveSettings()
    ClearFontDB.fontSettings = ClearFontDB.fontSettings or {}
    -- 保存所有特殊字体设置
    for key, settings in pairs(specialFontSettings) do
        ClearFontDB.fontSettings[key] = ClearFontDB.fontSettings[key] or {}
        for setting, value in pairs(settings) do
            -- 只保存需要的设置，跳过原始位置
            if setting ~= "originalPos" then
                ClearFontDB.fontSettings[key][setting] = value
            end
        end
    end
end

-- =============================================================================
--  D. 特殊UI元素更新函数
-- =============================================================================

-- 定义特殊UI元素的更新函数
local function UpdateClockFont()
    local clockButton = _G["TimeManagerClockButton"]
    if clockButton then
        local settings = specialFontSettings.ClockText
        local regions = { clockButton:GetRegions() }
        for _, region in ipairs(regions) do
            if region:GetObjectType() == "FontString" then
                -- 保存原始位置（如果还没有保存）
                if not settings.originalPos then
                    local point, relativeTo, relativePoint, xOfs, yOfs = region:GetPoint()
                    if point then
                        settings.originalPos = {
                            point = point,
                            relativeTo = relativeTo,
                            relativePoint = relativePoint,
                            xOfs = xOfs or 0,
                            yOfs = yOfs or 0
                        }
                    end
                end

                -- 应用字体设置
                region:SetFont(settings.font, settings.size, settings.style)

                -- 应用位置设置
                if settings.originalPos then
                    region:ClearAllPoints()
                    region:SetPoint(
                        settings.originalPos.point,
                        settings.originalPos.relativeTo,
                        settings.originalPos.relativePoint,
                        settings.originalPos.xOfs + settings.xOffset,
                        settings.originalPos.yOfs + settings.yOffset
                    )
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
            PlayerLevelText:SetPoint(point, relativeTo, relativePoint, (xOfs or 0) + FONT_X_OFFSET,
                (yOfs or 0) + FONT_Y_OFFSET)
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
            TargetFrameTextureFrameLevelText:SetPoint(point, relativeTo, relativePoint, (xOfs or 0) + FONT_X_OFFSET,
                (yOfs or 0) + FONT_Y_OFFSET)
        end
    end
end

-- 定义特殊更新的动作表
local specialUpdates = {
    {
        update_function = UpdateClockFont,
        events = { "PLAYER_ENTERING_WORLD", "ADDON_LOADED", "PLAYER_LOGIN" },
        delay = 0
    },
    {
        update_function = UpdatePlayerLevel,
        events = { "PLAYER_LEVEL_UP", "PLAYER_ENTERING_WORLD", "ADDON_LOADED", "UNIT_LEVEL", "PLAYER_LOGIN" },
        delay = 0
    },
    {
        update_function = UpdateTargetLevel,
        events = { "PLAYER_TARGET_CHANGED", "PLAYER_ENTERING_WORLD", "ADDON_LOADED", "PLAYER_LOGIN", "UNIT_LEVEL" },
        delay = 0
    },
    {
        update_function = UpdateActionBarFonts,
        events = { "PLAYER_LOGIN", "ACTIONBAR_SHOWGRID", "ACTIONBAR_HIDEGRID" },
        delay = 0
    },
}

-- 构建事件处理程序表
local eventHandlers = {}
for _, updateInfo in ipairs(specialUpdates) do
    for _, event in ipairs(updateInfo.events) do
        eventHandlers[event] = eventHandlers[event] or {}
        table.insert(eventHandlers[event], updateInfo)
    end
end

-- =============================================================================
--  F. 事件处理和初始化
-- =============================================================================

ClearFont:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" and ... == "ClearFont" then
        LoadSavedSettings()
        print("ClearFont loaded successfully")
    elseif event == "PLAYER_LOGIN" then
        -- 在玩家登录时应用所有字体设置
        C_Timer.After(0, function()
            ClearFont:ApplyFontSettings()
            ClearFont:UpdateSpecialFonts()
        end)
    elseif event == "PLAYER_ENTERING_WORLD" then
        -- 在进入世界时应用设置
        C_Timer.After(0, function()
            ClearFont:UpdateSpecialFonts()
        end)
    elseif event == "PLAYER_TARGET_CHANGED" or (event == "UNIT_HEALTH" and ... == "target") then
        -- 在目标改变或目标血量改变时应用设置
        C_Timer.After(0, function()
            ClearFont:UpdateSpecialFonts()
        end)
    elseif event == "PLAYER_LOGOUT" then
        -- 添加登出时保存
        SaveSettings()
    end
end)

-- 移除重复的事件注册，统一使用 eventHandlers
local events = {
    "PLAYER_ENTERING_WORLD",
    "ADDON_LOADED",
    "PLAYER_LOGIN",
    -- ... 其他事件
}

for _, event in ipairs(events) do
    ClearFont:RegisterEvent(event)
end
