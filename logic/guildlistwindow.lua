require("Guild_GuildListWindowByName")
local GuildListWindow = {}
local uis
local itemTb = {}
local countDownTb = {}
local activeDesData, contentPane, applyText, cancelUid, joinCdTimeInfo, creationData, listType, jumpTb, tween

function GuildListWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildListWindow.package, WinResConfig.GuildListWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    GuildService.GetRecommendGuildReq(true)
    uis = GetGuild_GuildListWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.HOME_GUILD)
    listType = 1
    GuildListWindow.UpdateTextDisplay()
    GuildListWindow.InitBtn()
    PlayUITrans(uis.Main.root, "Ain")
    UIMgr:RemoveWindowList(WinResConfig.GuildWindow.name)
    GuildListWindow.ShowJoinCdTime()
  end)
end

function GuildListWindow.UpdateTextDisplay()
  UIUtil.SetBtnText(uis.Main.GuildApply.EstablishBtn, T(237), T(236))
  UIUtil.SetBtnText(uis.Main.GuildApply.JoinBtn, T(239), T(238))
  UIUtil.SetBtnText(uis.Main.GuildApply.RefreshBtn, T(241), T(242))
  UIUtil.SetBtnText(uis.Main.GuildApply.RecordBtn, T(243), T(242))
end

local FormatEnTime = function(time)
  time = math.floor(time)
  return T(1148, math.ceil(time / 3600))
end

function GuildListWindow.ShowJoinCdTime()
  uis.Main.GuildApply.Time1.root.visible = false
end

function GuildListWindow.InitApplied()
  if #GuildData.AppliedGuildInfos > 0 then
    GuildData.ListInfos = GuildData.AppliedGuildInfos
    UIUtil.SetBtnText(uis.Main.GuildApply.RecordBtn, T(916), T(917))
    GuildListWindow.InitList()
  else
    FloatTipsUtil.ShowWarnTips(T(307))
  end
end

function GuildListWindow.InitList()
  itemTb = {}
  GuildListWindow:StopDownTime()
  uis.Main.GuildApply.GuildTipsList.numItems = 0
  uis.Main.GuildApply.GuildTipsList:SetVirtual()
  uis.Main.GuildApply.GuildTipsList.itemRenderer = GuildListWindow.RefreshGuildItem
  uis.Main.GuildApply.GuildTipsList.defaultItem = UIUtil.GetResUrl("Guild:GuildTipsAni")
  local activeDes = TableData.GetConfig(GuildEnum.ACTIVE_ID, "BaseFixed")
  activeDesData = Split(activeDes.array_value, "|")
  GuildData.ListInfos = GuildMgr.SortByGuildId(GuildData.ListInfos)
  uis.Main.GuildApply.GuildTipsList.numItems = #GuildData.ListInfos
end

function GuildListWindow.RefreshGuildItem(index, item)
  local v = GuildData.ListInfos[index + 1]
  local obj = item:GetChild("GuildTips")
  obj.alpha = 0
  obj:GetChild("NameTxt").text = v.name
  UIUtil.SetText(obj, T(955, v.leaderName), "LeaderNameTxt")
  local applyBtn = obj:GetChild("ApplyBtn")
  local activeLevel = v.activeLevel + 1
  if activeLevel > 3 then
    activeLevel = 3
  end
  if activeDesData[activeLevel] then
    obj:GetChild("StateTxt").text = T(tonumber(activeDesData[activeLevel]))
  else
    obj:GetChild("StateTxt").text = ""
  end
  local data = TableData.GetConfig(GuildEnum.GUILD_LEVEL_UP_ID * 10 + v.level, "BaseGuildLevelUp")
  if data then
    obj:GetChild("NumberTxt").text = v.memberCount .. "/" .. data.max_member
    obj:GetChild("StageTxt").text = data.name()
    if v.memberCount >= data.max_member then
      applyBtn.visible = false
      v.applyType = 2
      ChangeUIController(obj, "c1", 2)
      obj:GetChild("LevelTips"):GetChild("WordTxt").text = T(306)
    elseif -2 == v.levelLimit then
      applyBtn.visible = false
      v.applyType = 2
      ChangeUIController(obj, "c1", 3)
      obj:GetChild("CloseTips"):GetChild("WordTxt").text = T(1133)
    else
      applyBtn.visible = true
      ChangeUIController(obj, "c1", 0)
      v.applyType = GuildListWindow.RefreshApplyState(v, applyBtn)
      if 2 == v.applyType then
        ChangeUIController(obj, "c1", 2)
        obj:GetChild("LevelTips"):GetChild("WordTxt").text = T(270, v.levelLimit)
      elseif 3 == v.applyType then
        ChangeUIController(obj, "c1", 1)
      end
    end
  end
  obj:GetChild("LevelTxt").text = T(661, v.level)
  local headData = TableData.GetConfig(v.iconId, "BaseGuildHeadIcon")
  obj:GetChild("GulidIconLoader").url = UIUtil.GetResUrl(headData.icon)
  applyBtn.onClick:Set(function()
    GuildListWindow.ApplyOnClick(v.guildUid, applyBtn)
  end)
  itemTb[v.guildUid] = obj
  PlayUITrans(item, "up", nil, index * 0.05)
end

function GuildListWindow.RefreshApplyState(data, btn)
  local applyType
  if data.applying then
    btn.visible = true
    UIUtil.SetBtnText(btn, T(250), T(249))
    btn:GetController("buttonAni").selectedIndex = 1
    if countDownTb[data.guildUid] == nil then
      local applyTimeout = math.floor(data.applyTimeout)
      local timeText = btn:GetChild("Time"):GetChild("TimeTxt")
      timeText.text = T(640, TimeUtil.FormatEnTime(applyTimeout))
      local timeInfo = TimerUtil.new(1, applyTimeout, function(timer, tickTime)
        timeText.text = T(640, TimeUtil.FormatEnTime(applyTimeout - tickTime))
      end, function()
        GuildListWindow.InitList()
      end)
      timeInfo:start()
      countDownTb[data.guildUid] = timeInfo
    end
    applyType = 3
  else
    btn:GetController("buttonAni").selectedIndex = 0
    if -1 == data.levelLimit then
      applyType = 0
      UIUtil.SetBtnText(btn, T(246), T(245))
      btn.visible = true
    elseif ActorData.GetLevel() >= data.levelLimit then
      applyType = 1
      UIUtil.SetBtnText(btn, T(248), T(247))
      btn.visible = true
    else
      applyType = 2
      btn.visible = false
    end
  end
  return applyType
end

function GuildListWindow.ApplyOnClick(id, btn)
  local data = GuildListWindow.GetGuildDataById(id)
  if data then
    if 0 == data.applyType then
      if uis.Main.GuildApply.Time1.root.visible then
        btn:GetController("buttonAni").selectedIndex = 0
        FloatTipsUtil.ShowWarnTips(T(308))
        return
      end
      GuildListWindow.JoinTips(function()
        GuildService.ApplyJoinGuildReq(data.guildUid)
      end)
      btn:GetController("buttonAni").selectedIndex = 0
    elseif 1 == data.applyType then
      if uis.Main.GuildApply.Time1.root.visible then
        btn:GetController("buttonAni").selectedIndex = 0
        FloatTipsUtil.ShowWarnTips(T(308))
        return
      end
      applyText = btn:GetChild("Time"):GetChild("TimeTxt")
      GuildListWindow.JoinTips(function()
        GuildService.ApplyJoinGuildReq(data.guildUid)
      end)
      btn:GetController("buttonAni").selectedIndex = 0
    elseif 3 == data.applyType then
      cancelUid = data.guildUid
      GuildService.CancelJoinGuildReq(data.guildUid)
    end
  end
end

function GuildListWindow.GetGuildDataById(id)
  for i, v in pairs(GuildData.ListInfos) do
    if v.guildUid == id then
      return v
    end
  end
end

function GuildListWindow.CancelJoinGuild()
  if cancelUid then
    if countDownTb and countDownTb[cancelUid] then
      countDownTb[cancelUid]:stop()
    end
    if 1 == listType then
      local btn = itemTb[cancelUid]:GetChild("ApplyBtn")
      if btn then
        UIUtil.SetBtnText(btn, T(248), T(247))
        btn:GetController("buttonAni").selectedIndex = 0
      end
      ChangeUIController(itemTb[cancelUid], "c1", 0)
      local data = GuildListWindow.GetGuildDataById(cancelUid)
      if data then
        data.applyType = 1
        data.applyTimeout = 0
      end
    else
      local pos
      for i, v in ipairs(GuildData.ListInfos) do
        if v.guildUid == cancelUid then
          pos = i
          break
        end
      end
      if pos then
        table.remove(GuildData.ListInfos, pos)
        GuildListWindow.InitList()
      end
    end
  end
end

function GuildListWindow.ApplyJoinGuild(msg)
  if msg.info then
    if applyText then
      local btn = itemTb[msg.info.guildUid]:GetChild("ApplyBtn")
      btn:GetController("buttonAni").selectedIndex = 1
      UIUtil.SetBtnText(btn, T(250), T(249))
      local applyTimeout = math.floor(msg.info.applyTimeout)
      applyText.text = T(640, TimeUtil.FormatEnTime(applyTimeout, true))
      countDownTb[msg.info.guildUid] = TimerUtil.new(1, applyTimeout, function(timer, tickTime)
        applyText.text = T(640, TimeUtil.FormatEnTime(applyTimeout - tickTime, true))
      end)
      ChangeUIController(itemTb[msg.info.guildUid], "c1", 1)
      countDownTb[msg.info.guildUid]:start()
    end
    local data = GuildListWindow.GetGuildDataById(msg.info.guildUid)
    if data then
      data.applyType = 3
      data.applyTimeout = msg.info.applyTimeout
    end
  end
end

function GuildListWindow:StopDownTime()
  if countDownTb then
    for i, v in pairs(countDownTb) do
      v:stop()
    end
  end
  countDownTb = {}
end

function GuildListWindow.JoinTips(touchCallback)
  if touchCallback then
    touchCallback()
  end
end

function GuildListWindow.CreateTips(touchCallback)
  if touchCallback then
    touchCallback()
  end
end

function GuildListWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.GuildListWindow.name, uis.Main.CurrencyReturn)
  uis.Main.GuildApply.JoinBtn.onClick:Set(function()
    local joinCdStamp = math.floor(GuildMgr.GetDownTime(GuildData.joinCdStamp))
    if joinCdStamp and joinCdStamp <= 0 then
      GuildListWindow.JoinTips(function()
        GuildService.QuickJoinGuildReq()
      end)
    else
      FloatTipsUtil.ShowWarnTips(T(308))
    end
  end)
  uis.Main.GuildApply.RefreshBtn.onClick:Set(function()
    listType = 1
    GuildService.GetRecommendGuildReq(false)
    uis.Main.GuildApply.RefreshBtn.touchable = false
    tween = LeanTween.delayedCall(1, function()
      uis.Main.GuildApply.RefreshBtn.touchable = true
      tween = nil
    end)
  end)
  uis.Main.GuildApply.EstablishBtn.onClick:Set(GuildListWindow.CreateGuild)
  local searchTxt = uis.Main.GuildApply.InputName.NameTxt
  if searchTxt then
    searchTxt.promptText = T(1126)
    searchTxt.onFocusOut:Set(function()
      searchTxt.text = SensitiveWordsUtil.FilterWord(searchTxt.text)
    end)
  end
  uis.Main.GuildApply.InputName.SearchBtn.onClick:Set(function()
    if searchTxt.text ~= "" then
      GuildService.SearchGuildByNameReq(searchTxt.text, 0)
    end
  end)
  uis.Main.GuildApply.RecordBtn.onClick:Set(function()
    if 2 == listType then
      uis.Main.GuildApply.RefreshBtn.onClick:Call()
      UIUtil.SetBtnText(uis.Main.GuildApply.RecordBtn, T(243), T(242))
    else
      listType = 2
      GuildService.GetAppliedGuildsReq()
    end
  end)
end

function GuildListWindow.CreateGuild()
  if nil == creationData then
    local str = TableData.GetConfig(GuildEnum.CREATION_GUILD, "BaseFixed").array_value
    local addAttr = Split(str, ":")
    creationData = {
      type = tonumber(addAttr[1]),
      id = tonumber(addAttr[2]),
      value = tonumber(addAttr[3])
    }
  end
  OpenWindow(WinResConfig.RenameWindow.name, nil, {
    cost = creationData,
    promptText = T(268),
    maxLength = 8,
    sureFunc = function(text)
      if creationData.value > ActorData.GetItemCount(creationData.id) then
        local itemData = TableData.GetConfig(creationData.id, "BaseItem")
        if itemData then
          FloatTipsUtil.ShowWarnTips(T(230, itemData.name()))
        end
        return
      end
      text = string.gsub(text, " ", "")
      text = string.gsub(text, "　", "")
      local len = string.getByteCount(text)
      if len >= 2 then
        if SensitiveWordsUtil.IsContainBlockedWord(text) == true then
          FloatTipsUtil.ShowWarnTips(T(11160))
          return
        end
        GuildListWindow.CreateTips(function()
          GuildService.CreateGuildReq(text, function()
            UIMgr:SendWindowMessage(WinResConfig.RenameWindow.name, WindowMsgEnum.RenameWindow.CLOSE_WINDOW)
          end)
        end)
        return false
      else
        FloatTipsUtil.ShowWarnTips(T(313))
        return
      end
      return true
    end
  })
end

function GuildListWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.GuildWindow.INIT_LIST_INFO then
    GuildListWindow.InitList()
    UIUtil.SetBtnText(uis.Main.GuildApply.RecordBtn, T(243), T(242))
    if 0 == #GuildData.ListInfos then
      FloatTipsUtil.ShowWarnTips(T(316))
    end
  elseif msgId == WindowMsgEnum.GuildWindow.JOIN_GUILD then
    GuildListWindow.ApplyJoinGuild(para)
  elseif msgId == WindowMsgEnum.GuildWindow.CANCEL_JOIN then
    GuildListWindow.CancelJoinGuild(para)
  elseif msgId == WindowMsgEnum.GuildWindow.APPLIED_GUILD then
    GuildListWindow.InitApplied()
  elseif msgId == WindowMsgEnum.GuildWindow.ENTER_GUILD and para then
    MessageBox.Show(T(895, para), {
      touchCallback = function()
        GuildService.EnterGuild()
      end
    })
  end
end

function GuildListWindow.OnClose()
  if tween then
    LeanTween.cancel(tween.uniqueId)
    tween = nil
  end
  GuildListWindow:StopDownTime()
  uis.Main.GuildApply.GuildTipsList.numItems = 0
  countDownTb = nil
  uis = nil
  creationData = nil
  listType = nil
  activeDesData = nil
  itemTb = nil
  contentPane = nil
  applyText = nil
  cancelUid = nil
  joinCdTimeInfo = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return GuildListWindow
