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
local NAMEPLATE_CASTBAR_SHADOW_COLOR = { 0, 0, 0, 1 }
local NAMEPLATE_CASTBAR_SHADOW_OFFSET = { x = 1, y = -1 }
local NAMEPLATE_CASTBAR_FONT_SCALE = CF_SCALE
local TARGET_SPELLBAR_FONT_DELTA = -1
local TARGET_SPELLBAR_SHADOW_COLOR = { 0, 0, 0, 1 }
local TARGET_SPELLBAR_SHADOW_OFFSET = { x = 1, y = -1 }

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

    -- 新版姓名板施法条字体
    ["SystemFont_NamePlateCastBar"] = {
        font = CLEAR_FONT,
        size = 10,
        style = "OUTLINE",
        shadowColor = NAMEPLATE_CASTBAR_SHADOW_COLOR,
        shadowOffset = NAMEPLATE_CASTBAR_SHADOW_OFFSET,
    },

    -- 插件数字（小地图插件收纳按钮）
    ["AddonCompartmentFrame.Text"] = { font = CLEAR_FONT, size = 11 * CF_SCALE, style = "", offset = { x = -1, y = 0 } },

    -- 小地图区域名称：Y 轴下移 1
    ["MinimapZoneText"] = { offset = { x = 0, y = -1 } },
    -- 小地图时间：Y 轴下移 1
    ["TimeManagerClockTicker"] = { offset = { x = 0, y = -1 } },
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
local hookedNamePlateCastBarFonts = false
local hookedTargetSpellBarFont = false

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
    if not settings.font or not settings.size then
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

local function AdjustFontSize(fontString, delta)
    if not fontString or not fontString.GetFont or not fontString.SetFont then
        return
    end

    local font, size, flags = fontString:GetFont()
    if not font or not size then
        return
    end

    local signature = font .. "|" .. tostring(size) .. "|" .. tostring(flags)
    if fontString.__ClearFontLastSignature == signature and fontString.__ClearFontLastDelta == delta then
        return
    end

    local newSize = size + delta
    if newSize <= 0 then
        return
    end

    fontString:SetFont(font, newSize, flags)
    fontString.__ClearFontLastSignature = font .. "|" .. tostring(newSize) .. "|" .. tostring(flags)
    fontString.__ClearFontLastDelta = delta
end

local function ApplyNamePlateCastBarFontString(fontString, baseHeight)
    if not fontString then
        return
    end

    if fontString.SetShadowColor then
        fontString:SetShadowColor(unpack(NAMEPLATE_CASTBAR_SHADOW_COLOR))
    end
    if fontString.SetShadowOffset then
        fontString:SetShadowOffset(NAMEPLATE_CASTBAR_SHADOW_OFFSET.x or 0, NAMEPLATE_CASTBAR_SHADOW_OFFSET.y or 0)
    end

    local height = baseHeight
    if not height and fontString.GetFont then
        local _, size = fontString:GetFont()
        height = size
    end
    if not height or not fontString.SetTextHeight then
        return
    end

    local targetHeight = height * NAMEPLATE_CASTBAR_FONT_SCALE
    if targetHeight <= 0 then
        return
    end

    if fontString.GetFont then
        local _, currentSize = fontString:GetFont()
        if currentSize ~= targetHeight then
            fontString:SetTextHeight(targetHeight)
        end
    else
        fontString:SetTextHeight(targetHeight)
    end
end

local function ApplyTargetSpellBarFontString(fontString, baseSize)
    if not fontString then
        return
    end

    if fontString.SetShadowColor then
        fontString:SetShadowColor(unpack(TARGET_SPELLBAR_SHADOW_COLOR))
    end
    if fontString.SetShadowOffset then
        fontString:SetShadowOffset(TARGET_SPELLBAR_SHADOW_OFFSET.x or 0, TARGET_SPELLBAR_SHADOW_OFFSET.y or 0)
    end

    local font, size, flags = fontString.GetFont and fontString:GetFont() or nil
    if not font or not size then
        return
    end

    local base = baseSize or fontString.__ClearFontTargetSpellBaseSize
    if not base then
        base = size
    end
    fontString.__ClearFontTargetSpellBaseSize = base

    local targetSize = base + TARGET_SPELLBAR_FONT_DELTA
    if targetSize <= 0 then
        return
    end

    if size ~= targetSize then
        fontString:SetFont(font, targetSize, flags)
    end
end

local function HookTargetSpellBarFontString(fontString)
    if not fontString or fontString.__ClearFontTargetSpellHooked then
        return
    end

    if fontString.SetFont then
        hooksecurefunc(fontString, "SetFont", function(self, _, size)
            ApplyTargetSpellBarFontString(self, size)
        end)
    end

    if fontString.SetFontObject then
        hooksecurefunc(fontString, "SetFontObject", function(self)
            self.__ClearFontTargetSpellBaseSize = nil
            ApplyTargetSpellBarFontString(self)
        end)
    end

    fontString.__ClearFontTargetSpellHooked = true
end

local function ApplySettingsToFontObject(fontObject, settings)
    if not fontObject then
        return
    end

    if settings.font and settings.size then
        local family = GetOrCreateFontFamily(settings)
        if family and fontObject.SetFontObject then
            fontObject:SetFontObject(family)
        elseif fontObject.SetFont then
            fontObject:SetFont(settings.font, settings.size, settings.style)
        end
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

local function ApplyNamePlateCastBarFonts(castBar, baseHeight)
    if not castBar then
        return
    end

    local resolvedHeight = baseHeight
    if not resolvedHeight and NamePlateSetupOptions then
        resolvedHeight = NamePlateSetupOptions.castBarFontHeight
    end

    ApplyNamePlateCastBarFontString(castBar.Text, resolvedHeight)
    ApplyNamePlateCastBarFontString(castBar.CastTargetNameText, resolvedHeight)
end

local function ApplyNamePlateCastBarFontsToExisting()
    if not NamePlateDriverFrame or not NamePlateDriverFrame.ForEachNamePlate then
        return
    end

    NamePlateDriverFrame:ForEachNamePlate(function(frame)
        if frame and frame.UnitFrame then
            ApplyNamePlateCastBarFonts(frame.UnitFrame.castBar)
        end
    end)
end

local function HookNamePlateCastBarFonts()
    if hookedNamePlateCastBarFonts then
        return
    end
    if not NamePlateCastingBarMixin or not NamePlateUnitFrameMixin then
        return
    end

    hooksecurefunc(NamePlateCastingBarMixin, "OnLoad", function(self)
        ApplyNamePlateCastBarFonts(self)
    end)

    hooksecurefunc(NamePlateUnitFrameMixin, "ApplyFrameOptions", function(self, setupOptions)
        local height = setupOptions and setupOptions.castBarFontHeight or nil
        ApplyNamePlateCastBarFonts(self.castBar, height)
    end)

    ApplyNamePlateCastBarFontsToExisting()
    hookedNamePlateCastBarFonts = true
end

local function HookTargetSpellBarFont()
    if hookedTargetSpellBarFont then
        return
    end
    if not TargetFrameMixin then
        return
    end

    local function ApplyTargetSpellBarFonts(spellbar)
        if not spellbar then
            return
        end
        ApplyTargetSpellBarFontString(spellbar.Text)
        ApplyTargetSpellBarFontString(spellbar.CastTargetNameText)
        HookTargetSpellBarFontString(spellbar.Text)
        HookTargetSpellBarFontString(spellbar.CastTargetNameText)
    end

    local function ApplyTargetSpellBarFontsToFrame(frame)
        if frame and frame.spellbar then
            ApplyTargetSpellBarFonts(frame.spellbar)
        end
    end

    local function ApplyTargetSpellBarFontsToExisting()
        ApplyTargetSpellBarFontsToFrame(TargetFrame)
        ApplyTargetSpellBarFontsToFrame(FocusFrame)
        if BossTargetFrameContainer and BossTargetFrameContainer.BossTargetFrames then
            for _, bossFrame in ipairs(BossTargetFrameContainer.BossTargetFrames) do
                ApplyTargetSpellBarFontsToFrame(bossFrame)
            end
        end
    end

    hooksecurefunc(TargetFrameMixin, "CreateSpellbar", function(self)
        ApplyTargetSpellBarFonts(self and self.spellbar)
    end)

    ApplyTargetSpellBarFontsToExisting()

    hookedTargetSpellBarFont = true
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
        HookNamePlateCastBarFonts()
        HookTargetSpellBarFont()
    elseif event == "ADDON_LOADED" and delayedFontConfigs[addon] then
        ApplyDelayedFontSettings(addon)
        TryResolvePendingFonts()
        TryResolveListFontConfigs()
        HookListFontConfigs()
        HookNamePlateCastBarFonts()
        HookTargetSpellBarFont()
    elseif event == "ADDON_LOADED" then
        TryResolvePendingFonts()
        TryResolveListFontConfigs()
        HookListFontConfigs()
        if addon == "Blizzard_NamePlates" then
            HookNamePlateCastBarFonts()
        end
        if addon == "Blizzard_UnitFrame" then
            HookTargetSpellBarFont()
        end
    end
end)
