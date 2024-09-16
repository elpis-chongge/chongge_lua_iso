LotteryService = {}
local isJump

function LotteryService.Init()
  Net.AddListener(Proto.MsgName.GetGachaInfoRsp, LotteryService.GetGachaInfoRsp)
  Net.AddListener(Proto.MsgName.DoGachaRsp, LotteryService.DoGachaRsp)
  Net.AddListener(Proto.MsgName.ExchangeGachaRsp, LotteryService.ExchangeGachaRsp)
  Net.AddListener(Proto.MsgName.GetGachaRecordsRsp, LotteryService.GetGachaRecordsRsp)
  Net.AddListener(Proto.MsgName.GetGachaExtraRsp, LotteryService.GetGachaExtraRsp)
end

function LotteryService.GetGachaInfoReq(jump, callBack)
  isJump = jump
  local msg = {}
  Net.Send(Proto.MsgName.GetGachaInfoReq, msg, callBack)
end

function LotteryService.GetGachaInfoRsp(msg)
  LotteryData.Info = msg
  LotteryData.curPage = 0
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.GACHA)
end

function LotteryService.DoGachaReq(modeId)
  local msg = {}
  msg.gachaMode = modeId
  Net.Send(Proto.MsgName.DoGachaReq, msg)
end

function LotteryService.DoGachaRsp(msg)
  for i, v in pairs(msg.poolInfo) do
    LotteryData.SavePoint(v)
  end
  LotteryData.Info.dailyGachaCount = msg.dailyGachaCount
  LotteryData.Info.totalGachaCount = msg.totalGachaCount
  LotteryData.drops = msg.drops
  LotteryData.Info.reachNum = msg.reachNum
  LotteryData.Info.dailyFreeCount = msg.dailyFreeCount
  LotteryData.showReview = false
  local poolId = msg.poolId
  local poolConfig = TableData.GetConfig(poolId, "BaseGacha")
  if poolConfig and 1 ~= poolConfig.type then
    local drops = msg.drops
    for i, v in ipairs(drops) do
      local item = v.item
      if item.tupleType == ProtoEnum.TUPLE_TYPE.CARD then
        local cardId = item.itemId
        local cardConfig = TableData.GetConfig(cardId, "BaseCard")
        if cardConfig and cardConfig.star >= 5 then
          LotteryData.showReview = true
          break
        end
      end
    end
  end
  UIMgr:SendWindowMessage(WinResConfig.LotteryWindow.name, WindowMsgEnum.LotteryWindow.UPDATE_GOLD)
  if msg.openList then
    table.sort(msg.openList)
    table.sort(LotteryData.Info.openList)
    if not table.equal(msg.openList, LotteryData.Info.openList) then
      LotteryData.curPage = 0
      LotteryData.Info.openList = msg.openList
      UIMgr:SendWindowMessage(WinResConfig.LotteryWindow.name, WindowMsgEnum.LotteryWindow.UPDATE_LIST)
    end
  end
  local drops = msg.drops
  local nextFunc = function()
    OpenWindow(WinResConfig.LotteryPaintingShowWindow.name, nil, drops)
  end
  local qualityTable = {}
  local typeTable = {}
  local TYPE_CARD = ProtoEnum.TUPLE_TYPE.CARD
  for i, v in ipairs(drops) do
    if v.item.tupleType == TYPE_CARD then
      local itemId = v.item.itemId
      local cardConfig = TableData.GetConfig(itemId, "BaseCard")
      table.insert(qualityTable, cardConfig.star)
      table.insert(typeTable, cardConfig.type)
    end
  end
  LotteryEffect.ShowLotteryScene(qualityTable, typeTable, nextFunc, msg.poolId)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.GACHA)
end

function LotteryService.ExchangeGachaReq(itemId, poolId)
  local msg = {}
  msg.itemId = itemId
  msg.poolId = poolId
  Net.Send(Proto.MsgName.ExchangeGachaReq, msg)
end

function LotteryService.ExchangeGachaRsp(msg)
  LotteryData.SavePoint(msg.poolInfo)
  GetItemTips.Show({
    msg.reward
  })
  UIMgr:SendWindowMessage(WinResConfig.LotteryExchangeWindow.name, WindowMsgEnum.LotteryWindow.EXCHANGE)
end

function LotteryService.GetGachaRecordsReq(poolId)
  local msg = {}
  msg.poolId = poolId
  Net.Send(Proto.MsgName.GetGachaRecordsReq, msg)
end

function LotteryService.GetGachaRecordsRsp(msg)
  if #msg.records > 0 then
    OpenWindow(WinResConfig.LotteryRecordWindow.name, nil, msg.records)
  else
    FloatTipsUtil.ShowWarnTips(T(516))
  end
end

function LotteryService.GetGachaExtraReq(cardId, gachaId)
  local msg = {}
  msg.cardId = cardId
  msg.gachaId = gachaId
  Net.Send(Proto.MsgName.GetGachaExtraReq, msg)
end

function LotteryService.GetGachaExtraRsp(msg)
  local drops = msg.reward
  LotteryData.Info.openList[msg.poolInfo.poolId] = nil
  UIMgr:CloseWindow(WinResConfig.LotteryStartChoiceWindow.name)
  UIMgr:SendWindowMessage(WinResConfig.LotteryWindow.name, WindowMsgEnum.LotteryWindow.UPDATE_LIST)
  OpenWindow(WinResConfig.LotteryPaintingShowWindow.name, nil, {drops})
end

LotteryService.Init()
