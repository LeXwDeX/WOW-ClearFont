-- =============================================================================
--  A. ClearFont 框架 及为了以后代码的简洁而预先定义字体位置
--  你可以根据范例添加属于自己的字体
-- =============================================================================

ClearFont = CreateFrame("Frame", "ClearFont");

-- 指出在哪里寻找字体
local CLEAR_FONT_BASE = "Fonts\\";
-- 金币、堆叠、按键绑定等字体
local CLEAR_FONT_NUMBER = CLEAR_FONT_BASE .. "FRIZQT__.TTF";
-- 生命条、经验条上的字体
local CLEAR_FONT_EXP = CLEAR_FONT_BASE .. "ARIALN.TTF";
-- 任务说明和书信、石碑的正文字体
local CLEAR_FONT_QUEST = CLEAR_FONT_BASE .. "ARIALN.TTF";
-- 战斗伤害数值提示
local CLEAR_FONT_DAMAGE = CLEAR_FONT_BASE .. "ARIALN.TTF";
-- 游戏介面中的主要字体
local CLEAR_FONT = CLEAR_FONT_BASE .. "ARIALN.TTF";
--	物品、技能的说明字体
local CLEAR_FONT_ITEM = CLEAR_FONT_BASE .. "ARIALN.TTF";
--	聊天字体
local CLEAR_FONT_CHAT = CLEAR_FONT_BASE .. "ARIALN.TTF";

-- -----------------------------------------------------------------------------
-- 全局字体比例调整（当你觉得所有字体都太大或太小时调整这个参数）
--  范例：你想把所有字体缩小到80%，那麽可以将"1.0"改成"0.8"
-- -----------------------------------------------------------------------------

local GLOBAL_FONT_SCALE = 1.0

-- -----------------------------------------------------------------------------
-- 检查存在的字体并改变它们
-- -----------------------------------------------------------------------------

local function CanSetFont(object)
	return (
		type(object) == "table"
			and object.SetFont
			and object.IsObjectType
			and not object:IsObjectType("SimpleHTML")
		);
end

-- 设置字体函数
local function setFont(fontObject, fontSize, fontStyle)
    if CanSetFont(fontObject) then 
        fontObject:SetFont(CLEAR_FONT, fontSize * GLOBAL_FONT_SCALE, fontStyle); 
    end
end

-- =============================================================================
--  B. WOW用户介面设计
-- =============================================================================
--   这是**修改字体大小/特效**最重要的部分
--   主要的字体被最先列出，其馀部分字体按照字母表顺序排列
--   以下列出只包括 ClearFont 修改了的范例部分，并不是所有方面都会显示出来（范例：阴影）
-- -----------------------------------------------------------------------------
--  对于以下可用代码的解释
--   不带描边:		Font:SetFont(SOMETHING_TEXT_FONT, x * scale)
--   普通描边:		Font:SetFont(SOMETHING_TEXT_FONT, x * scale, "OUTLINE")
--   粗描边:		Font:SetFont(SOMETHING_TEXT_FONT, x * scale, "THICK,OUTLINE")
--   字体颜色:		Font:SetTextColor(r, g, b)
--   阴影颜色:		Font:SetShadowColor(r, g, b)
--   阴影位置:		Font:SetShadowOffset(x, y)
--   透明度:		Font:SetAlpha(x)
--
--  范例：			SetFont(CLEAR_FONT, 13 * CF_SCALE,"")
--   在括弧里的第一部分是(A.)中申明过的字体代号，第二部分是字体大小
-- =============================================================================


function ClearFont:ApplySystemFonts()

    -- 聊天泡泡
    STANDARD_TEXT_FONT = CLEAR_FONT_CHAT;

    -- 头像上的名字，漂浮文本（远处即可看见）
    UNIT_NAME_FONT = CLEAR_FONT;

    -- 头像上的名字，在姓名板上（NamePlate，按“V”后靠近目标，出现的血条）
    NAMEPLATE_FONT = CLEAR_FONT;

    -- 被攻击目标上方弹出的伤害指示（与插件SCT/DCT无关）
    DAMAGE_TEXT_FONT = CLEAR_FONT_DAMAGE;

    -- 下拉功能表字体大小（Note by Kirkburn）
    UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = 12 * GLOBAL_FONT_SCALE;

    -- 主游戏字体: 随处可见的主要的字体
    setFont(GameFontNormal, 14, "")
    setFont(GameFontHighlight, 14, "")

    -- 小字体：经常用小字体的地方，如角色属性面板，BUFF时间，宏标题
    setFont(GameFontNormalSmall, 12, "")
    setFont(GameFontHighlightSmall, 13, "THICK，OUTLINE")
    setFont(GameFontHighlightSmallOutline, 12, "THICK, OUTLINE")

    -- 大字体：标题
    setFont(GameFontNormalLarge, 15, "")
    setFont(GameFontHighlightLarge, 13, "")

    -- 巨大字体：Raid警报
    setFont(GameFontNormalHuge, 20, "")
    setFont(GameFontNormalHugeBlack, 20, "")

    -- Boss表情文字
    setFont(BossEmoteNormalHuge, 25, "")

    -- 数位字体: 拍卖行，金币，按键绑定，物品堆叠数量
    setFont(NumberFontNormal, 12, "")
    setFont(NumberFontNormalYellow, 12, "")
    setFont(NumberFontNormalSmall, 14, "OUTLINE")
    setFont(NumberFontNormalSmallGray, 14, "OUTLINE")

    -- 任务日志: 任务日志、书籍等
    setFont(QuestTitleFont, 15, "")
    setFont(QuestFont, 14, "")
    setFont(QuestFontNormalSmall, 13, "")
    setFont(QuestFontHighlight, 13, "")

    -- 物品信息: 那些"按右键阅读"的物品（任务物品的内容字体，比如可以携带的书籍、信件的副本等）
    setFont(ItemTextFontNormal, 15, "")

    -- 邮件
    setFont(MailTextFontNormal, 15, "")

    -- 技能：技能类型（被动、种族特长等）、技能等级
    setFont(SubSpellFont, 12, "")

    -- 对话方块按钮："同意"等字样
    setFont(DialogButtonNormalText, 13, "")
    setFont(DialogButtonHighlightText, 13, "")

    -- 区域切换显示：在萤幕中央通知
    setFont(ZoneTextFont, 32, "")
    setFont(SubZoneTextFont, 26, "")

    -- PvP信息：如“争夺中的领土”、“联盟领地”等
    setFont(PVPInfoTextFont, 20, "")

    -- 错误字体："另一个动作正在进行中"等字样
    setFont(ErrorFont, 14, "")

    -- 状态栏：头像框架中的数字（生命值、法力值/怒气值/能量值等），经验条（经验、声望等）
    setFont(TextStatusBarText, 10, "OUTLINE")
    setFont(TextStatusBarTextLarge, 13, "OUTLINE")

    -- 战斗纪录文字
    setFont(CombatLogFont, 14, "")

    -- 提示框（ToolTip）
    setFont(GameTooltipText, 13, "")
    setFont(GameTooltipTextSmall, 12, "")
    setFont(GameTooltipHeaderText, 15, "")

    -- 世界地图：位置标题
    setFont(WorldMapTextFont, 32, "")

    -- 发货单：拍卖行邮寄来的发货单
    setFont(InvoiceTextFontNormal, 13, "")
    setFont(InvoiceTextFontSmall, 11, "")

    -- 战斗文字: 暴雪内置战斗指示器
    setFont(CombatTextFont, 25, "")

    -- 影片字幕文字（New in WotLK/3.x）
    setFont(MovieSubtitleFont, 25, "")

    -- 成就系统（New in WotLK/3.x）
    setFont(AchievementPointsFont, 13, "")
    setFont(AchievementPointsFontSmall, 13, "")
    setFont(AchievementDescriptionFont, 12, "")
    setFont(AchievementCriteriaFont, 13, "")
    setFont(AchievementDateFont, 11, "")

    -- 新骑乘、车辆系统相关（待确认，New in WotLK/3.2+）
    setFont(VehicleMenuBarStatusBarText, 15, "")

    -- 焦点框架字体（待确认，New in CTM/4.0+）
    setFont(FocusFontSmall, 15, "")

end

-- =============================================================================
--  C. 每当一个插件载入时都重新载入的功能
--  他们真喜欢搞乱我的插件！
-- =============================================================================

ClearFont:SetScript("OnEvent",
	function()
		if (event == "ADDON_LOADED") then
			ClearFont:ApplySystemFonts()
		end
	end);

ClearFont:RegisterEvent("ADDON_LOADED");


-- =============================================================================
--  D. 第一次启动时应用以上设定
--  让球能够滚起来
-- =============================================================================

ClearFont:ApplySystemFonts()
