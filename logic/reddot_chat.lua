RedDotChat = {}

function RedDotChat.HaveUnreadUnionMsg()
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_GUILD, false) == false then
    return false
  end
  if false == EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_CHAT, false) then
    return false
  end
  ld("Chat")
  return ChatData.unionUnRead
end

function RedDotChat.HaveUnreadPrivateMsg()
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_CHAT, false) == false then
    return false
  end
  ld("Chat")
  return #ChatData.unReadTargetUinLst > 0
end

function RedDotChat.IsUnreadPrivateTarget(uin)
  ld("Chat")
  if #ChatData.unReadTargetUinLst <= 0 then
    return false
  end
  return table.contain(ChatData.unReadTargetUinLst, uin)
end
