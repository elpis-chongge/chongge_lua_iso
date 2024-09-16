ChatMgr = {}

function ChatMgr.FriendChatEnable(showTips)
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_FRIEND, showTips) == false then
    return false
  end
  return true
end

function ChatMgr.GuildChannelEnable(showTips)
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_GUILD, showTips) == false then
    return false
  end
  local guildSimpleInfo = GuildData.GetGuildSimpleInfo()
  if nil == guildSimpleInfo then
    return false
  end
  if 0 == guildSimpleInfo.guildUid then
    if true == showTips or nil == showTips then
      FloatTipsUtil.ShowWarnTips(T(10108))
    end
    return false
  else
    return true
  end
end

function ChatMgr.GetChatMsgInit()
  if ChatData.msgInited == true then
    return
  end
  ChatData.msgInited = true
  ChatData.ClearCacheMsg()
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_CHAT, false) then
    ChatService.GetChannelNewestMessageReq()
  end
end

function ChatMgr.SyncAllMessage()
  ChatService.GetEmojiReq()
  local channel = ProtoEnum.IM_SESSION_TYPE.WORLD
  ChatService.SyncMessageReq(ChatData.GetSyncKey(channel), channel)
  channel = ProtoEnum.IM_SESSION_TYPE.UNION
  ChatService.SyncMessageReq(ChatData.GetSyncKey(channel), channel)
  channel = ProtoEnum.IM_SESSION_TYPE.PRIVATE
  ChatService.SyncMessageReq(ChatData.GetSyncKey(channel), channel)
end

function ChatMgr.SyncUnionMessage()
  local channel = ProtoEnum.IM_SESSION_TYPE.UNION
  ChatService.SyncMessageReq(ChatData.GetSyncKey(channel), channel)
end

function ChatMgr.UpdateLineProgress(lineInfo, hand)
  if lineInfo and hand then
    local progressBar = hand:GetChild("NumberProgressBar")
    local bar
    if progressBar then
      progressBar.value = lineInfo.loadPercent / 100
      bar = progressBar:GetChild("bar")
    end
    if lineInfo.loadPercent >= 7500 then
      ChangeUIController(hand, "c1", 2)
      ChangeUIController(bar, "c1", 2)
    elseif lineInfo.loadPercent >= 5000 then
      ChangeUIController(hand, "c1", 1)
      ChangeUIController(bar, "c1", 1)
    else
      ChangeUIController(hand, "c1", 0)
      ChangeUIController(bar, "c1", 0)
    end
  end
end

function ChatMgr.GetLineName(lineId)
  return LuaUtil.FormatNum(lineId)
end

function ChatMgr.OpenActorInfo(sender, msg)
  ActorService.GetOtherDetailInfoReq(sender.uin, function(param)
    OpenWindow(WinResConfig.OtherPlayerInfoWindow.name, nil, param, msg)
  end)
end

function ChatMgr.SendEmoji(url, privateTarget, emojiId)
  local text = "<img src='" .. url .. "'/>"
  ChatData.UpdateLatestEmoji(text)
  ChatService.SendMessageReq(text, ChatData.GetSelectChannel(), privateTarget and privateTarget.uin, ProtoEnum.MSG_TYPE.MSG_EMOJI, emojiId)
end
