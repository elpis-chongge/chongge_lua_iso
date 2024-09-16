require("RogueBuild01_InsideShopWindowByName")
local RogueGameShopWindow = {}
local uis, contentPane, rogueNode, selectedShopId, treasureIdList
local ShopTreasureItemRenderer = function(i, gcmp)
  local item = gcmp:GetChild("Item")
  item.alpha = 0
  PlayUITrans(gcmp, "up", nil, i * 0.03)
  local id = treasureIdList[i + 1]
  local conf = TableData.GetConfig(id, "BaseRogueTreasure")
  item:GetChild("PicLoader").url = UIUtil.GetResUrl(conf.icon)
  UIUtil.SetText(item, conf.number(), "IDTxt")
  UIUtil.SetText(item, conf.name(), "NameTxt")
  ChangeUIController(item:GetChild("Type"), "c1", conf.type - 1)
  ChangeUIController(item:GetChild("Level"), "c1", conf.level - 1)
  ChangeUIController(item, "c1", conf.level - 1)
  local triggerHaildom, halidomConf = RogueGameMgr.IsTriggerHalidom(id, true)
  if triggerHaildom then
    local loader = item:GetChild("PointItem"):GetChild("Bg"):GetChild("PicLoader")
    loader.url = UIUtil.GetResUrl(halidomConf.icon)
    ChangeUIController(item, "c2", 1)
  else
    ChangeUIController(item, "c2", 0)
  end
  local map = rogueNode.shopTreasure2Prices
  local freeTipsText = T(20398)
  local alreadyHas = T(1416)
  UIUtil.SetText(item, map[id], "PriceTxt")
  UIUtil.SetText(item, freeTipsText, "FreeTxt")
  UIUtil.SetText(item, alreadyHas, "HaveTxt")
  ChangeUIController(item, "c3", RogueGameMgr.HasTreasure(id) and 2 or 0)
  item.onClick:Set(function()
    uis.Main.OutBtn:GetController("c1").selectedIndex = 0
    OpenWindow(WinResConfig.RogueGameShopPurchaseWindow.name, nil, id)
  end)
end
local RefreshResetBtnStatus
local RefreshRogueShopRspCallback = function()
  uis.Main.ItemList:ScrollToView(0, false)
  RefreshResetBtnStatus()
end

function RefreshResetBtnStatus()
  local resetCnt = rogueNode.shopResetCount
  local cnt, token_item_id = RogueGameMgr.GetCurrentThemeTokensCount()
  local conf = TableData.GetConfig(rogueNode.nodeId, "BaseRogueNode")
  local splits = Split(conf.parameter, "|")
  local maxResetCnt = tonumber(splits[3])
  local resetCost = tonumber(splits[4])
  local remainResetCnt = maxResetCnt - resetCnt
  local costText = string.format("-%s", tostring(resetCost))
  local tokensEnough = cnt >= resetCost
  local resetable = remainResetCnt > 0
  UIUtil.SetText(uis.Main.ResetBtn:GetChild("Spend"), costText, "NumberTxt")
  local tokenName = TableData.GetConfig(token_item_id, "BaseItem").name()
  local resetBtnText = tokensEnough and T(20401) or T(81, tokenName)
  UIUtil.SetText(uis.Main.ResetBtn, resetBtnText, "WordTxt")
  ChangeUIController(uis.Main.ResetBtn, "c1", tokensEnough and 0 or 1)
  local remainCntText = string.format(resetable and "[color=#e6ff51]%s[/color]/%s" or "[color=#ff6678]%s[/color]/%s", remainResetCnt, maxResetCnt)
  uis.Main.Times.WordTxt.text = T(20402, remainCntText)
  uis.Main.ResetBtn.onClick:Set(function()
    uis.Main.OutBtn:GetController("c1").selectedIndex = 0
    if rogueNode.shopResetCount >= maxResetCnt then
      FloatTipsUtil.ShowWarnTips(T(7002213))
      return
    end
    local count, _ = RogueGameMgr.GetCurrentThemeTokensCount()
    if count < resetCost then
      FloatTipsUtil.ShowWarnTips(T(81, tokenName))
      return
    end
    RogueGameService.RefreshRogueNodeShopReq(RefreshRogueShopRspCallback)
  end)
end

local RefreshPanelInfo = function()
  treasureIdList = treasureIdList or {}
  table.clear(treasureIdList)
  for i, v in pairs(rogueNode.shopTreasure2Prices) do
    table.insert(treasureIdList, i)
  end
  table.sort(treasureIdList, function(x, y)
    local conf_x = TableData.GetConfig(x, "BaseRogueTreasure")
    local conf_y = TableData.GetConfig(y, "BaseRogueTreasure")
    if conf_x.level == conf_y.level then
      return x < y
    end
    return conf_x.level > conf_y.level
  end)
  local nodeId = rogueNode.nodeId
  local conf = TableData.GetConfig(nodeId, "BaseRogueNode")
  local itemlist = uis.Main.ItemList
  itemlist.itemRenderer = ShopTreasureItemRenderer
  itemlist.numItems = #treasureIdList
  itemlist.opaque = false
  RefreshResetBtnStatus()
  RogueGameMgr.UI_SetAssetList(uis.Main.AssetsList)
  RogueGameMgr.UI_SetCommonBottomInfo(uis.Main.Botton.root, false, true)
end

function RogueGameShopWindow.ReInitData()
end

function RogueGameShopWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameShopWindow.package, WinResConfig.RogueGameShopWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_InsideShopWindowUis(contentPane)
    rogueNode = bridgeObj.argTable[1]
    RogueGameShopWindow.UpdateInfo()
    RogueGameShopWindow.InitBtn()
  end)
end

function RogueGameShopWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(12016, "BaseFeature").back_ground)
  RefreshPanelInfo()
  UIUtil.SetText(uis.Main.OutBtn, T(20438), "WordTxt")
  local ctrl = uis.Main.OutBtn:GetController("c1")
  ctrl.onChanged:Set(function()
    local outBtn = uis.Main.OutBtn
    if 0 == ctrl.selectedIndex then
      UIUtil.SetText(outBtn, T(20438), "WordTxt")
    else
      UIUtil.SetText(outBtn, T(20452), "WordTxt")
    end
  end)
end

function RogueGameShopWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    uis.Main.OutBtn:GetController("c1").selectedIndex = 0
    UIMgr:CloseWindow(WinResConfig.RogueGameShopWindow.name)
  end)
  uis.Main.BackGround.root.onClick:Set(function()
    uis.Main.OutBtn:GetController("c1").selectedIndex = 0
  end)
  uis.Main.Botton.root.onClick:Set(function()
    uis.Main.OutBtn:GetController("c1").selectedIndex = 0
  end)
  uis.Main.AssetsList.onClick:Set(function()
    uis.Main.OutBtn:GetController("c1").selectedIndex = 0
  end)
  uis.Main.OutBtn.onClick:Set(function()
    local ctrl = uis.Main.OutBtn:GetController("c1")
    if 0 == ctrl.selectedIndex then
      ctrl.selectedIndex = (ctrl.selectedIndex + 1) % 2
    else
      RogueGameService.ExitRogueNodeReq(rogueNode.nodeId, function()
        UIMgr:CloseWindow(WinResConfig.RogueGameShopWindow.name)
      end)
    end
  end)
end

function RogueGameShopWindow.OnClose()
  uis = nil
  contentPane = nil
  selectedShopId = nil
end

function RogueGameShopWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.RogueGame.REFRESH_SHOP_PANEL_INFO then
    rogueNode = para
    RefreshPanelInfo()
  elseif msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    uis.Main.AssetsList.numItems = 2
  end
end

return RogueGameShopWindow
