local eventsBuffer
local version = 0
local busy = false
local visible = true
local EventHandleItemRenderer = function(i, item)
  local child = item:GetChild("EventTips")
  child.alpha = 0
  if i < #eventsBuffer - 1 then
    LeanTween.delayedCall((i + 1) * 0.08, function()
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_explore_notif")
    end)
  end
  PlayUITrans(item, "in", nil, i * 0.03)
  local eventInfo = eventsBuffer[i + 1]
  local etype = eventInfo.type
  local esubtype = eventInfo.subtype
  local ctrlIndex = 3
  if etype == AbyssExploreEventID.POSITIVE then
    if esubtype == AbyssExploreSubEventID.BATTLE then
      ctrlIndex = 1
    elseif esubtype == AbyssExploreSubEventID.TREASURE then
      ctrlIndex = 0
    elseif esubtype == AbyssExploreSubEventID.INDICATE then
      ctrlIndex = 2
    end
  elseif etype == AbyssExploreEventID.DAILY_RANDOM or etype == AbyssExploreEventID.DAILY_RANDOM_NEWBIE then
    ctrlIndex = 3
  elseif etype == AbyssExploreEventID.BRANCH or etype == AbyssExploreEventID.BRANCH_ACTIVITY then
    ctrlIndex = 4
  elseif etype == AbyssExploreEventID.BUILDING or etype == AbyssExploreEventID.FROST_DUNGEON then
    ctrlIndex = 5
  elseif etype == AbyssExploreEventID.CHALLENGE_BOSS then
    ctrlIndex = 6
  elseif etype == AbyssExploreEventID.EXPEDITION_BUILDING or etype == AbyssExploreEventID.ROGUELIKE then
    ctrlIndex = 7
  elseif etype == AbyssExploreEventID.GUILD_WAR_ENTRANCE then
    ctrlIndex = 8
  end
  ChangeUIController(child, "c2", ctrlIndex)
  local eventId = eventInfo.eventId
  local config = TableData.GetConfig(eventId, "BaseManorEvent")
  local wordTxt = child:GetChild("WordTxt")
  if eventInfo.type == AbyssExploreEventID.BRANCH or eventInfo.type == AbyssExploreEventID.BRANCH_ACTIVITY then
    local nodeConf = TableData.GetConfig(eventInfo.nextPlotNodeId, "BaseManorNode")
    if type(nodeConf.name) == "function" then
      wordTxt.text = nodeConf.name()
    else
      wordTxt.text = "未配置" .. tostring(eventInfo.nextPlotNodeId)
    end
  elseif "function" == type(config.tips) then
    wordTxt.text = config.tips()
  else
    wordTxt.text = "未配置" .. tostring(eventId)
  end
  local eventSpend = child:GetChild("EventSpend")
  if eventInfo.cost and _G.next(eventInfo.cost) then
    if eventInfo.type == AbyssExploreEventID.BRANCH or eventInfo.type == AbyssExploreEventID.BRANCH_ACTIVITY then
      ChangeUIController(eventSpend, "c1", 1)
    else
      ChangeUIController(eventSpend, "c1", 0)
    end
    ChangeUIController(child, "c1", 0)
    local descText = eventSpend:GetChild("NumberTxt")
    local str
    for _, v in ipairs(eventInfo.cost) do
      local cost = string.format("[color=#e6ff51]-%s[/color]", v.value)
      if string.isEmptyOrNil(str) then
        str = cost
      else
        str = str .. cost
      end
    end
    descText.text = str
  else
    ChangeUIController(child, "c1", 1)
  end
  child.onClick:Set(function()
    if IsUITransPlaying(item, "out") then
      return
    end
    if AbyssExploreMgr.IsGesturable() and AbyssExploreMgr.EventIsHandleable(eventInfo) then
      if busy then
        return
      end
      busy = true
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_explore_click_ev")
      local complete = 0
      local list = item.parent
      local numChildren = list.numChildren
      local eff = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_storytalkunder_press.prefab")
      local holder = item:GetChild("EffectHolder")
      local duration = LuaUtil.GetParticleLength(eff)
      UIUtil.SetObjectToUI(eff, holder)
      LuaUtil.PlayEffect(eff)
      local delay = duration * 0.7
      AbyssExploreMgr.EnableGestureOp(false)
      for j = 1, numChildren do
        local childIndex = j - 1
        PlayUITrans(list:GetChildAt(childIndex), "out", function()
          complete = complete + 1
          if complete == numChildren then
            list:RemoveChildrenToPool()
            table.clear(eventsBuffer)
            AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.HANDLE_EVENT, eventInfo)
            busy = false
            AbyssExploreMgr.EnableGestureOp(true)
          end
        end, delay)
      end
    end
  end)
end
local PopupEventList = function(ui_root, events)
  eventsBuffer = eventsBuffer or {}
  local cnt = #eventsBuffer
  local diff = false
  if cnt == #events then
    for i = 1, cnt do
      local a = eventsBuffer[i]
      local flag = false
      for j = 1, cnt do
        local b = events[j]
        if a == b then
          flag = true
          break
        end
      end
      if not flag then
        diff = true
        break
      end
    end
  else
    diff = true
  end
  if diff then
    version = version + 1
    table.clear(eventsBuffer)
    for _, v in pairs(events) do
      table.insert(eventsBuffer, v)
    end
  else
    return
  end
  local list = ui_root:GetChild("EventTipsList")
  list.opaque = false
  list.defaultItem = "ui://rs1gte22k8ix2o"
  list.itemRenderer = EventHandleItemRenderer
  local numItems = #eventsBuffer
  if numItems > 0 then
    ui_root.visible = visible
    list.numItems = numItems
    if visible then
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_explore_notif")
    end
  else
    local numChildren = list.numItems
    if numChildren > 0 then
      local upvalue = version
      local count = 0
      for i = 0, numChildren - 1 do
        local child = list:GetChildAt(i)
        PlayUITrans(child, "out", function()
          if upvalue ~= version then
            return
          end
          count = count + 1
          if count == numChildren then
            ui_root.visible = false
            list:RemoveChildrenToPool()
          end
        end, i * 0.03)
      end
    else
      ui_root.visible = false
      list:RemoveChildrenToPool()
    end
  end
end
local ClearEventTips = function(ui_root, playanim, callback, clearBuffer)
  local list = ui_root:GetChild("EventTipsList")
  local cnt = list.numItems
  if cnt > 0 then
    local hasCallback = type(callback) == "function"
    if playanim then
      local transName = "out"
      local progress = 0
      local upvalue = version
      for i = 1, cnt do
        local child = list:GetChildAt(i - 1)
        PlayUITrans(child, transName, function()
          if version ~= upvalue then
            return
          end
          progress = progress + 1
          if progress == cnt then
            ui_root.visible = false
            list:RemoveChildrenToPool()
            if hasCallback then
              callback()
            end
          end
        end)
      end
    else
      ui_root.visible = false
      list:RemoveChildrenToPool()
      if hasCallback then
        callback()
      end
    end
  end
  if clearBuffer then
    table.clear(eventsBuffer)
  end
end
local ImmediateComplete = function(ui_root)
  local list = ui_root:GetChild("EventTipsList")
  local numChildren = list.numChildren
  for j = 1, numChildren do
    local childIndex = j - 1
    local child = list:GetChildAt(childIndex)
    if IsUITransPlaying(child, "out") then
      PlayUITransToComplete(child, "out")
    end
  end
end
local SetBusy = function(val)
  busy = val
end
local SetVisible = function(val)
  visible = val
end
local Reset = function(ui_root)
  eventsBuffer = eventsBuffer or {}
  table.clear(eventsBuffer)
  busy = false
  visible = true
  version = 0
  if ui_root then
    local list = ui_root:GetChild("EventTipsList")
    list.opaque = false
  end
end
return {
  Reset = Reset,
  SetBusy = SetBusy,
  SetVisible = SetVisible,
  PopupEventList = PopupEventList,
  ClearEventTips = ClearEventTips,
  ImmediateComplete = ImmediateComplete
}
