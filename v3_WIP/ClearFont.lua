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
local pairs = pairs
local unpack = unpack

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

    -- 地下城队友查找面板
    ["GroupFinderFrameGroupButton1Name"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },
    ["GroupFinderFrameGroupButton2Name"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },
    ["GroupFinderFrameGroupButton3Name"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },
    -- 目标等级数字
    ["TargetFrame.TargetFrameContent.TargetFrameContentMain.LevelText"] = { font = CLEAR_FONT, size =  10 * CF_SCALE, style = "OUTLINE", offset = { x = 0, y = -1} },
}

-- =============================================================================
--  延迟加载字体配置（需要等待特定插件加载）
-- =============================================================================
local delayedFontConfigs = {
    -- 竞技场队伍查找面板
    ["Blizzard_PVPUI"] = {
        ["PVPQueueFrameCategoryButton1.Name"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },
        ["PVPQueueFrameCategoryButton2.Name"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },
        ["PVPQueueFrameCategoryButton3.Name"] = { font = CLEAR_FONT, size = 14 * CF_SCALE, style = "OUTLINE" },
    },
}

-- =============================================================================
--  Hook系统函数
-- =============================================================================
local isApplying = false -- 防止递归调用

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

local function HookFontFunctions()
    -- Hook SetFont方法
    local function HookSetFont(object)
        if not object.SetFontHooked then
            local originalSetFont = object.SetFont
            object.SetFont = function(self, font, size, flags)
                if isApplying then
                    return originalSetFont(self, font, size, flags)
                end
                -- 查找对应的配置
                for fontName, settings in pairs(fontConfigurations) do
                    local fontObject
                    if string.find(fontName, "%.") then
                        fontObject = GetNestedObject(fontName)
                    else
                        fontObject = _G[fontName]
                    end
                    
                    if self == fontObject then
                        return originalSetFont(self, settings.font, settings.size, settings.style)
                    end
                end
                return originalSetFont(self, font, size, flags)
            end
            object.SetFontHooked = true
        end
    end

    -- Hook SetFontObject方法
    local function HookSetFontObject(object)
        if not object.SetFontObjectHooked then
            local originalSetFontObject = object.SetFontObject
            object.SetFontObject = function(self, fontObject)
                if isApplying then
                    return originalSetFontObject(self, fontObject)
                end
                local result = originalSetFontObject(self, fontObject)
                if type(fontObject) == "table" and fontObject.GetFont then
                    for fontName, settings in pairs(fontConfigurations) do
                        local targetObject
                        if string.find(fontName, "%.") then
                            targetObject = GetNestedObject(fontName)
                        else
                            targetObject = _G[fontName]
                        end
                        
                        if self == targetObject then
                            self:SetFont(settings.font, settings.size, settings.style)
                            break
                        end
                    end
                end
                return result
            end
            object.SetFontObjectHooked = true
        end
    end

    -- 遍历并Hook所有字体对象
    for fontName, _ in pairs(fontConfigurations) do
        local fontObject
        if string.find(fontName, "%.") then
            fontObject = GetNestedObject(fontName)
        else
            fontObject = _G[fontName]
        end
        
        if fontObject then
            if fontObject.SetFont then HookSetFont(fontObject) end
            if fontObject.SetFontObject then HookSetFontObject(fontObject) end
        end
    end
end

-- =============================================================================
--  应用字体设置
-- =============================================================================
function ClearFont:ApplyFontSettings()
    isApplying = true

    -- 应用常规字体配置
    for fontName, settings in pairs(fontConfigurations) do
        local fontObject
        if string.find(fontName, "%.") then
            -- 处理带点号的路径
            fontObject = GetNestedObject(fontName)
        else
            -- 处理普通的全局对象
            fontObject = _G[fontName]
        end

        if fontObject then
            if fontObject.SetFont then
                fontObject:SetFont(settings.font, settings.size, settings.style)
                if settings.color then
                    fontObject:SetTextColor(unpack(settings.color))
                end
                -- offset 处理逻辑
                if settings.offset then
                    -- 获取当前的所有锚点信息
                    local numPoints = fontObject:GetNumPoints()
                    if numPoints > 0 then
                        -- 只调整第一个锚点的偏移量
                        local point, relativeTo, relativePoint, xOfs, yOfs = fontObject:GetPoint(1)
                        fontObject:SetPoint(point, relativeTo, relativePoint, 
                            xOfs + (settings.offset.x or 0), yOfs + (settings.offset.y or 0))
                    end
                end
            end
        end
    end

    -- 更新系统字体
    STANDARD_TEXT_FONT = CLEAR_FONT_CHAT
    UNIT_NAME_FONT = CLEAR_FONT
    NAMEPLATE_FONT = CLEAR_FONT
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
        for fontPath, settings in pairs(delayedFontConfigs[addonName]) do
            -- 分解路径获取父对象和子组件
            local parent, child = strsplit(".", fontPath)
            local parentObj = _G[parent]
            -- 检查子组件是否存在
            if parentObj and parentObj[child] then
                if parentObj[child].SetFont then
                    parentObj[child]:SetFont(settings.font, settings.size, settings.style)
                end
            end
        end
    end
end

-- =============================================================================
--  事件注册和处理
-- =============================================================================
ClearFont:RegisterEvent("PLAYER_LOGIN")
ClearFont:RegisterEvent("ADDON_LOADED")
ClearFont:SetScript("OnEvent", function(self, event, addon)
    if event == "PLAYER_LOGIN" then
        HookFontFunctions()
        ClearFont:ApplyFontSettings()
    elseif event == "ADDON_LOADED" and delayedFontConfigs[addon] then
        ApplyDelayedFontSettings(addon)
    end
end)
