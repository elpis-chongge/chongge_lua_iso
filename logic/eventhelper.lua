require("Handler")
local csEventDis = CS.EventDispatcher.Singleton
local EventHelper = {}
local eventTable = GetNewHandler()
local onceEventTable = GetNewHandler()

function EventHelper.innerAddListener(eventid, func, tableobj, once)
  if once then
    csEventDis:AddLuaListenerOnce(eventid)
    onceEventTable:AddHandle(eventid, func, tableobj)
  else
    csEventDis:AddLuaListener(eventid)
    eventTable:AddHandle(eventid, func, tableobj)
  end
end

function EventHelper.AddListener(eventid, func, object)
  if type(eventid) == "number" then
    EventHelper.innerAddListener(eventid, func, object, false)
  else
    printError("err", type(eventid))
  end
end

function EventHelper.AddOnceListener(eventid, func, object)
  if type(eventid) == "number" then
    EventHelper.innerAddListener(eventid, func, object, true)
  else
    printError("err", type(eventid))
  end
end

function EventHelper.Dispatch(eventid, parameter)
  csEventDis:DispatchEvent(eventid, parameter)
end

function EventHelper.CSCallLuaDispatch(eventid, parameter)
  eventTable:RunId(eventid, parameter)
  onceEventTable:RunId(eventid, parameter)
  onceEventTable:RemoveAllHandle(eventid)
  EventHelper.removeFromCS(eventid)
end

function EventHelper.removeFromCS(eventid)
  local count1 = eventTable:GetHandleCount(eventid)
  local count2 = onceEventTable:GetHandleCount(eventid)
  if 0 == count1 and 0 == count2 then
    csEventDis:RemoveLuaListener(eventid, 2)
  elseif 0 == count1 then
    csEventDis:RemoveLuaListener(eventid, 0)
  elseif 0 == count2 then
    csEventDis:RemoveLuaListener(eventid, 1)
  end
end

function EventHelper.innerRemoveListener(eventid, func, once)
  if once then
    onceEventTable:RemoveHandle(eventid, func)
  else
    eventTable:RemoveHandle(eventid, func)
  end
  EventHelper.removeFromCS(eventid)
end

function EventHelper.RemoveListener(eventid, func)
  EventHelper.innerRemoveListener(eventid, func, false)
end

function EventHelper.RemoveOnceListener(eventid, func)
  EventHelper.innerRemoveListener(eventid, func, true)
end

return EventHelper
