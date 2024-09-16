require("GuildBoss_GuildBossTaskWindowByName")
local GuildWarBossTaskWindow = {}
local uis, contentPane

function GuildWarBossTaskWindow.ReInitData()
end

function GuildWarBossTaskWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildWarBossTaskWindow.package, WinResConfig.GuildWarBossTaskWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_GuildBossTaskWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.GUILD_WAR_WINDOW_BG)
    GuildWarBossTaskWindow.UpdateInfo()
    GuildWarBossTaskWindow.InitBtn()
    CurrencyReturnWindow.AutoOpenCaption(12307, uis, uis.Main.FunctionDetailsBtn)
  end)
end

function GuildWarBossTaskWindow.UpdateInfo(notPlayAnim)
  local list = uis.Main.TaskList
  local taskListData = GuildWarData.GetGuildTaskInfo()
  if taskListData then
    function list.itemRenderer(i, item)
      local info = taskListData[i + 1]
      
      local taskData = TableData.GetConfig(info.taskId, "BaseTask")
      if taskData then
        local taskTips = item:GetChild("Tips")
        GuildWarBossTaskWindow.ShowWordList(taskTips:GetChild("WordList"), taskData.name and taskData.name() or "")
        local barValue = math.min(info.value, taskData.task_parameter[1])
        if info.state == ProtoEnum.TASK_STATE.FINISHED then
          UIUtil.SetText(taskTips:GetChild("Progress"), T(1580, barValue, taskData.task_parameter[1]), "NumberTxt")
          ChangeUIController(taskTips, "c1", 1)
          local getBtn = taskTips:GetChild("GetBtn")
          UIUtil.SetText(getBtn, T(1382), "WordTxt")
          getBtn.onClick:Set(function()
            GuildWarService.RewardGuildWarTaskReq(info.uid, function()
              if uis then
                info.state = ProtoEnum.TASK_STATE.REWARD
                ChangeUIController(taskTips, "c1", 2)
                uis.Main.Number.NumberTxt.text = T(1593, GuildWarBossTaskWindow.GetRewardNum(taskListData), list.numItems)
              end
            end)
          end)
        elseif info.state == ProtoEnum.TASK_STATE.NORMAL then
          UIUtil.SetText(taskTips:GetChild("Progress"), T(1580, barValue, taskData.task_parameter[1]), "NumberTxt")
          ChangeUIController(taskTips, "c1", 0)
        elseif info.state == ProtoEnum.TASK_STATE.REWARD then
          ChangeUIController(taskTips, "c1", 2)
        end
        local taskProgressBar = taskTips:GetChild("TaskProgressBar")
        if taskProgressBar then
          taskProgressBar.max = taskData.task_parameter[1]
          taskProgressBar.value = barValue
        end
        UIUtil.SetText(taskTips, "", "NameTxt")
        local arr = GetConfigItemList(taskData.reward, true)
        if arr[1] then
          UIUtil.ShowItemFrame(arr[1].id, taskTips:GetChild("Item"), arr[1].value)
          local itemData = TableData.GetConfig(arr[1].id, "BaseItem")
          if itemData and itemData.name then
            UIUtil.SetText(taskTips, itemData.name(), "NameTxt")
          end
        end
        if not notPlayAnim then
          taskTips.alpha = 0
          PlayUITrans(item, "up", nil, i * 0.04)
        end
      end
    end
    
    list.numItems = #taskListData
    uis.Main.Number.NumberTxt.text = T(1593, GuildWarBossTaskWindow.GetRewardNum(taskListData), list.numItems)
  end
end

function GuildWarBossTaskWindow.GetRewardNum(taskList)
  local num = 0
  if taskList then
    for i, v in pairs(taskList) do
      if v.state == ProtoEnum.TASK_STATE.REWARD then
        num = num + 1
      end
    end
  end
  return num
end

function GuildWarBossTaskWindow.ShowWordList(list, txt)
  if txt and list then
    function list.itemRenderer(i, item)
      UIUtil.SetText(item, txt)
    end
    
    list.numItems = 1
  end
end

function GuildWarBossTaskWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuildWarBossTaskWindow.name)
  end)
end

function GuildWarBossTaskWindow.OnClose()
  uis = nil
  contentPane = nil
end

return GuildWarBossTaskWindow
