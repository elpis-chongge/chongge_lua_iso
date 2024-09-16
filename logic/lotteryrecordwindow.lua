require("Lottery_RecordWindowByName")
local LotteryRecordWindow = {}
local uis, contentPane, recordData, jumpTb

function LotteryRecordWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.LotteryRecordWindow.package, WinResConfig.LotteryRecordWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetLottery_RecordWindowUis(contentPane)
    recordData = bridgeObj.argTable[1]
    LotteryRecordWindow.InitBtn()
    LotteryRecordWindow.InitList()
  end)
end

function LotteryRecordWindow.InitList()
  table.sort(recordData, function(a, b)
    return a.timestamp > b.timestamp
  end)
  uis.Main.RecordList:SetVirtual()
  
  function uis.Main.RecordList.itemRenderer(i, item)
    local title = item:GetChild("R_Title")
    local data = TableData.GetConfig(recordData[i + 1].poolId, "BaseGacha")
    if data then
      title:GetChild("WordTxt").text = data.name()
    end
    title:GetChild("TimeTxt").text = TimeUtil.FormatDate("%Y/%m/%d", recordData[i + 1].timestamp)
    LotteryRecordWindow.SetReward(recordData[i + 1].gachaDrop, item:GetChild("HeadList"))
  end
  
  uis.Main.RecordList.numItems = #recordData
end

function LotteryRecordWindow.SetReward(rewardData, list)
  function list.itemRenderer(i, item)
    local cardInfo = CardData.GetCardDataById(rewardData[i + 1].itemId)
    
    if cardInfo then
      local tips = item:GetChild("P_CardInfo1")
      local teamTb = SimpleCopy(cardInfo)
      teamTb.grade = 0
      teamTb.fashionId = 0
      UIUtil.ShowCardTips(teamTb, tips, nil, nil, HEAD_ICON_TYPE_ENUM.SQUARE)
    end
  end
  
  list.numItems = #rewardData
end

function LotteryRecordWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.LotteryRecordWindow.name, uis.Main.CurrencyReturn)
end

function LotteryRecordWindow.HandleMessage(msgId, para)
end

function LotteryRecordWindow.OnClose()
  uis = nil
  contentPane = nil
  recordData = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return LotteryRecordWindow
