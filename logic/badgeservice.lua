BadgeService = {}

function BadgeService.Init()
  Net.AddListener(Proto.MsgName.TakeoffBadgeRsp, BadgeService.TakeoffBadgeRsp)
  Net.AddListener(Proto.MsgName.LevelupBadgeRsp, BadgeService.LevelupBadgeRsp)
  Net.AddListener(Proto.MsgName.WearBadgeRsp, BadgeService.WearBadgeRsp)
  Net.AddListener(Proto.MsgName.DecomposeBadgeRsp, BadgeService.DecomposeBadgeRsp)
  Net.AddListener(Proto.MsgName.SetBadgeLockStateRsp, BadgeService.SetBadgeLockStateRsp)
  Net.AddListener(Proto.MsgName.ClearBadgeNewTagRsp, BadgeService.ClearBadgeNewTagRsp)
  Net.AddListener(Proto.MsgName.SwitchBadgeRsp, BadgeService.SwitchBadgeRsp)
end

function BadgeService.DecomposeBadgeReq(all, badgeUidLst, rspCallback)
  local msg = {}
  msg.all = all
  msg.badgeUidLst = badgeUidLst
  Net.Send(Proto.MsgName.DecomposeBadgeReq, msg, rspCallback)
end

function BadgeService.DecomposeBadgeRsp(msg)
  for _, uid in ipairs(msg.delBadgeUidLst) do
    ActorData.DeleteOneBadgeData(uid)
  end
  GetItemTips.Show(msg.gainItems, nil, function()
    UIMgr:SendWindowMessage(WinResConfig.BadgeDecomposeWindow.name, WindowMsgEnum.BadgeWindow.DECOMPOSE_BADGE)
  end)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.BADGE)
end

function BadgeService.SetBadgeLockStateReq(locked, badgeUid, rspCallback)
  local msg = {}
  msg.locked = locked
  msg.badgeUid = badgeUid
  Net.Send(Proto.MsgName.SetBadgeLockStateReq, msg, rspCallback)
end

function BadgeService.SetBadgeLockStateRsp(msg)
  local info = ActorData.GetBadgeInfoByUid(msg.badgeUid)
  info.locked = msg.locked
  ActorData.UpdateOneBadgeData(info)
  if UIMgr:IsWindowOpen(WinResConfig.BadgeWindow.name) then
    UIMgr:SendWindowMessage(WinResConfig.BadgeWindow.name, WindowMsgEnum.BadgeWindow.REFRESH_LIST)
  end
  if UIMgr:IsWindowOpen(WinResConfig.BadgeDecomposeWindow.name) then
    UIMgr:SendWindowMessage(WinResConfig.BadgeDecomposeWindow.name, WindowMsgEnum.BadgeWindow.REFRESH_LIST)
  end
end

function BadgeService.TakeoffBadgeReq(cardId, badgeUid, rspCallback)
  local msg = {}
  msg.cardId = cardId
  msg.badgeUidLst = badgeUid
  Net.Send(Proto.MsgName.TakeoffBadgeReq, msg, rspCallback)
end

function BadgeService.TakeoffBadgeRsp(msg)
  BadgeData.UpdateTakeoffOrWearInfo({
    msg.cardInfo
  }, msg.badgeInfo)
  UIMgr:SendWindowMessage(WinResConfig.BadgeWindow.name, WindowMsgEnum.BadgeWindow.REFRESH_WEAR_BADGE)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.BADGE)
end

function BadgeService.WearBadgeReq(cardId, badgeUid, rspCallback)
  local msg = {}
  msg.cardId = cardId
  msg.badgeUidLst = badgeUid
  Net.Send(Proto.MsgName.WearBadgeReq, msg, rspCallback)
end

function BadgeService.WearBadgeRsp(msg)
  BadgeData.UpdateTakeoffOrWearInfo(msg.cardInfos, msg.badgeInfos)
  UIMgr:SendWindowMessage(WinResConfig.BadgeWindow.name, WindowMsgEnum.BadgeWindow.REFRESH_WEAR_BADGE)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.BADGE)
end

function BadgeService.LevelupBadgeReq(badgeUid, items, rspCallback, errorCallback)
  local msg = {}
  msg.badgeUid = badgeUid
  msg.itemUid2Count = items
  Net.Send(Proto.MsgName.LevelupBadgeReq, msg, rspCallback, errorCallback)
end

function BadgeService.LevelupBadgeRsp(msg)
  ActorData.UpdateOneBadgeData(msg.badgeInfo)
  if msg.cardInfo then
    ActorData.AddCard(msg.cardInfo)
  end
  UIMgr:SendWindowMessage(WinResConfig.BadgeWindow.name, WindowMsgEnum.BadgeWindow.LV_UP, msg.badgeInfo)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.BADGE)
end

function BadgeService.ClearBadgeNewTagReq(badgeUidLst, clearAll, rspCallback)
  local msg = {}
  msg.badgeUidLst = badgeUidLst
  msg.clearAll = clearAll
  Net.Send(Proto.MsgName.ClearBadgeNewTagReq, msg, rspCallback)
end

function BadgeService.ClearBadgeNewTagRsp(msg)
  ActorData.UpdateBadgeNew(msg.badgeUidLst)
end

function BadgeService.SwitchBadgeReq(cardId1, cardId2, badgeTypes, rspCallback)
  local msg = {}
  msg.cardId1 = cardId1
  msg.cardId2 = cardId2
  msg.badgeTypes = badgeTypes
  Net.Send(Proto.MsgName.SwitchBadgeReq, msg, rspCallback)
end

function BadgeService.SwitchBadgeRsp(msg)
  for i, v in pairs(msg.badgeInfos) do
    ActorData.UpdateOneBadgeData(v)
  end
  for i, v in pairs(msg.cardInfos) do
    ActorData.AddCard(v)
  end
end

BadgeService.Init()
