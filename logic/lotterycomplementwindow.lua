require("Lottery_ComplementWindowByName")
local LotteryComplementWindow = {}
local uis, contentPane, costInfo, callBack

function LotteryComplementWindow.ReInitData()
end

function LotteryComplementWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.LotteryComplementWindow.package, WinResConfig.LotteryComplementWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetLottery_ComplementWindowUis(contentPane)
    costInfo = bridgeObj.argTable[1]
    callBack = bridgeObj.argTable[2]
    LotteryComplementWindow.UpdateInfo()
    LotteryComplementWindow.InitBtn()
  end)
end

function LotteryComplementWindow.UpdateInfo()
  local tips = uis.Main.Currency1
  tips.ItemRegion.WordTxt.text = T(1356)
  if costInfo then
    local itemData1 = TableData.GetConfig(costInfo.cost.id, "BaseItem")
    local itemData2 = TableData.GetConfig(costInfo.costChange.id, "BaseItem")
    if itemData2 and itemData1 then
      local str = T(1355, itemData1.name(), itemData2.name())
      tips.WordTxt.text = str
      local Item1 = tips.ItemRegion.Item1
      Item1.IconLoader.url = UIUtil.GetResUrl(itemData1.icon_small or itemData2.icon)
      local costNum = ActorData.GetItemCount(costInfo.cost.id)
      Item1.SpendTxt.text = costNum
      local Item2 = tips.ItemRegion.Item2
      local num = costInfo.cost.value - costNum
      Item2.SpendTxt.text = num * costInfo.costChange.value
      Item2.IconLoader.url = UIUtil.GetResUrl(itemData2.icon_small or itemData2.icon)
      UIUtil.InitAssetsTips(tips.AssetsTipsList, {
        costInfo.cost.id,
        costInfo.costChange.id
      })
    end
  end
end

function LotteryComplementWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.LotteryComplementWindow.name)
end

function LotteryComplementWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(LotteryComplementWindow.CloseWindow)
  UIUtil.SetPopupBtnGroup(uis.Main.Popup_B.BtnGroup.root, {
    touchCallback = function()
      if type(callBack) == "function" then
        callBack()
      end
      if costInfo.doGacha then
        LotteryComplementWindow.CloseWindow()
      end
    end
  }, {
    touchCallback = LotteryComplementWindow.CloseWindow
  })
end

function LotteryComplementWindow.OnClose()
  uis = nil
  contentPane = nil
  costInfo = nil
  callBack = nil
end

return LotteryComplementWindow
