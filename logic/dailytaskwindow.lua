require("DailyTask_DailyTaskByName")
DailyTaskWindow = {}
local dailyTask, firstEnter
local delayTime = 0.08
local MAIN_TAB_ENUM = {TASK = 0, REWARD = 1}
local curSelectMainTabIndex

function DailyTaskWindow.OnInit(com)
  dailyTask = GetDailyTask_DailyTaskUis(com)
  firstEnter = true
  DailyTaskWindow.LoadBgTexture()
  DailyTaskWindow.Init()
  DailyTaskWindow.InitText()
  DailyTaskWindow.InitBtn()
  DailyTaskWindow.InitRedDot()
  DailyTaskWindow.InitTabRegion()
end

function DailyTaskWindow.UpdateTabContent()
end

function DailyTaskWindow.InitRedDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.CarnivalWindow.name,
    com = dailyTask.DailyRegion.DayReward.DayRewardBtn,
    visibleFunc = function()
      return RedDotTask.CanDailyTarget()
    end,
    dataType = RED_DOT_DATA_TYPE.TASK
  })
end

function DailyTaskWindow.LoadBgTexture()
  dailyTask.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.DAILY_TASK)
end

function DailyTaskWindow.Init()
end

function DailyTaskWindow.InitTabRegion()
  local tabRegion = dailyTask.TabRegion
  local tabList = tabRegion.TabList
  local tabInfo = {
    {
      c1Index = 0,
      type = MAIN_TAB_ENUM.TASK,
      callback = function()
        dailyTask.c1Ctr.selectedIndex = 0
      end,
      redVisibleFunc = function()
        return DailyTaskData.CanDailyTask() or RedDotTask.CanDailyTarget()
      end,
      isDefault = true
    },
    {
      c1Index = 1,
      type = MAIN_TAB_ENUM.REWARD,
      callback = function()
        dailyTask.c1Ctr.selectedIndex = 1
      end,
      redVisibleFunc = function()
        return RedDotTask.CanGrowTarget()
      end,
      newFlagVisibleFunc = function()
        local maxId = DailyTaskData.GetMaxPhaseId()
        local value = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.TASK_GROW_REWARD_PHASE, PLAYER_PREF_DEFAULT_VALUE.TASK_GROW_REWARD_PHASE)
        return maxId ~= value and value ~= PLAYER_PREF_DEFAULT_VALUE.TASK_GROW_REWARD_PHASE
      end
    }
  }
  for i, v in ipairs(tabInfo) do
    local tab = tabList:AddItemFromPool()
    ChangeUIController(tab, "c1", v.c1Index)
    tab.onClick:Add(function()
      if curSelectMainTabIndex ~= v.type then
        curSelectMainTabIndex = v.type
        v.callback()
      end
      if v.newFlagVisibleFunc then
        local maxId = DailyTaskData.GetMaxPhaseId()
        PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.TASK_GROW_REWARD_PHASE, maxId)
        RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.TASK)
      end
    end)
    if nil == curSelectMainTabIndex and v.isDefault then
      tab.onClick:Call()
    end
    RedDotMgr.AddNode({
      windowName = WinResConfig.CarnivalWindow.name,
      com = tab,
      visibleFunc = v.redVisibleFunc,
      newFlagVisibleFunc = v.newFlagVisibleFunc,
      dataType = RED_DOT_DATA_TYPE.TASK
    })
  end
end

function DailyTaskWindow.UpdateAll(dataParam)
  DailyTaskWindow.UpdateInfo(dataParam)
  DailyTaskWindow.UpdateTaskShow()
  DailyTaskWindow.UpdateAllGrowReward()
  DailyTaskWindow.UpdateDailyReward()
end

function DailyTaskWindow.InitText()
end

function DailyTaskWindow.InitBtn()
end

function DailyTaskWindow.UpdateTaskShow()
  local taskShow = dailyTask.AllRewardRegion.TaskShow
  local config, isReached, isGot = DailyTaskData.GetGrowShow()
  taskShow.PicLoader.url = UIUtil.GetResUrl(config.phase_show)
  local phaseShowInfo = Split(config.phase_show_id, ":")
  local itemType = tonumber(phaseShowInfo[1])
  local itemId = tonumber(phaseShowInfo[2])
  local itemConfig = TableData.GetConfigByType(itemType, itemId)
  taskShow.NameTxt.text = itemConfig.name()
  if itemConfig.name_english then
    taskShow.SubtitleTxt.text = itemConfig.name_english()
  else
    taskShow.SubtitleTxt.text = ""
  end
  taskShow.LookBtn.onClick:Set(function()
    UIUtil.CommonItemClickCallback(itemId, itemType)
  end)
end

function DailyTaskWindow.UpdateAllGrowReward()
  local allRewardRegion = dailyTask.AllRewardRegion
  local list = allRewardRegion.RewardList
  list:RemoveChildrenToPool()
  local rewardGroups = DailyTaskData.GetAllRewardGroupByPhase()
  local curGrowItem, curGrowItemId = DailyTaskData.GetGrowItem()
  local itemConfig = TableData.GetConfig(curGrowItemId, "BaseItem")
  local url = UIUtil.GetResUrl(itemConfig.icon)
  local haveInProgressGroup = false
  
  function list.itemRenderer(index, item)
    local tips = item:GetChild("AllRewardTips")
    tips.alpha = 0
    PlayUITrans(item, "up", nil, 0.08 * index)
    if nil == firstEnter then
      TimerUtil.setTimeout(index * 0.08, function()
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.TASK_LIST_IN)
      end)
    end
    local group = rewardGroups[index + 1]
    if nil == group then
      tips:GetChild("UnOpenTips"):GetChild("WordTxt").text = T(10908)
      ChangeUIController(tips, "c1", 3)
      return
    end
    ChangeUIController(tips, "c1", group.state)
    local titleTxt = tips:GetChild("TitleTxt")
    if group.state == REWARD_PHASE_STATE.INPROGRESS then
      list:ScrollToView(math.max(0, index - 2), false, true)
      haveInProgressGroup = true
    elseif group.state == REWARD_PHASE_STATE.COMPLETE then
      local completeTips = tips:GetChild("CompleteTips")
      UIUtil.SetBtnText(completeTips, T(10912), T(10913))
    elseif group.state == REWARD_PHASE_STATE.LOCK then
    end
    titleTxt.text = T(10909, index + 1)
    tips:GetChild("WordTxt").text = T(10921)
    tips:GetChild("NumberTxt").text = curGrowItem
    table.sort(group.rewards, function(a, b)
      return a.id < b.id
    end)
    local rewardList = tips:GetChild("RewardList")
    rewardList:RemoveChildrenToPool()
    local firstInProgressIndex
    
    function rewardList.itemRenderer(indexReward, itemReward)
      local taskConfig = group.rewards[indexReward + 1]
      local itemData = Split(taskConfig.reward[1], ":")
      local type = tonumber(itemData[1])
      local id = tonumber(itemData[2])
      local count = tonumber(itemData[3])
      UIUtil.ShowItemFrame(id, itemReward, count, nil)
      if group.state == REWARD_PHASE_STATE.INPROGRESS then
        itemReward:GetChild("PicLoader").url = url
        itemReward:GetChild("PicNumberTxt").text = taskConfig.unlock_points
      else
        itemReward:GetChild("PicLoader").url = nil
        itemReward:GetChild("PicNumberTxt").text = ""
      end
      if DailyTaskData.IsRewardGot(taskConfig.id, taskConfig.type) then
        if group.state == REWARD_PHASE_STATE.INPROGRESS then
          ChangeUIController(itemReward, "c2", 1)
        elseif group.state == REWARD_PHASE_STATE.COMPLETE then
          ChangeUIController(itemReward, "c2", 2)
        end
        itemReward.onClick:Set(function()
          UIUtil.CommonItemClickCallback(id, type)
        end)
      elseif group.state == REWARD_PHASE_STATE.INPROGRESS and curGrowItem >= taskConfig.unlock_points then
        if nil == firstInProgressIndex then
          firstInProgressIndex = indexReward
        end
        ChangeUIController(itemReward, "c2", 4)
        itemReward.onClick:Set(function()
          DailyTaskService.CommonTaskRewardReq(taskConfig.type, taskConfig.id)
        end)
      elseif group.state == REWARD_PHASE_STATE.LOCK then
        ChangeUIController(itemReward, "c2", 3)
        itemReward.onClick:Set(function()
          UIUtil.CommonItemClickCallback(id, type)
        end)
      else
        ChangeUIController(itemReward, "c2", 0)
        if nil == firstInProgressIndex and group.state == REWARD_PHASE_STATE.INPROGRESS then
          firstInProgressIndex = indexReward
        end
        itemReward.onClick:Set(function()
          UIUtil.CommonItemClickCallback(id, type)
        end)
      end
    end
    
    rewardList.numItems = #group.rewards
    if firstInProgressIndex then
      rewardList:ScrollToView(#group.rewards - 1)
      rewardList:ScrollToView(math.max(firstInProgressIndex - 4, 0))
    end
  end
  
  list.numItems = #rewardGroups + 1
  if false == haveInProgressGroup then
    list:ScrollToView(list.numItems - 1)
  end
end

function DailyTaskWindow.UpdateDailyReward()
  local curDailyItem = DailyTaskData.GetDailyItem()
  local dayReward = dailyTask.DailyRegion.DayReward
  dayReward.WordTxt.text = T(10922)
  local dailyRewardList = DailyTaskData.GetDailyReward()
  local maxPoint = dailyRewardList[#dailyRewardList].config.unlock_points
  dayReward.NumberTxt.text = T(10923, curDailyItem, maxPoint)
  local finishCount = 0
  local gotCount = 0
  local allCount = #dailyRewardList
  local taskType
  local progressBar = dayReward.ExpProgressBar
  for i, v in ipairs(dailyRewardList) do
    local numberHand = progressBar:GetChild("Number" .. i)
    if numberHand then
      local dropHand = progressBar:GetChild("Drop" .. i)
      numberHand:GetChild("NumberTxt").text = v.config.unlock_points
      if v.isGot then
        ChangeUIController(numberHand, "c1", 2)
        ChangeUIController(dropHand, "c1", 2)
        finishCount = finishCount + 1
        gotCount = gotCount + 1
      elseif curDailyItem >= v.config.unlock_points then
        ChangeUIController(numberHand, "c1", 1)
        ChangeUIController(dropHand, "c1", 1)
        finishCount = finishCount + 1
      else
        ChangeUIController(numberHand, "c1", 0)
        ChangeUIController(dropHand, "c1", 0)
      end
    end
    if nil == taskType then
      taskType = v.config.type
    end
  end
  ChangeUIController(progressBar, "c1", finishCount)
  if finishCount > 0 then
    progressBar.value = math.floor(100 * (finishCount - 1) / (allCount - 1))
  else
    progressBar.value = 0
  end
  local dayRewardBtn = dayReward.DayRewardBtn
  if allCount <= gotCount then
    ChangeUIController(dayRewardBtn, "c1", 2)
    UIUtil.SetBtnText(dayRewardBtn, T(10926))
    dayRewardBtn.onClick:Set(function()
      OpenWindow(WinResConfig.DailyRewardListWindow.name)
    end)
  elseif finishCount > 0 and gotCount < finishCount then
    ChangeUIController(dayRewardBtn, "c1", 1)
    UIUtil.SetBtnText(dayRewardBtn, T(10925))
    dayRewardBtn.onClick:Set(function()
      DailyTaskService.CommonTaskRewardReq(taskType, 0)
    end)
  else
    ChangeUIController(dayRewardBtn, "c1", 0)
    UIUtil.SetBtnText(dayRewardBtn, T(10924))
    dayRewardBtn.onClick:Set(function()
      OpenWindow(WinResConfig.DailyRewardListWindow.name)
    end)
  end
  local touchBtn = dayReward.TouchBtn
  touchBtn.onClick:Set(function()
    OpenWindow(WinResConfig.DailyRewardListWindow.name)
  end)
end

function DailyTaskWindow.UpdateInfo(replaceTaskIndex)
  DailyTaskWindow.UpdateDaily(replaceTaskIndex)
end

function DailyTaskWindow.UpdateDaily(replaceTaskIndex)
  UIMgr:SendWindowMessage(WinResConfig.CarnivalWindow.name, WindowMsgEnum.CarnivalWindow.UPDATE_PARAM_2)
  local dataList = DailyTaskData.GetTaskList()
  local list = dailyTask.DailyRegion.DailyList
  list:RemoveChildrenToPool()
  list.touchable = true
  
  function list.itemRenderer(index, item)
    local tips = item:GetChild("DailyTips")
    local data = dataList[index + 1]
    item.gameObjectName = data.task.taskId
    item.name = data.task.taskId
    if replaceTaskIndex and table.contain(replaceTaskIndex, data.index) then
      list.touchable = false
      PlayUITrans(item, "Switch", function()
        list.touchable = true
      end):SetHook("Switch", function()
        DailyTaskWindow.UpdateOneTask(item, tips, data, replaceTaskIndex)
      end)
    else
      DailyTaskWindow.UpdateOneTask(item, tips, data, replaceTaskIndex)
    end
  end
  
  list.numItems = #dataList
end

function DailyTaskWindow.UpdateOneTask(item, tips, data, replaceTaskIndex)
  local task = data.task
  local taskId = task.taskId
  local config = TableData.GetConfig(taskId, "BaseTask")
  tips:GetChild("NameTxt").text = config.name()
  UIUtil.SetText(tips, T(1006), "Submit1Txt")
  local str = task.value >= config.task_parameter[1] and T(10906, task.value, config.task_parameter[1]) or T(898, task.value, config.task_parameter[1])
  tips:GetChild("NumberTxt").text = str
  local rewards = DailyTaskData.GetTaskCommonReward(data.index)
  if rewards then
    for i, v in ipairs(rewards) do
      local rewardItem = tips:GetChild("RewardItem" .. i)
      if rewardItem then
        UIUtil.ShowItemFrame(v.id, rewardItem, v.count, nil, function()
          UIUtil.CommonItemClickCallback(v.id, v.type)
        end)
      end
    end
  end
  ChangeUIController(tips, "c1", task.state)
  if task.state == ProtoEnum.TASK_STATE.NORMAL then
    local gotoId = config.go_to_id
    local gotoBtn = tips:GetChild("GoToBtn")
    if gotoId then
      local featureData = TableData.GetConfig(gotoId, "BaseFeature")
      gotoBtn.visible = true
      CurrencyReturnWindow.SetJumpFun(gotoBtn, featureData)
    else
      gotoBtn.visible = false
    end
  end
  local refreshBtn = tips:GetChild("RefreshBtn")
  refreshBtn.soundFmod = SOUND_EVENT_ENUM.TASK_REFRESH
  refreshBtn.onClick:Set(function()
    DailyTaskService.CommonTaskReplaceReq(data.index)
  end)
  local submitBtn = tips:GetChild("SubmitBtn")
  submitBtn.onClick:Set(function()
    DailyTaskService.CommonTaskRewardReq(0, data.index)
  end)
end

function DailyTaskWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_DAILY_TASK_UPDATE then
    DailyTaskWindow.UpdateAll(para)
    RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.TASK)
    firstEnter = nil
  elseif msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    DailyTaskService.GetCommonTaskInfoReq(function()
      FloatTipsUtil.ShowWarnTips(T(1058))
    end)
  end
end

function DailyTaskWindow.OnClose()
  firstEnter = nil
  dailyTask = nil
  curSelectMainTabIndex = nil
end

return DailyTaskWindow
