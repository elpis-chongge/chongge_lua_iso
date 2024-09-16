local cameraFollow = true
local cameraFollowLerpVal = 1
local listeners, Init, InitAsync, Release
local unpack = unpack or table.unpack
local open_time_regions
local initialized, enabled, gesturable, pause = false, true, -1, 0
local delayMotion
local EXCLAM_PHASE = {
  START = 1,
  BEFORE_ANIM = 2,
  ANIMING = 3,
  END = 4
}
local exclamCache, exclamElapse, exclamDuration, exclamPhase, __onexclamstart, __onexclamend
local MAP_ID_OFFSET_IN_TBL = 75000001
local cachedMapId, gridUserdataCollection, mapdebug, navigationLine
local pack = function(...)
  local params = {
    ...
  }
  params.n = select("#", ...)
  return params
end
local merge = function(args_src, args_dst)
  for i = 1, args_src.n do
    args_dst[i + args_dst.n] = args_src[i]
  end
  args_dst.n = args_dst.n + args_src.n
  return args_dst
end
local bindFunc = function(func)
  return function(...)
    func(...)
  end
end
local bindFuncWithParam = function(func, ...)
  local params = pack(...)
  return function(...)
    local args = merge(params, pack(...))
    func(unpack(args, 1, args.n))
  end
end
local AddListener = function(msgEnum, func)
  if not listeners then
    return
  end
  if not listeners[msgEnum] then
    listeners[msgEnum] = {}
  end
  table.insert(listeners[msgEnum], {
    key = func,
    callback = bindFunc(func)
  })
end
local AddListenerWithParams = function(msgEnum, func, ...)
  if not listeners then
    return
  end
  if not listeners[msgEnum] then
    listeners[msgEnum] = {}
  end
  table.insert(listeners[msgEnum], {
    key = func,
    callback = bindFuncWithParam(func, ...)
  })
end
local RemoveListener = function(msgEnum, func)
  if not listeners then
    return
  end
  if not listeners[msgEnum] or not _G.next(listeners[msgEnum]) then
    return
  end
  local n = #listeners[msgEnum]
  for i = 1, n do
    if listeners[msgEnum][i].key == func then
      table.remove(listeners[msgEnum], i)
      break
    end
  end
end
local Dispatch = function(msgEnum, ...)
  if not listeners then
    return
  end
  if listeners[msgEnum] then
    for _, v in pairs(listeners[msgEnum]) do
      v.callback(...)
    end
  end
end
local SetActive = function(active)
  if not initialized then
    return
  end
  AbyssExploreCamCtrl.SetActive(active)
  AbyssExploreChrCtrl.SetActive(active)
  AbyssExploreMapCtrl.SetActive(active)
  enabled = active
  AbyssExploreFramingOperation.Pause(not active)
  if mapdebug then
    mapdebug.gameObject:SetActive(active)
  end
  if active then
    CS.InputGesture.sharedInst.camera = AbyssExploreCamCtrl.GetCameraInst()
  end
  if not active then
    AbyssExploreMapCtrl.DestroyAllItems(true)
  else
    local mapcam = AbyssExploreCamCtrl.GetMapcamInst()
    local viewBounds = mapcam:GetViewBounds()
    AbyssExploreMapCtrl.UpdateMapItems(viewBounds)
  end
end
local SetPause = function(isPause)
  if isPause then
    pause = pause + 1
  else
    pause = pause - 1
  end
end
local pauseUpdate
local PauseUpdate = function(isPause)
  if not initialized then
    return
  end
  pauseUpdate = isPause
end
local EnableGestureOp = function(enable)
  if not initialized then
    return
  end
  gesturable = enable and gesturable + 1 or gesturable - 1
  AbyssExploreCamCtrl.SetDraggable(enable)
end
local IsGesturable = function()
  return gesturable >= 0
end
local DontIgnoreBuild_Boss_Exped = function(grid)
  local eventInfo = grid.userdata
  if type(eventInfo) == "table" then
    local e_type = eventInfo.type
    local result = e_type ~= AbyssExploreEventID.BUILDING and e_type ~= AbyssExploreEventID.CHALLENGE_BOSS and e_type ~= AbyssExploreEventID.EXPEDITION_BUILDING
    return result
  end
  return true
end
local LockedOrClearedRegionIsNotAvailable = function(grid)
  local regionId = grid.regionId
  local unlock = AbyssExploreMgr.RegionIsUnlock(regionId)
  local cleared = AbyssExploreMgr.RegionIsCleared(regionId)
  return not cleared and unlock
end
local SearchPath = function(destPosition, ...)
  local position = AbyssExploreChrCtrl.GetPosition()
  local grid = AbyssExploreMapCtrl.WorldToGrid(destPosition)
  local revert_group = false
  local to = grid and grid.center or destPosition
  if grid then
    local regionId = grid.regionId
    if not AbyssExploreMgr.RegionIsUnlock(regionId) then
      Dispatch(AbyssExploreMsgEnum.PATHFIND_FAILURE_UNLOCK_REGION, position, to, ...)
      return
    end
    local eventInfo = grid.userdata
    if eventInfo and grid.isObstacle then
      revert_group = true
      AbyssExploreMapCtrl.SetGroupGridsIsObstacle(eventInfo.eventId, false)
    end
  end
  AbyssExploreMapCtrl.SearchPath(position, to, ...)
  if revert_group then
    AbyssExploreMapCtrl.SetGroupGridsIsObstacle(grid.userdata.eventId, true)
  end
end
local SearchPathToGrid = function(gridx, gridy, ...)
  local dst = AbyssExploreMapCtrl.GridToWorld(gridx, gridy)
  if dst then
    SearchPath(dst, ...)
  end
end
local WorldToScreenPoint = function(position)
  local cam = AbyssExploreCamCtrl.GetCameraInst()
  local sp = cam:WorldToScreenPoint(position)
  local pos = GRoot.inst:GlobalToLocal(Vector2(sp.x, Screen.height - sp.y))
  return pos
end
local GridToScreenPoint = function(gridx, gridy)
  local position = AbyssExploreMapCtrl.GridToWorld(gridx, gridy)
  return WorldToScreenPoint(position)
end
local newBounds = CS.UnityEngine.Bounds
local CalcEventCenterPosInWorld = function(eventInfo)
  if eventInfo.positions then
    local smallBounds = newBounds(Vector3.negativeInfinity, Vector3.negativeInfinity)
    for i, v in pairs(eventInfo.positions) do
      local position = AbyssExploreMapCtrl.GridToWorld(v.x, v.y)
      if position then
        smallBounds:Encapsulate(position)
      end
    end
    return smallBounds.center
  end
end
local EnableCameraFollow = function(enable)
  local prev = cameraFollow
  cameraFollow = enable
  if not prev and cameraFollow then
    cameraFollowLerpVal = 0.0
  end
end
local UpdateFocusedEventsPathInfo = function()
  local events = AbyssExploreData.GetFocusEvents()
  if events then
    for i, v in ipairs(events) do
      local eventInfo = v
      local x, y = eventInfo.x, eventInfo.y
      local location = eventInfo.location
      if location then
        x, y = location.x, location.y
      end
      SearchPathToGrid(x, y, AbyssPathfindingType.Navigation_Event, false, nil, eventInfo)
    end
  end
end
local UpdateBranchesPathInfo = function()
  local events = AbyssExploreData.GetProcessingBranchEvents()
  local cnt = events and #events or 0
  for i = 1, cnt do
    local eventInfo = events[i]
    AbyssExploreMapCtrl.IgnoreObstacle(true)
    AbyssExploreMapCtrl.SetIgnoreFunc(DontIgnoreBuild_Boss_Exped)
    local pos = AbyssExploreChrCtrl.GetPosition()
    local dst = AbyssExploreMapCtrl.GridToWorld(eventInfo.x, eventInfo.y)
    local _, steps = AbyssExploreMapCtrl.GetMapLogicInst().pathFinder:Search(pos, dst)
    local dir = dst - pos
    local angle = Vector3.SignedAngle(Vector3.up, dir, -Vector3.forward)
    Dispatch(AbyssExploreMsgEnum.EVENT_BRANCH_PATH_INFO, i, eventInfo, steps and math.max(steps.Count - 2, 0), angle)
    AbyssExploreMapCtrl.IgnoreObstacle(false)
  end
end
local CheckAndDeleteOutdateEvents = function()
  local events = AbyssExploreData.GetAllEvents()
  if events then
    local timestamp = LoginData.GetCurServerTime()
    for _, evt in pairs(events) do
      local deadlineTimestamp = evt.deadlineTimestamp
      if type(deadlineTimestamp) == "number" and timestamp >= deadlineTimestamp then
        AbyssExploreMapCtrl.DeleteEvent(evt.eventId)
      end
    end
  end
end
local ExclamationPath = {
  [1] = "Assets/Art/Models/UI_spine/prefab/tanxianbiaoqing1.prefab",
  [2] = "Assets/Art/Models/UI_spine/prefab/tanxianbiaoqing2.prefab",
  [3] = "Assets/Art/Models/UI_spine/prefab/tanxianbiaoqing3.prefab"
}
local PopupExclamation = function(type, onstartCallback, onendCallback, delay)
  EnableGestureOp(false)
  if not exclamCache then
    local path = ExclamationPath[type]
    exclamCache = ResourceManager.Instantiate(path)
    local renderer = exclamCache:GetComponent(typeof(CS.UnityEngine.Renderer))
    renderer.sortingOrder = AbyssExploreSettings.CHR.sortingOrder + 10
  end
  exclamCache:SetActive(false)
  exclamElapse = 0
  exclamDuration = delay or 0
  __onexclamstart = onstartCallback
  __onexclamend = onendCallback
  exclamPhase = EXCLAM_PHASE.START
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_explore_attention")
end
local exclamAnimSpeed = 1.5
local UpdateExclamation = function()
  if exclamCache then
    local position = AbyssExploreChrCtrl.GetPosition()
    local scaleX = AbyssExploreChrCtrl.GetScaleX()
    local positionOffset = Vector3(0.125 * scaleX, 1, -0.5)
    position = position + positionOffset
    exclamCache.transform.position = position
    SkeletonAnimationUtil.GetSkeletonAnimation(exclamCache).skeleton.ScaleX = scaleX
  end
  if exclamPhase then
    exclamElapse = exclamElapse + Time.deltaTime
    local animName = "1"
    if exclamPhase == EXCLAM_PHASE.START then
      if exclamElapse > exclamDuration then
        exclamElapse = 0
        exclamDuration = 0.05
        exclamPhase = EXCLAM_PHASE.BEFORE_ANIM
        local callback = __onexclamstart
        __onexclamstart = nil
        if type(callback) == "function" then
          callback()
        end
      end
    elseif exclamPhase == EXCLAM_PHASE.BEFORE_ANIM then
      if exclamElapse > exclamDuration then
        exclamElapse = 0
        exclamDuration = SkeletonAnimationUtil.GetAnimationTime(exclamCache, animName) / exclamAnimSpeed
        exclamPhase = EXCLAM_PHASE.ANIMING
        exclamCache:SetActive(true)
        local sa = SkeletonAnimationUtil.GetSkeletonAnimation(exclamCache)
        sa.state:ClearTrack(0)
        SkeletonAnimationUtil.SetAnimation(exclamCache, 0, animName, false, nil, false, nil, exclamAnimSpeed)
      end
    elseif exclamPhase == EXCLAM_PHASE.ANIMING and exclamElapse > exclamDuration then
      exclamPhase = EXCLAM_PHASE.END
      ResourceManager.DestroyGameObject(exclamCache)
      exclamCache = nil
      local callback = __onexclamend
      __onexclamend = nil
      if type(callback) == "function" then
        callback()
      end
      EnableGestureOp(true)
    end
  end
end
local SetChildActive = function(transform, childName, active, includeChildren)
  local child = LuaUtil.FindChild(transform, childName, true)
  if child then
    child.gameObject:SetActive(active)
    if includeChildren then
      for i = 1, child.childCount do
        local cc = child:GetChild(i - 1)
        cc.gameObject:SetActive(active)
      end
    end
  end
end
local OnLoadedCallback = function(eventInfo, go)
  local e_type = eventInfo.type
  if e_type == AbyssExploreEventID.BRANCH or e_type == AbyssExploreEventID.BRANCH_ACTIVITY then
    local transform = go.transform
    local eff = transform:GetChild(0)
    if eventInfo.storyRecords then
      local eff_go = eff.gameObject
      if _G.next(eventInfo.storyRecords) or eventInfo.finishTimestamp > 0 then
        eff_go:SetActive(false)
      else
        eff_go:SetActive(true)
        SkeletonAnimationUtil.SetAnimation(eff_go, 0, "in", false)
        SkeletonAnimationUtil.AddAnimation(eff_go, 0, "idle", true, 0)
      end
    end
  elseif e_type == AbyssExploreEventID.PORTAL then
    local goTrans = go.transform
    local timeline = LuaUtil.FindChild(go, "timeline")
    local child = LuaUtil.FindChild(go, "MapAdventure_portal_under_2", true)
    child:GetComponent(typeof(CS.UnityEngine.SpriteRenderer)).sortingOrder = 0
    local director = timeline:GetComponent(typeof(CS.UnityEngine.Playables.PlayableDirector))
    director.playOnAwake = false
    director:Stop()
    if eventInfo.precondition then
      local allfinish = true
      for i, v in pairs(eventInfo.precondition) do
        if not AbyssExploreMgr.IsFinished(v) then
          allfinish = false
          break
        end
      end
      if allfinish then
        director.time = 5.7
        director:Evaluate()
        LuaUtil.PlayEffect(go)
        SetChildActive(goTrans, "open", true, true)
        SetChildActive(goTrans, "close", false)
      else
        director.time = 0
        director:Evaluate()
        SetChildActive(goTrans, "close", true, true)
        SetChildActive(goTrans, "open", false)
      end
    end
  end
  AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.EVENT_RES_LOADED, eventInfo)
end
local LoadEventRes = function(eventInfo, grid, initializing)
  AbyssExploreMapCtrl.LoadEventRes(eventInfo, grid, nil, OnLoadedCallback)
  if not initializing then
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.COLLECT_EVENTS)
  end
end
local OnRegionUnlock = function(regionId, dont_display_tips)
  local events = AbyssExploreData.GetAllEvents()
  for _, event in pairs(events) do
    if not event.noPosition then
      local coordinate
      local assetpath = event.assetpath
      if type(assetpath) == "string" then
        if #event.positions > 1 then
          coordinate = event.location
        else
          coordinate = event.positions[1]
        end
        local got, grid = AbyssExploreMapCtrl.GetMapLogicInst():TryGetGrid(coordinate.x, coordinate.y)
        if got and grid.regionId == regionId and 0 == event.finishTimestamp and not event.hasRes and event.type ~= AbyssExploreEventID.BRANCH_ACTIVITY then
          local key = grid.gridId
          if not (gridUserdataCollection and gridUserdataCollection[key]) or not table.keyof(gridUserdataCollection[key], event) then
            LoadEventRes(event, grid)
          end
        end
      end
    end
  end
  local str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.ABYSS_REGION_UNLOCK_RECORDS, "")
  local arr, contain = nil, false
  if not string.isEmptyOrNil(str) then
    arr = Json.decode(str)
    contain = table.contain(arr, regionId)
  else
    arr = {}
  end
  if not contain then
    table.insert(arr, regionId)
    PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.ABYSS_REGION_UNLOCK_RECORDS, Json.encode(arr))
    local inst = AbyssExploreFramingOperation.CreateOperation(OP_TYPE.REGION_UNLOCK_TIPS, false)
    inst.args.regionId = regionId
    inst.args.showTips = not dont_display_tips
  end
end
local ABYSS_FUNCTION_WHICH_NEED_TIPS = {
  [1] = FEATURE_ENUM.TIDE_DUNGEON,
  [2] = FEATURE_ENUM.FROST_DUNGEON,
  [3] = FEATURE_ENUM.ADVENTURE_BOSS,
  [4] = FEATURE_ENUM.ADVENTURE_ROGUE
}
local CheckHasAnyFunctionUnlock = function()
  for i, v in ipairs(ABYSS_FUNCTION_WHICH_NEED_TIPS) do
    local enterable = EnterClampUtil.WhetherToEnter(v, false)
    if AbyssExploreMgr.RegionIsCleared(1) and enterable and GuideData.CanShowCaption(v + 20000) then
      local operation = AbyssExploreFramingOperation.CreateOperation(OP_TYPE.FUNC_UNLOCK, true)
      operation.args.funcId = v
    end
  end
end
local InputGesture = CS.InputGesture
local Callback_Update = function()
  if not initialized or not enabled then
    return
  end
  if pause > 0 then
    return
  end
  AbyssExploreChrCtrl.Update()
  AbyssExploreCamCtrl.Update()
  if pauseUpdate then
    return
  end
  UpdateFocusedEventsPathInfo()
  UpdateBranchesPathInfo()
  CheckAndDeleteOutdateEvents()
  if not GuideMgr.guideBol then
    AbyssExploreFramingOperation.Update(Time.deltaTime)
    UpdateExclamation()
  end
  local mapcam = AbyssExploreCamCtrl.GetMapcamInst()
  local viewBounds = mapcam:GetViewBounds()
  AbyssExploreMapCtrl.UpdateMapItems(viewBounds)
  AbyssExploreMapCtrl.UpdateMapBlocks(mapcam:GetViewCenter(), false)
  AbyssExploreCamCtrl.SetDraggable(gesturable >= 0 and not delayMotion and not AbyssExploreChrCtrl.IsMoving())
  for i, v in ipairs(open_time_regions) do
    if not v.broadcast and v.map_id == cachedMapId + MAP_ID_OFFSET_IN_TBL and AbyssExploreMgr.RegionIsUnlock(v.id) then
      v.broadcast = true
      Dispatch(AbyssExploreMsgEnum.REGION_UNLOCK, v.id)
    end
  end
  if Application.platform == RuntimePlatform.WindowsEditor or Application.platform == RuntimePlatform.OSXEditor then
    local input = CS.UnityEngine.Input
    if input.GetKeyDown(KeyCode.Q) then
      UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.HANDLE_FIRST_EVENT)
    end
    if input.GetKey(KeyCode.P) then
      UIMgr:SendWindowMessage(WinResConfig.CardPlotTalkWindow.name, WindowMsgEnum.CardPlotTalkWindow.CONTINUE)
    end
    if input.GetKeyDown(KeyCode.W) then
      local musicTbl = TableData.GetTable("BaseSound")
      local cnt = table.getLen(musicTbl)
      local rdm = math.random(1, cnt)
      local k = 0
      for i, v in pairs(musicTbl) do
        k = k + 1
        if rdm <= k then
          Dispatch(AbyssExploreMsgEnum.ILLUSTRATION_GET, 6, v.id)
          break
        end
      end
    end
    if input.GetKeyDown(KeyCode.E) then
      local monsterTbl = TableData.GetTable("BaseStoryMonster")
      local cnt = table.getLen(monsterTbl)
      local rdm = math.random(1, cnt)
      local k = 0
      for i, v in pairs(monsterTbl) do
        k = k + 1
        if rdm <= k then
          Dispatch(AbyssExploreMsgEnum.ILLUSTRATION_GET, 7, v.id)
          break
        end
      end
    end
    if input.GetKeyDown(KeyCode.UpArrow) then
      AbyssExploreChrCtrl.SetMovespeed(AbyssExploreChrCtrl.GetMovespeed() + 1)
    end
    if input.GetKeyDown(KeyCode.DownArrow) then
      AbyssExploreChrCtrl.SetMovespeed(AbyssExploreChrCtrl.GetMovespeed() - 1)
    end
  end
  local bounds = AbyssExploreChrCtrl.GetSpineBounds()
  local inFieldOfView = mapcam:InFieldOfView(bounds, 1, 1)
  Dispatch(AbyssExploreMsgEnum.ENABLE_RESET_CAM_BUTTON, not inFieldOfView and true or false)
  if delayMotion then
    local position = AbyssExploreChrCtrl.GetPosition()
    local followOffset = mapcam.followOffset
    position.x = position.x - followOffset.x
    position.y = position.y - followOffset.y
    if mapcam:Arrival(position, 0.05) then
      AbyssExploreChrCtrl.SetMotion(true)
      delayMotion = false
    end
  end
  if cameraFollowLerpVal < 1 then
    cameraFollowLerpVal = math.min(1, cameraFollowLerpVal + Time.deltaTime * 0.3)
  end
end
local Callback_LateUpdate = function()
  if not initialized or not enabled then
    return
  end
  if pause > 0 then
    return
  end
  if pauseUpdate then
    return
  end
  if cameraFollow then
    AbyssExploreCamCtrl.Follow(AbyssExploreChrCtrl.GetPosition(), cameraFollowLerpVal)
  end
end
local Callback_OnClickScreen = function(hitInfo)
  if not (initialized and enabled) or gesturable < 0 then
    return
  end
  local point = hitInfo.point
  local playerPosition = AbyssExploreChrCtrl.GetPosition()
  local hit = AbyssExploreMapCtrl.WorldToGrid(point)
  if not hit then
    local grids = AbyssExploreMapCtrl.GetMapLogicInst():Intersects(point, playerPosition)
    local minDist
    for i = 0, grids.Count - 1 do
      local grid = grids[i]
      local regionId = grid.regionId
      if AbyssExploreMgr.RegionIsUnlock(regionId) and not AbyssExploreMgr.RegionIsCleared(regionId) then
        local center = grid.center
        local dist = Vector3.Distance(center, hitInfo.point)
        if not minDist or minDist > dist then
          minDist = dist
          point = center
        end
      end
    end
  end
  local stand = AbyssExploreMapCtrl.WorldToGrid(playerPosition)
  local equals = false
  if nil ~= hit and nil ~= stand then
    equals = hit == stand
  end
  if equals then
  else
    SearchPath(point, AbyssPathfindingType.Positive)
  end
end
local Callback_OnTouchScreen = function(finger)
  if not AbyssExploreChrCtrl.IsMoving() and AbyssExploreCamCtrl.IsMoving() then
    AbyssExploreCamCtrl.StopTransition()
  end
end
local Callback_OnBeginSwipe = function()
  if not AbyssExploreChrCtrl.IsMoving() and not delayMotion then
    cameraFollow = false
  end
end
local Callback_OnSwipe = function(finger)
  if not AbyssExploreChrCtrl.IsMoving() and not delayMotion then
    cameraFollow = false
  end
end
local Callback_OnEndSwipe = function()
end
local Callback_OnCameraPositionChanged = function(position)
  Dispatch(AbyssExploreMsgEnum.CAMERA_POSITION_CHANGED, position)
end
local OverlapEventsComparer = function(evt_a, evt_b)
  local a_finished = evt_a.finishTimestamp > 0
  local b_finished = evt_b.finishTimestamp > 0
  if a_finished ~= b_finished then
    return not a_finished
  end
  local a_handleable = AbyssExploreMgr.EventIsHandleable(evt_a, true)
  local b_handleable = AbyssExploreMgr.EventIsHandleable(evt_b, true)
  if a_handleable ~= b_handleable then
    return a_handleable
  end
  local conf_a = TableData.GetConfig(evt_a.eventId, "BaseManorEvent")
  local conf_b = TableData.GetConfig(evt_b.eventId, "BaseManorEvent")
  local open_pre_a = conf_a.open_pre
  local open_pre_b = conf_b.open_pre
  if nil == open_pre_a ~= (nil == open_pre_b) then
    return nil == open_pre_a
  end
  local etypeEquals = evt_a.type == evt_b.type
  if nil ~= open_pre_a then
    if table.keyof(open_pre_a, evt_b.eventId) then
      return false
    end
    return etypeEquals and evt_a.eventId < evt_b.eventId or evt_a.type < evt_b.type
  end
  if etypeEquals and evt_a.type == AbyssExploreEventID.POSITIVE then
    if evt_a.subtype == evt_b.subtype then
      return evt_a.eventId < evt_b.eventId
    end
    return evt_a.subtype < evt_b.subtype
  end
  return etypeEquals and evt_a.eventId < evt_b.eventId or evt_a.type < evt_b.type
end
local IsLocalType = function(event)
  local e_type
  if type(event) == "table" then
    e_type = event.type
  elseif type(event) == "number" then
    e_type = event
  end
  return e_type and (e_type == AbyssExploreEventID.OBSTACLE or e_type == AbyssExploreEventID.BUILDING or e_type == AbyssExploreEventID.ROGUELIKE or e_type == AbyssExploreEventID.CHALLENGE_BOSS or e_type == AbyssExploreEventID.FROST_DUNGEON or e_type == AbyssExploreEventID.GUILD_WAR_ENTRANCE or e_type == AbyssExploreEventID.VIEW_ONLY)
end
local InsertOrUpdateEvent = function(eventInfo, initializing)
  if cachedMapId + MAP_ID_OFFSET_IN_TBL ~= eventInfo.mapId then
    return
  end
  if eventInfo.finishTimestamp > 0 and eventInfo.type ~= AbyssExploreEventID.BUILDING then
    return
  end
  if eventInfo.suspend then
    return
  end
  if eventInfo.type == AbyssExploreEventID.BRANCH_ACTIVITY and not AbyssExploreMgr.RegionIsCleared(1) then
    return
  end
  local playerPosition = AbyssExploreChrCtrl.GetPosition()
  local stand = AbyssExploreMapCtrl.WorldToGrid(playerPosition)
  for k, position in pairs(eventInfo.positions) do
    local x, y = position.x, position.y
    local illegalPosition = false
    if eventInfo.type == AbyssExploreEventID.BRANCH or eventInfo.type == AbyssExploreEventID.BRANCH_ACTIVITY then
      local events = AbyssExploreData.GetEventsByType(AbyssExploreEventID.PORTAL)
      for _, v in ipairs(events) do
        if v.finishTimestamp > 0 then
          local result, g = AbyssExploreMapCtrl.TryGetGrid(x, y)
          if not result or 1 == g.regionId then
            illegalPosition = true
            break
          end
        end
      end
    end
    if illegalPosition then
      local grids = AbyssExploreMgr.FindAvailableGrids(playerPosition, 1, 5)
      local cnt = grids and grids.Count or 0
      if cnt > 0 then
        local g = grids[math.random(1, cnt) - 1]
        local coordinate = g.coordinate
        eventInfo.positions[k] = coordinate
        eventInfo.x = coordinate.x
        eventInfo.y = coordinate.y
        eventInfo.location = coordinate
        AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.EVENT_UPDATE, eventInfo, true)
      else
        printError("[Abyss] Error Find Available Grids ", eventInfo.eventId)
      end
      return
    end
    local result, grid = AbyssExploreMapCtrl.GridIsAvailable(x, y)
    local sameEvent = grid and grid.userdata and grid.userdata.eventId == eventInfo.eventId
    if not eventInfo.passable and stand == grid or not result and not sameEvent and IsLocalType(grid.userdata and grid.userdata.type) then
      local pos = AbyssExploreMapCtrl.GridToWorld(x, y)
      if pos then
        local grids = AbyssExploreMgr.FindAvailableGrids(pos, 1, 5)
        local cnt = grids and grids.Count or 0
        if cnt > 0 then
          local g = grids[math.random(1, cnt) - 1]
          local coordinate = g.coordinate
          eventInfo.positions[k] = coordinate
          eventInfo.x = coordinate.x
          eventInfo.y = coordinate.y
          eventInfo.location = coordinate
          AbyssExploreMgr.ReportEventPosition(eventInfo, g.coordinate, function()
            AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.EVENT_UPDATE, eventInfo)
          end)
        else
          printError("[Abyss] Error Find Available Grids ", eventInfo.eventId)
        end
      end
      return
    end
    if result or sameEvent then
      AbyssExploreMapCtrl.InsertOrUpdateEvent(x, y, eventInfo, initializing)
    elseif grid then
      local userdata = grid.userdata
      local remove = false
      if userdata then
        local conf = TableData.GetConfig(userdata.eventId, "BaseManorEvent")
        if conf.open_pre and _G.next(conf.open_pre) then
          for i, v in pairs(conf.open_pre) do
            if v == eventInfo.eventId then
              remove = true
              break
            end
          end
        end
        if not AbyssExploreMgr.EventIsHandleable(userdata, true) and AbyssExploreMgr.EventIsHandleable(eventInfo, true) then
          remove = true
        end
      end
      gridUserdataCollection = gridUserdataCollection or {}
      local key = grid.gridId
      gridUserdataCollection[key] = gridUserdataCollection[key] or {}
      local overlap = eventInfo
      if remove then
        overlap = userdata
        Dispatch(AbyssExploreMsgEnum.EVENT_DELETE, grid, userdata, true)
        AbyssExploreMapCtrl.InsertOrUpdateEvent(x, y, eventInfo, initializing)
      end
      table.insert(gridUserdataCollection[key], overlap)
      table.sort(gridUserdataCollection[key], OverlapEventsComparer)
      Dispatch(AbyssExploreMsgEnum.EVENT_OVERLAP, grid, overlap)
    end
  end
end
local CheckAnyActivityBranches = function()
  local events = AbyssExploreData.GetEventsByType(AbyssExploreEventID.BRANCH_ACTIVITY)
  for i, v in ipairs(events) do
    InsertOrUpdateEvent(v)
  end
end
local GetEventOverlaps = function(gridx, gridy)
  if not initialized then
    return
  end
  local got, grid = AbyssExploreMapCtrl.TryGetGrid(gridx, gridy)
  if got then
    local key = grid.gridId
    if gridUserdataCollection and gridUserdataCollection[key] then
      return #gridUserdataCollection[key], grid
    else
      return 0, grid
    end
  end
end
local PopupNextEvent = function(gridx, gridy, event)
  if not initialized then
    return
  end
  if gridUserdataCollection then
    local key = CS.MapGrid.getUniqueId(gridx, gridy)
    local stack = gridUserdataCollection[key]
    if stack and _G.next(stack) then
      local pos = 1
      if type(event) == "table" then
        pos = table.keyof(stack, event) or 1
      end
      InsertOrUpdateEvent(table.remove(gridUserdataCollection[key], pos))
    end
  end
end
local beforeInitializedEventCache
local OnEventUpdate = function(eventInfo, initializing)
  if not initialized then
    beforeInitializedEventCache = beforeInitializedEventCache or {}
    table.insert(beforeInitializedEventCache, eventInfo)
    return
  end
  InsertOrUpdateEvent(eventInfo, initializing)
end
local OnEventComplete = function(eventInfo)
  AbyssExploreMapCtrl.DeleteEvent(eventInfo.eventId)
end
local OnEventCreate = function(grid, eventInfo, initializing)
  local unlock = AbyssExploreMgr.RegionIsUnlock(grid.regionId)
  if not unlock then
    return
  end
  local location = eventInfo.location
  local id, type = eventInfo.eventId, eventInfo.type
  local coordinate = grid.coordinate
  local loadasset = 1 == #eventInfo.positions or location and location.x == coordinate.x and location.y == coordinate.y
  if not string.isEmptyOrNil(eventInfo.assetpath) and loadasset then
    local is_branch_activity = type == AbyssExploreEventID.BRANCH_ACTIVITY
    if initializing then
      local play_anim = false
      if is_branch_activity and 0 == eventInfo.plotNodeId and 0 == eventInfo.step then
        local records = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.ABYSS_BRANCH_ACTIVITY_RECORDS, "")
        local contain = false
        local arr
        if not string.isEmptyOrNil(records) then
          arr = Json.decode(records) or {}
          contain = table.contain(arr, id)
        else
          arr = {}
        end
        if not contain then
          play_anim = true
          table.insert(arr, id)
          PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.ABYSS_BRANCH_ACTIVITY_RECORDS, Json.encode(arr))
        end
      end
      if not play_anim then
        LoadEventRes(eventInfo, grid, initializing)
        return
      end
    end
    local parallel = type ~= AbyssExploreEventID.BRANCH and not is_branch_activity
    local inst = AbyssExploreFramingOperation.CreateOperation(OP_TYPE.EVENT_CREATE, parallel)
    inst.args.grid = grid
    inst.args.eventInfo = eventInfo
  elseif type == AbyssExploreEventID.BUILDING then
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.COLLECT_EVENTS)
  end
end
local OnEventDelete = function(grid, eventInfo, dont_popup_next)
  local inst = AbyssExploreFramingOperation.CreateOperation(OP_TYPE.EVENT_DELETE, true)
  inst.args.grid = grid
  inst.args.eventInfo = eventInfo
  if dont_popup_next then
    return
  end
  if eventInfo.positions and 1 == #eventInfo.positions then
    local nextEventInfo
    local key = grid.gridId
    local coordinate = CS.MapGrid.getCoordinate(key)
    local num = GetEventOverlaps(coordinate.x, coordinate.y)
    if num >= 1 then
      nextEventInfo = gridUserdataCollection[key][1]
      grid.userdata = nextEventInfo
      AbyssExploreMapCtrl.SetGridIsObstacle(coordinate.x, coordinate.y, not nextEventInfo.passable)
    end
    
    function inst.args.ondestroyed()
      for i, v in pairs(eventInfo.positions) do
        PopupNextEvent(v.x, v.y, nextEventInfo)
      end
    end
  end
end
local OnEventTrigger = function(grid, eventInfo, callback)
  if eventInfo.direct and eventInfo.type == AbyssExploreEventID.POSITIVE and eventInfo.subtype == AbyssExploreSubEventID.DIALOGUE then
    local inst = AbyssExploreFramingOperation.CreateOperation(OP_TYPE.EVENT_TRIGGER, false)
    inst.args.grid = grid
    inst.args.eventInfo = eventInfo
    inst.args.callback = callback
  end
end
local OnIllustrationGet = function(itemType, itemId)
  local inst = AbyssExploreFramingOperation.CreateOperation(OP_TYPE.ILLUSTRATION_GET, true)
  inst.args.itemId = itemId
  inst.args.itemType = itemType
end
local positionBuffer = {}
local OnPathfindSuccess = function(from, to, points, type, ignoreObstacle, unwalkablePoints, initialType, ...)
  if type == AbyssPathfindingType.Positive then
    EnableCameraFollow(true)
    if cameraFollowLerpVal < 0.8 then
      delayMotion = true
      AbyssExploreChrCtrl.SetMotion(false)
    else
      delayMotion = false
      AbyssExploreChrCtrl.SetMotion(true)
    end
    if type == AbyssPathfindingType.Positive then
      if not navigationLine then
        navigationLine = ResourceManager.Instantiate("Assets/Art/Map/Prefab/Path_navi.prefab"):GetComponent(typeof(CS.PathRenderer))
      end
      navigationLine:ClearPositionsBuffer()
      if unwalkablePoints then
        for _, v in pairs(unwalkablePoints) do
          navigationLine:AddPositionToBuffer(v)
        end
      end
      navigationLine:ApplyPositionsBuffer(true)
    end
  elseif type == AbyssPathfindingType.NearestPositionPath then
    local success = false
    if ignoreObstacle then
      local buffer
      if not unwalkablePoints then
        table.clear(positionBuffer)
        buffer = positionBuffer
      else
        buffer = unwalkablePoints
      end
      local cnt = points.Count
      table.insert(buffer, points[cnt - 1])
      local n = -1
      local eventInfo
      for i = cnt - 2, 0, -1 do
        local point = points[i]
        local grid = AbyssExploreMapCtrl.WorldToGrid(point)
        eventInfo = grid.userdata
        if eventInfo and grid.isObstacle then
          n = i
          table.insert(buffer, point)
          break
        end
        table.insert(buffer, point)
      end
      if n >= 0 then
        AbyssExploreMapCtrl.IgnoreObstacle(false)
        AbyssExploreMapCtrl.SetGroupGridsIsObstacle(eventInfo.eventId, false)
        AbyssExploreMapCtrl.SearchPath(from, points[n], AbyssPathfindingType.NearestPositionPath, false, buffer, initialType, ...)
        AbyssExploreMapCtrl.SetGroupGridsIsObstacle(eventInfo.eventId, true)
      else
        success = true
        unwalkablePoints = buffer
      end
    else
      success = true
    end
    if success then
      if initialType == AbyssPathfindingType.Positive then
        for i = #unwalkablePoints, 1, -1 do
          points:Add(unwalkablePoints[i])
        end
      end
      Dispatch(AbyssExploreMsgEnum.PATHFIND_SUCCESS, from, to, points, initialType, ignoreObstacle, unwalkablePoints, ...)
    end
  end
end
local OnPathfindFailure = function(from, to, type, ignoreObstacle, unwalkablePoints, ...)
  if (type == AbyssPathfindingType.Positive or type == AbyssPathfindingType.Navigation_Event or type == AbyssPathfindingType.Navigation_Branch or type == AbyssPathfindingType.NearestPositionPath) and not ignoreObstacle then
    local grid = AbyssExploreMapCtrl.WorldToGrid(to)
    if grid and not grid.userdata and grid.isObstacle then
      return
    end
    AbyssExploreMapCtrl.IgnoreObstacle(true)
    AbyssExploreMapCtrl.SetIgnoreFunc(DontIgnoreBuild_Boss_Exped)
    AbyssExploreMapCtrl.SearchPath(from, to, AbyssPathfindingType.NearestPositionPath, true, unwalkablePoints, type, ...)
    AbyssExploreMapCtrl.IgnoreObstacle(false)
  end
end
local OnMapInitComplete = function(mapId, _, _)
  if mapId == EXPLORE_MAP_ID.GUILD_WAR_1 then
    local GUILD_BOSS_RES_KEY = 10086
    local path = "Assets/Art/Models/BattleSpine/prefab/battlespine_20910_ui.prefab"
    local inst = ResourceManager.Instantiate(path)
    local scale = Vector3.one * 0.4 / 0.73
    local position = Vector3(1002, 1002, 0)
    local eulerAngles = Vector3(0, 0, 0)
    local bounds = CS.UnityEngine.Bounds(position, Vector3.positiveInfinity)
    ResourceManager.DestroyGameObject(inst)
    AbyssExploreMapCtrl.AddMapResInfo(GUILD_BOSS_RES_KEY, bounds, path, position, scale, eulerAngles, function(o)
      SkeletonAnimationUtil.SetFlip(o, false, false)
      SkeletonAnimationUtil.SetShaderEffectEnable(o, false, true)
      local cmps = o:GetComponentsInChildren(typeof(CS.Spine.Unity.SkeletonAnimation))
      if cmps then
        for i = 0, cmps.Length - 1 do
          local skeletonAnimation = cmps[i]
          skeletonAnimation.state:SetAnimation(0, "idle", true)
        end
      end
    end)
  end
end
local ProcessEvent = function(eventInfo, nodeCoordinate)
  if not initialized then
    return
  end
  local plotNodeId = eventInfo.nextPlotNodeId or 0
  local config = TableData.GetConfig(plotNodeId, "BaseManorNode")
  local nextPlotNodeId = config and config.next and config.next[1] or 0
  local position = AbyssExploreChrCtrl.GetPosition()
  local grid = AbyssExploreMapCtrl.WorldToGrid(position)
  if not grid then
    printError("[Abyss] Impossible position ", position)
    grid = AbyssExploreMapCtrl.WorldToGrid(position, true)
  end
  local nodeProgress
  if eventInfo.type == AbyssExploreEventID.BRANCH or eventInfo.type == AbyssExploreEventID.BRANCH_ACTIVITY then
    nodeProgress = {}
    nodeProgress.nodeId = plotNodeId
    local storyRecords = eventInfo.storyRecords
    if storyRecords and _G.next(storyRecords) then
      nodeProgress.lastStory = storyRecords[#storyRecords]
    end
    local optionRecords = eventInfo.optionRecords
    if optionRecords and _G.next(optionRecords) then
      nodeProgress.stories = eventInfo.optionRecords
    end
  end
  AbyssExploreService.ProcessEventReq(eventInfo.eventId, plotNodeId, nextPlotNodeId, nodeProgress, grid.regionId, nodeCoordinate)
end
local ProcessEventStory = function(eventInfo, storyId, rspCallback)
  if not initialized then
    return
  end
  AbyssExploreService.StoryFinishReq(eventInfo, storyId, rspCallback)
end
local ReportPosition = function(x, y)
  if not initialized then
    return
  end
  local coordinate
  if type(x) == type(y) and type(x) == "number" then
    coordinate = string.format("%s:%s", x, y)
  elseif type(x) == "userdata" and type(y) == "nil" then
    local vec = x.coordinate
    coordinate = string.format("%s:%s", vec.x, vec.y)
  else
    printError("[Abyss]Err Arguments When Report Position", tostring(x), tostring(y))
  end
  AbyssExploreService.ReportPositionReq(cachedMapId + MAP_ID_OFFSET_IN_TBL, coordinate)
end
local ReportEventPosition = function(eventInfo, x, y, rspCallback)
  if not initialized then
    return
  end
  if type(x) == type(y) and type(x) == "number" then
    AbyssExploreService.ReportEventPositionReq(eventInfo.eventId, string.format("%s:%s", x, y), rspCallback)
  elseif type(x) == "userdata" and type(rspCallback) == "nil" then
    rspCallback = y
    AbyssExploreService.ReportEventPositionReq(eventInfo.eventId, string.format("%s:%s", x.x, x.y), rspCallback)
  end
end
local params = {
  stageId = -1,
  sceneType = ProtoEnum.SCENE_TYPE.MANOR,
  extData = nil,
  backFunc = function()
    UIMgr:CloseWindow(WinResConfig.FormationWindow.name)
  end
}
local PrepareEnterBattle = function(eventInfo, stageId, storyId, nextNodeCoordinate, localtest, quicklyBattle)
  if not initialized then
    return
  end
  local plotNodeId = eventInfo.nextPlotNodeId or 0
  local config = TableData.GetConfig(plotNodeId, "BaseManorNode")
  local nextPlotNodeId = config and config.next and (config.next[1] or 0) or 0
  local extData = string.format("%s|%s|%s|%s|%s", eventInfo.eventId or 0, plotNodeId, storyId or 0, nextPlotNodeId, nextNodeCoordinate or "")
  params.stageId = stageId
  params.extData = extData
  params.localtest = localtest
  params.quickBattle = quicklyBattle
  if localtest then
    params.extData = {eventInfo = eventInfo, curStoryId = storyId}
  end
  if not FormationMgr then
    ld("Formation")
  end
  FormationMgr.TryOpenFormationWindow(params, not quicklyBattle)
end
local GetNextPlotNodeConf = function(eventInfo)
  local eventConf = TableData.GetConfig(eventInfo.eventId, "BaseManorEvent")
  local nodeId = eventInfo.nextPlotNodeId
  if nodeId > 0 then
    local nodeConf = TableData.GetConfig(nodeId, "BaseManorNode")
    if nodeConf.next then
      local nextNodeConf = TableData.GetConfig(nodeConf.next[math.random(1, #nodeConf.next)], "BaseManorNode")
      return nextNodeConf
    end
  else
    local configTbl = TableData.GetTable("BaseManorNode")
    local groupId = tonumber(eventConf.parameter)
    for i, v in pairs(configTbl) do
      if groupId == v.group_id and not v.pre and v.next then
        return v
      end
    end
  end
end
local _filter_env
local FindAvailableGrids = function(position, minRadius, maxRadius)
  local grid = AbyssExploreMapCtrl.WorldToGrid(position)
  if not _filter_env then
    _filter_env = {}
    
    function _filter_env.callback(o)
      if not o.userdata and not o.isObstacle then
        local regionId = o.regionId
        if AbyssExploreMgr.RegionIsCleared(regionId) or not AbyssExploreMgr.RegionIsUnlock(regionId) then
          return false
        end
        local pos = o.coordinate
        local count, has_userdata = 0, false
        for x = pos.x - 1, pos.x + 1 do
          for y = pos.y - 1, pos.y + 1 do
            if pos.x ~= x and pos.y ~= y then
              local got, g = AbyssExploreMapCtrl.TryGetGrid(x, y)
              if got and Vector3.Distance(o.center, g.center) <= 1 then
                if g.userdata then
                  has_userdata = true
                end
                count = count + 1
              end
            end
          end
        end
        if count < 6 and has_userdata then
          return false
        end
        local center, radius = _filter_env.center, _filter_env.radius
        return radius >= Vector3.Distance(o.center, center)
      end
      return false
    end
  end
  _filter_env.center = grid.center
  for i = minRadius, maxRadius do
    _filter_env.radius = i
    local grids = AbyssExploreMapCtrl.GetGridsAroundCenter(grid, maxRadius, maxRadius, _filter_env.callback)
    if grids.Count > 0 then
      return grids
    end
  end
end
local CalcPlotNodeCoordinate = function(eventInfo)
  local nodeConf = GetNextPlotNodeConf(eventInfo)
  if not nodeConf then
    if eventInfo.endNodeId ~= eventInfo.nextPlotNodeId then
      printError("[ABYSS]Can not find next node with eventId", eventInfo.eventId)
    end
    return
  end
  local result
  if nodeConf.site then
    local gridConf = TableData.GetConfig(tonumber(nodeConf.site), "BaseManorGrid")
    result = gridConf.coordinate[math.random(1, #gridConf.coordinate)]
  elseif nodeConf.site_range then
    local maxDist = CS.System.Int32.MinValue
    local minDist = CS.System.Int32.MaxValue
    for i, v in ipairs(nodeConf.site_range) do
      local dist = tonumber(v)
      minDist = math.min(minDist, dist)
      maxDist = math.max(maxDist, dist)
    end
    local grids = FindAvailableGrids(AbyssExploreChrCtrl.GetPosition(), minDist, maxDist)
    local n = grids.Count - 1
    local random = math.random(0, n)
    local grid = grids[random]
    local v2Int = grid.coordinate
    result = string.format("%s:%s", v2Int.x, v2Int.y)
  elseif nodeConf.pre or not nodeConf.next then
    printError("[ABYSS]Can not find pos with node id:", nodeConf.id)
  end
  return result
end
local TriggerBranch = function(eventInfo)
  local position = AbyssExploreChrCtrl.GetPosition()
  local grid = AbyssExploreMapCtrl.WorldToGrid(position)
  if not grid then
    printError("[ABYSS] Impossible position ", position)
    grid = AbyssExploreMapCtrl.WorldToGrid(position, true)
  end
  local nodeCoordinate = CalcPlotNodeCoordinate(eventInfo)
  local v2Int = grid.coordinate
  AbyssExploreService.TriggerEventReq(eventInfo.gridId, string.format("%s:%s", v2Int.x, v2Int.y), eventInfo.eventId, grid.regionId, nodeCoordinate, function(msg)
    if msg.event then
      AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.TRIGGER_BRANCH, grid, eventInfo, true)
    end
  end)
end
local IsFinished = function(eventId)
  if not initialized then
    return
  end
  local events = AbyssExploreData.GetAllEvents()
  local event = events[eventId]
  if event then
    local processing = false
    return not processing and event.finishTimestamp > 0
  end
  return false
end
local IsFocusing = function(eventId)
  if not initialized then
    return
  end
  local events = AbyssExploreData.GetFocusEvents()
  for i, v in ipairs(events) do
    if v.eventId == eventId then
      return true
    end
  end
  return false
end
local RegionIsUnlock = function(regionId)
  local conf = TableData.GetConfig(regionId, "BaseManorMapSub", true)
  local unlock = true
  if conf then
    if type(conf.open_time) == "number" then
      local timestamp = conf.open_time
      local serverTimestamp = LoginData.GetCurServerTime()
      if timestamp > serverTimestamp then
        unlock = false
      end
    end
    if "number" == type(conf.open_event) and unlock then
      unlock = IsFinished(conf.open_event)
    end
  end
  return unlock
end
local RegionIsCleared = function(regionId)
  if 1 == regionId then
    local eventId = TableData.GetConfig(70010814, "BaseFixed").int_value
    return IsFinished(eventId)
  end
  return false
end
local EventFeatureIsOpen = function(eventType)
  local features = AbyssExploreData.GetFeatureSchedules()
  local i = table.keyof(features, eventType, "eventType")
  if i then
    local feature = features[i]
    return feature.open, feature.startTime, feature.endTime
  end
  return true
end
local EventIsHandleable = function(eventInfo, dont_display_tips)
  local complete_pretask = true
  local eventId = eventInfo.eventId
  local subtype = eventInfo.subtype
  local config = TableData.GetConfig(eventId, "BaseManorEvent")
  local count, cached_pretask = 0
  if config.open_pre and _G.next(config.open_pre) then
    for i, v in pairs(config.open_pre) do
      if not AbyssExploreMgr.IsFinished(v) then
        complete_pretask = false
        count = count + 1
        cached_pretask = v
      end
    end
  end
  local cost = eventInfo.cost
  local enough = true
  if cost then
    for _, v in pairs(cost) do
      local itemId = v.id
      local cnt = ActorData.GetItemCount(itemId)
      if cnt < v.value then
        enough = false
        local itemConf = TableData.GetConfig(itemId, "BaseItem")
        if not dont_display_tips then
          if itemId == COMMON_ITEM_ID.ABYSS_PLOT_POINT then
            FloatTipsUtil.ShowWarnTips(T(20035))
            break
          end
          if itemId == COMMON_ITEM_ID.ABYSS_ACTION_POINT then
            FloatTipsUtil.ShowWarnTips(T(20034))
            break
          end
          FloatTipsUtil.ShowWarnTips(string.format("%s不足", itemConf and itemConf.name() or itemId))
        end
        break
      end
    end
  end
  if not enough then
    return false
  end
  if not complete_pretask then
    if not dont_display_tips then
      local sureContent = ""
      if subtype == AbyssExploreSubEventID.TREASURE then
        sureContent = T(20001)
      elseif subtype == AbyssExploreSubEventID.BATTLE then
        sureContent = T(20002)
      elseif subtype == AbyssExploreSubEventID.DIALOGUE then
        sureContent = T(20007)
      end
      if count > 1 then
        FloatTipsUtil.ShowWarnTips(T(20032, sureContent))
      else
        local conf = TableData.GetConfig(tonumber(cached_pretask), "BaseManorEvent")
        if conf.type == AbyssExploreEventID.POSITIVE and conf.sub_type == AbyssExploreSubEventID.BATTLE then
          FloatTipsUtil.ShowWarnTips(T(20082))
        else
          FloatTipsUtil.ShowWarnTips(T(20032, sureContent))
        end
      end
    end
    return false
  end
  local e_type = eventInfo.type
  local open, startTimestamp = EventFeatureIsOpen(e_type)
  local result = true
  if e_type == AbyssExploreEventID.BUILDING then
    result = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.TIDE_DUNGEON, not dont_display_tips)
  elseif e_type == AbyssExploreEventID.CHALLENGE_BOSS then
    result = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_BOSS, not dont_display_tips)
  elseif e_type == AbyssExploreEventID.EXPEDITION_BUILDING then
    result = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_DREAMLAND, not dont_display_tips)
  elseif e_type == AbyssExploreEventID.FROST_DUNGEON then
    result = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.FROST_DUNGEON, not dont_display_tips)
  elseif e_type == AbyssExploreEventID.ROGUELIKE then
    result = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_ROGUE, not dont_display_tips)
  end
  if not open then
    local diff = startTimestamp - LoginData.GetCurServerTime()
    if diff > 0 then
      if not dont_display_tips and result then
        FloatTipsUtil.ShowWarnTips(T(20333, TimeUtil.FormatEnTime(diff)))
      end
      result = false
    end
  end
  return result
end
local GetRegionId = function(x, y)
  if type(x) == "number" and type(y) == "number" then
    local founded, grid = AbyssExploreMapCtrl.GetMapLogicInst():TryGetGrid(x, y)
    if founded then
      return grid.regionId
    end
  else
    printError("[Abyss]Error Coordinate ", string.format("x:%s,y:%s", tostring(x), tostring(y)))
  end
end
local GridIsUnlock = function(x, y)
  local regionId = GetRegionId(x, y)
  if regionId then
    return RegionIsUnlock(regionId)
  end
end
local PointIsVisible = function(x, y)
  return true
end
local GridIsVisible = function(gridx, gridy)
  return true
end
local TestUpdateFOWSystem = function()
  CS.FOWManager.sharedInst:Update()
end
local TestFOWSystemInit = function()
  local size = AbyssExploreSettings.Map.size
  local center = AbyssExploreSettings.Map.origin + size / 2
  CS.FOWManager.sharedInst:InitFOWSystem(size, center, 512, 512)
  local go = ResourceManager.Instantiate("Assets/Art/Map/Prefab/FOWMask.prefab")
  local renderer = go:AddComponent(typeof(CS.FOWRenderer))
  go.transform.position = Vector3(center.x, center.y, 0)
  go.transform.localScale = Vector3(size.x, size.y, 1)
  go.transform.eulerAngles = Vector3.zero
  go:GetComponent(typeof(CS.UnityEngine.Renderer)).sortingOrder = AbyssExploreSettings.FOW.sortingOrder
  local fov = CS.FOVLuaBridge()
  
  function fov.visibleCallback()
    return true
  end
  
  function fov.getRadiusCallback()
    return 3
  end
  
  function fov.getPositionCallback()
    local position = AbyssExploreChrCtrl.GetPosition()
    return Vector2(position.x, position.y)
  end
  
  renderer:setFOWSystem(CS.FOWManager.sharedInst.system)
  CS.FOWManager.sharedInst:AddFOV(fov)
  CS.FOWManager.sharedInst:AddFOWRenderer(renderer)
  local grids = AbyssExploreMapCtrl.GetMapLogicInst().mapGrids
  local configTbl = TableData.GetTable("BaseManorMapSub")
  for i = 0, grids.Length - 1 do
    local grid = grids[i]
    local regionId = grid.regionId
    for i, v in pairs(configTbl) do
      if regionId == v.id and type(v.open_time) == "number" then
        local pos = Vector2(grid.center.x, grid.center.y)
        CS.FOWManager.sharedInst.system:AddPointToBuffer(pos)
      end
    end
  end
  local gridRadius = 0.25
  local radius = 3 * gridRadius
  local val = (radius - gridRadius) / radius
  local pixelRadius = CS.FOWManager.sharedInst.system:TransformWorldSpaceLength(radius)
  local color = Color(0, 0, 1, 0)
  CS.FOWManager.sharedInst.system:SetPixelWithPointsBuffer(color, radius, nil, function(dx, dy, col)
    local dist = math.sqrt(dx * dx + dy * dy)
    local percent = 1 - dist / pixelRadius
    local divide = percent / val
    percent = percent > val and 1 or divide * divide
    return col + percent * color
  end)
end
local InitMembers = function()
  listeners = {}
  open_time_regions = {}
end
local RegisterListeners = function()
  AddListener(AbyssExploreMsgEnum.MAP_INIT_COMPLETE, OnMapInitComplete)
  AddListener(AbyssExploreMsgEnum.EVENT_UPDATE, OnEventUpdate)
  AddListener(AbyssExploreMsgEnum.EVENT_COMPLETE, OnEventComplete)
  AddListener(AbyssExploreMsgEnum.EVENT_CREATE, OnEventCreate)
  AddListener(AbyssExploreMsgEnum.EVENT_DELETE, OnEventDelete)
  AddListener(AbyssExploreMsgEnum.ILLUSTRATION_GET, OnIllustrationGet)
  AddListener(AbyssExploreMsgEnum.REGION_UNLOCK, OnRegionUnlock)
  AddListener(AbyssExploreMsgEnum.PATHFIND_SUCCESS, AbyssExploreChrCtrl.OnPathfindSuccess)
  AddListener(AbyssExploreMsgEnum.PATHFIND_SUCCESS, OnPathfindSuccess)
  AddListener(AbyssExploreMsgEnum.PATHFIND_FAILURE, OnPathfindFailure)
  AddListener(AbyssExploreMsgEnum.TRIGGER_BRANCH, AbyssExploreChrCtrl.OnTriggerBranch)
  AddListener(AbyssExploreMsgEnum.TRIGGER_DIALOGUE, AbyssExploreChrCtrl.OnTriggerDialogue)
  AddListener(AbyssExploreMsgEnum.TRIGGER_DIALOGUE, OnEventTrigger)
  AddListener(AbyssExploreMsgEnum.TRIGGER_UNPASSABLE, AbyssExploreChrCtrl.OnTriggerUnpassable)
  AddListener(AbyssExploreMsgEnum.EVENT_COMPLETE, AbyssExploreChrCtrl.OnEventCompleteOrClose)
  AddListener(AbyssExploreMsgEnum.EVENT_WIN_CLOSE, AbyssExploreChrCtrl.OnEventCompleteOrClose)
  AddListener(AbyssExploreMsgEnum.CHA_INIT, AbyssExploreEventHandler.OnCHRInit)
  AddListener(AbyssExploreMsgEnum.CHA_CONVEY, AbyssExploreEventHandler.OnCHRConvey)
  AddListener(AbyssExploreMsgEnum.CHA_MOVING, AbyssExploreEventHandler.OnCHRMoving)
  AddListener(AbyssExploreMsgEnum.CHA_MOVE_NEXT, AbyssExploreEventHandler.OnCHRMoveNext)
  AddListener(AbyssExploreMsgEnum.CHA_REACH_DST, AbyssExploreEventHandler.OnCHRReachedDst)
  AddListener(AbyssExploreMsgEnum.CHA_STOP_MOVING, AbyssExploreEventHandler.OnCHRStopMoving)
  AddListener(AbyssExploreMsgEnum.EVENT_CREATE, AbyssExploreEventHandler.OnEventCreate)
  AddListener(AbyssExploreMsgEnum.EVENT_DELETE, AbyssExploreEventHandler.OnEventDelete)
  AddListener(AbyssExploreMsgEnum.EVENT_FOCUS, AbyssExploreEventHandler.OnFocusEvent)
  AddListener(AbyssExploreMsgEnum.EVENT_UNFOCUS, AbyssExploreEventHandler.OnUnfocusEvent)
  AddListener(AbyssExploreMsgEnum.EVENT_COMPLETE, AbyssExploreEventHandler.OnEventComplete)
  AddListener(AbyssExploreMsgEnum.EVENT_WIN_CLOSE, AbyssExploreEventHandler.OnEventWinClose)
  AddListener(AbyssExploreMsgEnum.BATTLE_START, AbyssExploreEventHandler.OnBattleStart)
  AddListener(AbyssExploreMsgEnum.BATTLE_COMPLETE, AbyssExploreEventHandler.OnBattleComplete)
  AddListener(AbyssExploreMsgEnum.HANDLE_EVENT_NO_POS, AbyssExploreEventHandler.OnHandleEventNoPosition)
  AddListener(AbyssExploreMsgEnum.HANDLE_CUR_LOCATION_EVENT, AbyssExploreEventHandler.OnHandleCurLocationEvent)
  AddListener(AbyssExploreMsgEnum.PATHFIND_SUCCESS, AbyssExploreEventHandler.OnPathfindSuccess)
  AddListener(AbyssExploreMsgEnum.PATHFIND_FAILURE, AbyssExploreEventHandler.OnPathfindFailure)
  AddListener(AbyssExploreMsgEnum.UPDATE_PLAYER_INFO, AbyssExploreEventHandler.OnUpdatePlayerInfo)
  AddListener(AbyssExploreMsgEnum.RESET_CAMERA, AbyssExploreEventHandler.OnResetCamera)
  AddListener(AbyssExploreMsgEnum.ENABLE_RESET_CAM_BUTTON, AbyssExploreEventHandler.OnEnableResetCameraButton)
  AddListener(AbyssExploreMsgEnum.CLICK_CHR, AbyssExploreEventHandler.OnClickCHR)
  AddListener(AbyssExploreMsgEnum.HANDLE_EVENT, AbyssExploreEventHandler.OnHandleEvent)
  AddListener(AbyssExploreMsgEnum.COLLECT_EVENTS, AbyssExploreEventHandler.OnCollectEvents)
  AddListener(AbyssExploreMsgEnum.GOTO_EVENT, AbyssExploreEventHandler.OnGoToEvent)
  AddListener(AbyssExploreMsgEnum.GOTO_BOSS_CHALLENGE, AbyssExploreEventHandler.OnGoToBossChallenge)
end
local InitOthers = function(mapId, fashionId, initialCoordinate, globalScale)
  local settings = AbyssExploreSettings
  local CHRSettings = settings.CHR
  globalScale = globalScale or 1
  local splits = Split(string.isEmptyOrNil(initialCoordinate) and "0:0" or initialCoordinate, ":")
  local position = AbyssExploreMapCtrl.GridToWorld(tonumber(splits[1]), tonumber(splits[2]))
  if not position then
    local conf = TableData.GetConfig(mapId + MAP_ID_OFFSET_IN_TBL, "BaseManorMap")
    local gridId = conf.first_site[1]
    local gridConf = TableData.GetConfig(gridId, "BaseManorGrid")
    for i, str in ipairs(gridConf.coordinate) do
      splits = Split(str, ":")
      position = AbyssExploreMapCtrl.GridToWorld(tonumber(splits[1]), tonumber(splits[2]))
      if position then
        break
      end
    end
  end
  local grid = AbyssExploreMapCtrl.WorldToGrid(position)
  local eventId = TableData.GetConfig(70010814, "BaseFixed").int_value
  local events = AbyssExploreData.GetAllEvents()
  if events and events[eventId] and events[eventId].finishTimestamp > 0 and 1 == grid.regionId then
    position = AbyssExploreMapCtrl.GridToWorld(-1, -3)
  end
  AbyssExploreChrCtrl.Init(fashionId, position, CHRSettings.eulerAngles, CHRSettings.scale * globalScale, CHRSettings.sortingOrder)
  local map_view = AbyssExploreMapCtrl.GetMapViewInst()
  local bounds = CS.UnityEngine.Bounds(map_view.pivot, Vector3(map_view.width * 0.9 / 100, map_view.height * 0.9 / 100, 0))
  AbyssExploreCamCtrl.Init(bounds, nil, settings.MainCam.eulerAngles)
  local viewBounds = AbyssExploreCamCtrl.GetViewBounds()
  local viewInst = AbyssExploreMapCtrl.GetMapViewInst()
  local w, h = viewInst.sliceWidth / viewInst.ppu, viewInst.sliceHeight / viewInst.ppu
  local size = viewBounds.size
  local x, y = math.ceil(size.x / w), math.ceil(size.y / h)
  viewInst.preloadRangeX = math.ceil(x * 0.5)
  viewInst.preloadRangeY = math.ceil(y * 0.5)
  AbyssExploreFramingOperation.Init()
  local configTbl = TableData.GetTable("BaseManorMapSub")
  for i, v in pairs(configTbl) do
    if type(v.open_time) == "number" then
      table.insert(open_time_regions, {
        id = v.id,
        open_time = v.open_time
      })
    end
  end
  AbyssExploreCamCtrl.Follow(AbyssExploreChrCtrl.GetPosition(), 1)
  AbyssExploreMapCtrl.UpdateMapBlocks(AbyssExploreCamCtrl.GetViewCenter(true))
  AbyssExploreCamCtrl.GetMapcamInst():onPositionChanged("+", Callback_OnCameraPositionChanged)
  AbyssExploreMapCtrl.SetIsAvailableFunc(LockedOrClearedRegionIsNotAvailable)
  cameraFollow = true
  local inputGesture = CS.InputGesture.sharedInst
  inputGesture.camera = AbyssExploreCamCtrl.GetCameraInst()
  inputGesture.raycastLayerMask = -1
  inputGesture.enableSwipe = true
  inputGesture.enableClickEventRspThreshold = true
  inputGesture.clickEventRspThreshold = 0.5
  inputGesture.fingerSensitivity = 0
  inputGesture:OnClickScreen("+", Callback_OnClickScreen)
  inputGesture:OnTouchScreen("+", Callback_OnTouchScreen)
  inputGesture:OnZoom("+", AbyssExploreCamCtrl.Mapcam_OnZoom)
  inputGesture:OnSwipeScreen("+", Callback_OnSwipe)
  inputGesture:OnSwipeScreen("+", AbyssExploreCamCtrl.Mapcam_OnSwipe)
  inputGesture:OnEndSwipeScreen("+", Callback_OnEndSwipe)
  inputGesture:OnEndSwipeScreen("+", AbyssExploreCamCtrl.Mapcam_OnEndSwipe)
  inputGesture:OnBeginSwipeScreen("+", Callback_OnBeginSwipe)
  inputGesture:OnBeginSwipeScreen("+", AbyssExploreCamCtrl.Mapcam_OnBeginSwipe)
  UpdateManager.AddUpdateHandler(Callback_Update)
  UpdateManager.AddLateUpdateHandler(Callback_LateUpdate)
  if Application.platform == RuntimePlatform.WindowsEditor or Application.platform == RuntimePlatform.OSXEditor then
    mapdebug = GameObject("MAP_DEBUG"):AddComponent(typeof(CS.MapDebug))
    mapdebug:setMap(AbyssExploreMapCtrl.GetMapLogicInst())
    mapdebug:setMapCam(AbyssExploreCamCtrl.GetCameraInst())
    mapdebug.drawGridMesh = true
  end
end
local InitGridEvents = function(events)
  for _, event in pairs(events) do
    if not event.noPosition and not IsLocalType(event.type) then
      InsertOrUpdateEvent(event, true)
    end
  end
end
local InitLocalGridEvents = function(mapId)
  local tbl = TableData.GetTable("BaseManorEvent")
  for _, v in pairs(tbl) do
    local id, e_type, e_subtype = v.id, v.type, v.sub_type
    if v.map_id == mapId + MAP_ID_OFFSET_IN_TBL and IsLocalType(e_type) then
      local conf = TableData.GetConfig(v.site, "BaseManorGrid")
      if conf and conf.coordinate then
        local eventInfo = {
          type = e_type,
          subtype = e_subtype,
          eventId = id,
          mapId = v.map_id,
          resetTimestamp = 0,
          finishTimestamp = 0,
          refreshTimestamp = 0,
          param = v.parameter,
          passable = false,
          noPosition = false,
          precondition = v.open_pre,
          flagtype = v.map_icon_type,
          positions = {},
          assetpath = v.spd
        }
        if conf.show_site then
          local splits = Split(conf.show_site, ":")
          eventInfo.location = CS.UnityEngine.Vector2Int(Mathf.FloorToInt(tonumber(splits[1])), Mathf.FloorToInt(tonumber(splits[2])))
        end
        if e_type == AbyssExploreEventID.VIEW_ONLY then
          local fashionId = tonumber(eventInfo.param)
          local fashionConf = TableData.GetConfig(fashionId, "BaseFashion")
          eventInfo.assetpath = ModelUtil.GetFullPath(fashionConf.spd)
          eventInfo.scale = fashionConf.manor_scale / 10000
          eventInfo.spineFlip = true
        end
        for _, str in ipairs(conf.coordinate) do
          local splits = Split(str, ":")
          local gridX, gridY = tonumber(splits[1]), tonumber(splits[2])
          local x, y = Mathf.FloorToInt(gridX), Mathf.FloorToInt(gridY)
          table.insert(eventInfo.positions, CS.UnityEngine.Vector2Int(x, y))
          eventInfo.x = x
          eventInfo.y = y
        end
        InsertOrUpdateEvent(eventInfo, true)
        AbyssExploreData.AddOrOverride(eventInfo)
      end
    end
  end
end
local GetMainWindow = function()
  local windowName
  if cachedMapId == EXPLORE_MAP_ID.ABYSS then
    windowName = WinResConfig.AbyssWindow.name
  elseif cachedMapId == EXPLORE_MAP_ID.GUILD_WAR_1 then
    windowName = WinResConfig.GuildWarMainWindow.name
  end
  return windowName
end

function Init(mapId, fashionId, gridEvents, initialCoordinate, globalScale)
  InitMembers()
  RegisterListeners()
  cachedMapId = mapId
  AbyssExploreMapCtrl.Init(mapId, globalScale)
  InitOthers(mapId, fashionId, initialCoordinate, globalScale)
  initialized = true
  enabled = true
  pause = 0
  for i, v in pairs(gridEvents) do
    if v.finishTimestamp > 0 and (v.type == AbyssExploreEventID.BRANCH or v.type == AbyssExploreEventID.BRANCH_ACTIVITY) then
      AbyssExploreData.InsertCompletedBranchEvent(v)
    end
  end
  if beforeInitializedEventCache and _G.next(beforeInitializedEventCache) then
    for i, v in ipairs(beforeInitializedEventCache) do
      InsertOrUpdateEvent(v, true)
    end
    table.clear(beforeInitializedEventCache)
  end
  InitLocalGridEvents(mapId)
  InitGridEvents(gridEvents)
end

function InitAsync(mapId, fashionId, gridEvents, initialCoordinate, globalScale, callback)
  InitMembers()
  RegisterListeners()
  cachedMapId = mapId
  AbyssExploreMapCtrl.InitAsync(mapId, globalScale, function()
    InitOthers(mapId, fashionId, initialCoordinate, globalScale)
    initialized = true
    enabled = true
    pause = 0
    if beforeInitializedEventCache and _G.next(beforeInitializedEventCache) then
      for i, v in ipairs(beforeInitializedEventCache) do
        InsertOrUpdateEvent(v, true)
      end
      table.clear(beforeInitializedEventCache)
    end
    InitLocalGridEvents(mapId)
    InitGridEvents(gridEvents)
    for i, v in pairs(gridEvents) do
      if v.finishTimestamp > 0 and (v.type == AbyssExploreEventID.BRANCH or v.type == AbyssExploreEventID.BRANCH_ACTIVITY) then
        AbyssExploreData.InsertCompletedBranchEvent(v)
      end
      if v.type == AbyssExploreEventID.BRANCH_ACTIVITY and 0 == v.finishTimestamp and AbyssExploreMgr.RegionIsCleared(1) then
        AbyssExploreData.InsertBranchEvent(v)
      end
    end
    if callback then
      callback()
    end
  end)
end

function Release()
  if not initialized then
    return
  end
  initialized = false
  pause = 0
  enabled = false
  gesturable = -1
  cachedMapId = nil
  pauseUpdate = false
  local inputGesture = CS.InputGesture.sharedInst
  inputGesture:OnClickScreen("-", Callback_OnClickScreen)
  inputGesture:OnTouchScreen("-", Callback_OnTouchScreen)
  inputGesture:OnZoom("-", AbyssExploreCamCtrl.Mapcam_OnZoom)
  inputGesture:OnSwipeScreen("-", Callback_OnSwipe)
  inputGesture:OnEndSwipeScreen("-", Callback_OnEndSwipe)
  inputGesture:OnBeginSwipeScreen("-", Callback_OnBeginSwipe)
  inputGesture:OnSwipeScreen("-", AbyssExploreCamCtrl.Mapcam_OnSwipe)
  inputGesture:OnEndSwipeScreen("-", AbyssExploreCamCtrl.Mapcam_OnEndSwipe)
  inputGesture:OnBeginSwipeScreen("-", AbyssExploreCamCtrl.Mapcam_OnBeginSwipe)
  inputGesture.camera = nil
  inputGesture.raycastLayerMask = 0
  inputGesture.enableSwipe = true
  inputGesture.enableClickEventRspThreshold = false
  inputGesture.fingerSensitivity = 0.5
  UpdateManager.RemoveUpdateHandler(Callback_Update)
  UpdateManager.RemoveLateUpdateHandler(Callback_LateUpdate)
  AbyssExploreCamCtrl.GetMapcamInst():onPositionChanged("-", Callback_OnCameraPositionChanged)
  AbyssExploreFramingOperation.Release()
  AbyssExploreMapCtrl.Release()
  AbyssExploreChrCtrl.Release()
  AbyssExploreCamCtrl.Release()
  listeners = nil
  gridUserdataCollection = nil
  beforeInitializedEventCache = nil
  if mapdebug then
    GameObject.Destroy(mapdebug.gameObject)
    mapdebug = nil
  end
  if exclamCache then
    exclamCache:Dispose()
    exclamCache = nil
  end
  if navigationLine then
    ResourceManager.DestroyGameObject(navigationLine.cachedGameObject)
  end
  navigationLine = nil
end

local PRE_REQUEST_FEATURES = {
  [FEATURE_ENUM.TIDE_DUNGEON] = {
    mapId = EXPLORE_MAP_ID.ABYSS,
    [1] = function(rspCallback)
      TideDungeonService.GetTideDungeonInfoReq(AbyssTideDungeon, rspCallback)
    end
  },
  [FEATURE_ENUM.FROST_DUNGEON] = {
    mapId = EXPLORE_MAP_ID.ABYSS,
    [1] = function(rspCallback)
      FrostDungeonService.GetFrostDungeonInfoReq(rspCallback)
    end
  },
  [FEATURE_ENUM.ADVENTURE_ROGUE] = {
    mapId = EXPLORE_MAP_ID.ABYSS,
    [1] = function(rspCallback)
      RogueService.GetRogueInfoReq(rspCallback)
    end,
    [2] = function(rspCallback)
      RogueService.GetCycleTaskInfoReq(rspCallback)
    end
  },
  [FEATURE_ENUM.ABYSS_SHOP] = {
    mapId = EXPLORE_MAP_ID.ABYSS,
    [1] = function(rspCallback)
      AbyssExploreService.ShopInfoReq(true, rspCallback)
    end
  },
  [FEATURE_ENUM.HOME_GUILD_WAR] = {
    mapId = EXPLORE_MAP_ID.ABYSS,
    [1] = function(rspCallback)
      GuildWarService.GetGuildWarScheduleReq(rspCallback)
    end
  }
}
local RequestTheNecessaryData = function(mapId, rspCallback)
  local requirelist = {}
  for k, callback in pairs(PRE_REQUEST_FEATURES) do
    if EnterClampUtil.WhetherToEnter(k, false) then
      if type(callback) == "function" then
        table.insert(requirelist, callback)
      elseif type(callback) == "table" and callback.mapId == mapId then
        for _, v in ipairs(callback) do
          table.insert(requirelist, v)
        end
      end
    end
  end
  local cnt = #requirelist
  if cnt > 0 then
    local progress = 0
    for _, callback in ipairs(requirelist) do
      callback(function()
        progress = progress + 1
        if progress >= cnt and type(rspCallback) == "function" then
          rspCallback()
        end
      end)
    end
  elseif type(rspCallback) == "function" then
    rspCallback()
  end
end
local PrepareForInitialization = function(mapId)
  local prevMapId
  if cachedMapId then
    prevMapId = cachedMapId
    if prevMapId == EXPLORE_MAP_ID.ABYSS then
      UIMgr:CloseWindow(WinResConfig.AbyssWindow.name, true, true, false)
    elseif prevMapId == EXPLORE_MAP_ID.GUILD_WAR_1 then
      UIMgr:CloseWindow(WinResConfig.GuildWarMainWindow.name, true, true, false)
    end
  end
  Release()
  local fashionId, coordinate, mainWindow
  local cardId = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ABYSS_EXPLORE_DEFAULT_CHR, -1)
  local card = CardData.GetCardDataById(cardId)
  if cardId < 0 or not card then
    fashionId = ActorData.GetFaceId()
    local conf = TableData.GetConfig(fashionId, "BaseFashion")
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ABYSS_EXPLORE_DEFAULT_CHR, conf.card_id)
  else
    fashionId = card.fashionId
  end
  local manorInfo = AbyssExploreData.GetManorInfo()
  local globalScale = 1
  if mapId == EXPLORE_MAP_ID.ABYSS then
    ld("Rogue")
    ld("TideDungeon")
    ld("FrostDungeon")
    ld("GuildWar")
    coordinate = manorInfo.coordinate
    mainWindow = WinResConfig.AbyssWindow.name
  elseif mapId == EXPLORE_MAP_ID.GUILD_WAR_1 then
    coordinate = manorInfo.guildWarCoordinate
    mainWindow = WinResConfig.GuildWarMainWindow.name
    globalScale = 0.73
  end
  local str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.ABYSS_MAP_FLAGS_RECORDS, "")
  local allEvents = AbyssExploreData.GetAllEvents()
  if not string.isEmptyOrNil(str) then
    local decode = Json.decode(str)
    for i, v in pairs(decode) do
      local event = allEvents[v]
      if event and 0 == event.finishTimestamp then
        AbyssExploreData.AddFocus(event)
      end
    end
  end
  return mainWindow, fashionId, allEvents, coordinate, prevMapId, globalScale
end
local Enter = function(mapId, callback, jump)
  PauseUpdate(true)
  AbyssExploreService.Init()
  AbyssExploreService.ManorInfoReq(mapId + MAP_ID_OFFSET_IN_TBL, function(msg)
    UIUtil.ChangeBattleScreenEffectIn(function()
      local mainWin, fashionId, allEvents, coordinate, prevMapId, globalScale = PrepareForInitialization(mapId)
      InitAsync(mapId, fashionId, allEvents, coordinate, globalScale, function()
        RequestTheNecessaryData(mapId, function()
          if jump then
            JumpToWindow(mainWin, nil, nil, prevMapId)
          else
            OpenWindow(mainWin, UILayer.HUD, prevMapId)
          end
          AbyssExploreChrCtrl.SetActive(false, true)
          AbyssExploreMgr.EnableGestureOp(false)
          UIMgr:HideWindow(WinResConfig.HomeWindow.name)
          UIUtil.ChangeBattleScreenEffectOut(function()
            AbyssExploreMgr.EnableGestureOp(true)
            AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.MAP_ENTERED)
            AbyssExploreChrCtrl.SetActive(true, true)
            AbyssExploreChrCtrl.PlayDropAnimation(function()
              UIMgr:SendWindowMessage(mainWin, WindowMsgEnum.AbyssWindow.ENABLE_POPUP_EVENT_TIPS, true)
              AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.COLLECT_EVENTS)
              AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.HANDLE_CUR_LOCATION_EVENT)
              AbyssExploreMgr.CheckHasAnyFunctionUnlock()
              if callback then
                callback()
              end
            end)
          end)
        end)
      end)
    end)
  end)
end
local SellItems_External = function(itemUid2Cnt)
  Net.Send(Proto.MsgName.BatchUseItemsReq, {itemUid2Count = itemUid2Cnt})
end
local GetRolePlotEvents_External = function(rspCallback)
  Net.Send(Proto.MsgName.ManorGetActivityRolePlotEventReq, nil, rspCallback)
end
return {
  Enter = Enter,
  Release = Release,
  SetPause = SetPause,
  SetActive = SetActive,
  IsGesturable = IsGesturable,
  EnableGestureOp = EnableGestureOp,
  EnableCameraFollow = EnableCameraFollow,
  SearchPath = SearchPath,
  SearchPathToGrid = SearchPathToGrid,
  ProcessEvent = ProcessEvent,
  ProcessEventStory = ProcessEventStory,
  ReportPosition = ReportPosition,
  ReportEventPosition = ReportEventPosition,
  PrepareEnterBattle = PrepareEnterBattle,
  FindAvailableGrids = FindAvailableGrids,
  CalcPlotNodeCoordinate = CalcPlotNodeCoordinate,
  TriggerBranch = TriggerBranch,
  IsFinished = IsFinished,
  IsFocusing = IsFocusing,
  PointIsVisible = PointIsVisible,
  GridIsVisible = GridIsVisible,
  GetRegionId = GetRegionId,
  GridIsUnlock = GridIsUnlock,
  RegionIsUnlock = RegionIsUnlock,
  RegionIsCleared = RegionIsCleared,
  EventIsHandleable = EventIsHandleable,
  EventFeatureIsOpen = EventFeatureIsOpen,
  GetMainWindow = GetMainWindow,
  LoadEventRes = LoadEventRes,
  PopupExclamation = PopupExclamation,
  WorldToScreenPoint = WorldToScreenPoint,
  GridToScreenPoint = GridToScreenPoint,
  CalcEventCenterPosInWorld = CalcEventCenterPosInWorld,
  CheckHasAnyFunctionUnlock = CheckHasAnyFunctionUnlock,
  CheckAnyActivityBranches = CheckAnyActivityBranches,
  GetEventOverlaps = GetEventOverlaps,
  Dispatch = Dispatch,
  AddListener = AddListener,
  AddListenerWithParams = AddListenerWithParams,
  RemoveListener = RemoveListener,
  PauseUpdate = PauseUpdate,
  Exists = function()
    return initialized
  end,
  GetExploreInfo = function(callback)
    Net.Send(Proto.MsgName.GetManorInfoSimpleReq, nil, callback)
  end,
  OpenShopExternal = function(jump, tab)
    if initialized then
      AbyssExploreService.ShopInfoReq(false, nil, jump)
      return
    end
    Net.Send(Proto.MsgName.GetShopInfoReq, {
      types = {3, 4}
    }, function()
      if jump then
        JumpToWindow(WinResConfig.AbyssShopWindow.name, nil, nil, SellItems_External, tab)
      else
        OpenWindow(WinResConfig.AbyssShopWindow.name, nil, SellItems_External, tab)
      end
    end)
  end,
  OpenRolePlotEventWindowExternal = function(eventId)
    local upvalue = eventId
    GetRolePlotEvents_External(function(msg)
      local events = msg.events
      local result
      if events then
        for i, msg_evt in pairs(events) do
          if msg_evt.eventId == upvalue then
            result = AbyssExploreService.ParseRemoteEvent(msg_evt)
            break
          end
        end
      end
      if result then
        local step = result.step
        if 0 == step then
          local nodeConf = TableData.GetConfig(result.nextPlotNodeId, "BaseManorNode")
          local name = type(nodeConf.name) == "function" and nodeConf.name() or "未配置" .. tostring(nodeConf.id)
          local content = T(20215, name)
          MessageBox.Show(content, {
            touchCallback = function()
              local evtId = result.eventId
              if not AbyssExploreMgr or not AbyssExploreMgr.Exists() then
                ld("AbyssExplore")
                AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ABYSS, function()
                  AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.GOTO_EVENT, evtId)
                end, true)
                return
              end
              JumpToWindow(WinResConfig.AbyssWindow.name)
              AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.GOTO_EVENT, evtId)
            end
          }, {})
          return
        end
        OpenWindow(WinResConfig.CardPlotTalkWindow.name, nil, true, step, result)
      end
    end)
  end,
  GoToExpedition = function()
    local events = AbyssExploreData.GetAllEvents()
    for i, v in pairs(events) do
      if v.type == AbyssExploreEventID.EXPEDITION_BUILDING then
        SearchPathToGrid(v.location.x, v.location.y, AbyssPathfindingType.Positive)
        break
      end
    end
  end,
  GoToBossChallenge = function(chapterId)
    local events = AbyssExploreData.GetAllEvents()
    for i, v in pairs(events) do
      if v.type == AbyssExploreEventID.CHALLENGE_BOSS and string.find(v.param, tostring(chapterId)) then
        SearchPathToGrid(v.location.x, v.location.y, AbyssPathfindingType.Positive)
        break
      end
    end
  end
}
