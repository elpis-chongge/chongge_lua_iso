require("InitialCarnival_CarnivalByName")
InitialCarnivalWindow = {}
local lerp = Mathf.Lerp
local carnivalData, targetData, curPageIndex, curStageId, integralIcon, integralNum, settleTime, carnival, curId, labelItem, firstEnter, unLocked
local width = 81
local tween, isMove, getId, getNum, isGetReward
local taskIconId = 21000008
local curIndex
local AlignType = {
  None = 0,
  Left = 1,
  Right = 2,
  Update = 3
}
local alignType

function InitialCarnivalWindow.OnInit(com)
  carnival = GetInitialCarnival_CarnivalUis(com)
  firstEnter = true
  alignType = AlignType.None
  InitialCarnivalWindow.LoadBgTexture()
  integralIcon = TableData.GetConfig(COMMON_ITEM_ID.INTEGRAL, "BaseItem").icon
  integralNum = ActorData.GetItemCount(COMMON_ITEM_ID.INTEGRAL)
  curStageId = InitialCarnivalWindow.GetCarnivalDataByTaskId()
  if nil == curStageId then
    curStageId = InitialCarnivalWindow.GetCurStage()
  end
  InitialCarnivalWindow.Init()
  InitialCarnivalWindow.IsSeasonSettle()
  InitialCarnivalWindow.InitBtn()
  InitialCarnivalWindow.InitRedDot()
end

function InitialCarnivalWindow.InitRedDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.CarnivalWindow.name,
    com = carnival.Show.root,
    dataType = RED_DOT_DATA_TYPE.TASK,
    visibleFunc = function()
      return RedDotTask.CanCarnivalTarget()
    end
  })
end

function InitialCarnivalWindow.LoadBgTexture()
  local model = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/carnival/FX_ui_carnival.prefab")
  local holder = carnival.BackGround.BackGroundHolder
  UIUtil.SetObjectToUI(model, holder)
  local mapScale = 100
  LuaUtil.SetScale(model, mapScale, mapScale, mapScale)
  LuaUtil.SetLocalPos(model, holder.width / 2, -holder.height / 2, 0)
end

function InitialCarnivalWindow.IsSeasonSettle()
  local downTime = CarnivalData.info.closedStamp - math.floor(LoginData.GetCurServerTime())
  if downTime > 0 then
    local closeFun = function()
      UIMgr:CloseWindow(WinResConfig.CarnivalWindow.name)
    end
    settleTime = TimerUtil.new(1, downTime, function(timer, tickTime)
    end, function()
      MessageBox.Show(T(463), {touchCallback = closeFun}, nil, {touchCallback = closeFun})
    end)
    settleTime:start()
  end
end

function InitialCarnivalWindow.GetCarnivalDataById(id)
  for i, v in pairs(carnivalData) do
    if v.id == id then
      return v
    end
  end
end

function InitialCarnivalWindow.GetServiceCarnivalById(id)
  for i, v in pairs(CarnivalData.info.stageList) do
    if v.stageId == id then
      return v, i
    end
  end
end

function InitialCarnivalWindow.GetCarnivalDataByTaskId()
  local uid = CarnivalData.GetHomeTaskId()
  if uid then
    for i, v in pairs(CarnivalData.info.stageList) do
      for j = 1, #v.taskList do
        if v.taskList[j].uid == uid then
          return v.stageId, i
        end
      end
    end
  end
end

function InitialCarnivalWindow.GetCurStage()
  local id = 0
  for day, v in ipairs(CarnivalData.info.stageList) do
    for k, vv in pairs(v.taskList) do
      if vv.state == ProtoEnum.TASK_STATE.FINISHED then
        return v.stageId, day
      end
      id = v.stageId
    end
  end
  return id
end

function InitialCarnivalWindow.GetCarnivalData()
  local config = TableData.GetTable("BaseActivityCarnival")
  local tb = {}
  for i, v in pairs(config) do
    table.insert(tb, v)
  end
  table.sort(tb, function(a, b)
    return a.id < b.id
  end)
  return tb
end

local SetScaleBig = function(item, t)
  local BigImage = item:GetChild("Big")
  local num = lerp(0.6, 1, t)
  BigImage:SetScale(num, num)
  num = lerp(0, 1, t)
  BigImage.alpha = num
  local NameTxt = item:GetChild("NameTxt")
  num = lerp(0.7, 1, t)
  NameTxt:SetScale(num, num)
  num = lerp(59, 51, t)
  NameTxt.xy = Vector2(NameTxt.x, num)
  local SubtitleTxt = item:GetChild("SubtitleTxt")
  num = lerp(0, 1, t)
  SubtitleTxt.alpha = num
  local SmallImage = item:GetChild("Small")
  num = lerp(1, 0, t)
  SmallImage.alpha = num
  num = lerp(0.6, 1, t)
  SmallImage:SetScale(num, num)
end
local SetScaleMin = function(item, t)
  local BigImage = item:GetChild("Big")
  local num = lerp(1, 0.6, t)
  BigImage:SetScale(num, num)
  num = lerp(1, 0, t)
  BigImage.alpha = num
  local NameTxt = item:GetChild("NameTxt")
  num = lerp(1, 0.7, t)
  NameTxt:SetScale(num, num)
  num = lerp(51, 59, t)
  NameTxt.xy = Vector2(NameTxt.x, num)
  local SubtitleTxt = item:GetChild("SubtitleTxt")
  num = lerp(1, 0, t)
  SubtitleTxt.alpha = num
  local SmallImage = item:GetChild("Small")
  num = lerp(0, 1, t)
  SmallImage.alpha = num
  num = lerp(1, 0.6, t)
  SmallImage:SetScale(num, num)
end
local TaskAllEnd = function(id)
  local isEnd = false
  for i, v in pairs(CarnivalData.info.stageList) do
    if v.stageId == id then
      isEnd = true
      for k, vv in pairs(v.taskList) do
        if vv.state == ProtoEnum.TASK_STATE.REWARD then
        else
          isEnd = false
        end
      end
    end
  end
  return isEnd
end

function InitialCarnivalWindow.UpdateDayState(id, item)
  if TaskAllEnd(id) then
    ChangeUIController(item:GetChild("Big"), "c1", 1)
    ChangeUIController(item:GetChild("Small"), "c1", 1)
  else
    ChangeUIController(item:GetChild("Big"), "c1", 0)
    ChangeUIController(item:GetChild("Small"), "c1", 0)
  end
end

function InitialCarnivalWindow.Init()
  targetData = CarnivalData.GetCarnivalTargetData()
  carnivalData = InitialCarnivalWindow.GetCarnivalData()
  labelItem = {}
  unLocked = {}
  local lastItem
  curIndex = -1
  local scrollPane = carnival.Tab.TabList.scrollPane
  local day = 0
  
  function carnival.Tab.TabList.itemRenderer(i, item)
    labelItem[i] = item
    if nil == carnivalData[i] then
      ChangeUIController(item, "c1", 1)
      ChangeUIController(item, "c3", 1)
      if unLocked[#carnivalData] then
        unLocked[#carnivalData + 1] = true
      end
      return
    end
    ChangeUIController(item, "c3", 0)
    local data = carnivalData[i]
    item:GetChild("NameTxt").text = i
    item:GetChild("SubtitleTxt").text = T(755)
    local lock = InitialCarnivalWindow.GetInfoData(data.id)
    if lock then
      ChangeUIController(item, "c2", 0)
      day = i
      unLocked[i] = true
    else
      unLocked[i] = false
      ChangeUIController(item, "c2", 1)
    end
    InitialCarnivalWindow.UpdateDayState(data.id, item)
    item.onClick:Set(function()
      if curIndex ~= i then
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_TAG_ON_CLICK)
        if InitialCarnivalWindow.GetInfoData(data.id) then
          if not firstEnter then
            alignType = curIndex > i and AlignType.Left or AlignType.Right
          end
          curIndex = i
          lastItem = item
          if tween then
            LeanTween.cancel(tween.uniqueId)
          end
          local c = scrollPane.posX
          local t = (i - 1) * width
          if c ~= t then
            tween = LeanTween.value(c, t, 0.2):setOnUpdate(function(value)
              scrollPane.posX = value
            end):setOnComplete(function()
              tween = nil
              if carnival then
                scrollPane.posX = t
              end
            end)
          end
          InitialCarnivalWindow.RefreshTaskList(data.id)
          curStageId = data.id
        elseif 1 == i - day then
          FloatTipsUtil.ShowWarnTips(T(1123))
        else
          FloatTipsUtil.ShowWarnTips(T(471, i - day))
        end
      end
    end)
    if data.id == curStageId then
      SetScaleBig(item, 1)
      item.onClick:Call()
    else
      ChangeUIController(item, "c1", 1)
    end
  end
  
  carnival.Tab.TabList.numItems = #carnivalData + 2
  local trans = carnival.root:GetTransition("rotate")
  trans:SetHook("Sign", function()
    if curId then
      InitialCarnivalWindow.UpdateTaskInfo(curId)
    end
  end)
  InitialCarnivalWindow.RefreshList(day)
  InitialCarnivalWindow.RefreshIntegral()
  UIUtil.SetIconById(carnival.Show.Target.PicLoader, taskIconId, true)
end

function InitialCarnivalWindow.UpdateRewardBar()
  getId = nil
  local set = function(index)
    local arr = GetConfigItemList(targetData[index].unlock_points, true)
    getId = targetData[1].id
    getNum = arr[1].value
  end
  local arr
  for i, v in ipairs(targetData) do
    arr = GetConfigItemList(v.unlock_points, true)
    if arr[1] then
      if not table.contain(CarnivalData.info.rewardTragets, v.id) then
        getId = v.id
        getNum = arr[1].value
        return
      elseif #CarnivalData.info.rewardTragets >= #targetData then
        set(#targetData)
        return
      end
    end
  end
end

function InitialCarnivalWindow.RefreshList(day)
  local x = 0
  local ind = 0
  local scrollPane = carnival.Tab.TabList.scrollPane
  local minDis = 1 / (carnival.Tab.TabList.numChildren - 3) * (day - 1)
  scrollPane.onScroll:Set(function()
    if scrollPane.percX > minDis then
      scrollPane:CancelDragging()
      scrollPane.percX = minDis
      return
    end
    ind = math.modf((scrollPane.posX + width) / width)
    for i = 1, #labelItem do
      if i == ind then
        x = scrollPane.posX % width / width
        SetScaleBig(labelItem[i + 1], x)
        SetScaleMin(labelItem[i], x)
      end
    end
  end)
  carnival.Tab.TabList.onTouchBegin:Set(function()
    if scrollPane.percX > minDis then
      scrollPane:CancelDragging()
      scrollPane.percX = minDis
      return
    end
    isMove = nil
  end)
  carnival.Tab.TabList.onTouchMove:Set(function()
    isMove = true
  end)
  carnival.Tab.TabList.onTouchEnd:Set(function()
    if not isMove then
      return
    end
    if tween then
      LeanTween.cancel(tween.uniqueId)
    end
    local n, p = math.modf((scrollPane.posX + width) / width)
    local c = scrollPane.posX
    local e
    if p < 0.5 then
      e = c - math.fmod(scrollPane.posX, width)
    else
      local d = math.fmod(scrollPane.posX, width)
      e = c + (width - d)
      n = n + 1
    end
    tween = LeanTween.value(c, e, 0.2):setOnUpdate(function(value)
      scrollPane.posX = value
    end):setOnComplete(function()
      tween = nil
      if labelItem[n] and unLocked[n] then
        labelItem[n].onClick:Call()
      end
      if carnival then
        scrollPane.posX = e
      end
    end)
  end)
end

function InitialCarnivalWindow.RefreshIntegral()
  integralNum = ActorData.GetItemCount(COMMON_ITEM_ID.INTEGRAL)
  InitialCarnivalWindow.UpdateRewardBar()
  isGetReward = integralNum >= getNum
  local num = isGetReward and getNum or integralNum
  if isGetReward then
    UIUtil.SetBtnText(carnival.Show.root, T(876), T(877))
    carnival.Show.Target.IntegralTxt.text = T(868, num, getNum)
  else
    carnival.Show.Target.IntegralTxt.text = T(887, num, getNum)
    UIUtil.SetBtnText(carnival.Show.root, T(874), T(875))
  end
  if #CarnivalData.info.rewardTragets >= #targetData then
    carnival.Show.c1Ctr.selectedIndex = 2
    UIUtil.SetBtnText(carnival.Show.root, T(874), T(875))
    local data = targetData[#targetData]
    if data and data.reward then
      local arr = GetConfigItemList(data.reward, true)
      if arr[1] then
        local config = TableData.GetConfig(arr[1].id, "BaseItem")
        if config then
          carnival.Show.PicLoader.url = UIUtil.GetResUrl(config.icon)
        end
      end
    end
  else
    local data = TableData.GetConfig(getId, "BaseActivityCarnivalTarget")
    if data and data.reward then
      local arr = GetConfigItemList(data.reward, true)
      if arr[1] then
        local config = TableData.GetConfig(arr[1].id, "BaseItem")
        if config then
          carnival.Show.PicLoader.url = UIUtil.GetResUrl(config.icon)
        end
      end
    end
    carnival.Show.c1Ctr.selectedIndex = 0
  end
end

function InitialCarnivalWindow.GetInfoData(id)
  for i, v in pairs(CarnivalData.info.stageList) do
    if v.stageId == id then
      return true
    end
  end
  return false
end

function InitialCarnivalWindow.UpdateTaskInfo(id)
  InitialCarnivalWindow.UpdateTaskNum()
  local serviceData, ind = InitialCarnivalWindow.GetServiceCarnivalById(id)
  local scale = {
    0,
    0,
    1,
    2,
    2,
    1
  }
  if serviceData then
    for i, v in pairs(labelItem) do
      v:GetChild("Red").visible = false
    end
    local item = labelItem[curIndex]
    if item then
      item:GetChild("Red").visible = RedDotTask.CanDayTask(id)
      InitialCarnivalWindow.UpdateDayState(CarnivalData.info.stageList[ind].stageId, item)
    end
    local taskLen = #CarnivalData.info.stageList[ind].taskList
    local finishNum = 0
    for i = 1, taskLen do
      local task = carnival["Task" .. i]
      local data = CarnivalData.info.stageList[ind].taskList[i]
      if task and data then
        curPageIndex = ind
        local taskData = TableData.GetConfig(data.taskId, "BaseTask")
        if taskData then
          local arr = Split(taskData.reward[1], ":")
          if 3 == #arr then
            UIUtil.SetIconById(task.TaskItem.ItemLoader, tonumber(arr[2]))
            task.TaskItem.NumberTxt.text = arr[3]
          end
          if data.state == ProtoEnum.TASK_STATE.REWARD then
            finishNum = finishNum + 1
          end
          if data.state == ProtoEnum.TASK_STATE.FINISHED then
            task.TaskItem.SubmitTxt.text = T(1065)
            task.TaskItem.WordTxt.text = ""
          else
            task.TaskItem.WordTxt.text = taskData.name()
            task.TaskItem.ProgressTxt.text = T(756, data.value, taskData.task_parameter[1])
          end
          task.root.onClick:Set(function()
            OpenWindow(WinResConfig.TaskDetailsWindow.name, nil, {day = ind, task = data})
          end)
          if data.value >= taskData.task_parameter[1] and data.state ~= ProtoEnum.TASK_STATE.REWARD then
            UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/carnival/FX_ui_jianianhua_icon_diguang.prefab", task.TaskItem.ItemEffectHolder)
          end
          task.TaskItem.c1Ctr.selectedIndex = data.state
          task.c1Ctr.selectedIndex = data.state
          task.c2Ctr.selectedIndex = scale[i]
          task.TaskItem.ItemEffectHolder.visible = true
          RedDotMgr.AddNode({
            windowName = WinResConfig.CarnivalWindow.name,
            com = task.root,
            dataType = RED_DOT_DATA_TYPE.TASK,
            visibleFunc = function()
              return data.state == ProtoEnum.TASK_STATE.FINISHED
            end
          })
        end
      end
      carnival.Tab.CarnivalTabProgress.NumberTxt.text = T(757, finishNum, taskLen)
    end
  end
end

function InitialCarnivalWindow.RefreshTaskList(id)
  curId = id
  if alignType == AlignType.Update then
    InitialCarnivalWindow.UpdateTaskInfo(id)
    return
  end
  carnival.Tab.TabList.touchable = false
  local InEndFun = function()
    firstEnter = false
    carnival.Tab.TabList.touchable = true
  end
  if alignType == AlignType.None then
    InitialCarnivalWindow.UpdateTaskInfo(id)
    PlayUITrans(carnival.root, "in", InEndFun)
  elseif alignType == AlignType.Left then
    PlayUITrans(carnival.root, "rotate", InEndFun)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARNIVA_ROTATE)
  elseif alignType == AlignType.Right then
    PlayUITrans(carnival.root, "rotate", InEndFun, nil, nil, nil, nil, nil, true)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARNIVA_ROTATE)
  end
end

function InitialCarnivalWindow.InitBtn()
  carnival.Show.root.onClick:Set(function()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
    if 2 ~= carnival.Show.c1Ctr.selectedIndex then
      if isGetReward then
        CarnivalService.CarnivalGetRewardReq(getId, nil, function()
          if carnival then
            InitialCarnivalWindow.RefreshIntegral()
          end
        end)
      else
        OpenWindow(WinResConfig.CarnivalRewardWindow.name, nil, integralNum)
      end
    else
      OpenWindow(WinResConfig.CarnivalRewardWindow.name, nil, integralNum)
    end
  end)
end

function InitialCarnivalWindow.UpdateTaskNum()
  local GetDay = function(startInd)
    local taskNum = 0
    local rewardNum = 0
    for i, v in pairs(CarnivalData.info.stageList) do
      if i ~= curIndex and startInd < i then
        rewardNum = 0
        taskNum = 0
        for j = 1, #v.taskList do
          if v.taskList[j].state == ProtoEnum.TASK_STATE.FINISHED then
            taskNum = taskNum + 1
          end
          if v.taskList[j].state == ProtoEnum.TASK_STATE.REWARD then
            rewardNum = rewardNum + 1
          end
        end
        if taskNum > 0 then
          return i, taskNum, T(757, rewardNum, #v.taskList)
        end
      end
    end
    return 0, taskNum, ""
  end
  local curDay, taskNum, rewardStr = GetDay(curIndex)
  if 0 == curDay then
    curDay, taskNum, rewardStr = GetDay(0)
  end
  if 0 == curDay or curDay == curIndex then
    carnival.PositionBtn.visible = false
  else
    carnival.PositionBtn.visible = true
    UIUtil.SetText(carnival.PositionBtn, T(961, taskNum), "NumberTxt")
    UIUtil.SetText(carnival.PositionBtn, curDay, "TimeTxt")
    UIUtil.SetText(carnival.PositionBtn, rewardStr, "ProgressTxt")
    carnival.PositionBtn.onClick:Set(function()
      local item = labelItem[curDay]
      if item then
        item.onClick:Call()
      end
    end)
  end
end

local NextDay = function(taskList)
  for k, vv in pairs(taskList) do
    if vv.state == ProtoEnum.TASK_STATE.FINISHED then
      return true
    end
  end
  return false
end

function InitialCarnivalWindow.OnShow()
  local data, day = InitialCarnivalWindow.GetServiceCarnivalById(curId)
  if data and NextDay(data.taskList) then
    PlayUITrans(carnival.root, "in", nil)
  else
    data, day = InitialCarnivalWindow.GetCurStage()
    if labelItem and carnival then
      if labelItem[day] then
        labelItem[day].onClick:Call()
      else
        PlayUITrans(carnival.root, "in", nil)
      end
    end
  end
end

function InitialCarnivalWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.CarnivalWindow.GET_TASK then
    local data, day = InitialCarnivalWindow.GetServiceCarnivalById(curId)
    if NextDay(data.taskList) then
      alignType = AlignType.Update
      InitialCarnivalWindow.RefreshTaskList(curId)
    else
      data, day = InitialCarnivalWindow.GetCurStage()
      if labelItem and labelItem[day] then
        labelItem[day].onClick:Call()
      else
        alignType = AlignType.Update
        InitialCarnivalWindow.RefreshTaskList(curId)
      end
    end
  elseif msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    InitialCarnivalWindow.RefreshIntegral()
  end
end

function InitialCarnivalWindow.OnClose()
  unLocked = nil
  if tween then
    LeanTween.cancel(tween.uniqueId)
  end
  isMove = nil
  firstEnter = nil
  carnivalData = nil
  targetData = nil
  integralIcon = nil
  curPageIndex = nil
  curStageId = nil
  carnival = nil
  curId = nil
  alignType = nil
  if settleTime then
    settleTime:stop()
    settleTime = nil
  end
end

return InitialCarnivalWindow
