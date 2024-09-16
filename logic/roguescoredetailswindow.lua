require("RogueBuild01_ScoreDetailsWindowByName")
local RogueScoreDetailsWindow = {}
local uis, contentPane, jumpTb

function RogueScoreDetailsWindow.ReInitData()
end

function RogueScoreDetailsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueScoreDetailsWindow.package, WinResConfig.RogueScoreDetailsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_ScoreDetailsWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.ROGUE_SCORE)
    RogueScoreDetailsWindow.InitBtn()
    RogueScoreDetailsWindow.UpdateInfo()
  end)
end

function RogueScoreDetailsWindow.UpdateInfo()
  uis.Main.Title.WordTxt.text = T(1432)
  uis.Main.Title.TitleTxt.text = ActorData.GetName()
  uis.Main.Time.WordTxt.text = T(1433)
  uis.Main.Time.TimeTxt.text = TimeUtil.FormatDate("%Y/%m/%d %H:%M:%S", RogueData.record.endTime)
  uis.Main.Difficulty.DifficultyTxt.text = T(1434)
  local data = RogueScoreDetailsWindow.GetDifficultyTxt()
  if data then
    uis.Main.Difficulty.WordTxt.text = data.name()
  end
  uis.Main.Difficulty.NumberTxt.text = RogueData.record.difficultyLevel
  uis.Main.Layers.WordTxt.text = T(1435)
  local data = TableData.GetConfig(RogueData.record.chapterId, "BaseRogueChapter")
  if data and data.name then
    uis.Main.Layers.LayersTxt.text = data.name()
  end
  uis.Main.Score.NumberTxt.text = RogueData.record.score
  uis.Main.Score.WordTxt.text = T(1436)
  local cardList = uis.Main.CardList
  local cardInfos = RogueData.record.cardInfos
  
  function cardList.itemRenderer(i, cardItem)
    local info = cardInfos[i + 1]
    local item = cardItem:GetChild("Card")
    if info then
      local cardData = TableData.GetConfig(info.cardId, "BaseCard")
      if cardData then
        UIUtil.SetText(item, cardData.name(), "CardNameTxt")
        UIUtil.ShowStarList(item:GetChild("StarList"), {grade = -1}, cardData)
        UIUtil.SetHeadByFaceId(cardData.fashion_id, item:GetChild("CardBg"):GetChild("PicLoader"), HEAD_ICON_TYPE_ENUM.SQUARE)
      end
      RogueScoreDetailsWindow.ShowAttribute(item, info.attribLevels)
      ChangeUIController(item, "c1", 0)
    else
      ChangeUIController(item, "c1", 1)
    end
    item.alpha = 0
    PlayUITrans(cardItem, "up", nil, 0.08 * i)
  end
  
  cardList.numItems = math.max(#cardInfos, 8)
  uis.Main.Number1Txt.text = #cardInfos > 0 and #cardInfos or ""
  local treasureList = uis.Main.Item1List
  local treasureIds = RogueData.record.treasureIds
  
  function treasureList.itemRenderer(i, treasure)
    local item = treasure:GetChild("Item")
    if treasureIds[i + 1] then
      local treasureData = TableData.GetConfig(treasureIds[i + 1], "BaseRogueTreasure")
      if treasureData then
        ChangeUIController(item:GetChild("Level"), "c1", data.level)
        ChangeUIController(item:GetChild("Type"), "c1", data.type)
        ChangeUIController(item, "c1", data.level)
        UIUtil.SetText(item, treasureData.number(), "IDTxt")
        item:GetChild("PicLoader").url = UIUtil.GetResUrl(treasureData.icon)
        UIUtil.SetText(item, treasureData.name(), "NameTxt")
        treasure.onClick:Set(function()
          OpenWindow(WinResConfig.RogueGameItemTipsWindow.name, nil, treasureData.id, nil, true)
        end)
      end
      ChangeUIController(item, "c2", 0)
    else
      ChangeUIController(item, "c2", 1)
    end
    item.alpha = 0
    PlayUITrans(treasure, "up", nil, 0.08 * i)
  end
  
  treasureList.numItems = math.max(#treasureIds, 7)
  uis.Main.Number2Txt.text = #treasureIds > 0 and #treasureIds or ""
  local holyList = uis.Main.Item2List
  local holyIds = RogueData.record.holyIds
  
  function holyList.itemRenderer(i, holy)
    local item = holy:GetChild("Item")
    if holyIds[i + 1] then
      local holyData = TableData.GetConfig(holyIds[i + 1], "BaseRogueHoly")
      if holyData then
        UIUtil.SetText(item, holyData.number(), "IDTxt")
        item:GetChild("PicLoader").url = UIUtil.GetResUrl(holyData.icon)
        UIUtil.SetText(item, holyData.name(), "NameTxt")
        if holyData.card_id then
          local tempCardData = TableData.GetConfig(holyData.card_id, "BaseCard")
          if tempCardData then
            UIUtil.SetHeadByFaceId(tempCardData.fashion_id, item:GetChild("Head"):GetChild("HeadBg"):GetChild("PicLoader"), HEAD_ICON_TYPE_ENUM.RECT)
          end
          ChangeUIController(item, "c1", 1)
        else
          ChangeUIController(item, "c1", 0)
        end
        holy.onClick:Set(function()
          OpenWindow(WinResConfig.RogueGameUnlockHalidomTipsWindow.name, nil, {
            holyData.id
          }, true)
        end)
      end
      ChangeUIController(item, "c2", 0)
    else
      ChangeUIController(item, "c2", 1)
    end
    item.alpha = 0
    PlayUITrans(holy, "up", nil, 0.08 * i)
  end
  
  holyList.numItems = math.max(#holyIds, 5)
  uis.Main.Number3Txt.text = #holyIds > 0 and #holyIds or ""
end

function RogueScoreDetailsWindow.ShowAttribute(item, attribLevels)
  local id = {
    40000103,
    40000104,
    40000102
  }
  for i = 1, 3 do
    local attributeItem = item:GetChild("Attribute" .. i)
    ChangeUIController(attributeItem, "c1", i - 1)
    ChangeUIController(attributeItem, "c2", attribLevels[id[i]] or 0)
  end
end

function RogueScoreDetailsWindow.GetDifficultyTxt()
  local rogueThemeData = TableData.GetConfig(RogueData.record.themeId, "BaseRogueTheme")
  if rogueThemeData then
    local data = TableData.GetTable("BaseRogueDifficulty")
    for i, v in pairs(data) do
      if rogueThemeData.group_id == v.group_id and RogueData.record.difficultyLevel == v.level then
        return v
      end
    end
  end
end

function RogueScoreDetailsWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.RogueScoreDetailsWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.ROGUE_SCORE)
end

function RogueScoreDetailsWindow.OnClose()
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return RogueScoreDetailsWindow
