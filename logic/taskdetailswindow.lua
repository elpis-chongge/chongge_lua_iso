require("InitialCarnival_TaskDetailsWindowByName")
local TaskDetailsWindow = {}
local uis, contentPane, arg, taskData

function TaskDetailsWindow.ReInitData()
end

function TaskDetailsWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.TaskDetailsWindow.package, WinResConfig.TaskDetailsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetInitialCarnival_TaskDetailsWindowUis(contentPane)
    arg = bridgeObj.argTable[1]
    TaskDetailsWindow.UpdateInfo()
    TaskDetailsWindow.InitBtn()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.REWARD_TIPS_ON)
  end)
end

function TaskDetailsWindow.UpdateInfo()
  local tips = uis.Main.TaskDetailsTips
  if arg.task then
    taskData = TableData.GetConfig(arg.task.taskId, "BaseTask")
    tips.WordTxt.text = taskData.name()
    tips.NameTxt.text = T(1169)
    tips.Time.TimeTxt.text = T(1170, arg.day)
    if arg.task.value >= taskData.task_parameter[1] then
      tips.Progress.WordTxt.text = T(1178, taskData.task_parameter[1], taskData.task_parameter[1])
    else
      tips.Progress.WordTxt.text = T(1171, arg.task.value, taskData.task_parameter[1])
    end
    tips.RewardNameTxt.text = T(1172)
    UIUtil.SetText(tips.GoToBtn, T(1173))
    UIUtil.SetText(tips.GetBtn, T(1174))
    tips.Complete.WordTxt.text = T(1175)
    local arr = GetConfigItemList(taskData.reward, true)
    
    function tips.ItemList.itemRenderer(i, item)
      UIUtil.ShowItemFrame(arr[i + 1].id, item, arr[i + 1].value, nil, function()
        UIUtil.CommonItemClickCallback(arr[i + 1].id, arr[i + 1].type)
      end)
    end
    
    tips.ItemList.numItems = #arr
    if arg.task.state == ProtoEnum.TASK_STATE.FINISHED then
      ChangeController(tips.c1Ctr, 1)
    elseif arg.task.state == ProtoEnum.TASK_STATE.REWARD then
      ChangeController(tips.c1Ctr, 2)
    else
      ChangeController(tips.c1Ctr, 0)
    end
    tips.GetBtn.onClick:Set(function()
      if arg.task.state == ProtoEnum.TASK_STATE.FINISHED then
        CarnivalService.CarnivalGetRewardReq(nil, arg.task.uid, function()
          TaskDetailsWindow.CloseWindow()
        end)
      end
    end)
    if taskData.go_to_id then
      local featureData = TableData.GetConfig(taskData.go_to_id, "BaseFeature")
      CurrencyReturnWindow.SetJumpFun(tips.GoToBtn, featureData, nil, nil, nil, nil, function()
        TaskDetailsWindow.CloseWindow()
      end)
    end
  end
end

function TaskDetailsWindow.CloseWindow()
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.REWARD_TIPS_OFF)
  UIMgr:CloseWindow(WinResConfig.TaskDetailsWindow.name)
end

function TaskDetailsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(TaskDetailsWindow.CloseWindow)
end

function TaskDetailsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return TaskDetailsWindow
