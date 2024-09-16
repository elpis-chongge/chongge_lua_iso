require("RogueBuild01_InsideStartChoiceWindowByName")
local RogueGameStartChoiceWindow = {}
local uis, contentPane, selectedCards, selectedTreasures, defaultSelectTabIndex
local CardItemRenderer = function(i, gcmp)
  local index = i + 1
  local card = gcmp:GetChild("Card")
  card.alpha = 0
  PlayUITrans(gcmp, "up", nil, i * 0.03)
  TimerUtil.setTimeout(i * 0.03, function()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LIST_MOVE)
  end)
  if index <= #selectedCards then
    local cardId = selectedCards[index]
    local cardData = CardData.GetCardDataById(cardId)
    UIUtil.ShowCardTips(cardData, card, nil, nil, HEAD_ICON_TYPE_ENUM.BANNER)
    ChangeUIController(card, "c1", TableData.GetConfig(cardId, "BaseCard").star - 1)
    ChangeUIController(card, "choice", 1)
  else
    ChangeUIController(card, "choice", 0)
  end
  card.onClick:Set(function()
    OpenWindow(WinResConfig.RogueGameStartChoiceCardListWindow.name, nil, selectedCards, true)
  end)
end
local TreasureItemRenderer = function(i, gcmp)
  PlayUITrans(gcmp, "up", nil, i * 0.03)
  local item = gcmp:GetChild("Item")
  local initialTreasures = RogueGameData.GetInitialTreasures()
  local treasureId = initialTreasures[i + 1]
  local conf = TableData.GetConfig(treasureId, "BaseRogueTreasure")
  local name = conf.name()
  local des = conf.des()
  local number = conf.number()
  local t_type = conf.type
  local t_level = conf.level
  local url = UIUtil.GetResUrl(conf.icon)
  UIUtil.SetText(item, name, "NameTxt")
  UIUtil.SetText(item, number, "IDTxt")
  ChangeUIController(item, "c1", t_level - 1)
  ChangeUIController(item:GetChild("Type"), "c1", t_type - 1)
  ChangeUIController(item:GetChild("Level"), "c1", t_level - 1)
  item:GetChild("PicLoader").url = url
  local list = item:GetChild("WordList")
  
  function list.itemRenderer(j, ggcmp)
    UIUtil.SetText(ggcmp, des, "EffectTxt")
  end
  
  list.numItems = 1
  item.onClick:Set(function()
    local k = table.keyof(selectedTreasures, treasureId)
    if k then
      table.remove(selectedTreasures, k)
      ChangeUIController(item, "choice", 0)
    else
      if #selectedTreasures >= RogueGameData.GetInitialNumTreasures() then
        local remove = table.remove(selectedTreasures, 1)
        local j = table.keyof(initialTreasures, remove)
        local o = uis.Main.ItemList:GetChildAt(j - 1):GetChild("Item")
        ChangeUIController(o, "choice", 0)
      end
      table.insert(selectedTreasures, treasureId)
      ChangeUIController(item, "choice", 1)
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_item_select")
    end
    local numTips = "(%s/%s)"
    uis.Main.Title.NumberTxt.text = string.format(numTips, #selectedTreasures, RogueGameData.GetInitialNumTreasures())
  end)
end

function RogueGameStartChoiceWindow.ReInitData()
end

function RogueGameStartChoiceWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameStartChoiceWindow.package, WinResConfig.RogueGameStartChoiceWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_InsideStartChoiceWindowUis(contentPane)
    defaultSelectTabIndex = bridgeObj.argTable[1] or 0
    RogueGameStartChoiceWindow.UpdateInfo()
    RogueGameStartChoiceWindow.InitBtn()
  end)
end

function RogueGameStartChoiceWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(12013, "BaseFeature").back_ground)
  selectedCards = {}
  selectedTreasures = {}
  local initialTreasures = RogueGameData.GetInitialTreasures()
  local itemlist = uis.Main.ItemList
  local cardlist = uis.Main.CardList
  uis.Main.c1Ctr.onChanged:Set(function()
    local index = uis.Main.c1Ctr.selectedIndex
    local selectionTips, numTips, nextBtnText = "", "(%s/%s)", ""
    if 0 == index then
      numTips = string.format(numTips, 0, RogueGameData.GetInitialNumTreasures())
      selectionTips = T(20366)
      nextBtnText = T(20437)
    else
      numTips = string.format(numTips, 0, RogueGameData.GetInitialNumCards())
      selectionTips = T(20367)
      nextBtnText = T(20439)
    end
    uis.Main.Title.WordTxt.text = selectionTips
    uis.Main.Title.NumberTxt.text = numTips
    UIUtil.SetText(uis.Main.NextBtn, nextBtnText, "WordTxt")
  end)
  local numTips = "(%s/%s)"
  uis.Main.Title.WordTxt.text = T(20366)
  uis.Main.Title.NumberTxt.text = string.format(numTips, 0, RogueGameData.GetInitialNumTreasures())
  uis.Main.c1Ctr.selectedIndex = defaultSelectTabIndex
  UIUtil.SetText(uis.Main.NextBtn, 0 == defaultSelectTabIndex and T(20437) or T(20439), "WordTxt")
  itemlist.itemRenderer = TreasureItemRenderer
  itemlist.numItems = #initialTreasures
  cardlist.itemRenderer = CardItemRenderer
  cardlist.numItems = RogueGameData.GetInitialNumCards()
  RogueGameMgr.UI_SetCommonBottomInfo(uis.Main.Botton.root)
  RogueGameMgr.UI_SetAssetList(uis.Main.AssetsList)
end

function RogueGameStartChoiceWindow.InitBtn()
  uis.Main.NextBtn.onClick:Set(function()
    if 0 == uis.Main.c1Ctr.selectedIndex then
      if selectedTreasures then
        if #selectedTreasures >= RogueGameData.GetInitialNumTreasures() then
          RogueGameService.ChooseRogueInitialTreasureReq(selectedTreasures, function(msg)
            uis.Main.c1Ctr.selectedIndex = 1
            RogueGameMgr.UI_SetCommonBottomInfo(uis.Main.Botton.root)
          end)
        else
          FloatTipsUtil.ShowWarnTips(T(20455))
        end
      end
    elseif selectedCards then
      if #selectedCards == RogueGameData.GetInitialNumCards() then
        RogueGameService.RecruitRogueInitialCardReq(selectedCards, function()
          OpenWindow(WinResConfig.RogueGameMapWindow.name, nil, true)
          UIMgr:CloseWindow(WinResConfig.RogueGameStartChoiceWindow.name)
        end)
      else
        FloatTipsUtil.ShowWarnTips(T(20456))
      end
    end
  end)
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RogueGameStartChoiceWindow.name)
  end)
end

function RogueGameStartChoiceWindow.OnShown()
  if UIMgr:IsShowFromHide(WinResConfig.RogueGameStartChoiceWindow.name) then
    local cardlist = uis.Main.CardList
    cardlist.numItems = RogueGameData.GetInitialNumCards()
    local numTips = "(%s/%s)"
    uis.Main.Title.NumberTxt.text = string.format(numTips, #selectedCards, RogueGameData.GetInitialNumCards())
  end
end

function RogueGameStartChoiceWindow.OnClose()
  uis = nil
  contentPane = nil
end

function RogueGameStartChoiceWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    uis.Main.AssetsList.numItems = 2
  end
end

return RogueGameStartChoiceWindow
