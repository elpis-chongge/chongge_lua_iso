ActorService = {}

function ActorService.Init()
  Net.AddListener(Proto.MsgName.CreateActorRsp, ActorService.DealCreateActorRsp)
  Net.AddListener(Proto.MsgName.GetActorInfoRsp, ActorService.DealGetActorInfoRsp)
  Net.AddListener(Proto.MsgName.GetItemsRsp, ActorService.DealGetItemsRsp)
  Net.AddListener(Proto.MsgName.GetAllCardsRsp, ActorService.DealGetAllCardsRsp)
  Net.AddListener(Proto.MsgName.GetCardAllTeamRsp, ActorService.DealGetCardAllTeamRsp)
  Net.AddListener(Proto.MsgName.SyncItemsRsp, ActorService.DealSyncItemsRsp)
  Net.AddListener(Proto.MsgName.EventNotifyRsp, ActorService.DealEventNotifyRsp)
  Net.AddListener(Proto.MsgName.CardUpdateNotify, ActorService.DealCardUpdateNotify)
  Net.AddListener(Proto.MsgName.ActorInfoUpdateNotify, ActorService.DealActorInfoUpdateNotify)
  Net.AddListener(Proto.MsgName.NewMessageNotify, ActorService.DealNewMessageNotify)
  Net.AddListener(Proto.MsgName.MutedBySystemNotify, ActorService.DealMutedBySystemNotify)
  Net.AddListener(Proto.MsgName.NewMailNotify, ActorService.DealNewMailNotify)
  Net.AddListener(Proto.MsgName.NewBadgeNotify, ActorService.DealNewBadgeNotify)
  Net.AddListener(Proto.MsgName.RelationChangedNotify, ActorService.DealRelationChangedNotify)
  Net.AddListener(Proto.MsgName.RelationDelApplicantNotify, ActorService.DealRelationDelApplicantNotify)
  Net.AddListener(Proto.MsgName.GetOtherDetailInfoRsp, ActorService.DealGetOtherDetailInfoRsp)
  Net.AddListener(Proto.MsgName.SaveSettingsRsp, ActorService.DealSaveSettingsRsp)
  Net.AddListener(Proto.MsgName.ReportOperateRecordRsp, ActorService.ReportOperateRecordRsp)
  Net.AddListener(Proto.MsgName.GetOperateRecordRsp, ActorService.GetOperateRecordRsp)
  Net.AddListener(Proto.MsgName.GetStoryListRsp, ActorService.DealGetStoryListRsp)
  Net.AddListener(Proto.MsgName.ChangeNameRsp, ActorService.DealChangeNameRsp)
  Net.AddListener(Proto.MsgName.ChangeFaceRsp, ActorService.DealChangeFaceRsp)
  Net.AddListener(Proto.MsgName.ChangeHeadRsp, ActorService.DealChangeHeadRsp)
  Net.AddListener(Proto.MsgName.FinishGuideRsp, ActorService.DealFinishGuideRsp)
  Net.AddListener(Proto.MsgName.GetGuideProgressRsp, ActorService.DealGetGuideProgressRsp)
  Net.AddListener(Proto.MsgName.CheckFeatureOpenRsp, ActorService.DealCheckFeatureOpenRsp)
  Net.AddListener(Proto.MsgName.GetSelfDetailInfoRsp, ActorService.DealGetSelfDetailInfoRsp)
  Net.AddListener(Proto.MsgName.SetProfileDisplayCardsRsp, ActorService.DealSetProfileDisplayCardsRsp)
  Net.AddListener(Proto.MsgName.SetProfileShowResourceRsp, ActorService.DealSetProfileShowResourceRsp)
  Net.AddListener(Proto.MsgName.GuildEventNotify, ActorService.DealGuildEventNotify)
  Net.AddListener(Proto.MsgName.ActorGmRsp, ActorService.DealActorGmRsp)
  Net.AddListener(Proto.MsgName.ChangePasswordRsp, ActorService.DealChangePasswordRsp)
  Net.AddListener(Proto.MsgName.GetAllBadgesRsp, ActorService.DealGetAllBadgesRsp)
  Net.AddListener(Proto.MsgName.BatchSyncResRsp, ActorService.DealBatchSyncResRsp)
  Net.AddListener(Proto.MsgName.UseExchangeCodeRsp, ActorService.UseExchangeCodeRsp)
  Net.AddListener(Proto.MsgName.ClientAbnormalReportRsp, ActorService.ClientAbnormalReportRsp)
end

function ActorService.CreateActorReq(rspCallback)
  local msg = {}
  msg.platform = LoginData.GetPlatform()
  msg.deviceId = LuaUtil.GetDeviceId()
  msg.channel = LuaUtil.GetChannel()
  msg.name = ActorData.GetRandomName()
  Net.Send(Proto.MsgName.CreateActorReq, msg, rspCallback)
end

function ActorService.DealCreateActorRsp(msg)
  if msg.actor then
    ActorData.SaveActorData(msg.actor)
    if SDKManager.UseSDK == true then
      local sdk = SDKManager:GetSDKChannel()
      if "Bilibili" == sdk then
        SDKManager:CreateRole(tostring(ActorData.GetUin()), ActorData.GetName())
        SDKManager:NotifyZone(tostring(ActorData.GetUin()), ActorData.GetName())
      end
    end
  end
end

function ActorService.GetActorInfoReq()
  local msg = {}
  Net.Send(Proto.MsgName.GetActorInfoReq, msg)
end

function ActorService.DealGetActorInfoRsp(msg)
  if msg.actor then
    ActorData.UpdateActorInfo(msg.actor)
  end
end

function ActorService.ChangeNameReq(name, rspCallBack)
  local msg = {}
  msg.name = name
  Net.Send(Proto.MsgName.ChangeNameReq, msg, rspCallBack)
end

function ActorService.DealChangeNameRsp(msg)
  if msg.actor then
    ActorData.UpdateActorInfo(msg.actor)
  end
end

function ActorService.ChangeFaceReq(faceId, rspCallBack)
  local msg = {}
  msg.faceId = faceId
  Net.Send(Proto.MsgName.ChangeFaceReq, msg, rspCallBack)
end

function ActorService.DealChangeFaceRsp(msg)
  if msg.faceId then
    ActorData.SaveFaceId(msg.faceId)
  end
end

function ActorService.ChangeHeadReq(headInfo, rspCallBack)
  local msg = {}
  msg.head = headInfo
  Net.Send(Proto.MsgName.ChangeHeadReq, msg, rspCallBack)
end

function ActorService.DealChangeHeadRsp(msg)
  if msg.head then
    ActorData.SaveActorHead(msg.head)
  end
end

function ActorService.GetItemsReq()
  local msg = {}
  Net.Send(Proto.MsgName.GetItemsReq, msg)
end

function ActorService.DealGetItemsRsp(msg)
  ActorData.SaveItemData(msg)
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_ITEM_CHANGE)
end

function ActorService.GetAllCardsReq()
  local syncKey = ActorData.GetCardSyncKey()
  local msg = {}
  msg.syncKey = syncKey
  Net.Send(Proto.MsgName.GetAllCardsReq, msg)
end

function ActorService.DealGetAllCardsRsp(msg)
  ActorData.SaveCardData(msg)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.CARD)
end

function ActorService.GetAllBadgesReq()
  local msg = {}
  Net.Send(Proto.MsgName.GetAllBadgesReq, msg)
end

function ActorService.DealGetAllBadgesRsp(msg)
  ActorData.SaveBadgeData(msg)
end

function ActorService.GetCardAllTeamReq()
  local msg = {}
  Net.Send(Proto.MsgName.GetCardAllTeamReq, msg)
end

function ActorService.DealGetCardAllTeamRsp(msg)
  ActorData.SaveAllTeamData(msg)
end

function ActorService.SyncItemsReq()
  local syncKey = ActorData.GetItemSyncKey()
  local msg = {}
  msg.syncKey = syncKey
  Net.Send(Proto.MsgName.SyncItemsReq, msg)
end

function ActorService.DealSyncItemsRsp(msg)
  local success = ActorData.UpdateItem(msg)
  if true == success then
    UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_ITEM_CHANGE)
  end
end

function ActorService.GetOtherDetailInfoReq(targetUin, rspCallback)
  local msg = {}
  msg.targetUin = targetUin
  Net.Send(Proto.MsgName.GetOtherDetailInfoReq, msg, rspCallback)
end

function ActorService.DealGetOtherDetailInfoRsp(msg)
end

function ActorService.GetSelfDetailInfoReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.GetSelfDetailInfoReq, msg, rspCallback)
end

function ActorService.DealGetSelfDetailInfoRsp(msg)
  OpenWindow(WinResConfig.PlayerWindow.name, nil, msg)
end

function ActorService.SetProfileDisplayCardsReq(cardIds)
  local msg = {}
  msg.cardIds = cardIds
  Net.Send(Proto.MsgName.SetProfileDisplayCardsReq, msg)
end

function ActorService.DealSetProfileDisplayCardsRsp(msg)
end

function ActorService.SetProfileShowResourceReq(hideResource)
  local msg = {}
  msg.hideResource = hideResource
  Net.Send(Proto.MsgName.SetProfileShowResourceReq, msg)
end

function ActorService.DealSetProfileShowResourceRsp(msg)
  UIMgr:SendWindowMessage(WinResConfig.PlayerWindow.name, WindowMsgEnum.PlayerWindow.BAG_ITEM_SHOW)
end

function ActorService.SaveSettingsReq(settings, opType, value)
  local msg = {}
  msg.settings = settings
  if opType then
    msg.opType = opType
    msg.value = tostring(value)
  end
  Net.Send(Proto.MsgName.SaveSettingsReq, msg)
end

function ActorService.DealSaveSettingsRsp(msg)
end

function ActorService.ReportOperateRecordReq(opType, values)
  local msg = {}
  msg.opType = opType
  msg.values = values
  Net.Send(Proto.MsgName.ReportOperateRecordReq, msg)
end

function ActorService.ReportOperateRecordRsp(msg)
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_UPDATE_OPERATE_RECORD)
end

function ActorService.GetOperateRecordReq(opTypes)
  local msg = {}
  msg.opTypes = opTypes or {}
  Net.Send(Proto.MsgName.GetOperateRecordReq, msg)
end

function ActorService.GetOperateRecordRsp(msg)
  if OprRecordUtil then
    OprRecordUtil.CacheRecord(msg.records)
    UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_UPDATE_OPERATE_RECORD)
  end
end

function ActorService.UseExchangeCodeReq(code)
  local msg = {}
  msg.code = code
  Net.Send(Proto.MsgName.UseExchangeCodeReq, msg)
end

function ActorService.UseExchangeCodeRsp(msg)
  if msg.rewards then
    if UIMgr:IsWindowOpen(WinResConfig.CodeWindow.name) then
      UIMgr:CloseWindow(WinResConfig.CodeWindow.name)
    end
    GetItemTips.Show(msg.rewards, true)
  end
end

function ActorService.ClientAbnormalReportReq(reason)
  local msg = {}
  msg.reason = reason
  Net.Send(Proto.MsgName.ClientAbnormalReportReq, msg)
end

function ActorService.ClientAbnormalReportRsp(msg)
end

function ActorService.GetGuideProgressReq()
  local msg = {}
  Net.Send(Proto.MsgName.GetGuideProgressReq, msg)
end

function ActorService.DealGetGuideProgressRsp(msg)
  ActorData.SaveGuideProgress(msg)
  UIMgr:SendWindowMessage(WinResConfig.HomeWindow.name, WindowMsgEnum.HomeWindow.START_GUIDE)
end

function ActorService.FinishGuideReq(guideId, step)
  local msg = {}
  msg.guideId = guideId
  msg.step = step
  Net.Send(Proto.MsgName.FinishGuideReq, msg)
end

function ActorService.DealFinishGuideRsp(msg)
  ActorData.UpdateGuideProgress(msg)
end

function ActorService.CheckFeatureOpenReq(featureIds, rspCallback)
  local msg = {}
  msg.featureIds = featureIds
  Net.Send(Proto.MsgName.CheckFeatureOpenReq, msg, rspCallback)
end

function ActorService.DealCheckFeatureOpenRsp(msg)
  ActorData.SaveOpenFeature(msg)
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_UPDATE_FUNC_ENTER)
end

function ActorService.GetStoryListReq(storyId)
  local msg = {}
  msg.newStory = storyId
  Net.Send(Proto.MsgName.GetStoryListReq, msg)
end

function ActorService.DealGetStoryListRsp(msg)
  ActorData.SaveStoryUnlockData(msg)
end

function ActorService.DealCardUpdateNotify(msg)
  ActorData.UpdateCard(msg)
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_CARD_CHANGE)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.CARD)
end

function ActorService.DealActorInfoUpdateNotify(msg)
  if msg.actor then
    ActorData.UpdateActorInfo(msg.actor)
  end
end

function ActorService.DealNewMessageNotify(msg)
  ld("Chat", function()
    ChatData.DealNewMessageNotify(msg)
    RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.CHAT)
  end)
end

function ActorService.DealMutedBySystemNotify(msg)
  ld("Chat", function()
    ChatData.SetChatState(msg)
  end)
end

function ActorService.DealNewMailNotify(msg)
end

function ActorService.DealRelationChangedNotify(msg)
  ld("Friend", function()
    FriendData.UpdateTarget(msg.targetInfo)
    FriendData.UpdateRelationInfo(msg.info)
    UIMgr:SendWindowMessage(WinResConfig.FriendWindow.name, WindowMsgEnum.FRIEND.UPDATE_LIST)
    RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.FRIEND)
  end)
end

function ActorService.DealRelationDelApplicantNotify(msg)
  ld("Friend", function()
    FriendData.DeleteApplication(msg.targetUin)
    UIMgr:SendWindowMessage(WinResConfig.FriendWindow.name, WindowMsgEnum.FRIEND.UPDATE_LIST)
    RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.FRIEND)
  end)
end

function ActorService.DealGuildEventNotify(msg)
  UIMgr:SendWindowMessage(WinResConfig.GuildListWindow.name, WindowMsgEnum.GuildWindow.ENTER_GUILD, msg.guildName)
end

function ActorService.DealNewBadgeNotify(msg)
  for i, v in pairs(msg.badges) do
    ActorData.UpdateOneBadgeData(v)
  end
  ActorData.SetBadgeSyncKey(msg.syncKey)
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_BADGE_UPDATE)
end

function ActorService.DealActorGmRsp(msg)
  if msg.ret and msg.ret ~= "" then
    local ids = Split(msg.ret, ",")
    for i = #ids, 1, -1 do
      if "" == ids[i] then
        table.remove(ids, i)
      end
    end
    local path = "Assets/GachaTest/Result.txt"
    FileManager.WriteFile(path, table.concat(ids, "\n") .. "\n", true)
    LuaUtil.PingWithSelected(path)
  end
  if msg.failCmd and "" ~= msg.failCmd then
    printError("执行失败的GM命令：", msg.failCmd)
  end
end

function ActorService.DealEventNotifyRsp()
end

function ActorService.ChangePasswordReq(accountId, oldPassword, newPassword, rspCallback)
  local msg = {}
  msg.accountId = accountId
  msg.oldPassword = oldPassword
  msg.newPassword = newPassword
  Net.Send(Proto.MsgName.ChangePasswordReq, msg, rspCallback)
end

function ActorService.DealChangePasswordRsp(msg)
end

function ActorService.DealNothing()
end

function ActorService.BatchSyncResReq()
  local msg = {}
  msg.badgeSyncKey = ActorData.GetBadgeSyncKey()
  msg.cardSyncKey = ActorData.GetCardSyncKey()
  msg.itemSyncKey = ActorData.GetItemSyncKey()
  Net.Send(Proto.MsgName.BatchSyncResReq, msg)
end

function ActorService.DealBatchSyncResRsp()
  LoginService.HeartBeatReq()
end

ActorService.Init()
