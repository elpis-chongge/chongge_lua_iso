require("RogueBuild01_InsideEndDetailsWindowByName")
local RogueGameSettlementWindow = {}
local uis, contentPane, settlementInfo, rogueRecord, themeInfo
local STRENGTHENABLE_ATTR = {
  CardAttribute.GetIdByName(ATTR_ENUM.atk),
  CardAttribute.GetIdByName(ATTR_ENUM.def),
  CardAttribute.GetIdByName(ATTR_ENUM.max_hp)
}
local DETAILS_INFO_LOOKUP = {
  {
    key = ProtoEnum.ROGUE_STAT.LAYER_COUNT,
    text = T(20407),
    ctrl = 0
  },
  {
    key = ProtoEnum.ROGUE_STAT.TOTAL_NODES,
    text = T(20408),
    ctrl = 1
  },
  {
    key = ProtoEnum.ROGUE_STAT.TRIGGER_EVENT_COUNT,
    text = T(20409),
    ctrl = 2
  },
  {
    key = ProtoEnum.ROGUE_STAT.RECRUIT_COUNT,
    text = T(20410),
    ctrl = 3
  },
  {
    key = ProtoEnum.ROGUE_STAT.TREASURE_COUNT,
    text = T(20411),
    ctrl = 4
  },
  {
    key = ProtoEnum.ROGUE_STAT.NORMAL_BATTLE,
    text = T(20412),
    ctrl = 5
  },
  {
    key = ProtoEnum.ROGUE_STAT.ENCOUNTER_BATTLE,
    text = T(20413),
    ctrl = 6
  },
  {
    key = ProtoEnum.ROGUE_STAT.BOSS_BATTLE,
    text = T(20414),
    ctrl = 7
  },
  {
    key = ProtoEnum.ROGUE_STAT.TOTAL_TOKEN,
    text = T(20415),
    ctrl = 8
  },
  {
    key = ProtoEnum.ROGUE_STAT.TOTAL_ATTRIB_POINT,
    text = T(20416),
    ctrl = 9
  }
}
local RefreshSupplyPanel = function()
  local supplyPanel = uis.Main.Region1
  local wordlist = supplyPanel.Word.WordList
  local cardlist = supplyPanel.Card.CardList
  supplyPanel.Card.Type.c1Ctr.selectedIndex = 1
  local treasurelist = supplyPanel.Item1.ItemList
  supplyPanel.Item1.Type.c1Ctr.selectedIndex = 2
  local halidomlist = supplyPanel.Item2.ItemList
  supplyPanel.Item2.Type.c1Ctr.selectedIndex = 3
  local startTimestamp = rogueRecord.startTime
  local endTimestamp = rogueRecord.endTime
  local chapterId = rogueRecord.chapterId
  local playerName = ActorData.GetName()
  local duration = TimeUtil.FormatTime(endTimestamp - startTimestamp)
  local chapterConf = TableData.GetConfig(chapterId, "BaseRogueChapter")
  local chapterName = chapterConf and chapterConf.name and chapterConf.name() or "未配置" .. tostring(chapterId)
  local themeConf = TableData.GetConfig(themeInfo.themeId, "BaseRogueTheme")
  local difficultyConf = RogueMgr.GetDifficultyData(themeConf.group_id, themeInfo.curDifficultyLevel)
  local endDate = TimeUtil.FormatDate("%Y/%m/%d %H:%M:%S", endTimestamp)
  
  function wordlist.itemRenderer(i, gcmp)
    local content
    if rogueRecord.allPass then
      local endingId = settlementInfo.endingId
      local conf = TableData.GetConfig(endingId, "BaseRogueEnding")
      content = T(20422, playerName, duration, endDate, conf.name(), conf.des_detail())
    else
      content = T(20421, playerName, duration, endDate, string.format("%s·%s", difficultyConf.name(), chapterName))
    end
    UIUtil.SetText(gcmp, content, "WordTxt")
  end
  
  wordlist.numItems = 1
  cardlist:SetVirtual()
  local numCards = #rogueRecord.cardInfos
  
  function cardlist.itemRenderer(i, gcmp)
    local card = gcmp:GetChild("Card")
    local index = i + 1
    if index > 0 and index <= numCards then
      ChangeUIController(card, "c1", 0)
      local rogueCardInfo = rogueRecord.cardInfos[index]
      local attribLevelMap = rogueCardInfo.attribLevels
      for j = 1, 3 do
        local attrCmp = card:GetChild(string.format("Attribute%s", j))
        ChangeUIController(attrCmp, "c1", j - 1)
        local level = attribLevelMap and attribLevelMap[STRENGTHENABLE_ATTR[j]]
        ChangeUIController(attrCmp, "c2", level and level or 0)
      end
      local cardInfo = rogueCardInfo.info
      local loader = card:GetChild("CardBg"):GetChild("PicLoader")
      local fashionId = 0 == cardInfo.fashionId and cardInfo.fashion_id or cardInfo.fashionId
      local conf = TableData.GetConfig(rogueCardInfo.cardId, "BaseCard")
      UIUtil.SetHeadByFaceId(fashionId, loader, HEAD_ICON_TYPE_ENUM.SQUARE)
      local starList = card:GetChild("StarList")
      UIUtil.ShowStarList(starList, cardInfo, conf)
      UIUtil.SetText(card, conf.name(), "CardNameTxt")
    else
      ChangeUIController(card, "c1", 1)
    end
  end
  
  local round = Mathf.RoundToInt
  local min = round((cardlist.width + cardlist.columnGap) / (112 + cardlist.columnGap))
  cardlist.numItems = math.max(numCards, min)
  for i = 0, cardlist.numChildren - 1 do
    local child = cardlist:GetChildAt(i)
    local card = child:GetChild("Card")
    card.alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
  supplyPanel.Card.Type.NumberTxt.text = numCards
  treasurelist:SetVirtual()
  local numTreasures = #rogueRecord.treasureIds
  
  function treasurelist.itemRenderer(i, gcmp)
    local index = i + 1
    local item = gcmp:GetChild("Item")
    if index > 0 and index <= numTreasures then
      ChangeUIController(item, "c2", 0)
      local treasureId = rogueRecord.treasureIds[index]
      local conf = TableData.GetConfig(treasureId, "BaseRogueTreasure")
      ChangeUIController(item, "c1", conf.level - 1)
      ChangeUIController(item:GetChild("Level"), "c1", conf.level - 1)
      ChangeUIController(item:GetChild("Type"), "c1", conf.type - 1)
      UIUtil.SetText(item, conf.number(), "IDTxt")
      item:GetChild("PicLoader").url = UIUtil.GetResUrl(conf.icon)
      UIUtil.SetText(item, conf.name(), "NameTxt")
      item.onClick:Set(function()
        OpenWindow(WinResConfig.RogueGameItemTipsWindow.name, nil, treasureId, nil, true)
      end)
    else
      item.onClick:Clear()
      ChangeUIController(item, "c2", 1)
    end
  end
  
  min = round((treasurelist.width + treasurelist.columnGap) / (136 + treasurelist.columnGap))
  treasurelist.numItems = math.max(numTreasures, min)
  for i = 0, treasurelist.numChildren - 1 do
    local child = treasurelist:GetChildAt(i)
    local item = child:GetChild("Item")
    item.alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
  supplyPanel.Item1.Type.NumberTxt.text = numTreasures
  halidomlist:SetVirtual()
  local numHalidoms = #rogueRecord.holyIds
  
  function halidomlist.itemRenderer(i, gcmp)
    local item = gcmp:GetChild("Item")
    local index = i + 1
    if index > 0 and index <= numHalidoms then
      ChangeUIController(item, "c2", 0)
      local halidomId = rogueRecord.holyIds[index]
      local conf = TableData.GetConfig(halidomId, "BaseRogueHoly")
      UIUtil.SetText(item, conf.number(), "IDTxt")
      item:GetChild("PicLoader").url = UIUtil.GetResUrl(conf.icon)
      UIUtil.SetText(item, conf.name(), "NameTxt")
      if conf.card_id then
        local cardConf = TableData.GetConfig(conf.card_id, "BaseCard")
        if cardConf then
          UIUtil.SetHeadByFaceId(cardConf.fashion_id, item:GetChild("Head"):GetChild("HeadBg"):GetChild("PicLoader"), HEAD_ICON_TYPE_ENUM.RECT)
        end
        ChangeUIController(item, "c1", 1)
      else
        ChangeUIController(item, "c1", 0)
      end
      item.onClick:Set(function()
        OpenWindow(WinResConfig.RogueGameUnlockHalidomTipsWindow.name, nil, {halidomId}, true)
      end)
    else
      item.onClick:Clear()
      ChangeUIController(item, "c2", 1)
    end
  end
  
  min = round((halidomlist.width + halidomlist.columnGap) / (150 + halidomlist.columnGap))
  halidomlist.numItems = math.max(numHalidoms, min)
  for i = 0, halidomlist.numChildren - 1 do
    local child = halidomlist:GetChildAt(i)
    local item = child:GetChild("Item")
    item.alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
  supplyPanel.Item2.Type.NumberTxt.text = numHalidoms
end
local RefreshScorePanel = function()
  local scorePanel = uis.Main.Region2
  local scoreTitleText = T(1366)
  local difficultyWordText = T(20404)
  local difficultyText = T(1361)
  local scoreAdditivityTitleText = T(1371)
  local expPointText = T(20405)
  local talentPointText = T(20406)
  scorePanel.Score.WordTxt.text = scoreTitleText
  scorePanel.Score.NumberTxt.text = rogueRecord.score
  scorePanel.Difficulty.WordTxt.text = difficultyWordText
  scorePanel.Difficulty.Difficulty.WordTxt.text = difficultyText
  local themeConf = TableData.GetConfig(rogueRecord.themeId, "BaseRogueTheme")
  local difficultyConf
  local tbl = TableData.GetTable("BaseRogueDifficulty")
  for _, v in pairs(tbl) do
    if themeConf.group_id == v.group_id and rogueRecord.difficultyLevel == v.level then
      difficultyConf = v
    end
  end
  if difficultyConf then
    scorePanel.Difficulty.Difficulty.NameTxt.text = difficultyConf.name()
    scorePanel.Difficulty.Score.NumberTxt.text = T(1372, math.floor(difficultyConf.score_ratio / 100))
  end
  scorePanel.Difficulty.Score.WordTxt.text = scoreAdditivityTitleText
  local prevThemeInfo = RogueGameData.GetThemeInfo()
  local prevLv = prevThemeInfo.level
  local prevExp = prevThemeInfo.exp
  local deltaExp = settlementInfo.gainThemeExp
  local deltaTalentPoint
  local k = table.keyof(settlementInfo.rewards, themeConf.talent_item, "itemId")
  if k then
    deltaTalentPoint = settlementInfo.rewards[k].count
  else
    deltaTalentPoint = 0
  end
  local levelConf = TableData.GetConfig(themeInfo.themeId * 1000 + themeInfo.level, "BaseRogueLevel")
  local threshold = levelConf.next_exp
  scorePanel.Exp.Exp.ExpProgressBar.value = themeInfo.exp / threshold * 100
  scorePanel.Exp.Exp.WordTxt.text = expPointText
  scorePanel.Exp.Exp.NumberTxt.text = string.format("+%s", deltaExp)
  scorePanel.Exp.Exp.LevelTxt.text = T(1303, themeInfo.level)
  local tbl = TableData.GetTable("BaseRogueLevel")
  local themeId = themeInfo.themeId
  local buffer = {}
  for i, v in pairs(tbl) do
    local tempId = (v.id - v.level) / 1000
    if tempId == themeId then
      local phase = v.unlock_phase
      if not buffer[phase] then
        buffer[phase] = {minLevel = 999, maxLevel = -1}
      end
      buffer[phase].minLevel = math.min(v.level, buffer[phase].minLevel)
      buffer[phase].maxLevel = math.max(v.level, buffer[phase].maxLevel)
      if v.title then
        buffer[phase].title = v.title()
      end
    end
  end
  local curPhase, maxPhase = 0, 0
  local curLevel = themeInfo.level
  local unlockedLevel = RogueData.GetRogueInfo().themeUnlockLevel
  for phase, v in pairs(buffer) do
    if curLevel >= v.minLevel and curLevel <= v.maxLevel then
      curPhase = phase
    end
    maxPhase = math.max(maxPhase, phase)
  end
  local upgradable = curLevel < unlockedLevel
  local noRewards = not upgradable and curLevel >= buffer[curPhase].maxLevel
  scorePanel.Exp.Exp.c1Ctr.selectedIndex = upgradable and 0 or 1
  scorePanel.Exp.Exp.c2Ctr.selectedIndex = noRewards and 1 or 0
  if noRewards then
    local title = buffer[curPhase].title
    local content = T(20473, title)
    local parent = scorePanel.Exp.Exp.root
    local tipsTxt = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Text)
    local o = scorePanel.Exp.Exp.TipsTxt
    parent:AddChild(tipsTxt)
    tipsTxt:SetXY(o.x, o.y)
    tipsTxt.textFormat = o.textFormat
    tipsTxt.autoSize = o.autoSize
    tipsTxt.width = o.width
    tipsTxt.height = o.height
    tipsTxt.align = o.align
    tipsTxt.verticalAlign = o.verticalAlign
    tipsTxt.text = content
  end
  if not upgradable then
    scorePanel.Exp.Exp.MaxTxt.text = T(20479)
  end
  scorePanel.Exp.c1Ctr.selectedIndex = deltaTalentPoint > 0 and 0 or 1
  scorePanel.Exp.Talent.WordTxt.text = talentPointText
  scorePanel.Exp.Talent.NumberTxt.text = string.format("+%s", deltaTalentPoint)
  local cnt = #DETAILS_INFO_LOOKUP
  local firstPanelNumDetails = 5
  local infolist = scorePanel.Info1.InfoList
  
  function infolist.itemRenderer(i, gcmp)
    local item = DETAILS_INFO_LOOKUP[i + 1]
    local val = rogueRecord.stats[item.key] or 0
    UIUtil.SetText(gcmp, item.text, "WordTxt")
    UIUtil.SetText(gcmp, val, "NumberTxt")
    ChangeUIController(gcmp, "c1", item.ctrl)
  end
  
  infolist.numItems = firstPanelNumDetails
  infolist = scorePanel.Info2.InfoList
  
  function infolist.itemRenderer(i, gcmp)
    local item = DETAILS_INFO_LOOKUP[i + 1 + firstPanelNumDetails]
    local val = rogueRecord.stats[item.key] or 0
    UIUtil.SetText(gcmp, item.text, "WordTxt")
    UIUtil.SetText(gcmp, val, "NumberTxt")
    ChangeUIController(gcmp, "c1", item.ctrl)
  end
  
  infolist.numItems = cnt - firstPanelNumDetails
end

function RogueGameSettlementWindow.ReInitData()
end

function RogueGameSettlementWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameSettlementWindow.package, WinResConfig.RogueGameSettlementWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_InsideEndDetailsWindowUis(contentPane)
    settlementInfo = bridgeObj.argTable[1]
    RogueGameSettlementWindow.UpdateInfo()
    RogueGameSettlementWindow.InitBtn()
  end)
end

function RogueGameSettlementWindow.UpdateInfo()
  uis.Main.Title.WordTxt.text = T(20403)
  uis.Main.root:GetChild("BackGround"):GetChild("BackGroundLoader").url = UIUtil.GetResUrl(TableData.GetConfig(12012, "BaseFeature").back_ground)
  rogueRecord = settlementInfo.record
  themeInfo = settlementInfo.themeInfo
  RefreshSupplyPanel()
  RefreshScorePanel()
  local sureBtnText = T(129)
  UIUtil.SetText(uis.Main.Region2.Exp.ExitBtn, sureBtnText, "WordTxt")
end

function RogueGameSettlementWindow.InitBtn()
  uis.Main.Region2.Exp.ExitBtn.onClick:Set(function()
    UIMgr:CloseToWindow(WinResConfig.RogueWindow.name)
    RogueGameData.SetThemeInfo(themeInfo)
    RogueGameData.SetChapterInfo(nil)
    RogueGameData.SetCardInfoList(nil)
  end)
  uis.Main.NextBtn.visible = true
  uis.Main.LastBtn.visible = false
  uis.Main.NextBtn.onClick:Set(function()
    uis.Main.c1Ctr.selectedIndex = 1
    uis.Main.NextBtn.visible = false
    uis.Main.LastBtn.visible = true
  end)
  uis.Main.LastBtn.onClick:Set(function()
    uis.Main.c1Ctr.selectedIndex = 0
    uis.Main.NextBtn.visible = true
    uis.Main.LastBtn.visible = false
  end)
end

function RogueGameSettlementWindow.OnClose()
  uis = nil
  contentPane = nil
end

return RogueGameSettlementWindow
