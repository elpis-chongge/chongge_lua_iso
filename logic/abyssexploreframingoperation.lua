local operation_pool, operation_sequence, tweeners
OP_TYPE = {
  EVENT_CREATE = 1,
  EVENT_DELETE = 2,
  EVENT_TRIGGER = 4,
  ILLUSTRATION_GET = 8,
  REGION_UNLOCK_TIPS = 16,
  FUNC_UNLOCK = 32,
  CINEMATICS = 64
}
local DefaultMutexLookup = {
  [OP_TYPE.EVENT_TRIGGER] = ~OP_TYPE.EVENT_DELETE,
  [OP_TYPE.ILLUSTRATION_GET] = ~OP_TYPE.EVENT_DELETE,
  [OP_TYPE.FUNC_UNLOCK] = ~OP_TYPE.EVENT_DELETE
}
local OP_STATUS = {
  IDLE = 1,
  BUSY = 2,
  DONE = 3
}
local CreateOperation = function(op_type, parallel, mutex)
  local inst
  local cnt = operation_pool and #operation_pool or 0
  if cnt > 0 then
    inst = table.remove(operation_pool)
  else
    inst = {
      args = {},
      done = function()
        local go = inst.go
        if go and not go:IsNull() then
          local goTrans = go.transform
          local child = goTrans:Find("Shadow")
          if child then
            ResourceManager.DestroyGameObject(child.gameObject)
          end
          ResourceManager.DestroyGameObject(go)
        end
        inst.go = false
        inst.status = OP_STATUS.DONE
        inst.duration = nil
        for k, _ in pairs(inst.args) do
          local arg = inst.args[k]
          inst.args[k] = false
          if type(arg) == "function" then
            arg()
          end
        end
      end
    }
  end
  inst.type = op_type
  inst.elapse = 0
  inst.parallel = parallel
  mutex = mutex or DefaultMutexLookup[op_type]
  inst.mutex = mutex
  inst.status = OP_STATUS.IDLE
  operation_sequence = operation_sequence or {}
  table.insert(operation_sequence, inst)
  return inst
end
local AddTweener = function(tweenId)
  tweeners = tweeners or {}
  table.insert(tweeners, tweenId)
end
local RemoveTweener = function(tweenId)
  if tweeners then
    for i, id in ipairs(tweeners) do
      if id == tweenId then
        table.remove(tweeners, i)
        break
      end
    end
  end
end
local PauseTweeners = function(isPause)
  if tweeners then
    local fun = isPause and LeanTween.pause or LeanTween.resume
    for _, tweenId in ipairs(tweeners) do
      fun(tweenId)
    end
  end
end
local OnEventCreate = function(operation)
  local args = operation.args
  local grid, event = args.grid, args.eventInfo
  local e_type, e_subtype = event.type, event.subtype
  local loadImmediately = true
  if e_type == AbyssExploreEventID.BRANCH or e_type == AbyssExploreEventID.BRANCH_ACTIVITY then
    loadImmediately = false
    AbyssExploreMgr.PopupExclamation(3, function()
      UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.SET_VISIBLE, false)
    end, function()
      local first_trigger = 0 == event.plotNodeId and e_type == AbyssExploreEventID.BRANCH
      local delay, duration0, duration1 = 0.8, 0.5, 0.5
      AbyssExploreMgr.EnableGestureOp(false)
      AbyssExploreMgr.EnableCameraFollow(false)
      local tweenId, afterDelayCallback
      if first_trigger then
        function afterDelayCallback()
          RemoveTweener(tweenId)
          
          OpenWindow(WinResConfig.CardPlotStartWindow.name, nil, event)
        end
      else
        function afterDelayCallback()
          RemoveTweener(tweenId)
          
          tweenId = AbyssExploreCamCtrl.MoveTo(AbyssExploreChrCtrl.GetPosition(), duration1, function()
            AbyssExploreMgr.EnableGestureOp(true)
            AbyssExploreMgr.EnableCameraFollow(true)
            RemoveTweener(tweenId)
          end)
          AddTweener(tweenId)
        end
      end
      tweenId = AbyssExploreCamCtrl.MoveTo(grid.center, duration0, function()
        RemoveTweener(tweenId)
        tweenId = LeanTween.delayedCall(delay, afterDelayCallback).id
        AddTweener(tweenId)
      end)
      AddTweener(tweenId)
      if not first_trigger then
        operation.duration = delay + duration0 + duration1
      end
      UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.SET_VISIBLE, true)
      UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.TRIGGER_BRANCH, event)
      AbyssExploreMgr.LoadEventRes(event, grid)
    end)
  elseif e_type == AbyssExploreEventID.POSITIVE and (e_subtype == AbyssExploreSubEventID.BATTLE or e_subtype == AbyssExploreSubEventID.TREASURE) then
    local path = "Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_MapAdventure_itemreflash.prefab"
    local o = ResourceManager.Instantiate(path)
    local transform = o.transform
    local offset = Vector3(-0.06, 0.6, 0)
    transform.position = grid.center + offset
    LuaUtil.PlayEffect(o)
    EffectUtil.SetAutoDestroyCallback(o, function()
      ResourceManager.DestroyGameObject(o)
    end)
  end
  if loadImmediately then
    AbyssExploreMgr.LoadEventRes(event, grid)
    operation.done()
  end
end
local OnEventDelete = function(operation)
  local args = operation.args
  local grid, event = args.grid, args.eventInfo
  local e_type, e_subtype = event.type, event.subtype
  local destroyedCallback
  if e_type == AbyssExploreEventID.POSITIVE then
    if e_subtype == AbyssExploreSubEventID.BATTLE then
      function destroyedCallback(go)
        go:SetActive(true)
        
        operation.go = go
        local dissolveDuration = 0.5
        local animationDuration = SkeletonAnimationUtil.GetAnimationTime(go, SPINE_STATE_ENUM.DIE)
        operation.duration = animationDuration + dissolveDuration
        SkeletonAnimationUtil.SetAnimation(go, 0, SPINE_STATE_ENUM.DIE, false, function()
          local path = string.format("Assets/Art/TextureSingle/SpineEffect/dissolve%d.png", math.random(1, 10))
          SkeletonAnimationUtil.Dissolve(go, path, dissolveDuration, false)
        end)
      end
    elseif e_subtype == AbyssExploreSubEventID.TREASURE then
      function destroyedCallback(go)
        local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Expedition/FX_ui_expetion_buff_choose.prefab")
        
        effect.transform.position = go.transform.position
        ResourceManager.DestroyGameObject(go)
        operation.go = effect
        operation.duration = EffectUtil.GetEffectDuration(effect)
        LuaUtil.PlayEffect(effect)
      end
    end
  end
  if type(destroyedCallback) ~= "function" then
    AbyssExploreMapCtrl.DestroyEventRes(event, grid)
    operation.done()
  else
    local remove = AbyssExploreMapCtrl.DestroyEventRes(event, grid, nil, destroyedCallback)
    if not remove then
      operation.done()
    end
  end
end
local OnEventTrigger = function(operation)
  local args = operation.args
  local callback = args.callback
  AbyssExploreChrCtrl.StopMovingAfter(1)
  AbyssExploreMgr.PopupExclamation(1, function()
    UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.SET_VISIBLE, false)
  end, function()
    UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.SET_VISIBLE, true)
    if type(callback) == "function" then
      callback()
    end
    operation.done()
  end)
end
local OnIllustrationGet = function(operation)
  local args = operation.args
  local id, itemType = args.itemId, args.itemType
  AbyssExploreChrCtrl.StopMovingAfter(1)
  AbyssExploreMgr.PopupExclamation(1, function()
    UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.SET_VISIBLE, false)
  end, function()
    OpenWindow(WinResConfig.HandBookEventWindow.name, nil, itemType, id)
  end)
end
local OnRegionUnlockTips = function(operation)
  local args = operation.args
  local regionId = args.regionId
  local showTips = args.showTips
  if showTips then
    AbyssExploreChrCtrl.StopMovingAfter(1)
    OpenWindow(WinResConfig.AbyssRegionOpenWindow.name, nil, regionId)
  else
    operation.done()
  end
end
local OnFuncUnlock = function(operation)
  local window = UIMgr:GetWindow(WinResConfig.AbyssWindow.name)
  local components = GetAbyss_AbyssWindowUis(window.contentPane)
  local buttons = components.Main.RightRegionList
  AbyssExploreChrCtrl.StopMovingAfter(1)
  AbyssExploreMgr.EnableGestureOp(false)
  local component = buttons:GetChildAt(0)
  local screenAdapt = UIMgr.ScreenAdaptRatio / 100
  local width = window.contentPane.width * (1 - (1 - UIMgr.maxScreenScale) * screenAdapt)
  local diff = (window.width - width) / 2
  local globalPosition = component:LocalToRoot(Vector2(component.width * 0.5, component.height * 0.5))
  globalPosition.x = globalPosition.x - diff
  local args = operation.args
  local funcId = args.funcId
  OpenWindow(WinResConfig.AbyssFunctionOpenWindow.name, nil, funcId, globalPosition, function()
    GuideData.SaveCaptionOpen(funcId + 20000)
    AbyssExploreMgr.EnableGestureOp(true)
    operation.done()
  end)
end
local OnCinematics = function(operation)
  local args = operation.args
  local eventInfo = args.eventInfo
  local isTimeline = args.isTimeline
  if isTimeline then
    local view = eventInfo.view
    if view and not view:IsNull() then
      local tweenId
      local child = LuaUtil.FindChild(view, "timeline", true)
      local director = child:GetComponent(typeof(CS.UnityEngine.Playables.PlayableDirector))
      local duration = 1
      local pos = AbyssExploreMapCtrl.GridToWorld(eventInfo.x, eventInfo.y)
      AbyssExploreCamCtrl.Follow(pos, 1)
      AbyssExploreMgr.EnableCameraFollow(false)
      AbyssExploreMgr.EnableGestureOp(false)
      local elapse = 0
      tweenId = LeanTween.delayedCall(duration, function()
        director:Pause()
        LuaUtil.PlayEffect(view)
        AbyssExploreMgr.EnableCameraFollow(true)
        AbyssExploreMgr.EnableGestureOp(true)
        RemoveTweener(tweenId)
      end):setOnUpdate(function()
        elapse = elapse + Time.deltaTime
        director.time = elapse
        director:Evaluate()
      end).id
      AddTweener(tweenId)
      operation.duration = duration
    else
      operation.done()
    end
  end
end
local StartOperation = function(operation)
  local op_type = operation.type
  if op_type == OP_TYPE.EVENT_CREATE then
    OnEventCreate(operation)
  elseif op_type == OP_TYPE.EVENT_DELETE then
    OnEventDelete(operation)
  elseif op_type == OP_TYPE.EVENT_TRIGGER then
    OnEventTrigger(operation)
  elseif op_type == OP_TYPE.ILLUSTRATION_GET then
    OnIllustrationGet(operation)
  elseif op_type == OP_TYPE.REGION_UNLOCK_TIPS then
    OnRegionUnlockTips(operation)
  elseif op_type == OP_TYPE.FUNC_UNLOCK then
    OnFuncUnlock(operation)
  elseif op_type == OP_TYPE.CINEMATICS then
    OnCinematics(operation)
  end
end
local Update = function(deltaTime)
  local index, cnt = 1, operation_sequence and #operation_sequence or 0
  while index > 0 and index <= cnt do
    local operation = operation_sequence[index]
    if operation.status == OP_STATUS.IDLE then
      if 1 == index then
        operation.status = OP_STATUS.BUSY
        StartOperation(operation)
      elseif operation.parallel then
        local mutex = false
        if type(operation.mutex) == "number" then
          for i = 1, #operation_sequence do
            if operation_sequence[i].status == OP_STATUS.BUSY and 0 ~= operation.mutex & operation_sequence[i].type then
              mutex = true
              break
            end
          end
        end
        if not mutex then
          operation.status = OP_STATUS.BUSY
          StartOperation(operation)
        end
      end
    end
    if operation.status == OP_STATUS.BUSY then
      local elapse = operation.elapse
      local duration = operation.duration
      if type(duration) == "number" then
        elapse = elapse + deltaTime
        operation.elapse = elapse
        if duration < elapse then
          operation.done()
        end
      end
    end
    if operation.status == OP_STATUS.DONE then
      local removed = table.remove(operation_sequence, index)
      for k, _ in pairs(removed.args) do
        removed.args[k] = false
      end
      operation_pool = operation_pool or {}
      table.insert(operation_pool, removed)
      cnt = cnt - 1
      index = index - 1
    end
    index = index + 1
  end
end
local Pause = function(pause)
  PauseTweeners(pause)
end
local Callback_OnIllustrationACK = function(itemId)
  if not operation_sequence then
    return
  end
  for _, operation in pairs(operation_sequence) do
    local id = operation.args.itemId
    if type(id) == "number" and id == itemId then
      operation.done()
      break
    end
  end
end
local Callback_OnBranchStartACK = function(eventId)
  if not operation_sequence then
    return
  end
  for _, operation in pairs(operation_sequence) do
    local args = operation.args
    if operation.type == OP_TYPE.EVENT_CREATE then
      local eventInfo = args.eventInfo
      if eventInfo.eventId == eventId then
        local delay, duration, tweenId = 0.5, 0.5
        tweenId = LeanTween.delayedCall(delay, function()
          RemoveTweener(tweenId)
          tweenId = AbyssExploreCamCtrl.MoveTo(AbyssExploreChrCtrl.GetPosition(), duration, function()
            AbyssExploreMgr.EnableGestureOp(true)
            AbyssExploreMgr.EnableCameraFollow(true)
            RemoveTweener(tweenId)
          end)
          AddTweener(tweenId)
        end).id
        AddTweener(tweenId)
        operation.duration = delay + duration
        break
      end
    end
  end
end
local Callback_OnRegionUnlockACK = function(regionId)
  if not operation_sequence then
    return
  end
  for _, operation in pairs(operation_sequence) do
    local id = operation.args.regionId
    if type(id) == "number" and id == regionId then
      operation.done()
      break
    end
  end
end
local Release = function()
  AbyssExploreMgr.RemoveListener(AbyssExploreMsgEnum.ILLUSTRATION_ACK, Callback_OnIllustrationACK)
  AbyssExploreMgr.RemoveListener(AbyssExploreMsgEnum.BRANCH_START_ACK, Callback_OnBranchStartACK)
  AbyssExploreMgr.RemoveListener(AbyssExploreMsgEnum.REGION_UNLOCK_ACK, Callback_OnRegionUnlockACK)
  if tweeners then
    for i, tweenId in pairs(tweeners) do
      LeanTween.cancel(tweenId)
    end
  end
  tweeners = nil
  if operation_sequence then
    for _, operation in pairs(operation_sequence) do
      operation.done()
    end
  end
  operation_sequence = nil
end
local Init = function()
  tweeners = {}
  AbyssExploreMgr.AddListener(AbyssExploreMsgEnum.ILLUSTRATION_ACK, Callback_OnIllustrationACK)
  AbyssExploreMgr.AddListener(AbyssExploreMsgEnum.BRANCH_START_ACK, Callback_OnBranchStartACK)
  AbyssExploreMgr.AddListener(AbyssExploreMsgEnum.REGION_UNLOCK_ACK, Callback_OnRegionUnlockACK)
end
return {
  CreateOperation = CreateOperation,
  Update = Update,
  Pause = Pause,
  Init = Init,
  Release = Release
}
