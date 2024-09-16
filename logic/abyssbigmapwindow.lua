require("Abyss_BigMapWindowByName")
local AbyssBigMapWindow = {}
local uis, contentPane, initWidth, initHeight
local extendScale, minExtendScale, maxExtendScale, sensitivity = 0, 0, 0.3, 0.01
local mapCache, playerflag, eventflags, FOWHolder, minimapFOWMask
local pathpoints = {}
local pathRenderer, tempHolder, tweenId
local UpdatePathpoints = function(points)
  for _ = 1, #pathpoints do
    table.remove(pathpoints)
  end
  local cnt = points.Count
  for i = 0, cnt - 1 do
    local x, y = AbyssExploreMinimapUtils.WorldPositionToMapRatio(points[i])
    table.insert(pathpoints, Vector2(x, y))
  end
end
local UpdateLineRenderer = function()
  local cnt = #pathpoints
  pathRenderer.positionCount = cnt
  local sc = StageCamera.main
  for i = 1, cnt do
    local x, y = pathpoints[i].x, pathpoints[i].y
    local global = mapCache:LocalToGlobal(Vector2(mapCache.width * x, mapCache.height * (1 - y)))
    local position = sc:ScreenToWorldPoint(Vector3(global.x, Screen.height - global.y, -sc.transform.position.z))
    pathRenderer:SetPosition(i - 1, position)
  end
end
local OnPathfindSuccess = function(from, to, points, type, eventInfo)
end
local RegisterListeners = function()
end
local UnregisterListeners = function()
end

function AbyssBigMapWindow.ReInitData()
end

function AbyssBigMapWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.AbyssBigMapWindow.package, WinResConfig.AbyssBigMapWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyss_BigMapWindowUis(contentPane)
    RegisterListeners()
    AbyssBigMapWindow.UpdateInfo()
    AbyssBigMapWindow.InitBtn()
  end)
end

local onzoom = function()
  playerflag:updatepos()
  for i, v in pairs(eventflags) do
    v:updatepos()
  end
  UpdateLineRenderer()
end
local zoomWithPivot = function(zoomable, pivot, scale)
  zoomable.pivot = pivot
  zoomable:SetSize(initWidth * scale, initHeight * scale)
  local parent = zoomable.parent
  local global = zoomable:LocalToGlobal(Vector2.zero)
  local result = AbyssExploreMinimapUtils.ClampPosWithWH(zoomable, global, Vector2.zero, Screen.width, Screen.height)
  result = parent:GlobalToLocal(result)
  zoomable:SetXY(result.x, result.y)
  onzoom()
end
local zoomWithScreenPoint = function(zoomable, sp, scale)
  local l_p = zoomable:GlobalToLocal(sp)
  local width, height = zoomable.width, zoomable.height
  local pivot = Vector2(l_p.x / width, l_p.y / height)
  zoomWithPivot(zoomable, pivot, scale)
end
local SetExtendVal = function(val, inverse)
  local clampVal = math.max(minExtendScale, math.min(val, maxExtendScale))
  extendScale = clampVal
end
local Compare = function(x, y)
  local y0, y1 = x.ratioy, y.ratioy
  if y0 == y1 then
    return x.ratiox > y.ratiox
  end
  return y0 > y1
end
local sortingBuffer
local new_gobj_list = CS.System.Collections.Generic.List(CS.FairyGUI.GObject)
local SortMapflags = function()
  if eventflags then
    local parent = uis.Main.BigMapPicDrag.BigMapEventPic.root
    if not sortingBuffer then
      sortingBuffer = new_gobj_list(#eventflags)
    end
    sortingBuffer:Clear()
    table.sort(eventflags, Compare)
    for i, v in ipairs(eventflags) do
      sortingBuffer:Add(v.gobj)
    end
    if playerflag then
      sortingBuffer:Add(playerflag.gobj)
    end
    parent:ChangeChildrenOrder(sortingBuffer)
  end
end
local Callback_OnZoom = function(delta)
  local input = CS.UnityEngine.Input
  local screen = CS.UnityEngine.Screen
  local draggable = uis.Main.BigMapPicDrag.root
  local sp
  if Application.platform == RuntimePlatform.WindowsEditor or Application.platform == RuntimePlatform.OSXEditor then
    sp = input.mousePosition
  elseif Application.platform == RuntimePlatform.Android or Application.platform == RuntimePlatform.IPhonePlayer then
    local p0, p1 = input.GetTouch(0).position, input.GetTouch(1).position
    sp = (p0 + p1) * 0.5
    delta = delta * 2.5
  end
  SetExtendVal(extendScale + delta * sensitivity, true)
  zoomWithScreenPoint(draggable, Vector2(sp.x, screen.height - sp.y), 1 + extendScale)
  PlayerPrefsUtil.SetFloat(PLAYER_PREF_ENUM.ABYSS_MINIMAP_ZOOM_SCALE, extendScale)
end
local offset
local Callback_OnBeginSwipe = function(finger)
  if tweenId then
    LeanTween.cancel(tweenId)
    tweenId = nil
  end
  local draggable = uis.Main.BigMapPicDrag.root
  local position = Vector2(finger.x, Screen.height - finger.y)
  local global = draggable:LocalToGlobal(Vector2.zero)
  offset = global - position
end
local Callback_OnSwipe = function(finger, _, _)
  local draggable = uis.Main.BigMapPicDrag.root
  local position = Vector2(finger.x, Screen.height - finger.y)
  offset = type(offset) == "userdata" and offset or Vector2.zero
  local result = AbyssExploreMinimapUtils.ClampPosWithWH(draggable, position + offset, Vector2.zero, Screen.width, Screen.height)
  result = draggable.parent:GlobalToLocal(result)
  draggable:SetXY(result.x, result.y)
  UpdateLineRenderer()
end
local Callback_OnClickFlag = function(flag)
  for i, v in pairs(eventflags) do
    if v ~= flag then
      v:setctrl(0, "c1")
    end
  end
  for i, v in pairs(eventflags) do
    if v == flag then
      v:setctrl(1, "c1")
    end
  end
end
local Callback_OnClickFlagFocus = function(flag)
  local userdata = flag.userdata
  if not AbyssExploreMgr.IsFocusing(userdata.eventId) then
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_explore_mark")
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.EVENT_FOCUS, userdata)
  else
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.EVENT_UNFOCUS, userdata)
  end
  flag:setctrl(0, "c1")
  SortMapflags()
end
local centerWithPlayerflag = function()
  local draggable = uis.Main.BigMapPicDrag.root
  local point = AbyssExploreMinimapUtils.NormalizedPosToMinimap(playerflag.ratiox, playerflag.ratioy, mapCache)
  point = mapCache:TransformPoint(point, draggable)
  local global = draggable:LocalToGlobal(Vector2.zero)
  local diff = Vector2(Screen.width * 0.5, Screen.height * 0.5) - draggable:LocalToGlobal(point)
  local position = draggable.parent:GlobalToLocal(AbyssExploreMinimapUtils.ClampPosWithWH(draggable, Vector2(global.x + diff.x, global.y + diff.y), Vector2.zero, Screen.width, Screen.height))
  draggable:SetXY(position.x, position.y)
end
local ResetZoomScaleAndPosition = function(immediate, targetExtendScale)
  local draggable = uis.Main.BigMapPicDrag.root
  targetExtendScale = targetExtendScale or 0.5 * maxExtendScale
  if tweenId then
    LeanTween.cancel(tweenId)
    tweenId = nil
  end
  if not immediate then
    local duration = 0.4
    local width, height = draggable.width, draggable.height
    local point = AbyssExploreMinimapUtils.NormalizedPosToMinimap(playerflag.ratiox, playerflag.ratioy, mapCache)
    point = mapCache:TransformPoint(point, draggable)
    local pivot = Vector2(point.x / width, point.y / height)
    local global = draggable:LocalToGlobal(Vector2.zero)
    local diff = Vector2(Screen.width * 0.5, Screen.height * 0.5) - draggable:LocalToGlobal(point)
    local position = draggable.parent:GlobalToLocal(AbyssExploreMinimapUtils.ClampPosWithWH(draggable, Vector2(global.x + diff.x, global.y + diff.y), Vector2.zero, Screen.width, Screen.height))
    tweenId = LeanTween.value(0, 1, duration):setOnUpdate(function(val)
      local scale = Mathf.Lerp(extendScale, targetExtendScale, val)
      SetExtendVal(scale, true)
      zoomWithPivot(draggable, pivot, 1 + extendScale)
      local result = Vector2.Lerp(Vector2(draggable.x, draggable.y), position, val)
      draggable:SetXY(result.x, result.y)
    end):setOnComplete(function()
      tweenId = nil
    end).id
  else
    SetExtendVal(targetExtendScale, true)
    zoomWithPivot(draggable, Vector2(0.5, 0.5), 1 + extendScale)
    centerWithPlayerflag()
  end
end
local InitMinimapSize = function()
  local root = uis.Main.BigMapPicDrag.root
  initWidth, initHeight = root.initWidth / (1 + maxExtendScale), root.initHeight / (1 + maxExtendScale)
  root:SetSize(initWidth, initHeight)
  local scaleFactor = UIContentScaler.scaleFactor
  local minWidth, minHeight = Screen.width / scaleFactor, Screen.height / scaleFactor
  local minScale = math.min(initWidth / minWidth, initHeight / minHeight)
  local inverseMinScale = 1 / minScale
  minExtendScale = math.max(0, inverseMinScale - 1)
end
local InitMapflags = function()
  eventflags = {}
  local panel = uis.Main.BigMapPicDrag
  local parent = panel.BigMapEventPic.root
  local events = AbyssExploreData.GetAllEvents()
  for i, v in pairs(events) do
    local type, subtype = v.type, v.subtype
    local create = type == AbyssExploreEventID.BUILDING or type == AbyssExploreEventID.CHALLENGE_BOSS or type == AbyssExploreEventID.EXPEDITION_BUILDING
    local regionId = not v.noPosition and AbyssExploreMgr.GetRegionId(v.x, v.y)
    local inserted = AbyssExploreMapCtrl.EventIsInserted(v)
    if not v.noPosition and (0 == v.finishTimestamp or create) and AbyssExploreMgr.RegionIsUnlock(regionId) and not AbyssExploreMgr.RegionIsCleared(regionId) and inserted then
      local flag = AbyssExploreMapflag.CreateMapflagWithEventInfo(v, parent, mapCache, Vector2(0.5, 0.5), true, Vector2.one)
      if flag then
        table.insert(eventflags, flag)
        flag:setonclick(Callback_OnClickFlag)
        flag:setevtbtnclick("EventTabBtn", Callback_OnClickFlagFocus)
        flag:setuserdata(v)
        flag:marker(AbyssExploreMgr.IsFocusing(v.eventId))
        flag:setctrl_onchanged("c1", function(selectedIndex)
          local eventChoice = flag.gobj:GetChild("EventChoice")
          if 1 == selectedIndex then
            local eventId = v.eventId
            local focusing = AbyssExploreMgr.IsFocusing(eventId)
            flag:setsortingorder(10)
            playerflag:setsortingorder(11)
            local tabBtn = eventChoice:GetChild("EventTabBtn")
            local wordTxt = tabBtn:GetChild("WordTxt")
            wordTxt.text = focusing and T(20107) or T(20106)
            PlayUITrans(eventChoice, "in")
            eventChoice.touchable = true
          else
            flag:setsortingorder(0)
            PlayUITrans(eventChoice, "out")
            eventChoice.touchable = false
          end
        end)
      end
    end
  end
  playerflag = AbyssExploreMapflag.CreateMapflag(parent, mapCache, AbyssExploreChrCtrl.GetPosition(), Vector2(0.5, 1), true, Vector2.one)
end

function AbyssBigMapWindow.UpdateInfo()
  mapCache = uis.Main.BigMapPicDrag.BigMapPic.root:GetChild("BigMapPic1")
  local draggable = uis.Main.BigMapPicDrag.root
  InitMinimapSize()
  InitMapflags()
  CS.InputGesture.sharedInst:OnZoom("+", Callback_OnZoom)
  CS.InputGesture.sharedInst:OnSwipeScreen("+", Callback_OnSwipe)
  CS.InputGesture.sharedInst:OnBeginSwipeScreen("+", Callback_OnBeginSwipe)
  local go = ResourceManager.Instantiate("Assets/Art/Map/Prefab/Path.prefab")
  pathRenderer = go:GetComponent(typeof(CS.PathRenderer))
  pathRenderer.lineWidth = 0.04
  pathRenderer.cachedGameObject:SetActive(false)
  local holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
  draggable:AddChildAt(holder, 1)
  UIUtil.SetObjectToUI(go, holder)
  tempHolder = holder
  for i = 1, 8 do
    local child = draggable:GetChild(string.format("Area%s", i))
    local title = child:GetChild("AreaTitle")
    title.visible = true
    local conf = TableData.GetConfig(i, "BaseManorMapSub")
    UIUtil.SetText(title, type(conf.name) == "function" and conf.name() or "未配置", "NameTxt")
    UIUtil.SetText(title, "function" == type(conf.name_english) and conf.name_english() or "UNCONFIGURED", "SubtitleTxt")
    local unlock = AbyssExploreMgr.RegionIsUnlock(i)
    local cleared = AbyssExploreMgr.RegionIsCleared(i)
    local available = unlock and not cleared
    if 1 == i then
      ChangeUIController(child, "lock", available and 0 or 1)
    end
    if 2 == i or 5 == i or 6 == i or 7 == i then
      ChangeUIController(title, "lock", available and 0 or 2)
    else
      ChangeUIController(title, "lock", available and 0 or 1)
    end
    local cnt = child.numChildren
    if cnt > 1 then
      for j = 0, cnt - 1 do
        local c = child:GetChildAt(j)
        if string.find(c.name, "n") then
          c.visible = not available
        end
      end
    end
  end
  local scale = PlayerPrefsUtil.GetFloat(PLAYER_PREF_ENUM.ABYSS_MINIMAP_ZOOM_SCALE, maxExtendScale * 0.5)
  ResetZoomScaleAndPosition(true, math.max(minExtendScale, math.min(maxExtendScale, scale)))
  SortMapflags()
end

function AbyssBigMapWindow.InitBtn()
  uis.Main.MapCloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.AbyssBigMapWindow.name)
  end)
  uis.Main.BigMapResetBtn.onClick:Set(function()
    ResetZoomScaleAndPosition(false, extendScale)
  end)
  uis.Main.BigMapPicDrag.BigMapPic.root.onClick:Set(function()
    for i, v in pairs(eventflags) do
      v:setctrl(0, "c1")
    end
    SortMapflags()
  end)
end

function AbyssBigMapWindow.OnClose()
  uis = nil
  contentPane = nil
  UnregisterListeners()
  if playerflag then
    playerflag:delete()
  end
  if eventflags then
    for _, v in pairs(eventflags) do
      v:delete()
    end
  end
  if pathRenderer then
    ResourceManager.DestroyGameObject(pathRenderer.cachedGameObject, false)
  end
  pathRenderer = nil
  eventflags = nil
  playerflag = nil
  FOWHolder = nil
  minimapFOWMask = nil
  if tempHolder then
    tempHolder:Dispose()
  end
  tempHolder = nil
  CS.InputGesture.sharedInst:OnZoom("-", Callback_OnZoom)
  CS.InputGesture.sharedInst:OnSwipeScreen("-", Callback_OnSwipe)
  CS.InputGesture.sharedInst:OnBeginSwipeScreen("-", Callback_OnBeginSwipe)
  if tweenId then
    LeanTween.cancel(tweenId)
    tweenId = nil
  end
  if sortingBuffer then
    sortingBuffer:Clear()
    sortingBuffer = nil
  end
end

function AbyssBigMapWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.AbyssBigMapWindow.REFRESH_FOCUSING_EVENTS then
    for i, v in ipairs(eventflags) do
      if v.userdata == para then
        v:setevtbtnctrl("EventRouteBtn", "button", 1)
      else
        v:setevtbtnctrl("EventRouteBtn", "button", 0)
      end
    end
  elseif msgId == WindowMsgEnum.AbyssBigMapWindow.UPDATE_TRACKED_EVENT_PATH then
  elseif msgId == WindowMsgEnum.AbyssBigMapWindow.CANCEL_TRACKED_EVENT then
    for i, v in ipairs(eventflags) do
      if v.userdata == para then
        v:setevtbtnctrl("EventRouteBtn", "button", 0)
        break
      end
    end
  elseif msgId == WindowMsgEnum.AbyssBigMapWindow.ADD_FOCUSING_EVENT then
    for i, v in ipairs(eventflags) do
      if v.userdata == para then
        v:marker(true)
        break
      end
    end
  elseif msgId == WindowMsgEnum.AbyssBigMapWindow.REMOVE_FOCUSING_EVENT then
    for i, v in ipairs(eventflags) do
      if v.userdata == para then
        v:marker(false)
        v:setevtbtnctrl("EventTabBtn", "button", 0)
        break
      end
    end
  elseif msgId == WindowMsgEnum.AbyssBigMapWindow.FOCUSING_EVENT_MAX then
    for i, v in ipairs(eventflags) do
      if v.userdata == para then
        v:setevtbtnctrl("EventTabBtn", "button", 0)
        break
      end
    end
  elseif msgId == WindowMsgEnum.AbyssBigMapWindow.UPDATE_PLAYER_POSITION and playerflag then
    local x, y = AbyssExploreMinimapUtils.WorldPositionToMapRatio(para)
    playerflag:setpos(x, y)
  end
end

return AbyssBigMapWindow
