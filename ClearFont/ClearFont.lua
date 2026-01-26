-- =============================================================================
--  ClearFont 框架和字体配置
-- =============================================================================
local ClearFont = CreateFrame("Frame", "ClearFont")
local CLEAR_FONT_BASE = "Fonts/"
local CLEAR_FONT = CLEAR_FONT_BASE .. "ARKai_T.TTF"
local CLEAR_FONT_NUMBER = CLEAR_FONT_BASE .. "RIZQT_.TTF"
local CLEAR_FONT_EXP = CLEAR_FONT_BASE .. "ARIALN.TTF"
local CLEAR_FONT_QUEST = CLEAR_FONT_BASE .. "ARIALN.TTF"
local CLEAR_FONT_DAMAGE = CLEAR_FONT_BASE .. "ARKai_C.TTF"
local CLEAR_FONT_ITEM = CLEAR_FONT_BASE .. "ARHei.TTF"
local CLEAR_FONT_CHAT = CLEAR_FONT_BASE .. "ARHei.TTF"
local CF_SCALE = 0.9
local pairs = pairs       -- 用于迭代表的全局函数
local ipairs = ipairs     -- 用于迭代数组部分的全局函数
local unpack = unpack     -- 用于将表拆开成多个值的全局函数

-- =============================================================================
--  字体配置
--  样式说明
--  { "普通", "" },
--  { "轮廓", "OUTLINE" },
--  { "厚轮廓", "THICKOUTLINE" },
--  { "单色", "MONOCHROME" },
--  { "单色轮廓", "MONOCHROME,OUTLINE" },
--  { "单色厚轮廓", "MONOCHROME,THICKOUTLINE" }
-- =============================================================================
local fontConfigurations = {
    -- 格式：[FontObjectName] = {font = ..., size = ..., style = ..., color = {r, g, b, a}, shadowColor = {r, g, b, a}, shadowOffset = {x, y}, offset = { x = 1, y = -1 }}

    -- 主游戏字体
    ["GameFontNormal"]                   = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },
    ["GameFontHighlight"]                = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },
    ["GameFontNormalMed3"]               = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "OUTLINE", color = { 1.0, 0.82, 0 } },
    ["GameFontDisable"]                  = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE", color = { 0.5, 0.5, 0.5 } },
    ["GameFontGreen"]                    = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },
    ["GameFontRed"]                      = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },
    ["GameFontBlack"]                    = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },
    ["GameFontWhite"]                    = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "" },

    -- 小字体
    ["GameFontNormalSmall"]              = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "OUTLINE" },
    ["GameFontHighlightSmall"]           = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "" },
    ["GameFontHighlightSmallOutline"]    = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["GameFontDisableSmall"]             = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "OUTLINE", color = { 0.5, 0.5, 0.5 } },
    ["GameFontDarkGraySmall"]            = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "OUTLINE", color = { 0.35, 0.35, 0.35 } },
    ["GameFontGreenSmall"]               = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["GameFontRedSmall"]                 = { font = CLEAR_FONT, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["GameFontHighlightExtraSmall"]      = { font = CLEAR_FONT, size = 11 * CF_SCALE, style = "OUTLINE" },

    -- 大字体
    ["GameFontDisableLarge"]             = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "", color = { 0.5, 0.5, 0.5 } },
    ["GameFontGreenLarge"]               = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },
    ["GameFontRedLarge"]                 = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },

    -- 超大字体
    ["GameFontNormalHuge"]               = { font = CLEAR_FONT, size = 20 * CF_SCALE, style = "OUTLINE" },
    ["GameFontNormalHugeBlack"]          = { font = CLEAR_FONT, size = 20 * CF_SCALE, style = "OUTLINE" },
    ["BossEmoteNormalHuge"]              = { font = CLEAR_FONT, size = 25 * CF_SCALE, style = "OUTLINE" },

    -- 数字字体
    ["NumberFontNormal"]                 = { font = CLEAR_FONT_NUMBER, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["NumberFontNormalYellow"]           = { font = CLEAR_FONT_NUMBER, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["NumberFontNormalSmall"]            = { font = CLEAR_FONT_NUMBER, size = 11 * CF_SCALE, style = "OUTLINE" },
    ["NumberFontNormalLarge"]            = { font = CLEAR_FONT_NUMBER, size = 12 * CF_SCALE, style = "OUTLINE" },
    ["NumberFontNormalSmallGray"]        = { font = CLEAR_FONT_NUMBER, size = 11 * CF_SCALE, style = "OUTLINE" },
    ["NumberFontNormalHuge"]             = { font = CLEAR_FONT_DAMAGE, size = 15 * CF_SCALE, style = "OUTLINE" },

    -- 聊天字体
    ["ChatFontNormal"]                   = { font = CLEAR_FONT_CHAT, size = 14 * CF_SCALE, style = "OUTLINE" },
    ["ChatFontSmall"]                    = { font = CLEAR_FONT_CHAT, size = 13 * CF_SCALE, style = "OUTLINE" },

    -- 任务字体
    ["QuestTitleFont"]                   = { font = CLEAR_FONT_QUEST, size = 15 * CF_SCALE, style = "", shadowColor = { 0, 0, 0 } },
    ["QuestTitleFontBlackShadow"]        = { font = CLEAR_FONT_QUEST, size = 15 * CF_SCALE, style = "OUTLINE", color = { 1.0, 0.82, 0 }, shadowColor = { 0, 0, 0 } },
    ["QuestFont"]                        = { font = CLEAR_FONT_QUEST, size = 14 * CF_SCALE, style = "", color = { 0, 0, 0 } },
    ["QuestFontNormalSmall"]             = { font = CLEAR_FONT, size = 13 * CF_SCALE, style = "", shadowColor = { 0.3, 0.18, 0 } },
    ["QuestFontHighlightHuge"]           = { font = CLEAR_FONT_QUEST, size = 13 * CF_SCALE, style = "" },

    -- 玩家和目标姓名以及等级数字
    ["PlayerName"] = { font = CLEAR_FONT, size =  12 * CF_SCALE, style = "OUTLINE"},
    ["PlayerLevelText"] = { font = CLEAR_FONT, size =  12 * CF_SCALE, style = "OUTLINE", offset = { x = 1, y = -2}},
    ["TargetFrame.TargetFrameContent.TargetFrameContentMain.Name"] = { font = CLEAR_FONT, size =  12 * CF_SCALE, style = "OUTLINE", offset = { x = 1, y = -1}},
    ["TargetFrame.TargetFrameContent.TargetFrameContentMain.LevelText"] = { font = CLEAR_FONT, size =  12 * CF_SCALE, style = "OUTLINE", offset = { x = 1, y = -3} },
}

-- =============================================================================
--  列表型字体配置（动态创建按钮/条目）
-- =============================================================================
local listFontConfigurations = {
    {
        container = "LFGListFrame.CategorySelection",
        scanChildren = true,
        fontKeys = { "Label" },
        settings = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },
    },
    {
        container = "GroupFinderFrame",
        scanChildren = true,
        fontKeys = { "name", "Name" },
        settings = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },
    },
    {
        container = "PVPQueueFrame",
        listKey = "CategoryButtons",
        fontKey = "Name",
        settings = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },
    },
    {
        container = "HonorFrame.BonusFrame",
        scanChildren = true,
        fontKeys = { "Title" },
        settings = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },
    },
    {
        container = "TrainingGroundsFrame.BonusTrainingGroundList",
        scanChildren = true,
        fontKeys = { "Title" },
        settings = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },
    },
}

-- =============================================================================
--  延迟加载字体配置（需要等待特定插件加载）
-- =============================================================================
local delayedFontConfigs = {
    -- 竞技场队伍查找面板
    ["Blizzard_PVPUI"] = {
    },
}

-- =============================================================================
--  Hook系统函数
-- =============================================================================
local isApplying = false -- 防止递归调用
local FONT_ALPHABETS = { "roman", "korean", "simplifiedchinese", "traditionalchinese", "russian" }
local fontFamilyCache = {}
local fontObjectToSettings = {}
local hookedSetFont = {}
local hookedSetFontObject = {}
local fontFamilyIndex = 0
local pendingFontConfigurations = {}
local hookedListAddButton = false

-- 添加一个工具函数来获取嵌套对象
local function GetNestedObject(path)
    local parts = {strsplit(".", path)}
    local obj = _G[parts[1]]
    if not obj then return nil end
    for i = 2, #parts do
        obj = obj[parts[i]]
        if not obj then return nil end
    end
    return obj
end

local function GetFontObjectByName(fontName)
    if string.find(fontName, "%.") then
        return GetNestedObject(fontName)
    end
    return _G[fontName]
end

local function GetOrCreateFontFamily(settings)
    if not CreateFontFamily then
        return nil
    end

    local style = settings.style or ""
    local key = settings.font .. "|" .. tostring(settings.size) .. "|" .. style
    local family = fontFamilyCache[key]
    if family then
        return family
    end

    fontFamilyIndex = fontFamilyIndex + 1
    local name = "ClearFontFamily" .. fontFamilyIndex
    local members = {}
    for index, alphabet in ipairs(FONT_ALPHABETS) do
        members[index] = {
            alphabet = alphabet,
            file = settings.font,
            height = settings.size,
            flags = style,
        }
    end

    family = CreateFontFamily(name, members)
    fontFamilyCache[key] = family
    return family
end

local function ApplySettingsToFontObject(fontObject, settings)
    if not fontObject then
        return
    end

    local family = GetOrCreateFontFamily(settings)
    if family and fontObject.SetFontObject then
        fontObject:SetFontObject(family)
    elseif fontObject.SetFont then
        fontObject:SetFont(settings.font, settings.size, settings.style)
    end

    if settings.color and fontObject.SetTextColor then
        fontObject:SetTextColor(unpack(settings.color))
    end
    if settings.shadowColor and fontObject.SetShadowColor then
        fontObject:SetShadowColor(unpack(settings.shadowColor))
    end
    if settings.shadowOffset and fontObject.SetShadowOffset then
        fontObject:SetShadowOffset(settings.shadowOffset.x or 0, settings.shadowOffset.y or 0)
    end
    if settings.offset and fontObject.GetNumPoints and fontObject.GetPoint and fontObject.SetPoint then
        local numPoints = fontObject:GetNumPoints()
        if numPoints > 0 then
            local point, relativeTo, relativePoint, xOfs, yOfs = fontObject:GetPoint(1)
            fontObject:SetPoint(point, relativeTo, relativePoint,
                xOfs + (settings.offset.x or 0), yOfs + (settings.offset.y or 0))
        end
    end
end

local function EnsureHooks(fontObject)
    if fontObject.SetFont and not hookedSetFont[fontObject] then
        hooksecurefunc(fontObject, "SetFont", function(self)
            if isApplying then
                return
            end
            local hookSettings = fontObjectToSettings[self]
            if hookSettings then
                isApplying = true
                ApplySettingsToFontObject(self, hookSettings)
                isApplying = false
            end
        end)
        hookedSetFont[fontObject] = true
    end

    if fontObject.SetFontObject and not hookedSetFontObject[fontObject] then
        hooksecurefunc(fontObject, "SetFontObject", function(self)
            if isApplying then
                return
            end
            local hookSettings = fontObjectToSettings[self]
            if hookSettings then
                isApplying = true
                ApplySettingsToFontObject(self, hookSettings)
                isApplying = false
            end
        end)
        hookedSetFontObject[fontObject] = true
    end
end

local function ApplyFontConfig(configs, pending)
    for fontName, settings in pairs(configs) do
        local fontObject = GetFontObjectByName(fontName)
        if fontObject then
            fontObjectToSettings[fontObject] = settings
            EnsureHooks(fontObject)
            ApplySettingsToFontObject(fontObject, settings)
            if pending then
                pending[fontName] = nil
            end
        elseif pending then
            pending[fontName] = settings
        end
    end
end

local function ApplyListFontConfigEntry(entry, container)
    if not container then
        return false
    end

    local keys = entry.fontKeys or (entry.fontKey and { entry.fontKey }) or nil
    if not keys then
        return false
    end

    local function ApplyKeys(target)
        if not target then
            return
        end
        for _, key in ipairs(keys) do
            local fontObject = target[key]
            if fontObject then
                fontObjectToSettings[fontObject] = entry.settings
                EnsureHooks(fontObject)
                ApplySettingsToFontObject(fontObject, entry.settings)
            end
        end
    end

    if entry.includeSelf then
        ApplyKeys(container)
    end

    if entry.listKey then
        local list = container[entry.listKey]
        if not list then
            return false
        end
        for _, item in pairs(list) do
            ApplyKeys(item)
        end
        return true
    end

    if entry.scanChildren and type(container.GetChildren) == "function" then
        local children = { container:GetChildren() }
        for _, child in ipairs(children) do
            ApplyKeys(child)
        end
        return true
    end

    return false
end

local function TryResolveListFontConfigs()
    for _, entry in ipairs(listFontConfigurations) do
        local container = GetFontObjectByName(entry.container)
        ApplyListFontConfigEntry(entry, container)
    end
end

local function HookListFontConfigs()
    if hookedListAddButton then
        return
    end

    if type(LFGListCategorySelection_AddButton) == "function" then
        hooksecurefunc("LFGListCategorySelection_AddButton", function(self)
            for _, entry in ipairs(listFontConfigurations) do
                if entry.container == "LFGListFrame.CategorySelection" then
                    ApplyListFontConfigEntry(entry, self)
                end
            end
        end)
        hookedListAddButton = true
    end
end

local function TryResolvePendingFonts()
    if not next(pendingFontConfigurations) then
        return
    end

    local unresolved = {}
    for fontName, settings in pairs(pendingFontConfigurations) do
        local fontObject = GetFontObjectByName(fontName)
        if fontObject then
            fontObjectToSettings[fontObject] = settings
            EnsureHooks(fontObject)
            ApplySettingsToFontObject(fontObject, settings)
        else
            unresolved[fontName] = settings
        end
    end

    for fontName in pairs(pendingFontConfigurations) do
        pendingFontConfigurations[fontName] = nil
    end
    for fontName, settings in pairs(unresolved) do
        pendingFontConfigurations[fontName] = settings
    end
end

-- =============================================================================
--  应用字体设置
-- =============================================================================
function ClearFont:ApplyFontSettings()
    if isApplying then
        return
    end
    isApplying = true

    -- 应用常规字体配置
    ApplyFontConfig(fontConfigurations, pendingFontConfigurations)

    -- 更新系统字体
    STANDARD_TEXT_FONT = CLEAR_FONT_CHAT
    UNIT_NAME_FONT = CLEAR_FONT
    NAMEPLATE_FONT = "GameFontWhite"
    DAMAGE_TEXT_FONT = CLEAR_FONT_DAMAGE
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

    isApplying = false
end

-- =============================================================================
--  处理延迟加载的字体
-- =============================================================================
local function ApplyDelayedFontSettings(addonName)
    if delayedFontConfigs[addonName] then
        if isApplying then
            return
        end
        isApplying = true
        ApplyFontConfig(delayedFontConfigs[addonName], pendingFontConfigurations)
        isApplying = false
    end
end

-- =============================================================================
--  事件注册和处理
-- =============================================================================
ClearFont:RegisterEvent("PLAYER_LOGIN")
ClearFont:RegisterEvent("ADDON_LOADED")
ClearFont:SetScript("OnEvent", function(self, event, addon)
    if event == "PLAYER_LOGIN" then
        ClearFont:ApplyFontSettings()
        TryResolvePendingFonts()
        TryResolveListFontConfigs()
        HookListFontConfigs()
    elseif event == "ADDON_LOADED" and delayedFontConfigs[addon] then
        ApplyDelayedFontSettings(addon)
        TryResolvePendingFonts()
        TryResolveListFontConfigs()
        HookListFontConfigs()
    elseif event == "ADDON_LOADED" then
        TryResolvePendingFonts()
        TryResolveListFontConfigs()
        HookListFontConfigs()
    end
end)
