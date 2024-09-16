require("TideDungeon_TideRewardWindowByName")
local TideRewardWindow = {}
local uis, contentPane, curDungeonType, rewardItems
local TAB_DUNGEON_TYPE = {
  ProtoEnum.SCENE_TYPE.MANOR_WATER,
  ProtoEnum.SCENE_TYPE.MANOR_FIR,
  ProtoEnum.SCENE_TYPE.MANOR_WOOD
}
local ForeachTabBtns = function(func)
  if type(func) == "function" then
    for i = 1, 3 do
      local name = string.format("Tab%dBtn", i)
      local btn = uis.Main[name]
      func(i, btn)
    end
  end
end
local RewardItemRenderer = function(i, gcmp)
  local item = rewardItems[i + 1]
  local stageId = item.stageId
  local conf = TableData.GetConfig(stageId, "BaseStage")
  local child = gcmp:GetChild("RewardTips")
  local rewardlist = child:GetChild("RewardList")
  local rewards = {}
  
  function rewardlist.itemRenderer(j, subgcmp)
    local reward = rewards[j + 1]
    local type = reward.type
    local itemId = reward.itemId
    UIUtil.ShowItemFrame(itemId, subgcmp, reward.count, nil, function()
      UIUtil.CommonItemClickCallback(itemId, type)
    end)
  end
  
  for _, str in ipairs(conf.first_reward) do
    local splits = Split(str, ":")
    table.insert(rewards, {
      itemId = tonumber(splits[2]),
      count = tonumber(splits[3]),
      type = tonumber(splits[1])
    })
  end
  rewardlist.defaultItem = "ui://q8fe1rmwop5b4y"
  rewardlist.numItems = #rewards
  local titleText = conf.name()
  local getText = T(20320)
  local progressText = T(20321)
  child.alpha = 0
  PlayUITrans(gcmp, "up", nil, i * 0.05)
  local got, pass = item.got, item.pass
  ChangeUIController(child, "c1", got and 2 or pass and 1 or 0)
  local get = child:GetChild("Get")
  if not got and pass then
    get.onClick:Set(function()
      TideDungeonService.GetTideDungeonRewardReq(stageId, function(msg)
        local info = TideDungeonData.GetTideDungeonInfo(curDungeonType)
        info.rewardedStages = msg.rewardedStages
        UIMgr:SendWindowMessage(WinResConfig.TideRewardWindow.name, WindowMsgEnum.TideRewardWindow.REFRESH_REWARD_LIST)
        RedDotMgr.UpdateNodeByWindowName(WinResConfig.TideWindow.name)
      end)
    end)
  else
    get.onClick:Clear()
  end
  UIUtil.SetText(child, titleText, "WordTxt")
  UIUtil.SetText(child:GetChild("Progress"), progressText, "WordTxt")
  UIUtil.SetText(get, getText, "WordTxt")
end
local RefreshRewards = function(dungeonType)
  curDungeonType = dungeonType
  local info = TideDungeonData.GetTideDungeonInfo(dungeonType)
  local rewardedStages = info.rewardedStages
  local chapterConf = TableData.GetConfig(info.currentChapter, "BaseChapter")
  local conf = TableData.GetConfig(info.currentChapter, "BaseChapter")
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(conf.reward_back_ground)
  rewardItems = rewardItems or {}
  table.clear(rewardItems)
  local stages = chapterConf.stages
  local cleared = 0 == info.currentStage
  local latestIndex = table.keyof(stages, info.currentStage)
  for i, v in ipairs(stages) do
    local index = table.keyof(stages, v)
    local exists = table.keyof(rewardedStages, v)
    table.insert(rewardItems, {
      stageId = v,
      got = exists,
      pass = cleared or latestIndex > index
    })
  end
  table.sort(rewardItems, function(x, y)
    if x.got ~= y.got then
      return not x.got
    end
    return x.stageId < y.stageId
  end)
  local list = uis.Main.RewardTipsList.RewardTipsList
  list.numItems = #rewardItems
end
local TabItemRenderer = function(i, gcmp)
  local dungeonType = TAB_DUNGEON_TYPE[i]
  local info = TideDungeonData.GetTideDungeonInfo(dungeonType)
  local conf = TableData.GetConfig(info.currentChapter, "BaseChapter")
  UIUtil.SetBtnText(gcmp, conf.name())
  gcmp.onClick:Set(function()
    RefreshRewards(dungeonType)
  end)
end
local RefreshTablist = function(selectedIndex)
  ChangeUIController(uis.Main.root, "c1", selectedIndex - 1)
  RefreshRewards(TAB_DUNGEON_TYPE[selectedIndex])
end

function TideRewardWindow.ReInitData()
end

function TideRewardWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.TideRewardWindow.package, WinResConfig.TideRewardWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetTideDungeon_TideRewardWindowUis(contentPane)
    curDungeonType = bridgeObj.argTable[1]
    TideRewardWindow.UpdateInfo()
    TideRewardWindow.InitBtn()
  end)
end

function TideRewardWindow.UpdateInfo()
  ForeachTabBtns(TabItemRenderer)
  local list = uis.Main.RewardTipsList.RewardTipsList
  list.itemRenderer = RewardItemRenderer
  RefreshTablist(table.keyof(TAB_DUNGEON_TYPE, curDungeonType))
  local descText = T(20325)
  local titleText = T(20324)
  uis.Main.RewardTitle.WordTxt.text = descText
  uis.Main.RewardTitle.TitleTxt.text = titleText
  ForeachTabBtns(function(i, btn)
    RedDotMgr.AddNode({
      windowName = WinResConfig.TideRewardWindow.name,
      com = btn,
      visibleFunc = function()
        return RedDotAbyss.TideDungeonHasAnyRewardsByType(TAB_DUNGEON_TYPE[i])
      end,
      dataType = RED_DOT_DATA_TYPE.ABYSS
    })
  end)
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.TideRewardWindow.name)
end

function TideRewardWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.TideRewardWindow.name)
  end)
end

function TideRewardWindow.OnClose()
  uis = nil
  contentPane = nil
  RedDotMgr.RemoveNode(WinResConfig.TideRewardWindow.name)
end

function TideRewardWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.TideRewardWindow.REFRESH_REWARD_LIST then
    RefreshRewards(curDungeonType)
    RedDotMgr.UpdateNodeByWindowName(WinResConfig.TideRewardWindow.name)
  end
end

return TideRewardWindow
