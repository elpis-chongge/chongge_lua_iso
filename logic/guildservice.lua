GuildService = {}

function GuildService.Init()
  Net.AddListener(Proto.MsgName.GetMyGuildInfoRsp, GuildService.GetMyGuildInfoRsp)
  Net.AddListener(Proto.MsgName.GetRecommendGuildRsp, GuildService.GetRecommendGuildRsp)
  Net.AddListener(Proto.MsgName.ApplyJoinGuildRsp, GuildService.ApplyJoinGuildRsp)
  Net.AddListener(Proto.MsgName.CancelJoinGuildRsp, GuildService.CancelJoinGuildRsp)
  Net.AddListener(Proto.MsgName.GetAppliedGuildsRsp, GuildService.GetAppliedGuildsRsp)
  Net.AddListener(Proto.MsgName.QuickJoinGuildRsp, GuildService.QuickJoinGuildRsp)
  Net.AddListener(Proto.MsgName.CreateGuildRsp, GuildService.CreateGuildRsp)
  Net.AddListener(Proto.MsgName.SetGuildLevelLimitRsp, GuildService.SetGuildLevelLimitRsp)
  Net.AddListener(Proto.MsgName.SearchGuildByNameRsp, GuildService.SearchGuildByNameRsp)
  Net.AddListener(Proto.MsgName.SetGuildTargetRsp, GuildService.SetGuildTargetRsp)
  Net.AddListener(Proto.MsgName.ChangeGuildNameRsp, GuildService.ChangeGuildNameRsp)
  Net.AddListener(Proto.MsgName.ProcessGuildJoinApplyRsp, GuildService.ProcessGuildJoinApplyRsp)
  Net.AddListener(Proto.MsgName.ExitGuildRsp, GuildService.ExitGuildRsp)
  Net.AddListener(Proto.MsgName.DismissGuildRsp, GuildService.DismissGuildRsp)
  Net.AddListener(Proto.MsgName.StartImpeachGuildLeaderRsp, GuildService.StartImpeachGuildLeaderRsp)
  Net.AddListener(Proto.MsgName.VoteImpeachGuildLeaderRsp, GuildService.VoteImpeachGuildLeaderRsp)
  Net.AddListener(Proto.MsgName.ChangeGuildIconRsp, GuildService.ChangeGuildIconRsp)
  Net.AddListener(Proto.MsgName.OperateGuildViceLeaderRsp, GuildService.OperateGuildViceLeaderRsp)
  Net.AddListener(Proto.MsgName.KickOutGuildMemberRsp, GuildService.KickOutGuildMemberRsp)
  Net.AddListener(Proto.MsgName.GetGuildMembersRsp, GuildService.GetGuildMembersRsp)
  Net.AddListener(Proto.MsgName.TransferGuildLeaderRsp, GuildService.TransferGuildLeaderRsp)
  Net.AddListener(Proto.MsgName.GetImpeachInfoRsp, GuildService.GetImpeachInfoRsp)
  Net.AddListener(Proto.MsgName.GetMyGuildSimpleInfoRsp, GuildService.GetMyGuildSimpleInfoRsp)
  Net.AddListener(Proto.MsgName.GetActorSignInRsp, GuildService.GetActorSignInRsp)
  Net.AddListener(Proto.MsgName.ActorSignInRsp, GuildService.ActorSignInRsp)
  Net.AddListener(Proto.MsgName.ChangeGuildNoticeRsp, GuildService.ChangeGuildNoticeRsp)
  Net.AddListener(Proto.MsgName.GetGuildPracticeRankRsp, GuildService.GetGuildPracticeRankRsp)
  Net.AddListener(Proto.MsgName.GetGuildPracticeRecordRsp, GuildService.GetGuildPracticeRecordRsp)
end

function GuildService.GetMyGuildSimpleInfoReq()
  local msg = {}
  Net.Send(Proto.MsgName.GetMyGuildSimpleInfoReq, msg)
end

function GuildService.GetMyGuildSimpleInfoRsp(msg)
  GuildData.SetGuildSimpleInfo(msg)
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_SIMPLE_GUILD_RSP)
end

function GuildService.EnterGuild(jump)
  GuildService.GetMyGuildInfoReq(true, nil, function(msg)
    if msg.info then
      if jump then
        JumpToWindow(WinResConfig.GuildWindow.name, nil, nil, msg)
      else
        OpenWindow(WinResConfig.GuildWindow.name, nil, msg)
      end
    elseif jump then
      JumpToWindow(WinResConfig.GuildListWindow.name)
    else
      OpenWindow(WinResConfig.GuildListWindow.name)
    end
  end)
end

function GuildService.GetMyGuildInfoReq(withMember, extData, rspCallBack)
  local msg = {}
  msg.withMember = withMember
  msg.extData = extData
  Net.Send(Proto.MsgName.GetMyGuildInfoReq, msg, rspCallBack)
end

function GuildService.GetMyGuildInfoRsp(msg)
  GuildData.GuildInfo = msg.info and msg or nil
  GuildData.joinCdStamp = msg.joinCdStamp
  GuildData.firstJoin = msg.appliedGuild
  GuildData.firstCreate = msg.createdGuild
  if msg.extData == WinResConfig.ActorInfoWindow.name then
    UIMgr:SendWindowMessage(msg.extData, WindowMsgEnum.ActorInfoWindow.GUILD_INFO_UPDATE)
    return
  end
end

function GuildService.GetRecommendGuildReq(bol)
  local msg = {}
  msg.firstRecommend = bol
  Net.Send(Proto.MsgName.GetRecommendGuildReq, msg)
  GuildMgr.firstRecommend = bol
end

function GuildService.GetRecommendGuildRsp(msg)
  GuildData.ListInfos = msg.infos
  UIMgr:SendWindowMessage(WinResConfig.GuildListWindow.name, WindowMsgEnum.GuildWindow.INIT_LIST_INFO, nil)
end

function GuildService.ApplyJoinGuildReq(uid)
  local msg = {}
  msg.guildUid = uid
  Net.Send(Proto.MsgName.ApplyJoinGuildReq, msg)
end

function GuildService.ApplyJoinGuildRsp(msg)
  GuildData.firstJoin = true
  if msg.hasIn then
    GuildService.EnterGuild()
  else
    UIMgr:SendWindowMessage(WinResConfig.GuildListWindow.name, WindowMsgEnum.GuildWindow.JOIN_GUILD, msg)
  end
end

function GuildService.CancelJoinGuildReq(uid)
  local msg = {}
  msg.guildUid = uid
  Net.Send(Proto.MsgName.CancelJoinGuildReq, msg)
end

function GuildService.CancelJoinGuildRsp(msg)
  UIMgr:SendWindowMessage(WinResConfig.GuildListWindow.name, WindowMsgEnum.GuildWindow.CANCEL_JOIN, nil)
end

function GuildService.GetAppliedGuildsReq()
  Net.Send(Proto.MsgName.GetAppliedGuildsReq, {})
end

function GuildService.GetAppliedGuildsRsp(msg)
  GuildData.AppliedGuildInfos = msg.guildInfos
  UIMgr:SendWindowMessage(WinResConfig.GuildListWindow.name, WindowMsgEnum.GuildWindow.APPLIED_GUILD, nil)
end

function GuildService.QuickJoinGuildReq()
  Net.Send(Proto.MsgName.QuickJoinGuildReq, {})
end

function GuildService.QuickJoinGuildRsp(msg)
  GuildData.firstJoin = true
  GuildService.EnterGuild()
end

function GuildService.CreateGuildReq(name, rspCallBack)
  local msg = {}
  msg.name = name
  Net.Send(Proto.MsgName.CreateGuildReq, msg, rspCallBack)
end

function GuildService.CreateGuildRsp(msg)
  GuildData.firstCreate = true
  if msg.info then
    GuildData.GuildInfo = msg
    OpenWindow(WinResConfig.GuildWindow.name)
  end
end

function GuildService.SearchGuildByNameReq(name, offset)
  local msg = {}
  msg.name = name
  msg.offset = offset
  GuildMgr.SearchInfo = msg
  Net.Send(Proto.MsgName.SearchGuildByNameReq, msg)
end

function GuildService.SearchGuildByNameRsp(msg)
  if msg.hasMore then
    GuildService.SearchGuildByNameReq(GuildMgr.SearchInfo.name, GuildMgr.SearchInfo.offset + 1)
    for i, v in pairs(msg.infos) do
      table.insert(GuildData.ListInfos, v)
    end
  else
    GuildData.ListInfos = msg.infos
    UIMgr:SendWindowMessage(WinResConfig.GuildListWindow.name, WindowMsgEnum.GuildWindow.INIT_LIST_INFO, nil)
  end
end

function GuildService.SetGuildLevelLimitReq(levelLimit, rspCallBack)
  local msg = {}
  msg.levelLimit = levelLimit
  Net.Send(Proto.MsgName.SetGuildLevelLimitReq, msg, rspCallBack)
end

function GuildService.SetGuildLevelLimitRsp(msg)
  UIMgr:SendWindowMessage(WinResConfig.GuildWindow.name, WindowMsgEnum.GuildWindow.SET_LEVEL_LIMIT)
end

function GuildService.SetGuildTargetReq(targets, index)
  local msg = {}
  msg.allTargets = targets
  msg.targetIdxes = index
  Net.Send(Proto.MsgName.SetGuildTargetReq, msg)
end

function GuildService.SetGuildTargetRsp(msg)
end

function GuildService.ChangeGuildNameReq(name, rspCallBack)
  local msg = {}
  msg.name = name
  Net.Send(Proto.MsgName.ChangeGuildNameReq, msg, rspCallBack)
  GuildMgr.tempName = name
end

function GuildService.ChangeGuildNameRsp(msg)
  GuildData.GuildInfo.info.name = GuildMgr.tempName
  UIMgr:SendWindowMessage(WinResConfig.GuildWindow.name, WindowMsgEnum.GuildWindow.RENAME, nil)
  GuildMgr.tempName = nil
end

function GuildService.ProcessGuildJoinApplyReq(uin, bol)
  local msg = {}
  msg.applicantUin = uin
  msg.agree = bol
  Net.Send(Proto.MsgName.ProcessGuildJoinApplyReq, msg)
end

function GuildService.ProcessGuildJoinApplyRsp(msg)
  GuildService.GetGuildMembersReq()
end

function GuildService.ExitGuildReq(rspCallBack)
  Net.Send(Proto.MsgName.ExitGuildReq, {}, rspCallBack)
end

function GuildService.ExitGuildRsp(msg)
  GuildService.EnterGuild()
end

function GuildService.DismissGuildReq()
  Net.Send(Proto.MsgName.DismissGuildReq, {})
end

function GuildService.DismissGuildRsp(msg)
  GuildService.EnterGuild()
end

function GuildService.StartImpeachGuildLeaderReq()
  Net.Send(Proto.MsgName.StartImpeachGuildLeaderReq, {})
end

function GuildService.StartImpeachGuildLeaderRsp(msg)
  GuildData.GuildInfo.impeachInfo = msg.impeachInfo
  UIMgr:SendWindowMessage(WinResConfig.GuildWindow.name, WindowMsgEnum.GuildWindow.IMPEACH, nil)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.GUILD)
end

function GuildService.VoteImpeachGuildLeaderReq(bol)
  local msg = {}
  msg.approve = bol
  Net.Send(Proto.MsgName.VoteImpeachGuildLeaderReq, msg)
end

function GuildService.VoteImpeachGuildLeaderRsp(msg)
  GuildData.GuildInfo.impeachInfo = msg.impeachInfo
  UIMgr:SendWindowMessage(WinResConfig.GuildWindow.name, WindowMsgEnum.GuildWindow.IMPEACH, nil)
  UIMgr:SendWindowMessage(WinResConfig.GuildVoteWindow.name, WindowMsgEnum.GuildWindow.IMPEACH, nil)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.GUILD)
end

function GuildService.ChangeGuildIconReq(id)
  local msg = {}
  msg.iconId = id
  Net.Send(Proto.MsgName.ChangeGuildIconReq, msg)
  GuildMgr.tempHeadId = id
end

function GuildService.ChangeGuildIconRsp(msg)
  GuildData.GuildInfo.info.iconId = GuildMgr.tempHeadId
  UIMgr:SendWindowMessage(WinResConfig.GuildWindow.name, WindowMsgEnum.GuildWindow.CHANGE_ICON, nil)
  GuildMgr.tempHeadId = nil
  UIMgr:CloseWindow(WinResConfig.GuildIconChoiceWindow.name)
end

function GuildService.OperateGuildViceLeaderReq(targetUin, bol)
  local msg = {}
  msg.targetUin = targetUin
  msg.promote = bol
  Net.Send(Proto.MsgName.OperateGuildViceLeaderReq, msg)
end

function GuildService.OperateGuildViceLeaderRsp(msg)
  GuildService.GetGuildMembersReq()
  UIMgr:SendWindowMessage(WinResConfig.OtherPlayerInfoWindow.name, WindowMsgEnum.OtherPlayerInfoWindow.E_MSG_CLOSE)
end

function GuildService.KickOutGuildMemberReq(targetUin)
  local msg = {}
  msg.targetUin = targetUin
  Net.Send(Proto.MsgName.KickOutGuildMemberReq, msg)
end

function GuildService.KickOutGuildMemberRsp(msg)
  GuildService.GetGuildMembersReq()
  UIMgr:SendWindowMessage(WinResConfig.OtherPlayerInfoWindow.name, WindowMsgEnum.OtherPlayerInfoWindow.E_MSG_CLOSE)
end

function GuildService.TransferGuildLeaderReq(targetUin)
  local msg = {}
  msg.targetUin = targetUin
  Net.Send(Proto.MsgName.TransferGuildLeaderReq, msg)
end

function GuildService.TransferGuildLeaderRsp(msg)
  GuildService.GetGuildMembersReq()
  UIMgr:SendWindowMessage(WinResConfig.GuildWindow.name, WindowMsgEnum.GuildWindow.CHANGE_CAPTAIN, nil)
  UIMgr:SendWindowMessage(WinResConfig.OtherPlayerInfoWindow.name, WindowMsgEnum.OtherPlayerInfoWindow.E_MSG_CLOSE)
end

function GuildService.GetGuildMembersReq(rspCallBack)
  Net.Send(Proto.MsgName.GetGuildMembersReq, {}, rspCallBack)
end

function GuildService.GetGuildMembersRsp(msg)
  if GuildData.GuildInfo then
    GuildData.GuildInfo.members = msg.members
    GuildData.GuildInfo.applicants = msg.applicants
    UIMgr:SendWindowMessage(WinResConfig.GuildWindow.name, WindowMsgEnum.GuildWindow.GUILD_JOIN_APPLY, nil)
  end
  UIMgr:SendWindowMessage(WinResConfig.ChatWindow.name, WindowMsgEnum.ChatWindow.E_MSG_GUILD_MEMBERS, msg)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.GUILD)
end

function GuildService.GetImpeachInfoReq()
  Net.Send(Proto.MsgName.GetImpeachInfoReq, {})
end

function GuildService.GetImpeachInfoRsp(msg)
  if msg.impeaching then
    GuildData.GuildInfo.impeachInfo = msg.info
    OpenWindow(WinResConfig.GuildVoteWindow.name)
  end
end

function GuildService.GetActorSignInReq(rspCallBack)
  Net.Send(Proto.MsgName.GetActorSignInReq, {}, rspCallBack)
end

function GuildService.GetActorSignInRsp(msg)
  GuildData.signInInfo = msg
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.GUILD)
end

function GuildService.ChangeGuildNoticeReq(notice)
  local m = {}
  m.notice = notice
  Net.Send(Proto.MsgName.ChangeGuildNoticeReq, m)
end

function GuildService.ChangeGuildNoticeRsp(msg)
  GuildData.UpdateNotice(msg.notice)
  UIMgr:SendWindowMessage(WinResConfig.ChatWindow.name, WindowMsgEnum.ChatWindow.E_MSG_GUILD_NOTICE_UPDATE)
  UIMgr:SendWindowMessage(WinResConfig.GuildWindow.name, WindowMsgEnum.GuildWindow.CHANGE_NOTICE)
end

function GuildService.ActorSignInReq(rspCallBack)
  Net.Send(Proto.MsgName.ActorSignInReq, {}, rspCallBack)
end

function GuildService.ActorSignInRsp(msg)
  if msg.reward then
    GetItemTips.Show({
      msg.reward
    })
  end
  GuildData.signInInfo = msg
  UIMgr:SendWindowMessage(WinResConfig.GuildSupplyWindow.name, WindowMsgEnum.GuildWindow.SIGN_IN)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.GUILD)
end

function GuildService.GetGuildPracticeRankReq(stageId, rspCallBack)
  local m = {}
  m.stageId = stageId
  Net.Send(Proto.MsgName.GetGuildPracticeRankReq, m, rspCallBack)
end

function GuildService.GetGuildPracticeRankRsp(msg)
  GuildData.SaveTrainRankData(msg)
  UIMgr:SendWindowMessage(WinResConfig.GuildTrainWindow.name, WindowMsgEnum.GuildWindow.GET_TRAIN_RANK)
end

function GuildService.GetGuildPracticeRecordReq(stageId, targetUin, rspCallBack)
  local m = {}
  m.stageId = stageId
  m.targetUin = targetUin
  Net.Send(Proto.MsgName.GetGuildPracticeRecordReq, m, rspCallBack)
end

function GuildService.GetGuildPracticeRecordRsp(msg)
  GuildData.SaveTrainDetailsData(msg.record)
  UIMgr:SendWindowMessage(WinResConfig.TeamDetailsWindow.name, WindowMsgEnum.GuildWindow.GET_TRAIN_DETAILS)
end

GuildService.Init()
