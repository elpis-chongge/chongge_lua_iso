require("Chat_ChatWindowByName")
local ChatWindow = {}
local defaultChatChannel = {
  {
    name = "WorldBtn",
    channelBtn = nil,
    type = ProtoEnum.IM_SESSION_TYPE.WORLD,
    textId = 10070,
    subTextId = 10071,
    listSelectIndex = 0
  },
  {
    name = "GuildBtn",
    channelBtn = nil,
    type = ProtoEnum.IM_SESSION_TYPE.UNION,
    textId = 10072,
    subTextId = 10073,
    listSelectIndex = 1,
    enable = function(showTips)
      return ChatMgr.GuildChannelEnable(showTips)
    end,
    redDotFunc = function(btn)
      RedDotMgr.AddNode({
        windowName = WinResConfig.ChatWindow.name,
        com = btn,
        visibleFunc = function()
          return RedDotChat.HaveUnreadUnionMsg() and ChatData.GetSelectChannel() ~= ProtoEnum.IM_SESSION_TYPE.UNION
        end,
        dataType = RED_DOT_DATA_TYPE.CHAT
      })
    end
  },
  {
    name = "PrivateBtn",
    channelBtn = nil,
    type = ProtoEnum.IM_SESSION_TYPE.PRIVATE,
    textId = 10074,
    subTextId = 10075,
    listSelectIndex = 2,
    redDotFunc = function(btn)
      RedDotMgr.AddNode({
        windowName = WinResConfig.ChatWindow.name,
        com = btn,
        visibleFunc = function()
          return RedDotChat.HaveUnreadPrivateMsg() and ChatData.GetSelectChannel() ~= ProtoEnum.IM_SESSION_TYPE.PRIVATE
        end,
        dataType = RED_DOT_DATA_TYPE.CHAT
      })
    end
  }
}
local ProtoChannelToTransitionIndex = {
  [ProtoEnum.IM_SESSION_TYPE.WORLD] = 0,
  [ProtoEnum.IM_SESSION_TYPE.UNION] = 1,
  [ProtoEnum.IM_SESSION_TYPE.PRIVATE] = 2
}
local uis, contentPane, curSelectPrivateChatPlayer, channelList, privateList, privateWordList, otherWordList, guildWordList, emojiList, emojiGroupList, banishList, friendList, emojiChoice, emojiInfoList, emojiGroupId
local FRIEND_TYPE = {FRIEND = 1, GUILD_MEMBER = 2}
local selectFriendType, jumpTb, newMessage, friendListAnim, banishListAnim

function ChatWindow.ReInitData()
end

function ChatWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ChatWindow.package, WinResConfig.ChatWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetChat_ChatWindowUis(contentPane)
    emojiChoice = uis.Main.EmojiChoice
    ChatWindow.SetPlayerList(false, false)
    local defaultChannel = bridgeObj.argTable[1] or ProtoEnum.IM_SESSION_TYPE.WORLD
    ChatData.SetSelectChannel(defaultChannel, false)
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_GUILD, false) == true then
      ld("Guild", function()
        GuildService.GetMyGuildSimpleInfoReq()
      end)
    end
    if true == EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_FRIEND, false) then
      ld("Friend", function()
        if FriendData.init == false then
          FriendService.GetFriendsReq()
        end
      end)
    end
    emojiInfoList = ChatData.InitEmoji()
    ChatWindow.InitList()
    ChatWindow.InitBtn()
    ChatWindow.InitText()
    ChatService.GetChatStateReq()
    ChatMgr.SyncAllMessage()
  end)
end

function ChatWindow.InitList()
  channelList = uis.Main.Frame.ChannelRegion.ChannelList.ChannelList
  channelList:SetVirtual()
  channelList.itemRenderer = ChatWindow.RenderChannel
  privateList = uis.Main.Frame.ChannelRegion.PrivateList.PrivateList
  privateList:SetVirtual()
  privateList.itemRenderer = ChatWindow.RenderPrivate
  privateWordList = uis.Main.Frame.WordList.PrivateWordList
  privateWordList:SetVirtual()
  privateWordList.itemProvider = ChatWindow.GetPrivateWordItemResource
  privateWordList.itemRenderer = ChatWindow.RenderPrivateWord
  otherWordList = uis.Main.Frame.WordList.OtherWordList
  otherWordList:SetVirtual()
  otherWordList.itemProvider = ChatWindow.GetOtherWordItemResource
  otherWordList.itemRenderer = ChatWindow.RenderOtherWord
  guildWordList = uis.Main.Frame.WordList.GuildWordList
  guildWordList:SetVirtual()
  guildWordList.itemProvider = ChatWindow.GetGuildWordItemResource
  guildWordList.itemRenderer = ChatWindow.RenderGuildWord
  emojiList = uis.Main.EmojiChoice.PicList
  emojiList:SetVirtual()
  emojiList.itemRenderer = ChatWindow.RenderEmoji
  emojiGroupList = uis.Main.EmojiChoice.TypeList
  emojiGroupList:SetVirtual()
  emojiGroupList.itemRenderer = ChatWindow.RenderEmojiGroup
  banishList = uis.Main.PlayerListAni.PlayerList.BanishList
  banishList:SetVirtual()
  banishList.itemRenderer = ChatWindow.RenderBanishPlayer
  friendList = uis.Main.PlayerListAni.PlayerList.FriendList
  friendList:SetVirtual()
  friendList.itemRenderer = ChatWindow.RenderFriend
end

function ChatWindow.InitTextInput()
end

function ChatWindow.UpdateInfo(channel)
  if channel == ProtoEnum.IM_SESSION_TYPE.WORLD then
    ChatWindow.UpdateWorldChannel()
  elseif channel == ProtoEnum.IM_SESSION_TYPE.UNION then
    ChatWindow.UpdateUnionChannel()
  elseif channel == ProtoEnum.IM_SESSION_TYPE.PRIVATE and channel == ChatData.GetSelectChannel() then
    ChatWindow.UpdatePrivateChannel()
  end
  ChatWindow.UpdateLine()
end

function ChatWindow.UpdateWorldChannel()
  channelList.numItems = 3
end

function ChatWindow.UpdateUnionChannel()
  channelList.numItems = 3
end

function ChatWindow.UpdatePrivateChannel()
  ChatWindow.UpdateChattingPlayerList()
end

function ChatWindow.UpdateSelectChannel()
  local frame = uis.Main.Frame
  local selectChannel = ChatData.GetSelectChannel()
  frame.c1Ctr.selectedIndex = ProtoChannelToTransitionIndex[selectChannel]
  frame.ChannelRegion.c1Ctr.selectedIndex = ProtoChannelToTransitionIndex[selectChannel]
  for i, info in ipairs(defaultChatChannel) do
    if info.enable and info.enable(false) == false then
      ChangeUIController(info.channelBtn, "c1", 2)
    elseif info.type == ChatData.GetSelectChannel() then
      channelList.selectedIndex = info.listSelectIndex
      ChangeUIController(info.channelBtn, "c1", 1)
    else
      ChangeUIController(info.channelBtn, "c1", 0)
    end
  end
end

function ChatWindow.RenderChannel(index, item)
  local info = defaultChatChannel[index + 1]
  if item then
    info.channelBtn = item
    if info.enable and info.enable(false) == false then
      ChangeUIController(item, "c1", 2)
    elseif info.type == ChatData.GetSelectChannel() then
      channelList.selectedIndex = info.listSelectIndex
      ChangeUIController(item, "c1", 1)
    else
      ChangeUIController(item, "c1", 0)
    end
    if info.redDotFunc then
      info.redDotFunc(item)
    else
      RedDotMgr.RemoveOneNode(WinResConfig.ChatWindow.name, item)
    end
    UIUtil.SetBtnText(item, T(info.textId), T(info.subTextId))
    item.soundFmod = SOUND_EVENT_ENUM.TAB_TAG2
    item.onClick:Set(function()
      if info.enable and info.enable() ~= true then
        return
      end
      if channelList.selectedIndex ~= info.listSelectIndex then
        ChatData.SetSelectChannel(info.type)
        curSelectPrivateChatPlayer = nil
        if info.type == ProtoEnum.IM_SESSION_TYPE.PRIVATE then
          ChatService.GetPrivateChattingTargetReq()
        else
          ChatWindow.UpdateChatWordList()
          if info.type == ProtoEnum.IM_SESSION_TYPE.UNION and true == ChatData.unionUnRead then
            local allMsg = ChatData.GetCacheChatMsg(info.type)
            ChatService.MarkMessageReadReq(info.type, allMsg[#allMsg].msgId)
            ChatData.unionUnRead = false
            RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.CHAT)
          end
        end
      end
    end)
    if ChatData.GetSelectChannel() == info.type then
      item.onClick:Call()
    end
  end
end

function ChatWindow.RenderPrivate(index, item)
  local chattingPlayerList = ChatData.GetPrivateTargetList()
  local playerInfo = chattingPlayerList[index + 1]
  if playerInfo then
    local targetBtn = item:GetChild("TargetBtn")
    targetBtn.changeStateOnClick = false
    targetBtn.onClick:Set(function()
      ChatService.SyncPrivateHistoryMessageReq(playerInfo)
    end)
    UIUtil.SetHeadByFaceId(playerInfo.faceId, targetBtn:GetChild("PlayerHeadBg"):GetChild("PicLoader"), HEAD_ICON_TYPE_ENUM.RECT)
    targetBtn:GetChild("NameTxt").text = playerInfo.name
    item:GetChild("DeletePrivateBtn").onClick:Set(function()
      if curSelectPrivateChatPlayer.uin == playerInfo.uin then
        curSelectPrivateChatPlayer = nil
      end
      ChatData.RemovePrivateTarget(playerInfo)
    end)
    if nil == curSelectPrivateChatPlayer then
      curSelectPrivateChatPlayer = playerInfo
      targetBtn.onClick:Call()
    end
    if curSelectPrivateChatPlayer.uin == playerInfo.uin then
      targetBtn.selected = true
    else
      targetBtn.selected = false
    end
    RedDotMgr.AddNode({
      windowName = WinResConfig.ChatWindow.name,
      com = targetBtn,
      visibleFunc = function()
        return RedDotChat.IsUnreadPrivateTarget(playerInfo.uin) and curSelectPrivateChatPlayer.uin ~= playerInfo.uin
      end,
      dataType = RED_DOT_DATA_TYPE.CHAT
    })
  end
end

function ChatWindow.GetOtherWordItemResource(index)
  local allMsg = ChatData.GetCacheChatMsg(ChatData.GetSelectChannel())
  if nil == allMsg then
    return
  end
  local msg = allMsg[index + 1]
  if msg then
    if msg.fromUin then
      return msg.msgType == ProtoEnum.MSG_TYPE.MSG_EMOJI and "ui://Chat/ChatWordItem1" or "ui://Chat/ChatWordItem"
    else
      return "ui://Chat/SystemWordItem"
    end
  end
end

function ChatWindow.GetGuildWordItemResource(index)
  local allMsg = ChatData.GetCacheChatMsg(ChatData.GetSelectChannel())
  if nil == allMsg then
    return
  end
  local msg = allMsg[index + 1]
  if msg then
    if msg.msgType == ProtoEnum.MSG_TYPE.MSG_JOIN_GUILD then
      return "ui://Chat/GuildSystemWordItem"
    else
      return msg.msgType == ProtoEnum.MSG_TYPE.MSG_EMOJI and "ui://Chat/ChatWordItem1" or "ui://Chat/ChatWordItem"
    end
  end
end

function ChatWindow.RenderOtherWord(index, item)
  local allMsg = ChatData.GetCacheChatMsg(ChatData.GetSelectChannel())
  if nil == allMsg then
    return
  end
  local msg = allMsg[index + 1]
  if msg then
    local worldList = uis.Main.Frame.WordList
    if msg.fromUin then
      item:GetChild("LeftWord"):GetChild("WordTxt").text = ""
      item:GetChild("RightWord"):GetChild("WordTxt").text = ""
      local wordItem
      local isSelf = ChatData.IsSelfMsg(msg)
      local name, head, sender
      if isSelf then
        ChangeUIController(item, "c1", 1)
        wordItem = item:GetChild("RightWord")
        sender = ActorData.GetActorInfo()
        name = ActorData.GetName()
        head = wordItem:GetChild("Head")
      else
        ChangeUIController(item, "c1", 0)
        wordItem = item:GetChild("LeftWord")
        sender = ChatData.GetSenderInfo(msg.fromUin)
        name = sender.name
        head = wordItem:GetChild("Head")
      end
      wordItem:GetChild("TimeTxt").text = ""
      UIUtil.ShowPlayerHead(sender, head, true ~= isSelf and function()
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_TAG_ON_CLICK)
        ChatMgr.OpenActorInfo(sender, msg)
      end)
      wordItem:GetChild("NameTxt").text = name
      local wordTxt = wordItem:GetChild("WordTxt")
      wordTxt.maxWidth = math.floor(worldList.root.width * 0.6)
      if string.find(msg.content, "<img src='ui://") then
        wordTxt.text = msg.content
      else
        wordTxt.text = SensitiveWordsUtil.FilterWord(msg.content)
      end
    else
      local wordTxt = item:GetChild("WordTxt")
      wordTxt.maxWidth = math.floor(worldList.root.width * 0.8)
      wordTxt.text = SensitiveWordsUtil.FilterWord(msg.content)
      local titleTxt = item:GetChild("TitleTxt")
      if titleTxt then
        titleTxt.text = T(11005)
      end
    end
    if newMessage and newMessage.msgId == msg.msgId then
      PlayUITrans(item, "in")
    end
  end
end

function ChatWindow.RenderGuildWord(index, item)
  local allMsg = ChatData.GetCacheChatMsg(ChatData.GetSelectChannel())
  if nil == allMsg then
    return
  end
  local msg = allMsg[index + 1]
  if msg then
    local worldList = uis.Main.Frame.WordList
    if msg.msgType == ProtoEnum.MSG_TYPE.MSG_JOIN_GUILD then
      local sender = ChatData.GetSenderInfo(msg.fromUin)
      local name = sender.name
      local wordTxt = item:GetChild("WordTxt")
      wordTxt.text = T(11004, name)
      local titleTxt = item:GetChild("TitleTxt")
      if titleTxt then
        titleTxt.text = T(11005)
      end
    else
      item:GetChild("LeftWord"):GetChild("WordTxt").text = ""
      item:GetChild("RightWord"):GetChild("WordTxt").text = ""
      local wordItem
      local isSelf = ChatData.IsSelfMsg(msg)
      local name, head, sender
      if isSelf then
        ChangeUIController(item, "c1", 1)
        wordItem = item:GetChild("RightWord")
        sender = ActorData.GetActorInfo()
        name = ActorData.GetName()
        head = wordItem:GetChild("Head")
      else
        ChangeUIController(item, "c1", 0)
        wordItem = item:GetChild("LeftWord")
        sender = ChatData.GetSenderInfo(msg.fromUin)
        name = sender.name
        head = wordItem:GetChild("Head")
      end
      wordItem:GetChild("TimeTxt").text = T(10115, TimeUtil.FormatOfflineTime(LoginData.GetCurServerTime() - msg.stamp))
      UIUtil.ShowPlayerHead(sender, head, true ~= isSelf and function()
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_TAG_ON_CLICK)
        ChatMgr.OpenActorInfo(sender, msg)
      end)
      wordItem:GetChild("NameTxt").text = name
      local wordTxt = wordItem:GetChild("WordTxt")
      wordTxt.maxWidth = math.floor(worldList.root.width * 0.6)
      if string.find(msg.content, "<img src='ui://") then
        wordTxt.text = msg.content
      else
        wordTxt.text = SensitiveWordsUtil.FilterWord(msg.content)
      end
    end
    if newMessage and newMessage.msgId == msg.msgId then
      PlayUITrans(item, "in")
    end
  end
end

function ChatWindow.GetPrivateWordItemResource(index)
  if nil == curSelectPrivateChatPlayer then
    return
  end
  local allMsg = ChatData.GetPrivateMsg(curSelectPrivateChatPlayer.uin)
  if nil == allMsg then
    return
  end
  local msg = allMsg[index + 1]
  if msg then
    if msg.fromUin then
      return msg.msgType == ProtoEnum.MSG_TYPE.MSG_EMOJI and "ui://Chat/ChatWordItem1" or "ui://Chat/ChatWordItem"
    else
      return "ui://Chat/SystemWordItem"
    end
  end
end

function ChatWindow.RenderPrivateWord(index, item)
  if nil == curSelectPrivateChatPlayer then
    return
  end
  local allMsg = ChatData.GetPrivateMsg(curSelectPrivateChatPlayer.uin)
  if nil == allMsg then
    return
  end
  local msg = allMsg[index + 1]
  if msg then
    local worldList = uis.Main.Frame.WordList
    if msg.fromUin then
      item:GetChild("LeftWord"):GetChild("WordTxt").text = ""
      item:GetChild("RightWord"):GetChild("WordTxt").text = ""
      local wordItem
      local isSelf = ChatData.IsSelfMsg(msg)
      local name, head, sender
      if isSelf then
        ChangeUIController(item, "c1", 1)
        wordItem = item:GetChild("RightWord")
        sender = ActorData.GetActorInfo()
        name = ActorData.GetName()
        head = wordItem:GetChild("Head")
      else
        ChangeUIController(item, "c1", 0)
        wordItem = item:GetChild("LeftWord")
        sender = ChatData.GetSenderInfo(msg.fromUin)
        name = sender.name
        head = wordItem:GetChild("Head")
      end
      wordItem:GetChild("TimeTxt").text = T(10115, TimeUtil.FormatOfflineTime(LoginData.GetCurServerTime() - msg.stamp))
      UIUtil.ShowPlayerHead(sender, head, true ~= isSelf and function()
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_TAG_ON_CLICK)
        ChatMgr.OpenActorInfo(sender, msg)
      end)
      wordItem:GetChild("NameTxt").text = name
      local wordTxt = wordItem:GetChild("WordTxt")
      wordTxt.maxWidth = math.floor(worldList.root.width * 0.6)
      if string.find(msg.content, "<img src='ui://") then
        wordTxt.text = msg.content
      else
        wordTxt.text = SensitiveWordsUtil.FilterWord(msg.content)
      end
    else
      ChangeUIController(item, "c1", 2)
      local wordTxt = item:GetChild("WordTxt")
      wordTxt.maxWidth = math.floor(worldList.root.width * 0.8)
      wordTxt.text = SensitiveWordsUtil.FilterWord(msg.content)
      local titleTxt = item:GetChild("TitleTxt")
      if titleTxt then
        titleTxt.text = T(11005)
      end
    end
    if newMessage and newMessage.msgId == msg.msgId then
      PlayUITrans(item, "in")
    end
  end
end

function ChatWindow.RenderEmojiGroup(index, item)
  local groupId = 0
  local icon
  if #ChatData.GetLatestEmojiList() > 0 then
    if 0 == index then
      ChangeUIController(item, "c1", 0)
      item:GetChild("WordTxt").text = T(10107)
    else
      ChangeUIController(item, "c1", 1)
      groupId = emojiInfoList[index].id
      icon = emojiInfoList[index].icon
    end
  else
    ChangeUIController(item, "c1", 1)
    groupId = emojiInfoList[index + 1].id
    icon = emojiInfoList[index + 1].icon
  end
  item.onClick:Set(function()
    if emojiGroupList.selectedIndex ~= index then
      emojiGroupList.selectedIndex = index
      emojiGroupId = groupId
      ChatWindow.UpdateEmojiList()
    end
  end)
  if icon then
    item:GetChild("EmojiTypePic"):GetChild("PicLoader").url = UIUtil.GetResUrl(icon)
  else
    item:GetChild("EmojiTypePic"):GetChild("PicLoader").url = nil
  end
  if emojiGroupId == groupId then
    item.onClick:Call()
  end
end

function ChatWindow.RenderEmoji(index, item)
  local emojis
  if 0 == emojiGroupId then
    emojis = ChatData.GetLatestEmojiList()
  else
    emojis = ChatData.GetCurGroupEmoji(emojiInfoList, emojiGroupId)
  end
  local curEmoji = emojis[index + 1]
  if curEmoji then
    local url
    if type(curEmoji) == "string" then
      url = curEmoji
      url = string.gsub(url, "<img src='", "")
      url = string.gsub(url, "'/>", "")
    else
      url = UIUtil.GetResUrl(curEmoji.path)
    end
    item:GetChild("PicLoader").url = url
    item.onClick:Set(function()
      local emojiId = curEmoji.id
      if nil == emojiId then
        local config = TableData.GetTable("BaseEmoji")
        for i, v in pairs(config) do
          if UIUtil.GetResUrl(v.path) == url then
            emojiId = i
            break
          end
        end
      end
      if ChatData.GetSelectChannel() == ProtoEnum.IM_SESSION_TYPE.PRIVATE and curSelectPrivateChatPlayer then
        ChatMgr.SendEmoji(url, curSelectPrivateChatPlayer, emojiId)
      else
        ChatMgr.SendEmoji(url, nil, emojiId)
      end
      ChatWindow.SetEmojiVisible(false)
    end)
  end
end

function ChatWindow.RenderBanishPlayer(index, item)
  ChangeUIController(item, "c1", 0)
  local members = FriendData.GetRelationList(ProtoEnum.RELATION_STATE.BLOCK)
  local relationInfo = members[index + 1]
  if relationInfo then
    local info = FriendData.GetActorMirrorByUid(relationInfo.targetUin)
    UIUtil.ShowPlayerHead(info, item:GetChild("Head"))
    item:GetChild("NameTxt").text = info.name
    item:GetChild("LevelTxt").text = T(244, info.level)
    local online = item:GetChild("OnLine")
    local onlineTxt = online:GetChild("OnLineTxt")
    if info.isOnline == true then
      ChangeUIController(online, "c1", 0)
    else
      ChangeUIController(online, "c1", 1)
      onlineTxt.text = T(10115, TimeUtil.FormatOfflineTime(LoginData.GetCurServerTime() - info.lastLoginStamp))
    end
    local deleteBtn = item:GetChild("DeleteBtn")
    deleteBtn.onClick:Set(function()
      ld("Friend", function()
        FriendService.DeleteRelationReq(relationInfo.targetUin)
      end)
    end)
  end
  if banishListAnim then
    item.alpha = 0
    PlayUITrans(item, "up", nil, Const.listSpeed * (index - 1))
  end
end

function ChatWindow.RenderFriend(index, item)
  ChangeUIController(item, "c1", 1)
  if selectFriendType == FRIEND_TYPE.FRIEND then
    local members = FriendData.GetRelationList(ProtoEnum.RELATION_STATE.FRIEND)
    local relationInfo = members[index + 1]
    local info = FriendData.GetActorMirrorByUid(relationInfo.targetUin)
    UIUtil.ShowPlayerHead(info, item:GetChild("Head"))
    item:GetChild("NameTxt").text = info.name
    item:GetChild("LevelTxt").text = T(244, info.level)
    local online = item:GetChild("OnLine")
    local onlineTxt = online:GetChild("OnLineTxt")
    if info.isOnline == true then
      ChangeUIController(online, "c1", 0)
    else
      ChangeUIController(online, "c1", 1)
      onlineTxt.text = T(10115, TimeUtil.FormatOfflineTime(LoginData.GetCurServerTime() - info.lastLoginStamp))
    end
    item.onClick:Set(function()
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_TAG_ON_CLICK)
      ChatService.SyncPrivateHistoryMessageReq(info)
    end)
    if friendListAnim then
      item.alpha = 0
      PlayUITrans(item, "up", nil, Const.listSpeed * (index - 1))
    end
  elseif selectFriendType == FRIEND_TYPE.GUILD_MEMBER then
    local members = ChatData.GetGuildMemberList()
    local info = members[index + 1]
    UIUtil.ShowPlayerHead(info, item:GetChild("Head"))
    item:GetChild("NameTxt").text = info.name
    item:GetChild("LevelTxt").text = T(244, info.level)
    local online = item:GetChild("OnLine")
    local onlineTxt = online:GetChild("OnLineTxt")
    if info.isOnline == true then
      ChangeUIController(online, "c1", 0)
    else
      ChangeUIController(online, "c1", 1)
      onlineTxt.text = T(10115, TimeUtil.FormatOfflineTime(LoginData.GetCurServerTime() - info.activeStamp))
    end
    item.onClick:Set(function()
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_TAG_ON_CLICK)
      ChatService.SyncPrivateHistoryMessageReq(info)
    end)
    if friendListAnim then
      item.alpha = 0
      PlayUITrans(item, "up", nil, Const.listSpeed * (index - 1))
    end
  end
end

function ChatWindow.UpdateEmojiList()
  if 0 == emojiGroupId then
    emojiList.numItems = #ChatData.GetLatestEmojiList()
  else
    local emojis = ChatData.GetCurGroupEmoji(emojiInfoList, emojiGroupId)
    emojiList.numItems = #emojis
  end
end

function ChatWindow.UpdateEmojiGroupList()
  local groupNum = #emojiInfoList
  local defaultGroup
  if #ChatData.GetLatestEmojiList() > 0 then
    groupNum = groupNum + 1
    defaultGroup = 0
  else
    defaultGroup = emojiInfoList[1].id
  end
  if nil == emojiGroupId then
    emojiGroupId = defaultGroup
  end
  emojiGroupList.selectedIndex = -1
  emojiGroupList.numItems = groupNum
end

function ChatWindow.UpdateLine()
  local lineBtn = uis.Main.Frame.LineBtn
  local selfLineInfo = ChatData.GetSelfLineInfo()
  if selfLineInfo then
    UIUtil.SetBtnText(lineBtn, T(10080, ChatMgr.GetLineName(selfLineInfo.lineId)))
    ChatMgr.UpdateLineProgress(selfLineInfo, lineBtn)
  end
end

function ChatWindow.UpdateChatWordList()
  local worldList = uis.Main.Frame.WordList
  local selectChannel = ChatData.GetSelectChannel()
  if selectChannel == ProtoEnum.IM_SESSION_TYPE.WORLD then
    worldList.c1Ctr.selectedIndex = 0
    ChatWindow.UpdateDefaultWordList()
    uis.Main.Frame.c2Ctr.selectedIndex = 0
  elseif selectChannel == ProtoEnum.IM_SESSION_TYPE.UNION then
    worldList.c1Ctr.selectedIndex = 3
    ChatWindow.UpdateGuildWordList()
    uis.Main.Frame.c2Ctr.selectedIndex = 0
  elseif curSelectPrivateChatPlayer then
    worldList.c1Ctr.selectedIndex = 1
    worldList.PrivateTipsWord.WordTxt.text = T(10105, curSelectPrivateChatPlayer.name)
    ChatWindow.UpdatePrivateWordList()
    uis.Main.Frame.c2Ctr.selectedIndex = 0
  else
    worldList.c1Ctr.selectedIndex = 2
    worldList.TipsTxt.TipsTxt.text = T(10106)
    uis.Main.Frame.c2Ctr.selectedIndex = 1
  end
end

function ChatWindow.UpdateDefaultWordList()
  local allMsg = ChatData.GetCacheChatMsg(ChatData.GetSelectChannel())
  local percY = otherWordList.scrollPane.percY
  otherWordList.numItems = #allMsg
  if 0 == percY or 1 == percY then
    otherWordList.scrollPane:ScrollBottom(nil ~= newMessage)
  end
end

function ChatWindow.UpdateGuildWordList()
  local allMsg = ChatData.GetCacheChatMsg(ChatData.GetSelectChannel())
  local percY = guildWordList.scrollPane.percY
  guildWordList.numItems = #allMsg
  if 0 == percY or 1 == percY then
    guildWordList.scrollPane:ScrollBottom(nil ~= newMessage)
  end
  ChatWindow.UpdateGuildNotice()
end

function ChatWindow.UpdateGuildNotice()
  local noticeBtn = uis.Main.Frame.WordList.GulidNoticeBtn
  local tipsTxt = noticeBtn:GetChild("TipsTxt")
  local titleTxt = noticeBtn:GetChild("TitleTxt")
  local wordTxt = noticeBtn:GetChild("WordTxt")
  wordTxt.touchable = false
  wordTxt.maxLength = 90
  local roleType = GuildData.GetGuildRoleTypeFromSimpleInfo()
  local canEdit = roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_VICE_LEADER or roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER
  local notice = GuildData.GetGuildNoticeFromSimpleInfo()
  titleTxt.text = T(11003)
  ChangeUIController(noticeBtn, "c2", canEdit and 1 or 0)
  if nil == notice or "" == notice then
    ChangeUIController(noticeBtn, "c1", 0)
    if canEdit then
      tipsTxt.text = T(11002)
    else
      tipsTxt.text = T(11001)
    end
  else
    ChangeUIController(noticeBtn, "c1", 1)
    wordTxt.text = notice
  end
  if canEdit then
    noticeBtn.onClick:Set(function()
      ChangeUIController(noticeBtn, "c1", 1)
      wordTxt:RequestFocus()
    end)
    wordTxt.onFocusOut:Set(function()
      local text = wordTxt.text
      if string.trim(text) == "" then
        text = ""
      end
      if text ~= notice then
        GuildService.ChangeGuildNoticeReq(SensitiveWordsUtil.FilterWord(text))
      else
        wordTxt.text = notice
        if "" == notice then
          ChangeUIController(noticeBtn, "c1", 0)
        end
      end
    end)
  else
    noticeBtn.onClick:Clear()
    wordTxt.onFocusOut:Clear()
  end
end

function ChatWindow.UpdatePrivateWordList()
  if curSelectPrivateChatPlayer then
    local msg = ChatData.GetPrivateMsg(curSelectPrivateChatPlayer.uin)
    local percY = privateWordList.scrollPane.percY
    privateWordList.numItems = #msg
    if 0 == percY or 1 == percY then
      privateWordList.scrollPane:ScrollBottom(nil ~= newMessage)
    end
  else
    privateWordList.numItems = 0
  end
end

function ChatWindow.UpdateChattingPlayerList()
  local chattingList = ChatData.GetPrivateTargetList()
  privateList.numItems = #chattingList
end

function ChatWindow.UpdateBanishList()
  if nil == selectFriendType then
    local members = FriendData.GetRelationList(ProtoEnum.RELATION_STATE.BLOCK)
    banishListAnim = true
    banishList.numItems = #members
    banishListAnim = false
  end
end

function ChatWindow.UpdateFriendList()
  if selectFriendType == FRIEND_TYPE.FRIEND then
    local members = FriendData.GetRelationList(ProtoEnum.RELATION_STATE.FRIEND)
    friendListAnim = true
    friendList.numItems = #members
    friendListAnim = false
  elseif selectFriendType == FRIEND_TYPE.GUILD_MEMBER and ChatMgr.GuildChannelEnable(false) == true then
    local members = ChatData.GetGuildMemberList()
    if members then
      friendListAnim = true
      friendList.numItems = #members
      friendListAnim = false
    else
      GuildService.GetGuildMembersReq()
    end
  end
end

function ChatWindow.ShowFriendList()
  ChatWindow.SetPlayerList(true)
  uis.Main.PlayerListAni.PlayerList.c1Ctr.selectedIndex = 1
  ChatWindow.UpdateFriendList()
end

function ChatWindow.ShowBanishList()
  ChatWindow.UpdateBanishList()
  if banishList.numItems > 0 then
    ChatWindow.SetPlayerList(true)
    uis.Main.PlayerListAni.PlayerList.c1Ctr.selectedIndex = 0
  else
    FloatTipsUtil.ShowWarnTips(T(10131))
  end
end

function ChatWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ChatWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_CHAT)
  uis.Main.Frame.BanishBtn.onClick:Add(ChatWindow.ClickBanishBtn)
  uis.Main.Frame.SendBtn.onClick:Add(ChatWindow.ClickSendBtn)
  UIUtil.SetBtnText(uis.Main.Frame.SendBtn, T(10113), T(10114))
  uis.Main.Frame.EmojiBtn.onClick:Add(ChatWindow.ClickEmojiBtn)
  if BlockInTestPackage(true) then
    uis.Main.Frame.EmojiBtn.visible = false
  end
  uis.Main.Frame.LineBtn.onClick:Add(ChatWindow.ClickLineBtn)
  uis.Main.Frame.ChannelRegion.PrivateList.PrivateReturnBtn.onClick:Add(ChatWindow.ClickPrivateReturnBtn)
  uis.Main.Frame.ChannelRegion.PrivateList.PrivateReturnBtn.soundFmod = SOUND_EVENT_ENUM.COMMON_TAG_ON_CLICK
  uis.Main.EmojiChoice.TouchScreenBtn.onClick:Set(function()
    ChatWindow.SetEmojiVisible(false)
  end)
  uis.Main.PlayerListAni.TouchScreenBtn.onClick:Set(function()
    ChatWindow.SetPlayerList(false)
  end)
  uis.Main.Frame.ChannelRegion.PrivateList.AddBtn.onClick:Set(function()
    ChatWindow.ShowFriendList()
  end)
  uis.Main.Frame.ChannelRegion.PrivateList.AddBtn.soundFmod = SOUND_EVENT_ENUM.COMMON_TAG_ON_CLICK
end

function ChatWindow.InitText()
  UIUtil.SetBtnText(uis.Main.Frame.ChannelRegion.PrivateList.PrivateReturnBtn, T(11000))
  uis.Main.Frame.InputWord.InputTxt.promptText = T(1125)
end

function ChatWindow.InitPlayerTabList()
  local tabList = uis.Main.PlayerListAni.PlayerList.FriendTabRegion.TabList
  local tabInfoTable = {
    {
      name = "FriendBtn",
      c1Index = 0,
      type = FRIEND_TYPE.FRIEND,
      textId = 10109,
      subTextId = 10110,
      enable = function()
        return ChatMgr.FriendChatEnable(false)
      end
    },
    {
      name = "GuildBtn",
      c1Index = 1,
      type = FRIEND_TYPE.GUILD_MEMBER,
      textId = 10111,
      subTextId = 10112,
      enable = function()
        return ChatMgr.GuildChannelEnable(false)
      end
    }
  }
  selectFriendType = nil
  tabList:RemoveChildrenToPool()
  for i, v in ipairs(tabInfoTable) do
    if v.enable and v.enable() == true then
      local hand = tabList:AddItemFromPool()
      ChangeUIController(hand, "c1", v.c1Index)
      UIUtil.SetBtnText(hand, T(v.textId), T(v.subTextId))
      hand.soundFmod = SOUND_EVENT_ENUM.COMMON_TAG_ON_CLICK
      hand.onClick:Set(function()
        if hand.selected == false then
          selectFriendType = v.type
          ChatWindow.UpdateFriendList()
          tabList.selectedIndex = tabList:GetChildIndex(hand)
        end
      end)
      if nil == selectFriendType then
        hand.onClick:Call()
      end
    end
  end
end

function ChatWindow.ClickPrivateReturnBtn()
  ChatWindow.SetPlayerList(false)
  curSelectPrivateChatPlayer = nil
  local channel = ChatData.GetLastChannel() or ProtoEnum.IM_SESSION_TYPE.WORLD
  ChatData.SetSelectChannel(channel)
  ChatWindow.UpdateInfo(channel)
  ChatWindow.UpdateChatWordList()
end

function ChatWindow.ClickBanishBtn()
  selectFriendType = nil
  ChatWindow.ShowBanishList()
end

function ChatWindow.ClickLineBtn()
  ChatService.GetWorldLineInfoReq()
end

function ChatWindow.ClickEmojiBtn()
  ChatWindow.SetEmojiVisible(not emojiChoice.root.visible)
end

function ChatWindow.SetEmojiVisible(visible)
  if visible then
    emojiChoice.root.visible = true
    PlayUITrans(emojiChoice.root, "in")
  else
    PlayUITrans(emojiChoice.root, "out", function()
      emojiChoice.root.visible = false
    end)
  end
  if visible then
    ChatWindow.UpdateEmojiGroupList()
  end
end

function ChatWindow.ClickSendBtn()
  local inputTxt = uis.Main.Frame.InputWord.InputTxt
  local text = SensitiveWordsUtil.FilterWord(inputTxt.text)
  if ChatData.GetSelectChannel() == ProtoEnum.IM_SESSION_TYPE.PRIVATE and curSelectPrivateChatPlayer then
    ChatService.SendMessageReq(text, ChatData.GetSelectChannel(), curSelectPrivateChatPlayer.uin)
  else
    ChatService.SendMessageReq(text, ChatData.GetSelectChannel())
  end
  inputTxt.text = ""
end

function ChatWindow.SetPlayerList(show, playTrans)
  if nil == playTrans then
    playTrans = true
  end
  local playerListAni = uis.Main.PlayerListAni.root
  if show then
    if playerListAni.visible == false then
      playerListAni.visible = true
      if playTrans then
        PlayUITrans(playerListAni, "in")
      end
    end
  elseif playerListAni.visible then
    if playTrans then
      PlayUITrans(playerListAni, "out", function()
        playerListAni.visible = false
      end)
    else
      playerListAni.visible = false
    end
  end
end

function ChatWindow.ClickClose()
  UIMgr:CloseWindow(WinResConfig.ChatWindow.name)
end

function ChatWindow.OnShown()
end

function ChatWindow.OnHide()
end

function ChatWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.ChatWindow.name)
  for i, v in ipairs(defaultChatChannel) do
    v.channelBtn = nil
  end
  newMessage = nil
  emojiGroupId = nil
  emojiInfoList = nil
  curSelectPrivateChatPlayer = nil
  selectFriendType = nil
  emojiChoice = nil
  channelList, privateList, privateWordList, otherWordList, guildWordList, emojiList, emojiGroupList = nil, nil, nil, nil, nil, nil, nil
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  friendListAnim = nil
  banishListAnim = nil
end

function ChatWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_MESSAGE_UPDATE then
    ChatWindow.UpdateInfo(para)
    ChatWindow.UpdateChatWordList()
  elseif msgId == WindowMsgEnum.Common.E_MSG_NEW_MESSAGE_NOTIFY then
    ChatWindow.UpdateInfo(para.sessionType)
    newMessage = para.channelMsg
    ChatWindow.UpdateChatWordList()
    newMessage = nil
  elseif msgId == WindowMsgEnum.ChatWindow.E_MSG_LINE_CHANGE then
    ChatWindow.UpdateLine()
  elseif msgId == WindowMsgEnum.ChatWindow.E_MSG_CHANNEL_CHANGE then
    ChatWindow.UpdateSelectChannel()
    if ChatData.GetSelectChannel() == ProtoEnum.IM_SESSION_TYPE.PRIVATE then
      ChatWindow.InitPlayerTabList()
    end
  elseif msgId == WindowMsgEnum.ChatWindow.E_MSG_PRIVATE_PLAYER_UPDATE then
    ChatWindow.UpdateChattingPlayerList()
    ChatWindow.UpdateChatWordList()
  elseif msgId == WindowMsgEnum.ChatWindow.E_MSG_GUILD_MEMBERS then
    ChatData.SetGuildMemberList(para)
    ChatWindow.UpdateFriendList()
  elseif msgId == WindowMsgEnum.Common.E_MSG_SIMPLE_GUILD_RSP then
    channelList:RefreshVirtualList()
  elseif msgId == WindowMsgEnum.ChatWindow.E_MSG_START_PRIVATE_CHAT then
    if ChatData.GetSelectChannel() ~= ProtoEnum.IM_SESSION_TYPE.PRIVATE then
      ChatData.SetSelectChannel(ProtoEnum.IM_SESSION_TYPE.PRIVATE)
    end
    curSelectPrivateChatPlayer = ChatData.GetSenderInfo(para)
    ChatWindow.UpdateChattingPlayerList()
    ChatWindow.UpdateChatWordList()
  elseif msgId == WindowMsgEnum.ChatWindow.E_MSG_UPDATE_PRIVATE_CHAT then
    ChatWindow.UpdatePrivateWordList()
  elseif msgId == WindowMsgEnum.ChatWindow.E_MSG_PLAYER_LIST_CHANGE then
    ChatWindow.UpdateFriendList()
    ChatWindow.UpdateBanishList()
  elseif msgId == WindowMsgEnum.ChatWindow.E_MSG_GUILD_NOTICE_UPDATE then
    ChatWindow.UpdateGuildNotice()
  end
end

return ChatWindow
