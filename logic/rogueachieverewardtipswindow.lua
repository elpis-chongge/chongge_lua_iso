require("RogueBuild01_AchieveRewardTipsWindowByName")
local RogueAchieveRewardTipsWindow = {}
local uis, contentPane, chapterData, allStory

function RogueAchieveRewardTipsWindow.ReInitData()
end

function RogueAchieveRewardTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueAchieveRewardTipsWindow.package, WinResConfig.RogueAchieveRewardTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_AchieveRewardTipsWindowUis(contentPane)
    local chapterId = bridgeObj.argTable[1]
    chapterData = TableData.GetConfig(chapterId, "BaseRogueTrendsChapter")
    RogueAchieveRewardTipsWindow.UpdateInfo()
    RogueAchieveRewardTipsWindow.InitBtn()
  end)
end

function RogueAchieveRewardTipsWindow.UpdateInfo(index)
  local tips = uis.Main.Tips
  tips.TabList.selectedIndex = -1
  local initIndex, rewardIndex, normalIndex
  
  function tips.TabList.itemRenderer(i, item)
    local data = TableData.GetConfig(chapterData.trends_id[i + 1], "BaseRogueTrends")
    if data then
      local tabItem = item:GetChild("Tab")
      UIUtil.SetText(tabItem, data.name(), "NameTxt")
      local info = RogueData.GetRogueTrendById(data.id)
      local lock = false
      if info then
        if info.unlocked and info.taskInfo then
          if info.taskInfo.state == ProtoEnum.TASK_STATE.REWARD then
            ChangeUIController(tabItem, "c1", 2)
            if nil == rewardIndex then
              rewardIndex = i
            end
          elseif info.taskInfo.state == ProtoEnum.TASK_STATE.FINISHED then
            ChangeUIController(tabItem, "c1", 1)
            if nil == initIndex then
              initIndex = i
            end
          elseif info.taskInfo.state == ProtoEnum.TASK_STATE.NORMAL then
            ChangeUIController(tabItem, "c1", 0)
            if nil == normalIndex then
              normalIndex = i
            end
          end
          lock = true
        else
          ChangeUIController(tabItem, "c1", 3)
          UIUtil.SetText(tabItem:GetChild("Lock"), data.task_condition and data.task_condition() or "", "TimeTxt")
        end
      end
      
      function item.testEnableOnClick()
        if false == lock then
          FloatTipsUtil.ShowWarnTips(T(1489))
        end
        return lock
      end
      
      item.onClick:Set(function()
        if tips.TabList.selectedIndex ~= i then
          RogueAchieveRewardTipsWindow.ShowTaskInfo(data, i)
          tips.TabList.selectedIndex = i
        end
      end)
    end
  end
  
  tips.TabList.numItems = #chapterData.trends_id
  if tips.TabList.numItems > 0 then
    if index then
      tips.TabList:GetChildAt(index).onClick:Call()
      return
    end
    if initIndex then
      tips.TabList:GetChildAt(initIndex).onClick:Call()
      return
    end
    if normalIndex then
      tips.TabList:GetChildAt(normalIndex).onClick:Call()
      return
    end
    if rewardIndex then
      tips.TabList:GetChildAt(rewardIndex).onClick:Call()
      return
    end
  end
end

function RogueAchieveRewardTipsWindow.ShowTaskInfo(data, index)
  allStory = {}
  local tips = uis.Main.Tips
  tips.TitleTxt.text = data.name()
  
  function tips.WordList.itemRenderer(i, word)
    UIUtil.SetText(word, data.des())
  end
  
  tips.WordList.numItems = 1
  local taskRoot = tips.Task
  local taskData = TableData.GetConfig(data.task_id, "BaseTask")
  if taskData then
    taskRoot.WordTxt.text = taskData.name and taskData.name() or ""
    local info = RogueData.GetRogueTrendById(data.id)
    if info and info.taskInfo then
      local barValue = math.min(info.taskInfo.value, taskData.task_parameter[1])
      taskRoot.Progress.WordTxt.text = T(1381, barValue, taskData.task_parameter[1])
      local getBol = false
      if info.unlocked and info.taskInfo then
        if info.taskInfo.state == ProtoEnum.TASK_STATE.REWARD then
          ChangeController(taskRoot.c1Ctr, 2)
          getBol = true
        elseif info.taskInfo.state == ProtoEnum.TASK_STATE.FINISHED then
          ChangeController(taskRoot.c1Ctr, 1)
        elseif info.taskInfo.state == ProtoEnum.TASK_STATE.NORMAL then
          ChangeController(taskRoot.c1Ctr, 0)
        end
      else
        ChangeController(taskRoot.c1Ctr, 3)
      end
      local arr = GetConfigItemList(taskData.reward, true)
      
      function taskRoot.ItemList.itemRenderer(i, item)
        local num = arr[1 + i].value
        UIUtil.ShowItemFrame(arr[1 + i].id, item, num, nil, function()
          UIUtil.CommonItemClickCallback(arr[1 + i].id, arr[1 + i].type)
        end)
        ChangeUIController(item, "Get", getBol and 1 or 0)
      end
      
      taskRoot.ItemList.numItems = #arr
      taskRoot.GetBtn.onClick:Set(function()
        RogueService.FetchRogueTrendTaskRewardReq(data.id, info.taskInfo.taskId, function()
          if uis then
            RogueAchieveRewardTipsWindow.UpdateInfo(index)
          end
        end)
      end)
    end
  end
  taskRoot.GetWord.GetTxt.text = T(1382)
  local sotyData = TableData.GetConfig(data.dialog_id, "BaseStorySimple")
  if sotyData then
    table.insert(allStory, sotyData)
    RogueAchieveRewardTipsWindow.GetAllStorySimple(sotyData)
    
    function tips.LetterRegion.ChatList.itemRenderer(i, item)
      local index = i + 1
      UIUtil.SetText(item, allStory[index].role_name and allStory[index].role_name() or "", "NameTxt")
      UIUtil.SetText(item, allStory[index].remark and allStory[index].remark() or "", "WordTxt")
      local head = item:GetChild("Head")
      if allStory[index].role_head then
        head:GetChild("Bg"):GetChild("PicLoader").url = UIUtil.GetResUrl(allStory[index].role_head)
        head.visible = true
      else
        head.visible = false
      end
    end
    
    tips.LetterRegion.ChatList.numItems = #allStory
    tips.LetterRegion.ChatList.scrollPane:ScrollTop()
  else
    tips.LetterRegion.ChatList.numItems = 0
  end
end

function RogueAchieveRewardTipsWindow.GetAllStorySimple(sotyData)
  if sotyData and sotyData.next then
    local sotyData = TableData.GetConfig(sotyData.next, "BaseStorySimple")
    if sotyData then
      table.insert(allStory, sotyData)
      RogueAchieveRewardTipsWindow.GetAllStorySimple(sotyData)
    end
  end
end

function RogueAchieveRewardTipsWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RogueAchieveRewardTipsWindow.name)
  end)
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RogueAchieveRewardTipsWindow.name)
  end)
end

function RogueAchieveRewardTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  chapterData = nil
  allStory = nil
end

return RogueAchieveRewardTipsWindow
