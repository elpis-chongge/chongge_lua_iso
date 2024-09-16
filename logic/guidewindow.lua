require("Guide_GuideWindowByName")
local GuideWindow = {}
local uis, contentPane, stepData, clickCtr, lastParent, lastXy, lastPos, lastIndex
local mask = "Assets/Art/Models/UI_spine/prefab/FX_NewGuy_Finger_mask.prefab"
local effectPath = "Assets/Art/Models/UI_spine/prefab/FX_NewGuy_Finger.prefab"
local effectObj, maskPlaneTransform, spineRoot, initedStepId, outAnimWait, startAnimWait

function GuideWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.GuideWindow.package, WinResConfig.GuideWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuide_GuideWindowUis(contentPane)
    GuideWindow.Init()
  end)
end

function GuideWindow.Init()
  stepData = GuideMgr.GetStepData()
  if stepData then
    GuideWindow.InitStep()
    initedStepId = stepData.id
    return
  end
  GuideMgr.HideWindow()
end

function GuideWindow.CreateSpecialCom(onClickFun)
  if string.isEmptyOrNil(stepData.url) then
    GuideMgr.Log("step表 url配置错误>>>>>>>>>>", stepData.id)
    return
  end
  local arr = Split(stepData.url, ":")
  local specialCom = LuaUtil.FindUIChild(uis.Main.Eeplain.root, arr[2])
  if specialCom then
    specialCom.visible = true
    local trans = specialCom:GetTransition("switch")
    if trans then
      trans:SetHook("sign", function()
        if stepData.bubble_text then
          UIUtil.SetText(specialCom, stepData.bubble_text(), "WordTxt")
        end
        specialCom.onClick:Set(function()
          if onClickFun then
            onClickFun(specialCom)
          end
        end)
      end)
      trans:Play()
    else
      if stepData.bubble_text then
        UIUtil.SetText(specialCom, stepData.bubble_text(), "WordTxt")
      end
      specialCom.onClick:Set(function()
        if onClickFun then
          onClickFun(specialCom)
        end
      end)
    end
    GuideWindow.CreateSpecialEffect(specialCom)
    return
  end
  specialCom = UIMgr:CreateComponent(arr[1], arr[2])
  if stepData.bubble_text then
    UIUtil.SetText(specialCom, stepData.bubble_text(), "WordTxt")
  end
  uis.Main.Eeplain.root:AddChild(specialCom)
  specialCom:SetSize(uis.Main.root.width, uis.Main.root.height)
  specialCom.onClick:Set(function()
    if onClickFun then
      onClickFun(specialCom)
    end
  end)
  if stepData.trigger_in_battle == "burst_card_show_2" or stepData.trigger_in_battle == "burst_card_show_3" or stepData.trigger_in_battle == "burst_card_show_4" then
    PlayUITrans(specialCom, "in", nil, nil, nil, nil, nil, true)
  end
  GuideWindow.CreateSpecialEffect(specialCom)
end

function GuideWindow.CreateSpecialEffect(specialCom)
  if stepData.frame_scale and specialCom then
    local frameEffect
    local EffectHolder = specialCom:GetChild("EffectHolder")
    if 1 == stepData.polyhedron_type then
      frameEffect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/NewGuyFinger/FX_NewGut_Finger_Sc_light_battle.prefab", EffectHolder)
    else
      frameEffect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/NewGuyFinger/FX_NewGuy_Finger_pointlight.prefab", EffectHolder)
    end
    if frameEffect then
      frameEffect:IgnoreTimeScale(true)
      LuaUtil.SetScale(frameEffect, stepData.frame_scale[1], stepData.frame_scale[2], stepData.frame_scale[3])
    end
  end
end

function GuideWindow.Clear()
  if stepData.url and 1 ~= stepData.keep_show then
    local arr = Split(stepData.url, ":")
    local specialCom = LuaUtil.FindUIChild(uis.Main.Eeplain.root, arr[2])
    if specialCom then
      specialCom:Dispose()
    end
  end
  GuideWindow.QuitStep()
  GuideMgr.Next()
end

function GuideWindow.InitStep()
  print("当前引导id >GuideWindow>> InitStep>>>>>", stepData.id)
  if stepData.type == GUIDE_STEP_TYPE_ENUM.SKILL_HINT then
    GuideWindow.CreateSpecialCom(function(specialCom)
      if stepData.type == GUIDE_STEP_TYPE_ENUM.SKILL_HINT and 1 ~= stepData.keep_battle_pause then
        ld("Battle")
        BattleControl.Continue()
      end
      if 1 == stepData.keep_show then
        specialCom.touchable = false
      else
        specialCom:Dispose()
      end
      GuideWindow.QuitStep()
      GuideMgr.Next()
    end)
    uis.Main.c1Ctr.selectedIndex = 1
    if stepData.ctrl_id == nil then
      return
    end
  end
  if stepData.hide_path then
    local hideFun = function()
      local uiMain = LuaUtil.FindUIChild(GRoot.inst, stepData.window_name)
      local hideCom = GuideMgr.FindComponentByPath(uiMain, stepData.hide_path)
      if hideCom then
        hideCom.visible = false
      else
        GuideMgr.Log("BaseGuideStep中 hide_path 错误", stepData.id)
      end
    end
    if stepData.hide_wait_time then
      LeanTween.delayedCall(stepData.hide_wait_time, function()
        hideFun()
      end)
    else
      hideFun()
    end
  end
  if stepData.type == GUIDE_STEP_TYPE_ENUM.SHOW_TIPS then
    GuideWindow.CreateSpecialCom()
    uis.Main.Guide.root:GetChild("MaskImage").visible = false
    contentPane.touchable = false
    uis.Main.c1Ctr.selectedIndex = 1
    return
  end
  local uiMain
  if stepData.window_name then
    uiMain = GuideMgr.InitUiRoot(stepData.window_name)
  else
    uiMain = GuideMgr.InitUiRoot(UIMgr:GetTopWindow())
  end
  clickCtr = GuideMgr.FindComponentByPath(uiMain, stepData.ctrl_id)
  if nil == clickCtr then
    GuideMgr.Log("BaseGuideStep 中 ctrl_id 错误", stepData.id)
    return
  end
  if stepData.type == GUIDE_STEP_TYPE_ENUM.GIRD then
    GuideWindow.CreateSpecialCom(function()
      if stepData.not_full_screen_click == nil then
        GuideWindow.Clear()
      end
    end)
    uis.Main.c1Ctr.selectedIndex = 1
  end
  lastParent = clickCtr.parent
  lastXy = clickCtr.xy
  lastPos = clickCtr.displayObject.position
  if clickCtr.visible == false then
    clickCtr.visible = true
  end
  if 1 == stepData.ctrl_move then
    clickCtr:Center()
    clickCtr.touchable = false
    local tempEffect
    if clickCtr.name == "OwnBadgeBtn" then
      tempEffect = "Assets/Art/Effects/Prefab/UI_prefab/NewGuyFinger/FX_ui_newguide_badge.prefab"
    elseif clickCtr.name == "BurstStrip" then
      tempEffect = "Assets/Art/Effects/Prefab/UI_prefab/NewGuyFinger/FX_ui_newguide_burst.prefab"
    end
    local holder = clickCtr:GetChild("EffectHolder")
    if tempEffect then
      clickCtr.alpha = 0
      clickCtr:TweenFade(1, 0.5):SetEase(EaseType.QuadOut)
      clickCtr:TweenScale(Vector2.one, 0.5):SetEase(EaseType.BackOut)
      clickCtr:TweenMove(lastXy, 0.65):OnComplete(function()
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.GUIDE_BADGE_IN)
        UIUtil.SetEffectToUI(tempEffect, holder, 1, true, function()
          if IsNil(clickCtr) == false then
            clickCtr.touchable = true
          end
          GuideWindow.QuitStep()
          GuideMgr.Next()
        end)
      end):SetDelay(0.65)
      UIUtil.SetEffectToUI(tempEffect, holder, 1, true)
    end
  end
  lastIndex = lastParent:GetChildIndex(clickCtr)
  GuideMgr.curTriggerWindowName = stepData.window_name
  GuideWindow.SetMaskInfo()
  if stepData.type ~= GUIDE_STEP_TYPE_ENUM.GIRD and stepData.type ~= GUIDE_STEP_TYPE_ENUM.SKILL_HINT then
    uis.Main.c1Ctr.selectedIndex = 0
  end
end

function GuideWindow.SetMaskInfo()
  local spineAnimNameBol = (stepData.alpha == nil or 0 == stepData.alpha) and true or false
  uis.Main.Guide.Mask.root.alpha = stepData.alpha or 0
  local pos
  if stepData.type == GUIDE_STEP_TYPE_ENUM.NOT_CHANGE_LAYER then
    if stepData.alpha == nil then
      uis.Main.Guide.root:GetChild("MaskImage").visible = false
    end
    contentPane.touchable = false
    local v2 = clickCtr:LocalToRoot(Vector2.zero, GRoot.inst.root)
    pos = Vector2(v2.x - GuideWindow.GetScreenOffset(), v2.y)
  else
    contentPane.touchable = true
    uis.Main.Guide.root:GetChild("MaskImage").visible = true
    if stepData.type == GUIDE_STEP_TYPE_ENUM.GIRD or stepData.type == GUIDE_STEP_TYPE_ENUM.SKILL_HINT then
      local v2 = clickCtr:LocalToRoot(Vector2.zero, GRoot.inst.root)
      uis.Main.Eeplain.root:AddChild(clickCtr)
      clickCtr.xy = Vector2(v2.x - GuideWindow.GetScreenOffset(), v2.y)
    else
      GuideWindow.SetClickCtrPos(uis.Main.Guide.root, 1)
    end
    pos = clickCtr.xy
  end
  if stepData.bubble_pos and 2 == #stepData.bubble_pos then
    uis.Main.Guide.Word.root.xy = Vector2(pos.x + stepData.bubble_pos[1], pos.y + stepData.bubble_pos[2])
  else
    uis.Main.Guide.Word.root.xy = Vector2(pos.x, pos.y)
  end
  if stepData.bubble_text then
    if stepData.update_func and stepData.update_text and stepData.update_finish_func and stepData.update_finish_func() then
      uis.Main.Guide.Word.WordTxt.text = stepData.update_text()
    else
      uis.Main.Guide.Word.WordTxt.text = stepData.bubble_text()
    end
    uis.Main.Guide.Word.root.visible = true
  else
    uis.Main.Guide.Word.root.visible = false
  end
  local touchBol = true
  if stepData.polyhedron_pos and 2 == #stepData.polyhedron_pos then
    effectObj = UIUtil.SetEffectToUI(effectPath, uis.Main.Guide.Pointer.PointerHolder)
    local maskObj = UIUtil.SetEffectToUI(mask, uis.Main.Guide.Mask.PointerHolder)
    spineRoot = LuaUtil.FindChild(effectObj.transform, "UI_newguy_point", true)
    maskPlaneTransform = LuaUtil.FindChild(maskObj.transform, "FX_NewGuy_Finger_mask_plane", true)
    if stepData.polyhedron_scale and 3 == #stepData.polyhedron_scale then
      LuaUtil.SetScale(effectObj, stepData.polyhedron_scale[1], stepData.polyhedron_scale[2], stepData.polyhedron_scale[3])
    else
      LuaUtil.SetScale(effectObj, 75, 75, 75)
    end
    if spineRoot then
      touchBol = false
      SkeletonAnimationUtil.SetAnimation(spineRoot.gameObject, 0, spineAnimNameBol and "in2" or "in", false, 0, function()
        SkeletonAnimationUtil.SetAnimation(spineRoot.gameObject, 0, spineAnimNameBol and "idle2" or "idle", true)
      end)
      if startAnimWait then
        LeanTween.cancel(startAnimWait.uniqueId)
        startAnimWait = nil
      end
      startAnimWait = LeanTween.delayedCall(0.4, function()
        if maskPlaneTransform then
          maskPlaneTransform.gameObject:SetActive(true)
        end
        touchBol = true
        startAnimWait = nil
      end)
    end
    uis.Main.Guide.Pointer.root.visible = true
    if stepData.effectsAdaptive then
      local wRatio = (GRoot.inst.width - 1334) / 2 - GuideWindow.GetScreenOffset()
      local hRatio = (GRoot.inst.height - 750) / 2
      uis.Main.Guide.Pointer.root.xy = Vector2(pos.x + stepData.polyhedron_pos[1] + wRatio, pos.y + stepData.polyhedron_pos[2] + hRatio)
    else
      uis.Main.Guide.Pointer.root.xy = Vector2(pos.x + stepData.polyhedron_pos[1], pos.y + stepData.polyhedron_pos[2])
    end
  else
    uis.Main.Guide.Pointer.root.xy = Vector2(pos.x, pos.y)
    uis.Main.Guide.Pointer.root.visible = false
  end
  if 0 ~= uis.Main.Guide.Mask.root.alpha then
    if stepData.polyhedron_mask_pos and 2 == #stepData.polyhedron_mask_pos then
      uis.Main.Guide.Mask.root.xy = Vector2(uis.Main.Guide.Pointer.root.x + stepData.polyhedron_mask_pos[1], uis.Main.Guide.Pointer.root.y + stepData.polyhedron_mask_pos[2])
    else
      uis.Main.Guide.Mask.root.xy = Vector2(uis.Main.Guide.Pointer.root.x, uis.Main.Guide.Pointer.root.y)
    end
    local x, y, z
    if stepData.polyhedron_mask_scale and 3 == #stepData.polyhedron_mask_scale then
      x = stepData.polyhedron_mask_scale[1] / 50
      y = stepData.polyhedron_mask_scale[2] / 50
      z = stepData.polyhedron_mask_scale[3] / 50
      LuaUtil.SetScale(maskPlaneTransform.gameObject, stepData.polyhedron_mask_scale[1], stepData.polyhedron_mask_scale[2], stepData.polyhedron_mask_scale[3])
    else
      LuaUtil.SetScale(maskPlaneTransform.gameObject, 50, 50, 50)
    end
    if 1 == stepData.polyhedron_type then
      LuaUtil.ChangeTextureValue(maskPlaneTransform.gameObject, "_MaskTex", "Assets/Art/TextureSingle/NewGuyMask/NewGuyFinger_sc_mask.png")
    else
      LuaUtil.ChangeTextureValue(maskPlaneTransform.gameObject, "_MaskTex", "Assets/Art/TextureSingle/NewGuyMask/NewGuyFinger_cr_mask.png")
    end
    local frame = uis.Main.Guide.Frame.root
    if stepData.polyhedron_pos then
      local borderX = uis.Main.Guide.Mask.root.x
      local borderY = uis.Main.Guide.Mask.root.y
      if stepData.border_pos and 2 == #stepData.border_pos then
        frame:SetXY(stepData.border_pos[1] + borderX, stepData.border_pos[2] + borderY)
      else
        frame:SetXY(borderX, borderY)
      end
      local frameEffect
      if 1 == stepData.polyhedron_type then
        frameEffect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/NewGuyFinger/FX_NewGut_Finger_Sc_light.prefab", uis.Main.Guide.Frame.EffectHolder, 0.866)
      else
        frameEffect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/NewGuyFinger/FX_NewGuy_Finger_pointlight.prefab", uis.Main.Guide.Frame.EffectHolder, 1.6)
      end
      if x and y and z then
        LuaUtil.SetScale(frameEffect, frameEffect.transform.localScale.x * x, frameEffect.transform.localScale.y * y, frameEffect.transform.localScale.z * z)
      end
      frame.visible = true
    else
      frame.visible = false
    end
  else
    uis.Main.Guide.Frame.root.visible = false
  end
  if stepData.type ~= GUIDE_STEP_TYPE_ENUM.NOT_CHANGE_LAYER then
    clickCtr.onClick:AddCapture(GuideWindow.ClickCtrOnClick)
  end
  if stepData.type ~= GUIDE_STEP_TYPE_ENUM.NOT_CHANGE_LAYER then
    if stepData.polyhedron_pos then
      local tempBtn = UIMgr:CreateComponent("Guide", "CloseBtn")
      tempBtn.alpha = 0
      uis.Main.Guide.root:AddChild(tempBtn)
      tempBtn:SetPivot(clickCtr.pivot.x, clickCtr.pivot.y, clickCtr.pivotAsAnchor)
      tempBtn:Center()
      tempBtn:SetSize(clickCtr.width, clickCtr.height)
      tempBtn:SetXY(clickCtr.x, clickCtr.y)
      GuideWindow.SetLevelUpDelayed(tempBtn)
      clickCtr.touchable = false
      if outAnimWait then
        LeanTween.cancel(outAnimWait.uniqueId)
        outAnimWait = nil
      end
      tempBtn.onClick:Set(function()
        if touchBol then
          if stepData.update_text and stepData.update_func() then
            clickCtr.onClick:Call()
            uis.Main.Guide.Frame.EffectHolder.visible = false
            uis.Main.Guide.Word.WordTxt.text = stepData.update_text()
            uis.Main.Guide.Frame.EffectHolder.visible = true
            return
          end
          if nil == outAnimWait then
            SkeletonAnimationUtil.SetAnimation(spineRoot.gameObject, 0, spineAnimNameBol and "out2" or "out", false, 0, function()
            end)
            outAnimWait = LeanTween.delayedCall(0.4, function()
              if clickCtr then
                clickCtr.touchable = true
                clickCtr.onClick:Call()
                tempBtn:Dispose()
              end
              outAnimWait = nil
              print("tempBtn:Dispose>>>>>>>>>>>>>>>")
            end)
          end
        end
      end)
    else
      GuideWindow.SetLevelUpDelayed(clickCtr)
    end
  end
end

function GuideWindow.SetLevelUpDelayed(touchCom)
  if stepData.window_name == WinResConfig.LevelUpWindow.name and stepData.ctrl_id == "TouchScreenBtn" then
    touchCom.touchable = false
    TimerUtil.setTimeout(3, function()
      if touchCom then
        touchCom.touchable = true
      end
    end)
  end
end

function GuideWindow.GetScreenOffset()
  return (GRoot.inst.root.width - uis.Main.root.width) / 2
end

function GuideWindow.SetClickCtrPos(parent, childIndex)
  local v2 = clickCtr:LocalToRoot(Vector2.zero, GRoot.inst.root)
  parent:AddChildAt(clickCtr, childIndex)
  clickCtr.xy = Vector2(v2.x - GuideWindow.GetScreenOffset(), v2.y)
end

function GuideWindow.ClickCtrOnClick()
  if stepData.is_goto_window and 1 == stepData.is_goto_window then
    UIMgr:CloseToWindow(WinResConfig.HomeWindow.name)
    return
  end
  if GuideMgr.ListenCompleteFunc then
    if GuideMgr.ListenCompleteFunc() == true then
      GuideMgr.ListenCompleteFunc = nil
      GuideWindow.Clear()
    end
  else
    GuideWindow.Clear()
  end
end

function GuideWindow.OnShown()
  stepData = GuideMgr.GetStepData()
  if stepData and (stepData.trigger_in_battle == "burst_card_show_2" or stepData.trigger_in_battle == "burst_card_show_3" or stepData.trigger_in_battle == "burst_card_show_4") and initedStepId == stepData.id then
    return
  end
  if uis then
    GuideWindow.Init()
  end
end

function GuideWindow.QuitStep()
  if clickCtr then
    clickCtr.onClick:RemoveCapture(GuideWindow.ClickCtrOnClick)
    if stepData.type ~= GUIDE_STEP_TYPE_ENUM.NOT_CHANGE_LAYER then
      lastParent:AddChildAt(clickCtr, lastIndex)
      clickCtr.xy = lastXy
      clickCtr.displayObject.position = lastPos
    end
  end
  clickCtr = nil
  print("clickCtr清除>>>>>>>>>>>>>>>>>>")
end

function GuideWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.GuideWindow.SHOW then
    if contentPane then
      contentPane.parent.visible = true
    end
  elseif msgId == WindowMsgEnum.GuideWindow.HIDE then
    if contentPane then
      contentPane.parent.visible = false
    end
  elseif msgId == WindowMsgEnum.GuideWindow.PUT_BACK then
    GuideWindow.QuitStep()
  elseif msgId == WindowMsgEnum.GuideWindow.CLEAR_HINT then
    BattleControl.Continue()
    GuideWindow.Clear()
  elseif msgId == WindowMsgEnum.GuideWindow.LOTTERY_CALLBACK then
    if stepData and stepData.id == 70710208 then
      GuideWindow.Clear()
    end
  elseif msgId == WindowMsgEnum.GuideWindow.REINIT and uis then
    GuideWindow.Init()
  end
end

function GuideWindow.OnClose()
  GuideWindow.QuitStep()
  stepData = nil
  uis = nil
  contentPane = nil
  clickCtr = nil
  lastParent = nil
  lastXy = nil
  lastIndex = nil
  lastPos = nil
  spineRoot = nil
  maskPlaneTransform = nil
end

return GuideWindow
