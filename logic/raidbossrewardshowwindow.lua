require("RaidBoss_RewardShowWindowByName")
local RaidBossRewardShowWindow = {}
local uis, contentPane, rankRewards, levelRewards
local tablist = {
  [1] = {
    ctrl = 0,
    title = T(20283)
  },
  [2] = {
    ctrl = 1,
    title = T(20284)
  }
}
local getRankStr = function(rank_type, rank_value)
  if 2 == rank_type then
    return string.format("%.1f%%", 100 * (rank_value / 10000))
  end
  return rank_value
end
local DisplayRewards = function(rewards, glist, ctrl, dontDisplayNum)
  function glist.itemRenderer(j, gcmp)
    local str = rewards[j + 1]
    
    local splits = Split(str, ":")
    local itemId, itemType, count
    if dontDisplayNum then
      itemType = tonumber(splits[2])
      itemId = tonumber(splits[3])
    else
      itemType = tonumber(splits[1])
      itemId = tonumber(splits[2])
      count = tonumber(splits[3])
    end
    UIUtil.SetIconById(gcmp:GetChild("ItemLoader"), itemId)
    gcmp.onClick:Set(function()
      UIUtil.CommonItemClickCallback(itemId, itemType)
    end)
    local numberTxt = gcmp:GetChild("NumberTxt")
    numberTxt.visible = not dontDisplayNum
    numberTxt.text = count
    local itemLabel = gcmp:GetChild("ItemLabel")
    local labelText = T(20285)
    ChangeUIController(gcmp, "c2", ctrl)
    UIUtil.SetText(itemLabel, labelText, "LabelWordTxt")
    local conf = TableData.GetConfig(itemId, "BaseItem")
    ChangeUIController(gcmp, "c1", conf.quality)
  end
  
  glist.numItems = rewards and #rewards or 0
end
local RankRewardsItemRenderer = function(i, gcmp)
  local conf = rankRewards[i + 1]
  local rewards = conf.reward
  local child = gcmp:GetChild("RankRewardTips")
  local rewardlist = child:GetChild("RewardList")
  local number = child:GetChild("RankRewardNumber")
  local floor = conf.rank_low
  if floor < 4 then
    ChangeUIController(number, "c1", floor - 1)
    UIUtil.SetText(number, floor, "NumberTxt")
    ChangeUIController(number, "c2", 0)
  else
    local content, ctrlindex
    local rank_type = conf.rank_type
    local upper_limit, lower_limit = conf.rank_high, conf.rank_low
    if upper_limit > 0 then
      if upper_limit == lower_limit then
        content = T(20341, getRankStr(rank_type, lower_limit))
      else
        content = T(20286, getRankStr(rank_type, upper_limit), getRankStr(rank_type, lower_limit))
      end
    else
      content = T(20287, getRankStr(rank_type, lower_limit))
    end
    if lower_limit <= 5 then
      ctrlindex = 1
    else
      ctrlindex = 2
    end
    UIUtil.SetText(number, content, "NumberTxt")
    ChangeUIController(number, "c1", lower_limit <= 5 and 0 or lower_limit <= 50 and 1 or 2)
    ChangeUIController(number, "c2", ctrlindex)
  end
  DisplayRewards(rewards, rewardlist, 0)
end
local LevelRewardsItemRenderer = function(i, gcmp)
  local item = levelRewards[i + 1]
  local conf = TableData.GetConfig(item.stageId, "BaseStage")
  local rewards = conf.first_reward
  local child = gcmp:GetChild("DifficultyRewardTips")
  local number = child:GetChild("DifficultyRewardNumber")
  UIUtil.SetText(number, type(conf.name_detail) == "function" and conf.name_detail(), "NumberTxt")
  UIUtil.SetText(number, T(20288), "WordTxt")
  local rewardlist = child:GetChild("RewardList")
  DisplayRewards(rewards, rewardlist, 1)
  local passed = RaidBossMgr.IsPassed(item.stageId)
  ChangeUIController(child, "c1", item.got and 2 or passed and 1 or 0)
  local getBtn = child:GetChild("GetBtn")
  UIUtil.SetText(getBtn, T(20320), "WordTxt")
  UIUtil.SetText(child:GetChild("Progress"), T(20321), "WordTxt")
  getBtn.onClick:Set(function()
    if passed and not item.got then
      RaidBossService.GetRewardReq(item.stageId)
    end
  end)
end
local TabItemRenderer = function(i, gcmp)
  local item = tablist[i + 1]
  UIUtil.SetText(gcmp, item.title, "WordTxt")
  gcmp.onClick:Set(function()
    if uis.Main.c1Ctr.selectedIndex ~= item.ctrl then
      uis.Main.c1Ctr.selectedIndex = item.ctrl
    end
  end)
end
local DisplayRankInfo = function(display)
  if display then
    local rank = RaidBossData.GetPlayerRank(false)
    local rankRatio = RaidBossData.GetPlayerRank(true)
    local rankText
    if rankRatio > 0 then
      rankText = T(20319, string.format("%s%%", math.ceil(rankRatio * 100 / 10000)))
    elseif rank > 0 then
      rankText = rank
    else
      rankText = T(20311)
    end
    uis.Main.NowRank.RankTxt.text = rankText
  end
  uis.Main.NowRank.root.visible = display
end
local RefreshLevelRewards = function()
  levelRewards = {}
  local levels = RaidBossData.GetLevelList()
  local gotStages = RaidBossData.GetRaidBossData().rewardStages
  for i, v in ipairs(levels) do
    local conf = TableData.GetConfig(v, "BaseStage")
    local rewards = conf.first_reward
    if rewards and _G.next(rewards) then
      table.insert(levelRewards, {
        stageId = conf.id,
        got = table.keyof(gotStages, conf.id)
      })
    end
  end
  table.sort(levelRewards, function(x, y)
    local a = type(x.got)
    local b = type(y.got)
    if a ~= b then
      return "number" ~= a
    end
    return x.stageId < y.stageId
  end)
  local list = uis.Main.DifficultyRewardTipsList.RewardTipsList
  list.numItems = #levelRewards
end

function RaidBossRewardShowWindow.ReInitData()
end

function RaidBossRewardShowWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RaidBossRewardShowWindow.package, WinResConfig.RaidBossRewardShowWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRaidBoss_RewardShowWindowUis(contentPane)
    RaidBossRewardShowWindow.UpdateInfo()
    RaidBossRewardShowWindow.InitBtn()
  end)
end

function RaidBossRewardShowWindow.UpdateInfo()
  local raidBossData = RaidBossData.GetRaidBossData()
  local phase = raidBossData and (raidBossData.phase or 2) or 2
  local rewardTbl = TableData.GetTable("BaseRaidBossReward")
  rankRewards = {}
  for i, v in pairs(rewardTbl) do
    if v.phase == phase then
      table.insert(rankRewards, v)
    end
  end
  table.sort(rankRewards, function(x, y)
    if x.rank_type ~= y.rank_type then
      return x.rank_type < y.rank_type
    end
    return x.rank_low < y.rank_low
  end)
  local curRankText = T(20278)
  local rewardTitleText = T(20282)
  local rewardDescText = T(20289)
  local rankRewardTitleText = T(20316)
  local rankRewardDescText = T(20317)
  uis.Main.c1Ctr.onChanged:Set(function()
    local list
    if 0 == uis.Main.c1Ctr.selectedIndex then
      list = uis.Main.DifficultyRewardTipsList.RewardTipsList
      uis.Main.RewardTitle.TitleTxt.text = rewardTitleText
      uis.Main.RewardTitle.WordTxt.text = rewardDescText
      DisplayRankInfo(false)
    else
      list = uis.Main.RankRewardTipsList.RewardTipsList
      uis.Main.RewardTitle.TitleTxt.text = rankRewardTitleText
      uis.Main.RewardTitle.WordTxt.text = rankRewardDescText
      DisplayRankInfo(true)
    end
    for i = 0, list.numItems - 1 do
      local child = list:GetChildAt(i)
      for j = 0, child.numChildren - 1 do
        child:GetChildAt(j).alpha = 0
      end
      PlayUITrans(child, "up", nil, i * 0.03)
    end
  end)
  local list = uis.Main.RankRewardTipsList.RewardTipsList
  list.itemRenderer = RankRewardsItemRenderer
  list.numItems = #rankRewards
  list = uis.Main.DifficultyRewardTipsList.RewardTipsList
  list.itemRenderer = LevelRewardsItemRenderer
  RefreshLevelRewards()
  TabItemRenderer(0, uis.Main.Tab1Btn)
  TabItemRenderer(1, uis.Main.Tab2Btn)
  local levels = RaidBossData.GetLevelList()
  local gotStages = RaidBossData.GetRaidBossData().rewardStages
  local gotAll = true
  for i, v in ipairs(levels) do
    local stageConf = TableData.GetConfig(v, "BaseStage")
    local reward = stageConf.first_reward
    local got = not reward or not _G.next(reward) or table.keyof(gotStages, v)
    if not got then
      gotAll = false
      break
    end
  end
  if gotAll then
    uis.Main.c1Ctr.selectedIndex = 1
  else
    uis.Main.c1Ctr.selectedIndex = 0
    DisplayRankInfo(false)
    uis.Main.RewardTitle.TitleTxt.text = rewardTitleText
    uis.Main.RewardTitle.WordTxt.text = rewardDescText
  end
  uis.Main.NowRank.WordTxt.text = curRankText
  RedDotMgr.AddNode({
    windowName = WinResConfig.RaidBossRewardShowWindow.name,
    com = uis.Main.Tab1Btn,
    visibleFunc = function()
      return RedDotRaidBoss.HasAnyRewards()
    end,
    dataType = RED_DOT_DATA_TYPE.ADVENTURE
  })
end

function RaidBossRewardShowWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RaidBossRewardShowWindow.name)
  end)
end

function RaidBossRewardShowWindow.OnClose()
  uis = nil
  contentPane = nil
  RedDotMgr.RemoveNode(WinResConfig.RaidBossRewardShowWindow.name)
end

function RaidBossRewardShowWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.RaidBossRewardShowWindow.REFRESH_REWARD_LIST then
    RefreshLevelRewards()
  end
end

return RaidBossRewardShowWindow
