-- =============================================================================
--  A. ClearFont 框架和字体配置
-- =============================================================================

local ClearFont = CreateFrame("Frame", "ClearFont")

-- 添加保存配置的变量
ClearFontDB = ClearFontDB or {}

-- 字体配置
local CLEAR_FONT_BASE = "Fonts/"
local CLEAR_FONT = CLEAR_FONT_BASE .. "ARKai_T.TTF"
local CLEAR_FONT_ZDSZ = CLEAR_FONT_BASE .. "YHSZ.ttf"
local CLEAR_FONT_NUMBER = CLEAR_FONT_BASE .. "RIZQT_.TTF"
local CLEAR_FONT_EXP = CLEAR_FONT_BASE .. "ARIALN.TTF"
local CLEAR_FONT_QUEST = CLEAR_FONT_BASE .. "ARIALN.TTF"
local CLEAR_FONT_DAMAGE = CLEAR_FONT_BASE .. "ARKai_C.TTF"
local CLEAR_FONT_ITEM = CLEAR_FONT_BASE .. "ARHei.TTF"
local CLEAR_FONT_CHAT = CLEAR_FONT_BASE .. "ARHei.TTF"

-- 全局字体大小
local CF_SCALE = 0.9

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

-- 更新时钟字体
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

-- 更新动作条字体
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

    local settings = specialFontSettings.ActionHotkey

    for _, barName in ipairs(actionBars) do
        for i = 1, 12 do
            local button = _G[barName .. i]
            if button then
                local hotkey = _G[button:GetName() .. "HotKey"] -- 快捷键文字
                local name = _G[button:GetName() .. "Name"]     -- 技能名称文字
                if hotkey and CanSetFont(hotkey) then
                    hotkey:SetFont(settings.font, settings.size, settings.style)
                    hotkey:SetAlpha(settings.alpha)
                end
                if name and CanSetFont(name) then
                    name:SetFont(CLEAR_FONT, 8 * CF_SCALE, "OUTLINE") -- 技能/宏名称硬编码文字属性
                end
            end
        end
    end
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
        local FONT_X_OFFSET = 0
        local FONT_Y_OFFSET = 0
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
    local targetLevel = TargetFrameTextureFrameLevelText
    if targetLevel then
        local settings = specialFontSettings.TargetLevel
        
        -- 移除原有的所有脚本
        targetLevel:SetScript("OnShow", nil)
        targetLevel:SetScript("OnSizeChanged", nil)
        
        -- 设置字体
        targetLevel:SetFont(settings.font, settings.size, settings.style)
        
        -- 使用 SetPoint 的钩子来确保位置始终正确
        if not targetLevel.hooked then
            hooksecurefunc(targetLevel, "SetPoint", function(self, ...)
                if self.isSettingPoint then return end
                self.isSettingPoint = true
                
                -- 保存第一次的原始位置
                if not settings.originalPos then
                    local point, relativeTo, relativePoint, xOfs, yOfs = ...
                    settings.originalPos = {
                        point = point,
                        relativeTo = relativeTo,
                        relativePoint = relativePoint,
                        xOfs = xOfs or 0,
                        yOfs = yOfs or 0
                    }
                end
                
                -- 应用我们的自定义位置
                if settings.originalPos then
                    self:ClearAllPoints()
                    self:SetPoint(
                        settings.originalPos.point,
                        settings.originalPos.relativeTo,
                        settings.originalPos.relativePoint,
                        settings.originalPos.xOfs + settings.xOffset,
                        settings.originalPos.yOfs + settings.yOffset
                    )
                end
                
                self.isSettingPoint = false
            end)
            targetLevel.hooked = true
        end
        
        -- 应用阴影设置
        targetLevel:SetShadowColor(table.unpack(settings.shadowColor))
        targetLevel:SetShadowOffset(table.unpack(settings.shadowOffset))
        
        -- 强制更新位置
        if settings.originalPos then
            targetLevel:ClearAllPoints()
            targetLevel:SetPoint(
                settings.originalPos.point,
                settings.originalPos.relativeTo,
                settings.originalPos.relativePoint,
                settings.originalPos.xOfs + settings.xOffset,
                settings.originalPos.yOfs + settings.yOffset
            )
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
--  E. 特殊UI元素界面
-- =============================================================================
local function CreateConfigUI()
    -- 创建主框架
    local frame = CreateFrame("Frame", "ClearFontConfig", UIParent, "BasicFrameTemplateWithInset")
    frame:SetSize(400, 500)
    frame:SetPoint("CENTER")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:Hide()

    -- 修改主标题的位置和样式
    frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
    frame.title:SetPoint("TOPLEFT", 15, -5)
    frame.title:SetText("ClearFont 字体设置")

    -- 创建更紧凑的滚动框架
    local scrollFrame = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 10, -25)
    scrollFrame:SetPoint("BOTTOMRIGHT", -30, 40)

    local content = CreateFrame("Frame", nil, scrollFrame)
    content:SetSize(360, 800)
    scrollFrame:SetScrollChild(content)

    -- 字体设置部分
    local elements = {
        { name = "玩家名字", key = "PlayerName" },
        { name = "玩家等级", key = "PlayerLevel" },
        { name = "目标名字", key = "TargetName" },
        { name = "目标等级", key = "TargetLevel" }
    }

    local yOffset = 10
    for i, element in ipairs(elements) do
        -- 创建分组框架，减小高度
        local groupFrame = CreateFrame("Frame", nil, content)
        groupFrame:SetSize(340, 150)
        groupFrame:SetPoint("TOPLEFT", 10, -yOffset)

        -- 分类标题背景
        local headerBg = groupFrame:CreateTexture(nil, "BACKGROUND")
        headerBg:SetPoint("TOPLEFT", 0, 0)
        headerBg:SetPoint("TOPRIGHT", 0, 0)
        headerBg:SetHeight(24)
        headerBg:SetColorTexture(0.1, 0.1, 0.1, 0.5)

        -- 分类标题
        local header = groupFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        header:SetPoint("TOPLEFT", 10, -4)
        header:SetText(element.name)

        -- 字体样式标签
        local styleLabel = groupFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        styleLabel:SetPoint("TOPLEFT", 10, -35)
        styleLabel:SetText("字体样式")

        -- 字体样式下拉菜单
        local styleDropdown = CreateFrame("Frame", "ClearFont_" .. element.key .. "_StyleDropdown", groupFrame,
            "UIDropDownMenuTemplate")
        styleDropdown:SetPoint("TOPLEFT", 0, -55)

        local function Initialize(self, level)
            local info = UIDropDownMenu_CreateInfo()
            for _, style in ipairs(fontStyles) do
                info.text = style[1]
                info.value = style[2]
                info.checked = (specialFontSettings[element.key].style == style[2])
                info.func = function()
                    specialFontSettings[element.key].style = style[2]
                    UIDropDownMenu_SetText(styleDropdown, style[1])
                    ClearFont:UpdateSpecialFonts()
                    SaveSettings()
                end
                UIDropDownMenu_AddButton(info, level)
            end
        end

        UIDropDownMenu_Initialize(styleDropdown, Initialize)
        UIDropDownMenu_SetWidth(styleDropdown, 120)
        UIDropDownMenu_SetText(styleDropdown, "字体样式")

        -- 字体大小滑动条
        local sizeSlider = CreateFrame("Slider", nil, groupFrame, "OptionsSliderTemplate")
        sizeSlider:SetPoint("TOPLEFT", 20, -100)
        sizeSlider:SetWidth(310)
        sizeSlider:SetMinMaxValues(8, 30)
        sizeSlider:SetValue(specialFontSettings[element.key].size / CF_SCALE)
        sizeSlider:SetValueStep(1)
        sizeSlider.Text:SetText("字体大小")
        sizeSlider.Low:SetText("8")
        sizeSlider.High:SetText("30")
        sizeSlider:SetScript("OnValueChanged", function(self, value)
            specialFontSettings[element.key].size = value * CF_SCALE
            ClearFont:UpdateSpecialFonts()
            self.valueText:SetText(string.format("%.0f", value))
            SaveSettings()
        end)

        -- 当前值显示
        sizeSlider.valueText = groupFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        sizeSlider.valueText:SetPoint("TOP", sizeSlider, "BOTTOM", 0, 0)
        sizeSlider.valueText:SetText(string.format("%.0f", sizeSlider:GetValue()))

        -- X偏移滑动条
        local xOffsetSlider = CreateFrame("Slider", nil, groupFrame, "OptionsSliderTemplate")
        xOffsetSlider:SetPoint("TOPLEFT", 20, -140)
        xOffsetSlider:SetWidth(140)
        xOffsetSlider:SetMinMaxValues(-5, 5)
        xOffsetSlider:SetValue(0)
        xOffsetSlider:SetValueStep(0.01)
        xOffsetSlider.Text:SetText("X轴偏移")
        xOffsetSlider.Low:SetText("-5")
        xOffsetSlider.High:SetText("5")

        -- 创建数值显示
        xOffsetSlider.valueText = groupFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        xOffsetSlider.valueText:SetPoint("TOP", xOffsetSlider, "BOTTOM", 0, 0)
        xOffsetSlider.valueText:SetText("0.00")

        -- 设置值变化时的处理
        xOffsetSlider:SetScript("OnValueChanged", function(self, value)
            local settings = specialFontSettings[element.key]
            settings.xOffset = value
            self.valueText:SetText(string.format("%.2f", value))
            ClearFont:UpdateSpecialFonts()
            SaveSettings()
        end)

        -- Y偏移滑动条
        local yOffsetSlider = CreateFrame("Slider", nil, groupFrame, "OptionsSliderTemplate")
        yOffsetSlider:SetPoint("TOPLEFT", 190, -140)
        yOffsetSlider:SetWidth(140)
        yOffsetSlider:SetMinMaxValues(-5, 5)
        yOffsetSlider:SetValue(0)
        yOffsetSlider:SetValueStep(0.01)
        yOffsetSlider.Text:SetText("Y轴偏移")
        yOffsetSlider.Low:SetText("-5")
        yOffsetSlider.High:SetText("5")

        -- 创建数值显示
        yOffsetSlider.valueText = groupFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        yOffsetSlider.valueText:SetPoint("TOP", yOffsetSlider, "BOTTOM", 0, 0)
        yOffsetSlider.valueText:SetText("0.00")

        -- 设置值变化时的处理
        yOffsetSlider:SetScript("OnValueChanged", function(self, value)
            local settings = specialFontSettings[element.key]
            settings.yOffset = value
            self.valueText:SetText(string.format("%.2f", value))
            ClearFont:UpdateSpecialFonts()
            SaveSettings()
        end)

        yOffset = yOffset + 190 -- 减小每个分组之间的间距
    end

    -- 动作条热键配置组
    local hotkeyGroup = CreateFrame("Frame", nil, content)
    hotkeyGroup:SetSize(340, 150) -- 减小高度，因为移除了RGB滑动条
    hotkeyGroup:SetPoint("TOPLEFT", 10, -yOffset)

    -- 分类标题背景
    local headerBg = hotkeyGroup:CreateTexture(nil, "BACKGROUND")
    headerBg:SetPoint("TOPLEFT", 0, 0)
    headerBg:SetPoint("TOPRIGHT", 0, 0)
    headerBg:SetHeight(24)
    headerBg:SetColorTexture(0.1, 0.1, 0.1, 0.5)

    -- 分类标题
    local header = hotkeyGroup:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    header:SetPoint("TOPLEFT", 10, -4)
    header:SetText("动作条热键")

    -- 字体样式下拉菜单
    local styleDropdown = CreateFrame("Frame", "ClearFont_ActionHotkey_StyleDropdown", hotkeyGroup,
        "UIDropDownMenuTemplate")
    styleDropdown:SetPoint("TOPLEFT", 0, -35)

    local function Initialize(self, level)
        local info = UIDropDownMenu_CreateInfo()
        for _, style in ipairs(fontStyles) do
            info.text = style[1]
            info.value = style[2]
            info.checked = (specialFontSettings.ActionHotkey.style == style[2])
            info.func = function()
                specialFontSettings.ActionHotkey.style = style[2]
                UIDropDownMenu_SetText(styleDropdown, style[1])
                UpdateActionBarFonts()
            end
            UIDropDownMenu_AddButton(info, level)
        end
    end

    UIDropDownMenu_Initialize(styleDropdown, Initialize)
    UIDropDownMenu_SetWidth(styleDropdown, 120)
    UIDropDownMenu_SetText(styleDropdown, "字体样式")

    -- 字体大小滑动条
    local sizeSlider = CreateFrame("Slider", nil, hotkeyGroup, "OptionsSliderTemplate")
    sizeSlider:SetPoint("TOPLEFT", 20, -80)
    sizeSlider:SetWidth(310)
    sizeSlider:SetMinMaxValues(8, 30)
    sizeSlider:SetValue(specialFontSettings.ActionHotkey.size / CF_SCALE)
    sizeSlider:SetValueStep(1)
    sizeSlider.Text:SetText("字体大小")
    sizeSlider.Low:SetText("8")
    sizeSlider.High:SetText("30")

    sizeSlider:SetScript("OnValueChanged", function(self, value)
        specialFontSettings.ActionHotkey.size = value * CF_SCALE
        UpdateActionBarFonts()
        self.valueText:SetText(string.format("%d", value))
        SaveSettings()
    end)

    sizeSlider.valueText = hotkeyGroup:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    sizeSlider.valueText:SetPoint("TOP", sizeSlider, "BOTTOM", 0, 0)
    sizeSlider.valueText:SetText(string.format("%d", sizeSlider:GetValue()))

    -- 透明度滑动条
    local alphaSlider = CreateFrame("Slider", nil, hotkeyGroup, "OptionsSliderTemplate")
    alphaSlider:SetPoint("TOPLEFT", 20, -120)
    alphaSlider:SetWidth(310)
    alphaSlider:SetMinMaxValues(0, 100)
    alphaSlider:SetValue(specialFontSettings.ActionHotkey.alpha * 100)
    alphaSlider:SetValueStep(1)
    alphaSlider.Text:SetText("透明度")
    alphaSlider.Low:SetText("0")
    alphaSlider.High:SetText("100")

    alphaSlider:SetScript("OnValueChanged", function(self, value)
        specialFontSettings.ActionHotkey.alpha = value / 100
        -- 更新所有动作条热键的透明度
        local actionBars = {
            "ActionButton",              -- 主动作条
            "MultiBarBottomLeftButton",  -- 底部左动作条
            "MultiBarBottomRightButton", -- 底部右动作条
            "MultiBarRightButton",       -- 右侧动作条1
            "MultiBarLeftButton",        -- 右侧动作条2
            "MultiBar5Button",           -- 右侧动作条3
            "MultiBar6Button",           -- 右侧动作条4
            "MultiBar7Button"            -- 右侧动作条5
        }

        for _, barName in ipairs(actionBars) do
            for i = 1, 12 do
                local button = _G[barName .. i]
                if button then
                    local hotkey = _G[button:GetName() .. "HotKey"] -- 快捷键文字
                    if hotkey and CanSetFont(hotkey) then
                        hotkey:SetAlpha(value / 100)
                    end
                end
            end
        end

        self.valueText:SetText(string.format("%d", value))
        SaveSettings()
    end)

    alphaSlider.valueText = hotkeyGroup:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    alphaSlider.valueText:SetPoint("TOP", alphaSlider, "BOTTOM", 0, 0)
    alphaSlider.valueText:SetText(string.format("%d", alphaSlider:GetValue()))

    yOffset = yOffset + 160

    -- 时钟字体配置组
    local clockGroup = CreateFrame("Frame", nil, content)
    clockGroup:SetSize(340, 150)
    clockGroup:SetPoint("TOPLEFT", 10, -yOffset)

    -- 分类标题背景
    local headerBg = clockGroup:CreateTexture(nil, "BACKGROUND")
    headerBg:SetPoint("TOPLEFT", 0, 0)
    headerBg:SetPoint("TOPRIGHT", 0, 0)
    headerBg:SetHeight(24)
    headerBg:SetColorTexture(0.1, 0.1, 0.1, 0.5)

    -- 分类标题
    local header = clockGroup:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    header:SetPoint("TOPLEFT", 10, -4)
    header:SetText("时钟字体")

    -- 字体样式下拉菜单
    local styleDropdown = CreateFrame("Frame", "ClearFont_ClockText_StyleDropdown", clockGroup, "UIDropDownMenuTemplate")
    styleDropdown:SetPoint("TOPLEFT", 0, -35)

    local function Initialize(self, level)
        local info = UIDropDownMenu_CreateInfo()
        for _, style in ipairs(fontStyles) do
            info.text = style[1]
            info.value = style[2]
            info.checked = (specialFontSettings.ClockText.style == style[2])
            info.func = function()
                specialFontSettings.ClockText.style = style[2]
                UIDropDownMenu_SetText(styleDropdown, style[1])
                UpdateClockFont()
                SaveSettings()
            end
            UIDropDownMenu_AddButton(info, level)
        end
    end

    UIDropDownMenu_Initialize(styleDropdown, Initialize)
    UIDropDownMenu_SetWidth(styleDropdown, 120)
    UIDropDownMenu_SetText(styleDropdown, "字体样式")

    -- 字体大小滑动条
    local sizeSlider = CreateFrame("Slider", nil, clockGroup, "OptionsSliderTemplate")
    sizeSlider:SetPoint("TOPLEFT", 20, -80)
    sizeSlider:SetWidth(310)
    sizeSlider:SetMinMaxValues(6, 20)
    sizeSlider:SetValue(specialFontSettings.ClockText.size / CF_SCALE)
    sizeSlider:SetValueStep(1)
    sizeSlider.Text:SetText("字体大小")
    sizeSlider.Low:SetText("6")
    sizeSlider.High:SetText("20")

    sizeSlider:SetScript("OnValueChanged", function(self, value)
        specialFontSettings.ClockText.size = value * CF_SCALE
        UpdateClockFont()
        self.valueText:SetText(string.format("%d", value))
        SaveSettings()
    end)

    sizeSlider.valueText = clockGroup:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    sizeSlider.valueText:SetPoint("TOP", sizeSlider, "BOTTOM", 0, 0)
    sizeSlider.valueText:SetText(string.format("%d", sizeSlider:GetValue()))

    -- X偏移滑动条
    local xOffsetSlider = CreateFrame("Slider", nil, clockGroup, "OptionsSliderTemplate")
    xOffsetSlider:SetPoint("TOPLEFT", 20, -120)
    xOffsetSlider:SetWidth(140)
    xOffsetSlider:SetMinMaxValues(-5, 5)
    xOffsetSlider:SetValue(specialFontSettings.ClockText.xOffset)
    xOffsetSlider:SetValueStep(0.1)
    xOffsetSlider.Text:SetText("X轴偏移")
    xOffsetSlider.Low:SetText("-5")
    xOffsetSlider.High:SetText("5")

    xOffsetSlider:SetScript("OnValueChanged", function(self, value)
        specialFontSettings.ClockText.xOffset = value
        UpdateClockFont()
        self.valueText:SetText(string.format("%.1f", value))
        SaveSettings()
    end)

    xOffsetSlider.valueText = clockGroup:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    xOffsetSlider.valueText:SetPoint("TOP", xOffsetSlider, "BOTTOM", 0, 0)
    xOffsetSlider.valueText:SetText("0.0")

    -- Y偏移滑动条
    local yOffsetSlider = CreateFrame("Slider", nil, clockGroup, "OptionsSliderTemplate")
    yOffsetSlider:SetPoint("TOPLEFT", 190, -120)
    yOffsetSlider:SetWidth(140)
    yOffsetSlider:SetMinMaxValues(-5, 5)
    yOffsetSlider:SetValue(specialFontSettings.ClockText.yOffset)
    yOffsetSlider:SetValueStep(0.1)
    yOffsetSlider.Text:SetText("Y轴偏移")
    yOffsetSlider.Low:SetText("-5")
    yOffsetSlider.High:SetText("5")

    yOffsetSlider:SetScript("OnValueChanged", function(self, value)
        specialFontSettings.ClockText.yOffset = value
        UpdateClockFont()
        self.valueText:SetText(string.format("%.1f", value))
        SaveSettings()
    end)

    yOffsetSlider.valueText = clockGroup:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    yOffsetSlider.valueText:SetPoint("TOP", yOffsetSlider, "BOTTOM", 0, 0)
    yOffsetSlider.valueText:SetText("0.0")

    yOffset = yOffset + 180 -- 内容高度

    -- 调整内容框架的大小
    content:SetSize(360, yOffset + 20)

    -- 底部按钮样式优化
    local buttonHeight = 25
    local buttonWidth = 100
    local buttonSpacing = 10

    -- 重置按钮
    local resetButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    resetButton:SetSize(buttonWidth, buttonHeight)
    resetButton:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", buttonSpacing, buttonSpacing)
    resetButton:SetText("重置")
    resetButton:SetScript("OnClick", function()
        -- 重置所有设置到默认值
        for _, element in ipairs(elements) do
            specialFontSettings[element.key] = {
                font = CLEAR_FONT,
                size = 10 * CF_SCALE,
                style = "OUTLINE",
                xOffset = 0,
                yOffset = 0,
                shadowColor = { 0, 0, 0, 1 },
                shadowOffset = { 1, -1 }
            }
        end
        SaveSettings() -- 添加保存
        ClearFont:UpdateSpecialFonts()
        -- 重新加载界面
        frame:Hide()
        frame:Show()
    end)

    -- 应用按钮
    local applyButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    applyButton:SetSize(buttonWidth, buttonHeight)
    applyButton:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -buttonSpacing, buttonSpacing)
    applyButton:SetText("应用")
    applyButton:SetScript("OnClick", function()
        ClearFont:UpdateSpecialFonts()
    end)

    return frame
end

-- =============================================================================
--  F. 事件处理和初始化
-- =============================================================================

ClearFont:SetScript("OnEvent", function(self, event, addon)
    if event == "ADDON_LOADED" and addon == "ClearFont" then
        LoadSavedSettings()
        print("ClearFont loaded successfully")
        -- 初始化配置界面
        if not ClearFontConfig then
            ClearFontConfig = CreateConfigUI()
        end
    elseif event == "PLAYER_LOGIN" then
        -- 在玩家登录时应用所有字体设置
        C_Timer.After(0.1, function()
            ClearFont:ApplyFontSettings()
            ClearFont:UpdateSpecialFonts()
        end)
    elseif event == "PLAYER_ENTERING_WORLD" then
        -- 在进入世界时再次应用设置
        C_Timer.After(0.1, function()
            ClearFont:UpdateSpecialFonts()
        end)
    elseif event == "PLAYER_TARGET_CHANGED" then
        C_Timer.After(0, function()
            ClearFont:UpdateSpecialFonts()
        end)
    end
end)

-- 注册额外的事件
ClearFont:RegisterEvent("PLAYER_ENTERING_WORLD")
ClearFont:RegisterEvent("UNIT_LEVEL")
ClearFont:RegisterEvent("UNIT_TARGET")
ClearFont:RegisterEvent("ADDON_LOADED")
ClearFont:RegisterEvent("PLAYER_LOGIN")
ClearFont:RegisterEvent("PLAYER_TARGET_CHANGED")

-- 注册事件
for event in pairs(eventHandlers) do
    ClearFont:RegisterEvent(event)
end

-- =============================================================================
--  G. 特殊UI元素更新函数
-- =============================================================================

function ClearFont:UpdateSpecialFonts()
    -- 更新玩家名字
    local playerName = PlayerFrame.name
    if playerName then
        local settings = specialFontSettings.PlayerName

        -- 如果还没有记录原始位置，则记录
        if not settings.originalPos then
            local point, relativeTo, relativePoint, xOfs, yOfs = playerName:GetPoint()
            settings.originalPos = {
                point = point,
                relativeTo = relativeTo,
                relativePoint = relativePoint,
                xOfs = xOfs or 0,
                yOfs = yOfs or 0
            }
        end

        playerName:SetFont(settings.font, settings.size, settings.style)
        playerName:ClearAllPoints()
        -- 使用原始位置加上偏移值
        playerName:SetPoint(
            settings.originalPos.point,
            settings.originalPos.relativeTo,
            settings.originalPos.relativePoint,
            settings.originalPos.xOfs + settings.xOffset,
            settings.originalPos.yOfs + settings.yOffset
        )
        playerName:SetShadowColor(table.unpack(settings.shadowColor))
        playerName:SetShadowOffset(table.unpack(settings.shadowOffset))
    end

    -- 更新玩家等级
    local playerLevel = PlayerLevelText
    if playerLevel then
        local settings = specialFontSettings.PlayerLevel

        -- 如果还没有记录原始位置，则记录
        if not settings.originalPos then
            local point, relativeTo, relativePoint, xOfs, yOfs = playerLevel:GetPoint()
            settings.originalPos = {
                point = point,
                relativeTo = relativeTo,
                relativePoint = relativePoint,
                xOfs = xOfs or 0,
                yOfs = yOfs or 0
            }
        end

        playerLevel:SetFont(settings.font, settings.size, settings.style)
        playerLevel:ClearAllPoints()
        -- 使用原始位置加上偏移值
        playerLevel:SetPoint(
            settings.originalPos.point,
            settings.originalPos.relativeTo,
            settings.originalPos.relativePoint,
            settings.originalPos.xOfs + settings.xOffset,
            settings.originalPos.yOfs + settings.yOffset
        )
        playerLevel:SetShadowColor(table.unpack(settings.shadowColor))
        playerLevel:SetShadowOffset(table.unpack(settings.shadowOffset))
    end

    -- 更新目标名字
    local targetName = TargetFrame.name
    if targetName then
        local settings = specialFontSettings.TargetName

        -- 仅在第一次时保存原始位置
        if not settings.originalPos then
            local point, relativeTo, relativePoint, xOfs, yOfs = targetName:GetPoint(1) -- 重要：使用 GetPoint(1) 确保获取第一个锚点
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
        targetName:SetFont(settings.font, settings.size, settings.style)

        -- 仅当有原始位置时才重新设置位置
        if settings.originalPos then
            targetName:ClearAllPoints()
            targetName:SetPoint(
                settings.originalPos.point,
                settings.originalPos.relativeTo,
                settings.originalPos.relativePoint,
                settings.originalPos.xOfs + settings.xOffset,
                settings.originalPos.yOfs + settings.yOffset
            )
        end

        targetName:SetShadowColor(table.unpack(settings.shadowColor))
        targetName:SetShadowOffset(table.unpack(settings.shadowOffset))
    end

    -- 更新目标等级
    local targetLevel = TargetFrameTextureFrameLevelText
    if targetLevel then
        local settings = specialFontSettings.TargetLevel

        if not settings.originalPos then
            local point, relativeTo, relativePoint, xOfs, yOfs = targetLevel:GetPoint(1)
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
        targetLevel:SetFont(settings.font, settings.size, settings.style)

        -- 基于原始位置应用偏移
        if settings.originalPos then
            targetLevel:ClearAllPoints()
            targetLevel:SetPoint(
                settings.originalPos.point,
                settings.originalPos.relativeTo,
                settings.originalPos.relativePoint,
                settings.originalPos.xOfs + settings.xOffset,
                settings.originalPos.yOfs + settings.yOffset
            )
        end

        targetLevel:SetShadowColor(table.unpack(settings.shadowColor))
        targetLevel:SetShadowOffset(table.unpack(settings.shadowOffset))
    end

    -- 更新时钟字体
    UpdateClockFont()
end

-- =============================================================================
--  H. 斜杠命令支持
-- =============================================================================

SLASH_CLEARFONT1 = "/clearfont"
SlashCmdList["CLEARFONT"] = function(msg)
    if not ClearFontConfig then
        ClearFontConfig = CreateConfigUI()
    end
    ClearFontConfig:SetShown(not ClearFontConfig:IsShown())
end
