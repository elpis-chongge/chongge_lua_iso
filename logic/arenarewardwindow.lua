require("Arena_RewardWindowByName")
local ArenaRewardWindow = {}
local uis, contentPane, rewardData, isReward, isWeek, jumpTb

function ArenaRewardWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ArenaRewardWindow.package, WinResConfig.ArenaRewardWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetArena_RewardWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.ARENA_WINDOWS)
    ArenaRewardWindow.InitBtn()
    ArenaRewardWindow.UpdateTextDisplay()
    ArenaRewardWindow.Init()
    if RedDotArena.ShowHome() then
      uis.Main.TabRegion.Tab2Btn.onClick:Call()
    else
      uis.Main.TabRegion.Tab1Btn.onClick:Call()
    end
    ArenaRewardWindow.InitRedDot()
  end)
end

function ArenaRewardWindow.InitRedDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.ArenaRewardWindow.name,
    com = uis.Main.TabRegion.Tab2Btn,
    visibleFunc = function()
      return RedDotArena.ShowHome()
    end,
    dataType = RED_DOT_DATA_TYPE.ADVENTURE
  })
end

function ArenaRewardWindow.UpdateTextDisplay()
  UIUtil.SetText(uis.Main.TabRegion.Tab1Btn, T(430))
  UIUtil.SetText(uis.Main.TabRegion.Tab2Btn, T(431))
  ArenaMgr.UpdateText(uis.Main.Title, T(385), T(386), T(387))
  UIUtil.SetBtnText(uis.Main.AllGetBtn, T(334), T(335))
end

function ArenaRewardWindow.CheckNewSeasonTime()
  if ArenaMgr.CheckTime() and ArenaData.Info.seasonStartTime > LoginData.GetCurServerTime() then
    ArenaService.ArenaGetAllReq(function()
      uis.Main.RewardTipsList.RewardTipsList:RefreshVirtualList()
      ArenaRewardWindow.ShowTime()
    end)
  end
end

function ArenaRewardWindow.GetRewardData(phase)
  local tb = {}
  local config = TableData.GetTable("BaseArenaRankReward")
  for i, v in pairs(config) do
    if v.phase == phase then
      table.insert(tb, v)
    end
  end
  return tb
end

function ArenaRewardWindow.GetWeekData()
  local tb = {}
  local data = TableData.GetConfig(FEATURE_ENUM.ADVENTURE_ARENA, "BaseFeature")
  local type = data.rule_list
  if type then
    local config = TableData.GetTable("BaseArenaRankReward")
    for i, v in pairs(config) do
      if v.type == type then
        table.insert(tb, v)
      end
    end
  end
  return tb
end

function ArenaRewardWindow.Sort(tb)
  local newTb = {}
  local sort = {
    1,
    0,
    2
  }
  isReward = false
  for i = 1, 3 do
    for _, v in ipairs(tb) do
      v.state = ArenaRewardWindow.GetState(v.id, v.rank_low)
      if v.state == sort[i] then
        table.insert(newTb, v)
      end
      if 1 == v.state then
        isReward = true
      end
    end
  end
  return newTb
end

function ArenaRewardWindow.ShowTime()
  if ArenaData.Info.seasonEndTime < LoginData.GetCurServerTime() then
    uis.Main.Time.TimeTxt.text = T(370)
  else
    local date = TimeUtil.FormatDate("%m/%d %H:%M", ArenaData.Info.seasonEndTime)
    local down = TimeUtil.FormatRemainTimeRough(ArenaData.Info.seasonEndTime - LoginData.GetCurServerTime())
    uis.Main.Time.TimeTxt.text = T(688, date, down)
  end
end

function ArenaRewardWindow.Init()
  uis.Main.RewardTipsList.RewardTipsList.defaultItem = UIUtil.GetResUrl("Arena:RewardTipsAni")
  uis.Main.RewardTipsList.RewardTipsList:SetVirtual()
  uis.Main.RewardTipsList.RewardTipsList.itemRenderer = ArenaRewardWindow.RefreshRankItem
  ArenaRewardWindow.ShowTime()
  uis.Main.Time.WordTxt.text = T(401)
  uis.Main.Time.RankTxt.text = ArenaMgr.GetRank(true)
end

function ArenaRewardWindow.RefreshRankItem(i, item)
  local data = rewardData[i + 1]
  local tips = item:GetChild("RewardTipsBtn")
  local state
  if isWeek then
    state = 0
    tips:GetChild("ProgressTxt").text = ""
    if data.rank_high == data.rank_low then
      tips:GetChild("WordTxt").text = T(429, data.rank_low)
    else
      tips:GetChild("WordTxt").text = T(1570, data.rank_high, data.rank_low)
    end
  else
    state = ArenaRewardWindow.GetState(data.id, data.rank_low)
    if 0 == state then
      tips:GetChild("ProgressTxt").text = T(893)
    end
    tips:GetChild("WordTxt").text = T(1571, data.rank_low)
  end
  ChangeUIController(tips, nil, state)
  UIUtil.SetBtnText(tips:GetChild("CompleteTips"), T(10912), T(10913))
  tips:GetChild("RewardGetRegion").onClick:Set(function()
    if 1 == state and false == isWeek then
      ArenaService.ArenaGetRankRewardReq(data.id, ProtoEnum.ARENA_REWARD_TYPE.ATR_SEASON)
    end
  end)
  ArenaRewardWindow.ShowRewardIcon(tips:GetChild("RewardList"), data.reward)
end

function ArenaRewardWindow.ShowRewardIcon(list, reward)
  function list.itemRenderer(i, item)
    local data = GetConfigItemList({
      reward[i + 1]
    }, true)
    for _, v in pairs(data) do
      UIUtil.ShowItemFrame(v.id, item, v.value, nil, function()
        UIUtil.CommonItemClickCallback(v.id, v.type)
      end)
    end
    ChangeUIController(item, "c3", 1)
  end
  
  list.numItems = #reward
  list.opaque = false
end

function ArenaRewardWindow.GetState(id, lv)
  if lv >= ArenaData.Info.highRank then
    if table.contain(ArenaData.Info.rewardList, id) then
      return 2
    else
      return 1
    end
  else
    return 0
  end
end

function ArenaRewardWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ArenaRewardWindow.name, uis.Main.CurrencyReturn)
  uis.Main.AllGetBtn.visible = false
  uis.Main.TabRegion.Tab1Btn.onClick:Set(function()
    isWeek = true
    rewardData = ArenaRewardWindow.GetWeekData()
    uis.Main.RewardTipsList.RewardTipsList.numItems = #rewardData
    uis.Main.TabRegion.c1Ctr.selectedIndex = 0
  end)
  uis.Main.TabRegion.Tab2Btn.onClick:Set(function()
    isWeek = false
    rewardData = ArenaRewardWindow.GetRewardData(ArenaData.Info.rewardPhase)
    rewardData = ArenaRewardWindow.Sort(rewardData)
    uis.Main.RewardTipsList.RewardTipsList.numItems = #rewardData
    uis.Main.TabRegion.c1Ctr.selectedIndex = 1
  end)
end

function ArenaRewardWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Arena.GET_GOODS then
    rewardData = ArenaRewardWindow.Sort(rewardData)
    uis.Main.RewardTipsList.RewardTipsList.numItems = #rewardData
  end
end

function ArenaRewardWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.ArenaRewardWindow.name)
  uis = nil
  contentPane = nil
  rewardData = nil
  isReward = nil
  isWeek = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return ArenaRewardWindow
