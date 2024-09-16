GuideMgr = {
  jumpNewHand = false,
  curTriggerId = 0,
  curStepId = 0,
  curStepIndex = 1,
  curGroupStepIndex = 0,
  curGuideIsPlay = false,
  curTriggerWindowName = "",
  delayWin = nil,
  guideBol = false
}
local guideProcessData = {}
local curStepData, tempStage, waitTween

function GuideMgr.SaveStageID(stageId)
  tempStage = stageId
end

function GuideMgr.Log(...)
  printWarning(...)
end

function GuideMgr.ClearData()
  GuideMgr.curTriggerId = 0
  GuideMgr.curStepId = 0
  GuideMgr.curStepIndex = 1
  GuideMgr.curGroupStepIndex = 0
  GuideMgr.curGuideIsPlay = false
  GuideMgr.curTriggerWindowName = ""
  GuideMgr.delayWin = nil
  GuideMgr.openAbyssTips = nil
  GuideMgr.guideBol = false
  guideProcessData = {}
  GuideData.ClearData()
end

function GuideMgr.Init()
  UIMgr.AfterShownFunc = GuideMgr.AfterShownFunc
  GuideMgr.ClearData()
  GuideMgr.InitData()
  GuideData.InitCaptionOpenData()
  GuideMgr.InitGuideInfo()
  print(GuideMgr.curTriggerId, ">>>>>> GuideMgr.curTriggerId GuideMgr.curStepId", GuideMgr.curStepId, "guideBol", GuideMgr.guideBol, "reconnectionBol", GuideMgr.reconnectionBol, table.getLen(guideProcessData))
  if GuideMgr.guideBol and GuideMgr.NeedShowSpecialGuide() == false then
    GuideMgr.curGuideIsPlay = true
  end
  if GuideMgr.curTriggerId and GuideMgr.curStepIndex then
    GuideMgr.DealKeyStepComplete()
  end
  if GuideMgr.jumpNewHand then
    GuideMgr.guideBol = false
  end
end

function GuideMgr.CheckReconnection()
  local info = ActorData.GetGuideInfo()
  local IsHave = function(id)
    for i, v in pairs(info) do
      if v.guideId == id then
        return true
      end
    end
  end
  for i, v in pairs(guideProcessData) do
    if not IsHave(v.id) and v.level and v.level == ActorData.GetLevel() and (v.feature == nil or ActorData.GetFeatureIsUnlock(v.feature)) and (nil == v.stage or v.stage == tempStage) then
      return v.id
    end
  end
end

function GuideMgr.InitGuideInfo()
  local curGuileInfo
  local info = ActorData.GetGuideInfo()
  local time = 0
  for i, v in pairs(info) do
    if time < v.stamp then
      time = v.stamp
      curGuileInfo = v
    end
  end
  if curGuileInfo then
    GuideMgr.reconnectionBol = false
    GuideMgr.guideBol = true
    GuideMgr.curTriggerId = curGuileInfo.guideId
    GuideMgr.curStepId = curGuileInfo.steps[#curGuileInfo.steps]
    local config = TableData.GetConfig(curGuileInfo.guideId, "BaseGuideProcess")
    if config then
      local stepKey = GuideData.GetLastKey(config)
      if GuideData.GuideIsEnd(curGuileInfo.guideId, stepKey) then
        if config.next_process then
          GuideMgr.curTriggerId = config.next_process
          GuideMgr.curStepId = 0
        else
          local guideId = GuideMgr.CheckReconnection()
          if guideId then
            GuideMgr.curTriggerId = guideId
            GuideMgr.curStepId = 0
            GuideMgr.curStepIndex = 1
            GuideMgr.curGroupStepIndex = 0
            GuideMgr.reconnectionBol = true
            GuideMgr.curGuideIsPlay = true
            return
          end
        end
        GuideMgr.guideBol = false
        GuideMgr.GuidePlayEnd()
        return
      end
      local key
      for i = 1, 10 do
        key = config["key" .. i]
        if key then
          if not table.contain(curGuileInfo.steps, tonumber(key)) and config["step" .. i .. "_"] then
            GuideMgr.curStepIndex = i
            GuideMgr.curGroupStepIndex = 0
            GuideMgr.curStepId = 0
            GuideMgr.reconnectionBol = true
            return
          end
        else
          break
        end
      end
      if GuideMgr.reconnectionBol == false then
        GuideMgr.curStepIndex = 1
        GuideMgr.curGroupStepIndex = 0
        GuideMgr.guideBol = false
        GuideMgr.GuidePlayEnd()
      end
    else
      GuideMgr.curStepIndex = 1
      GuideMgr.curGroupStepIndex = 0
      GuideMgr.reconnectionBol = false
      GuideMgr.guideBol = false
      GuideMgr.GuidePlayEnd()
    end
  end
end

function GuideMgr.DealKeyStepComplete()
  local processData = GuideMgr.GetProcessDataById(GuideMgr.curTriggerId)
  if processData then
    local keyId = processData.stepS[GuideMgr.curStepIndex] and processData.stepS[GuideMgr.curStepIndex].Key
    if keyId then
      local keyStepData = TableData.GetConfig(keyId, "BaseGuideStep")
      if keyStepData then
        local listen_complete_func = keyStepData.listen_complete_func
        if listen_complete_func and true == listen_complete_func() then
          if processData.stepS[GuideMgr.curStepIndex + 1] == nil then
            local curProcess = TableData.GetConfig(processData.id, "BaseGuideProcess")
            if curProcess.next_process then
              GuideMgr.curTriggerId = curProcess.next_process
              GuideMgr.curStepIndex = 1
              GuideMgr.curGroupStepIndex = 0
              GuideMgr.DealKeyStepComplete()
              return
            end
            GuideMgr.GuidePlayEnd()
            GuideMgr.HideWindow()
            GuideMgr.Refresh()
          end
          GuideMgr.curGroupStepIndex = 0
          GuideMgr.curStepIndex = GuideMgr.curStepIndex + 1
          GuideMgr.DealKeyStepComplete()
        end
      end
    end
  end
end

function GuideMgr.InitData()
  guideProcessData = {}
  local data = GuideData.GetGuideIdByWindowId()
  for _, v in pairs(data) do
    local guide = {}
    guide.id = v.id
    guide.level = v.level
    guide.functionId = v.stage
    guide.windowName = v.window_name
    guide.stage = v.stage
    guide.skill = v.skill
    guide.open_func = v.open_func
    local stepS = {}
    for i = 1, 10 do
      local m2 = {}
      m2.basicStep = v["step" .. i]
      m2.specialStep = v["step" .. i .. "_"]
      m2.Key = v["key" .. i]
      m2.exp = v["exp" .. i]
      if m2.basicStep and not string.isEmptyOrNil(m2.basicStep) and m2.basicStep ~= "0" then
        stepS[i] = m2
      end
    end
    guide.stepS = stepS
    table.insert(guideProcessData, guide)
  end
end

function GuideMgr.Refresh()
  GuideMgr.AfterShownFunc(UIMgr:GetTopWindow())
end

function GuideMgr.AddIndex()
  local groupStepIndex = GuideMgr.curGroupStepIndex
  local stepIndex = GuideMgr.curStepIndex
  local data = GuideMgr.GetProcessDataById(GuideMgr.curTriggerId)
  if data and curStepData then
    groupStepIndex = groupStepIndex + 1
    local stepArr = GuideMgr.reconnectionBol and data.stepS[stepIndex].specialStep or data.stepS[stepIndex].basicStep
    if curStepData.id then
      local change = true
      for i = 1, #stepArr do
        if stepArr[i] == curStepData.id and i < #stepArr then
          change = false
          GuideMgr.curGroupStepIndex = i
          print("下一步骤id>>>>>>>>>>>>>", stepArr[GuideMgr.curGroupStepIndex])
        end
      end
      if change then
        GuideMgr.reconnectionBol = false
        if data.stepS[stepIndex + 1] then
          GuideMgr.curStepIndex = GuideMgr.curStepIndex + 1
          GuideMgr.curGroupStepIndex = 0
          print("切换下一条步骤组 后下一步骤id>>>>>>>>>>>>>", data.stepS[stepIndex + 1].basicStep[GuideMgr.curGroupStepIndex])
        else
          GuideMgr.GuidePlayEnd()
        end
      end
    end
  end
  print("  触发引导id ", GuideMgr.curTriggerId, "    步骤组索引", GuideMgr.curStepIndex, "     步骤", GuideMgr.curGroupStepIndex, ">>>>>>>>>")
end

function GuideMgr.AfterShownFunc(name)
  if GuideMgr.jumpNewHand == true then
    return
  end
  if name == WinResConfig.GuideWindow.name or name == WinResConfig.NetCheckWindow.name or name == WinResConfig.GuidePicLookWindow.name or name == WinResConfig.NoticeWindow.name or name == WinResConfig.LoginLoadingWindow.name or name == WinResConfig.BattleLoadingWindow.name or name == WinResConfig.CurrencyWindow.name or name == WinResConfig.GetItemTipsWindow.name then
    return
  end
  UIMgr:SetUILayerTouchable(false)
  print(name, GuideMgr.curGuideIsPlay, GuideMgr.curTriggerId, GuideMgr.curStepIndex, GuideMgr.curGroupStepIndex, ">>>>>>")
  local trigger = false
  if GuideMgr.curGuideIsPlay then
    local nextData = GuideMgr.GetNextStepData()
    if nextData then
      if name == WinResConfig.OpenTitleWindow.name then
        local nextStepData = GuideMgr.GetNextStepData()
        if nextStepData and nextStepData.type == GUIDE_STEP_TYPE_ENUM.PLOT_GUIDE and nextStepData.story_id then
          GuideMgr.waitStoryId = nextStepData.story_id
          GuideMgr.ListenCompleteFunc = nil
          UIMgr:SetUILayerTouchable(true)
          return
        end
      end
      if curStepData and nextData.id == curStepData.id and curStepData.type ~= GUIDE_STEP_TYPE_ENUM.LV_BACK and (nil == curStepData.auto_open_window_func or nil == curStepData.window_name or nil == curStepData.ctrl_id) then
        UIMgr:SetUILayerTouchable(true)
        return
      end
      local captionTrigger = false
      local storyTrigger = false
      if nextData.window_name == "Boss" then
        captionTrigger = nextData.caption_id and (nil == nextData.window_name or GuideMgr.IsBossWindow(name))
        storyTrigger = nil == nextData.window_name or GuideMgr.IsBossWindow(name)
      else
        captionTrigger = nextData.caption_id and (nil == nextData.window_name or nextData.window_name == name)
        storyTrigger = nextData.story_id and (nil == nextData.window_name or nextData.window_name == name)
      end
      if captionTrigger or nextData.window_name == name or nextData.type == GUIDE_STEP_TYPE_ENUM.LV_BACK or AdventureMgr.GetPlayEndChapterId() or storyTrigger then
        curStepData = nextData
        trigger = true
      end
    end
  else
    trigger = GuideMgr.CheckIsTriggerGuide(name)
    if trigger then
      GuideMgr.guideBol = true
      GuideMgr.reconnectionBol = false
      ActorService.FinishGuideReq(GuideMgr.curTriggerId, curStepData.id)
    end
  end
  GuideMgr.curGuideIsPlay = trigger
  if trigger then
    if GuideMgr.reconnectionBol and curStepData.type == GUIDE_STEP_TYPE_ENUM.PLOT_GUIDE and 0 == GuideMgr.curGroupStepIndex and name == WinResConfig.HomeWindow.name then
      GuideMgr.delayWin = true
      ld("PlotPlay", function()
        PlotPlayMgr.PlayPlot(curStepData.story_id, nil, nil, function()
          GuideMgr.Next()
        end, true, nil, PLOT_PLAY_TYPE.GUIDE)
      end)
      UIMgr:SetUILayerTouchable(true)
      return
    end
    GuideMgr.PlayGuide()
    return
  else
    if WinResConfig.HomeWindow.name == name and GuideMgr.delayWin and not GuideMgr.guideBol and AdventureData.IsStagePassed(50110106) then
      LeanTween.delayedCall(0.2, function()
        GuideMgr.delayWin = nil
        FunctionQueueUtil.Start()
      end)
    end
    if UIMgr:IsWindowOpen(WinResConfig.GuideWindow.name) then
      GuideMgr.CloseWindow()
    end
    UIMgr:SetUILayerTouchable(true)
  end
end

function GuideMgr.PlayGuideCaption(captionId, callback, waitTime)
  local config = TableData.GetConfig(captionId, "BaseGuideCaption")
  if config then
    GuideMgr.HideWindow()
    WindowLoadPackages[WinResConfig.GuidePicLookWindow.name] = {
      "Guide_" .. Language.curLanguage
    }
    LeanTween.delayedCall(waitTime or 0.3, function()
      OpenWindow(WinResConfig.GuidePicLookWindow.name, nil, captionId, callback)
      UIMgr:SetUILayerTouchable(true)
    end)
  else
    UIMgr:SetUILayerTouchable(true)
  end
end

function GuideMgr.GetProcessDataById(id)
  for i, v in pairs(guideProcessData) do
    if v.id == id then
      return v
    end
  end
end

function GuideMgr.GetNextStepData(index)
  local groupStepIndex = index or GuideMgr.curGroupStepIndex
  local stepIndex = GuideMgr.curStepIndex
  local data = GuideMgr.GetProcessDataById(GuideMgr.curTriggerId)
  if 0 == GuideMgr.curTriggerId or nil == data then
    return
  end
  groupStepIndex = groupStepIndex + 1
  local stepArr = GuideMgr.reconnectionBol and data.stepS[stepIndex].specialStep or data.stepS[stepIndex].basicStep
  if groupStepIndex > #stepArr then
    stepIndex = stepIndex + 1
    if stepIndex > #data.stepS then
      return
    end
    groupStepIndex = 1
    stepArr = data.stepS[stepIndex].basicStep
  end
  local id = stepArr[groupStepIndex]
  if nil == id then
    return
  end
  local stepData = TableData.GetConfig(id, "BaseGuideStep")
  if stepData then
    print("获取即将引导的步骤（GetNextStepData）", id)
    if stepData.skipId and GuideData.GuideIsEnd(GuideMgr.curTriggerId, stepData.skipId) then
      if stepData.auto_open_window_func then
        stepData.auto_open_window_func()
      end
      print("跳过的id>>>>>>>>>>>>>>>>>", stepData.id)
      curStepData = stepData
      GuideMgr.AddIndex()
      GuideMgr.GetNextStepData()
    end
    return stepData
  end
end

function GuideMgr.SetStepData(stepData)
  if stepData then
    curStepData = stepData
  end
end

function GuideMgr.GetStepData()
  return curStepData
end

function GuideMgr.IsGuideEnd(triggerId, step)
  local processData = GuideMgr.GetProcessDataById(triggerId)
  if 0 == triggerId or nil == processData then
    return true
  end
  local data = processData.stepS[#processData.stepS]
  if data then
    local id = data.basicStep[#data.basicStep]
    if id then
      return id == step
    end
  end
  return nil
end

function GuideMgr.IsTrigger(guideData, name)
  if guideData and name then
    if guideData.windowName and guideData.windowName == "Boss" and name and GuideMgr.IsBossWindow(name) then
      return guideData.id
    end
    if (guideData.level == nil or guideData.level == ActorData.GetLevel()) and (string.isEmptyOrNil(guideData.windowName) or guideData.windowName == name) and (nil == guideData.feature or ActorData.GetFeatureIsUnlock(guideData.feature)) and (nil == guideData.stage or guideData.stage == tempStage) and (nil == guideData.open_func or guideData.open_func()) then
      return guideData.id
    end
  end
end

function GuideMgr.IsBossWindow(name)
  if name == WinResConfig.BossDungeonFireWindow.name or name == WinResConfig.BossDungeonWaterWindow.name or name == WinResConfig.BossDungeonWoodWindow.name then
    return true
  end
end

local GetTriggerProcess = function(name)
  local id
  for i, v in pairs(guideProcessData) do
    id = GuideMgr.IsTrigger(v, name)
    if id then
      return id
    end
  end
end

function GuideMgr.CheckIsTriggerGuide(name)
  local triggerId = GetTriggerProcess(name)
  if triggerId and 0 ~= triggerId then
    GuideMgr.curTriggerId = triggerId
    GuideMgr.curStepIndex = 1
    GuideMgr.curGroupStepIndex = 0
    GuideMgr.reconnectionBol = false
    print("CheckIsTriggerGuide>>触发新引导>>>>", GuideMgr.curTriggerId)
    curStepData = GuideMgr.GetNextStepData()
    if curStepData then
      return true
    end
  end
  return false
end

function GuideMgr.CheckJumpGuide(name)
  local info = ActorData.GetGuideInfo()
  local IsHave = function(id)
    for i, v in pairs(info) do
      if v.guideId == id then
        return true
      end
    end
  end
  local maxLv = 0
  local data
  for i, v in pairs(info) do
    data = TableData.GetConfig(v.guideId, "BaseGuideProcess")
    if data and data.level and maxLv < data.level then
      maxLv = data.level
    end
  end
  local temp = {}
  local lv
  for i, v in pairs(guideProcessData) do
    if not IsHave(v.id) and v.level and maxLv < v.level and (string.isEmptyOrNil(v.windowName) or v.windowName == name) and v.level and v.level <= ActorData.GetLevel() and (v.feature == nil or ActorData.GetFeatureIsUnlock(v.feature)) and (nil == v.stage or v.stage == tempStage) then
      if nil == lv then
        lv = v.level
      elseif lv < v.level then
        lv = v.level
      end
      temp[v.level] = v
    end
  end
  if lv and table.getLen(temp) > 0 and temp[lv] then
    print(">>>>>>CheckJumpGuide>", lv, temp[lv].id)
    return temp[lv].id
  end
end

function GuideMgr.NeedShowSpecialGuide()
  return AdventureData.IsStagePassed(50110105) == false
end

function GuideMgr.NeedShowBattleSettingBtn()
  return AdventureData.IsStagePassed(50110106)
end

function GuideMgr.PlayGuideProcess(id)
  if GuideMgr.jumpNewHand == true then
    return false
  end
  GuideMgr.curTriggerId = id
  GuideMgr.curGroupStepIndex = 0
  GuideMgr.curGuideIsPlay = true
  GuideMgr.guideBol = true
  if true == GuideMgr.IsGuideEnd(id, GuideMgr.curStepId) then
    curStepData = TableData.GetConfig(GuideMgr.curStepId, "BaseGuideStep")
    if curStepData and 1 == curStepData.manual_play then
      return GuideMgr.Next()
    else
      return false
    end
  end
  local data = GuideMgr.GetNextStepData()
  if data and 1 == data.manual_play then
    GuideMgr.PlayStep(data)
    return true
  end
  return false
end

function GuideMgr.PlayGuide()
  if curStepData then
    GuideMgr.curGuideIsPlay = true
    GuideMgr.curStepId = curStepData.id
    print("PlayGuide>>>>>>>>>>>>>>>>>>>>>>>>>>>>", GuideMgr.curStepId)
    if curStepData.open_func and curStepData.fail_caption_id then
      local open = curStepData.open_func()
      print(open, ">>>>>>>>>>RaidBoss IsInProgress>>>>>>>>>>>>>>")
      if not open then
        GuideMgr.PlayGuideCaption(curStepData.fail_caption_id, function()
          GuideMgr.QuitPictureOrStory()
        end, curStepData.waitTime)
      else
        local date = TableData.GetConfig(GuideMgr.curTriggerId, "BaseGuideProcess")
        if date and date.open_func and curStepData.caption_id then
          GuideMgr.PlayGuideCaption(curStepData.caption_id, function()
            GuideMgr.QuitPictureOrStory()
          end, curStepData.waitTime)
        else
          GuideMgr.QuitPictureOrStory()
        end
      end
      return
    end
    UIMgr:SetUILayerTouchable(false)
    if curStepData.story_id and AdventureMgr.GetPlayEndChapterId() == nil and curStepData.type == GUIDE_STEP_TYPE_ENUM.PLOT_GUIDE then
      GuideMgr.waitStoryId = curStepData.story_id
      LeanTween.delayedCall(0.25, function()
        ld("PlotPlay", function()
          PlotPlayMgr.PlayPlot(GuideMgr.waitStoryId, nil, nil, function()
            GuideMgr.waitStoryId = nil
            GuideMgr.QuitPictureOrStory()
          end, true, nil, PLOT_PLAY_TYPE.GUIDE)
        end)
        UIMgr:SetUILayerTouchable(true)
      end)
      return
    end
    if curStepData.caption_id then
      if curStepData.trigger_in_battle == "before_start" then
        ld("Battle")
        
        function BattleMgr.beforeBattleCallback(callback)
          GuideMgr.PlayGuideCaption(curStepData.caption_id, function()
            BattleControl.Continue()
            if callback then
              callback()
            end
            GuideMgr.QuitPictureOrStory()
          end, 0)
          BattleControl.Pause()
        end
      else
        GuideMgr.PlayGuideCaption(curStepData.caption_id, function()
          GuideMgr.QuitPictureOrStory()
        end, curStepData.waitTime)
      end
      return
    end
    local waitTime = curStepData.waitTime or 0
    print("PlayGuide>>>>>>>>>>>>>>>>>>>>>>>>>>>>", GuideMgr.curStepId)
    if 1 == curStepData.continue_battle then
      ld("Battle")
      BattleControl.Continue()
    end
    if waitTween then
      LeanTween.cancel(waitTween.uniqueId)
      waitTween = nil
    end
    local callback = function()
      waitTween = nil
      UIMgr:SetUILayerTouchable(true)
      if curStepData then
        local completeFunc = curStepData.listen_complete_func
        if completeFunc then
          if true == completeFunc() then
            GuideMgr.Next()
            GuideMgr.Refresh()
            return
          end
          GuideMgr.ListenCompleteFunc = curStepData.listen_complete_func
        else
          GuideMgr.ListenCompleteFunc = nil
        end
        if curStepData.type == GUIDE_STEP_TYPE_ENUM.HIDE_GUIDE_WINDOW or curStepData.type == GUIDE_STEP_TYPE_ENUM.PLOT_GUIDE then
          GuideMgr.HideWindow()
          return
        end
        if curStepData.type == GUIDE_STEP_TYPE_ENUM.LV_BACK then
          print(UIMgr:GetTopWindow(), "GetTopWindow>>>>")
          local win = LuaUtil.FindUIChild(GRoot.inst, UIMgr:GetTopWindow())
          win = win and LuaUtil.FindUIChild(win, "CurrencyReturn")
          if win then
            GuideMgr.SafeOpenGuideWindow()
          else
            GuideMgr.HideWindow()
            return
          end
        elseif curStepData.type == GUIDE_STEP_TYPE_ENUM.PLOT_STAGE then
          local stage = curStepData.plot_stage
          if stage then
            local stageConfig = TableData.GetConfig(stage, "BaseStage")
            if stageConfig then
              ld("PlotPlay", function()
                PlotPlayMgr.PlayPlot(stageConfig.story_id, nil, nil, function()
                  ld("Battle", function()
                    local sendMsg = {}
                    sendMsg.stageId = stageConfig.id
                    sendMsg.win = true
                    sendMsg.sceneType = ProtoEnum.SCENE_TYPE.MAIN_LINE
                    BattleMgr.SendBattleOverMsg(sendMsg)
                  end)
                end, nil, nil, PLOT_PLAY_TYPE.MAIN_LINE)
              end)
            end
          end
        elseif curStepData.type == GUIDE_STEP_TYPE_ENUM.LISTEN_COMPLETE then
        else
          GuideMgr.curTriggerWindowName = curStepData.window_name
          GuideMgr.SafeOpenGuideWindow(curStepData.show_immediately)
          if curStepData.type == GUIDE_STEP_TYPE_ENUM.SKILL_HINT then
            if nil == curStepData.ctrl_id and curStepData.trigger_in_battle ~= "now" then
              GuideMgr.HideWindow()
              print("HideWindow>>>>>>>>>>>>>>>>", curStepData.window_name)
            end
          elseif curStepData.type == GUIDE_STEP_TYPE_ENUM.GIRD and (curStepData.trigger_in_battle == "burst_card_show_2" or curStepData.trigger_in_battle == "burst_card_show_3" or curStepData.trigger_in_battle == "burst_card_show_4") then
            GuideMgr.HideWindow()
          end
          if curStepData.trigger_in_battle == "before_start" then
            ld("Battle")
            
            function BattleMgr.beforeBattleCallback(callback)
              GuideMgr.SafeOpenGuideWindow()
              if callback then
                callback()
              end
              BattleControl.Pause()
            end
          elseif curStepData.trigger_in_battle == "burst_sp_enough_hint" then
            BattleControl.Pause()
          elseif curStepData.trigger_in_battle == "burst_skill_remain_hint" then
            GuideMgr.SafeOpenGuideWindow()
            BattleControl.Pause()
          end
        end
      end
    end
    if 1 == curStepData.show_immediately then
      callback()
    else
      waitTween = LeanTween.delayedCall(waitTime, callback):setIgnoreTimeScale(true)
    end
  end
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_REFRESH_GUIDE)
end

function GuideMgr.SafeOpenGuideWindow(show_immediately)
  if UIMgr:IsWindowOpen(WinResConfig.GuideWindow.name) == false then
    if 1 == show_immediately then
      OpenWindowImmediately(WinResConfig.GuideWindow.name, UILayer.Guide)
    else
      OpenWindow(WinResConfig.GuideWindow.name, UILayer.Guide)
    end
  else
    UIMgr:SendWindowMessage(WinResConfig.GuideWindow.name, WindowMsgEnum.GuideWindow.REINIT)
  end
end

function GuideMgr.PlayStep(stepData)
  if stepData.window_name and UIMgr:IsWindowOpen(stepData.window_name) then
    curStepData = stepData
    GuideMgr.PlayGuide()
  elseif stepData.type and stepData.type == GUIDE_STEP_TYPE_ENUM.LV_BACK then
    curStepData = stepData
    GuideMgr.PlayGuide()
  elseif stepData.caption_id and stepData.manual_play and (stepData.window_name == nil or UIMgr:IsWindowOpen(stepData.window_name)) then
    curStepData = stepData
    GuideMgr.PlayGuide()
  elseif nil == AdventureMgr.GetPlayEndChapterId() and stepData.type == GUIDE_STEP_TYPE_ENUM.PLOT_GUIDE and stepData.manual_play then
    curStepData = stepData
    GuideMgr.PlayGuide()
  elseif stepData.auto_open_window_func then
    stepData.auto_open_window_func()
  elseif stepData.direct_play and 1 == stepData.direct_play then
    curStepData = stepData
    GuideMgr.PlayGuide()
  end
end

function GuideMgr.RemoveProcessDataById(id)
  for i, v in pairs(guideProcessData) do
    if v.id == id then
      guideProcessData[i] = nil
    end
  end
end

function GuideMgr.TestListenCompleteFunc()
  if curStepData then
    local func = curStepData.listen_complete_func
    if func and true == func() then
      GuideMgr.ListenCompleteFunc = nil
      UIMgr:SendWindowMessage(WinResConfig.GuideWindow.name, WindowMsgEnum.GuideWindow.PUT_BACK)
      GuideMgr.Next()
    end
  end
end

function GuideMgr.Next()
  print("GuideMgr.Next>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
  if nil == curStepData or 1 ~= curStepData.keep_show then
    GuideMgr.HideWindow()
  end
  local bol = GuideMgr.SaveGuideProgress()
  local playNextStep = function()
    local data = GuideMgr.GetNextStepData()
    if data then
      if data.jump then
        local uiMain = GuideMgr.InitUiRoot(data.window_name)
        local clickCtr = GuideMgr.FindComponentByPath(uiMain, data.ctrl_id)
        if clickCtr then
          curStepData = data
          clickCtr.onClick:Call()
          GuideMgr.Next()
        end
      else
        GuideMgr.PlayStep(data)
      end
    end
  end
  if bol then
    printWarning("结束当前引导>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>", GuideMgr.curTriggerId)
    GuideMgr.RemoveProcessDataById(GuideMgr.curTriggerId)
    GuideMgr.guideBol = false
    local curProcess = TableData.GetConfig(GuideMgr.curTriggerId, "BaseGuideProcess")
    if curProcess.next_process then
      GuideMgr.curTriggerId = curProcess.next_process
      GuideMgr.curStepIndex = 1
      GuideMgr.curGroupStepIndex = 0
      GuideMgr.curGuideIsPlay = true
      GuideMgr.guideBol = true
      playNextStep()
      return true
    else
      GuideMgr.GuidePlayEnd()
      GuideMgr.CloseWindow()
      if curProcess.showAbyssTips then
        if AdventureMgr.GetPlayEndChapterId() then
          GuideMgr.openAbyssTips = true
        else
          LeanTween.delayedCall(0.25, function()
            OpenWindow(WinResConfig.AbyssButtonTipsWindow.name, UILayer.Guide, true)
          end)
        end
      end
      return false
    end
  else
    GuideMgr.AddIndex()
    playNextStep()
    return true
  end
end

function GuideMgr.SaveGuideProgress(triggerId, stepId)
  stepId = stepId or curStepData.id
  triggerId = triggerId or GuideMgr.curTriggerId
  ActorService.FinishGuideReq(triggerId, stepId)
  if GuideMgr.IsGuideEnd(triggerId, stepId) then
    local config = TableData.GetConfig(triggerId, "BaseGuideProcess")
    if config then
      local stepKey = GuideData.GetLastKey(config)
      if not GuideData.GuideIsEnd(triggerId, stepKey) then
        ActorService.FinishGuideReq(triggerId, stepKey)
      end
    end
    return true
  else
    return false
  end
end

function GuideMgr.FindComponent(component, childName)
  local child
  if component then
    local numChildren = component.numChildren
    if numChildren then
      for i = 0, numChildren - 1 do
        if component.GetChildAt then
          child = component:GetChildAt(i)
          if child.gameObjectName == childName then
            return child
          end
          child = GuideMgr.FindComponent(child, childName)
          if nil ~= child then
            return child
          end
        end
      end
    end
  end
end

function GuideMgr.FindComponentByPath(uiMain, path)
  local child = uiMain
  if nil == child then
    return
  end
  if string.isEmptyOrNil(path) and child then
    return child
  end
  local p = {}
  local fun = function(str)
    if string.find(str, "/") then
      p = Split(str, "/")
    else
      p = {str}
    end
  end
  local type
  if string.find(path, "|") then
    local arr = Split(path, "|")
    local temp = ""
    for i, v in pairs(arr) do
      temp = Split(v, ":")
      if nil == type and temp[3] then
        type = PlayerPrefsUtil.GetInt(temp[3])
      end
      if temp[2] and type and tonumber(temp[2]) == type then
        fun(temp[1])
      end
    end
  else
    fun(path)
  end
  if #p < 1 then
    GuideMgr.Log("配置路径错误>>", path)
    return
  end
  if child then
    for i = 1, #p do
      child = child:GetChild(p[i]) or GuideMgr.FindChildByName(child, p[i])
      if nil == child then
        printWarning("路径错误拉>>>检查配置哈>>>>>>>>>>", path, i, p[i])
        if "10000104" == p[3] then
          UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_GUIDE_SCROLL_TO_VIEW, p[3])
          child = GuideMgr.FindComponent(uiMain, p[#p])
        else
          child = GuideMgr.FindComponent(uiMain, p[#p])
        end
        if nil == child then
          GuideMgr.Log("配置路径错误>>", path)
          return
        end
        break
      end
    end
  end
  return child
end

function GuideMgr.FindChildByName(component, childName)
  local child
  if component then
    local numChildren = component.numChildren
    if numChildren then
      for i = 0, numChildren - 1 do
        if component.GetChildAt then
          child = component:GetChildAt(i)
          if child.gameObjectName == childName then
            return child
          end
        end
      end
    end
  end
end

function GuideMgr.InitUiRoot(windowName)
  local win = LuaUtil.FindUIChild(GRoot.inst, windowName)
  if win then
    return LuaUtil.FindUIChild(win, "Main")
  end
  if nil == win then
    GuideMgr.Log(windowName, " 未找到组件")
  end
end

function GuideMgr.IsStageComplete(stageId)
  return AdventureData.IsStagePassed(stageId)
end

function GuideMgr.IsBurstEnergyFull()
  ld("Battle")
  local leftBadge = BattleScene.GetBurst(BATTLE_CAMP_FLAG.LEFT)
  if leftBadge then
    local state = leftBadge:GetEnergySkillState()
    return state == BATTLE_BURST_STATE.TO_BE_ACTIVATED_ENABLE
  end
end

function GuideMgr.IsBurstActive()
  ld("Battle")
  local leftBadge = BattleScene.GetBurst(BATTLE_CAMP_FLAG.LEFT)
  if leftBadge then
    local state = leftBadge:GetEnergySkillState()
    return state == BATTLE_BURST_STATE.ACTIVATED
  end
end

function GuideMgr.IsCtrlCreated(window_name, ctrl_id)
  local uiMain = GuideMgr.InitUiRoot(window_name)
  local clickCtr = GuideMgr.FindComponentByPath(uiMain, ctrl_id)
  return nil ~= clickCtr
end

function GuideMgr.BurstChooseCardCount(num)
  ld("Battle")
  local leftBadge = BattleScene.GetBurst(BATTLE_CAMP_FLAG.LEFT)
  local state = leftBadge:GetEnergySkillState()
  return state == BATTLE_BURST_STATE.ACTIVATED and num <= #leftBadge.waitDealCardBurstSkillList
end

function GuideMgr.IsCtrlCanTouch(window_name, ctrl_id)
  local uiMain = GuideMgr.InitUiRoot(window_name)
  local clickCtr = GuideMgr.FindComponentByPath(uiMain, ctrl_id)
  return nil ~= clickCtr and clickCtr.touchable == true
end

function GuideMgr.IsCardLvUp(cardId, lv, exp)
  return CardMgr.CardLvIsUp(cardId, lv, exp)
end

function GuideMgr.CardLvIsEqual(cardId, lv)
  return CardMgr.CardLvIsEqual(cardId, lv)
end

function GuideMgr.IsWindowOpen(windowName)
  return UIMgr:IsWindowOpen(windowName)
end

function GuideMgr.OpenFormationWindow(stageId)
  local stageConfig = TableData.GetConfig(stageId, "BaseStage")
  if stageConfig then
    local params = {
      sceneType = stageConfig.chapter_type,
      stageId = stageConfig.id
    }
    ld("Formation", function()
      FormationMgr.TryOpenFormationWindow(params)
    end)
  end
end

function GuideMgr.OpenPlotDungeonWindow(stageId)
  if not UIMgr:IsWindowInList(WinResConfig.PlotDungeonWindow.name) then
    OpenWindow(WinResConfig.PlotDungeonWindow.name)
  end
end

function GuideMgr.IsInRaidBoss()
  return RaidBossMgr.IsInProgress()
end

function GuideMgr.GuidePlayEnd()
  GuideMgr.curGuideIsPlay = false
  GuideMgr.ListenCompleteFunc = nil
end

function GuideMgr.QuitPictureOrStory()
  GuideMgr.AddIndex()
  local bol = GuideMgr.SaveGuideProgress()
  if bol then
    GuideMgr.guideBol = false
    printWarning("结束当前引导>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>", GuideMgr.curTriggerId)
    GuideMgr.RemoveProcessDataById(GuideMgr.curTriggerId)
    local curProcess = TableData.GetConfig(GuideMgr.curTriggerId, "BaseGuideProcess")
    if curProcess and curProcess.showAbyssTips then
      if AdventureMgr.GetPlayEndChapterId() then
        GuideMgr.openAbyssTips = true
      else
        LeanTween.delayedCall(0.25, function()
          OpenWindow(WinResConfig.AbyssButtonTipsWindow.name, UILayer.Guide, true)
        end)
      end
    end
    GuideMgr.GuidePlayEnd()
  end
  GuideMgr.Refresh()
  if bol and GuideMgr.guideBol == false then
    GuideMgr.CloseWindow()
  end
end

function GuideMgr.HideWindow()
  if UIMgr:IsWindowOpen(WinResConfig.GuideWindow.name) then
    UIMgr:HideWindow(WinResConfig.GuideWindow.name)
    UIMgr:SetUILayerTouchable(true)
  end
  GuideMgr.curTriggerWindowName = ""
end

function GuideMgr.CloseWindow()
  UIMgr:SetUILayerTouchable(true)
  UIMgr:CloseWindow(WinResConfig.GuideWindow.name)
  GuideMgr.curStepIndex = 1
  GuideMgr.curGroupStepIndex = 0
  GuideMgr.curPictureData = nil
  GuideMgr.curTriggerWindowName = ""
end
