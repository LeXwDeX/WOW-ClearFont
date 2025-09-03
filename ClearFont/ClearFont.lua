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

    -- 玩家和目标姓名以及等级数字
    ["PlayerName"] = { font = CLEAR_FONT, size =  12 * CF_SCALE, style = "OUTLINE"},
    ["PlayerLevelText"] = { font = CLEAR_FONT, size =  12 * CF_SCALE, style = "OUTLINE", offset = { x = 1, y = -2}},
    ["TargetFrame.TargetFrameContent.TargetFrameContentMain.Name"] = { font = CLEAR_FONT, size =  12 * CF_SCALE, style = "OUTLINE", offset = { x = 1, y = -1}},
    ["TargetFrame.TargetFrameContent.TargetFrameContentMain.LevelText"] = { font = CLEAR_FONT, size =  12 * CF_SCALE, style = "OUTLINE", offset = { x = 1, y = -3} },
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
--  资源中文名称映射与工具
-- =============================================================================
local resourceNameZh = {
    -- 主游戏字体
    ["GameFontNormal"] = "游戏字体-普通",
    ["GameFontHighlight"] = "游戏字体-高亮",
    ["GameFontNormalMed3"] = "游戏字体-中号",
    ["GameFontDisable"] = "游戏字体-禁用",
    ["GameFontGreen"] = "游戏字体-绿色",
    ["GameFontRed"] = "游戏字体-红色",
    ["GameFontBlack"] = "游戏字体-黑色",
    ["GameFontWhite"] = "游戏字体-白色",

    -- 小字体
    ["GameFontNormalSmall"] = "小字体-普通",
    ["GameFontHighlightSmall"] = "小字体-高亮",
    ["GameFontHighlightSmallOutline"] = "小字体-高亮描边",
    ["GameFontDisableSmall"] = "小字体-禁用",
    ["GameFontDarkGraySmall"] = "小字体-深灰",
    ["GameFontGreenSmall"] = "小字体-绿色",
    ["GameFontRedSmall"] = "小字体-红色",
    ["GameFontHighlightExtraSmall"] = "超小字体-高亮",

    -- 大/超大字体
    ["GameFontDisableLarge"] = "大字体-禁用",
    ["GameFontGreenLarge"] = "大字体-绿色",
    ["GameFontRedLarge"] = "大字体-红色",
    ["GameFontNormalHuge"] = "超大字体-普通",
    ["GameFontNormalHugeBlack"] = "超大字体-黑色",
    ["BossEmoteNormalHuge"] = "首领表情-超大",

    -- 数字字体
    ["NumberFontNormal"] = "数字-普通",
    ["NumberFontNormalYellow"] = "数字-黄色",
    ["NumberFontNormalSmall"] = "数字-小号",
    ["NumberFontNormalLarge"] = "数字-大号",
    ["NumberFontNormalSmallGray"] = "数字-小号灰",
    ["NumberFontNormalHuge"] = "数字-超大(伤害)",

    -- 聊天与任务
    ["ChatFontNormal"] = "聊天字体-普通",
    ["ChatFontSmall"] = "聊天字体-小号",
    ["QuestTitleFont"] = "任务标题",
    ["QuestTitleFontBlackShadow"] = "任务标题-描边",
    ["QuestFont"] = "任务正文",
    ["QuestFontNormalSmall"] = "任务-小号",
    ["QuestFontHighlightHuge"] = "任务-高亮",

    -- 面板与单位框体
    ["GroupFinderFrameGroupButton1Name"] = "地下城查找-按钮1名称",
    ["GroupFinderFrameGroupButton2Name"] = "地下城查找-按钮2名称",
    ["GroupFinderFrameGroupButton3Name"] = "地下城查找-按钮3名称",
    ["PlayerName"] = "玩家姓名文字",
    ["PlayerLevelText"] = "玩家等级文字",
    ["TargetFrame.TargetFrameContent.TargetFrameContentMain.Name"] = "目标姓名文字",
    ["TargetFrame.TargetFrameContent.TargetFrameContentMain.LevelText"] = "目标等级文字",

    -- 延迟：PVP面板
    ["PVPQueueFrameCategoryButton1.Name"] = "PVP分类按钮1名称",
    ["PVPQueueFrameCategoryButton2.Name"] = "PVP分类按钮2名称",
    ["PVPQueueFrameCategoryButton3.Name"] = "PVP分类按钮3名称",
}

local function TranslateResourceName(key)
    if resourceNameZh[key] then
        return resourceNameZh[key]
    end

    -- 针对带路径的对象，用箭头分隔便于阅读
    if string.find(key, "%.") then
        local readable = key:gsub("%.", " → ")
        return readable
    end

    -- 基于前缀的兜底翻译
    if key:find("^GameFont") then return "游戏字体: " .. key end
    if key:find("^NumberFont") then return "数字字体: " .. key end
    if key:find("^ChatFont") then return "聊天字体: " .. key end
    if key:find("^Quest") then return "任务字体: " .. key end
    if key:find("^GroupFinder") then return "地下城与团队: " .. key end
    if key:find("Player") or key:find("Target") then return "单位框体: " .. key end

    return key
end

local function BuildConfiguredResourceList()
    local list = {}
    for name, _ in pairs(fontConfigurations) do
        table.insert(list, { key = name, zh = TranslateResourceName(name), source = "即时" })
    end
    for addonName, tbl in pairs(delayedFontConfigs) do
        for name, _ in pairs(tbl) do
            local displayKey = addonName .. ": " .. name
            table.insert(list, { key = displayKey, zh = TranslateResourceName(name), source = "延迟" })
        end
    end
    table.sort(list, function(a, b) return a.zh < b.zh end)
    return list
end

-- =============================================================================
--  选项面板（展示已重新设计的资源）
-- =============================================================================
local optionsPanel
local optionsCategory -- Settings API 分类

local function CreateOptionsPanel()
    if optionsPanel then return end

    optionsPanel = CreateFrame("Frame", "ClearFontOptionsPanel", UIParent)
    optionsPanel.name = "ClearFont"

    local title = optionsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText("ClearFont 字体资源一览")

    local subtitle = optionsPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
    subtitle:SetText("以下为已由 ClearFont 重新设计的系统资源（含延迟应用项）：")

    local scrollFrame = CreateFrame("ScrollFrame", "ClearFontOptionsScroll", optionsPanel, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", subtitle, "BOTTOMLEFT", -4, -8)
    scrollFrame:SetPoint("BOTTOMRIGHT", optionsPanel, "BOTTOMRIGHT", -30, 16)

    local content = CreateFrame("Frame", nil, scrollFrame)
    content:SetSize(1, 1)
    scrollFrame:SetScrollChild(content)

    local items = BuildConfiguredResourceList()
    local lineHeight = 18
    local totalHeight = #items * lineHeight + 8
    content:SetSize(scrollFrame:GetWidth() - 20, totalHeight)

    local header = content:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    header:SetPoint("TOPLEFT", 8, -4)
    header:SetText("资源（中文） — 来源")

    for index, item in ipairs(items) do
        local line = content:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        line:SetPoint("TOPLEFT", 8, -4 - index * lineHeight)
        line:SetJustifyH("LEFT")
        line:SetText(string.format("%s  —  %s", item.zh, item.source))
    end

    -- 注册到设置/界面选项
    if Settings and Settings.RegisterCanvasLayoutCategory then
        local category = Settings.RegisterCanvasLayoutCategory(optionsPanel, "ClearFont")
        Settings.RegisterAddOnCategory(category)
        optionsCategory = category
    elseif InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(optionsPanel)
    end
end

local function OpenOptionsPanel()
    CreateOptionsPanel()
    if Settings and Settings.OpenToCategory and optionsCategory then
        Settings.OpenToCategory(optionsCategory.ID or optionsCategory)
    elseif InterfaceOptionsFrame_OpenToCategory then
        InterfaceOptionsFrame_OpenToCategory(optionsPanel)
        InterfaceOptionsFrame_OpenToCategory(optionsPanel) -- 两次调用以确保展开
    end
end

-- Slash 命令
SLASH_CLEARFONT1 = "/clearfont"
SLASH_CLEARFONT2 = "/cf"
SlashCmdList["CLEARFONT"] = function()
    OpenOptionsPanel()
end

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
                        isApplying = true
                        local result = originalSetFont(self, settings.font, settings.size, settings.style)
                        isApplying = false
                        return result
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
                            isApplying = true
                            self:SetFont(settings.font, settings.size, settings.style)
                            isApplying = false
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
