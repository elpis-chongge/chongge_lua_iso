local camCache, mapcamCache
local GetCameraInst = function()
  return camCache
end
local GetMapcamInst = function()
  return mapcamCache
end
local Follow = function(position, lerp)
  if not mapcamCache then
    return
  end
  mapcamCache:Follow(position, lerp)
end
local MoveTo = function(position, duration, oncomplete)
  if not mapcamCache then
    return
  end
  return mapcamCache:MoveTo(position, duration, oncomplete)
end
local StopTransition = function()
  if not mapcamCache then
    return
  end
  mapcamCache:StopTranslation()
end
local IsSwiping = function()
  if not mapcamCache then
    return
  end
  return mapcamCache.isSwiping
end
local IsMoving = function()
  if not mapcamCache then
    return
  end
  return mapcamCache.isMoving
end
local GetViewBounds = function(update)
  if not mapcamCache then
    return
  end
  if update then
    mapcamCache:UpdateViewBounds()
  end
  return mapcamCache:GetViewBounds()
end
local GetViewCenter = function(update)
  local bounds = GetViewBounds(update)
  if bounds then
    return bounds.center
  end
end
local SetActive = function(active)
  if not mapcamCache then
    return
  end
  mapcamCache.gameObject:SetActive(active)
end
local SetDraggable = function(enable)
  if not mapcamCache then
    return
  end
  mapcamCache.draggable = enable and true or false
end
local DEV_ASPECT = 1.7786666666666666
local AdaptScreen = function(camera, orthographicSize, bounds)
  local aspect = camera.aspect
  if aspect < DEV_ASPECT then
    orthographicSize = orthographicSize * (DEV_ASPECT / aspect)
  end
  local extents = bounds.extents
  local width = aspect * orthographicSize
  if width > extents.x or orthographicSize > extents.y then
    local scale = math.min(extents.x / width, extents.y / orthographicSize)
    orthographicSize = scale * orthographicSize
  end
  return orthographicSize
end
local InitCamera = function(bounds, position, eulerAngles, depth, size, cullingMask, name)
  local go = ResourceManager.Instantiate("Assets/Art/Map/Prefab/AbyssCamera_Postprocess.prefab")
  local component = go:GetOrAddComponent(typeof(CS.UnityEngine.Camera))
  component.orthographic = true
  component.orthographicSize = AdaptScreen(component, size or 5, bounds)
  component.transform.position = position or Vector3(0, 0, -10)
  component.transform.eulerAngles = eulerAngles or Vector3.zero
  component.cullingMask = cullingMask or component.cullingMask & -33
  component.depth = depth or 0
  component.clearFlags = CS.UnityEngine.CameraClearFlags.SolidColor
  component.backgroundColor = CS.UnityEngine.Color.black
  local mapCamera = go:GetOrAddComponent(typeof(CS.MapCamera))
  mapCamera:UpdateMapBoundsEulerAngles(bounds, Vector3(-90, 0, 0))
  mapCamera:UpdateViewBounds()
  mapCamera.expand = 0
  mapCamera.elasticEdge = 0
  mapCamera.elasticSpeed = 0
  return mapCamera
end
local Mapcam_OnZoom = function(delta)
  if not mapcamCache then
    return
  end
end
local Mapcam_OnBeginSwipe = function(finger)
  if not mapcamCache then
    return
  end
  mapcamCache:OnBeginSwipe(finger)
end
local Mapcam_OnSwipe = function(finger, direction, dist)
  if not mapcamCache then
    return
  end
  mapcamCache:OnSwipe(finger, direction, dist)
end
local Mapcam_OnEndSwipe = function(finger)
  if not mapcamCache then
    return
  end
  mapcamCache:OnEndSwipe(finger)
end
local Init = function(bounds, position, eulerAngles)
  local mainCamSettings = AbyssExploreSettings.MainCam
  local depth = mainCamSettings.depth
  local orthographicSize = mainCamSettings.orthographicSize
  local cullingMask = mainCamSettings.cullingMask
  local posx, posy = position and position.x or 0, position and position.y or 0
  local camPosition = Vector3(posx, posy, mainCamSettings.offsetZ)
  mapcamCache = InitCamera(bounds, camPosition, eulerAngles, depth, orthographicSize, cullingMask)
  mapcamCache.manualUpdate = true
  camCache = mapcamCache.cameraCache
  camCache.allowHDR = false
  local size = camCache.orthographicSize
  mapcamCache:SetOrthgraphicSizeMinMax(size, size)
  mapcamCache.orthographicSize = size
  mapcamCache.sensitivity = 0.01
  mapcamCache.linearDrag = 0.015
  mapcamCache.expand = 0
  mapcamCache.useInertiaDuration = true
  mapcamCache.inertiaDuration = 0.5
  mapcamCache.draggable = true
end
local Update = function()
  mapcamCache:DoUpdate()
end
local Release = function()
  if camCache then
    ResourceManager.DestroyGameObject(camCache.gameObject)
  end
  camCache = nil
  mapcamCache = nil
end
return {
  Init = Init,
  GetCameraInst = GetCameraInst,
  GetMapcamInst = GetMapcamInst,
  Follow = Follow,
  MoveTo = MoveTo,
  SetActive = SetActive,
  SetDraggable = SetDraggable,
  StopTransition = StopTransition,
  GetViewBounds = GetViewBounds,
  GetViewCenter = GetViewCenter,
  IsMoving = IsMoving,
  IsSwiping = IsSwiping,
  Update = Update,
  Mapcam_OnZoom = Mapcam_OnZoom,
  Mapcam_OnSwipe = Mapcam_OnSwipe,
  Mapcam_OnEndSwipe = Mapcam_OnEndSwipe,
  Mapcam_OnBeginSwipe = Mapcam_OnBeginSwipe,
  Release = Release
}
