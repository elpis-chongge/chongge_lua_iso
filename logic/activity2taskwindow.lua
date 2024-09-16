require("ActivityDungeon1001_TaskWindowByName")
local Activity2TaskWindow = {}
local uis, contentPane

function Activity2TaskWindow.ReInitData()
end

function Activity2TaskWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity2TaskWindow.package, WinResConfig.Activity2TaskWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1001_TaskWindowUis(contentPane)
    Activity2TaskWindow.UpdateInfo()
    Activity2TaskWindow.InitBtn()
    local data = ActivityDungeonData.GetActivityData()
    if data then
      uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(data.bg_task)
    end
  end)
end

function Activity2TaskWindow.UpdateInfo(notPlayAnim)
  local title = uis.Main.TaskTitle
  local activityInfo = ActivityDungeonData.GetActivityInfo()
  if activityInfo then
    local list = uis.Main.TaskTipsList
    local taskList = Activity2TaskWindow.SortTask(activityInfo.taskList)
    
    function list.itemRenderer(i, item)
      local info = taskList[i + 1]
      local taskData = TableData.GetConfig(info.taskId, "BaseTask")
      if taskData then
        local taskTips = item:GetChild("TaskTips")
        UIUtil.SetText(taskTips, taskData.name and taskData.name() or "", "NameTxt")
        local barValue = math.min(info.value, taskData.task_parameter[1])
        if info.state == ProtoEnum.TASK_STATE.FINISHED then
          UIUtil.SetText(taskTips:GetChild("TaskProgress"), T(1526, barValue, taskData.task_parameter[1]), "Number2Txt")
          ChangeUIController(taskTips, "c1", 1)
          taskTips:GetChild("GetBtn").onClick:Set(function()
            ActivityDungeonService.ActivityStageTaskRewardReq(activityInfo.baseInfo.activityId, info.uid, function()
              if uis then
                Activity2TaskWindow.UpdateInfo()
              end
            end)
          end)
        elseif info.state == ProtoEnum.TASK_STATE.NORMAL then
          UIUtil.SetText(taskTips:GetChild("TaskProgress"), T(1525, barValue, taskData.task_parameter[1]), "Number1Txt")
          ChangeUIController(taskTips, "c1", 0)
        elseif info.state == ProtoEnum.TASK_STATE.REWARD then
          ChangeUIController(taskTips, "c1", 2)
        end
        local arr = GetConfigItemList(taskData.reward, true)
        local rewardList = taskTips:GetChild("RewardList")
        
        function rewardList.itemRenderer(i, item)
          Activity2TaskWindow.ShowAllItemFrame(arr[1 + i], item)
        end
        
        rewardList.numItems = #arr
        if not notPlayAnim and i < 7 then
          taskTips.alpha = 0
          PlayUITrans(item, "up", nil, i * 0.05)
          TimerUtil.setTimeout(i * 0.05, function()
            SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LIST_MOVE)
          end)
        end
      end
    end
    
    list.numItems = #taskList
    title.NumberTxt.text = T(1641, Activity2TaskWindow.GetRewardNum(), #taskList)
    uis.Main.AllGetBtn.visible = RedDotActivityDungeon.CanTask() and true or false
  end
end

function Activity2TaskWindow.GetRewardNum()
  local activityInfo = ActivityDungeonData.GetActivityInfo()
  local num = 0
  if activityInfo then
    for i, v in pairs(activityInfo.taskList) do
      if v.state == ProtoEnum.TASK_STATE.REWARD then
        num = num + 1
      end
    end
  end
  return num
end

function Activity2TaskWindow.ShowAllItemFrame(addAttr, item)
  if addAttr.type == ProtoEnum.TUPLE_TYPE.CARD then
    local loader = item:GetChild("CardFrame"):GetChild("ItemCardPic"):GetChild("ItemLoader")
    if loader then
      local data = TableData.GetConfig(addAttr.id, "BaseCard")
      if data then
        UIUtil.SetHeadByFaceId(data.fashion_id, loader, HEAD_ICON_TYPE_ENUM.RECT)
        ChangeUIController(item:GetChild("CardFrame"), "c1", data.star - 1)
      end
    end
    ChangeUIController(item, "c2", 1)
  elseif addAttr.type == ProtoEnum.TUPLE_TYPE.ITEM then
    local config = TableData.GetConfig(addAttr.id, "BaseItem")
    local itemFrame = item:GetChild("ItemFrame")
    local loader = itemFrame:GetChild("ItemLoader")
    if loader and config then
      loader.url = UIUtil.GetResUrl(config.icon)
    end
    ChangeUIController(item, "c2", 0)
    ChangeUIController(itemFrame, "c1", config.quality)
    local numberTxt = itemFrame:GetChild("NumberTxt")
    if numberTxt then
      numberTxt.text = addAttr.value
    end
  end
  item.onClick:Set(function()
    UIUtil.OpenPreviewTips(addAttr.id, addAttr.type)
  end)
end

function Activity2TaskWindow.SortTask(taskList)
  local list = {}
  for i, v in ipairs(taskList) do
    if v.state == ProtoEnum.TASK_STATE.FINISHED then
      v.sortIndex = 3
    elseif v.state == ProtoEnum.TASK_STATE.NORMAL then
      v.sortIndex = 2
    else
      v.sortIndex = 1
    end
    table.insert(list, v)
  end
  local taskDataA, taskDataB, sortA, sortB
  table.sort(list, function(a, b)
    if a.sortIndex == b.sortIndex then
      taskDataA = TableData.GetConfig(a.taskId, "BaseTask")
      taskDataB = TableData.GetConfig(b.taskId, "BaseTask")
      if taskDataB and taskDataA then
        sortA = taskDataA.sort or 0
        sortB = taskDataB.sort or 0
        return sortA < sortB
      end
    else
      return a.sortIndex > b.sortIndex
    end
  end)
  return list
end

function Activity2TaskWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(Activity2TaskWindow.CloseWindow)
  local title = uis.Main.TaskTitle
  title.WordTxt.text = T(1636)
  title.TitleTxt.text = T(1637)
  UIUtil.SetText(uis.Main.AllGetBtn, T(1510))
  uis.Main.AllGetBtn.onClick:Set(function()
    local activityInfo = ActivityDungeonData.GetActivityInfo()
    if activityInfo then
      ActivityDungeonService.ActivityStageTaskRewardReq(activityInfo.baseInfo.activityId, 0, function()
        if uis then
          Activity2TaskWindow.UpdateInfo(true)
        end
      end)
    end
  end)
end

function Activity2TaskWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.Activity2TaskWindow.name)
end

function Activity2TaskWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity2TaskWindow
