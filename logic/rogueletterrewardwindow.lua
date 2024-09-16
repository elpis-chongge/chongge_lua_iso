require("RogueBuild01_LetterRewardWindowByName")
local RogueLetterRewardWindow = {}
local uis, contentPane, jumpTb, letterData, allTrends

function RogueLetterRewardWindow.ReInitData()
end

function RogueLetterRewardWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueLetterRewardWindow.package, WinResConfig.RogueLetterRewardWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_LetterRewardWindowUis(contentPane)
    local groupId = bridgeObj.argTable[1]
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.ROGUE_TASK)
    local trends = RogueData.GetRogueTrend()
    letterData = RogueLetterRewardWindow.GetChapterData(groupId)
    RogueLetterRewardWindow.InitBtn()
    RogueLetterRewardWindow.InitRedDot()
  end)
end

function RogueLetterRewardWindow.InitRedDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.RogueLetterRewardWindow.name,
    com = uis.Main.TabRegion.Tab2Btn,
    visibleFunc = function()
      return RedDotRogue.CanTrendTaskReward()
    end,
    dataType = RED_DOT_DATA_TYPE.ROGUE
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.RogueLetterRewardWindow.name,
    com = uis.Main.TabRegion.Tab1Btn,
    visibleFunc = function()
      return RedDotRogue.CanWeekIntegralReward() or RedDotRogue.CanWeekTaskReward()
    end,
    dataType = RED_DOT_DATA_TYPE.ROGUE
  })
end

function RogueLetterRewardWindow.UpdateWeekTask()
  local taskTips = uis.Main.DayReward
  taskTips.Number.WordTxt.text = T(1376)
  taskTips.Number.NumberTxt.text = TimeUtil.FormatEnTime(RogueData.taskRefreshStamp - LoginData.GetCurServerTime())
  local integralId = TableData.GetConfig(70010039, "BaseFixed").int_value
  local taskList = RogueData.GetWeekTask()
  
  function taskTips.ContentList.itemRenderer(i, item)
    local taskInfo = taskList[i + 1]
    if taskInfo then
      local taskData = TableData.GetConfig(taskInfo.taskId, "BaseTask")
      local taskCom = item:GetChild("DayRewardTips")
      local barValue = math.min(taskInfo.value, taskData.task_parameter[1])
      UIUtil.SetText(taskCom, taskData.name(), "WordTxt")
      local integral = taskCom:GetChild("Integral")
      local arr = GetConfigItemList(taskData.reward, true)
      if arr[1] then
        UIUtil.SetText(integral, arr[1].value, "NumberTxt")
      end
      if taskInfo.state == ProtoEnum.TASK_STATE.FINISHED then
        ChangeUIController(taskCom, "c1", 1)
        UIUtil.SetText(taskCom, T(1385), "TipsTxt")
        taskCom.onClick:Set(function()
          RogueService.CycleTaskRewardReq(taskInfo.taskId, 0, function()
            if uis then
              ChangeUIController(taskCom, "c1", 2)
              taskInfo.state = ProtoEnum.TASK_STATE.REWARD
              UIUtil.SetText(taskCom, T(1383), "TipsTxt")
              taskCom.onClick:Clear()
              if integralId then
                RogueLetterRewardWindow.UpdateWeekReward(integralId)
              end
            end
          end)
        end)
        UIUtil.SetText(taskCom, T(1477, barValue, taskData.task_parameter[1]), "NumberTxt")
      elseif taskInfo.state == ProtoEnum.TASK_STATE.REWARD then
        ChangeUIController(taskCom, "c1", 2)
        UIUtil.SetText(taskCom, T(1383), "TipsTxt")
        taskCom.onClick:Clear()
        UIUtil.SetText(taskCom, T(1477, barValue, taskData.task_parameter[1]), "NumberTxt")
      elseif taskInfo.state == ProtoEnum.TASK_STATE.NORMAL then
        if taskData.go_to_id then
          UIUtil.SetText(taskCom, T(1173), "TipsTxt")
          taskCom.onClick:Set(function()
            local featureData = TableData.GetConfig(taskData.go_to_id, "BaseFeature")
            CurrencyReturnWindow.SetJumpFun(taskCom, featureData)
          end)
        else
          UIUtil.SetText(taskCom, T(1384), "TipsTxt")
          taskCom.onClick:Clear()
        end
        ChangeUIController(taskCom, "c1", 0)
        UIUtil.SetText(taskCom, T(1377, barValue, taskData.task_parameter[1]), "NumberTxt")
      end
      taskCom.alpha = 0
      PlayUITrans(item, "up", nil, 0.05 * i)
    end
  end
  
  taskTips.ContentList.numItems = #taskList
  if integralId then
    RogueLetterRewardWindow.UpdateWeekReward(integralId)
  end
end

function RogueLetterRewardWindow.UpdateWeekReward(integralId)
  local taskTips = uis.Main.DayReward
  local integral = ActorData.GetItemCount(integralId)
  taskTips.Progress.NumberTxt.text = integral
  taskTips.Progress.WordTxt.text = T(1375)
  local targetData = RogueMgr.GetWeekTarget()
  local weekReward = RogueData.GetWeekReward()
  local tempBtn
  
  function taskTips.Progress.ItemList.itemRenderer(i, integralItem)
    local data = targetData[i + 1]
    UIUtil.SetText(integralItem, data.unlock_points, "NumberTxt")
    local state = 0
    if integral >= data.unlock_points then
      if table.contain(weekReward, data.id) then
        state = 2
        ChangeUIController(integralItem, "c1", 2)
      else
        state = 1
        ChangeUIController(integralItem, "c1", 1)
        UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Rugel/FX_ui_rogue_progressitemget.prefab", integralItem:GetChild("EffectHolder"))
      end
    else
      ChangeUIController(integralItem, "c1", 0)
    end
    local itemLook = integralItem:GetChild("ItemLook")
    local itemList = itemLook:GetChild("ItemList")
    local arr = GetConfigItemList(data.reward, true)
    
    function itemList.itemRenderer(i, item)
      UIUtil.ShowItemFrame(arr[1 + i].id, item, arr[1 + i].value, nil, function()
        UIUtil.CommonItemClickCallback(arr[1 + i].id, arr[1 + i].type)
      end)
    end
    
    itemList.numItems = #arr
    itemList:ResizeToFit()
    integralItem:GetChild("TouchBtn").onClick:Set(function()
      if 1 == state then
        RogueService.CycleTaskRewardReq(data.id, 4, function()
          if uis then
            state = 2
            ChangeUIController(integralItem, "c1", 2)
            ChangeController(taskTips.Progress.c1Ctr, RogueLetterRewardWindow.CheckWeekReward(targetData, integralId) and 1 or 0)
          end
        end)
      else
        if tempBtn and integralItem == tempBtn then
          return
        end
        ChangeUIController(tempBtn, "c2", 0)
        ChangeUIController(integralItem, "c2", 1)
        ChangeController(taskTips.Progress.c2Ctr, 1)
        tempBtn = integralItem
      end
    end)
  end
  
  taskTips.Progress.ItemList.numItems = #targetData
  taskTips.Progress.CloseBtn.onClick:Set(function()
    ChangeController(taskTips.Progress.c2Ctr, 0)
    ChangeUIController(tempBtn, "c2", 0)
    tempBtn = nil
  end)
  ChangeController(taskTips.Progress.c1Ctr, RogueLetterRewardWindow.CheckWeekReward(targetData, integralId) and 1 or 0)
end

function RogueLetterRewardWindow.CheckWeekReward(targetData, integralId)
  local weekReward = RogueData.GetWeekReward()
  local integral = ActorData.GetItemCount(integralId)
  for i, v in pairs(targetData) do
    if integral >= v.unlock_points and not table.contain(weekReward, v.id) then
      return true
    end
  end
  return false
end

function RogueLetterRewardWindow.UpdateUpTask()
  local tips = uis.Main.AchieveReward
  
  function tips.ContentList.itemRenderer(i, item)
    local data = letterData[i + 1]
    local content = item:GetChild("Content")
    UIUtil.SetText(content, data.name(), "NameTxt")
    UIUtil.SetText(content:GetChild("New"), T(1379), "WordTxt")
    content:GetChild("PicLoader").url = UIUtil.GetResUrl(data.icon)
    local info = RogueLetterRewardWindow.GetUnlock(data.trends_id)
    local preLock = RogueLetterRewardWindow.CanPreChapterUnlock(data.pre)
    if info.lock and preLock then
      if info.reward then
        ChangeUIController(content, "c1", 2)
      else
        ChangeUIController(content, "c1", 1)
      end
      ChangeUIController(content, "c3", info.canReward and 1 or 0)
      UIUtil.SetText(content:GetChild("Progress"), T(1380, info.canNum, #data.trends_id), "NumberTxt")
      item.onClick:Set(function()
        OpenWindow(WinResConfig.RogueAchieveRewardTipsWindow.name, nil, data.id)
      end)
      UIUtil.SetText(content, data.des(), "WordTxt")
    else
      ChangeUIController(content, "c1", 0)
      if false == preLock then
        UIUtil.SetText(content:GetChild("Lock"), data.trends_condition and data.trends_condition() or "", "TimeTxt")
      elseif info.minStamp then
        UIUtil.SetText(content:GetChild("Lock"), TimeUtil.FormatEnTime(info.minStamp - LoginData.GetCurServerTime()), "TimeTxt")
      end
      UIUtil.SetText(content, T(1478), "WordTxt")
      item.onClick:Set(function()
        FloatTipsUtil.ShowWarnTips(T(1478))
      end)
    end
  end
  
  tips.ContentList.numItems = #letterData
end

function RogueLetterRewardWindow.CanPreChapterUnlock(pre)
  local data = TableData.GetConfig(pre, "BaseRogueTrendsChapter")
  if data then
    local info
    for i, v in pairs(data.trends_id) do
      info = RogueData.GetRogueTrendById(v)
      if info.unlocked == false then
        return false
      elseif info.unlocked and info.taskInfo and info.taskInfo.state == ProtoEnum.TASK_STATE.NORMAL then
        return false
      end
    end
  end
  return true
end

function RogueLetterRewardWindow.GetUnlock(trendsId)
  local info, minStamp
  local lock = false
  local reward = true
  local canNum = 0
  local canReward = false
  for i, v in pairs(trendsId) do
    info = RogueData.GetRogueTrendById(v)
    if info then
      if info.unlocked and info.taskInfo then
        lock = true
        if info.taskInfo.state ~= ProtoEnum.TASK_STATE.REWARD then
          reward = false
        end
        if info.taskInfo.state == ProtoEnum.TASK_STATE.FINISHED or info.taskInfo.state == ProtoEnum.TASK_STATE.REWARD then
          canNum = canNum + 1
        end
        if info.taskInfo.state == ProtoEnum.TASK_STATE.FINISHED then
          canReward = true
        end
      else
        if nil == minStamp or minStamp > info.unlockStamp then
          minStamp = info.unlockStamp
        end
        reward = false
      end
    end
  end
  return {
    minStamp = minStamp,
    lock = lock,
    reward = reward,
    canNum = canNum,
    canReward = canReward
  }
end

function RogueLetterRewardWindow.CanTaskReWard(taskInfos)
  for i, v in pairs(taskInfos) do
    if v.state ~= ProtoEnum.TASK_STATE.FINISHED then
      return false
    end
  end
  return true
end

function RogueLetterRewardWindow.GetChapterData(groupId)
  local data = TableData.GetTable("BaseRogueTrendsChapter")
  local newTb = {}
  for i, v in pairs(data) do
    if v.group_id == groupId then
      table.insert(newTb, v)
    end
  end
  table.sort(newTb, function(a, b)
    return a.sort < b.sort
  end)
  return newTb
end

function RogueLetterRewardWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.RogueLetterRewardWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.ROGUE_TASK)
  uis.Main.TabRegion.Tab2Btn.onClick:Set(function()
    if 1 == uis.Main.c1Ctr.selectedIndex then
      return
    end
    RogueLetterRewardWindow.UpdateUpTask()
    ChangeController(uis.Main.c1Ctr, 1)
  end)
  uis.Main.TabRegion.Tab1Btn.onClick:Set(function()
    if 0 == uis.Main.c1Ctr.selectedIndex then
      return
    end
    RogueLetterRewardWindow.UpdateWeekTask()
    ChangeController(uis.Main.c1Ctr, 0)
  end)
  RogueLetterRewardWindow.UpdateWeekTask()
  ChangeController(uis.Main.c1Ctr, 0)
end

function RogueLetterRewardWindow.OnShown()
  if uis and 1 == uis.Main.c1Ctr.selectedIndex then
    RogueLetterRewardWindow.UpdateUpTask()
  end
end

function RogueLetterRewardWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.RogueLetterRewardWindow.name)
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  letterData = nil
  allTrends = nil
end

function RogueLetterRewardWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    RogueService.GetRogueTrendsReq(function()
      if uis then
        RogueLetterRewardWindow.UpdateUpTask()
      end
    end)
  end
end

return RogueLetterRewardWindow
