require("SuperDungeon_RewardGetWindowByName")
local FrostDungeonRewardWindow = {}
local uis, contentPane, selectedStageId, challenges
local RefreshRewardItems = function(selectedLevelIndex)
  local info = FrostDungeonData.GetFrostDungeonInfo()
  local chapterConf = TableData.GetConfig(info.chapterId, "BaseChapter")
  local stageId = chapterConf.stages[selectedLevelIndex + 1]
  local conf = TableData.GetConfig(stageId, "BaseStage")
  selectedStageId = stageId
  challenges = FrostDungeonData.GetLevelChallenges(selectedStageId)
  local tablist = uis.Main.TabList
  tablist.selectedIndex = selectedLevelIndex
  local itemlist = uis.Main.ItemList
  local numRewardItems = #challenges
  table.sort(challenges, function(x, y)
    if x.state == y.state then
      return x.id < y.id
    end
    if x.state == ProtoEnum.CHALLENGE_STAT_TYPE.CST_FINISH then
      return true
    end
    if y.state == ProtoEnum.CHALLENGE_STAT_TYPE.CST_FINISH then
      return false
    end
    return x.state < y.state
  end)
  itemlist.numItems = numRewardItems
  local specialItem = uis.Main.SpecialItem
  local challengeConf = TableData.GetConfig(chapterConf.challenge_condition, "BaseStageChallenge")
  local specialItemWordTxtContent = challengeConf.name()
  UIUtil.SetText(specialItem.root, specialItemWordTxtContent, "WordTxt")
  local specialItemlist = specialItem.ItemList
  
  function specialItemlist.itemRenderer(i, gcmp)
    local reward = challengeConf.reward[i + 1]
    local splits = Split(reward, ":")
    local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
    local rewardConf = TableData.GetConfig(itemId, "BaseItem")
    ChangeUIController(gcmp, "c1", rewardConf.quality)
    UIUtil.SetIconById(gcmp:GetChild("ItemLoader"), itemId)
    UIUtil.SetText(gcmp, count, "NumberTxt")
    gcmp.onClick:Set(function(context)
      UIUtil.CommonItemClickCallback(itemId, itemType)
      context:StopPropagation()
    end)
  end
  
  specialItemlist.numItems = #challengeConf.reward
  local getBtnWordTxtContent = T(20320)
  local state = FrostDungeonData.GetFrostDungeonInfo().chapterTarget
  UIUtil.SetText(specialItem.GetBtn, getBtnWordTxtContent, "WordTxt")
  UIUtil.SetText(specialItem.root, state == ProtoEnum.CHALLENGE_STAT_TYPE.CST_NONE and T(20321) or T(20243), "TipsTxt")
  ChangeUIController(specialItem.root, "c1", state == ProtoEnum.CHALLENGE_STAT_TYPE.CST_NONE and 0 or state == ProtoEnum.CHALLENGE_STAT_TYPE.CST_FINISH and 1 or 2)
  ChangeUIController(specialItem.root, "c2", state ~= ProtoEnum.CHALLENGE_STAT_TYPE.CST_REWARDED and 1 or 0)
  specialItem.root.onClick:Set(function()
    if FrostDungeonData.GetFrostDungeonInfo().chapterTarget == ProtoEnum.CHALLENGE_STAT_TYPE.CST_FINISH then
      FrostDungeonService.GetFrostDungeonRewardReq(0, challengeConf.id)
    end
  end)
end
local TabItemRenderer = function(i, gcmp)
  local list = FrostDungeonData.GetLevelList()
  local stageId = list[i + 1]
  local conf = TableData.GetConfig(stageId, "BaseStage")
  local unlock = FrostDungeonMgr.IsLevelUnlock(stageId)
  ChangeUIController(gcmp, "c1", unlock and 1 or 0)
  local challenges = FrostDungeonData.GetLevelChallenges(stageId)
  local cnt = 0
  if unlock then
    for _, v in ipairs(challenges) do
      if v.state == ProtoEnum.CHALLENGE_STAT_TYPE.CST_REWARDED then
        cnt = cnt + 1
      end
    end
    UIUtil.SetText(gcmp, string.format("[color=#e6ff51]%s[/color]/%s", cnt, #challenges), "NumberTxt")
  end
  local wordTxtContent = conf.name()
  UIUtil.SetText(gcmp, wordTxtContent, "WordTxt")
  gcmp.onClick:Set(function()
    RefreshRewardItems(i)
  end)
  RedDotMgr.AddNode({
    windowName = WinResConfig.FrostDungeonRewardWindow.name,
    com = gcmp,
    visibleFunc = function()
      return RedDotFrostDungeon.HasAnyRewardsByStageId(stageId)
    end,
    dataType = RED_DOT_DATA_TYPE.ABYSS
  })
end
local RewardItemRenderer = function(i, gcmp)
  PlayUITrans(gcmp, "up", nil, i * 0.03)
  local subgcmp = gcmp:GetChild("RewardItem")
  local getBtn = subgcmp:GetChild("GetBtn")
  local itemlist = subgcmp:GetChild("ItemList")
  subgcmp.alpha = 0
  local index = i + 1
  local challenge = challenges[index]
  local state = challenge.state
  local challengeId = challenge.id
  local conf = TableData.GetConfig(challengeId, "BaseStageChallenge")
  local itemTitleContent = conf.name()
  local getBtnWordTxtContent = T(20320)
  local runningTxtContent = T(20084)
  local availableTxtContent = T(20243)
  UIUtil.SetText(subgcmp, itemTitleContent, "WordTxt")
  UIUtil.SetText(getBtn, getBtnWordTxtContent, "WordTxt")
  ChangeUIController(subgcmp, "c1", state == ProtoEnum.CHALLENGE_STAT_TYPE.CST_NONE and 0 or state == ProtoEnum.CHALLENGE_STAT_TYPE.CST_FINISH and 1 or 2)
  local stageUnlock = FrostDungeonMgr.IsLevelUnlock(selectedStageId)
  ChangeUIController(subgcmp, "c2", stageUnlock and 1 or 0)
  UIUtil.SetText(subgcmp:GetChild("Progress"), T(20321), "TipsTxt")
  if stageUnlock then
    UIUtil.SetText(subgcmp, state == ProtoEnum.CHALLENGE_STAT_TYPE.CST_NONE and runningTxtContent or availableTxtContent, "TipsTxt")
  end
  
  function itemlist.itemRenderer(j, ggcmp)
    local reward = conf.reward[j + 1]
    local splits = Split(reward, ":")
    local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
    local rewardConf = TableData.GetConfig(itemId, "BaseItem")
    ChangeUIController(ggcmp, "c1", rewardConf.quality)
    UIUtil.SetIconById(ggcmp:GetChild("ItemLoader"), itemId)
    UIUtil.SetText(ggcmp, count, "NumberTxt")
    ggcmp.onClick:Set(function(context)
      UIUtil.CommonItemClickCallback(itemId, itemType)
      context:StopPropagation()
    end)
  end
  
  itemlist.numItems = #conf.reward
  subgcmp.onClick:Set(function()
    if state == ProtoEnum.CHALLENGE_STAT_TYPE.CST_FINISH then
      FrostDungeonService.GetFrostDungeonRewardReq(selectedStageId, challengeId)
    end
  end)
end

function FrostDungeonRewardWindow.ReInitData()
end

function FrostDungeonRewardWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.FrostDungeonRewardWindow.package, WinResConfig.FrostDungeonRewardWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetSuperDungeon_RewardGetWindowUis(contentPane)
    FrostDungeonRewardWindow.UpdateInfo()
    FrostDungeonRewardWindow.InitBtn()
  end)
end

function FrostDungeonRewardWindow.UpdateInfo()
  local main = uis.Main
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.FrostDungeonRewardWindow.name, main.CurrencyReturn)
  local info = FrostDungeonData.GetFrostDungeonInfo()
  local conf = TableData.GetConfig(info.chapterId, "BaseChapter")
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(conf.reward_back_ground)
  local tablist = main.TabList
  local itemlist = main.ItemList
  tablist.itemRenderer = TabItemRenderer
  itemlist.itemRenderer = RewardItemRenderer
  tablist.numItems = #conf.stages
  local levelIndex = 0
  RefreshRewardItems(levelIndex)
end

function FrostDungeonRewardWindow.InitBtn()
end

function FrostDungeonRewardWindow.OnClose()
  uis = nil
  contentPane = nil
  RedDotMgr.RemoveNode(WinResConfig.FrostDungeonRewardWindow.name)
end

function FrostDungeonRewardWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.FrostDungeonRewardWindow.REFRESH_PANEL_INFO then
    RedDotMgr.UpdateNodeByWindowName(WinResConfig.FrostDungeonWindow.name)
    RedDotMgr.UpdateNodeByWindowName(WinResConfig.FrostDungeonRewardWindow.name)
    RefreshRewardItems(FrostDungeonMgr.GetLevelIndex(selectedStageId) - 1)
    local tablist = uis.Main.TabList
    tablist.numItems = tablist.numItems
  end
end

return FrostDungeonRewardWindow
