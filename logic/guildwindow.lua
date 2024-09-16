require("Guild_GuildWindowByName")
local GuildWindow = {}
local uis, contentPane, listData, timeInfo, allJoin, minLv, maxMember, isRefreshCaptain, showAddBtn, onLineTime, jumpTb, newMessage, LevelTxt, lastLv

function GuildWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildWindow.package, WinResConfig.GuildWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuild_GuildWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.HOME_GUILD)
    showAddBtn = false
    GuildWindow.UpdateTextDisplay()
    GuildWindow.InitBtn()
    GuildWindow.Init()
    GuildWindow.InitRedDot()
  end)
end

function GuildWindow.InitRedDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.GuildWindow.name,
    com = uis.Main.GuildMain.OutBtn,
    visibleFunc = function()
      return RedDotGuild.CanAuditJoin()
    end,
    dataType = RED_DOT_DATA_TYPE.GUILD
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.GuildWindow.name,
    com = uis.Main.GuildMain.SupplyBtn,
    visibleFunc = function()
      return RedDotGuild.CanSign()
    end,
    dataType = RED_DOT_DATA_TYPE.GUILD
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.GuildWindow.name,
    com = uis.Main.GuildMain.Captain_info.VoteTips.root,
    visibleFunc = function()
      return RedDotGuild.CanVote()
    end,
    dataType = RED_DOT_DATA_TYPE.GUILD
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.GuildWindow.name,
    com = uis.Main.GuildMain.BossBtn,
    visibleFunc = function()
      return RedDotGuildWar.CanShowHome()
    end,
    dataType = RED_DOT_DATA_TYPE.GUILD_WAR
  })
end

function GuildWindow.UpdateTextDisplay()
  UIUtil.SetBtnText(uis.Main.GuildMain.TrainBtn, T(231), T(629))
  UIUtil.SetBtnText(uis.Main.GuildMain.SupplyBtn, T(232), T(630))
  UIUtil.SetBtnText(uis.Main.GuildMain.TerritoryBtn, T(233), T(631))
  UIUtil.SetBtnText(uis.Main.GuildMain.Examine_info.AllAdoptBtn, T(259), T(258))
  UIUtil.SetBtnText(uis.Main.GuildMain.Examine_info.AllRefuseBtn, T(261), T(260))
  uis.Main.GuildMain.Examine_info.NameTxt.text = T(256)
  uis.Main.GuildMain.Examine_info.SubtitleTxt.text = T(627)
  uis.Main.GuildMain.Examine_info.Word2Txt.text = T(257)
  uis.Main.GuildMain.Chat_info.WordTxt.text = T(1129)
  uis.Main.GuildMain.JoinCondition_info.NameTxt.text = T(1130)
  uis.Main.GuildMain.JoinCondition_info.SubtitleTxt.text = T(1131)
  UIUtil.SetText(uis.Main.GuildMain.JoinCondition_info.Condition1Btn, T(262), "WordTxt")
  UIUtil.SetText(uis.Main.GuildMain.JoinCondition_info.Condition3Btn, T(1132), "WordTxt")
end

function GuildWindow.RefreshGuildName()
  uis.Main.GuildMain.Guild_info.NameTxt.text = GuildData.GuildInfo.info.name
end

function GuildWindow.RefreshGuildHead()
  local headData = TableData.GetConfig(GuildData.GuildInfo.info.iconId, "BaseGuildHeadIcon")
  if headData then
    uis.Main.GuildMain.Guild_info.GulidIconLoader.url = UIUtil.GetResUrl(headData.icon)
  end
end

function GuildWindow.ShowNotice()
  if GuildData.GuildInfo.info.notice ~= "" then
    uis.Main.GuildMain.Chat_info.NoticeTxt.text = T(906, GuildData.GuildInfo.info.notice)
    uis.Main.GuildMain.Chat_info.c1Ctr.selectedIndex = 1
  else
    uis.Main.GuildMain.Chat_info.c1Ctr.selectedIndex = 0
  end
end

function GuildWindow.InitChat()
  GuildWindow.ShowNotice()
  local list = uis.Main.GuildMain.Chat_info.ChatList
  list:SetVirtual()
  list.itemProvider = GuildWindow.GetGuildWordItemResource
  list.itemRenderer = GuildWindow.RenderText
  ChatMgr.SyncUnionMessage()
  uis.Main.GuildMain.Chat_info.root.onClick:Set(function()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
    ld("Chat", function()
      OpenWindow(WinResConfig.ChatWindow.name, nil, ProtoEnum.IM_SESSION_TYPE.UNION)
    end)
  end)
end

function GuildWindow.GetGuildWordItemResource(index)
  local allMsg = ChatData.GetCacheChatMsg(ProtoEnum.IM_SESSION_TYPE.UNION)
  if nil == allMsg then
    return
  end
  local msg = allMsg[index + 1]
  if msg then
    if msg.msgType == ProtoEnum.MSG_TYPE.MSG_JOIN_GUILD then
      return "ui://Guild/GuildSystemWordItem"
    elseif msg.msgType == ProtoEnum.MSG_TYPE.MSG_EMOJI then
      return "ui://Guild/ChatWordRegion1"
    else
      return "ui://Guild/ChatWordRegion"
    end
  end
end

function GuildWindow.UpdateChatText()
  local allMsg = ChatData.GetCacheChatMsg(ProtoEnum.IM_SESSION_TYPE.UNION)
  if nil == allMsg then
    if string.isEmptyOrNil(GuildData.GuildInfo.info.notice) then
      uis.Main.GuildMain.Chat_info.c1Ctr.selectedIndex = 2
    end
    return
  end
  local list = uis.Main.GuildMain.Chat_info.ChatList
  list.numItems = #allMsg
  local scrollPane = list.scrollPane
  local percY = scrollPane.percY
  if 0 == percY or 1 == percY then
    scrollPane:ScrollBottom(nil ~= newMessage)
  end
  if #allMsg < 1 then
    if string.isEmptyOrNil(GuildData.GuildInfo.info.notice) then
      uis.Main.GuildMain.Chat_info.c1Ctr.selectedIndex = 2
    else
      uis.Main.GuildMain.Chat_info.c1Ctr.selectedIndex = 1
    end
  elseif string.isEmptyOrNil(GuildData.GuildInfo.info.notice) then
    uis.Main.GuildMain.Chat_info.c1Ctr.selectedIndex = 0
  else
    uis.Main.GuildMain.Chat_info.c1Ctr.selectedIndex = 1
  end
end

function GuildWindow.RenderText(index, item)
  local allMsg = ChatData.GetCacheChatMsg(ProtoEnum.IM_SESSION_TYPE.UNION)
  if nil == allMsg then
    return
  end
  local msg = allMsg[index + 1]
  if msg then
    local worldList = uis.Main.GuildMain.Chat_info
    if msg.msgType == ProtoEnum.MSG_TYPE.MSG_JOIN_GUILD then
      local sender = ChatData.GetSenderInfo(msg.fromUin)
      local name = sender.name
      local wordTxt = item:GetChild("WordTxt")
      if wordTxt then
        wordTxt.text = T(11004, name)
      end
      local titleTxt = item:GetChild("TitleTxt")
      if titleTxt then
        titleTxt.text = T(11005)
      end
    elseif msg.fromUin then
      item:GetChild("ChatWordLeft"):GetChild("WordTxt").text = ""
      item:GetChild("ChatWordRight"):GetChild("WordTxt").text = ""
      local wordItem
      local isSelf = ChatData.IsSelfMsg(msg)
      local name
      if isSelf then
        ChangeUIController(item, "c1", 1)
        wordItem = item:GetChild("ChatWordRight")
        name = ActorData.GetName()
      else
        ChangeUIController(item, "c1", 0)
        wordItem = item:GetChild("ChatWordLeft")
        local sender = ChatData.GetSenderInfo(msg.fromUin)
        name = sender.name
      end
      wordItem:GetChild("TimeTxt").text = T(10115, TimeUtil.FormatOfflineTime(LoginData.GetCurServerTime() - msg.stamp))
      wordItem:GetChild("NameTxt").text = name
      local wordTxt = wordItem:GetChild("WordTxt")
      if msg.msgType == ProtoEnum.MSG_TYPE.MSG_EMOJI then
        wordTxt.text = msg.content
      else
        wordTxt.text = msg.content
      end
      item:SetSize(item.width, wordItem.height)
    end
    if newMessage and newMessage.msgId == msg.msgId then
      PlayUITrans(item, "in")
    end
  end
end

function GuildWindow.Init()
  local info = uis.Main.GuildMain.Guild_info
  info.LevelTxt.text = T(661, GuildData.GuildInfo.info.level)
  local data = TableData.GetConfig(GuildEnum.GUILD_LEVEL_UP_ID * 10 + GuildData.GuildInfo.info.level, "BaseGuildLevelUp")
  if data then
    info.ExpProgressBar.max = data.next_exp
    info.ExpProgressBar.value = GuildData.GuildInfo.info.exp
    info.NumberTxt.text = T(956, GuildData.GuildInfo.info.memberCount, data.max_member)
    info.StageTxt.text = data.name()
    if GuildData.GuildInfo.info.level >= 10 then
      info.ExpTxt.text = ""
    else
      info.ExpTxt.text = T(878, GuildData.GuildInfo.info.exp, data.next_exp)
    end
    maxMember = data.max_member
  end
  GuildWindow.RefreshGuildName()
  GuildWindow.RefreshGuildHead()
  GuildWindow.UpdateGuildCondition()
  local itemData = GuildData.GetGuildItemData(ActorData.GetUin())
  if itemData then
    GuildData.myRoleType = itemData.roleType
    if itemData.roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER or itemData.roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_VICE_LEADER then
      GuildWindow.InitManager()
      GuildWindow.InitMember()
    elseif itemData.roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_NORMAL then
      GuildWindow.InitMember()
    end
    uis.Main.GuildMain.c1Ctr.selectedIndex = 0
    listData = GuildMgr.SortByRoleType(GuildData.GuildInfo.members)
  end
  local playerList = uis.Main.GuildMain.PlayerList
  playerList:SetVirtual()
  playerList.itemRenderer = GuildWindow.RefreshPlayerInfoItem
  GuildWindow.InitPlayerList()
  local ctr = uis.Main.GuildMain.JoinCondition_info.c1Ctr
  if -1 == GuildData.GuildInfo.info.levelLimit then
    ChangeController(ctr, 0)
    lastLv = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.GUILD_LIMIT_LEVEL)
  elseif -2 == GuildData.GuildInfo.info.levelLimit then
    ChangeController(ctr, 1)
    lastLv = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.GUILD_LIMIT_LEVEL)
  else
    lastLv = GuildData.GuildInfo.info.levelLimit
    ChangeController(ctr, 2)
  end
  GuildWindow.SetButtonState()
  LevelTxt = uis.Main.GuildMain.JoinCondition_info.Condition2Btn:GetChild("LevelTxt")
  minLv = TableData.GetConfig(FEATURE_ENUM.HOME_GUILD, "BaseFeature").level
  lastLv = 0 == lastLv and minLv or lastLv
  local maxLv = TableData.GetConfig(GuildEnum.MAX_LEVEL_ID, "BaseFixed").int_value
  local InPutTxt = uis.Main.GuildMain.JoinCondition_info.Condition2Btn:GetChild("InPutTxt")
  InPutTxt.onFocusIn:Set(function()
    LevelTxt.text = ""
    InPutTxt.text = ""
  end)
  InPutTxt.onChanged:Set(function()
    LevelTxt.text = InPutTxt.text
  end)
  InPutTxt.onFocusOut:Set(function()
    GuildWindow.InputLevelLimit(InPutTxt, maxLv)
  end)
  uis.Main.GuildMain.JoinCondition_info.c1Ctr.onChanged:Set(function()
    InPutTxt.touchable = 2 == ctr.selectedIndex
    local tempLv = GuildData.GuildInfo.info.levelLimit < minLv and lastLv or GuildData.GuildInfo.info.levelLimit
    LevelTxt.text = 2 ~= ctr.selectedIndex and T(263, tempLv) or T(896, tempLv)
  end)
  uis.Main.GuildMain.JoinCondition_info.c1Ctr.onChanged:Call()
  GuildWindow.ShowLevelUp()
  GuildWindow.InitChat()
end

function GuildWindow.UpdateGuildCondition()
  local itemData = GuildData.GetGuildItemData(ActorData.GetUin())
  if itemData then
    GuildData.myRoleType = itemData.roleType
    if itemData.roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER or itemData.roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_VICE_LEADER then
      UIUtil.SetBtnText(uis.Main.GuildMain.OutBtn, T(234), T(235))
      ChangeUIController(uis.Main.GuildMain.OutBtn, "c1", 1)
      uis.Main.GuildMain.OutBtn.onClick:Set(function()
        if GuildData.myRoleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER and GuildData.GuildInfo.info.impeaching then
          FloatTipsUtil.ShowWarnTips(T(314))
          return
        end
        GuildService.GetGuildMembersReq(function()
          GuildWindow.ChangeAuditUI()
        end)
      end)
    elseif itemData.roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_NORMAL then
      uis.Main.GuildMain.Guild_info.RenameBtn.visible = false
      UIUtil.SetBtnText(uis.Main.GuildMain.OutBtn, T(633), T(634))
      uis.Main.GuildMain.OutBtn.onClick:Set(function()
        GuildWindow.QuitGuild()
      end)
      ChangeUIController(uis.Main.GuildMain.OutBtn, "c1", 0)
    end
  end
end

function GuildWindow.InputLevelLimit(inPutText, maxLv)
  if inPutText.text == "" then
    LevelTxt.text = T(896, GuildData.GuildInfo.info.levelLimit)
    return
  end
  local lv = tonumber(inPutText.text)
  if nil ~= lv then
    if lv <= minLv then
      lv = minLv
    end
    if maxLv <= lv then
      lv = maxLv
    end
    GuildService.SetGuildLevelLimitReq(lv, function()
      if lv and LevelTxt then
        lastLv = lv
        PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.GUILD_LIMIT_LEVEL, lastLv)
        GuildData.GuildInfo.info.levelLimit = lv
        LevelTxt.text = T(896, lv)
      end
    end)
  else
    GuildService.SetGuildLevelLimitReq(minLv, function()
      if minLv and LevelTxt then
        lastLv = minLv
        PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.GUILD_LIMIT_LEVEL, lastLv)
        GuildData.GuildInfo.info.levelLimit = minLv
        LevelTxt.text = T(896, minLv)
      end
    end)
  end
end

function GuildWindow.ShowLevelUp()
  local lv = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.GUILD_LEVEL)
  if 0 == lv then
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.GUILD_LEVEL, GuildData.GuildInfo.info.level)
    return
  end
  if lv < GuildData.GuildInfo.info.level then
    OpenWindow(WinResConfig.GuildLevelUpTipsWindow.name, nil, GuildData.GuildInfo.info.level)
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.GUILD_LEVEL, GuildData.GuildInfo.info.level)
  end
end

function GuildWindow.ChangeAuditUI()
  if GuildData.myRoleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER then
    UIUtil.SetBtnText(uis.Main.GuildMain.DissolutionBtn, T(635), T(636))
  else
    UIUtil.SetBtnText(uis.Main.GuildMain.DissolutionBtn, T(633), T(634))
  end
  listData = GuildData.GuildInfo.applicants
  local bol = false
  if listData then
    bol = #listData > 0
  end
  uis.Main.GuildMain.c1Ctr.selectedIndex = 1
  GuildWindow.InitPlayerList()
  uis.Main.GuildMain.Examine_info.AllRefuseBtn.visible = bol
  uis.Main.GuildMain.Examine_info.AllAdoptBtn.visible = bol
end

function GuildWindow.GetGuildCaptainData()
  for i, v in pairs(GuildData.GuildInfo.members) do
    if v.roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER then
      return v
    end
  end
end

function GuildWindow.InitMember()
  local info = uis.Main.GuildMain.Captain_info
  local captainData = GuildWindow.GetGuildCaptainData()
  info.NameTxt.text = captainData.name
  info.LevelTxt.text = T(1014, captainData.level)
  UIUtil.SetHeadByFaceId(captainData.faceId, info.CaptainPic.PicLoader, HEAD_ICON_TYPE_ENUM.RECT)
  info.CaptainPic.root.onClick:Set(function()
    if captainData.uin == ActorData.GetUin() then
      return
    end
    local param = SimpleCopy(captainData)
    param.myRoleType = GuildData.myRoleType
    param.viceCaptainMax = GuildData.GetViceCaptainNum() > 0
    param.impeaching = GuildData.GuildInfo.info.impeaching
    OpenWindow(WinResConfig.OtherPlayerInfoWindow.name, nil, nil, nil, param)
  end)
  local impeachTime = TableData.GetConfig(70010309, "BaseFixed").int_value
  local downTime = LoginData.GetCurServerTime() - captainData.activeStamp
  if GuildData.GuildInfo.info.impeaching then
    GuildWindow.InitImpeach()
  elseif impeachTime < downTime then
    UIUtil.SetBtnText(info.ImpeachmentBtn, T(273), T(272))
    info.c1Ctr.selectedIndex = 1
    info.ImpeachmentBtn.onClick:Set(function()
      MessageBox.Show(T(1321), {
        touchCallback = function()
          GuildService.StartImpeachGuildLeaderReq()
        end
      }, {})
    end)
  end
end

function GuildWindow.InitImpeach()
  local info = uis.Main.GuildMain.Captain_info
  info.c1Ctr.selectedIndex = 2
  if GuildData.myRoleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER or 4 == GuildData.GuildInfo.impeachInfo.myVote then
    info.VoteTips.WordTxt.text = T(317)
  elseif 0 ~= GuildData.GuildInfo.impeachInfo.myVote then
    info.VoteTips.WordTxt.text = T(315)
  else
    info.VoteTips.WordTxt.text = T(274)
  end
  info.VoteTips.AgreeTxt.text = T(275)
  info.VoteTips.DisagreeTxt.text = T(276)
  local InitBar = function(bar)
    bar.value = 1
    bar.max = 1
  end
  if GuildData.GuildInfo.impeachInfo.approveCount > GuildData.GuildInfo.impeachInfo.opposeCount then
    InitBar(info.VoteTips.AgreeProgressBar)
    info.VoteTips.DisagreeProgressBar.value = GuildData.GuildInfo.impeachInfo.opposeCount
    info.VoteTips.DisagreeProgressBar.max = GuildData.GuildInfo.impeachInfo.approveCount
  elseif GuildData.GuildInfo.impeachInfo.approveCount == GuildData.GuildInfo.impeachInfo.opposeCount then
    InitBar(info.VoteTips.AgreeProgressBar)
    InitBar(info.VoteTips.DisagreeProgressBar)
  elseif GuildData.GuildInfo.impeachInfo.approveCount < GuildData.GuildInfo.impeachInfo.opposeCount then
    InitBar(info.VoteTips.DisagreeProgressBar)
    info.VoteTips.AgreeProgressBar.value = GuildData.GuildInfo.impeachInfo.approveCount
    info.VoteTips.AgreeProgressBar.max = GuildData.GuildInfo.impeachInfo.opposeCount
  end
  if 4 ~= GuildData.GuildInfo.impeachInfo.myVote then
    uis.Main.GuildMain.Captain_info.VoteTips.root.onClick:Set(function()
      GuildService.GetImpeachInfoReq()
    end)
  end
  local endTimeout = math.floor(GuildData.GuildInfo.impeachInfo.endTimeout)
  info.VoteTips.TimeTxt.text = TimeUtil.FormatEnTime(endTimeout)
  timeInfo = TimerUtil.new(1, endTimeout, function(timer, tickTime)
    info.VoteTips.TimeTxt.text = TimeUtil.FormatEnTime(endTimeout - tickTime)
  end, function()
    info.VoteTips.TimeTxt.text = ""
    info.c1Ctr.selectedIndex = 0
    isRefreshCaptain = true
    GuildService.GetGuildMembersReq()
  end)
  timeInfo:start()
end

function GuildWindow.QuitGuild()
  MessageBox.Show(T(305), {
    touchCallback = function()
      GuildService.ExitGuildReq(function()
        PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.GUILD_LEVEL, 0)
      end)
    end
  }, {})
end

function GuildWindow.SetButtonState()
  local root = uis.Main.GuildMain.JoinCondition_info
  local button = {
    root.Condition1Btn,
    root.Condition3Btn,
    root.Condition2Btn
  }
  for i = 1, #button do
    ChangeUIController(button[i], "special", i == uis.Main.GuildMain.JoinCondition_info.c1Ctr.selectedIndex + 1 and 1 or 0)
  end
end

function GuildWindow.InitManager()
  uis.Main.GuildMain.JoinCondition_info.Condition1Btn.onClick:Set(function()
    if -1 ~= GuildData.GuildInfo.info.levelLimit then
      GuildWindow.SetButtonState()
      GuildService.SetGuildLevelLimitReq(-1, function()
        GuildData.GuildInfo.info.levelLimit = -1
      end)
    end
  end)
  uis.Main.GuildMain.JoinCondition_info.Condition3Btn.onClick:Set(function()
    if -2 ~= GuildData.GuildInfo.info.levelLimit then
      GuildService.GetGuildMembersReq(function()
        if 0 == uis.Main.GuildMain.c2Ctr.selectedIndex then
          MessageBox.Show(T(1145), {
            touchCallback = function()
              GuildService.ProcessGuildJoinApplyReq(0, false)
              GuildWindow.SetButtonState()
              GuildService.SetGuildLevelLimitReq(-2, function()
                GuildData.GuildInfo.info.levelLimit = -2
              end)
            end
          }, {})
        else
          GuildWindow.SetButtonState()
          GuildService.SetGuildLevelLimitReq(-2, function()
            GuildData.GuildInfo.info.levelLimit = -2
          end)
        end
      end)
    end
  end)
  uis.Main.GuildMain.JoinCondition_info.Condition2Btn.onClick:Set(function()
    local sendLv = lastLv or minLv
    if GuildData.GuildInfo.info.levelLimit ~= sendLv then
      GuildWindow.SetButtonState()
      GuildService.SetGuildLevelLimitReq(sendLv, function()
        GuildData.GuildInfo.info.levelLimit = sendLv
        lastLv = sendLv
        PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.GUILD_LIMIT_LEVEL, lastLv)
      end)
    end
  end)
  uis.Main.GuildMain.DissolutionBtn.onClick:Set(function()
    if GuildData.myRoleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER then
      MessageBox.Show(T(304), {
        touchCallback = function()
          GuildService.DismissGuildReq()
        end
      }, {})
    else
      GuildWindow.QuitGuild()
    end
  end)
  uis.Main.GuildMain.Guild_info.RenameBtn.visible = true
  local guildRenameCost = GuildWindow.GetRenameCost()
  uis.Main.GuildMain.Guild_info.RenameBtn.onClick:Set(function()
    OpenWindow(WinResConfig.RenameWindow.name, nil, {
      text = GuildData.GuildInfo.info.name,
      promptText = T(268),
      maxLength = 8,
      cost = guildRenameCost,
      sureFunc = function(text)
        text = string.gsub(text, " ", "")
        text = string.gsub(text, "　", "")
        if GuildData.GuildInfo.info.name == text then
          return
        end
        local len = string.getByteCount(text)
        if len <= 8 and len >= 2 then
          if SensitiveWordsUtil.IsContainBlockedWord(text) == true then
            FloatTipsUtil.ShowWarnTips(T(11160))
            return
          end
          GuildService.ChangeGuildNameReq(text, function()
            UIMgr:SendWindowMessage(WinResConfig.RenameWindow.name, WindowMsgEnum.RenameWindow.CLOSE_WINDOW)
          end)
        else
          FloatTipsUtil.ShowWarnTips(T(313))
        end
      end
    })
  end)
  uis.Main.GuildMain.Guild_info.GulidIconLoader.onClick:Set(function()
    OpenWindow(WinResConfig.GuildIconChoiceWindow.name, nil, GuildData.GuildInfo.info.iconId)
  end)
  uis.Main.GuildMain.Examine_info.AllAdoptBtn.onClick:Set(function()
    allJoin = true
    GuildService.ProcessGuildJoinApplyReq(0, true)
  end)
  uis.Main.GuildMain.Examine_info.AllRefuseBtn.onClick:Set(function()
    allJoin = true
    GuildService.ProcessGuildJoinApplyReq(0, false)
  end)
end

function GuildWindow.GetRenameCost()
  local value = TableData.GetConfig(70010311, "BaseFixed").array_value
  value = Split(value, ":")
  if #value >= 3 then
    return {
      type = tonumber(value[1]),
      id = tonumber(value[2]),
      value = tonumber(value[3])
    }
  end
end

function GuildWindow.InitPlayerList()
  if listData then
    local playerList = uis.Main.GuildMain.PlayerList
    playerList.numItems = 0
    playerList.numItems = #listData
  end
  if listData and #listData > 0 then
    uis.Main.GuildMain.c2Ctr.selectedIndex = 0
  else
    uis.Main.GuildMain.c2Ctr.selectedIndex = 1
    uis.Main.GuildMain.GuildEmpty.WordTxt.text = 1 == uis.Main.GuildMain.c1Ctr.selectedIndex and T(632) or T(628)
  end
end

function GuildWindow.RefreshPlayerInfoItem(index, obj)
  local data = listData[index + 1]
  if data.name == nil then
    ChangeUIController(obj, "c3", 1)
    return
  else
    ChangeUIController(obj, "c3", 0)
  end
  obj:GetChild("LevelTxt").text = T(1014, data.level)
  obj:GetChild("NameTxt").text = data.name
  local PlayerPic = obj:GetChild("PlayerPic")
  UIUtil.SetHeadByFaceId(data.faceId, PlayerPic:GetChild("PicLoader"), HEAD_ICON_TYPE_ENUM.SQUARE)
  if 1 == uis.Main.GuildMain.c1Ctr.selectedIndex then
    ChangeUIController(obj, "c2", 1)
    local AdoptBtn = obj:GetChild("AdoptBtn")
    UIUtil.SetText(AdoptBtn, T(269), "WordTxt")
    local RefuseBtn = obj:GetChild("RefuseBtn")
    UIUtil.SetText(RefuseBtn, T(894), "WordTxt")
    data.unlocked = true
    AdoptBtn.onClick:Set(function()
      allJoin = false
      GuildService.ProcessGuildJoinApplyReq(data.uin, true)
    end)
    RefuseBtn.onClick:Set(function()
      allJoin = false
      GuildService.ProcessGuildJoinApplyReq(data.uin, false)
    end)
    PlayerPic.onClick:Set(function()
    end)
  else
    ChangeUIController(obj, "c2", 0)
    local position = obj:GetChild("Position")
    if data.roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER then
      position.visible = true
      ChangeUIController(position, "c1", 0)
    elseif data.roleType == ProtoEnum.GUILD_ROLE_TYPE.GRT_VICE_LEADER then
      ChangeUIController(position, "c1", 1)
      position.visible = true
    else
      position.visible = false
    end
    PlayerPic.onClick:Set(function()
      if data.uin == ActorData.GetUin() then
        return
      end
      local param = SimpleCopy(data)
      param.myRoleType = GuildData.myRoleType
      param.viceCaptainMax = GuildData.GetViceCaptainNum() > 0
      param.impeaching = GuildData.GuildInfo.info.impeaching
      OpenWindow(WinResConfig.OtherPlayerInfoWindow.name, nil, nil, nil, param)
    end)
  end
  if data.isOnline then
    obj:GetChild("PlayerOnline"):GetChild("TimeTxt").text = T(10116)
    ChangeUIController(obj, "c1", 1)
  else
    local time = obj:GetChild("PlayerOnline")
    time:GetChild("TimeTxt").text = TimeUtil.FormatOfflineTime(LoginData.GetCurServerTime() - data.activeStamp)
    ChangeUIController(obj, "c1", 0)
  end
end

function GuildWindow.StartImpeachSucceed()
  GuildWindow.InitImpeach()
end

function GuildWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.GuildWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_GUILD, function()
    if 1 == uis.Main.GuildMain.c1Ctr.selectedIndex then
      listData = GuildMgr.SortByRoleType(GuildData.GuildInfo.members)
      uis.Main.GuildMain.c1Ctr.selectedIndex = 0
      GuildWindow.InitPlayerList()
    else
      UIMgr:CloseToWindow(WinResConfig.HomeWindow.name)
    end
  end)
  uis.Main.GuildMain.SupplyBtn.onClick:Set(function()
    GuildService.GetActorSignInReq(function()
      OpenWindow(WinResConfig.GuildSupplyWindow.name)
    end)
  end)
  uis.Main.GuildMain.TrainBtn.onClick:Set(function()
    OpenWindow(WinResConfig.GuildTrainWindow.name)
  end)
  uis.Main.GuildMain.BossBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_GUILD_WAR) then
      GuildWarMgr.OpenGuildWarWindow()
    end
  end)
  GuildWarService.GetGuildWarAllInfoReq(function()
    if uis then
      ChangeController(uis.Main.GuildMain.bossCtr, 1)
      UIUtil.SetText(uis.Main.GuildMain.BossBtn, T(1612), "NameTxt")
      local info = GuildWarData.GetGuildScheduleInfo()
      if info then
        if info.state == ProtoEnum.GuildWarState.GWS_FIGHT then
          UIUtil.SetText(uis.Main.GuildMain.BossBtn, T(1611, TimeUtil.FormatEnTime(info.endStamp - LoginData.GetCurServerTime())), "WordTxt")
        elseif info.state == ProtoEnum.GuildWarState.GWS_NOTICE then
          UIUtil.SetText(uis.Main.GuildMain.BossBtn, T(1653, TimeUtil.FormatEnTime(info.endStamp - LoginData.GetCurServerTime())), "WordTxt")
        else
          UIUtil.SetText(uis.Main.GuildMain.BossBtn, T(1654), "TimeTxt")
        end
      end
    end
  end)
end

function GuildWindow.UpdateGuild()
  if allJoin then
    GuildData.GuildInfo.applicants = {}
    uis.Main.GuildMain.PlayerList.numItems = 0
  else
    if 1 == uis.Main.GuildMain.c1Ctr.selectedIndex then
      listData = GuildData.GuildInfo.applicants
    else
      listData = GuildMgr.SortByRoleType(GuildData.GuildInfo.members)
    end
    GuildWindow.InitPlayerList()
  end
  if isRefreshCaptain then
    GuildWindow.InitMember()
    GuildWindow.UpdateGuildCondition()
    isRefreshCaptain = nil
  end
  uis.Main.GuildMain.Guild_info.NumberTxt.text = T(956, #GuildData.GuildInfo.members, maxMember)
end

function GuildWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.GuildWindow.GUILD_JOIN_APPLY then
    GuildWindow.UpdateGuild()
  elseif msgId == WindowMsgEnum.GuildWindow.IMPEACH then
    GuildWindow.StartImpeachSucceed()
  elseif msgId == WindowMsgEnum.GuildWindow.CHANGE_ICON then
    GuildWindow.RefreshGuildHead()
  elseif msgId == WindowMsgEnum.GuildWindow.RENAME then
    GuildWindow.RefreshGuildName()
  elseif msgId == WindowMsgEnum.GuildWindow.CHANGE_CAPTAIN then
    isRefreshCaptain = true
  elseif msgId == WindowMsgEnum.Common.E_MSG_NEW_MESSAGE_NOTIFY then
    newMessage = para.channelMsg
    GuildWindow.UpdateChatText()
    newMessage = nil
  elseif msgId == WindowMsgEnum.Common.E_MSG_MESSAGE_UPDATE then
    GuildWindow.UpdateChatText()
  elseif msgId == WindowMsgEnum.GuildWindow.CHANGE_NOTICE then
    GuildWindow.ShowNotice()
    local allMsg = ChatData.GetCacheChatMsg(ProtoEnum.IM_SESSION_TYPE.UNION)
    if nil == allMsg or #allMsg < 1 then
      if string.isEmptyOrNil(GuildData.GuildInfo.info.notice) then
        uis.Main.GuildMain.Chat_info.c1Ctr.selectedIndex = 2
      end
      return
    end
  end
end

function GuildWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.GuildWindow.name)
  if onLineTime then
    onLineTime:stop()
    onLineTime = nil
  end
  if timeInfo then
    timeInfo:stop()
    timeInfo = nil
  end
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  uis = nil
  minLv = nil
  allJoin = nil
  listData = nil
  LevelTxt = nil
  maxMember = nil
  newMessage = nil
  showAddBtn = nil
  contentPane = nil
  isRefreshCaptain = nil
end

return GuildWindow
