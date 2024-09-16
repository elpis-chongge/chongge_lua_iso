local reuseables = {}
local init = function(self, gobj, parent, mapObj, ratiox, ratioy, maprect)
  self.gobj = gobj
  self.mapObj = mapObj
  self.maprect = maprect
  self:setpos(ratiox or 0, ratioy or 0)
  self:setparent(parent)
  local flag_obj = gobj:GetChild("n8")
  if flag_obj then
    flag_obj.pivot = Vector2(0.5, 1)
    flag_obj:SetScale(1.5, 1.5)
  end
end
local delete = function(self)
  self.mapObj = nil
  self.parent = nil
  if self.gobj then
    self.gobj:Dispose()
  end
  self.gobj = nil
  for _, v in ipairs(reuseables) do
    if v == self then
      return
    end
  end
  if self.markerObj then
    self.markerObj:Dispose()
  end
  self.markerObj = nil
  self.userdata = nil
  table.insert(reuseables, self)
end
local setpos = function(self, ratiox, ratioy)
  self.ratiox = ratiox
  self.ratioy = ratioy
  self:updatepos()
end
local setparent = function(self, parent)
  if not self.gobj then
    return
  end
  if self.parent ~= parent then
    self.parent = parent
    self.parent:AddChild(self.gobj)
    self:updatepos()
  end
end
local setactive = function(self, active)
  if not self.gobj then
    return
  end
  self.gobj.visible = active
end
local setctrl = function(self, ctrlindex, name)
  if not self.gobj then
    return
  end
  local ctrl = self.gobj:GetController(name or "event")
  if ctrl then
    ctrl.selectedIndex = ctrlindex
  end
end
local setctrl_onchanged = function(self, ctrlname, onchanged_callback)
  local ctrl = self.gobj:GetController(ctrlname or "event")
  if ctrl then
    ctrl.onChanged:Set(function()
      onchanged_callback(ctrl.selectedIndex)
    end)
  end
end
local setscale = function(self, scale)
  if not self.gobj then
    return
  end
  self.scale = scale
  local initWidth, initHeight = self.gobj.initWidth, self.gobj.initHeight
  self.gobj:SetSize(scale * initWidth, scale * initHeight)
end
local setonclick = function(self, callback)
  if not self.gobj then
    return
  end
  if not callback then
    return
  end
  local ctrl = self.gobj:GetController("event")
  local btn = self.gobj:GetChildAt(ctrl.selectedIndex + 1)
  btn.onClick:Set(function()
    callback(self)
  end)
end
local setevtbtnclick = function(self, btnname, callback)
  if not self.gobj then
    return
  end
  if not callback then
    return
  end
  local choice = self.gobj:GetChild("EventChoice")
  local btn = choice:GetChild(btnname)
  btn.onClick:Set(function()
    callback(self)
  end)
end
local setevtbtnctrl = function(self, btnname, ctrlname, ctrlindex)
  if not self.gobj then
    return
  end
  local choice = self.gobj:GetChild("EventChoice")
  local btn = choice:GetChild(btnname)
  ChangeUIController(btn, ctrlname or "event", ctrlindex)
end
local setuserdata = function(self, userdata)
  self.userdata = userdata
end
local marker = function(self, enable)
  local ctrl = self.gobj:GetController("c2")
  if enable then
    ctrl.selectedIndex = 1
  else
    ctrl.selectedIndex = 0
  end
end
local updatepos = function(self)
  if not self.gobj or not self.parent then
    return
  end
  local map = self.mapObj
  local maprect = self.maprect
  local x, y = self.ratiox, self.ratioy
  local point = AbyssExploreMinimapUtils.NormalizedPosToMinimap(x, y, map, maprect)
  local parent = self.parent or GRoot.inst
  point = map:TransformPoint(point, parent)
  self.gobj:SetXY(point.x, point.y)
  if self.markerObj then
    local py = point.y - 30 * self.gobj.scale.x
    self.markerObj:SetXY(point.x, py)
  end
end
local set2last = function(self)
  local parent = self.parent
  parent:RemoveChild(self.gobj)
  parent:AddChild(self.gobj)
end
local setsortingorder = function(self, val)
  if self.gobj then
    self.gobj.sortingOrder = val
  end
end
local new = function()
  local inst
  if #reuseables > 0 then
    inst = table.remove(reuseables)
  else
    inst = {
      init = init,
      delete = delete,
      setpos = setpos,
      setctrl = setctrl,
      setctrl_onchanged = setctrl_onchanged,
      setscale = setscale,
      setparent = setparent,
      setactive = setactive,
      updatepos = updatepos,
      setonclick = setonclick,
      setevtbtnclick = setevtbtnclick,
      setevtbtnctrl = setevtbtnctrl,
      setuserdata = setuserdata,
      marker = marker,
      set2last = set2last,
      setsortingorder = setsortingorder
    }
  end
  return inst
end
local CreateMapflag = function(parent, mapObj, position, pivot, pivotAsAnchor, scale)
  local x, y = AbyssExploreMinimapUtils.WorldPositionToMapRatio(position)
  local gobj = UIMgr:CreateObject("Abyss", "AllEvent")
  gobj.pivot = pivot or Vector2(0.5, 0.5)
  gobj.pivotAsAnchor = pivotAsAnchor and true or false
  scale = scale or Vector2(0.6666666666666666, 0.6666666666666666)
  gobj:SetScale(scale.x, scale.y)
  local inst = AbyssExploreMapflag.new()
  inst:init(gobj, parent, mapObj, x, y)
  return inst
end
local CreateMapflagWithEventInfo = function(eventInfo, parent, mapObj, pivot, pivotAsAnchor, scale)
  if eventInfo.noPosition then
    return
  end
  local type, subtype = eventInfo.type, eventInfo.subtype
  local ctrl_index = 0
  local noflag = false
  local x, y = eventInfo.x, eventInfo.y
  local location = eventInfo.location
  if location then
    x, y = location.x, location.y
  end
  if eventInfo.flagtype then
    ctrl_index = eventInfo.flagtype
    if subtype == AbyssExploreSubEventID.BATTLE then
      noflag = true
    elseif type == AbyssExploreEventID.BRANCH then
      if 0 == eventInfo.nextPlotNodeId then
        noflag = true
      end
    elseif type == AbyssExploreEventID.DAILY_RANDOM_NEWBIE or type == AbyssExploreEventID.DAILY_RANDOM then
      noflag = true
    end
  else
    noflag = true
  end
  if not noflag then
    local position = AbyssExploreMapCtrl.GridToWorld(x, y)
    if position then
      local flag = CreateMapflag(parent, mapObj, position, pivot, pivotAsAnchor, scale)
      flag:setctrl(ctrl_index)
      flag:setuserdata(eventInfo)
      return flag
    else
      printError("[ABYSS] Can not find Event Position When Create Mapflag", eventInfo.eventId, x, y, position)
    end
  end
end
return {
  new = new,
  CreateMapflag = CreateMapflag,
  CreateMapflagWithEventInfo = CreateMapflagWithEventInfo
}
