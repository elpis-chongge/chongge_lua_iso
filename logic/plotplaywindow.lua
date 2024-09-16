require("PlotPlay_PlotPlayWindowByName")
local PlotPlayWindow = {}
local uis, contentPane, typingEffectTalk, typingEffectMiddle, typingEffectNarrator, curTypingEffect
local typingInterval = 0.05
local typingSpeedUpInterval = 0.001
local speakChangeInterval = 0.2
local changeDialogTouchableDelayTime = 0.5
local colorSpeak = Color(1, 1, 1, 1)
local colorNoSpeak = Color(0.7, 0.7, 0.7, 1)
local curBackgroundId, curRoleHeadId, curRoleHeadObject
local curRoleTable = {}
local curBackgroundTable = {}
local roleEffectInTime = 0
local roleEffectOutTime = 0
local bgEffectInTime = 0
local bgEffectOutTime = 0
local skipTips, skipCancelBtn, sureBtn, lastDialogId, lastSectionId, curDialogId, curSectionId, curPartId, touchEnable, canSkip, autoUpdateEnable, isPlotPlaying, plotWaitTime
local roleActionDirectors = {}
local animationObject
DialogTimeline = CS.DialogTimeline
local DirectorWrapMode = CS.UnityEngine.Playables.DirectorWrapMode
local PlayState = CS.UnityEngine.Playables.PlayState
local StoryUtil = CS.StoryUtil
local tempMouthTimer
local tempSimulateMouthModels = {}
local reviewCom, startPartId
local useStaticCard = false
local curVoiceEvent, curSpecialSoundEvent, curSpecialSoundDelayTimer, curBgEffectSoundEvent, curSnapShot
local isPause = false

function PlotPlayWindow.ReInitData()
end

function PlotPlayWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.PlotPlayWindow.package, WinResConfig.PlotPlayWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetPlotPlay_PlotPlayWindowUis(contentPane)
    StoryUtil.ChangeUI2Story(uis.Main.BackGround.root)
    StoryUtil.ChangeUI2Story(uis.Main.Card.root)
    PlotPlayWindow.InitCtrl()
    PlotPlayWindow.InitBtn()
    lastDialogId = nil
    lastSectionId = nil
    changeDialogTouchableDelayTime = TableData.GetConfig(70010021, "BaseFixed").int_value / 1000
    SoundUtil.StopCurMusic()
    PlotPlayWindow.Start()
    startPartId = curPartId
    UpdateManager.AddUpdateHandler(PlotPlayWindow.Update)
    SoundManager:SetSystemParameter("parameter:/system/ui_story_mute", "mute")
  end)
end

function PlotPlayWindow.Start()
  PlotPlayData.SetCurPartState(PLOT_PLAY_STATE.PLAYING)
  StoryUtil.InitStoryPlay()
  curDialogId = PlotPlayData.GetCurDialogId()
  curSectionId = PlotPlayData.GetCurSectionId()
  curPartId = PlotPlayData.GetCurPartId()
  local curPartConfig = TableData.GetConfig(curPartId, "BasePlotPart")
  useStaticCard = 1 == curPartConfig.use_static
  PlotPlayData.isAutoPlay = false
  touchEnable = false
  canSkip = false
  isPlotPlaying = true
  plotWaitTime = 0
  PlotPlayWindow.Play(true)
  PlotPlayWindow.UpdateAutoDisplay()
end

function PlotPlayWindow.InitCtrl()
  typingEffectTalk = FairyGUI.TypingEffect(uis.Main.Talk.TalkWord.WordTxt)
  typingEffectMiddle = FairyGUI.TypingEffect(uis.Main.Talk.MiddleWord.WordTxt)
  typingEffectNarrator = FairyGUI.TypingEffect(uis.Main.Talk.NarratorWord.WordTxt)
end

function PlotPlayWindow.PlayPart(skip)
  curPartId = PlotPlayData.GetCurPartId()
  local curPartConfig = TableData.GetConfig(curPartId, "BasePlotPart")
  useStaticCard = 1 == curPartConfig.use_static
  PlotPlayData.SetCurPartState(PLOT_PLAY_STATE.PLAYING)
  PlotPlayWindow.PlaySection(PlotPlayData.GetCurSectionId(), PlotPlayData.GetCurDialogId(), skip)
end

function PlotPlayWindow.PlaySection(newSectionId, newDialogId, skip)
  touchEnable = false
  bgEffectOutTime = 0
  roleEffectOutTime = 0
  if curDialogId then
    PlotPlayWindow.ShowDialogEndEffect(curDialogId, skip)
  end
  local roleOutCallback = function()
    if curSectionId then
      local sectionConfig = TableData.GetConfig(curSectionId, "BasePlotSection")
      local bgEffectOut = sectionConfig.bg_effect_out
      if bgEffectOut == PLOT_BG_OUT_EFFECT.MASK[2] then
        bgEffectOutTime = tonumber(sectionConfig.bg_effect_out_param or "1000") / 1000
        StoryUtil.ScreenChangeBlack(bgEffectOutTime)
      elseif bgEffectOut == PLOT_BG_OUT_EFFECT.MASK_LEFT[2] then
        bgEffectOutTime = tonumber(sectionConfig.bg_effect_out_param or "1000") / 2857
        StoryUtil.ScreenMaskMoveInFromLeft(bgEffectOutTime, clearFunc)
      elseif bgEffectOut == PLOT_BG_OUT_EFFECT.MASK_RIGHT[2] then
        bgEffectOutTime = tonumber(sectionConfig.bg_effect_out_param or "1000") / 2857
        StoryUtil.ScreenMaskMoveInFromRight(bgEffectOutTime)
      end
    end
    PlotPlayWindow.PlayTalkAnimOut()
    lastDialogId = curDialogId
    lastSectionId = curSectionId
    curSectionId = newSectionId
    curDialogId = newDialogId
    if bgEffectOutTime > 0 then
      LeanTween.delayedCall(bgEffectOutTime, function()
        PlotPlayWindow.Play(true)
      end)
    else
      PlotPlayWindow.Play(true)
    end
  end
  roleOutCallback()
end

function PlotPlayWindow.PlayDialog(newDialogId)
  touchEnable = false
  if curDialogId then
    PlotPlayWindow.ShowDialogEndEffect(curDialogId)
  end
  lastDialogId = curDialogId
  curDialogId = newDialogId
  PlotPlayWindow.Play()
end

function PlotPlayWindow.Play(playChangeEffect)
  if nil == curDialogId then
    return
  end
  local dialogConfig = TableData.GetConfig(curDialogId, "BasePlotDialog")
  if nil == dialogConfig then
    printError("剧情未配置", curDialogId)
    return
  end
  if PlotPlayMgr.curPlotType and PlotPlayMgr.curPlotType ~= PLOT_PLAY_TYPE.NONE then
    PlotPlayService.StoryOperateReportReq(PlotPlayMgr.curPlotType, curPartId, curDialogId, 0)
  end
  local callback = function(_playChangeEffect)
    PlotPlayWindow.RealPlay(_playChangeEffect)
  end
  if dialogConfig.open_title_1 then
    PlotPlayWindow.PlayOpen(function()
      callback(playChangeEffect)
    end)
  else
    callback(playChangeEffect)
  end
end

function PlotPlayWindow.PlayOpen(callback)
  local dialogConfig = TableData.GetConfig(curDialogId, "BasePlotDialog")
  local partStart = uis.Main.PartStart
  partStart.root.visible = true
  partStart.WordTxt.text = dialogConfig.open_title_1()
  partStart.TitleTxt.text = dialogConfig.open_title_2()
  uis.Main.root.touchable = false
  uis.Main.Talk.root.visible = false
  uis.Main.Card.root.visible = false
  local trans = PlayUITrans(partStart.root, "up", function()
    partStart.BackGround.root:RemoveChildAt(0)
    partStart.root.visible = false
    uis.Main.Card.root.visible = true
    uis.Main.root.touchable = true
  end)
  local bgComponent
  local bgId = dialogConfig.open_bg_id
  if bgId then
    local background = UIMgr:CreateObject("CommonResource", "BackGround")
    local config = TableData.GetConfig(bgId, "BasePlotPlayBG")
    local cg
    if config.path then
      local curBackgroundObj = ResourceManager.LoadTexture(RES_PATH_PREFIX.SINGLE_TEXTURE .. config.path)
      UIUtil.SetLoaderTexture(background:GetChild("BackGroundLoader"), curBackgroundObj)
    elseif config.cg_path then
      cg = ResourceManager.Instantiate(RES_PATH_PREFIX.PLOT_CG .. config.cg_path)
      local holder = background:GetChild("BackGroundHolder")
      UIUtil.SetHolderCenter(holder)
      UIUtil.SetObjectToUI(cg, holder)
    end
    partStart.BackGround.root:AddChildAt(background, 0)
    background:Center()
    trans:SetHook("ShowBg", function()
      PlotPlayWindow.ShowBackground(false)
    end)
    bgComponent = partStart.BackGround.root
  else
    PlotPlayWindow.ShowBackground(false)
    bgComponent = uis.Main.BackGround.root
  end
  trans:SetHook("Sign", function()
    callback()
  end)
  bgComponent:SetPivot(0.5, 0.5, true)
  bgComponent:Center()
  local moveEffect = dialogConfig.open_bg_move
  local scaleEffect = dialogConfig.open_bg_scale
  if moveEffect then
    local x_off = 0
    if moveEffect[1] == PLOT_CAMERA_MOVE_ENUM.FROM_LEFT[2] then
      x_off = -tonumber(moveEffect[3])
    elseif moveEffect[1] == PLOT_CAMERA_MOVE_ENUM.FROM_RIGHT[2] then
      x_off = tonumber(moveEffect[3])
    end
    if 0 ~= x_off then
      local preX = bgComponent.x
      bgComponent.x = bgComponent.x + x_off
      bgComponent:TweenMoveX(preX, (moveEffect[4] and tonumber(moveEffect[4]) or 2000) / 1000):SetDelay(tonumber(moveEffect[2]) / 1000)
    end
  end
  if scaleEffect then
    local scale = 10000
    if scaleEffect[1] == PLOT_CAMERA_SCALE_ENUM.TO_FAR[2] then
      scale = tonumber(scaleEffect[3])
    elseif scaleEffect[1] == PLOT_CAMERA_SCALE_ENUM.TO_NEAR[2] then
      scale = math.floor(100000000 / tonumber(scaleEffect[3]))
    end
    if 10000 ~= scale then
      bgComponent:SetScale(scale / 10000, scale / 10000)
      bgComponent:TweenScale(Vector2.one, tonumber(scaleEffect[4]) / 1000):SetDelay(tonumber(scaleEffect[2]) / 1000)
    end
  end
end

function PlotPlayWindow.RealPlay(playChangeEffect)
  local dialogConfig = TableData.GetConfig(curDialogId, "BasePlotDialog")
  if nil == dialogConfig then
    printError("剧情未配置", curDialogId)
    return
  end
  bgEffectInTime = 0
  autoUpdateEnable = false
  roleEffectInTime = 0
  if playChangeEffect then
    local sectionConfig = TableData.GetConfig(curSectionId, "BasePlotSection")
    local bg_effect_in = sectionConfig.bg_effect_in
    if bg_effect_in == PLOT_BG_IN_EFFECT.MASK[2] then
      bgEffectInTime = tonumber(sectionConfig.bg_effect_in_param or "1000") / 1000
      StoryUtil.ScreenCancelBlack(bgEffectInTime)
    elseif bg_effect_in == PLOT_BG_IN_EFFECT.MASK_LEFT[2] then
      bgEffectInTime = tonumber(sectionConfig.bg_effect_in_param or "1000") / 2857
      StoryUtil.ScreenMaskMoveOutToRight(bgEffectInTime)
    elseif bg_effect_in == PLOT_BG_IN_EFFECT.MASK_RIGHT[2] then
      bgEffectInTime = tonumber(sectionConfig.bg_effect_in_param or "1000") / 2857
      StoryUtil.ScreenMaskMoveOutToLeft(bgEffectInTime)
    end
  end
  PlotPlayWindow.ShowBackground(playChangeEffect)
  if dialogConfig.animation_path then
    if string.find(dialogConfig.animation_path, "InGameCg") then
      uis.Main.Talk.root.visible = false
      PlayUITrans(contentPane, "BlackIn")
      animationObject = ResourceManager.Instantiate(dialogConfig.animation_path)
      local SoundPlayHelper = CS.SoundPlayHelper
      SoundPlayHelper.PlaySound(animationObject, animationObject.name)
      local playableDirector = animationObject:GetComponentInChildren(typeof(CS.UnityEngine.Playables.PlayableDirector), true)
      if playableDirector then
        local duration = playableDirector.duration
        local transDuration = GetTransitionDuration(contentPane, "BlackOut")
        LeanTween.delayedCall(duration - transDuration, function()
          PlayUITrans(contentPane, "BlackOut", function()
            PlotPlayWindow.PlayEnd()
            PlotPlayWindow.DestroyAnimation()
          end)
        end)
      end
    end
    return
  end
  if dialogConfig.battle_script then
    uis.Main.Talk.root.visible = false
    ld("Battle")
    BattleMgr.isPlotBattle = true
    local scriptName = dialogConfig.battle_script
    PlotBattleScript = require(scriptName)
    PlotBattleScript.Start(PlotPlayWindow.PlayEnd)
    return
  end
  PlotPlayWindow.InitCamera()
  PlotPlayWindow.UpdateForceAutoDialog(dialogConfig)
  print("当前播放剧情 dialog", curDialogId)
  PlotPlayWindow.PlayVoice()
  PlotPlayWindow.UpdateWord(playChangeEffect)
  PlotPlayWindow.PlayEnvSound()
  local callback = function()
    if curVoiceEvent then
      SoundManager:ResumeSoundEvent(curVoiceEvent)
    end
    PlotPlayWindow.ShowRole()
    PlotPlayWindow.UpdateCamera()
    PlotPlayWindow.ShowRoleEnd()
    local delayTouchable = function()
      if uis then
        uis.Main.root.touchable = true
      end
      LeanTween.delayedCall(changeDialogTouchableDelayTime, function()
        canSkip = true
      end)
    end
    if playChangeEffect then
      PlotPlayWindow.PlayTalkAnimIn(delayTouchable)
    else
      delayTouchable()
    end
    PlotPlayWindow.ShowTypingEffect()
    PlotPlayWindow.PlaySpecialSound()
    PlotPlayWindow.PlayPlotEffect()
    autoUpdateEnable = true
  end
  if bgEffectInTime > 0 then
    LeanTween.delayedCall(bgEffectInTime, callback)
  else
    callback()
  end
end

function PlotPlayWindow.DestroyAnimation()
  if animationObject then
    ResourceManager.DestroyGameObject(animationObject, false)
    animationObject = nil
  end
  SoundUtil.PlaySfx(100102)
end

function PlotPlayWindow.Update(deltaTime)
  if true ~= autoUpdateEnable or isPause then
    if curTypingEffect and curTypingEffect.Typing == false then
      PlotPlayWindow.StopSimulateVoiceMouth()
    end
    return
  end
  local isPlaying = false
  if curTypingEffect and true == curTypingEffect.Typing then
    isPlaying = true
  else
    PlotPlayWindow.StopSimulateVoiceMouth()
  end
  for i, v in ipairs(roleActionDirectors) do
    if false == IsNil(v) and v.time < v.duration then
      isPlaying = true
      break
    end
  end
  if curVoiceEvent and SoundManager:IsPlaying(curVoiceEvent) then
    isPlaying = true
  end
  isPlotPlaying = isPlaying
  if false == isPlotPlaying then
    plotWaitTime = plotWaitTime + deltaTime
    local forceAuto = PlotPlayWindow.IsCurDialogForceAuto(curDialogId)
    if canSkip and (PlotPlayData.isAutoPlay or forceAuto) and PlotPlayData.autoPlayWaitTime <= plotWaitTime then
      PlotPlayWindow.PlayEnd()
    end
  else
    plotWaitTime = 0
  end
end

function PlotPlayWindow.Pause()
  isPause = true
  if curTypingEffect then
    curTypingEffect:Pause()
  end
  for i, v in ipairs(roleActionDirectors) do
    if IsNil(v) == false and v.time < v.duration then
      v:Pause()
    end
  end
end

function PlotPlayWindow.Resume()
  isPause = false
  if curTypingEffect then
    curTypingEffect:Resume()
  end
  for i, v in ipairs(roleActionDirectors) do
    if IsNil(v) == false and v.time < v.duration then
      v:Resume()
    end
  end
end

function PlotPlayWindow.Skip()
  PlotPlayWindow.ShowSkipTips()
end

function PlotPlayWindow.ShowSkipTips()
  if nil == skipTips then
    skipTips = UIMgr:CreateObject("PlotPlay", "SkipTips")
    uis.Main.root:AddChild(skipTips)
    skipTips:SetSize(uis.Main.root.width, uis.Main.root.height)
    skipTips:Center()
    skipCancelBtn = skipTips:GetChild("SkipCloseBtn")
    skipCancelBtn.onClick:Add(PlotPlayWindow.CloseSkipTips)
    sureBtn = skipTips:GetChild("SureBtn")
    sureBtn.onClick:Add(PlotPlayWindow.SureToSkip)
    local tipsTxt = skipTips:GetChild("TipsTxt")
    tipsTxt.text = T(10500)
  else
    skipTips.visible = true
  end
  UIMgr:ShowBlur(skipTips)
  PlotPlayWindow.Pause()
  local wordTxt = skipTips:GetChild("WordTxt")
  local curPartConfig = TableData.GetConfig(curPartId, "BasePlotPart")
  if curPartConfig.skip_tips then
    wordTxt.text = curPartConfig.skip_tips()
  end
  skipCancelBtn.touchable = false
  sureBtn.touchable = false
  PlayUITrans(skipTips, "in", function()
    skipCancelBtn.touchable = true
    sureBtn.touchable = true
  end)
end

function PlotPlayWindow.CloseSkipTips()
  if skipTips and skipTips.visible == true then
    skipCancelBtn.touchable = false
    sureBtn.touchable = false
    PlayUITrans(skipTips, "out", function()
      skipTips.visible = false
      skipCancelBtn.touchable = true
      sureBtn.touchable = true
      PlotPlayWindow.Resume()
    end)
  end
end

function PlotPlayWindow.SureToSkip()
  if PlotPlayWindow.IsCurDialogForceAuto(curDialogId) then
    return
  end
  if PlotPlayMgr.curPlotType and PlotPlayMgr.curPlotType ~= PLOT_PLAY_TYPE.NONE then
    PlotPlayService.StoryOperateReportReq(PlotPlayMgr.curPlotType, curPartId, curDialogId, 1)
  end
  if skipTips then
    autoUpdateEnable = false
    PlotPlayWindow.StopTypingEffect()
    PlotPlayWindow.StopPlayingVoice()
    PlotPlayMgr.DealSkipProcess()
    PlotPlayWindow.CloseSkipTips()
  end
end

function PlotPlayWindow.LookBack()
  PlotPlayWindow.OpenReview()
end

function PlotPlayWindow.ClickAuto()
  PlotPlayData.isAutoPlay = not PlotPlayData.isAutoPlay
  PlotPlayWindow.UpdateAutoDisplay()
end

function PlotPlayWindow.UpdateAutoDisplay()
  if PlotPlayData.isAutoPlay == false then
    ChangeUIController(uis.Main.Talk.AutoBtn, "c1", 0)
    DisposeTrans(uis.Main.Talk.AutoBtn, "Auto")
  else
    ChangeUIController(uis.Main.Talk.AutoBtn, "c1", 1)
    PlayUITrans(uis.Main.Talk.AutoBtn, "Auto", nil, nil, -1)
  end
end

function PlotPlayWindow.UpdateBtnVisible(forceAuto)
  if forceAuto then
    uis.Main.Talk.SkipBtn.visible = false
    uis.Main.Talk.HideBtn.visible = false
    uis.Main.Talk.LookBackBtn.visible = false
    uis.Main.Talk.AutoGroup.root.visible = false
    uis.Main.Talk.AutoBtn.visible = false
  else
    local partConfig = TableData.GetConfig(curPartId, "BasePlotPart")
    if 1 == partConfig.is_guide_story then
      uis.Main.Talk.SkipBtn.visible = false
    else
      local sectionConfig = TableData.GetConfig(curSectionId, "BasePlotSection")
      if PlotPlayMgr.forcePlay then
        uis.Main.Talk.SkipBtn.visible = true
      else
        uis.Main.Talk.SkipBtn.visible = 1 == sectionConfig.skip
      end
    end
    uis.Main.Talk.HideBtn.visible = true
    uis.Main.Talk.LookBackBtn.visible = true
    uis.Main.Talk.AutoGroup.root.visible = true
    uis.Main.Talk.AutoBtn.visible = true
  end
end

function PlotPlayWindow.ShowBackground(playChangeEffect)
  local sectionConfig = TableData.GetConfig(curSectionId, "BasePlotSection")
  if sectionConfig then
    PlotPlayWindow.ShowBackgroundById(sectionConfig.bg_id, playChangeEffect)
  end
end

function PlotPlayWindow.ShowBackgroundById(bg_id, playChangeEffect)
  if curBackgroundId ~= bg_id then
    PlotPlayWindow.StopBgEffectSound()
    local oldBackground
    if curBackgroundId then
      oldBackground = curBackgroundTable[curBackgroundId]
      local backgroundObject = oldBackground.background
      local clearFunc = function()
        if backgroundObject then
          uis.Main.BackGround.root:RemoveChild(backgroundObject, true)
        end
      end
      if playChangeEffect then
        local lastSectionConfig = TableData.GetConfig(lastSectionId, "BasePlotSection")
        local bgEffectOut = lastSectionConfig.bg_effect_out
        if bgEffectOut == PLOT_BG_OUT_EFFECT.FADE[2] then
          if oldBackground.cg then
            RTManager:ShowModelToLoader(backgroundObject:GetChild("BackGroundLoader"), oldBackground.cg)
            LuaUtil.SetLocalPos(oldBackground.cg, 0, 0, 0)
          end
          local interval = tonumber(lastSectionConfig.bg_effect_out_param or "1000") / 1000
          StoryUtil.BackgroundAlphaDisappear(interval, backgroundObject, clearFunc)
        else
          clearFunc()
        end
      else
        clearFunc()
      end
      curBackgroundTable[curBackgroundId] = nil
    end
    curBackgroundId = bg_id
    if bg_id then
      local background = UIMgr:CreateObject("CommonResource", "BackGround")
      local config = TableData.GetConfig(bg_id, "BasePlotPlayBG")
      local cg
      if config.path then
        local curBackgroundObj = ResourceManager.LoadTexture(RES_PATH_PREFIX.SINGLE_TEXTURE .. config.path)
        UIUtil.SetLoaderTexture(background:GetChild("BackGroundLoader"), curBackgroundObj)
      elseif config.cg_path then
        cg = ResourceManager.Instantiate(RES_PATH_PREFIX.PLOT_CG .. config.cg_path)
        local holder = background:GetChild("BackGroundHolder")
        UIUtil.SetHolderCenter(holder)
        UIUtil.SetObjectToUI(cg, holder)
      end
      if config.effect_sound and 0 ~= config.effect_sound then
        curBgEffectSoundEvent = SoundUtil.PlaySfx(config.effect_sound)
      end
      local snapShotPath = config.snapshot_path
      if curSnapShot ~= snapShotPath then
        if curSnapShot then
          SoundManager:StopSnapShot(curSnapShot)
        end
        if snapShotPath then
          SoundManager:PlaySnapShot(snapShotPath)
        end
        curSnapShot = snapShotPath
      end
      uis.Main.BackGround.root:AddChildAt(background, 0)
      background:Center()
      curBackgroundTable[curBackgroundId] = {
        backgroundId = curBackgroundId,
        background = background,
        cg = cg
      }
    else
    end
  end
  local curDialogConfig = TableData.GetConfig(curDialogId, "BasePlotDialog")
  if 1 == curDialogConfig.is_os then
    uis.Main.BackGround.OsMask.root.visible = true
  else
    uis.Main.BackGround.OsMask.root.visible = false
  end
end

function PlotPlayWindow.UpdateWord(playChangeEffect)
  local dialogConfig = TableData.GetConfig(curDialogId, "BasePlotDialog")
  local TalkWord = uis.Main.Talk.TalkWord
  if dialogConfig.talk_text then
    TalkWord.root.visible = true
    TalkWord.WordTxt.text = dialogConfig.talk_text()
    curTypingEffect = typingEffectTalk
    if 1 == dialogConfig.is_master then
      ChangeUIController(TalkWord.root, "c1", 1)
    else
      ChangeUIController(TalkWord.root, "c1", 0)
    end
    local headName = ""
    local NpcHead = TalkWord.NpcHead
    if dialogConfig.speak_head then
      local headId = dialogConfig.speak_head
      NpcHead.root.visible = true
      local headConfig = TableData.GetConfig(headId, "BasePlotHead")
      local head
      if curRoleHeadId ~= headId or IsNil(curRoleHeadObject) then
        if false == useStaticCard and headConfig.spine_path then
          head = ResourceManager.Instantiate(headConfig.spine_path)
          UIUtil.SetObjectToUI(head, NpcHead.NpcHeadLoader.NpcHeadHolder)
        elseif useStaticCard and headConfig.texture_path then
          head = ResourceManager.Instantiate(headConfig.texture_path)
          UIUtil.SetObjectToUI(head, NpcHead.NpcHeadLoader.NpcHeadHolder, nil, true)
        end
        headName = headConfig.name()
        curRoleHeadObject = head
        curRoleHeadId = headId
      else
        head = curRoleHeadObject
      end
      if false == useStaticCard then
        local actions = dialogConfig.speak_head_actions or {}
        local actionList = {
          idle = {track = 0},
          angry = {track = 1},
          smile = {track = 2},
          blink = {track = 3},
          wink = {track = 4}
        }
        for anim, v in pairs(actionList) do
          if table.contain(actions, anim) then
            SkeletonAnimationUtil.SetAnimationSoft(head, v.track, anim, true)
          else
            SkeletonAnimationUtil.StopTrackIndex(head, v.track)
          end
        end
        if table.contain(actions, "talk") then
          if curVoiceEvent then
            StoryUtil.PlayVoiceMouth(head, curVoiceEvent, "talk")
          else
            if nil == tempMouthTimer then
              tempMouthTimer = TimerUtil.setInterval(0.1, -1, PlotPlayWindow.SimulateVoiceMouth)
            end
            PlotPlayWindow.AddSimulateVoiceModel(head, "talk")
          end
        end
      end
    else
      NpcHead.root.visible = false
    end
    if dialogConfig.speak_name then
      TalkWord.NameTxt.text = dialogConfig.speak_name()
    else
      TalkWord.NameTxt.text = headName
    end
  else
    TalkWord.root.visible = false
  end
  if dialogConfig.narrator_text then
    if true ~= playChangeEffect and false == uis.Main.Talk.NarratorWord.root.visible then
      PlayUITrans(uis.Main.Talk.NarratorWord.root, "NarratorWordIn")
    end
    uis.Main.Talk.NarratorWord.root.visible = true
    uis.Main.Talk.NarratorWord.WordTxt.text = dialogConfig.narrator_text()
    curTypingEffect = typingEffectNarrator
  else
    if true ~= playChangeEffect and true == uis.Main.Talk.NarratorWord.root.visible then
      PlayUITrans(uis.Main.Talk.NarratorWord.root, "NarratorWordOut")
    end
    uis.Main.Talk.NarratorWord.root.visible = false
  end
  if dialogConfig.explain_text then
    if true ~= playChangeEffect and false == uis.Main.Talk.ExplainWord.root.visible then
      PlayUITrans(uis.Main.Talk.ExplainWord.root, "ExplainWordIn")
    end
    uis.Main.Talk.ExplainWord.root.visible = true
    uis.Main.Talk.ExplainWord.WordTxt.text = dialogConfig.explain_text()
    uis.Main.Talk.ExplainWord.NameTxt.text = dialogConfig.explain_name_text()
  else
    if true ~= playChangeEffect and true == uis.Main.Talk.ExplainWord.root.visible then
      PlayUITrans(uis.Main.Talk.ExplainWord.root, "ExplainWordOut")
    end
    uis.Main.Talk.ExplainWord.root.visible = false
  end
  if dialogConfig.middle_text then
    if true ~= playChangeEffect and false == uis.Main.Talk.MiddleWord.root.visible then
      PlayUITrans(uis.Main.Talk.MiddleWord.root, "MiddleWordIn")
    end
    uis.Main.Talk.MiddleWord.root.visible = true
    uis.Main.Talk.MiddleWord.WordTxt.text = dialogConfig.middle_text()
    curTypingEffect = typingEffectMiddle
  else
    if true ~= playChangeEffect and true == uis.Main.Talk.MiddleWord.root.visible then
      PlayUITrans(uis.Main.Talk.MiddleWord.root, "MiddleWordOut")
    end
    uis.Main.Talk.MiddleWord.root.visible = false
  end
  if dialogConfig.option_text then
    uis.Main.Talk.OptionGroup.root.visible = true
    local text = Split(dialogConfig.option_text(), "|")
    local list = uis.Main.Talk.OptionGroup.OptionList
    list:RemoveChildrenToPool()
    for i, v in ipairs(text) do
      local hand = list:AddItemFromPool()
      hand:GetChild("Option"):GetChild("WordTxt").text = v
    end
  else
    uis.Main.Talk.OptionGroup.root.visible = false
  end
  local parent = uis.Main.Talk.root
  local cgWord = parent:GetChild("CGWord")
  if cgWord then
    local lastWord = cgWord
    if false == IsUITransPlaying(lastWord, "out") then
      PlayUITrans(lastWord, "out", function()
        if IsNil(lastWord) == false then
          lastWord:Dispose()
        end
      end)
    end
  end
  if dialogConfig.cg_text then
    cgWord = UIMgr:CreateComponent("PlotPlay", "CGWord")
    if cgWord then
      parent:AddChild(cgWord)
      cgWord.name = "CGWord"
      local wordTxt = cgWord:GetChild("WordTxt")
      wordTxt.text = dialogConfig.cg_text()
      curTypingEffect = FairyGUI.TypingEffect(wordTxt)
      local cgPositionScale = dialogConfig.cg_position_scale
      if nil == cgPositionScale or "" == cgPositionScale then
        cgPositionScale = "0:0:10000"
      end
      cgPositionScale = Split(cgPositionScale, ":")
      local x = parent.width / 2 + tonumber(cgPositionScale[1])
      local y = parent.height / 2 + tonumber(cgPositionScale[2])
      cgWord:SetXY(x, y)
      local scale = tonumber(cgPositionScale[3]) / 10000
      cgWord:SetScale(scale, scale)
      if true ~= playChangeEffect then
        PlayUITrans(cgWord, "in")
      end
    end
  end
  if playChangeEffect then
    uis.Main.Talk.root.visible = false
  end
end

function PlotPlayWindow.ShowTypingEffect()
  uis.Main.Talk.root.visible = true
  if curTypingEffect then
    curTypingEffect:Start()
    curTypingEffect:PrintAll(typingInterval)
    if ActorData and ActorData.GetUin() then
      local curId = PlotPlayData.GetCurDialogId()
      local rewardConfig = TableData.GetConfig(curId, "BasePlotReward")
      if rewardConfig then
        function curTypingEffect.effectEndAction()
          autoUpdateEnable = false
          
          PlotPlayService.FinishPlotReq(nil, {curId})
        end
      end
    end
  end
end

function PlotPlayWindow.SpeedUpTypingEffect()
  if curTypingEffect then
    curTypingEffect:PrintAll(typingSpeedUpInterval, 4)
  end
end

function PlotPlayWindow.StopTypingEffect(windowClose)
  if curTypingEffect then
    curTypingEffect:Cancel()
    curTypingEffect = nil
  end
  if windowClose then
    typingEffectTalk = nil
    typingEffectMiddle = nil
    typingEffectNarrator = nil
  end
end

function PlotPlayWindow.PlayVoice(dialogId)
  if dialogId then
    PlotPlayWindow.StopPlayingVoice()
  end
  curVoiceEvent = PlotPlayMgr.PlayVoice(dialogId or curDialogId)
  if curVoiceEvent and nil == dialogId then
    SoundManager:PauseSoundEvent(curVoiceEvent)
  end
end

function PlotPlayWindow.PlayEnvSound()
  local dialogConfig = TableData.GetConfig(curDialogId, "BasePlotDialog")
  local envSound = dialogConfig.env_sound
  if envSound then
    SoundUtil.PlayMusic(envSound, true)
  end
end

function PlotPlayWindow.PlaySpecialSound()
  local dialogConfig = TableData.GetConfig(curDialogId, "BasePlotDialog")
  local special_sound = dialogConfig.special_sound
  if special_sound then
    local delayTime = dialogConfig.special_sound_delay or 0
    if delayTime > 0 then
      curSpecialSoundDelayTimer = TimerUtil.setTimeout(delayTime / 1000, function()
        curSpecialSoundEvent = SoundUtil.PlaySfx(special_sound)
        curSpecialSoundDelayTimer = nil
      end)
    else
      curSpecialSoundEvent = SoundUtil.PlaySfx(special_sound)
    end
  end
end

function PlotPlayWindow.StopSpecialSound()
  if curSpecialSoundDelayTimer then
    curSpecialSoundDelayTimer:stop()
    curSpecialSoundDelayTimer = nil
  end
  if curSpecialSoundEvent then
    SoundUtil.StopSoundEvent(curSpecialSoundEvent)
    curSpecialSoundEvent = nil
  end
end

function PlotPlayWindow.StopBgEffectSound()
  if curBgEffectSoundEvent then
    SoundUtil.StopSoundEvent(curBgEffectSoundEvent)
    curBgEffectSoundEvent = nil
  end
end

function PlotPlayWindow.PlayPlotEffect()
  local dialogConfig = TableData.GetConfig(curDialogId, "BasePlotDialog")
  local top_effect = dialogConfig.top_effect
  if top_effect then
    local path = top_effect[1]
    local delay = top_effect[2]
    if path and delay then
      uis.Main.PlotEffect.root.visible = true
      delay = tonumber(delay)
      if delay <= 0 then
        UIUtil.SetEffectToUI(path, uis.Main.PlotEffect.EffectHolder, nil, true, function()
          uis.Main.PlotEffect.root.visible = false
        end)
      else
        LeanTween.delayedCall(delay / 1000, function()
          UIUtil.SetEffectToUI(path, uis.Main.PlotEffect.EffectHolder, nil, true, function()
            uis.Main.PlotEffect.root.visible = false
          end)
        end)
      end
    end
  end
end

function PlotPlayWindow.ShowRole()
  roleActionDirectors = {}
  local dialogConfig = TableData.GetConfig(curDialogId, "BasePlotDialog")
  local roleIds = dialogConfig.role_ids
  local scale = dialogConfig.scale
  local action = dialogConfig.action
  local skin = dialogConfig.skin
  local action_timeline = dialogConfig.action_timeline
  local blink_timeline = dialogConfig.blink_timeline
  local rolePosition = dialogConfig.role_position
  local effect_in = dialogConfig.effect_in
  local effect_in_param = dialogConfig.effect_in_param
  local speak_role = dialogConfig.speak_role
  local light_role = dialogConfig.light_role
  local role_shake = dialogConfig.role_shake
  local cardRoot = uis.Main.Card.root
  if roleIds and #roleIds > 0 then
    for i, roleId in ipairs(roleIds) do
      local curRole = curRoleTable[roleId]
      local roleConfig = TableData.GetConfig(tonumber(roleId), "BasePlotRole")
      local cardShow, model, scaleRatio, lastScaleRatio, isNew
      local changeColor = function(interval)
        if 1 == speak_role[i] then
          if cardShow then
            scaleRatio = 1
            cardRoot:SetChildIndex(cardShow, cardRoot.numChildren - 1)
          end
        elseif 0 == speak_role[i] and cardShow then
          scaleRatio = 1
        end
        if light_role and 1 == light_role[i] then
          if useStaticCard then
            LuaUtil.SetSpriteColor(model, colorSpeak, interval or speakChangeInterval)
          else
            SkeletonAnimationUtil.TweenColor(model, colorSpeak, interval or speakChangeInterval)
          end
        elseif useStaticCard then
          LuaUtil.SetSpriteColor(model, colorNoSpeak, interval or speakChangeInterval)
        else
          SkeletonAnimationUtil.TweenColor(model, colorNoSpeak, interval or speakChangeInterval)
        end
      end
      if curRole then
        cardShow = curRole.cardShow
        model = curRole.model
        LeanTween.cancel(model)
        lastScaleRatio = curRole.scaleRatio * curRole.initScale
        changeColor()
      else
        isNew = true
        cardShow = UIMgr:CreateObject("PlotPlay", "CardShow")
        cardRoot:AddChild(cardShow)
        cardShow.size = cardRoot.size
        local loader = cardShow:GetChild("CardLoader")
        local holder = cardShow:GetChild("CardHolder")
        if false == useStaticCard then
          if roleConfig.spine_path and roleConfig.spine_path ~= "" then
            local path = RES_PATH_PREFIX.NPC_SPINE .. roleConfig.spine_path
            model = ResourceManager.Instantiate(path)
          end
        elseif roleConfig.texture_path and "" ~= roleConfig.texture_path then
          local path = RES_PATH_PREFIX.NPC_TEXTURE .. roleConfig.texture_path
          model = ResourceManager.Instantiate(path)
        end
        local tempScale = holder.displayObject.cachedTransform.localScale.x / Const.DefaultUIScale * Const.DefaultShowSpineScale
        curRole = {
          roleId = roleId,
          cardShow = cardShow,
          model = model,
          loader = loader,
          holder = holder,
          initScale = tempScale,
          useStaticCard = useStaticCard
        }
        curRoleTable[roleId] = curRole
        changeColor(0)
      end
      if false == useStaticCard then
        if false == string.isEmptyOrNil(action_timeline and action_timeline[i]) then
          local director = DialogTimeline.SetTimeline(model, action_timeline[i])
          director.extrapolationMode = DirectorWrapMode.Hold
          director:Play()
          roleActionDirectors[#roleActionDirectors + 1] = director
        end
        if false == string.isEmptyOrNil(blink_timeline and blink_timeline[i]) and curRole.curBlinkTimeline ~= blink_timeline[i] then
          local director = DialogTimeline.SetTimeline(model, blink_timeline[i])
          director.extrapolationMode = DirectorWrapMode.Loop
          director:Play()
          curRole.curBlinkTimeline = blink_timeline[i]
        end
        if false == string.isEmptyOrNil(skin and skin[i]) then
          SkeletonAnimationUtil.SetSkin(model, skin[i])
        end
        if 1 == speak_role[i] then
          if curVoiceEvent then
            StoryUtil.PlayVoiceMouth(model, curVoiceEvent)
          else
            if nil == tempMouthTimer then
              tempMouthTimer = TimerUtil.setInterval(0.1, -1, PlotPlayWindow.SimulateVoiceMouth)
            end
            PlotPlayWindow.AddSimulateVoiceModel(model)
          end
        end
      end
      curRole.scaleRatio = tonumber(scale[i] or 10000) * scaleRatio
      PlotPlayWindow.ShowCardEnterEffect(curRole, rolePosition[i], effect_in and effect_in[i], effect_in_param and effect_in_param[i], isNew, lastScaleRatio)
      if false == IsNil(cardShow) and role_shake and role_shake[i] and "" ~= role_shake[i] then
        local shake = Split(role_shake[i], ":")
        StoryUtil.ShakeRoleOnce(cardShow.displayObject.gameObject, tonumber(shake[1]), tonumber(shake[2]), tonumber(shake[3]))
      end
    end
  end
end

function PlotPlayWindow.AddSimulateVoiceModel(model, onlyState)
  if tempSimulateMouthModels then
    local find = false
    for i, modelInfo in ipairs(tempSimulateMouthModels) do
      if modelInfo.model == model then
        find = true
        break
      end
    end
    if false == find then
      table.insert(tempSimulateMouthModels, {model = model, onlyState = onlyState})
    end
  end
end

function PlotPlayWindow.SimulateVoiceMouth()
  if tempSimulateMouthModels then
    for i, modelInfo in ipairs(tempSimulateMouthModels) do
      if IsNil(modelInfo.model) == false then
        PlotPlayWindow.RandomMouth(modelInfo)
      end
    end
  end
end

local tempMouthState = {
  "mouth_A1",
  "mouth_B1",
  "mouth_C1",
  "mouth_D1",
  "mouth_E1",
  "mouth_F1",
  "mouth_A2",
  "mouth_B2",
  "mouth_C2",
  "mouth_D2",
  "mouth_E2",
  "mouth_F2"
}

function PlotPlayWindow.RandomMouth(modelInfo)
  if modelInfo.onlyState then
    if SkeletonAnimationUtil.ContainStatue(modelInfo.model, modelInfo.onlyState) then
      SkeletonAnimationUtil.SetAnimationSoft(modelInfo.model, 10, modelInfo.onlyState, true)
    end
  else
    local index = math.random(1, #tempMouthState)
    if SkeletonAnimationUtil.ContainStatue(modelInfo.model, tempMouthState[index]) then
      SkeletonAnimationUtil.SetAnimationSoft(modelInfo.model, 10, tempMouthState[index], true)
    else
      local talkList = {
        "talk_01",
        "talk_02",
        "talk_03"
      }
      for _, state in ipairs(talkList) do
        if SkeletonAnimationUtil.ContainStatue(modelInfo.model, state) then
          SkeletonAnimationUtil.SetAnimationSoft(modelInfo.model, 10, state, true)
          break
        end
      end
    end
  end
end

function PlotPlayWindow.StopSimulateVoiceMouth()
  if tempMouthTimer then
    tempMouthTimer:stop()
    tempMouthTimer = nil
  end
  if tempSimulateMouthModels then
    for i, modelInfo in ipairs(tempSimulateMouthModels) do
      if IsNil(modelInfo.model) == false then
        SkeletonAnimationUtil.StopTrackIndex(modelInfo.model, 10)
      end
    end
  end
  tempSimulateMouthModels = {}
end

function PlotPlayWindow.InitCamera()
  local dialogConfig = TableData.GetConfig(curDialogId, "BasePlotDialog")
  local moveEffect = dialogConfig.camera_move
  local scaleEffect = dialogConfig.camera_scale
  if moveEffect then
    local x_off = 0
    if moveEffect[1] == PLOT_CAMERA_MOVE_ENUM.FROM_LEFT[2] then
      x_off = -tonumber(moveEffect[3])
    elseif moveEffect[1] == PLOT_CAMERA_MOVE_ENUM.FROM_RIGHT[2] then
      x_off = tonumber(moveEffect[3])
    end
    if 0 ~= x_off then
      StoryUtil.SetCameraPosition(x_off)
    end
  end
  if scaleEffect then
    local scale = 10000
    if scaleEffect[1] == PLOT_CAMERA_SCALE_ENUM.TO_FAR[2] then
      scale = tonumber(scaleEffect[3])
    elseif scaleEffect[1] == PLOT_CAMERA_SCALE_ENUM.TO_NEAR[2] then
      scale = math.floor(100000000 / tonumber(scaleEffect[3]))
    end
    if 10000 ~= scale then
      StoryUtil.SetCameraFOV(scale)
    end
  end
end

function PlotPlayWindow.UpdateCamera()
  local dialogConfig = TableData.GetConfig(curDialogId, "BasePlotDialog")
  local moveEffect = dialogConfig.camera_move
  local scaleEffect = dialogConfig.camera_scale
  local shakeEffect = dialogConfig.camera_shake
  if moveEffect then
    local x_off = 0
    if moveEffect[1] == PLOT_CAMERA_MOVE_ENUM.FROM_LEFT[2] then
      x_off = -tonumber(moveEffect[3])
    elseif moveEffect[1] == PLOT_CAMERA_MOVE_ENUM.FROM_RIGHT[2] then
      x_off = tonumber(moveEffect[3])
    end
    StoryUtil.MoveCamera(x_off, tonumber(moveEffect[2]), moveEffect[4] and tonumber(moveEffect[4]))
  end
  if scaleEffect then
    local scale = 10000
    if scaleEffect[1] == PLOT_CAMERA_SCALE_ENUM.TO_FAR[2] then
      scale = tonumber(scaleEffect[3])
    elseif scaleEffect[1] == PLOT_CAMERA_SCALE_ENUM.TO_NEAR[2] then
      scale = math.floor(100000000 / tonumber(scaleEffect[3]))
    end
    StoryUtil.UpdateCameraFOV(scale, tonumber(scaleEffect[2]), tonumber(scaleEffect[4]))
  end
  if shakeEffect then
    StoryUtil.ShakeCamera(tonumber(shakeEffect[1]), tonumber(shakeEffect[2]), tonumber(shakeEffect[3]))
  end
end

function PlotPlayWindow.ShowRoleEnd()
  touchEnable = true
end

function PlotPlayWindow.PlayTalkAnimIn(callback)
  if uis then
    uis.Main.root.touchable = false
    uis.Main.Talk.root.visible = true
    PlayUITrans(uis.Main.root, "TalkIn", function()
      uis.Main.root.touchable = true
      if callback then
        callback()
      end
    end)
  end
end

function PlotPlayWindow.PlayTalkAnimOut()
  if uis then
    uis.Main.root.touchable = false
    PlayUITrans(uis.Main.root, "TalkOut", function()
      uis.Main.root.touchable = true
    end)
  end
end

function PlotPlayWindow.ShowCardEnterEffect(saveRoleInfo, position, enterEffect, enterEffectParam, isNew, lastScaleRatio)
  local model = saveRoleInfo.model
  if nil == model then
    return
  end
  local loader = saveRoleInfo.loader
  local positionStrTable = Split(position, ":")
  local targetPosition = Vector3(tonumber(positionStrTable[1]), tonumber(positionStrTable[2]), 0)
  local startPosition
  local curPosition = model.transform.localPosition
  if isNew then
    startPosition = PlotPlayData.GetStartPosition(targetPosition, enterEffect, enterEffectParam)
  else
    startPosition = curPosition
  end
  local needMove = false
  if startPosition ~= targetPosition then
    needMove = true
  end
  local curScale = saveRoleInfo.initScale * saveRoleInfo.scaleRatio
  local needChangeScale = false
  if lastScaleRatio ~= curScale then
    needChangeScale = true
  end
  saveRoleInfo.position = targetPosition
  local interval_fade = 0.5
  local interval_move = 0.55
  local interval_scale = 0.4
  if needMove and needChangeScale then
    interval_move = interval_scale
  end
  if enterEffect == PLOT_EFFECT_IN_ENUM.FADE[2] then
    PlotPlayMgr.RenderToLoaderRT(saveRoleInfo)
    loader.alpha = 0
    LeanTween.value(0, 1, interval_fade):setOnUpdate(function(value)
      if nil == uis then
        return
      end
      loader.alpha = value
    end):setOnComplete(function()
      if nil == uis then
        return
      end
      loader.alpha = 1
      PlotPlayMgr.ReleaseFromRT(saveRoleInfo)
      PlotPlayMgr.RenderToHolder(saveRoleInfo)
    end)
    roleEffectInTime = math.max(roleEffectInTime, interval_fade)
  elseif isNew then
    PlotPlayMgr.RenderToLoaderRT(saveRoleInfo)
    loader.alpha = 0
    LeanTween.value(0, 1, interval_move):setOnUpdate(function(value)
      if nil == uis then
        return
      end
      loader.alpha = value
    end):setOnComplete(function()
      if nil == uis then
        return
      end
      loader.alpha = 1
      PlotPlayMgr.ReleaseFromRT(saveRoleInfo)
      PlotPlayMgr.RenderToHolder(saveRoleInfo)
    end)
    roleEffectInTime = math.max(roleEffectInTime, interval_move)
  end
  LuaUtil.SetLocalPos(model, startPosition)
  if needMove then
    roleEffectInTime = math.max(roleEffectInTime, interval_move)
    LeanTween.moveLocal(model, targetPosition, interval_move)
  end
  if model then
    if isNew or false == needChangeScale then
      LuaUtil.SetScale(model, curScale / 10000, curScale / 10000, curScale / 10000)
    else
      LeanTween.value(model, lastScaleRatio, curScale, interval_scale):setOnUpdate(function(value)
        if IsNil(model) == false then
          LuaUtil.SetScale(model, value / 10000, value / 10000, value / 10000)
        end
      end)
    end
  end
end

function PlotPlayWindow.ShowDialogEndEffect(dialogId, skip)
  local dialogConfig = TableData.GetConfig(dialogId, "BasePlotDialog")
  local role_ids = dialogConfig.role_ids
  local effect_out = dialogConfig.effect_out
  local effect_out_param = dialogConfig.effect_out_param
  if role_ids and #role_ids > 0 then
    for i, roleId in ipairs(role_ids) do
      local saveRoleInfo = curRoleTable[roleId]
      if saveRoleInfo then
        PlotPlayWindow.ShowCardOutEffect(saveRoleInfo, effect_out and effect_out[i], effect_out_param and effect_out_param[i], skip)
      end
    end
    if skip then
      roleActionDirectors = {}
    end
  end
end

function PlotPlayWindow.ShowCardOutEffect(saveRoleInfo, outEffect, outEffectParam, skip)
  local interval_fade = 0.5
  local interval_move = 0.5
  local loader = saveRoleInfo.loader
  if skip or outEffect == PLOT_EFFECT_OUT_ENUM.FADE[2] then
    PlotPlayMgr.RenderToLoaderRT(saveRoleInfo)
    LuaUtil.SetLocalPos(saveRoleInfo.model, saveRoleInfo.position)
    loader.alpha = 1
    LeanTween.value(1, 0, interval_fade):setOnUpdate(function(value)
      loader.alpha = value
    end):setOnComplete(function()
      loader.alpha = 1
      PlotPlayMgr.ReleaseFromRT(saveRoleInfo, true)
      saveRoleInfo.cardShow:Dispose()
      curRoleTable[saveRoleInfo.roleId] = nil
    end)
    roleEffectOutTime = math.max(roleEffectOutTime, interval_fade)
  elseif outEffect == PLOT_EFFECT_OUT_ENUM.OUT_LEFT[2] then
    local targetPosition = PlotPlayData.GetEndPosition(saveRoleInfo.position, outEffect, outEffectParam)
    LeanTween.moveLocal(saveRoleInfo.model, targetPosition, interval_move)
    roleEffectOutTime = math.max(roleEffectOutTime, interval_move)
    PlotPlayMgr.RenderToLoaderRT(saveRoleInfo)
    LuaUtil.SetLocalPos(saveRoleInfo.model, saveRoleInfo.position)
    loader.alpha = 1
    LeanTween.value(1, 0, interval_move):setOnUpdate(function(value)
      loader.alpha = value
    end):setOnComplete(function()
      loader.alpha = 1
      PlotPlayMgr.ReleaseFromRT(saveRoleInfo, true)
      saveRoleInfo.cardShow:Dispose()
      curRoleTable[saveRoleInfo.roleId] = nil
    end)
  elseif outEffect == PLOT_EFFECT_OUT_ENUM.OUT_RIGHT[2] then
    local targetPosition = PlotPlayData.GetEndPosition(saveRoleInfo.position, outEffect, outEffectParam)
    LeanTween.moveLocal(saveRoleInfo.model, targetPosition, interval_move)
    roleEffectOutTime = math.max(roleEffectOutTime, interval_move)
    PlotPlayMgr.RenderToLoaderRT(saveRoleInfo)
    LuaUtil.SetLocalPos(saveRoleInfo.model, saveRoleInfo.position)
    loader.alpha = 1
    LeanTween.value(1, 0, interval_move):setOnUpdate(function(value)
      loader.alpha = value
    end):setOnComplete(function()
      loader.alpha = 1
      PlotPlayMgr.ReleaseFromRT(saveRoleInfo, true)
      saveRoleInfo.cardShow:Dispose()
      curRoleTable[saveRoleInfo.roleId] = nil
    end)
  elseif outEffect == PLOT_EFFECT_OUT_ENUM.IMMEDIATELY[2] then
    PlotPlayMgr.ReleaseFromRT(saveRoleInfo, true)
    saveRoleInfo.cardShow:Dispose()
    curRoleTable[saveRoleInfo.roleId] = nil
  end
end

function PlotPlayWindow.InitBtn()
  uis.Main.Talk.TouchBtn.soundFmod = nil
  uis.Main.TouchScreenBtn.soundFmod = nil
  uis.Main.Talk.TouchBtn.onClick:Add(PlotPlayWindow.ClickTouchBtn)
  uis.Main.Talk.HideBtn.onClick:Add(PlotPlayWindow.ClickHideBtn)
  uis.Main.TouchScreenBtn.onClick:Add(PlotPlayWindow.ClickTouchScreenBtn)
  uis.Main.Talk.SkipBtn.onClick:Add(PlotPlayWindow.Skip)
  uis.Main.Talk.LookBackBtn.onClick:Add(PlotPlayWindow.LookBack)
  uis.Main.Talk.AutoBtn.onClick:Add(PlotPlayWindow.ClickAuto)
end

function PlotPlayWindow.ClickTouchBtn()
  if true ~= touchEnable then
    return
  end
  if curTypingEffect and true == curTypingEffect.Typing then
    PlotPlayWindow.SpeedUpTypingEffect()
  elseif canSkip then
    PlotPlayWindow.PlayEnd()
  end
end

function PlotPlayWindow.ClickHideBtn()
  PlotPlayWindow.PlayTalkAnimOut()
  uis.Main.TouchScreenBtn.visible = true
end

function PlotPlayWindow.ClickTouchScreenBtn()
  PlotPlayWindow.PlayTalkAnimIn()
  uis.Main.TouchScreenBtn.visible = false
end

function PlotPlayWindow.UpdateForceAutoDialog(dialogConfig)
  local forceAuto = PlotPlayWindow.IsCurDialogForceAuto(nil, dialogConfig)
  if forceAuto then
    uis.Main.Talk.AutoGroup.root.visible = false
    uis.Main.Talk.AutoBtn.visible = false
  end
  PlotPlayWindow.UpdateBtnVisible(forceAuto)
end

function PlotPlayWindow.IsCurDialogForceAuto(dialogId, dialogConfig)
  dialogConfig = dialogConfig or TableData.GetConfig(dialogId, "BasePlotDialog")
  return dialogConfig and 1 == dialogConfig.force_auto
end

function PlotPlayWindow.PlayEnd()
  if curTypingEffect then
    PlotPlayWindow.StopTypingEffect()
  end
  PlotPlayWindow.StopSpecialSound()
  PlotPlayWindow.StopPlayingVoice()
  for i, v in pairs(curRoleTable) do
    if v.model then
      StoryUtil.ResetVoiceMouth(v.model)
    end
  end
  if curRoleHeadObject then
    StoryUtil.ResetVoiceMouth(curRoleHeadObject)
  end
  PlotPlayWindow.StopSimulateVoiceMouth()
  autoUpdateEnable = false
  roleActionDirectors = {}
  touchEnable = false
  canSkip = false
  PlotPlayMgr.ChangeToNextPlot()
end

function PlotPlayWindow.PlayPlotAllEnd()
  UIMgr:CloseWindow(WinResConfig.PlotPlayWindow.name)
end

function PlotPlayWindow.OpenReview()
  if reviewCom then
    reviewCom:Dispose()
  end
  reviewCom = UIMgr:CreateComponent("PlotPlay", "Review")
  contentPane:AddChild(reviewCom)
  reviewCom.size = contentPane.size
  reviewCom:Center()
  local closeBtn = reviewCom:GetChild("CloseBtn")
  closeBtn.onClick:Add(PlotPlayWindow.CloseReview)
  PlotPlayWindow.Pause()
  uis.Main.Card.root.x = 10000
  uis.Main.Talk.root.x = 10000
  uis.Main.PlotEffect.root.x = 10000
  PlotPlayMgr.ShowPlotReview(reviewCom, curPartId, curSectionId, curDialogId)
end

function PlotPlayWindow.StopPlayingVoice()
  if curVoiceEvent then
    SoundManager:StopSoundEvent(curVoiceEvent, true)
    curVoiceEvent = nil
  end
  PlotPlayWindow.StopSimulateVoiceMouth()
end

function PlotPlayWindow.CloseReview()
  if reviewCom then
    reviewCom:Dispose()
    reviewCom = nil
  end
  PlotPlayWindow.Resume()
  if PlotPlayMgr.needStopWhenQuitReview then
    PlotPlayWindow.StopPlayingVoice()
  end
  uis.Main.Card.root.x = 0
  uis.Main.Talk.root.x = 0
  uis.Main.PlotEffect.root.x = 0
end

function PlotPlayWindow.OnShown()
end

function PlotPlayWindow.OnHide()
end

function PlotPlayWindow.OnPreClose()
  UpdateManager.RemoveUpdateHandler(PlotPlayWindow.Update)
  touchEnable = false
  if uis then
    StoryUtil.ChangeStory2UI(uis.Main.BackGround.root)
    StoryUtil.ChangeStory2UI(uis.Main.Card.root)
  end
end

function PlotPlayWindow.OnClose()
  SoundManager:SetSystemParameter("parameter:/system/ui_story_mute", "on")
  isPause = false
  if curSnapShot then
    SoundManager:StopSnapShot(curSnapShot)
  end
  curSnapShot = nil
  PlotPlayWindow.DestroyAnimation()
  SoundUtil.StopCurMusic(false, true)
  SoundUtil.PlayLastMusic()
  PlotPlayWindow.StopBgEffectSound()
  PlotPlayWindow.StopSpecialSound()
  PlotPlayWindow.StopPlayingVoice()
  PlotPlayWindow.StopSimulateVoiceMouth()
  StoryUtil.ClearStoryPlay()
  roleActionDirectors = {}
  touchEnable = nil
  PlotPlayData.isAutoPlay = false
  isPlotPlaying = nil
  skipTips = nil
  skipCancelBtn = nil
  sureBtn = nil
  curBackgroundId = nil
  curDialogId, curSectionId, curPartId = nil, nil, nil
  lastDialogId, lastSectionId = nil, nil
  PlotPlayWindow.StopTypingEffect(true)
  for i, v in pairs(curRoleTable) do
    PlotPlayMgr.ReleaseFromRT(v, true)
  end
  curRoleTable = {}
  curBackgroundTable = {}
  uis = nil
  contentPane = nil
  curRoleHeadId = nil
  curRoleHeadObject = nil
  reviewCom = nil
  startPartId = nil
  useStaticCard = false
  curVoiceEvent = nil
end

function PlotPlayWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.PlotPlayWindow.CHANGE_DIALOG then
    PlotPlayWindow.PlayDialog(para.dialogId)
  elseif msgId == WindowMsgEnum.PlotPlayWindow.CHANGE_SECTION then
    PlotPlayWindow.PlaySection(para.sectionId, para.dialogId)
  elseif msgId == WindowMsgEnum.PlotPlayWindow.CHANGE_PART then
    PlotPlayWindow.PlayPart(para)
  elseif msgId == WindowMsgEnum.PlotPlayWindow.ACTIVE_UPDATE then
    autoUpdateEnable = true
  elseif msgId == WindowMsgEnum.PlotPlayWindow.PLAY_VOICE then
    PlotPlayWindow.PlayVoice(para)
  end
end

return PlotPlayWindow
