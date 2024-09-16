local GESTURE_HANDLE_KEY = {
  CLICK = "CLICK",
  DOUBLE_CLICK = "DOUBLE_CLICK",
  LONG_PRESS = "LONG_PRESS",
  DRAG = "DRAG",
  SWIPE = "SWIPE",
  PINCH = "PINCH"
}
local GESTURE_HANDLE = {
  CLICK = "OnClick",
  DOUBLE_CLICK = "OnDoubleClick",
  LONG_PRESS = "OnLongPress",
  DRAG = "OnDrag",
  DRAG_BEGIN = "OnDragBegin",
  DRAG_END = "OnDragEnd",
  SWIPE = "OnSwipe",
  PINCH = "OnPinch"
}
local listeners, fingerGestures, gestureCapturer
local ContinuousGesturePhase = CS.ContinuousGesturePhase
local IsTouchOnUI = function(gobj)
  if not gobj or gobj.isDisposed then
    return
  end
  local btn = gobj.asButton
  if btn then
    if btn.name == "TouchScreenBtn" then
      return false
    end
    return true
  end
  local loader = gobj.asLoader
  if loader then
    return loader.texture ~= nil and loader.alpha > 0.8
  end
  local text = gobj.asTextField
  if text then
    return text.parent.asButton or text.alpha > 0.8
  end
  local gcmp = gobj.asCom
  if gcmp then
    return gcmp.opaque
  end
  return false
end
local Broadcast = function(gestureKey, gesture)
  if listeners then
    if gestureKey == GESTURE_HANDLE_KEY.CLICK or gestureKey == GESTURE_HANDLE_KEY.DOUBLE_CLICK or gestureKey == GESTURE_HANDLE_KEY.LONG_PRESS then
      local touchTarget = Stage.inst.touchTarget
      if touchTarget and IsTouchOnUI(touchTarget.gOwner) then
        return
      end
    end
    local handle = GESTURE_HANDLE[gestureKey]
    if gestureKey == GESTURE_HANDLE_KEY.DRAG then
      local phase = gesture.Phase
      if phase == ContinuousGesturePhase.Started then
        handle = GESTURE_HANDLE.DRAG_BEGIN
      elseif phase == ContinuousGesturePhase.Ended then
        handle = GESTURE_HANDLE.DRAG_END
      end
    end
    if type(handle) == "string" then
      local hitTransform = gesture.Hit.transform
      if hitTransform then
        local cardSpineTouchEvent = hitTransform:GetComponentInParent(typeof(CS.CardSpineTouchEvent))
        if not cardSpineTouchEvent or cardSpineTouchEvent:IsNull() then
          return
        end
        local eventAnimationEntries = cardSpineTouchEvent.eventAnimationEntries
        if nil ~= eventAnimationEntries then
          for i = 1, eventAnimationEntries.Count do
            local eventAnimationEntry = eventAnimationEntries[i - 1]
            local colliderTransform = eventAnimationEntry.collider and eventAnimationEntry.collider.transform
            if colliderTransform == hitTransform and eventAnimationEntry.gesture == gestureKey then
              local animationEntries = eventAnimationEntry.animationEntries
              if animationEntries then
                for j = 1, animationEntries.Count do
                  local animationEntry = animationEntries[j - 1]
                  local listener = listeners[cardSpineTouchEvent]
                  if listener and type(listener[handle]) == "function" then
                    listener[handle](animationEntry.skeletonAnimation, animationEntry.animation, gesture)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
local Callback_OnFingerUp = function(fingerEvent)
end
local Callback_OnFingerDown = function(fingerEvent)
end
local Callback_OnFingerMotion = function(fingerEvent)
end
local Callback_OnFingerStationary = function(fingerEvent)
end
local Callback_OnDrag = function(gesture)
  Broadcast(GESTURE_HANDLE_KEY.DRAG, gesture)
end
local Callback_OnTap = function(gesture)
  local taps = gesture.Taps
  if taps < 2 then
    Broadcast(GESTURE_HANDLE_KEY.CLICK, gesture)
  elseif 2 == taps then
    Broadcast(GESTURE_HANDLE_KEY.DOUBLE_CLICK, gesture)
  end
end
local Callback_OnSwipe = function(gesture)
  Broadcast(GESTURE_HANDLE_KEY.SWIPE, gesture)
end
local Callback_OnLongPress = function(gesture)
  Broadcast(GESTURE_HANDLE_KEY.LONG_PRESS, gesture)
end
local Callback_OnPinch = function(gesture)
  Broadcast(GESTURE_HANDLE_KEY.PINCH, gesture)
end
local Init = function()
  local CS, typeof = CS, typeof
  if not fingerGestures then
    fingerGestures = ResourceManager.Instantiate("Assets/Art/Models/FingerGestures/FingerGestures.prefab")
  end
  local raycaster = fingerGestures:GetOrAddComponent(typeof(CS.ScreenRaycaster))
  raycaster:SetCamera(FairyGUI.StageCamera.main)
end
local GetRecognizer = function(cs_type, requiredFingers)
  local recognizer
  local typeof_cs = typeof(cs_type)
  local components = fingerGestures:GetComponents(typeof_cs)
  if cs_type == CS.PinchRecognizer or cs_type == CS.TwistGesture then
    requiredFingers = 2
  end
  if components then
    for j = 1, components.Length do
      local component = components[j - 1]
      if component.RequiredFingerCount == requiredFingers then
        recognizer = component
        break
      end
    end
  end
  if not recognizer then
    recognizer = fingerGestures:AddComponent(typeof_cs)
    recognizer.RequiredFingerCount = requiredFingers
  end
  return recognizer
end
local OnAddListener = function(listener, csObj)
  gestureCapturer = gestureCapturer or {}
  local eventAnimationEntries = csObj.eventAnimationEntries
  if eventAnimationEntries then
    for i = 1, eventAnimationEntries.Count do
      local eventAnimationEntry = eventAnimationEntries[i - 1]
      local gesture = eventAnimationEntry.gesture
      local requiredFingers = eventAnimationEntry.requiredFingers
      local group = gestureCapturer[requiredFingers]
      if not group then
        group = {}
        gestureCapturer[requiredFingers] = group
      end
      local capturer = group[gesture]
      if not capturer then
        local recognizer, callback
        if gesture == GESTURE_HANDLE_KEY.CLICK or gesture == GESTURE_HANDLE_KEY.DOUBLE_CLICK then
          local requiredTaps = gesture == GESTURE_HANDLE_KEY.CLICK and 1 or 2
          local cs_type = typeof(CS.TapRecognizer)
          local components = fingerGestures:GetComponents(cs_type)
          if components then
            for j = 1, components.Length do
              local component = components[j - 1]
              if component.RequiredTaps == requiredTaps and component.RequiredFingerCount == requiredFingers then
                recognizer = component
                break
              end
            end
          end
          if not recognizer then
            recognizer = fingerGestures:AddComponent(cs_type)
            recognizer.RequiredTaps = requiredTaps
            recognizer.RequiredFingerCount = requiredFingers
          end
          callback = Callback_OnTap
        elseif gesture == GESTURE_HANDLE_KEY.LONG_PRESS then
          recognizer = GetRecognizer(CS.LongPressGesture, requiredFingers)
          callback = Callback_OnLongPress
        elseif gesture == GESTURE_HANDLE_KEY.DRAG then
          recognizer = GetRecognizer(CS.DragRecognizer, requiredFingers)
          callback = Callback_OnDrag
        elseif gesture == GESTURE_HANDLE_KEY.SWIPE then
          recognizer = GetRecognizer(CS.SwipeRecognizer, requiredFingers)
          callback = Callback_OnSwipe
        elseif gesture == GESTURE_HANDLE_KEY.PINCH then
          recognizer = GetRecognizer(CS.PinchRecognizer, requiredFingers)
          callback = Callback_OnPinch
        end
        capturer = {
          recognizer = recognizer,
          callback = callback,
          refs = 0
        }
        group[gesture] = capturer
      end
      if capturer then
        if 0 == capturer.refs then
          capturer.recognizer.enabled = true
          capturer.recognizer:OnGesture("+", capturer.callback)
        end
        capturer.refs = capturer.refs + 1
      end
    end
  end
end
local OnRemoveListener = function(listener, csObj)
  local eventAnimationEntries = csObj.eventAnimationEntries
  if eventAnimationEntries then
    for i = 1, eventAnimationEntries.Count do
      local eventAnimationEntry = eventAnimationEntries[i - 1]
      local gesture = eventAnimationEntry.gesture
      local requiredFingers = eventAnimationEntry.requiredFingers
      local capturer = gestureCapturer[requiredFingers][gesture]
      if capturer and capturer.refs > 0 then
        capturer.refs = capturer.refs - 1
        if capturer.refs <= 0 then
          local recognizer = capturer.recognizer
          recognizer:OnGesture("-", capturer.callback)
          recognizer.enabled = false
        end
      end
    end
  end
end
local AddListener = function(listener, csObj)
  listeners = listeners or {}
  if not listeners[csObj] then
    csObj.clearModuleOnDestroy = false
    listeners[csObj] = listener
    OnAddListener(listener, csObj)
  end
end
local RemoveListener = function(listener, csObj)
  if listeners and csObj then
    listeners[csObj] = nil
    OnRemoveListener(listener, csObj)
  end
end
local Release = function()
  if listeners then
    for csObj, listener in pairs(listeners) do
      OnRemoveListener(listener, csObj)
    end
  end
  if gestureCapturer then
    for fingers, group in pairs(gestureCapturer) do
      for gesturekey, item in pairs(group) do
        item.recognizer = nil
      end
    end
  end
  if fingerGestures then
    ResourceManager.DestroyGameObject(fingerGestures)
  end
  listeners = nil
  fingerGestures = nil
  gestureCapturer = nil
end
return {
  Init = Init,
  Release = Release,
  AddListener = AddListener,
  RemoveListener = RemoveListener
}
