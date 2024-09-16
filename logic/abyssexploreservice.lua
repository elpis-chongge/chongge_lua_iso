local eventsBuffer
local clear = function(arr)
  local count = #arr
  for i = 1, count do
    table.remove(arr)
  end
end
local setPlotNodeInfo = function(eventInfo)
  local step, numNodes = 0, 0
  local plotNodeId = eventInfo.plotNodeId
  local nextPlotNodeId = eventInfo.nextPlotNodeId
  if 0 == plotNodeId and 0 == nextPlotNodeId and eventInfo.type == AbyssExploreEventID.BRANCH then
    local tbl = TableData.GetTable("BaseManorNode")
    for _, v in pairs(tbl) do
      if v.group_id == tonumber(eventInfo.param) and not v.pre and v.next then
        nextPlotNodeId = v.id
        break
      end
    end
  end
  if plotNodeId > 0 then
    while plotNodeId do
      local nodeData = TableData.GetConfig(plotNodeId, "BaseManorNode")
      if nodeData then
        numNodes = numNodes + 1
        plotNodeId = nodeData.pre and nodeData.pre[1] or nil
        if not nodeData.pre and nodeData.next then
          eventInfo.startNodeId = nodeData.id
        elseif nodeData.pre and not nodeData.next then
          eventInfo.endNodeId = nodeData.id
        end
      end
    end
  end
  step = numNodes
  if nextPlotNodeId > 0 then
    while nextPlotNodeId do
      local nodeData = TableData.GetConfig(nextPlotNodeId, "BaseManorNode")
      if nodeData then
        numNodes = numNodes + 1
        nextPlotNodeId = nodeData.next and nodeData.next[1] or nil
        if not nodeData.pre and nodeData.next then
          eventInfo.startNodeId = nodeData.id
        elseif nodeData.pre and not nodeData.next then
          eventInfo.endNodeId = nodeData.id
        end
      end
    end
  end
  eventInfo.step = step
  eventInfo.numNodes = numNodes
end
local parseStoryRecords = function(startId, endId, options, finished)
  local storyRecords
  local curId = startId
  local optionIndex = 1
  while type(curId) == "number" do
    local conf = TableData.GetConfig(curId, "BaseStorySimple")
    if not conf then
      break
    end
    storyRecords = storyRecords or {}
    table.insert(storyRecords, curId)
    if not (curId ~= endId or finished and (conf.next or conf.option_next)) then
      break
    end
    if conf.type == AbyssExploreStoryItemType.OPTION then
      local cnt = options and #options or 0
      if optionIndex > cnt then
        options = options or {}
        if not conf.option_next then
          break
        end
        table.insert(options, tonumber(conf.option_next[1]))
      end
      curId = options[optionIndex]
      optionIndex = optionIndex + 1
    else
      curId = conf.next
    end
  end
  return storyRecords, options
end
local setStoryRecords = function(eventInfo, msg)
  if msg then
    local nodeProgress = msg.progress
    if nodeProgress and _G.next(nodeProgress) then
      local nodeStoryRecords = {}
      for i, v in ipairs(nodeProgress) do
        local nodeId, endId, options = v.nodeId, v.lastStory, v.stories
        local conf = TableData.GetConfig(nodeId, "BaseManorNode")
        local finished = eventInfo.finishTimestamp > 0 or nodeId < eventInfo.nextPlotNodeId
        local storyRecords, optionRecords = parseStoryRecords(tonumber(conf.parameter), endId, options, finished)
        table.insert(nodeStoryRecords, {
          nodeId = nodeId,
          storyRecords = storyRecords,
          optionRecords = optionRecords
        })
      end
      eventInfo.nodeStoryRecords = nodeStoryRecords
    end
    local storyProgress = msg.storyProgress
    if storyProgress and _G.next(storyProgress) then
      local param = tonumber(eventInfo.param)
      if eventInfo.type == AbyssExploreEventID.BRANCH or eventInfo.type == AbyssExploreEventID.BRANCH_ACTIVITY then
        local nodeId = eventInfo.startNodeId
        local conf = TableData.GetConfig(nodeId, "BaseManorNode")
        for _ = 1, eventInfo.step do
          nodeId = conf.next[1]
          conf = TableData.GetConfig(nodeId, "BaseManorNode")
        end
        param = tonumber(conf.parameter)
      end
      eventInfo.storyRecords = parseStoryRecords(param, storyProgress.lastStory, storyProgress.stories)
      eventInfo.optionRecords = storyProgress.stories
    else
      eventInfo.storyRecords = {}
    end
  end
end
local convertToClient = function(msg_event, eventConf)
  local param = string.isEmptyOrNil(msg_event.parameter) and eventConf.parameter or msg_event.parameter
  local eventInfo = {
    type = eventConf.type,
    subtype = eventConf.sub_type,
    eventId = msg_event.eventId,
    mapId = msg_event.mapId,
    gridId = msg_event.gridId,
    cost = msg_event.cost,
    cardId = eventConf.card_id,
    plotNodeId = msg_event.plotNodeId,
    nextPlotNodeId = msg_event.nextPlotNodeId,
    resetTimestamp = msg_event.resetStamp,
    finishTimestamp = msg_event.finishStamp,
    refreshTimestamp = msg_event.nextResetStamp,
    deadlineTimestamp = not eventConf.open_time_type and eventConf.end_time,
    param = param,
    passable = not eventConf.resist or 1 ~= eventConf.resist,
    noPosition = false,
    precondition = eventConf.open_pre,
    suspend = msg_event.suspend,
    icon = eventConf.icon,
    sort = eventConf.sort
  }
  local costTbl
  if eventInfo.nextPlotNodeId > 0 then
    local nodeConf = TableData.GetConfig(eventInfo.nextPlotNodeId, "BaseManorNode")
    if nodeConf then
      costTbl = nodeConf.cost
    end
  else
    costTbl = eventConf.cost
  end
  if costTbl and _G.next(costTbl) then
    eventInfo.cost = {}
    for _, v in ipairs(costTbl) do
      local splits = Split(v, ":")
      local cost_id = tonumber(splits[2])
      local cost_val = tonumber(splits[3])
      table.insert(eventInfo.cost, {id = cost_id, value = cost_val})
    end
  end
  if msg_event.options and _G.next(msg_event.options) then
    eventInfo.storyOptions = {}
    for _, v in ipairs(msg_event.options) do
      eventInfo.storyOptions[v.storyId] = v.optionIndexes
    end
  end
  setPlotNodeInfo(eventInfo)
  setStoryRecords(eventInfo, msg_event)
  return eventInfo
end
local ParseRemoteEvent = function(msg_event, buffer)
  local eventConf = TableData.GetConfig(msg_event.eventId, "BaseManorEvent")
  if not eventConf then
    print(string.format("[ABYSS]\230\156\170\229\156\168BaseManorEvent\228\184\173\230\137\190\229\136\176EventId:%s\232\175\183\232\129\148\231\179\187\231\173\150\229\136\146\239\188\129\239\188\129\239\188\129", tostring(msg_event.eventId)))
    return
  end
  local coordinates, show_site, location
  local gridConf = TableData.GetConfig(msg_event.gridId, "BaseManorGrid")
  if gridConf and 1 == gridConf.type then
    coordinates = gridConf.coordinate
  else
    coordinates = Split(msg_event.coordinate, "|")
  end
  if gridConf and gridConf.show_site then
    show_site = gridConf.show_site
    local splits = Split(show_site, ":")
    location = CS.UnityEngine.Vector2Int(Mathf.FloorToInt(tonumber(splits[1])), Mathf.FloorToInt(tonumber(splits[2])))
  end
  local flagtype = eventConf.map_icon_type
  local eventInfo = convertToClient(msg_event, eventConf)
  if eventInfo.type == AbyssExploreEventID.BRANCH_ACTIVITY and (not coordinates or not _G.next(coordinates)) then
    coordinates = {
      AbyssExploreData.GetManorInfo().coordinate
    }
  end
  if coordinates and _G.next(coordinates) then
    local positions = {}
    for i, coordinate in pairs(coordinates) do
      local coord_str = coordinate
      local splits = Split(coord_str, ":")
      local gridX, gridY = tonumber(splits[1]), tonumber(splits[2])
      local x, y = Mathf.FloorToInt(gridX), Mathf.FloorToInt(gridY)
      table.insert(positions, CS.UnityEngine.Vector2Int(x, y))
      eventInfo.x = x
      eventInfo.y = y
    end
    local nextPlotNodeId = msg_event.nextPlotNodeId
    if eventInfo.type == AbyssExploreEventID.BRANCH_ACTIVITY and eventInfo.finishTimestamp > 0 then
      nextPlotNodeId = eventInfo.endNodeId
      eventInfo.nextPlotNodeId = eventInfo.endNodeId
    end
    local path = eventConf.spd
    if nextPlotNodeId > 0 then
      local nodeConf = TableData.GetConfig(nextPlotNodeId, "BaseManorNode")
      if nodeConf.spd then
        path = nodeConf.spd
      end
      eventInfo.passable = not nodeConf.resist or 1 ~= nodeConf.resist
      flagtype = nodeConf.map_icon_type
    end
    if eventInfo.type == AbyssExploreEventID.POSITIVE and eventInfo.subtype == AbyssExploreSubEventID.BATTLE then
      local stageConf = TableData.GetConfig(tonumber(eventInfo.param), "BaseStage")
      if stageConf and stageConf.monster_group_list and _G.next(stageConf.monster_group_list) then
        local mg_id = stageConf.monster_group_list[1]
        local mgConf = TableData.GetConfig(mg_id, "BaseMonsterGroup")
        if mgConf and mgConf.event_show then
          local fashionConf = TableData.GetConfig(mgConf.event_show, "BaseFashion")
          if fashionConf then
            path = ModelUtil.GetFullPath(fashionConf.spd)
            eventInfo.scale = fashionConf.manor_scale / 10000
          end
        end
      end
    end
    if show_site then
      eventInfo.location = location
    end
    eventInfo.assetpath = path
    eventInfo.positions = positions
    eventInfo.flagtype = flagtype
    eventInfo.direct = type(eventConf.direct_trigger) == "number" and 1 == eventConf.direct_trigger
  else
    eventInfo.noPosition = true
  end
  if buffer then
    table.insert(buffer, eventInfo)
  end
  return eventInfo
end
local Exists = function()
  return AbyssExploreMgr and AbyssExploreMgr.Exists()
end
local EVENT_RSP_ENUM = {
  TRIGGER = 1,
  PROCESS = 2,
  NOTIFY = 3
}
local HandleEvents = function(events, rsp_enum)
  if not AbyssExploreMgr or not AbyssExploreMgr.Exists() then
    return
  end
  for _, event in pairs(events) do
    AbyssExploreData.AddOrOverride(event)
    if event.finishTimestamp > 0 then
      AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.EVENT_COMPLETE, event)
    elseif event.nextPlotNodeId > 0 then
      AbyssExploreMapCtrl.DeleteEvent(event.eventId)
    elseif event.suspend then
      AbyssExploreMapCtrl.DeleteEvent(event.eventId)
    end
    if event.noPosition then
      AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.HANDLE_EVENT_NO_POS, event)
    else
      if rsp_enum == EVENT_RSP_ENUM.TRIGGER then
      end
      AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.EVENT_UPDATE, event)
    end
  end
end
local rewardsBuffer
local HandleRewards = function(rewards)
  if rewards and #rewards > 0 then
    local all_r_illustration = true
    rewardsBuffer = rewardsBuffer or {}
    clear(rewardsBuffer)
    for _, v in pairs(rewards) do
      local item = v.item or v
      print(string.format("[ABYSS]\232\142\183\229\190\151 ItemTuple:%s,itemId:%s,\230\149\176\233\135\143:%s", tostring(item.tupleType), tostring(item.itemId), tostring(item.count)))
      if item.tupleType == ProtoEnum.TUPLE_TYPE.BGM or item.tupleType == ProtoEnum.TUPLE_TYPE.STORY_MONSTER then
        AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.ILLUSTRATION_GET, item.tupleType, item.itemId)
      else
        all_r_illustration = false
        table.insert(rewardsBuffer, v)
      end
    end
    if not all_r_illustration then
      AbyssExploreMgr.SetActive(false)
      UIMgr:HideWindow(WinResConfig.AbyssWindow.name)
      GetItemTips.Show(rewardsBuffer)
    end
  end
end
local ManorInfoReq = function(mapIdInTbl, rspCallback)
  Net.Send(Proto.MsgName.GetManorInfoReq, {mapId = mapIdInTbl}, rspCallback, function()
    UIUtil.ChangeBattleScreenEffectOut(function()
    end)
  end)
end
local ManorInfoRsp = function(msg)
  local events = msg.allEvents
  local manorInfo = msg.manorInfo
  local plotValueRecoverStamp = msg.plotValueRecoverStamp
  local actionValueRecoverStamp = msg.actionValueRecoverStamp
  local featureSchedules = msg.featureSchedules
  AbyssExploreData.Init()
  AbyssExploreData.SetManorInfo(manorInfo)
  AbyssExploreData.SetFeatureSchedules(featureSchedules)
  AbyssExploreData.SetPlotValueRecoverTimestamp(plotValueRecoverStamp)
  AbyssExploreData.SetActionValueRecoverTimestamp(actionValueRecoverStamp)
  clear(eventsBuffer)
  for _, evt in pairs(events) do
    ParseRemoteEvent(evt, eventsBuffer)
  end
  table.sort(eventsBuffer, function(x, y)
    local v1, v2 = x.type, y.type
    if x.type == AbyssExploreEventID.DAILY_RANDOM then
      v1 = v1 * 300
    end
    if y.type == AbyssExploreEventID.DAILY_RANDOM then
      v2 = v2 * 300
    end
    return v1 < v2
  end)
  for _, evt in pairs(eventsBuffer) do
    AbyssExploreData.AddOrOverride(evt)
  end
  print(string.format("[ABYSS]\229\156\176\229\155\190ID:%s,\230\137\128\229\156\168\230\160\188\229\173\144:%s,\229\157\144\230\160\135:%s,\232\161\140\229\138\168\231\130\185\229\155\158\229\164\141\230\151\182\233\151\180\230\136\179:%s,\229\137\167\230\131\133\231\130\185\229\155\158\229\164\141\230\151\182\233\151\180\230\136\179:%s,\229\189\147\229\137\141\230\156\141\229\138\161\229\153\168\230\151\182\233\151\180:%s", tostring(manorInfo.mapId), tostring(manorInfo.gridId), tostring(manorInfo.coordinate), tostring(plotValueRecoverStamp), tostring(actionValueRecoverStamp), tostring(LoginData.GetCurServerTime())))
end
local TriggerEventReq = function(gridTblId, coordinate, eventId, mapSubId, nodeCoordinate, rspCallback)
  Net.Send(Proto.MsgName.ManorTriggerEventReq, {
    gridId = gridTblId,
    coordinate = coordinate,
    eventId = eventId,
    mapSubId = mapSubId,
    nodeCoordinate = nodeCoordinate or ""
  }, rspCallback)
end
local TriggerEventRsp = function(msg)
  if not Exists() then
    return
  end
  local evt = msg.event
  AbyssExploreData.SetPlotValueRecoverTimestamp(msg.plotValueRecoverStamp)
  AbyssExploreData.SetActionValueRecoverTimestamp(msg.actionValueRecoverStamp)
  if evt then
    clear(eventsBuffer)
    ParseRemoteEvent(evt, eventsBuffer)
    HandleEvents(eventsBuffer, EVENT_RSP_ENUM.TRIGGER)
  end
end
local report_position_msg = {}
local ReportPositionReq = function(mapId, coordinate)
  report_position_msg.mapId = mapId
  report_position_msg.coordinate = coordinate
  Net.Send(Proto.MsgName.ManorReportPositionReq, report_position_msg)
end
local ReportPositionRsp = function(msg)
end
local process_event_msg = {}
local ProcessEventReq = function(eventId, nodeId, nextNodeId, progress, mapSubId, nodeCoordinate)
  process_event_msg.eventId = eventId
  process_event_msg.nodeId = nodeId or 0
  process_event_msg.nextNodeId = nextNodeId or 0
  process_event_msg.progress = progress
  process_event_msg.mapSubId = mapSubId
  process_event_msg.nodeCoordinate = nodeCoordinate or ""
  Net.Send(Proto.MsgName.ManorProcessEventReq, process_event_msg)
  print("[ABYSS]Process Event ", eventId, nodeId, nextNodeId)
end
local ProcessEventRsp = function(msg)
  if not Exists() then
    return
  end
  AbyssExploreData.SetPlotValueRecoverTimestamp(msg.plotValueRecoverStamp)
  AbyssExploreData.SetActionValueRecoverTimestamp(msg.actionValueRecoverStamp)
  HandleRewards(msg.rewards)
  local event = msg.event
  if event then
    local complete = false
    if event.finishStamp > 0 then
      complete = true
    elseif event.nextPlotNodeId > 0 then
      complete = true
    end
    if complete then
      local finish = TimeUtil.FormatDate("%Y-%m-%d %H-%M-%S", event.finishStamp)
      local reset = TimeUtil.FormatDate("%Y-%m-%d %H-%M-%S", event.resetStamp)
      print(string.format("[ABYSS]\228\186\139\228\187\182:%s\229\174\140\230\136\144\230\151\182\233\151\180:%s,\233\135\141\231\189\174\230\151\182\233\151\180:%s", tostring(event.eventId), tostring(finish), tostring(reset)))
    end
    clear(eventsBuffer)
    ParseRemoteEvent(event, eventsBuffer)
    HandleEvents(eventsBuffer, EVENT_RSP_ENUM.PROCESS)
  end
end
local process_event_pos_msg = {}
local ReportEventPositionReq = function(eventId, coordinate, rspCallback)
  process_event_pos_msg.eventId = eventId
  process_event_pos_msg.coordinate = coordinate
  Net.Send(Proto.MsgName.ManorReportEventPositionReq, process_event_pos_msg, rspCallback)
end
local ReportEventPositionRsp = function()
end
local story_finish_msg = {
  storyProgress = {}
}
local StoryFinishReq = function(eventInfo, storyId, rspCallback)
  local storyRecords = eventInfo.storyRecords
  local cnt = storyRecords and #storyRecords or 0
  if cnt > 0 then
    local prev = storyRecords[cnt]
    local conf = TableData.GetConfig(prev, "BaseStorySimple")
    if conf.type == AbyssExploreStoryItemType.OPTION then
      local flag = false
      for i, v in ipairs(conf.option_next) do
        if tonumber(v) == storyId then
          flag = true
          break
        end
      end
      if flag then
        if not eventInfo.optionRecords then
          eventInfo.optionRecords = {}
        end
        local optionRecords = eventInfo.optionRecords
        table.insert(optionRecords, storyId)
      end
    end
  end
  local eventId = eventInfo.eventId
  story_finish_msg.eventId = eventId
  story_finish_msg.storyId = storyId
  story_finish_msg.storyProgress.lastStory = storyId
  story_finish_msg.storyProgress.stories = eventInfo.optionRecords
  Net.Send(Proto.MsgName.ManorFinishStoryReq, story_finish_msg, rspCallback)
end
local StoryFinishRsp = function(msg)
  if not Exists() then
    return
  end
  local events = AbyssExploreData.GetAllEvents()
  local event = events[msg.eventId]
  if event then
    local storyId = msg.storyId
    if storyId then
      if not event.storyRecords then
        event.storyRecords = {}
      end
      local storyRecords = event.storyRecords
      table.insert(storyRecords, storyId)
      if msg.optionIndexes and _G.next(msg.optionIndexes) then
        if not event.storyOptions then
          event.storyOptions = {}
        end
        event.storyOptions[storyId] = msg.optionIndexes
      end
    end
  end
end
local story_skip_msg = {}
local StorySkipReq = function(eventId, rspCallback)
  story_skip_msg.eventId = eventId
  Net.Send(Proto.MsgName.ManorJumpStoryEventReq, story_skip_msg, rspCallback)
end
local StorySkipRsp = function(msg)
  if not Exists() then
    return
  end
  clear(eventsBuffer)
  HandleRewards(msg.rewards)
  ParseRemoteEvent(msg.event, eventsBuffer)
  HandleEvents(eventsBuffer)
end
local noRspToCallback
local shoplist_msg = {
  types = {3, 4}
}
local jumpToShop
local ShopInfoReq = function(noRsp, rspCallback, jump)
  Net.Send(Proto.MsgName.GetShopInfoReq, shoplist_msg, rspCallback)
  noRspToCallback = noRsp
  jumpToShop = jump
end
local ShopInfoRsp = function(msg)
  if not Exists() then
    return
  end
  if noRspToCallback then
    return
  end
  local shopList = msg.shopList
  local flag = false
  if shopList then
    for _, v in pairs(shopList) do
      if 3 == v.typeId or 4 == v.typeId then
        flag = true
      end
    end
  end
  if flag then
    if jumpToShop then
      JumpToWindow(WinResConfig.AbyssShopWindow.name)
    else
      OpenWindow(WinResConfig.AbyssShopWindow.name)
    end
  end
end
local BuyShopGridsRsp = function(msg)
  if not Exists() then
    return
  end
  local shop = msg.shop
  if shop and (3 == shop.typeId or 4 == shop.typeId) then
    UIMgr:SendWindowMessage(WinResConfig.AbyssShopWindow.name, WindowMsgEnum.AbyssShopWindow.REFRESH_SHOP)
  end
end
local EventUpdateNotify = function(msg)
  if not Exists() then
    return
  end
  print(string.format("[ABYSS]Event Update evt nums:%s", tostring(msg.events and #msg.events or -1)))
  if msg and msg.events then
    clear(eventsBuffer)
    for i, evt in pairs(msg.events) do
      local finish = TimeUtil.FormatDate("%Y-%m-%d %H-%M-%S", evt.finishStamp)
      local reset = TimeUtil.FormatDate("%Y-%m-%d %H-%M-%S", evt.resetStamp)
      ParseRemoteEvent(evt, eventsBuffer)
      print(string.format("[ABYSS]Update Event %s \229\174\140\230\136\144\230\151\182\233\151\180:%s,\233\135\141\231\189\174\230\151\182\233\151\180%s", tostring(evt.eventId), tostring(finish), tostring(reset)))
    end
    HandleEvents(eventsBuffer, EVENT_RSP_ENUM.NOTIFY)
  end
  if msg and msg.deleteEventIds then
    for _, eventId in ipairs(msg.deleteEventIds) do
      AbyssExploreMapCtrl.DeleteEvent(eventId)
    end
  end
end
local ManorInfoUpdateNotify = function(msg)
  if not Exists() then
    return
  end
  if msg and msg.manorInfo then
    AbyssExploreData.SetManorInfo(msg.manorInfo)
  end
end
local ConveyNotify = function(msg)
  local coordinate = msg.coordinate
  AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.CHA_CONVEY, coordinate)
end
local OpActivityByIdReq = function(...)
  Net.Send(Proto.MsgName.GetOpActivityByIdReq, {
    activityIds = {
      ...
    }
  })
end
local OpActivityByIdRsp = function(msg)
  if not Exists() then
    return
  end
  if msg.infos and _G.next(msg.infos) then
    AbyssExploreData.RefreshActivities(msg.infos)
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.ACTIVITY_REFRESH)
  end
end
local sellitem_msg = {}
local SellItemsReq = function(itemUid2Cnt)
  sellitem_msg.itemUid2Count = itemUid2Cnt
  Net.Send(Proto.MsgName.BatchUseItemsReq, sellitem_msg)
end
local SellItemsRsp = function(msg)
  if not Exists() then
    return
  end
  UIMgr:SendWindowMessage(WinResConfig.AbyssShopWindow.name, WindowMsgEnum.AbyssShopWindow.ITEMS_SOLD)
end
local FeatureScheduleReq = function(rspCallback)
  Net.Send(Proto.MsgName.GetManorFeatureScheduleReq, nil, rspCallback)
end
local FeatureScheduleRsp = function(msg)
  if not Exists() then
    return
  end
  AbyssExploreData.SetFeatureSchedules(msg.featureSchedules)
end
local GetAbyssNoviceBonusReq = function(rspCallback)
  Net.Send(Proto.MsgName.ManorFetchRookieRewardReq, nil, rspCallback)
end
local GetAbyssNoviceBonusRsp = function(msg)
  AbyssExploreData.SetManorInfo(msg.manorInfo)
  GetItemTips.Show(msg.rewards)
end
local Release = function()
  Net.RemoveListener(Proto.MsgName.GetManorInfoRsp, ManorInfoRsp)
  Net.RemoveListener(Proto.MsgName.ManorTriggerEventRsp, TriggerEventRsp)
  Net.RemoveListener(Proto.MsgName.ManorProcessEventRsp, ProcessEventRsp)
  Net.RemoveListener(Proto.MsgName.ManorReportPositionRsp, ReportPositionRsp)
  Net.RemoveListener(Proto.MsgName.ManorEventUpdateNotify, EventUpdateNotify)
  Net.RemoveListener(Proto.MsgName.ManorConveyNotify, ConveyNotify)
  Net.RemoveListener(Proto.MsgName.ManorFinishStoryRsp, StoryFinishRsp)
  Net.RemoveListener(Proto.MsgName.ManorJumpStoryEventRsp, StorySkipRsp)
  Net.RemoveListener(Proto.MsgName.ManorReportEventPositionRsp, ReportEventPositionRsp)
  Net.RemoveListener(Proto.MsgName.ManorInfoUpdateNotify, ManorInfoUpdateNotify)
  Net.RemoveListener(Proto.MsgName.GetShopInfoRsp, ShopInfoRsp)
  Net.RemoveListener(Proto.MsgName.BuyShopGoodsRsp, BuyShopGridsRsp)
  Net.RemoveListener(Proto.MsgName.GetOpActivityByIdRsp, OpActivityByIdRsp)
  Net.RemoveListener(Proto.MsgName.BatchUseItemsRsp, SellItemsRsp)
  Net.RemoveListener(Proto.MsgName.GetManorFeatureScheduleRsp, FeatureScheduleRsp)
  Net.RemoveListener(Proto.MsgName.ManorFetchRookieRewardRsp, GetAbyssNoviceBonusRsp)
end
local Init = function()
  Release()
  eventsBuffer = {}
  Net.AddListener(Proto.MsgName.GetManorInfoRsp, ManorInfoRsp)
  Net.AddListener(Proto.MsgName.ManorTriggerEventRsp, TriggerEventRsp)
  Net.AddListener(Proto.MsgName.ManorProcessEventRsp, ProcessEventRsp)
  Net.AddListener(Proto.MsgName.ManorReportPositionRsp, ReportPositionRsp)
  Net.AddListener(Proto.MsgName.ManorEventUpdateNotify, EventUpdateNotify)
  Net.AddListener(Proto.MsgName.ManorConveyNotify, ConveyNotify)
  Net.AddListener(Proto.MsgName.ManorFinishStoryRsp, StoryFinishRsp)
  Net.AddListener(Proto.MsgName.ManorJumpStoryEventRsp, StorySkipRsp)
  Net.AddListener(Proto.MsgName.ManorReportEventPositionRsp, ReportEventPositionRsp)
  Net.AddListener(Proto.MsgName.ManorInfoUpdateNotify, ManorInfoUpdateNotify)
  Net.AddListener(Proto.MsgName.GetShopInfoRsp, ShopInfoRsp)
  Net.AddListener(Proto.MsgName.BuyShopGoodsRsp, BuyShopGridsRsp)
  Net.AddListener(Proto.MsgName.GetOpActivityByIdRsp, OpActivityByIdRsp)
  Net.AddListener(Proto.MsgName.BatchUseItemsRsp, SellItemsRsp)
  Net.AddListener(Proto.MsgName.GetManorFeatureScheduleRsp, FeatureScheduleRsp)
  Net.AddListener(Proto.MsgName.ManorFetchRookieRewardRsp, GetAbyssNoviceBonusRsp)
end
return {
  Init = Init,
  ParseRemoteEvent = ParseRemoteEvent,
  ManorInfoReq = ManorInfoReq,
  TriggerEventReq = TriggerEventReq,
  ProcessEventReq = ProcessEventReq,
  ReportPositionReq = ReportPositionReq,
  StoryFinishReq = StoryFinishReq,
  StorySkipReq = StorySkipReq,
  ReportEventPositionReq = ReportEventPositionReq,
  ShopInfoReq = ShopInfoReq,
  OpActivityByIdReq = OpActivityByIdReq,
  SellItemsReq = SellItemsReq,
  FeatureScheduleReq = FeatureScheduleReq,
  GetAbyssNoviceBonusReq = GetAbyssNoviceBonusReq
}
