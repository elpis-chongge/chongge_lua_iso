local branchEvents, completedBranchEvents, allEvents, activities, focusevents, manorInfo, featureSchedules, plotValueRecoverTimestamp, actionValueRecoverTimestamp
local InsertBranchEvent = function(eventInfo)
  if not table.keyof(branchEvents, eventInfo.eventId, "eventId") then
    table.insert(branchEvents, eventInfo)
  end
end
local InsertCompletedBranchEvent = function(eventInfo)
  table.insert(completedBranchEvents, eventInfo)
end
local DeleteBranchEvent = function(eventInfo)
  local n = branchEvents and #branchEvents or 0
  for i = n, 1, -1 do
    if branchEvents[i].eventId == eventInfo.eventId then
      table.remove(branchEvents, i)
    end
  end
end
local walk = function(events, callback)
  if events and callback then
    for i, v in ipairs(events) do
      callback(i, v)
    end
  end
end
local GetCompletedBranchEvents = function()
  return completedBranchEvents
end
local GetProcessingBranchEvents = function()
  return branchEvents
end
local SetPlotValueRecoverTimestamp = function(timestamp)
  plotValueRecoverTimestamp = timestamp
end
local GetPlotValueRecoverTimestamp = function()
  return plotValueRecoverTimestamp
end
local SetActionValueRecoverTimestamp = function(timestamp)
  actionValueRecoverTimestamp = timestamp
end
local GetActionValueRecoverTimestamp = function()
  return actionValueRecoverTimestamp
end
local SetManorInfo = function(info)
  local prev = manorInfo
  manorInfo = info
  AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.UPDATE_PLAYER_INFO, prev, info)
end
local GetManorInfo = function()
  return manorInfo
end
local SetFeatureSchedules = function(schedules)
  featureSchedules = schedules
end
local GetFeatureSchedules = function()
  return featureSchedules
end
local AddOrOverride = function(eventInfo)
  allEvents = allEvents or {}
  allEvents[eventInfo.eventId] = eventInfo
end
local GetAllEvents = function()
  return allEvents
end
local AddFocus = function(eventInfo)
  local cnt = 0
  for i, v in ipairs(focusevents) do
    cnt = cnt + 1
    if v.eventId == eventInfo.eventId then
      return
    end
  end
  if cnt >= 3 then
    return false
  end
  table.insert(focusevents, eventInfo)
  return true
end
local RemoveFocus = function(eventId)
  for i, v in ipairs(focusevents) do
    if v.eventId == eventId then
      table.remove(focusevents, i)
      return true
    end
  end
  return false
end
local GetFocusEvents = function()
  return focusevents
end
local RefreshActivity = function(activity)
  if activity then
    activities[activity.activityId] = activity
  end
end
local RefreshActivities = function(activityList)
  if activityList and _G.next(activityList) then
    for i, v in pairs(activityList) do
      RefreshActivity(v)
    end
  end
end
local GetActivities = function()
  local arr = {}
  for i, v in pairs(activities) do
    table.insert(arr, v)
  end
  return arr
end
local GetEvents = function(filter, buffer, ...)
  if allEvents and _G.next(allEvents) then
    local list = buffer or {}
    for i, v in pairs(allEvents) do
      if not filter or filter(v, ...) then
        table.insert(list, v)
      end
    end
    return list
  end
end
local EventFilter_EventType = function(event, e_type)
  return event.type == e_type
end
local GetEventsByType = function(e_type, buffer)
  return GetEvents(EventFilter_EventType, buffer, e_type)
end
local Init = function()
  branchEvents = {}
  completedBranchEvents = {}
  activities = {}
  allEvents = {}
  focusevents = {}
end
return {
  Init = Init,
  SetPlotValueRecoverTimestamp = SetPlotValueRecoverTimestamp,
  GetPlotValueRecoverTimestamp = GetPlotValueRecoverTimestamp,
  SetActionValueRecoverTimestamp = SetActionValueRecoverTimestamp,
  GetActionValueRecoverTimestamp = GetActionValueRecoverTimestamp,
  SetManorInfo = SetManorInfo,
  GetManorInfo = GetManorInfo,
  SetFeatureSchedules = SetFeatureSchedules,
  GetFeatureSchedules = GetFeatureSchedules,
  InsertBranchEvent = InsertBranchEvent,
  DeleteBranchEvent = DeleteBranchEvent,
  InsertCompletedBranchEvent = InsertCompletedBranchEvent,
  GetCompletedBranchEvents = GetCompletedBranchEvents,
  GetProcessingBranchEvents = GetProcessingBranchEvents,
  RefreshActivity = RefreshActivity,
  RefreshActivities = RefreshActivities,
  GetActivities = GetActivities,
  AddOrOverride = AddOrOverride,
  GetAllEvents = GetAllEvents,
  AddFocus = AddFocus,
  RemoveFocus = RemoveFocus,
  GetFocusEvents = GetFocusEvents,
  GetEvents = GetEvents,
  GetEventsByType = GetEventsByType
}
