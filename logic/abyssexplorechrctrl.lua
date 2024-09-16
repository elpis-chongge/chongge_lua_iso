local CHR_go, CHR_Root, CHR_Spine, fashionIdCache
local busy = false
local motion, lastmotion = false, false
local movespeed = 4
local move_anim_speed = 1
local waypoints, waypointsIndex, track
local epsilon = 0.001
local pointsmemory, __event_lock, gridTargetEff, pathRenderers, footprints, footprint_count, footprint_elapse, footprint_interval
local footprint_lookup = {
  [0] = "Assets/Art/Map/Prefab/footprint_common.prefab",
  [1] = "Assets/Art/Map/Prefab/footprint_common.prefab",
  [2] = "Assets/Art/Map/Prefab/footprint_2.prefab",
  [3] = "Assets/Art/Map/Prefab/footprint_3.prefab",
  [4] = "Assets/Art/Map/Prefab/footprint_4.prefab",
  [5] = "Assets/Art/Map/Prefab/footprint_5.prefab",
  [6] = "Assets/Art/Map/Prefab/footprint_6.prefab",
  [7] = "Assets/Art/Map/Prefab/footprint_common.prefab"
}
local footprint_eff_lookup = {
  [1] = "Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_MapAdventure_footmark_zhongyang.prefab",
  [2] = "Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_MapAdventure_footmark_snow.prefab",
  [3] = "Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_MapAdventure_footmark_zise.prefab",
  [4] = "Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_MapAdventure_footmark_lanse.prefab",
  [5] = "Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_MapAdventure_footmark_yanjiang.prefab",
  [6] = "Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_MapAdventure_footmark_lvdi.prefab",
  [7] = "Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_MapAdventure_footmark_zhongyang.prefab"
}
local lastDir
local UpdateTowards = function(direction)
  local abs = math.abs(CHR_Spine.skeleton.ScaleX)
  CHR_Spine.skeleton.ScaleX = direction.x < 0 and -abs or direction.x > 0 and abs or CHR_Spine.skeleton.ScaleX
end
local SetPathEffectActive = function(active)
  if pathRenderers then
    for i, v in pairs(pathRenderers) do
      v.cachedGameObject:SetActiveSafe(active)
      if not active then
        v.positionCount = 0
      end
    end
  end
  if gridTargetEff then
    gridTargetEff:SetActiveSafe(active)
  end
end
local GetLastWalkableIndex = function()
  local index, cnt = 0, waypoints and #waypoints or 0
  for i = waypointsIndex, cnt do
    local point = waypoints[i]
    local grid = AbyssExploreMapCtrl.WorldToGrid(point)
    if not (not grid.userdata or grid.userdata.passable) then
      break
    end
    index = i
  end
  return index, index > 0 and waypoints[index]
end
local ClearPositionsBuffer = function()
  for i, v in pairs(pathRenderers) do
    v:ClearPositionsBuffer()
  end
end
local AddPositionToBuffer = function(position)
  for i, v in pairs(pathRenderers) do
    v:AddPositionToBuffer(position)
  end
end
local ApplyPositionsBuffer = function()
  for i, v in pairs(pathRenderers) do
    v:ApplyPositionsBuffer()
  end
end
local UpdatePathEffect = function()
  if not pathRenderers then
    return
  end
  ClearPositionsBuffer()
  local i, p = GetLastWalkableIndex()
  if i > 0 then
    local grid = AbyssExploreMapCtrl.WorldToGrid(p)
    local effOffset = AbyssExploreSettings.CHR.centerOffset
    local position = grid.center + effOffset
    gridTargetEff.transform.position = position
  end
  if i > 1 then
    local last = AbyssExploreMapCtrl.WorldToGrid(waypoints[i])
    local position = CHR_Root.position
    if AbyssExploreMapCtrl.WorldToGrid(position) ~= last then
      AddPositionToBuffer(position)
      for j = waypointsIndex, i do
        AddPositionToBuffer(waypoints[j])
      end
    end
  end
  ApplyPositionsBuffer()
end
local Footprint = function(standPos, moveDir)
  local leftOrRight = 0 == footprint_count % 2
  local sign = leftOrRight and 1 or -1
  local grid = AbyssExploreMapCtrl.WorldToGrid(standPos)
  if not grid then
    grid = AbyssExploreMapCtrl.WorldToGrid(standPos, true)
    if not grid then
      printError("[Abyss] Error Pos ", standPos)
      return
    end
  end
  local regionId = grid.regionId
  local dir = LuaUtil.RotateVector(moveDir, Vector3.forward, 40 * math.random(-2000, 10000) / 10000 * sign)
  local pos = standPos
  local random = math.random(0, 10000) / 10000
  local randomInterval = 0.04 + 0.02 * random
  local randomAlpha = 0.05 + 0.9 * random
  local randomScale = 0.9 + 0.3 * random
  local randomDuration = 0.6
  local spacing = 0.02 + 0.05 * random
  local path = footprint_lookup[regionId]
  local o = ResourceManager.Instantiate(path)
  local footprint = o:GetOrAddComponent(typeof(CS.Footprint))
  footprint.cachedTransform.localScale = Vector3(0.12, 0.12, 0.12) * randomScale
  footprint:SetAlpha(randomAlpha)
  footprint:Set(pos, dir, spacing, leftOrRight, randomDuration)
  table.insert(footprints, footprint)
  footprint_count = footprint_count + 1
  footprint_interval = randomInterval
  lastDir = moveDir
end
local UpdateFootprints = function()
  if footprints then
    for i = #footprints, 1, -1 do
      local footprint = footprints[i]
      if footprint.isDone then
        table.remove(footprints, i)
        ResourceManager.DestroyGameObject(footprint.cachedGameObject)
      end
    end
  end
end
local OnMoving = function(position, nextPosition, dstPosition)
  if AbyssExploreMapCtrl.WorldToGrid(position) == AbyssExploreMapCtrl.WorldToGrid(dstPosition) then
    SetPathEffectActive(false)
  else
    SetPathEffectActive(true)
    UpdatePathEffect()
  end
  footprint_elapse = footprint_elapse + Time.deltaTime * move_anim_speed
  if footprint_elapse > footprint_interval then
    footprint_elapse = 0
    Footprint(position, nextPosition - position)
  end
  SkeletonAnimationUtil.SetAnimation(CHR_go, 0, SPINE_STATE_ENUM.RUN, true, nil, false, nil, move_anim_speed)
  AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.CHA_MOVING, position, nextPosition, dstPosition)
end
local OnMoveNext = function(position, nextPosition, destPosition)
  UpdateTowards(nextPosition - position)
  AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.CHA_MOVE_NEXT, position, nextPosition, destPosition)
end
local OnReachedDst = function(position)
  AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.CHA_REACH_DST, position)
end
local MoveTowards = function(transform, targetPosition, delta)
  local position = transform.position
  local newPosition = Vector3.MoveTowards(position, targetPosition, delta)
  transform.position = newPosition
  return newPosition
end
local MoveStep = function(movedelta)
  local movedist = 0
  local numPoints = #waypoints
  if waypointsIndex > 0 and numPoints >= waypointsIndex then
    local position = CHR_Root.position
    local targetPosition = waypoints[waypointsIndex]
    UpdateTowards(targetPosition - position)
    local newPosition = MoveTowards(CHR_Root, targetPosition, movedelta)
    table.insert(track, position)
    movedist = Vector3.Distance(position, newPosition)
    if Vector3.Distance(newPosition, targetPosition) < epsilon then
      waypointsIndex = waypointsIndex + 1
      if numPoints < waypointsIndex then
        OnReachedDst(targetPosition)
        return movedist
      end
      OnMoveNext(newPosition, waypoints[waypointsIndex], waypoints[numPoints])
      return movedist
    end
    OnMoving(newPosition, targetPosition, waypoints[numPoints])
  else
    motion = false
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.CHA_STOP_MOVING)
  end
  return movedist
end
local Motion = function()
  if not CHR_go or CHR_go:IsNull() then
    return
  end
  if not motion then
    SkeletonAnimationUtil.SetAnimation(CHR_go, 0, SPINE_STATE_ENUM.IDLE, true, nil, false, nil, 1)
    return
  end
  if not waypoints then
    return
  end
  local movedelta = movespeed * Time.deltaTime
  while motion do
    movedelta = movedelta - MoveStep(movedelta)
    if math.abs(movedelta) < epsilon then
      break
    end
  end
end
local SetMotion = function(enable)
  motion = enable and true or false
  if not busy and not motion then
    SkeletonAnimationUtil.SetAnimation(CHR_go, 0, SPINE_STATE_ENUM.IDLE, true, nil, false, nil, 1)
  end
end
local Backtrack = function(unpassable)
  for i = track and #track or 0, 1, -1 do
    local grid = AbyssExploreMapCtrl.WorldToGrid(track[i])
    if grid and grid ~= unpassable then
      CHR_Root.position = track[i]
      break
    end
  end
end
local SetActive = function(active, only_go)
  if only_go then
    CHR_go:SetActive(active)
  else
    CHR_Root.gameObject:SetActive(active)
  end
  if not active then
    SetPathEffectActive(false)
  end
end
local SetMovespeed = function(speed)
  movespeed = math.max(speed or 0, 0)
end
local GetMovespeed = function()
  return movespeed
end
local SetMoveAnimSpeed = function(speed)
  move_anim_speed = math.max(speed or 0, 0)
end
local GetMoveAnimSpeed = function()
  return move_anim_speed
end
local SetPosition = function(x, y)
  if waypoints then
    table.clear(waypoints)
  end
  local position
  if x and not y then
    position = x
    CHR_Root.position = position
  elseif x and y then
    position = Vector3(x, y, CHR_Root.position.z)
    CHR_Root.position = position
  end
end
local GetPosition = function()
  if not CHR_Root or CHR_Root:IsNull() then
    return Vector3.zero
  end
  return CHR_Root.position
end
local GetFashionId = function()
  return fashionIdCache
end
local GetScaleX = function()
  return CHR_Spine.skeleton.ScaleX
end
local IsMoving = function()
  return motion
end
local StopMovingAfter = function(step)
  step = type(step) == "number" and step or 1
  local cnt = waypoints and #waypoints or 0
  local index = (waypointsIndex or 0) + step
  for _ = cnt, index, -1 do
    table.remove(waypoints)
    cnt = cnt - 1
  end
  SetPathEffectActive(false)
  if cnt > 0 then
    return waypoints[cnt]
  end
end
local GetSpineBounds = function()
  return SkeletonAnimationUtil.GetBounds(CHR_go)
end
local dropAnimationCallback
local OnDropAnimationComplete = function()
  busy = false
  if dropAnimationCallback then
    dropAnimationCallback()
  end
  dropAnimationCallback = nil
end
local dropEffectCache
local AutoDestroyEffect = function()
  if dropEffectCache then
    ResourceManager.DestroyGameObject(dropEffectCache)
  end
  dropEffectCache = nil
end
local PlayDropAnimation = function(callback)
  dropAnimationCallback = callback
  local position = CHR_Root.localPosition
  local eff = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_tanxian_huanrenyanwu.prefab")
  eff.transform.position = position
  local duration = EffectUtil.GetEffectDuration(eff)
  dropEffectCache = eff
  LeanTween.delayedCall(duration, AutoDestroyEffect)
  busy = true
  SkeletonAnimationUtil.SetAnimation(CHR_go, 0, SPINE_STATE_ENUM.IN, false, OnDropAnimationComplete, true, "0", 1, 0.5)
end
local InitCharacter = function(fashionId, position, eulerAngles, scale, sortingOrder)
  if not CHR_Root then
    CHR_Root = GameObject("CHR_ROOT").transform
    local shadow = ResourceManager.Instantiate("Assets/Art/Map/Prefab/Shadow.prefab")
    local shadowTrans = shadow.transform
    shadowTrans:SetParent(CHR_Root)
    shadowTrans.localScale = Vector3(0.620000005, 0.317743778, 0.620000005)
  end
  local config = TableData.GetConfig(fashionId, "BaseFashion")
  local inst = ResourceManager.Instantiate(ModelUtil.GetFullPath(config.spd))
  inst.transform:SetParent(CHR_Root)
  inst.transform.localScale = scale or 0.14 * Vector3.one
  inst.transform.localEulerAngles = eulerAngles or Vector3.zero
  inst.transform.localPosition = AbyssExploreSettings.CHR.centerOffset
  local transform = CHR_Root
  transform.localPosition = position or Vector3.zero
  transform.localEulerAngles = Vector3.zero
  transform.localScale = Vector3.one
  local renderer = inst:GetComponent(typeof(CS.UnityEngine.Renderer))
  renderer.sortingOrder = sortingOrder or 0
  SkeletonAnimationUtil.SetShaderEffectEnable(inst, false, true, false, true)
  LuaUtil.SetOutLineColor(inst, 8, 79, 149, 179, 255)
  local helper = inst:GetComponent(typeof(MaterialPropertyHelper))
  helper:ChangeFloatValue("_OcclusionAlpha", 1, -1)
  helper:ChangeFloatValue("_OcclusionColorBlend", 0.64, -1)
  helper:ChangeColorValue("_OcclusionColor", Color(0.37254901960784315, 0.6509803921568628, 0.6431372549019608, 1), -1)
  helper:ChangeFloatValue("_XTilt", 0, -1)
  helper:ChangeFloatValue("_Mirror", 0, -1)
  helper:ChangeFloatValue("_ShadowFalloff", 0.92, -1)
  helper:ChangeFloatValue("_ShadowFalloffSoftness", 5, -1)
  helper:ChangeFloatValue("_ShadowScaleX", 1, -1)
  helper:ChangeFloatValue("_ShadowScaleY", 0.75, -1)
  helper:ChangeFloatValue("_ShadowRotateZ", 0, -1)
  helper:ChangeColorValue("_ShadowColor", Color(0.17647058823529413, 0.17647058823529413, 0.17647058823529413, 0.49019607843137253), -1)
  helper:ChangeVectorValue("_ShadowOffset", Vector4(0, -1, 0, 0), -1)
  inst.layer = AbyssExploreSettings.CHR.layer
  return inst
end
local LoadPathRenderer = function(path, sortingOrder)
  local pathRenderer = ResourceManager.Instantiate(path):GetComponent(typeof(CS.PathRenderer))
  pathRenderer.positionCount = 0
  pathRenderer.lineWidth = 0.2
  pathRenderer.density = 0.5
  pathRenderer.flowspeed = 0
  pathRenderer.numCornerVertices = 0
  pathRenderer.cachedLineRenderer.sortingOrder = sortingOrder
  return pathRenderer
end
local InitPathRenderers = function()
  pathRenderers = {}
  local paths = {
    "Assets/Art/Map/Prefab/Path.prefab",
    "Assets/Art/Map/Prefab/Path_addtive.prefab",
    "Assets/Art/Map/Prefab/Path_addtive2.prefab"
  }
  for i, v in pairs(paths) do
    table.insert(pathRenderers, LoadPathRenderer(v, 10))
  end
  pathRenderers[1].lineWidth = 0.3
  pathRenderers[2].lineWidth = 0.5
  pathRenderers[3].lineWidth = 0.5
end
local Init = function(fashionId, position, eulerAngles, scale, sortingOrder)
  busy = false
  track = {}
  __event_lock = {}
  waypoints = {}
  waypointsIndex = 1
  pointsmemory = {}
  fashionIdCache = fashionId
  CHR_go = InitCharacter(fashionId, position, eulerAngles, scale, sortingOrder)
  CHR_Spine = SkeletonAnimationUtil.GetSkeletonAnimation(CHR_go)
  InitPathRenderers()
  gridTargetEff = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_point_mark.prefab")
  local renderers = gridTargetEff:GetComponentsInChildren(typeof(CS.UnityEngine.Renderer))
  for i = 1, renderers.Length do
    renderers[i - 1].sortingOrder = sortingOrder
  end
  gridTargetEff:SetActive(false)
  footprints = {}
  footprint_count = 0
  footprint_interval = 0.07
  footprint_elapse = footprint_interval
  AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.CHA_INIT, fashionId, position)
end
local Update = function()
  if busy then
    return
  end
  Motion()
  UpdateFootprints()
  if lastmotion ~= motion then
    AbyssExploreMgr.Dispatch(motion and AbyssExploreMsgEnum.CHA_START_MOVING or AbyssExploreMsgEnum.CHA_STOP_MOVING)
  end
  lastmotion = motion
end
local ChangeCharacter = function(fashionId)
  local position = CHR_Root and CHR_Root.localPosition
  local spineScaleX = CHR_Spine and CHR_Spine.skeleton.ScaleX
  if CHR_go and not CHR_go:IsNull() then
    ResourceManager.DestroyGameObject(CHR_go)
    CHR_go = nil
    CHR_Spine = nil
  end
  local CHRSettings = AbyssExploreSettings.CHR
  CHR_go = InitCharacter(fashionId, position, CHRSettings.eulerAngles, CHRSettings.scale, CHRSettings.sortingOrder)
  CHR_Spine = SkeletonAnimationUtil.GetSkeletonAnimation(CHR_go)
  CHR_Spine.skeleton.ScaleX = spineScaleX
  PlayDropAnimation()
  AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.CHA_CHANGE, fashionId)
  fashionIdCache = fashionId
end
local OnPathfindSuccess = function(_, _, points, type)
  if type ~= AbyssPathfindingType.Positive then
    return
  end
  SetMotion(true)
  if not waypoints then
    waypoints = {}
  end
  if pointsmemory then
    for _ = 1, #pointsmemory do
      table.remove(pointsmemory)
    end
  end
  for _ = 1, #waypoints do
    table.remove(waypoints)
  end
  for i = 0, points.Count - 1 do
    table.insert(waypoints, points[i])
  end
  waypointsIndex = 1
  for i = track and #track or 0, 1, -1 do
    table.remove(track, i)
  end
  footprint_count = 0
  footprint_elapse = 0
  local i, p = GetLastWalkableIndex()
  if i > 0 and AbyssExploreMapCtrl.WorldToGrid(p) == AbyssExploreMapCtrl.WorldToGrid(GetPosition()) then
    SetPathEffectActive(false)
    return
  end
  SetPathEffectActive(true)
  LuaUtil.PlayEffect(gridTargetEff)
  UpdatePathEffect()
end
local OnTriggerBranch = function(grid, eventInfo, isTrigger)
end
local OnTriggerUnpassable = function(grid, eventInfo)
  StopMovingAfter(0)
end
local OnTriggerDialogue = function(grid, eventInfo)
  if eventInfo.passable then
    __event_lock[eventInfo.eventId] = true
    for _ = #waypoints, waypointsIndex + 1, -1 do
      table.insert(pointsmemory, 1, table.remove(waypoints))
    end
  end
end
local OnEventCompleteOrClose = function(eventInfo)
  if not eventInfo then
    return
  end
  local eventId = eventInfo.eventId
  if __event_lock and __event_lock[eventId] then
    __event_lock[eventId] = nil
    local cnt = #pointsmemory
    for _ = 1, cnt do
      table.remove(pointsmemory)
    end
  end
end
local Release = function()
  if CHR_go and not CHR_go:IsNull() then
    ResourceManager.DestroyGameObject(CHR_go, false)
  end
  if CHR_Root then
    CS.UnityEngine.Object.Destroy(CHR_Root.gameObject)
  end
  CHR_go = nil
  CHR_Spine = nil
  CHR_Root = nil
  track = nil
  motion = false
  lastmotion = false
  waypoints = nil
  waypointsIndex = nil
  __event_lock = nil
  pointsmemory = nil
  if pathRenderers then
    for i, v in pairs(pathRenderers) do
      ResourceManager.DestroyGameObject(v.cachedGameObject)
    end
  end
  pathRenderers = nil
  if gridTargetEff then
    ResourceManager.DestroyGameObject(gridTargetEff)
  end
  gridTargetEff = nil
  if footprints then
    for _, v in pairs(footprints) do
      ResourceManager.DestroyGameObject(v.cachedGameObject)
    end
  end
  footprints = nil
end
return {
  Init = Init,
  Update = Update,
  SetMotion = SetMotion,
  SetActive = SetActive,
  SetMovespeed = SetMovespeed,
  GetMovespeed = GetMovespeed,
  SetPosition = SetPosition,
  GetPosition = GetPosition,
  SetMoveAnimSpeed = SetMoveAnimSpeed,
  GetMoveAnimSpeed = GetMoveAnimSpeed,
  GetFashionId = GetFashionId,
  GetScaleX = GetScaleX,
  GetSpineBounds = GetSpineBounds,
  PlayDropAnimation = PlayDropAnimation,
  IsMoving = IsMoving,
  StopMovingAfter = StopMovingAfter,
  ChangeCharacter = ChangeCharacter,
  OnPathfindSuccess = OnPathfindSuccess,
  OnTriggerDialogue = OnTriggerDialogue,
  OnTriggerUnpassable = OnTriggerUnpassable,
  OnTriggerBranch = OnTriggerBranch,
  OnEventCompleteOrClose = OnEventCompleteOrClose,
  Release = Release
}
