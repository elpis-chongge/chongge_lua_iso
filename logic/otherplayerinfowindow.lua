require("OtherPlayerInfo_OtherPlayerInfoWindowByName")
local OtherPlayerInfoWindow = {}
local uis, contentPane, otherPlayerInfo, actorInfo, actorState, actorRemark, msg, isGuildEnter

function OtherPlayerInfoWindow.ReInitData()
end

function OtherPlayerInfoWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.OtherPlayerInfoWindow.package, WinResConfig.OtherPlayerInfoWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    if bridgeObj.argTable[3] then
      actorInfo = bridgeObj.argTable[3]
      actorState = ProtoEnum.RELATION_STATE.RS_NONE
      isGuildEnter = true
    else
      otherPlayerInfo = bridgeObj.argTable[1]
      actorInfo = otherPlayerInfo.info
      actorState = otherPlayerInfo.relationState
      actorRemark = otherPlayerInfo.remark
      msg = bridgeObj.argTable[2]
    end
    uis = GetOtherPlayerInfo_OtherPlayerInfoWindowUis(contentPane)
    OtherPlayerInfoWindow.UpdateInfo()
    OtherPlayerInfoWindow.InitBtn()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_SHOW)
  end)
end

function OtherPlayerInfoWindow.UpdateInfo()
  OtherPlayerInfoWindow.UpdateActorInfo()
  OtherPlayerInfoWindow.UpdateCardShow()
end

function OtherPlayerInfoWindow.UpdateActorInfo()
  local info = uis.Main.OtherPlayerInfo1.Info
  info.NameTxt.text = actorInfo.name
  if actorInfo.isOnline == true then
    info.OnLine.c1Ctr.selectedIndex = 1
  else
    info.OnLine.c1Ctr.selectedIndex = 0
    info.OnLine.TimeTxt.text = TimeUtil.FormatOfflineTime(LoginData.GetCurServerTime() - (actorInfo.activeStamp or actorInfo.lastLoginStamp))
  end
  if otherPlayerInfo and otherPlayerInfo.inGuild then
    info.GuildTxt.text = otherPlayerInfo.guildName
  elseif actorInfo.guildUid and 0 ~= actorInfo.guildUid then
    info.GuildTxt.text = actorInfo.guildName
  else
    info.GuildTxt.text = T(10083)
  end
  info.LevelTxt.text = T(10155, actorInfo.level)
  local list = info.FunctionList
  list:RemoveChildrenToPool()
  local btnTable = {
    {
      name = T(292),
      subName = T(642),
      func = OtherPlayerInfoWindow.SetGuildViceCaptain,
      visible = OtherPlayerInfoWindow.GuildViceCaptainVisible
    },
    {
      name = T(298),
      subName = T(643),
      func = OtherPlayerInfoWindow.SetGuildTeam,
      visible = OtherPlayerInfoWindow.GuildTeamVisible
    },
    {
      name = T(293),
      subName = T(644),
      func = OtherPlayerInfoWindow.KickOutGuild,
      visible = OtherPlayerInfoWindow.OutGuildVisible
    },
    {
      name = T(297),
      subName = T(645),
      func = OtherPlayerInfoWindow.SetGuildLeader,
      visible = OtherPlayerInfoWindow.GuildLeaderVisible
    },
    {
      name = T(10084),
      subName = T(10085),
      func = OtherPlayerInfoWindow.ClickInfoBtn
    },
    {
      name = T(10090),
      subName = T(10091),
      func = OtherPlayerInfoWindow.ClickAddFriendBtn,
      visible = OtherPlayerInfoWindow.AddFriendVisible
    },
    {
      name = T(10092),
      subName = T(10093),
      func = OtherPlayerInfoWindow.ClickPrivateChatBtn
    },
    {
      name = T(10088),
      subName = T(10089),
      func = OtherPlayerInfoWindow.ClickBlockBtn,
      visible = OtherPlayerInfoWindow.BlockVisible
    },
    {
      name = T(10152),
      subName = T(10153),
      func = OtherPlayerInfoWindow.ClickUnBlockBtn,
      visible = OtherPlayerInfoWindow.UnBlockVisible
    },
    {
      name = T(10139),
      subName = T(10140),
      func = OtherPlayerInfoWindow.ClickChallengeBtn,
      visible = OtherPlayerInfoWindow.ChallengeVisible
    },
    {
      name = T(10137),
      subName = T(10138),
      func = OtherPlayerInfoWindow.ClickRemarkBtn,
      visible = OtherPlayerInfoWindow.RemarkVisible
    },
    {
      name = T(10086),
      subName = T(10087),
      func = OtherPlayerInfoWindow.ClickReportBtn,
      visible = OtherPlayerInfoWindow.ReportVisible
    }
  }
  for i, v in ipairs(btnTable) do
    local visible = v.visible == nil and true or v.visible()
    if visible then
      local hand = list:AddItemFromPool()
      hand.onClick:Set(v.func)
      UIUtil.SetBtnText(hand, v.name, v.subName)
    end
  end
end

function OtherPlayerInfoWindow.UpdateCardShow()
  local cardShowAni = uis.Main.OtherPlayerInfo1.CardShowAni
  local cardShow = cardShowAni.CardShow
  PlayUITrans(cardShowAni.root, "in")
  UIUtil.SetCardShowSpineAutoAlpha(actorInfo.faceId, cardShow.CardShowLoader, cardShow.CardShowHolder)
end

function OtherPlayerInfoWindow.GuildTeamVisible()
  return isGuildEnter and actorInfo.roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_VICE_LEADER and actorInfo.myRoleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER
end

function OtherPlayerInfoWindow.GuildViceCaptainVisible()
  return isGuildEnter and actorInfo.viceCaptainMax == false and actorInfo.myRoleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER and actorInfo.roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_NORMAL
end

function OtherPlayerInfoWindow.GuildLeaderVisible()
  return isGuildEnter and actorInfo.myRoleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER and actorInfo.roleType ~= ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER
end

function OtherPlayerInfoWindow.OutGuildVisible()
  if isGuildEnter then
    if actorInfo.myRoleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER then
      return true
    elseif actorInfo.myRoleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_VICE_LEADER and actorInfo.roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_NORMAL then
      return true
    end
  end
  return false
end

function OtherPlayerInfoWindow.ReportVisible()
  return nil ~= msg
end

function OtherPlayerInfoWindow.BlockVisible()
  return actorState ~= ProtoEnum.RELATION_STATE.FRIEND and actorState ~= ProtoEnum.RELATION_STATE.BLOCK and nil == isGuildEnter
end

function OtherPlayerInfoWindow.UnBlockVisible()
  return actorState == ProtoEnum.RELATION_STATE.BLOCK
end

function OtherPlayerInfoWindow.AddFriendVisible()
  return actorState ~= ProtoEnum.RELATION_STATE.FRIEND
end

function OtherPlayerInfoWindow.ChallengeVisible()
  return false
end

function OtherPlayerInfoWindow.RemarkVisible()
  return actorState == ProtoEnum.RELATION_STATE.FRIEND
end

function OtherPlayerInfoWindow.SetGuildViceCaptain()
  if OtherPlayerInfoWindow.FreezeAuthorityTips() then
    MessageBox.Show(T(1638, actorInfo.name), {
      touchCallback = function()
        ld("Guild", function()
          GuildService.OperateGuildViceLeaderReq(actorInfo.uin, true)
        end)
      end
    }, {})
  end
end

function OtherPlayerInfoWindow.SetGuildLeader()
  if OtherPlayerInfoWindow.FreezeAuthorityTips() then
    MessageBox.Show(T(312, actorInfo.name), {
      touchCallback = function()
        GuildService.TransferGuildLeaderReq(actorInfo.uin)
      end
    }, {})
  end
end

function OtherPlayerInfoWindow.SetGuildTeam()
  if OtherPlayerInfoWindow.FreezeAuthorityTips() then
    MessageBox.Show(T(1639, actorInfo.name), {
      touchCallback = function()
        ld("Guild", function()
          GuildService.OperateGuildViceLeaderReq(actorInfo.uin, false)
        end)
      end
    }, {})
  end
end

function OtherPlayerInfoWindow.FreezeAuthorityTips()
  if 1 == actorInfo.myRoleType and actorInfo.impeaching then
    FloatTipsUtil.ShowWarnTips(T(314))
    return false
  end
  return true
end

function OtherPlayerInfoWindow.KickOutGuild()
  if OtherPlayerInfoWindow.FreezeAuthorityTips() then
    MessageBox.Show(T(311, actorInfo.name), {
      touchCallback = function()
        GuildService.KickOutGuildMemberReq(actorInfo.uin)
      end
    }, {})
  end
end

function OtherPlayerInfoWindow.ClickInfoBtn()
  if otherPlayerInfo then
    OpenWindow(WinResConfig.PlayerWindow.name, nil, otherPlayerInfo)
  else
    ActorService.GetOtherDetailInfoReq(actorInfo.uin, function(param)
      OpenWindow(WinResConfig.PlayerWindow.name, nil, param)
    end)
  end
end

function OtherPlayerInfoWindow.ClickReportBtn()
  if string.find(msg.content, "<img src='ui://") then
    FloatTipsUtil.ShowWarnTips(T(10094))
    return
  end
  OpenWindow(WinResConfig.ComplaintWindow.name, nil, actorInfo, msg)
end

function OtherPlayerInfoWindow.ClickBlockBtn()
  MessageBox.Show(T(10149, actorInfo.name), {
    touchCallback = function()
      ld("Friend", function()
        FriendService.BlockTargetReq(actorInfo.uin)
      end)
    end
  }, {})
end

function OtherPlayerInfoWindow.ClickUnBlockBtn()
  ld("Friend", function()
    FriendService.DeleteRelationReq(actorInfo.uin)
  end)
end

function OtherPlayerInfoWindow.ClickAddFriendBtn()
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_FRIEND) then
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_FRIEND, false, actorInfo.level) == false then
      FloatTipsUtil.ShowWarnTips(T(10146))
      return
    end
    if actorState == ProtoEnum.RELATION_STATE.BLOCK then
      FloatTipsUtil.ShowWarnTips(T(10150))
      return
    end
    ld("Friend", function()
      FriendService.ApplyAddFriendReq(actorInfo.uin)
    end)
  end
end

function OtherPlayerInfoWindow.ClickPrivateChatBtn()
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_CHAT) then
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_CHAT, false, actorInfo.level) == false then
      FloatTipsUtil.ShowWarnTips(T(10145))
      return
    end
    if actorState == ProtoEnum.RELATION_STATE.BLOCK then
      FloatTipsUtil.ShowWarnTips(T(10150))
      return
    end
    if false == UIMgr:IsWindowOpen(WinResConfig.ChatWindow.name) then
      OpenWindow(WinResConfig.ChatWindow.name, nil, ProtoEnum.IM_SESSION_TYPE.PRIVATE)
    end
    ChatService.SyncPrivateHistoryMessageReq(actorInfo)
  end
end

function OtherPlayerInfoWindow.ClickChallengeBtn()
end

function OtherPlayerInfoWindow.ClickRemarkBtn()
  OpenWindow(WinResConfig.RenameWindow.name, nil, {
    titleTxt = T(10141),
    subTitleTxt = T(10142),
    text = actorRemark,
    promptText = T(10143),
    sureFunc = function(text)
      text = string.gsub(text, " ", "")
      text = string.gsub(text, "　", "")
      if actorRemark == text then
        return
      end
      if string.len(text) <= 0 then
        FloatTipsUtil.ShowWarnTips(T(10144))
        return
      end
      if SensitiveWordsUtil.IsContainBlockedWord(text) == true then
        FloatTipsUtil.ShowWarnTips(T(11160))
        return
      end
      FriendService.SetRelationRemarkReq(actorInfo.uin, text)
      return true
    end
  })
end

function OtherPlayerInfoWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Add(OtherPlayerInfoWindow.Close)
  uis.Main.OtherPlayerInfo1.CloseBtn.onClick:Add(OtherPlayerInfoWindow.Close)
end

function OtherPlayerInfoWindow.Close()
  UIMgr:CloseWindow(WinResConfig.OtherPlayerInfoWindow.name)
end

function OtherPlayerInfoWindow.OnClose()
  uis = nil
  contentPane = nil
  otherPlayerInfo = nil
  actorInfo = nil
  actorState = nil
  actorRemark = nil
  msg = nil
  isGuildEnter = nil
end

function OtherPlayerInfoWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.OtherPlayerInfoWindow.E_MSG_CLOSE then
    OtherPlayerInfoWindow.Close()
  elseif msgId == WindowMsgEnum.FRIEND.RELATION_CHANGE then
    if para and para.targetUin == actorInfo.uin then
      actorState = para.state
      OtherPlayerInfoWindow.UpdateActorInfo()
      return
    end
    local state = FriendData.GetRelationState(actorInfo.uin)
    if state then
      actorState = state
    end
    OtherPlayerInfoWindow.UpdateActorInfo()
  end
end

return OtherPlayerInfoWindow
