local CameraUtil = {}

function CameraUtil.SetCameraActive(camera, active)
  if camera then
    local component = camera:GetComponent(typeof(Camera))
    if component and component.enabled ~= active then
      component.enabled = active
    end
  end
end

function CameraUtil.SetCameraCullingMask(camera, cullingMask)
  if camera then
    local lCamera = camera:GetComponent(typeof(Camera))
    lCamera.cullingMask = cullingMask
  end
end

function CameraUtil.SetCameraOrthographicSize(cameraObject, orthographicSize, interval, isRelative)
  local camera = cameraObject.transform:GetComponent(typeof(Camera))
  if camera then
    if nil == interval then
      if true == isRelative then
        camera.orthographicSize = camera.orthographicSize + orthographicSize
      else
        camera.orthographicSize = orthographicSize
      end
    elseif true == isRelative then
      local oriValue = camera.orthographicSize
      LeanTween.value(0, orthographicSize, interval):setEase(LeanTweenType.easeInSine):setOnUpdate(function(value, camera)
        camera.orthographicSize = oriValue + value
      end, camera)
    else
      local oriValue = camera.orthographicSize
      LeanTween.value(oriValue, orthographicSize, interval):setEase(LeanTweenType.easeInSine):setOnUpdate(function(value, camera)
        camera.orthographicSize = value
      end, camera)
    end
  end
end

function CameraUtil.SetCameraFOV(cameraObject, fov, interval, isRelative)
  local camera = cameraObject.transform:GetComponent(typeof(Camera))
  if camera then
    if nil == interval then
      if true == isRelative then
        camera.fieldOfView = camera.fieldOfView + fov
      else
        camera.fieldOfView = fov
      end
    elseif true == isRelative then
      local oriValue = camera.fieldOfView
      LeanTween.value(0, fov, interval):setEase(LeanTweenType.easeInSine):setOnUpdate(function(value, camera)
        camera.fieldOfView = oriValue + value
      end, camera)
    else
      local oriValue = camera.fieldOfView
      LeanTween.value(oriValue, fov, interval):setEase(LeanTweenType.easeInSine):setOnUpdate(function(value, camera)
        camera.fieldOfView = value
      end, camera)
    end
  end
end

function CameraUtil.MoveCamera(camera, position, interval, isRelative, leanTweenType)
  if camera then
    CameraUtil.GoNowCamera(camera, position, interval, leanTweenType or LeanTweenType.easeInSine, nil, isRelative)
  end
end

function CameraUtil.GoNowCamera(camera, destPosition, moveTime, moveType, callBack, isRelative)
  LuaUtil.CameraMove(camera, destPosition, moveTime, moveType, callBack, isRelative)
end

function CameraUtil.TransparentPosition(object, oriCamera, targetCamera, scale)
  if nil == object then
    return {
      x = 0,
      y = 0,
      z = 0
    }
  end
  local position = BattleCameraObject.transform.position
  local pos = oriCamera:WorldToViewportPoint(object.transform.position)
  pos = targetCamera:ViewportToWorldPoint(pos)
  pos.x = pos.x * position.y / (position.y - pos.y)
  pos.z = position.z - position.y * (position.z - pos.z) / (position.y - pos.y)
  pos.y = 0
  pos = pos * scale
  return pos
end

function CameraUtil.SetCameraBloomActive(object, active)
  local camera = object.transform:GetComponentInChildren(typeof(Camera))
  if camera then
    LuaUtil.SetCameraPPVActive(camera, active)
  end
end

return CameraUtil
