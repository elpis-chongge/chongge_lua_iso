local mapViewCache, mapLogicCache, groups, snapshot
local ignoreObstacle = false
local enableSearchPath = true
local mapResMgr, pathRenderers, globalScale
local LoadMapData = function(mapId)
  local path
  if mapId == EXPLORE_MAP_ID.ABYSS then
    path = "Assets/Data/ExploreMapData/abyss_map_data@" .. tostring(mapId) .. ".bytes"
  elseif mapId == EXPLORE_MAP_ID.GUILD_WAR_1 then
    path = "Assets/Data/ExploreMapData/guildwar_map_data@" .. tostring(mapId) .. ".bytes"
  end
  return ResourceManager.LoadTextAssetBytes(path)
end
local InitMapLogic = function(mapId)
  return CS.Map.CreateInstance(LoadMapData(mapId))
end
local InitMapLogicAsync = function(mapId, callback)
  CS.Map.CreateInstanceAsync(LoadMapData(mapId), callback)
end
local InitMapView = function(mapId, pivot)
  local path
  if mapId == EXPLORE_MAP_ID.ABYSS then
    path = "Assets/Data/ExploreMapData/abyss_map_slices@" .. tostring(mapId) .. ".bytes"
  elseif mapId == EXPLORE_MAP_ID.GUILD_WAR_1 then
    path = "Assets/Data/ExploreMapData/guildwar_map_slices@" .. tostring(mapId) .. ".bytes"
  end
  local bytes = ResourceManager.LoadTextAssetBytes(path)
  local o = GameObject("MAP_ROOT")
  local ppu = AbyssExploreSettings.Map.ppu
  local renderer = o:AddComponent(typeof(CS.MapRenderer))
  renderer.ppu = ppu
  renderer.pivot = pivot or Vector3.zero
  renderer.preloadRangeX = 4
  renderer.preloadRangeY = 3
  renderer:Init(bytes)
  local width, height = renderer.width, renderer.height
  local transform = o.transform
  
  function renderer.OnSliceLoaded(go)
    local r = go:GetComponent(typeof(CS.UnityEngine.Renderer))
    r.sortingOrder = AbyssExploreSettings.Map.sortingOrder
  end
  
  transform.position = renderer.pivot
  local collider = o:AddComponent(typeof(CS.UnityEngine.BoxCollider))
  collider.size = Vector3(width / ppu * 1.0, height / ppu * 1.0, 0)
  local size = collider.size
  size.z = 0
  collider.size = size
  return renderer
end
local InitMapResMgr = function(mapId, viewRoot, bounds)
  local o = GameObject("MAP_RES_ROOT")
  local mgr = o:AddComponent(typeof(CS.MapResManager))
  mgr:Init(bounds)
  local path
  if mapId == EXPLORE_MAP_ID.ABYSS then
    path = "Assets/Data/ExploreMapData/abyss_map_resinfo@" .. tostring(mapId) .. ".bytes"
  elseif mapId == EXPLORE_MAP_ID.GUILD_WAR_1 then
    path = "Assets/Data/ExploreMapData/guildwar_map_resinfo@" .. tostring(mapId) .. ".bytes"
  end
  if path then
    local bytes = ResourceManager.LoadTextAssetBytes(path)
    local reslist = CS.MapSceneReslist.CreateInstance(bytes)
    local tagLookup = AbyssRegionTagLookup
    mgr:SetMapSceneReslist(viewRoot, reslist, function(tag, gameObject)
      local renderers = gameObject:GetComponentsInChildren(typeof(CS.UnityEngine.Renderer))
      local cnt = renderers and renderers.Length or 0
      for i = 0, cnt - 1 do
        local renderer = renderers[i]
        if tag == AbyssSceneResTag.DEFAULT then
          renderer.sortingOrder = AbyssExploreSettings.SceneProps.sortingOrdering
        elseif tag == AbyssSceneResTag.BIGGER then
          renderer.sortingOrder = AbyssExploreSettings.SceneProps.sortingOrdering + 1
        else
          renderer.sortingOrder = AbyssExploreSettings.SceneProps.sortingOrdering + 1
        end
      end
    end, function(tag)
      local result = true
      if tag > 0 then
        for i, v in ipairs(tagLookup) do
          if 0 ~= v & tag then
            local unlock = AbyssExploreMgr.RegionIsUnlock(i)
            local cleared = AbyssExploreMgr.RegionIsCleared(i)
            result = result and (not unlock or cleared)
          end
        end
      end
      return result
    end)
  end
  mgr:OnWillBeDestroyed("+", function(go)
    local goTrans = go.transform
    local child = goTrans:Find("Shadow")
    if child then
      ResourceManager.DestroyGameObject(child.gameObject)
    end
  end)
  return mgr
end
local AddMapResInfo = function(key, bounds, assetpath, position, scale, eulerAngles, onLoaded, visibleFunc)
  if not mapResMgr then
    return
  end
  local size = bounds.size * globalScale
  bounds.size = size
  mapResMgr:AddMapResInfo(key, bounds, assetpath, position, scale * globalScale, eulerAngles, onLoaded, visibleFunc)
end
local RemoveMapResInfo = function(key, bounds, destroyCallback)
  if not mapResMgr then
    return
  end
  return mapResMgr:RemoveMapResInfo(key, bounds, destroyCallback)
end
local shadowScale = Vector3(0.620000005, 0.317743778, 0.620000005)
local Bounds = CS.UnityEngine.Bounds
local Matrix4x4 = CS.UnityEngine.Matrix4x4
local LoadEventRes = function(event, gridx, gridy, onLoadedCallback)
  local grid
  if type(gridx) == "number" and type(gridy) == "number" then
    local got, result = mapLogicCache:TryGetGrid(gridx, gridy)
    grid = got and result
  elseif type(gridx) == "userdata" and nil == gridy then
    grid = gridx
  end
  if not grid then
    return
  end
  local userdata = grid.userdata
  if userdata and userdata ~= event then
    return
  end
  local assetpath = event.assetpath
  local isSpine = string.find(assetpath, "spine")
  local center = grid.center
  local settings = AbyssExploreSettings
  local val = TableData.GetConfig(70010813, "BaseFixed").int_value
  local spineScale = Vector3.one * val / 10000 * (event.scale or 1) * 1.25
  local scale = isSpine and spineScale or settings.Pic.scale
  local position = not isSpine and center or center + AbyssExploreSettings.Spine.centerOffset
  local eulerAngles = isSpine and settings.Spine.eulerAngles or settings.Pic.eulerAngles
  local sortingOrder = isSpine and settings.Spine.sortingOrder or settings.Pic.sortingOrder
  local bounds = grid.bounds
  local o = ResourceManager.Instantiate(assetpath)
  if isSpine then
    SkeletonAnimationUtil.SetFlip(o, event.spineFlip, false)
    bounds = SkeletonAnimationUtil.GetBounds(o, position, eulerAngles, scale)
    local expandPercent = 0.2
    local extents = bounds.extents
    bounds.extents = extents * expandPercent + extents
  elseif string.find(assetpath, "Prefab/Items") then
    bounds = LuaUtil.GetSpriteBounds(o, position, eulerAngles, scale)
  elseif string.find(assetpath, "Effects/Prefab") then
    local srs = o:GetComponentsInChildren(typeof(CS.UnityEngine.SpriteRenderer))
    if srs and srs.Length > 0 then
      local spriteBounds = CS.UnityEngine.Bounds(Vector3.negativeInfinity, Vector3.negativeInfinity)
      for i = 0, srs.Length - 1 do
        local childScale = scale
        local childPosition = position
        local childRotation = Quaternion.Euler(eulerAngles)
        local go = srs[i].gameObject
        local transform = go.transform
        local child = transform
        local cur = child
        while nil ~= cur do
          childPosition = childPosition + cur.localPosition
          childRotation = childRotation * Quaternion.Euler(cur.localEulerAngles)
          local localScale = cur.localScale
          childScale = Vector3(childScale.x * localScale.x, childScale.y * localScale.y, childScale.z * localScale.z)
          cur = cur.parent
        end
        local lb = srs[i].localBounds
        local matrix = Matrix4x4.TRS(childPosition, childRotation, childScale)
        spriteBounds:Encapsulate(Bounds(matrix:MultiplyPoint(lb.center), 2 * matrix:MultiplyVector(lb.extents)))
      end
      bounds = spriteBounds
    end
  end
  ResourceManager.DestroyGameObject(o)
  local e_type = event.type
  if e_type == AbyssExploreEventID.DAILY_RANDOM or e_type == AbyssExploreEventID.DAILY_RANDOM_NEWBIE or e_type == AbyssExploreEventID.ILLUSTRATIONS_BGM or e_type == AbyssExploreEventID.ILLUSTRATIONS_MONSTER then
    scale = scale * 2
  end
  AddMapResInfo(event.eventId, bounds, assetpath, position, scale, eulerAngles, function(go)
    event.view = go
    local goTrans = go.transform
    goTrans:SetParent(mapResMgr.transform)
    if isSpine then
      AbyssExploreResUtils.OnSpineLoaded(go)
      SkeletonAnimationUtil.SetFlip(go, event.spineFlip, false)
    end
    local renderers = go:GetComponentsInChildren(typeof(CS.UnityEngine.Renderer))
    if renderers then
      for i = 0, renderers.Length - 1 do
        renderers[i].sortingOrder = sortingOrder
      end
    end
    if onLoadedCallback then
      onLoadedCallback(event, go)
    end
  end)
  event.hasRes = true
end
local DestroyEventRes = function(event, gridx, gridy, destroyCallback)
  local grid
  if type(gridx) == "number" and type(gridy) == "number" then
    local got, result = mapLogicCache:TryGetGrid(gridx, gridy)
    grid = got and result
  elseif type(gridx) == "userdata" and nil == gridy then
    grid = gridx
  end
  local remove = false
  if grid then
    remove = RemoveMapResInfo(event.eventId, grid.bounds, destroyCallback)
    event.hasRes = false
  end
  event.view = nil
  return remove
end
local DeleteEvent = function(eventId)
  local group = groups[eventId]
  if group and _G.next(group) then
    local n = #group
    for i = n, 1, -1 do
      local grid = group[i]
      local userdata = grid.userdata
      local isBuilding = false
      if userdata then
        isBuilding = userdata.type == AbyssExploreEventID.BUILDING
      end
      if not isBuilding then
        grid.userdata = nil
        local v2Int = grid.coordinate
        mapLogicCache:SetGridIsObstacle(v2Int.x, v2Int.y, snapshot[grid.gridId])
        AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.EVENT_DELETE, grid, userdata)
        table.remove(group, i)
      end
    end
  end
end
local DeleteGridEvent = function(gridx, gridy)
  if not mapLogicCache then
    return
  end
  if not gridx or not gridy then
    return
  end
  local userdata = mapLogicCache:GetUserdata(gridx, gridy)
  if userdata then
    DeleteEvent(userdata.eventId)
  end
end
local InsertOrUpdateEvent = function(gridx, gridy, event, initializing)
  if not mapLogicCache then
    return
  end
  if not gridx or not gridy then
    return
  end
  local got, grid = mapLogicCache:TryGetGrid(gridx, gridy)
  if got then
    local info = grid.userdata
    if info then
      if info.hasRes then
        DestroyEventRes(info, grid)
      end
      local grids = groups[info.eventId]
      if grids then
        for i, v in ipairs(grids) do
          if v.gridId == grid.gridId then
            table.remove(grids, i)
            break
          end
        end
      end
    end
    grid.userdata = event
    local eventId = event.eventId
    if not groups[eventId] then
      groups[eventId] = {}
    end
    table.insert(groups[eventId], grid)
    mapLogicCache:SetGridIsObstacle(gridx, gridy, not event.passable)
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.EVENT_CREATE, grid, event, initializing)
  else
    print(string.format("[ABYSS]\230\151\160\230\179\149\232\142\183\229\143\150\230\160\188\229\173\144\232\175\183\230\163\128\230\159\165\229\156\176\229\155\190\230\149\176\230\141\174\230\136\150\232\190\147\229\133\165grid:(%s,%s),eventId:%s!!!", gridx, gridy, event.eventId))
  end
end
local GetEventGrids = function(eventId)
  return groups[eventId]
end
local GetMapLogicInst = function()
  return mapLogicCache
end
local GetMapViewInst = function()
  return mapViewCache
end
local SetActive = function(active)
  mapViewCache.gameObject:SetActive(active)
  mapResMgr.gameObject:SetActive(active)
end
local EnableSearchPath = function(enable)
  enableSearchPath = enable and true or false
end
local WorldToGrid = function(position, fuzzy)
  return mapLogicCache:WorldToGrid(position, fuzzy and true or false)
end
local GridToWorld = function(gridx, gridy)
  local got, grid = mapLogicCache:TryGetGrid(gridx, gridy)
  if got then
    return grid.center
  end
end
local TryGetGrid = function(gridx, gridy)
  if type(gridx) == "number" and type(gridy) == "number" then
    if mapLogicCache then
      local got, grid = mapLogicCache:TryGetGrid(gridx, gridy)
      return got, grid
    end
  else
    printError("[ABYSS] Err Args ", tostring(gridx), tostring(gridy))
  end
end
local GridIsAvailable = function(gridx, gridy)
  local result, grid = false
  if type(gridx) == "number" and type(gridy) == "number" then
    result, grid = mapLogicCache:TryGetGrid(gridx, gridy)
    result = result and grid.userdata == nil
  end
  return result, grid
end
local EventIsInserted = function(event)
  local eventId
  if type(event) == "number" then
    eventId = event
  elseif type(event) == "table" then
    eventId = event.eventId
  end
  if type(eventId) == "number" then
    local grids = GetEventGrids(eventId)
    return grids and _G.next(grids)
  end
end
local OnPathfindSuccess = function(...)
  AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.PATHFIND_SUCCESS, ...)
end
local OnPathfindFailure = function(...)
  AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.PATHFIND_FAILURE, ...)
end
local gridRendererRoot
local LoadGridRenderers = function(grids)
  local go = CS.UnityEngine.GameObject("MAP_GRIDS")
  gridRendererRoot = go.transform
  local length = grids.Length
  local walkable = "Assets/Art/Map/Prefab/Grid_1.prefab"
  local notwalkable = "Assets/Art/Map/Prefab/Grid_Obstacle.prefab"
  local walkable_scale = Vector3(1.45, 1.45, 1)
  local notwalkable_scale = Vector3(1.45, 1.45, 1)
  local ongridloaded = function(inst)
    inst.transform:SetParent(gridRendererRoot, true)
  end
  local mask = -4294967296
  for i = 0, length - 1 do
    local grid = grids[i]
    local gridId = grid.gridId
    local isObstacle = grid.isObstacle
    if not isObstacle then
      local path = isObstacle and notwalkable or walkable
      local scale = isObstacle and notwalkable_scale or walkable_scale
      local visibleCallback = not isObstacle and function()
        local got, result = mapLogicCache:TryGetGrid(gridId)
        if got then
          local eventInfo = result.userdata
          local hasEvent = nil ~= eventInfo
          local specialType = hasEvent and (eventInfo.type == AbyssExploreEventID.CHALLENGE_BOSS or eventInfo.type == AbyssExploreEventID.EXPEDITION_BUILDING or eventInfo.type == AbyssExploreEventID.BUILDING or eventInfo.type == AbyssExploreEventID.ROGUELIKE or eventInfo.type == AbyssExploreEventID.FROST_DUNGEON)
          if not hasEvent or not specialType then
            local unlock = AbyssExploreMgr.RegionIsUnlock(result.regionId)
            local cleared = AbyssExploreMgr.RegionIsCleared(result.regionId)
            return unlock and not cleared
          end
        end
        return false
      end or nil
      AddMapResInfo(grid.gridId | mask, grid.bounds, path, grid.center, scale, Vector3.zero, ongridloaded, visibleCallback)
    end
  end
end
local edgeRoot
local LoadEdgeRenderers = function(edges)
  if not edges then
    return
  end
  local go = CS.UnityEngine.GameObject("MAP_EDGES")
  edgeRoot = go.transform
  local n0 = edges.Length
  for i = 0, n0 - 1 do
    local n1 = edges[i].Length
    local o = ResourceManager.Instantiate("Assets/Art/Map/Prefab/Grid_Outline.prefab")
    o.transform:SetParent(edgeRoot)
    local renderer = o:GetOrAddComponent(typeof(CS.PathRenderer))
    renderer.density = 1
    renderer.lineWidth = 0.2
    renderer.positionCount = n1
    renderer.cachedLineRenderer.loop = true
    for j = 0, n1 - 1 do
      renderer:SetPosition(j, edges[i][j])
    end
  end
end
local LoadPathRenderer = function()
  local renderer = ResourceManager.Instantiate("Assets/Art/Map/Prefab/Path_navi.prefab"):GetComponent(typeof(CS.PathRenderer))
  renderer.density = 3
  renderer.flowspeed = 0
  renderer.positionCount = 0
  renderer.cachedLineRenderer.textureMode = CS.UnityEngine.LineTextureMode.RepeatPerSegment
  return renderer
end
local BackupGridIsObstacle = function(grids)
  if not snapshot then
    snapshot = {}
  end
  local length = grids.Length
  for i = 0, length - 1 do
    local grid = grids[i]
    snapshot[grid.gridId] = grid.isObstacle
  end
end
local SearchPath = function(from, to, ...)
  if not enableSearchPath then
    return
  end
  local found, points = mapLogicCache.pathFinder:Search(from, to)
  if found then
    OnPathfindSuccess(from, to, points, ...)
  else
    OnPathfindFailure(from, to, ...)
  end
end
local SearchPathToGrid = function(position, gridx, gridy, ...)
  if not enableSearchPath then
    return
  end
  local dst = GridToWorld(gridx, gridy)
  if dst then
    SearchPath(position, dst, ...)
  end
end
local IgnoreObstacle = function(enable)
  ignoreObstacle = enable and true or false
  mapLogicCache.pathFinder:IgnoreObstacle(ignoreObstacle)
end
local IsIgnoreObstacle = function()
  return ignoreObstacle
end
local SetIgnoreFunc = function(func)
  mapLogicCache.pathFinder.ignoreFunc = func
end
local SetGridIsObstacle = function(x, y, isObstacle)
  mapLogicCache:SetGridIsObstacle(x, y, isObstacle)
end
local SetGroupGridsIsObstacle = function(eventId, isObstacle)
  local group = groups[eventId]
  if group and _G.next(group) then
    local n = #group
    for i = n, 1, -1 do
      local grid = group[i]
      local v2Int = grid.coordinate
      mapLogicCache:SetGridIsObstacle(v2Int.x, v2Int.y, isObstacle)
    end
  end
end
local SetIsAvailableFunc = function(func)
  mapLogicCache.pathFinder.isAvailable = func
end
local UpdateMapBlocks = function(position, async)
  if mapViewCache then
    mapViewCache:UpdatePosition(position, async or false)
  end
end
local GetGridsAroundCenter = function(centerX, centerY, rangeX, rangeY, filter)
  if type(filter) == "function" then
    return mapLogicCache:GetGridsAroundCenter(centerX, centerY, rangeX, rangeY, filter)
  end
  local grid, x, y, filterFunc = centerX, centerY, rangeX, rangeY
  return mapLogicCache:GetGridsAroundCenter(grid, x, y, filterFunc)
end
local ShowPath = function(key, points, showTargetGrid, ignoreUnwalkable)
  if not pathRenderers then
    pathRenderers = {}
  end
  if not pathRenderers[key] then
    pathRenderers[key] = {}
  end
  local entry = pathRenderers[key]
  if not entry.pathRenderer then
    entry.pathRenderer = LoadPathRenderer()
  end
  local renderer = entry.pathRenderer
  local targetGridEff
  if showTargetGrid then
    if not entry.targetGridEff then
      entry.targetGridEff = ResourceManager.Instantiate("Assets/Art/Map/Prefab/Grid_Target_navi.prefab")
    end
    targetGridEff = entry.targetGridEff
  end
  local s, n = 0, 0
  if type(points) == "userdata" then
    n = points.Count - 1
  elseif type(points) == "table" then
    s = 1
    n = #points - 1
  end
  local positionCount = math.max(0, n - s + 1)
  renderer.positionCount = positionCount
  if positionCount > 0 then
    local transform
    if targetGridEff then
      targetGridEff:SetActive(true)
      transform = targetGridEff.transform
      transform.localScale = Vector3(1.15939999, 1.15939999, 1.06514072)
    end
    local j = 0
    for i = s, n do
      renderer:SetPosition(j, points[i])
      j = j + 1
    end
    local point
    if positionCount > 1 then
      point = points[n]
      if transform then
        transform.position = point
      end
    else
      local grid = AbyssExploreMapCtrl.WorldToGrid(points[n])
      point = grid.center
      if transform and Vector3.Distance(point, AbyssExploreChrCtrl.GetPosition()) < 0.001 then
        transform.position = point
      end
    end
  end
end
local HidePath = function(key)
  if not pathRenderers then
    return
  end
  if pathRenderers[key] then
    local entry = pathRenderers[key]
    local pathRenderer = entry.pathRenderer
    local targetGridEff = entry.targetGridEff
    if pathRenderer then
      ResourceManager.DestroyGameObject(pathRenderer.cachedGameObject)
    end
    if targetGridEff then
      ResourceManager.DestroyGameObject(targetGridEff)
    end
    entry.pathRenderer = nil
    entry.targetGridEff = nil
  end
end
local Init = function(mapId, scale)
  groups = {}
  mapLogicCache = InitMapLogic(mapId)
  globalScale = scale or 1
  LoadEdgeRenderers(mapLogicCache.edges)
  BackupGridIsObstacle(mapLogicCache.mapGrids)
  mapViewCache = InitMapView(mapId, mapLogicCache.pivot)
  local bounds = mapLogicCache.boundingBox
  bounds:Expand(0.05)
  mapResMgr = InitMapResMgr(mapId, mapViewCache.transform, bounds)
  LoadGridRenderers(mapLogicCache.mapGrids)
  AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.MAP_INIT_COMPLETE, mapId, mapLogicCache, mapViewCache)
end
local InitAsync = function(mapId, scale, callback)
  groups = {}
  InitMapLogicAsync(mapId, function(map)
    mapLogicCache = map
    globalScale = scale or 1
    LoadEdgeRenderers(mapLogicCache.edges)
    BackupGridIsObstacle(mapLogicCache.mapGrids)
    mapViewCache = InitMapView(mapId, mapLogicCache.pivot)
    local bounds = mapLogicCache.boundingBox
    bounds:Expand(0.05)
    mapResMgr = InitMapResMgr(mapId, mapViewCache.transform, bounds)
    LoadGridRenderers(mapLogicCache.mapGrids)
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.MAP_INIT_COMPLETE, mapId, mapLogicCache, mapViewCache)
    if callback then
      callback()
    end
  end)
end
local Release = function()
  if mapLogicCache then
    local grids = mapLogicCache.mapGrids
    for i = 0, grids.Length - 1 do
      grids[i].userdata = nil
    end
  end
  if mapResMgr then
    mapResMgr:Release()
    GameObject.Destroy(mapResMgr.gameObject)
  end
  if mapViewCache then
    mapViewCache:Release()
    GameObject.Destroy(mapViewCache.gameObject)
  end
  if gridRendererRoot then
    GameObject.Destroy(gridRendererRoot.gameObject)
  end
  if edgeRoot then
    local count = edgeRoot.childCount
    for i = count - 1, 0, -1 do
      ResourceManager.DestroyGameObject(edgeRoot:GetChild(i).gameObject)
    end
    GameObject.Destroy(edgeRoot.gameObject)
  end
  if pathRenderers then
    for i, entry in pairs(pathRenderers) do
      local pathRenderer = entry.pathRenderer
      local targetGridEff = entry.targetGridEff
      if pathRenderer then
        ResourceManager.DestroyGameObject(pathRenderer.cachedGameObject)
      end
      if targetGridEff then
        ResourceManager.DestroyGameObject(targetGridEff)
      end
      entry.pathRenderer = nil
      entry.targetGridEff = nil
    end
  end
  pathRenderers = nil
  edgeRoot = nil
  groups = nil
  mapResMgr = nil
  mapViewCache = nil
  mapLogicCache = nil
  gridRendererRoot = nil
  snapshot = nil
end
local UpdateMapItems = function(bounds)
  if mapResMgr then
    mapResMgr:UpdateView(bounds)
  end
end
local DestroyAllItems = function(cache)
  if mapResMgr then
    mapResMgr:DestroyAllInsts(cache)
  end
end
return {
  Init = Init,
  InitAsync = InitAsync,
  GetMapLogicInst = GetMapLogicInst,
  GetMapViewInst = GetMapViewInst,
  SetActive = SetActive,
  WorldToGrid = WorldToGrid,
  GridToWorld = GridToWorld,
  TryGetGrid = TryGetGrid,
  GridIsAvailable = GridIsAvailable,
  IgnoreObstacle = IgnoreObstacle,
  DeleteEvent = DeleteEvent,
  DeleteGridEvent = DeleteGridEvent,
  InsertOrUpdateEvent = InsertOrUpdateEvent,
  AddMapResInfo = AddMapResInfo,
  RemoveMapResInfo = RemoveMapResInfo,
  LoadEventRes = LoadEventRes,
  DestroyEventRes = DestroyEventRes,
  SearchPath = SearchPath,
  SearchPathToGrid = SearchPathToGrid,
  EnableSearchPath = EnableSearchPath,
  UpdateMapItems = UpdateMapItems,
  DestroyAllItems = DestroyAllItems,
  UpdateMapBlocks = UpdateMapBlocks,
  SetIgnoreFunc = SetIgnoreFunc,
  IsIgnoreObstacle = IsIgnoreObstacle,
  SetGridIsObstacle = SetGridIsObstacle,
  SetGroupGridsIsObstacle = SetGroupGridsIsObstacle,
  SetIsAvailableFunc = SetIsAvailableFunc,
  GetGridsAroundCenter = GetGridsAroundCenter,
  GetEventGrids = GetEventGrids,
  EventIsInserted = EventIsInserted,
  ShowPath = ShowPath,
  HidePath = HidePath,
  Release = Release
}
