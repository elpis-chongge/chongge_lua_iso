require("Explore_ExploreAFKWindowByName")
local ExploreAFKWindow = {}
local uis, contentPane, teamsInfo, currentSelectedTeam, lastSelectedTeamIndex
local CardItemRenderer = function(i, gcmp)
  local index = i + 1
  local occupationType = currentSelectedTeam.occupationTypes[index]
  local holder = gcmp:GetChild("QBHolder")
  local occupation = gcmp:GetChild("Occupation")
  ChangeUIController(occupation, "c1", occupationType - 1)
  local groupId = currentSelectedTeam.id
  local groupInfo = ExploreAFKData.GetGroupInfo(groupId)
  local exists = true
  if not (groupInfo and groupInfo.cards) or 0 == #groupInfo.cards then
    exists = false
  end
  local cardId
  if exists then
    cardId = groupInfo.cards[index]
  else
    cardId = ExploreAFKData.GetTempGroupCard(groupId, index)
  end
  if cardId then
    local cardData = CardData.GetCardDataById(cardId)
    local fashionData = TableData.GetConfig(cardData.fashionId, "BaseFashion")
    if fashionData then
      UIUtil.SetCardBattleSpine(ModelUtil.GetFullPath(fashionData.spd), holder, SPINE_STATE_ENUM.IDLE, true, Const.cardScale * fashionData.spd_scale / 10000, true, function(spineModel)
        SkeletonAnimationUtil.SetFlip(spineModel, false, false)
        SkeletonAnimationUtil.SetShaderEffectEnable(spineModel, false, false)
      end)
    end
    ChangeUIController(gcmp, "c1", 1)
  else
    ChangeUIController(gcmp, "c1", 0)
  end
  gcmp.onClick:Set(function()
    if exists then
      return
    end
    OpenWindow(WinResConfig.ExploreDispatchWindow.name, nil, groupId)
  end)
end
local TimeItemRenderer = function(i, gcmp)
  local index = i + 1
  local rewardInfo = currentSelectedTeam.rewards[index]
  local hours = math.floor(rewardInfo.time / 60)
  UIUtil.SetText(gcmp, T(1609, hours), "TimeTxt")
  if currentSelectedTeam.selectedRewardIndex and currentSelectedTeam.selectedRewardIndex == index then
    ChangeUIController(gcmp, "button", 1)
  else
    ChangeUIController(gcmp, "button", 0)
  end
  gcmp.onClick:Set(function()
    currentSelectedTeam.selectedRewardIndex = index
    local timelist = uis.Main.AFKRegoin.TimeChoice.TimeList
    local spendlist = uis.Main.AFKRegoin.RewardUp.SpendList
    timelist.numItems = #currentSelectedTeam.rewards
    local selectedReward = currentSelectedTeam.rewards[index]
    local rewardlist = uis.Main.AFKRewardInfo.ItemList
    rewardlist.numItems = #selectedReward.reward
    spendlist.numItems = #selectedReward.exadd_cost
    local rate = selectedReward.exadd_rate / 10000
    uis.Main.AFKRegoin.RewardUp.WordTxt.text = rate
  end)
end
local SpendItemRenderer = function(i, gcmp)
  local selectedReward = currentSelectedTeam.rewards[currentSelectedTeam.selectedRewardIndex]
  local cost = selectedReward.exadd_cost[i + 1]
  local splits = Split(cost, ":")
  local itemId, count = tonumber(splits[2]), splits[3]
  UIUtil.SetIconById(gcmp:GetChild("PicLoader"), itemId)
  UIUtil.SetText(gcmp, T(20219), "WordTxt")
  UIUtil.SetText(gcmp, count, "NumberTxt")
  local enough = ActorData.GetItemCount(itemId) >= tonumber(count)
  ChangeUIController(gcmp, "c1", enough and 0 or 1)
  local extra = currentSelectedTeam.extra
  ChangeUIController(gcmp, "c2", extra and extra - 1 == i and 1 or 0)
  gcmp.onClick:Set(function()
    local c2 = gcmp:GetController("c2")
    if 0 == c2.selectedIndex then
      local list = uis.Main.AFKRegoin.RewardUp.SpendList
      for j = 0, list.numChildren - 1 do
        local ctrl = list:GetChildAt(j):GetController("c2")
        ctrl.selectedIndex = j == i and 1 or 0
      end
      currentSelectedTeam.extra = i + 1
    else
      c2.selectedIndex = 0
      currentSelectedTeam.extra = nil
    end
    local rewardlist = uis.Main.AFKRewardInfo.ItemList
    local selectedRewardIndex = currentSelectedTeam.selectedRewardIndex
    rewardlist.numItems = #currentSelectedTeam.rewards[selectedRewardIndex].reward
  end)
end
local RewardItemRenderer = function(i, gcmp)
  local item = gcmp:GetChild("Item")
  local groupInfo = ExploreAFKData.GetGroupInfo(currentSelectedTeam.id)
  local rewardId, isExtra
  if groupInfo then
    rewardId = groupInfo.rewardId
    isExtra = groupInfo.isExtra
  else
    local rewards = currentSelectedTeam.rewards
    local selectedRewardIndex = currentSelectedTeam.selectedRewardIndex
    isExtra = currentSelectedTeam.extra
    if selectedRewardIndex then
      rewardId = rewards[selectedRewardIndex].id
    end
  end
  if rewardId then
    local config = TableData.GetConfig(rewardId, "BaseDispatchReward")
    local str = config.reward[i + 1]
    local ex_str = config.exadd_reward[i + 1]
    local splits = Split(str, ":")
    local ex_splits = Split(ex_str, ":")
    local itemId, count = tonumber(splits[2]), tonumber(splits[3])
    UIUtil.SetIconById(item:GetChild("ItemLoader"), itemId)
    UIUtil.SetText(gcmp, count, "NumberTxt")
    if isExtra then
      UIUtil.SetText(gcmp, string.format("+%s", ex_splits[3]), "AddNumberTxt")
    else
      UIUtil.SetText(gcmp, "", "AddNumberTxt")
    end
    item.onClick:Set(function()
      UIUtil.CommonItemClickCallback(itemId, tonumber(splits[1]))
    end)
  end
end
local SelectTeamTab = function(index)
  local cardlist = uis.Main.AFKRegoin.CardList
  local togglelist = uis.Main.AFKRegoin.SwitchBtnList
  local timelist = uis.Main.AFKRegoin.TimeChoice.TimeList
  local spendlist = uis.Main.AFKRegoin.RewardUp.SpendList
  local rewardlist = uis.Main.AFKRewardInfo.ItemList
  togglelist.selectedIndex = index
  local teamInfo = teamsInfo[index + 1]
  local selectedRewardIndex = 1
  if currentSelectedTeam then
    local changed = currentSelectedTeam.id ~= teamInfo.id
    selectedRewardIndex = changed and 1 or currentSelectedTeam.selectedRewardIndex
  end
  currentSelectedTeam = teamInfo
  currentSelectedTeam.selectedRewardIndex = selectedRewardIndex
  cardlist.numItems = #teamInfo.occupationTypes
  timelist.numItems = #teamInfo.rewards
  local selectedReward = currentSelectedTeam.rewards[selectedRewardIndex]
  rewardlist.numItems = #selectedReward.reward
  spendlist.numItems = #selectedReward.exadd_cost
  local rate = selectedReward.exadd_rate / 10000
  uis.Main.AFKRegoin.RewardUp.WordTxt.text = rate
  local groupInfo = ExploreAFKData.GetGroupInfo(teamInfo.id)
  local timestamp = LoginData.GetCurServerTime()
  local diff = (groupInfo and groupInfo.overStamp or 0) - timestamp
  if diff > 0 then
    uis.Main.AFKRegoin.c1Ctr.selectedIndex = 1
    local rewardId = groupInfo.rewardId
    local rewards = teamInfo.rewards
    local k = table.keyof(rewards, rewardId, "id")
    local countdown = uis.Main.AFKRegoin.Countdown
    if k then
      local seconds = rewards[k].time * 60
      countdown.CountdownProgressBar.value = (1 - diff / seconds) * 100
    else
      local tbl = TableData.GetTable("BaseDispatchReward")
      for i, v in pairs(tbl) do
        if i == rewardId then
          local seconds = v.time * 60
          countdown.CountdownProgressBar.value = (1 - diff / seconds) * 100
          break
        end
      end
    end
    countdown.WordTxt.text = T(20553)
    countdown.WordTipsTxt.text = T(20551)
    countdown.Time.WordTxt.text = T(20552)
    countdown.Time.TimeTxt.text = TimeUtil.FormatTime(diff)
  elseif groupInfo and diff < 0 then
    uis.Main.AFKRegoin.c1Ctr.selectedIndex = 2
  else
    uis.Main.AFKRegoin.c1Ctr.selectedIndex = 0
  end
  if groupInfo then
    local config = TableData.GetConfig(groupInfo.rewardId, "BaseDispatchReward")
    local rewardlist = uis.Main.AFKRewardInfo.ItemList
    rewardlist.numItems = #config.reward
  end
  lastSelectedTeamIndex = index
end
local ToggleItemRenderer = function(i, gcmp, onlyDisplay)
  local teamInfo = teamsInfo[i + 1]
  local conf = TableData.GetConfig(teamInfo.id, "BaseDispatchTeam")
  local unlock = ExploreAFKData.GetLevel() >= conf.dispatch_level
  local groupInfo = ExploreAFKData.GetGroupInfo(teamInfo.id)
  local availableText = T(20557)
  UIUtil.SetText(gcmp, teamInfo.name, "NameTxt")
  UIUtil.SetText(gcmp, availableText, "NothingTxt")
  if unlock then
    local available = true
    if groupInfo then
      local diff = groupInfo.overStamp - LoginData.GetCurServerTime()
      if diff > 0 then
        available = false
        UIUtil.SetText(gcmp, TimeUtil.FormatTime(diff), "TimeTxt")
        ChangeUIController(gcmp, "c1", 1)
      elseif diff < 0 then
        available = false
        ChangeUIController(gcmp, "c1", 2)
      end
    end
    if available then
      ChangeUIController(gcmp, "c1", 0)
    end
  else
    ChangeUIController(gcmp, "c1", 3)
    UIUtil.SetText(gcmp, T(1374, conf.dispatch_level), "LockTxt")
  end
  if onlyDisplay then
    return
  end
  gcmp.onClick:Set(function()
    if unlock then
      SelectTeamTab(i)
    else
      FloatTipsUtil.ShowWarnTips(T(20541))
    end
  end)
end
local RefreshPanelInfo = function()
  local exp = ExploreAFKData.GetExp()
  local level = ExploreAFKData.GetLevel()
  local title = uis.Main.AFKTitle
  local titleNameText = T(20554)
  local levelText = T(1374, level)
  local descText = T(20555)
  local maxExpText = T(20556)
  title.NameTxt.text = titleNameText
  title.LevelTxt.text = levelText
  title.WordTxt.text = descText
  title.ExpMaxTxt.text = maxExpText
  local maxLevel = ExploreAFKData.GetMaxLevel()
  title.c1Ctr.selectedIndex = level >= maxLevel and 1 or 0
  local threshold = ExploreAFKData.GetLevelExpThreshold(level)
  title.ExpTxt.text = string.format("%s/%s", exp, threshold)
  title.ExpProgressBar.value = exp / threshold * 100
  if not teamsInfo then
    teamsInfo = {}
    local teamTbl = TableData.GetTable("BaseDispatchTeam")
    local dispatchRwdTbl = TableData.GetTable("BaseDispatchReward")
    for i, v in pairs(teamTbl) do
      local job_num = v.job_num
      local occupationTypes = {}
      local rewards = {}
      for _, occupationType in ipairs(job_num) do
        table.insert(occupationTypes, occupationType)
      end
      if v.dispatch_reward then
        for _, dispatch_reward_group in ipairs(v.dispatch_reward) do
          for _, rwdItem in pairs(dispatchRwdTbl) do
            if rwdItem.group_id == dispatch_reward_group then
              local levelIsInRange = true
              if rwdItem.level_range then
                levelIsInRange = level >= rwdItem.level_range[1] and level < rwdItem.level_range[2]
              end
              if levelIsInRange and not table.keyof(rewards, rwdItem.id, "id") then
                table.insert(rewards, rwdItem)
              end
            end
          end
        end
      end
      local name = v.name and v.name() or "未配置"
      table.insert(teamsInfo, {
        id = i,
        occupationTypes = occupationTypes,
        rewards = rewards,
        name = name
      })
    end
    table.sort(teamsInfo, function(x, y)
      return x.id < y.id
    end)
  end
  local togglelist = uis.Main.AFKRegoin.SwitchBtnList
  local teamIndex = lastSelectedTeamIndex or 0
  togglelist.numItems = #teamsInfo
  if teamIndex >= 0 then
    SelectTeamTab(teamIndex)
  end
  local val = TableData.GetConfig(70011501, "BaseFixed").array_value
  local assetlist = Split(val, "|")
  for k, v in pairs(assetlist) do
    assetlist[k] = tonumber(v)
  end
  UIUtil.InitAssetsTips(uis.Main.AssetsTipsList, assetlist)
end
local Update = function()
  local timestamp = LoginData.GetCurServerTime()
  if currentSelectedTeam then
    local groupId = currentSelectedTeam.id
    local groupInfo = ExploreAFKData.GetGroupInfo(groupId)
    local diff = (groupInfo and groupInfo.overStamp or 0) - timestamp
    if diff >= 0 then
      local rewardId = groupInfo.rewardId
      local rewards = currentSelectedTeam.rewards
      local k = table.keyof(rewards, rewardId, "id")
      local countdown = uis.Main.AFKRegoin.Countdown
      if k then
        local seconds = rewards[k].time * 60
        countdown.CountdownProgressBar.value = (1 - diff / seconds) * 100
      else
        local tbl = TableData.GetTable("BaseDispatchReward")
        for i, v in pairs(tbl) do
          if i == rewardId then
            local seconds = v.time * 60
            countdown.CountdownProgressBar.value = (1 - diff / seconds) * 100
            break
          end
        end
      end
      countdown.WordTxt.text = T(20553)
      countdown.WordTipsTxt.text = T(20551)
      countdown.Time.WordTxt.text = T(20552)
      countdown.Time.TimeTxt.text = TimeUtil.FormatTime(diff)
    elseif groupInfo and diff < 0 then
      uis.Main.AFKRegoin.c1Ctr.selectedIndex = 2
    end
  end
  local allGroupsInfo = ExploreAFKData.GetAllGroupsInfo()
  if allGroupsInfo then
    for i, v in ipairs(allGroupsInfo) do
      local index = table.keyof(teamsInfo, v.groupId, "id")
      if index then
        ToggleItemRenderer(index - 1, uis.Main.AFKRegoin.SwitchBtnList:GetChildAt(index - 1), true)
      end
    end
  end
end

function ExploreAFKWindow.ReInitData()
end

function ExploreAFKWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExploreAFKWindow.package, WinResConfig.ExploreAFKWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExplore_ExploreAFKWindowUis(contentPane)
    ExploreAFKWindow.UpdateInfo()
    ExploreAFKWindow.InitBtn()
  end)
end

function ExploreAFKWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://b8iy916tmwm2w"
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ExploreAFKWindow.name, uis.Main.CurrencyReturn)
  local cardlist = uis.Main.AFKRegoin.CardList
  local togglelist = uis.Main.AFKRegoin.SwitchBtnList
  local timelist = uis.Main.AFKRegoin.TimeChoice.TimeList
  local spendlist = uis.Main.AFKRegoin.RewardUp.SpendList
  local rewardlist = uis.Main.AFKRewardInfo.ItemList
  cardlist.itemRenderer = CardItemRenderer
  togglelist.itemRenderer = ToggleItemRenderer
  timelist.itemRenderer = TimeItemRenderer
  spendlist.itemRenderer = SpendItemRenderer
  rewardlist.itemRenderer = RewardItemRenderer
  ExploreAFKService.GetExploreAFKInfoReq(RefreshPanelInfo)
  local startDispatchText = T(20543)
  local rewardInfoText = T(20544)
  local getText = T(20545)
  local giveupText = T(20546)
  local completedText = T(20547)
  local startTipsText = T(20548)
  UIUtil.SetText(uis.Main.AFKStartTips.root, startTipsText, "WordTxt")
  UIUtil.SetText(uis.Main.AFKRegoin.StartBtn, startDispatchText, "NameTxt")
  UIUtil.SetText(uis.Main.AFKRegoin.GetBtn, getText, "NameTxt")
  UIUtil.SetText(uis.Main.AFKRegoin.GiveUpBtn, giveupText, "NameTxt")
  UIUtil.SetText(uis.Main.AFKRegoin.End.root, completedText, "WordTxt")
  UIUtil.SetText(uis.Main.AFKRewardInfo.root, rewardInfoText, "NameTxt")
  UpdateManager.RemoveUpdateHandler(Update)
  UpdateManager.AddUpdateHandler(Update)
end

function ExploreAFKWindow.InitBtn()
  uis.Main.AFKRegoin.StartBtn.onClick:Set(function()
    local ready = ExploreAFKMgr.IsReady(currentSelectedTeam.id)
    local selectedRewardIndex = currentSelectedTeam.selectedRewardIndex
    if currentSelectedTeam and ready and selectedRewardIndex then
      local groupId = currentSelectedTeam.id
      local reward = currentSelectedTeam.rewards[currentSelectedTeam.selectedRewardIndex]
      ExploreAFKMgr.StartDispatch(groupId, reward.id, currentSelectedTeam.extra, function()
        ExploreAFKData.ClearTempGroupCards(groupId)
        RefreshPanelInfo()
        PlayUITrans(uis.Main.root, "Start")
      end)
    elseif not ready then
      FloatTipsUtil.ShowWarnTips(T(20549))
    end
  end)
  uis.Main.AFKRegoin.GetBtn.onClick:Set(function()
    ExploreAFKService.GetExploreAFKRewardsReq(currentSelectedTeam.id, RefreshPanelInfo)
  end)
  uis.Main.AFKRegoin.GiveUpBtn.onClick:Set(function()
    MessageBox.Show(T(20550), {
      touchCallback = function()
        ExploreAFKService.CancelExploreAFKReq(currentSelectedTeam.id, RefreshPanelInfo)
      end
    }, {})
  end)
end

function ExploreAFKWindow.OnShown()
  if uis then
    RefreshPanelInfo()
  end
end

function ExploreAFKWindow.OnClose()
  uis = nil
  contentPane = nil
  lastSelectedTeamIndex = nil
  ExploreAFKData.ClearAllTempGroupCards()
  UpdateManager.RemoveUpdateHandler(Update)
end

return ExploreAFKWindow
