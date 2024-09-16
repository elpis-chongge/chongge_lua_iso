PlotPlayMgr = {
  forcePlay = false,
  needStopWhenQuitReview = false,
  curPlotType = 0
}

function PlotPlayMgr.PlayFixedPlots(partIds)
  if partIds and #partIds > 0 then
    PlotPlayData.SetFixedPartIds(partIds)
    PlotPlayMgr.PlayPlot(partIds[1], nil, nil, nil, true)
  end
end

function PlotPlayMgr.PlayPlot(chapterId, sectionId, dialogId, chapterEndCallback, forcePlay, skip, plotPlayType)
  if UIMgr:IsWindowOpen(WinResConfig.PlotPlayEditorWindow.name) == true then
    UIMgr:HideWindow(WinResConfig.PlotPlayEditorWindow.name)
  end
  if chapterId and PlotPlayData.GetCurPartId() == chapterId and PlotPlayData.GetCurPartState() == PLOT_PLAY_STATE.PLAYING then
    return
  end
  if plotPlayType and plotPlayType ~= PLOT_PLAY_TYPE.NONE then
    PlotPlayMgr.curPlotType = plotPlayType
  end
  PlotPlayMgr.forcePlay = forcePlay
  if chapterId then
    PlotPlayData.SetCurPartId(chapterId)
  end
  PlotPlayData.SetCurSectionId(sectionId)
  PlotPlayData.SetCurDialogId(dialogId)
  PlotPlayData.SetPartEndCallback(chapterEndCallback)
  if true ~= PlotPlayMgr.forcePlay and PlotPlayData.IsPlotFinished(chapterId) then
    PlotPlayMgr.PlayPlotEnd()
    return
  end
  UIUtil.ChangeLoginScreenEffectOut()
  if nil == sectionId then
    PlotPlayData.SetCurSectionId(PlotPlayData.GetNextSectionId())
  end
  if nil == dialogId then
    PlotPlayData.SetCurDialogId(PlotPlayData.GetNextDialogId())
  end
  local callback = function(needSkip)
    local name = WinResConfig.PlotPlayWindow.name
    if UIMgr:IsWindowOpen(name) == false then
      SoundUtil.StopCurMusic()
      OpenWindow(name, UILayer.HUD1)
    else
      UIMgr:SendWindowMessage(name, WindowMsgEnum.PlotPlayWindow.CHANGE_PART, needSkip)
    end
  end
  local chapterConfig = TableData.GetConfig(chapterId, "BasePlotPart")
  if chapterConfig and chapterConfig.start_title then
    SoundUtil.StopCurMusic()
    OpenWindow(WinResConfig.PlotPlayStartWindow.name, UILayer.HUD1, callback)
  else
    callback(skip)
  end
end

function PlotPlayMgr.PlayPrologue(callback)
  local id = TableData.GetConfig(70010018, "BaseFixed").int_value
  local completePrologue = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.PROLOGUE_COMPLETE, PLAYER_PREF_DEFAULT_VALUE.PROLOGUE_COMPLETE)
  if completePrologue == tostring(id) then
    callback()
  else
    PlotPlayMgr.PlayPlot(id, nil, nil, function()
      PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.PROLOGUE_COMPLETE, tostring(id))
      callback()
    end, nil, nil, PLOT_PLAY_TYPE.MAIN_LINE)
  end
end

function PlotPlayMgr.GetSectionIdSkipTo()
  local curPartId = PlotPlayData.GetCurPartId()
  local partConfig = TableData.GetConfig(curPartId, "BasePlotPart")
  local curSectionId = PlotPlayData.GetCurSectionId()
  if curSectionId then
    local sectionIds = partConfig.section_ids
    local findCurSectionIndex
    for i, v in ipairs(sectionIds) do
      if v == curSectionId then
        findCurSectionIndex = i
      end
      if findCurSectionIndex then
        local sectionConfig = TableData.GetConfig(v, "BasePlotSection")
        if 1 == sectionConfig.skip_stop then
          local nextSectionId = sectionIds[i + 1]
          if nextSectionId then
            return nextSectionId
          end
        end
      end
    end
  end
end

function PlotPlayMgr.SkipPart(partId)
  PlotPlayData.SetCurPartId(partId)
  PlotPlayData.SetCurSectionId(PlotPlayData.GetNextSectionId())
  PlotPlayData.SetCurDialogId(PlotPlayData.GetNextDialogId())
  PlotPlayMgr.DealSkipProcess()
end

function PlotPlayMgr.DealSkipProcess()
  local skipToSectionId = PlotPlayMgr.GetSectionIdSkipTo()
  local dialogs = PlotPlayData.GetCurPartRewardDialogs(skipToSectionId)
  if PlotPlayMgr.forcePlay == true then
    PlotPlayMgr.PlayPlotEnd(true)
  elseif ActorData and ActorData.GetUin() and #dialogs > 0 then
    PlotPlayService.FinishPlotReq(nil, dialogs, true)
  else
    PlotPlayMgr.PlayPlotEnd(true)
  end
end

function PlotPlayMgr.PlayPlotEnd(skip)
  local curPartId = PlotPlayData.GetCurPartId()
  local partConfig = TableData.GetConfig(curPartId, "BasePlotPart")
  if skip then
    local nextSectionId = PlotPlayMgr.GetSectionIdSkipTo()
    if nextSectionId then
      PlotPlayMgr.PlayPlot(nil, nextSectionId, nil, PlotPlayData.GetPartEndCallback(), PlotPlayMgr.forcePlay, true)
      return
    end
  end
  PlotPlayData.SetCurPartState(PLOT_PLAY_STATE.END)
  if ActorData and ActorData.GetUin() and partConfig then
    PlotPlayService.FinishPlotReq(curPartId)
  end
  local endCallback = function(needSkip)
    local callback = PlotPlayData.GetPartEndCallback()
    local fixedPartIds = PlotPlayData.GetFixedPartIds()
    if fixedPartIds then
      local curIndex
      for i, v in ipairs(fixedPartIds) do
        if v == curPartId then
          curIndex = i
          break
        end
      end
      if curIndex then
        local nextPart = fixedPartIds[curIndex + 1]
        if nextPart then
          if true == needSkip then
            if 1 == partConfig.skip_stop then
              PlotPlayMgr.PlayPlot(nextPart, nil, nil, callback, PlotPlayMgr.forcePlay, needSkip)
            else
              PlotPlayMgr.SkipPart(nextPart)
            end
          else
            PlotPlayMgr.PlayPlot(nextPart, nil, nil, callback, PlotPlayMgr.forcePlay, needSkip)
          end
          return
        end
      end
    elseif partConfig and partConfig.next_part then
      local nextPartConfig = TableData.GetConfig(partConfig.next_part, "BasePlotPart")
      if nextPartConfig then
        if true == needSkip then
          if 1 == partConfig.skip_stop then
            PlotPlayMgr.PlayPlot(partConfig.next_part, nil, nil, callback, PlotPlayMgr.forcePlay, needSkip)
          else
            PlotPlayMgr.SkipPart(partConfig.next_part)
          end
        else
          PlotPlayMgr.PlayPlot(partConfig.next_part, nil, nil, callback, PlotPlayMgr.forcePlay, needSkip)
        end
        return
      end
    end
    PlotPlayData.ClearData()
    PlotPlayMgr.curPlotType = PLOT_PLAY_TYPE.NONE
    UIMgr:CloseWindow(WinResConfig.PlotPlayWindow.name)
    if callback then
      callback()
    end
    if true == UIMgr:IsWindowInList(WinResConfig.PlotPlayEditorWindow.name) then
      OpenWindow(WinResConfig.PlotPlayEditorWindow.name)
      return
    end
  end
  if partConfig and partConfig.end_title then
    if UIMgr:IsWindowOpen(WinResConfig.PlotPlayWindow.name) then
      OpenWindow(WinResConfig.PlotPlayEndWindow.name, UILayer.HUD1, function()
        endCallback(skip)
      end)
    else
      endCallback(skip)
    end
  else
    endCallback(skip)
  end
end

function PlotPlayMgr.ChangeToNextPlot()
  local nextDialogId = PlotPlayData.GetNextDialogId()
  if nil == nextDialogId then
    local nextSectionId = PlotPlayData.GetNextSectionId()
    if nextSectionId then
      PlotPlayData.SetCurSectionId(nextSectionId)
      PlotPlayData.SetCurDialogId(nil)
      nextDialogId = PlotPlayData.GetNextDialogId()
      if nextDialogId then
        PlotPlayData.SetCurDialogId(nextDialogId)
        UIMgr:SendWindowMessage(WinResConfig.PlotPlayWindow.name, WindowMsgEnum.PlotPlayWindow.CHANGE_SECTION, {sectionId = nextSectionId, dialogId = nextDialogId})
        return
      else
        PlotPlayMgr.PlayPlotEnd()
        return
      end
    else
      PlotPlayMgr.PlayPlotEnd()
      return
    end
  end
  PlotPlayData.SetCurDialogId(nextDialogId)
  UIMgr:SendWindowMessage(WinResConfig.PlotPlayWindow.name, WindowMsgEnum.PlotPlayWindow.CHANGE_DIALOG, {dialogId = nextDialogId})
end

function PlotPlayMgr.GetLive2DInfo(live2DModel)
  local info = {}
  info.ExpCtrl = live2DModel.transform:GetComponentInChildren(typeof(CS.Live2D.Cubism.Framework.Expression.CubismExpressionController))
  info.Expression = {}
  info.Pose = {}
  if info.ExpCtrl == nil then
    return
  end
  local subCount = info.ExpCtrl.ExpressionsList.CubismExpressionObjects.Length
  for i = 0, subCount - 1 do
    if nil ~= info.ExpCtrl.ExpressionsList.CubismExpressionObjects[i] then
      info.Expression[info.ExpCtrl.ExpressionsList.CubismExpressionObjects[i].name:gsub(".exp3", "")] = i
    end
  end
  if nil ~= info.ExpCtrl.PoseList then
    subCount = info.ExpCtrl.PoseList.CubismExpressionObjects.Length
    for i = 0, subCount - 1 do
      if nil ~= info.ExpCtrl.PoseList.CubismExpressionObjects[i] then
        info.Pose[info.ExpCtrl.PoseList.CubismExpressionObjects[i].name:gsub(".exp3", "")] = i
      end
    end
  end
  return info
end

function PlotPlayMgr.GetSpineInfo(spineModel)
  local info = {}
  local animationList = SkeletonAnimationUtil.GetAllAnimationName(spineModel)
  animationList = animationList and ListToTable(animationList)
  info.Pose = {}
  for i, v in ipairs(animationList) do
    info.Pose[v] = v
  end
  local skinList = SkeletonAnimationUtil.GetAllSkinName(spineModel)
  skinList = skinList and ListToTable(skinList)
  info.Skin = {}
  for i, v in ipairs(skinList) do
    if "default" ~= v then
      info.Skin[v] = v
    end
  end
  return info
end

function PlotPlayMgr.RenderToHolder(roleInfo)
  local holder = roleInfo.holder
  local model = roleInfo.model
  if holder and model then
    holder:SetXY(holder.parent.width / 2, holder.parent.height / 2)
    if roleInfo.useStaticCard then
      UIUtil.SetObjectToUI(model, holder, roleInfo.scaleRatio, nil, true)
    else
      UIUtil.SetObjectToUI(model, holder, roleInfo.scaleRatio)
    end
    if roleInfo.position then
      LuaUtil.SetLocalPos(model, roleInfo.position)
    end
  end
end

function PlotPlayMgr.RenderToLoaderRT(roleInfo)
  if roleInfo.model == nil then
    return
  end
  local model = roleInfo.model
  local cardShow = roleInfo.cardShow
  local loader = roleInfo.loader
  loader.height = loader.parent.height
  loader.width = loader.parent.width
  cardShow.xy = Vector2.zero
  RTManager:ShowModelToLoader(loader, model, 1, 1, 1)
end

function PlotPlayMgr.ReleaseFromRT(roleInfo, dispose)
  if roleInfo.model then
    roleInfo.model.transform:SetParent(roleInfo.holder.displayObject.cachedTransform)
    if dispose then
      DialogTimeline.RemoveTimeline(roleInfo.model)
    end
  end
  RTManager:ReleaseModelFromLoader(roleInfo.loader)
end

function PlotPlayMgr.ShowPlotReview(com, startPart, curSection, curDialog)
  PlotPlayMgr.needStopWhenQuitReview = false
  local list = com:GetChild("ReviewTalkList")
  list:RemoveChildrenToPool()
  local allDialog = {}
  PlotPlayData.GetDialogs(startPart, curSection, curDialog, allDialog)
  
  function list.itemProvider(index)
    local dialog = allDialog[index + 1]
    return dialog.url
  end
  
  function list.itemRenderer(index, item)
    local data = allDialog[index + 1]
    local dialogConfigs = data.dialogConfigs
    local nameTxt = item:GetChild("NameTxt")
    if nameTxt then
      local config1 = dialogConfigs[1]
      local name = ""
      local speakHeadId = data.speakHeadId
      if config1.speak_name then
        name = config1.speak_name()
      elseif speakHeadId then
        local headConfig = TableData.GetConfig(speakHeadId, "BasePlotHead")
        name = headConfig.name()
      end
      nameTxt.text = name
    end
    local head = item:GetChild("Head")
    if head then
      local headIds = {}
      local roleIds = {}
      head:RemoveChildren()
      if data.reviewHead then
        local idsString = Split(data.reviewHead, ":")
        for i, v in ipairs(idsString) do
          table.insert(headIds, tonumber(v))
        end
      elseif data.speakHeadId then
        headIds = {
          data.speakHeadId
        }
      elseif data.speakRoleId then
        roleIds = {
          data.speakRoleId
        }
      elseif data.speakRoleIds then
        roleIds = data.speakRoleIds
      end
      local count = 1
      for _, headId in ipairs(headIds) do
        local headConfig = TableData.GetConfig(headId, "BasePlotHead")
        if headConfig then
          local headCom = UIMgr:CreateComponent("PlotPlay", "PlayerHead")
          head:AddChildAt(headCom, 0)
          headCom:GetChild("PlayerHeadBg"):GetChild("PicLoader").url = UIUtil.GetResUrl(headConfig.head_icon)
          headCom:SetXY((count - 1) * 5, (count - 1) * 5)
          count = count + 1
        end
      end
      for _, roleId in ipairs(roleIds) do
        local roleConfig = TableData.GetConfig(roleId, "BasePlotRole")
        if roleConfig then
          local headCom = UIMgr:CreateComponent("PlotPlay", "PlayerHead")
          head:AddChildAt(headCom, 0)
          headCom:GetChild("PlayerHeadBg"):GetChild("PicLoader").url = UIUtil.GetResUrl(roleConfig.head_icon)
          headCom:SetXY((count - 1) * 5, (count - 1) * 5)
          count = count + 1
        end
      end
    end
    local wordList = item:GetChild("WordList")
    if wordList then
      wordList:RemoveChildrenToPool()
      
      function wordList.itemRenderer(wordIndex, wordItem)
        local config = dialogConfigs[wordIndex + 1]
        if config.talk_text then
          wordItem:GetChild("WordTxt").text = config.talk_text()
        elseif config.middle_text then
          wordItem:GetChild("WordTxt").text = config.middle_text()
        elseif config.narrator_text then
          wordItem:GetChild("WordTxt").text = config.narrator_text()
        elseif config.cg_text then
          wordItem:GetChild("WordTxt").text = config.cg_text()
        end
        local btn = wordItem:GetChild("VoicePlayBtn")
        if btn then
          if config.text_sound_path then
            btn.visible = true
            btn.onClick:Set(function()
              PlotPlayMgr.needStopWhenQuitReview = true
              UIMgr:SendWindowMessage(WinResConfig.PlotPlayWindow.name, WindowMsgEnum.PlotPlayWindow.PLAY_VOICE, config.id)
            end)
          else
            btn.visible = false
          end
        end
      end
      
      wordList.numItems = #dialogConfigs
      wordList:ResizeToFit()
    end
    local wordTxt = item:GetChild("WordTxt")
    if wordTxt then
      local config = dialogConfigs[1]
      if config.talk_text then
        wordTxt.text = config.talk_text()
      elseif config.middle_text then
        wordTxt.text = config.middle_text()
      elseif config.narrator_text then
        wordTxt.text = config.narrator_text()
      end
    end
  end
  
  list.numItems = #allDialog
  list:ScrollToView(list.numItems - 1)
end

function PlotPlayMgr.PlayVoice(dialogId)
  local dialogConfig = TableData.GetConfig(dialogId, "BasePlotDialog")
  local eventPath = Language.ReplaceLanguageVoicePath(dialogConfig.text_sound_path)
  if eventPath then
    local bank = Language.ReplaceLanguageVoicePath(dialogConfig.text_sound_bank)
    return SoundUtil.PlayVoice(eventPath, bank)
  end
end
