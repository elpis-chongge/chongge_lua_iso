require("RogueBuild01_ShopBuyWindowByName")
local RogueGameShopPurchaseWindow = {}
local uis, contentPane, treasureId

function RogueGameShopPurchaseWindow.ReInitData()
end

function RogueGameShopPurchaseWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameShopPurchaseWindow.package, WinResConfig.RogueGameShopPurchaseWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_ShopBuyWindowUis(contentPane)
    treasureId = bridgeObj.argTable[1]
    RogueGameShopPurchaseWindow.UpdateInfo()
    RogueGameShopPurchaseWindow.InitBtn()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_slide_single_show")
  end)
end

function RogueGameShopPurchaseWindow.UpdateInfo()
  RogueGameMgr.UI_SetAssetList(uis.Main.AssetsList)
  local panel = uis.Main.TipsRegion.BuyTips
  local conf = TableData.GetConfig(treasureId, "BaseRogueTreasure")
  panel.PicLoader.url = UIUtil.GetResUrl(conf.icon)
  panel.IDTxt.text = conf.number()
  panel.NameTxt.text = conf.name()
  local t_type, t_level = conf.type, conf.level
  local wordlist = panel.WordList
  
  function wordlist.itemRenderer(i, gcmp)
    UIUtil.SetText(gcmp, conf.des(), "EffectTxt")
    UIUtil.SetText(gcmp, conf.des_detail(), "WordTxt")
  end
  
  wordlist.numItems = 1
  panel.Type.c1Ctr.selectedIndex = t_type - 1
  panel.Level.c1Ctr.selectedIndex = t_level - 1
  local chapterInfo = RogueGameData.GetChapterInfo()
  local node = chapterInfo.curNode
  local priceMap = node.shopTreasure2Prices
  local price = priceMap[treasureId]
  local buyBtnText = T(20392)
  if RogueGameMgr.HasTreasure(treasureId) then
    panel.c1Ctr.selectedIndex = 2
  else
    local tokensCnt = RogueGameMgr.GetCurrentThemeTokensCount()
    local enough = price <= tokensCnt
    local themeInfo = RogueGameData.GetThemeInfo()
    local themeConf = TableData.GetConfig(themeInfo.themeId, "BaseRogueTheme")
    local itemConf = TableData.GetConfig(themeConf.tokens_item, "BaseItem")
    panel.c1Ctr.selectedIndex = enough and 0 or 1
    if not enough then
      buyBtnText = T(81, itemConf.name())
    end
  end
  local result, halidomConf = RogueGameMgr.IsTriggerHalidom(treasureId, true)
  panel.c2Ctr.selectedIndex = result and 1 or 0
  if result then
    uis.Main.TipsRegion.BuyTips.LookBtn.onClick:Set(function()
      uis.Main.TipsRegion.c1Ctr.selectedIndex = 1
      panel.c2Ctr.selectedIndex = 0
    end)
    local halidomPanel = uis.Main.TipsRegion.SacredTips
    halidomPanel.IDTxt.text = halidomConf.number()
    halidomPanel.NameTxt.text = halidomConf.name()
    if "number" == type(halidomConf.card_id) then
      local cardConf = TableData.GetConfig(halidomConf.card_id, "BaseCard")
      halidomPanel.WordTxt.text = T(1417, cardConf.name())
    else
      halidomPanel.WordTxt.text = ""
    end
    halidomPanel.PicLoader.url = UIUtil.GetResUrl(halidomConf.icon)
    local exclusive = "number" == type(halidomConf.card_id)
    local activatedConditionText = T(1415)
    halidomPanel.Head.root.visible = exclusive
    if exclusive then
      local cardId = halidomConf.card_id
      local cardConf = TableData.GetConfig(cardId, "BaseCard")
      UIUtil.SetHeadByFaceId(cardConf.fashion_id, halidomPanel.Head.HeadBg.PicLoader, HEAD_ICON_TYPE_ENUM.RECT)
    end
    halidomPanel.Condition.WordTxt.text = activatedConditionText
    local list = halidomPanel.Condition.ItemList
    local unlock_condition = halidomConf.unlock_condition
    
    function list.itemRenderer(j, ggcmp)
      local loader = ggcmp:GetChild("PicLoader")
      local numberTxt = ggcmp:GetChild("NumberTxt")
      local str = unlock_condition[j + 1]
      local splits = Split(str, ":")
      local num = tonumber(splits[1])
      local ownCnt, needCnt = 0, 0
      if 1 == num then
        local t_type = tonumber(splits[2])
        local t_level = tonumber(splits[3])
        local cnt = tonumber(splits[4])
        ownCnt = #RogueGameMgr.GetTreasureByType_Level(t_type, t_level)
        needCnt = cnt
        local tbl = TableData.GetTable("BaseRogueTreasureType")
        for _, v in pairs(tbl) do
          if v.type == t_type and v.level == t_level then
            loader.url = UIUtil.GetResUrl(v.icon)
            break
          end
        end
        ChangeUIController(ggcmp, "c1", 1)
        ChangeUIController(ggcmp, "c2", 0)
      elseif 2 == num then
        local treasureId = tonumber(splits[2])
        local treasureConf = TableData.GetConfig(treasureId, "BaseRogueTreasure")
        ownCnt = RogueGameMgr.HasTreasure(treasureId) and 1 or 0
        needCnt = 1
        loader.url = UIUtil.GetResUrl(treasureConf.icon)
        ChangeUIController(ggcmp, "c1", 0)
        ChangeUIController(ggcmp, "c2", 1)
        UIUtil.SetText(ggcmp, treasureConf.number(), "NumberTxt")
      end
      local text
      if ownCnt < needCnt then
        text = string.format("[color=#ff6678]%s[/color]/%s", ownCnt, needCnt)
      else
        text = string.format("%s/%s", ownCnt, needCnt)
      end
      numberTxt.text = text
    end
    
    list.numItems = #unlock_condition
    list = halidomPanel.WordList
    
    function list.itemRenderer(j, ggcmp)
      UIUtil.SetText(ggcmp, halidomConf.des(), "EffectTxt")
      UIUtil.SetText(ggcmp, halidomConf.des_detail(), "WordTxt")
    end
    
    list.numItems = 1
  end
  local lookBtnText = T(20394)
  UIUtil.SetText(uis.Main.TipsRegion.BuyTips.BuyBtn, buyBtnText, "WordTxt")
  UIUtil.SetText(uis.Main.TipsRegion.BuyTips.LookBtn, lookBtnText, "WordTxt")
  UIUtil.SetText(uis.Main.TipsRegion.BuyTips.BuyBtn:GetChild("Spend"), string.format("-%s", price), "NumberTxt")
  UIUtil.SetText(uis.Main.TipsRegion.BuyTips.Get.root, T(1416), "WordTxt")
end

function RogueGameShopPurchaseWindow.InitBtn()
  local close_purchase_win = function()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_slide_single_off")
    UIMgr:CloseWindow(WinResConfig.RogueGameShopPurchaseWindow.name)
  end
  uis.Main.TipsRegion.BuyTips.CloseBtn.onClick:Set(close_purchase_win)
  uis.Main.TipsRegion.BuyTips.BuyBtn.onClick:Set(function()
    local chapterInfo = RogueGameData.GetChapterInfo()
    local node = chapterInfo.curNode
    local priceMap = node.shopTreasure2Prices
    local price = priceMap[treasureId]
    local tokensCnt, token_item_id = RogueGameMgr.GetCurrentThemeTokensCount()
    local enough = price <= tokensCnt
    if enough then
      RogueGameService.BuyRogueNodeShopTreasureReq(treasureId, close_purchase_win)
    else
      FloatTipsUtil.ShowWarnTips(T(81, TableData.GetConfig(token_item_id, "BaseItem").name()))
    end
  end)
end

function RogueGameShopPurchaseWindow.OnClose()
  uis = nil
  contentPane = nil
end

return RogueGameShopPurchaseWindow
