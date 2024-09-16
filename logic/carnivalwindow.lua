require("Carnival_ActivityWindowByName")
require("InitialCarnivalWindow")
require("InitialSignWindow")
require("DailyTaskWindow")
require("BiographyWindow")
require("InitialLevelRewardWindow")
require("InitialEnergyWindow")
local CarnivalWindow = {}
local uis, contentPane, tempLoadPackageName
local ActivityName = {
  InitialCarnival = "InitialCarnival",
  InitialSign = "InitialSign",
  DailyTask = "DailyTask",
  Biography = "Biography",
  LevelReward = "InitialLevelReward",
  InitialEnergy = "InitialEnergy"
}
local ActivityRedVisibleFunc = {
  InitialCarnival = RedDotTask.InitialCarnivalRed,
  InitialSign = RedDotTask.InitialSignRed,
  DailyTask = RedDotTask.DailyTaskRed,
  Biography = RedDotTask.BiographyRed,
  InitialLevelReward = RedDotTask.CanLvGift,
  InitialEnergy = RedDotTask.HasAnySupplies
}
local openedPanel = {}
local curSelectChildIndex, curPanelName, jumpTb, curId, param, argTable

function CarnivalWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.CarnivalWindow.package, WinResConfig.CarnivalWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetCarnival_ActivityWindowUis(contentPane)
    tempLoadPackageName = {}
    curPanelName = ""
    argTable = bridgeObj.argTable
    curId = argTable[1]
    param = argTable[2]
    local stepData = GuideMgr.GetStepData()
    if stepData and stepData.open_gacha_id then
      curId = stepData.open_gacha_id
      stepData = nil
    end
    local trans = uis.Main.root:GetTransition("up")
    local activityTb = CarnivalWindow.GetShowActivityData()
    
    function uis.Main.ActivityBtnList.itemRenderer(i, item)
      local data = activityTb[i + 1]
      UIUtil.SetText(item, data.name(), "NameTxt")
      if data.name_english then
        UIUtil.SetText(item, data.name_english(), "SubtitleTxt")
      end
      if ACTIVITY_ID.DAILY_TASK == data.id then
        ChangeUIController(item, "lock", EnterClampUtil.WhetherToEnter(FEATURE_ENUM.DAILY_TASK, false) and 0 or 1)
      end
      item:GetChild("TabList").url = UIUtil.GetResUrl(data.icon)
      item.soundFmod = SOUND_EVENT_ENUM.CARD_SELECT
      if data.id == ACTIVITY_ID.CARNIVAL then
        ChangeUIController(item, "c2", 1)
        UIUtil.SetText(item, T(960, CarnivalData.GetCarnivalCurrentDay(), CarnivalData.GetCarnivalTotalDay()), "TimeTxt")
      else
        ChangeUIController(item, "c2", 0)
      end
      UIUtil.SetTagButtonSwitch(item, trans, function()
        if uis.Main.ActivityBtnList.selectedIndex ~= i then
          if ACTIVITY_ID.DAILY_TASK == data.id and not EnterClampUtil.WhetherToEnter(FEATURE_ENUM.DAILY_TASK) then
            return false
          end
          uis.Main.ActivityBtnList.selectedIndex = i
          return true
        end
        return false
      end, function()
        CarnivalWindow.ActivityOnClick(data)
        argTable[1] = data.id
        UIMgr:SetWindowArgs(WinResConfig.CarnivalWindow.name, argTable)
      end, uis.Main.ActivityBtnList)
      if curId then
        if data.id == curId then
          CarnivalWindow.ActivityOnClick(data, param)
          uis.Main.ActivityBtnList.selectedIndex = i
        end
      elseif 0 == i then
        CarnivalWindow.ActivityOnClick(data)
        uis.Main.ActivityBtnList.selectedIndex = i
      end
      if data.res_url then
        local packageName = Split(data.res_url, ":")[1]
        local func = ActivityRedVisibleFunc[packageName]
        if func then
          RedDotMgr.AddNode({
            windowName = WinResConfig.CarnivalWindow.name,
            com = item,
            dataType = RED_DOT_DATA_TYPE.TASK,
            visibleFunc = function()
              return func()
            end
          })
        end
      end
    end
    
    uis.Main.ActivityBtnList.numItems = #activityTb
  end)
end

function CarnivalWindow.ActivityOnClick(data, param)
  local packageName, comName
  local resStrTable = Split(data.res_url, ":")
  if resStrTable and #resStrTable > 1 then
    packageName = resStrTable[1]
    comName = resStrTable[2]
    if nil == tempLoadPackageName[packageName] then
      UIMgr:LoadPackage(packageName)
      tempLoadPackageName[packageName] = packageName
    end
    local parentContent = uis.Main.ActivityContent.root
    if curSelectChildIndex then
      local com = parentContent:GetChildAt(curSelectChildIndex)
      com.visible = false
    end
    local childIndex = openedPanel[packageName]
    if childIndex then
      local com = parentContent:GetChildAt(childIndex)
      com.visible = true
      CarnivalWindow.ContentOnShow(packageName)
    else
      local com = CarnivalWindow.GetCom(packageName, comName)
      com.visible = false
      parentContent:AddChild(com)
      childIndex = parentContent.numChildren - 1
      openedPanel[packageName] = childIndex
      if packageName == ActivityName.InitialCarnival then
        CarnivalService.GetCarnivalInfoReq(function()
          InitialCarnivalWindow.OnInit(com)
        end)
      elseif packageName == ActivityName.InitialSign then
        InitialSignWindow.OnInit(com, data)
      elseif packageName == ActivityName.DailyTask then
        if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.DAILY_TASK, false) then
          DailyTaskWindow.OnInit(com)
          ld("DailyTask", function()
            DailyTaskService.GetCommonTaskInfoReq()
          end)
        end
      elseif packageName == ActivityName.Biography then
        ld("Biography", function()
          BiographyService.GetPlantInfoReq(function()
            BiographyWindow.OnInit(com, param)
          end)
        end)
      elseif packageName == ActivityName.LevelReward then
        InitialLevelRewardWindow.OnInit(com, param)
      elseif packageName == ActivityName.InitialEnergy then
        DailySupplyService.GetSupplyInfoReq(function()
          InitialEnergyWindow.OnInit(com, param)
        end)
      end
      com.visible = true
    end
    if tempLoadPackageName[packageName] and packageName ~= curPanelName then
      CarnivalWindow.ContentOnHide(curPanelName)
    end
    curPanelName = packageName
    curSelectChildIndex = childIndex
    CarnivalWindow.InitBtn()
  end
end

function CarnivalWindow.ContentOnShow(packageName)
  if packageName == ActivityName.Biography then
    BiographyWindow.OnShow()
  elseif packageName == ActivityName.InitialCarnival then
    InitialCarnivalWindow.OnShow()
  elseif packageName == ActivityName.InitialSign then
    InitialSignWindow.ShowSceneBg(true)
  elseif packageName == ActivityName.LevelReward then
    InitialLevelRewardWindow.OnShow()
  elseif packageName == ActivityName.InitialEnergy then
    InitialEnergyWindow.OnShow()
  end
end

function CarnivalWindow.ContentOnHide(packageName)
  if packageName == ActivityName.Biography then
    BiographyWindow.OnHide()
  elseif packageName == ActivityName.InitialSign then
    InitialSignWindow.ShowSceneBg(false)
  end
end

function CarnivalWindow.GetCom(packageName, comName)
  local com = UIMgr:CreateObject(packageName, comName)
  local parentContent = uis.Main.ActivityContent.root
  com.size = parentContent.size
  return com
end

function CarnivalWindow.GetShowActivityData()
  local tb = {}
  local data = TableData.GetTable("BaseActivity")
  for i, v in pairs(data) do
    if v.icon and CarnivalData.ActivityIsUnlock(v.id) then
      if ACTIVITY_ID.DAILY_TASK == v.id and not EnterClampUtil.WhetherToEnter(FEATURE_ENUM.DAILY_TASK, false) then
        local tempData = SimpleCopy(v)
        tempData.sort = 100
        table.insert(tb, tempData)
      else
        table.insert(tb, v)
      end
    end
  end
  if #tb > 1 then
    table.sort(tb, function(a, b)
      return a.sort < b.sort
    end)
  end
  return tb
end

function CarnivalWindow.ClearPackage()
  for i, v in pairs(tempLoadPackageName) do
    UIMgr:RemovePackage(v)
  end
  tempLoadPackageName = {}
end

function CarnivalWindow.InitBtn()
  local featureId
  if curPanelName == ActivityName.InitialCarnival then
    featureId = FEATURE_ENUM.HOME_CARNIVAL
  elseif curPanelName == ActivityName.InitialSign then
  elseif curPanelName == ActivityName.Biography then
    featureId = FEATURE_ENUM.HOME_BIOGRAPHY
  elseif curPanelName == ActivityName.DailyTask then
    featureId = FEATURE_ENUM.DAILY_TASK
  elseif curPanelName == ActivityName.DailyTask then
    featureId = FEATURE_ENUM.LV_GIFT
  end
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.CarnivalWindow.name, uis.Main.CurrencyReturn, featureId, function()
    UIMgr:CloseWindow(WinResConfig.CarnivalWindow.name)
  end)
end

function CarnivalWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.CarnivalWindow.UPDATE_PARAM_1 then
    argTable[1] = para
    UIMgr:SetWindowArgs(WinResConfig.CarnivalWindow.name, argTable)
  elseif msgId == WindowMsgEnum.CarnivalWindow.UPDATE_PARAM_2 then
    argTable[2] = para
    UIMgr:SetWindowArgs(WinResConfig.CarnivalWindow.name, argTable)
  elseif curPanelName == ActivityName.InitialCarnival then
    InitialCarnivalWindow.HandleMessage(msgId, para)
  elseif curPanelName == ActivityName.InitialSign then
    InitialSignWindow.HandleMessage(msgId, para)
  elseif curPanelName == ActivityName.Biography then
    BiographyWindow.HandleMessage(msgId, para)
  elseif curPanelName == ActivityName.DailyTask then
    DailyTaskWindow.HandleMessage(msgId, para)
  elseif curPanelName == ActivityName.LevelReward then
    InitialLevelRewardWindow.HandleMessage(msgId, para)
  end
end

function CarnivalWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.CarnivalWindow.name)
  uis = nil
  contentPane = nil
  curId = nil
  argTable = nil
  openedPanel = {}
  curPanelName = nil
  curSelectChildIndex = nil
  CarnivalWindow.ClearPackage()
  InitialCarnivalWindow.OnClose()
  InitialSignWindow.OnClose()
  DailyTaskWindow.OnClose()
  BiographyWindow.OnClose()
  InitialLevelRewardWindow.OnClose()
  InitialEnergyWindow.OnClose()
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return CarnivalWindow
