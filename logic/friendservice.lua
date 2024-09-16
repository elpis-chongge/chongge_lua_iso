FriendService = {}

function FriendService.Init()
  Net.AddListener(Proto.MsgName.GetFriendsRsp, FriendService.DealGetFriendsRsp)
  Net.AddListener(Proto.MsgName.ApplyAddFriendRsp, FriendService.DealApplyAddFriendRsp)
  Net.AddListener(Proto.MsgName.AgreeFriendApplyRsp, FriendService.DealAgreeFriendApplyRsp)
  Net.AddListener(Proto.MsgName.DisagreeFriendRsp, FriendService.DealDisagreeFriendRsp)
  Net.AddListener(Proto.MsgName.BlockTargetRsp, FriendService.DealBlockTargetRsp)
  Net.AddListener(Proto.MsgName.DeleteRelationRsp, FriendService.DealDeleteRelationRsp)
  Net.AddListener(Proto.MsgName.SearchTargetRsp, FriendService.DealSearchTargetRsp)
  Net.AddListener(Proto.MsgName.SetRelationRemarkRsp, FriendService.DealSetRelationRemarkRsp)
end

function FriendService.GetFriendsReq()
  local msg = {}
  Net.Send(Proto.MsgName.GetFriendsReq, msg)
end

function FriendService.DealGetFriendsRsp(msg)
  FriendData.SaveFriends(msg)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.FRIEND)
  UIMgr:SendWindowMessage(WinResConfig.FriendWindow.name, WindowMsgEnum.FRIEND.UPDATE_FRIEND_WINDOW)
end

function FriendService.ApplyAddFriendReq(targetUin)
  local msg = {}
  msg.targetUin = targetUin
  Net.Send(Proto.MsgName.ApplyAddFriendReq, msg)
end

function FriendService.DealApplyAddFriendRsp(msg)
  FloatTipsUtil.ShowWarnTips(T(10147))
end

function FriendService.AgreeFriendApplyReq(targetUin)
  local msg = {}
  msg.targetUin = targetUin
  Net.Send(Proto.MsgName.AgreeFriendApplyReq, msg)
end

function FriendService.DealAgreeFriendApplyRsp(msg)
  for _, v in ipairs(msg.infos) do
    FriendData.UpdateRelationInfo(v)
  end
  UIMgr:SendWindowMessage(WinResConfig.FriendWindow.name, WindowMsgEnum.FRIEND.DELETE)
end

function FriendService.DisagreeFriendReq(targetUin)
  local msg = {}
  msg.targetUin = targetUin
  Net.Send(Proto.MsgName.DisagreeFriendReq, msg)
end

function FriendService.DealDisagreeFriendRsp(msg)
  if 0 ~= msg.targetUin then
    FriendData.UpdateRelationInfo({
      targetUin = msg.targetUin,
      state = ProtoEnum.RELATION_STATE.DELETE
    })
  else
    local list = FriendData.GetRelationList(ProtoEnum.RELATION_STATE.APPLIED)
    for i = #list, 1, -1 do
      local v = list[i]
      FriendData.UpdateRelationInfo({
        targetUin = v.targetUin,
        state = ProtoEnum.RELATION_STATE.DELETE
      })
    end
  end
  UIMgr:SendWindowMessage(WinResConfig.FriendWindow.name, WindowMsgEnum.FRIEND.DELETE)
end

function FriendService.BlockTargetReq(targetUin)
  local msg = {}
  msg.targetUin = targetUin
  Net.Send(Proto.MsgName.BlockTargetReq, msg)
end

function FriendService.DealBlockTargetRsp(msg)
  FriendData.UpdateRelationInfo(msg.info)
  FriendData.UpdateTarget(msg.targetInfo)
  UIMgr:SendWindowMessage(WinResConfig.FriendWindow.name, WindowMsgEnum.FRIEND.UPDATE_LIST)
  UIMgr:SendWindowMessage(WinResConfig.OtherPlayerInfoWindow.name, WindowMsgEnum.FRIEND.RELATION_CHANGE)
end

function FriendService.DeleteRelationReq(targetUin)
  local msg = {}
  msg.targetUin = targetUin
  Net.Send(Proto.MsgName.DeleteRelationReq, msg)
end

function FriendService.DealDeleteRelationRsp(msg)
  local block = FriendData.IsActorBlock(msg.targetUin)
  FriendData.UpdateRelationInfo({
    targetUin = msg.targetUin,
    state = ProtoEnum.RELATION_STATE.DELETE
  })
  UIMgr:SendWindowMessage(WinResConfig.ChatWindow.name, WindowMsgEnum.ChatWindow.E_MSG_PLAYER_LIST_CHANGE)
  UIMgr:SendWindowMessage(WinResConfig.FriendWindow.name, WindowMsgEnum.FRIEND.DELETE, block)
  UIMgr:SendWindowMessage(WinResConfig.OtherPlayerInfoWindow.name, WindowMsgEnum.FRIEND.RELATION_CHANGE, {
    targetUin = msg.targetUin,
    state = ProtoEnum.RELATION_STATE.DELETE
  })
end

function FriendService.SearchTargetReq(searchKey)
  local msg = {}
  msg.searchKey = searchKey
  Net.Send(Proto.MsgName.SearchTargetReq, msg)
end

function FriendService.DealSearchTargetRsp(msg)
  if #msg.infos <= 0 then
    FloatTipsUtil.ShowWarnTips(T(10136))
    return
  end
  FriendData.SaveSearchResult(msg)
  UIMgr:SendWindowMessage(WinResConfig.FriendWindow.name, WindowMsgEnum.FRIEND.SEARCH)
end

function FriendService.SetRelationRemarkReq(targetUin, remark)
  local msg = {}
  msg.targetUin = targetUin
  msg.remark = remark
  Net.Send(Proto.MsgName.SetRelationRemarkReq, msg)
end

function FriendService.DealSetRelationRemarkRsp(msg)
  FriendData.UpdateRelationInfo(msg.info)
  UIMgr:SendWindowMessage(WinResConfig.FriendWindow.name, WindowMsgEnum.FRIEND.UPDATE_LIST)
end

FriendService.Init()
