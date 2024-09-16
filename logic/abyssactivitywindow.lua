require("Abyss_ActivityWindowByName")
local AbyssActivityWindow = {}
local uis, contentPane, pages, selectedPage, eventsBuffer, selectedEntry, selectedTabIndex, selectedPageIndex, selectedSubtabIndex, showFromHide, timer, wait
local GetRegionName = function(regionId)
  local regionConf = TableData.GetConfig(regionId, "BaseManorMapSub")
  local regionName = type(regionConf.name) == "function" and regionConf.name() or regionId
  return regionName
end
local StartTimer = function(updateFunc)
  if timer then
    timer:stop()
  end
  timer = TimerUtil.setInterval(1, -1, updateFunc)
  timer:start()
end
local StopTimer = function()
  if timer then
    timer:stop()
  end
  timer = nil
end
local play_enter_anim = true
local RegionVerified = function(regions, x, y)
  for i, v in pairs(regions) do
    if AbyssExploreMgr.GetRegionId(x, y) == v then
      return true
    end
  end
  return false
end
local RefreshActionVal = function(txt)
  local max = TableData.GetConfig(70010802, "BaseFixed").int_value
  local text = string.format("[color=#e6ff51]%s[/color]/%s", ActorData.GetItemCount(COMMON_ITEM_ID.ABYSS_ACTION_POINT), max)
  txt.text = text
end
local CreateOrClearEventBuffer = function()
  eventsBuffer = eventsBuffer or {}
  table.clear(eventsBuffer)
end
local EventFilter_BuildingSpawns = function(eventInfo)
  local type, subtype = eventInfo.type, eventInfo.type
  return type == AbyssExploreEventID.BUILDING_RANDOM
end
local building_reddot, dungeonTypeBuffer
local BuildingContentListRenderer = function(i, gcmp)
  local dungeonType = dungeonTypeBuffer[i + 1]
  local dungeonInfo = TideDungeonData.GetTideDungeonInfo(dungeonType)
  local child = gcmp
  local conf = TableData.GetConfig(dungeonInfo.currentChapter, "BaseChapter")
  local buildingName = conf.name and conf.name() or "未配置" .. tostring(conf.id)
  UIUtil.SetText(child, buildingName, "WordTxt")
  local inOpenTime = dungeonInfo.inOpenTime
  local open, _, _ = AbyssExploreMgr.EventFeatureIsOpen(AbyssExploreEventID.BUILDING)
  local list = child:GetChild("IconList")
  local curStage = dungeonInfo.currentStage
  local cleared = 0 == curStage
  local itemCtrlIndex = 0
  if dungeonType == ProtoEnum.SCENE_TYPE.MANOR_FIR then
    itemCtrlIndex = 1
  elseif dungeonType == ProtoEnum.SCENE_TYPE.MANOR_WOOD then
    itemCtrlIndex = 2
  elseif dungeonType == ProtoEnum.SCENE_TYPE.MANOR_WATER then
    itemCtrlIndex = 0
  end
  ChangeUIController(child, "c1", itemCtrlIndex)
  local chapterConf = TableData.GetConfig(dungeonInfo.currentChapter, "BaseChapter")
  local latestStageIndex = cleared and 4 or table.keyof(chapterConf.stages, curStage)
  if not inOpenTime and open then
    local serverTimestamp = LoginData.GetCurServerTime()
    local diff = dungeonInfo.sceneOpenStamp - serverTimestamp
    ChangeUIController(child, "c2", 0)
    UIUtil.SetText(child:GetChild("Lock"), TimeUtil.FormatTime(diff), "TimeTxt")
  else
    ChangeUIController(child, "c2", 1)
  end
  
  function list.itemRenderer(j, subgcmp)
    ChangeUIController(subgcmp, "c1", itemCtrlIndex)
    ChangeUIController(subgcmp, "c2", j + 1 < latestStageIndex and 1 or 0)
  end
  
  list.numItems = 3
end
local EventFilter_SpecialRegionsBuilding = function(eventInfo, regions)
  local result = false
  local type, subtype = eventInfo.type, eventInfo.type
  if type == AbyssExploreEventID.BUILDING then
    result = RegionVerified(regions, eventInfo.x, eventInfo.y)
  end
  return result
end

local function RefreshBuildingPanel(unlock)
  local panel = uis.Main.ActivityTips.BuildRegion
  local open, startTimestamp, endTimestamp = AbyssExploreMgr.EventFeatureIsOpen(AbyssExploreEventID.BUILDING)
  if not open then
    local diff = startTimestamp - LoginData.GetCurServerTime()
    panel.c1Ctr.selectedIndex = 2
    panel.End.WordTxt.text = T(20108)
    panel.BuildTopInfo.WordTxt.text = T(20454, TimeUtil.FormatEnTime(diff))
    panel.End.root.onClick:Set(function()
      if not open then
        FloatTipsUtil.ShowWarnTips(T(20333, TimeUtil.FormatEnTime(startTimestamp - LoginData.GetCurServerTime())))
      end
    end)
  else
    local diff = endTimestamp - LoginData.GetCurServerTime()
    local time = TimeUtil.FormatEnTime(diff)
    panel.BuildTopInfo.WordTxt.text = T(20453, time)
  end
  StartTimer(function()
    local diff
    if open then
      diff = endTimestamp - LoginData.GetCurServerTime()
    else
      diff = startTimestamp - LoginData.GetCurServerTime()
    end
    if diff <= 0 then
      wait = true
      StopTimer()
      AbyssExploreService.FeatureScheduleReq(function()
        RefreshBuildingPanel(unlock)
        wait = false
      end)
    end
  end)
  if not unlock then
    panel.c1Ctr.selectedIndex = 0
    local conf = TableData.GetConfig(FEATURE_ENUM.TIDE_DUNGEON, "BaseFeature")
    local tips = type(conf.unlock_des) == "function" and conf.unlock_des() or "未配置解锁提示" .. tostring(conf.id)
    panel.Lock.NameTxt.text = T(20113, conf.level)
    panel.Lock.root.onClick:Set(function()
      FloatTipsUtil.ShowWarnTips(tips)
    end)
  else
    if open then
      panel.c1Ctr.selectedIndex = 1
    end
    local goBtn = panel.GoBtn
    UIUtil.SetBtnText(goBtn, T(20083))
    local regions = selectedEntry.regions
    CreateOrClearEventBuffer()
    local events = AbyssExploreData.GetEvents(EventFilter_SpecialRegionsBuilding, eventsBuffer, regions)
    if not events or not _G.next(events) then
      return
    end
    local event = events[1]
    local params = Split(event.param, "|")
    dungeonTypeBuffer = dungeonTypeBuffer or {}
    table.clear(dungeonTypeBuffer)
    for i, v in ipairs(params) do
      table.insert(dungeonTypeBuffer, tonumber(v))
    end
    table.sort(dungeonTypeBuffer, function(x, y)
      return x < y
    end)
    goBtn.onClick:Set(function()
      AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.GOTO_EVENT, event)
    end)
    panel.RewardBtn.onClick:Set(function()
      local allGot, allPass = true, true
      local defaultType
      for i = 61, 63 do
        local info = TideDungeonData.GetTideDungeonInfo(i)
        local rewardedStages = info.rewardedStages
        local chapterConf = TableData.GetConfig(info.currentChapter, "BaseChapter")
        local stages = chapterConf.stages
        local cleared = 0 == info.currentStage
        local latestIndex = table.keyof(stages, info.currentStage)
        for _, v in ipairs(stages) do
          local index = table.keyof(stages, v)
          local got = table.keyof(rewardedStages, v)
          local pass = cleared or latestIndex > index
          if pass then
            if not got then
              allGot = false
              if not defaultType then
                defaultType = i
              end
            end
          else
            allPass = false
          end
        end
      end
      if not defaultType then
        if allPass and allGot then
          defaultType = 63
        elseif not allPass then
          defaultType = 61
          for i = 61, 63 do
            local info = TideDungeonData.GetTideDungeonInfo(i)
            local cleared = 0 == info.currentStage
            if not cleared then
              defaultType = i
              break
            end
          end
        end
      end
      OpenWindow(WinResConfig.TideRewardWindow.name, nil, defaultType)
    end)
    local progresslist = panel.ProgressList
    progresslist.itemRenderer = BuildingContentListRenderer
    progresslist.numItems = #dungeonTypeBuffer
    if building_reddot then
      RedDotMgr.AddNode({
        windowName = WinResConfig.AbyssActivityWindow.name,
        com = panel.RewardBtn,
        visibleFunc = function()
          if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.TIDE_DUNGEON, false) then
            return RedDotAbyss.TideDungeonHasAnyRewards()
          end
          return false
        end,
        dataType = RED_DOT_DATA_TYPE.ABYSS
      })
    end
    building_reddot = false
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.TIDE_DUNGEON, false) then
      PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ABYSS_GUIDE_BUILDING, 1)
    end
  end
end

local RefreshTreasurePanel
local RefreshTreasureRedDotData = function(regions)
  local panel = uis.Main.ActivityTips.BoxRegion
  local tablist = panel.TabList
  for i, v in pairs(regions) do
    local tabBtn = tablist:GetChildAt(i - 1)
    RedDotData.AddNode({
      windowName = WinResConfig.AbyssActivityWindow.name,
      com = tabBtn,
      visibleFunc = function()
        return RedDotAbyss.HasNewTreasuresWithRegionId(v)
      end,
      dataType = RED_DOT_DATA_TYPE.ABYSS
    })
  end
end
local TreasureSortCompare = function(x, y)
  if 0 == x.finishTimestamp ~= (0 == y.finishTimestamp) then
    return 0 == x.finishTimestamp and y.finishTimestamp > 0
  end
  local sort_x = TableData.GetConfig(x.eventId, "BaseManorEvent").sort or 0
  local sort_y = TableData.GetConfig(y.eventId, "BaseManorEvent").sort or 0
  return sort_x < sort_y
end
local TreasureRegionsTabRenderer = function(i, gcmp)
  local regionId = selectedEntry.regions[i + 1]
  local ctrl_index = 0
  if 2 == regionId then
    ctrl_index = 0
  elseif 5 == regionId then
    ctrl_index = 1
  elseif 6 == regionId then
    ctrl_index = 2
  end
  ChangeUIController(gcmp, "c1", ctrl_index)
  local conf = TableData.GetConfig(regionId, "BaseManorMapSub")
  local nameTxt = gcmp:GetChild("NameTxt")
  nameTxt.text = conf.name()
  gcmp.onClick:Set(function()
    RefreshTreasurePanel(i + 1)
  end)
end
local TreasureContentListRenderer = function(i, gcmp)
  local event = eventsBuffer[i + 1]
  local child = gcmp:GetChild("BoxTips")
  if play_enter_anim then
    child.alpha = 0
    PlayUITrans(gcmp, "up", nil, 0.03 * i)
  else
    child.alpha = 1
  end
  local btn = child:GetChild("GoBtn")
  local regionId = AbyssExploreMgr.GetRegionId(event.x, event.y)
  local unlock = AbyssExploreMgr.RegionIsUnlock(regionId)
  ChangeUIController(child, "c1", unlock and 0 or 2)
  if unlock then
    if event.finishTimestamp > 0 then
      local info = child:GetChild("Info2")
      local reset = child:GetChild("Reset")
      local refreshTimestamp = event.refreshTimestamp
      local diff = refreshTimestamp - LoginData.GetCurServerTime()
      UIUtil.SetText(info, TimeUtil.FormatTime(math.max(0, diff)), "TimeTxt")
      UIUtil.SetText(reset, T(20114), "WordTxt")
      ChangeUIController(child, "c1", 1)
    else
      ChangeUIController(child, "c1", 0)
    end
  else
    ChangeUIController(child, "c1", 2)
    local lock = child:GetChild("Lock")
    UIUtil.SetText(lock, T(20108), "NameTxt")
    UIUtil.SetText(lock, T(20109), "SubtitleTxt")
    lock.onClick:Set(function()
      FloatTipsUtil.ShowWarnTips(T(20117, GetRegionName(regionId)))
    end)
  end
  local info3 = child:GetChild("Info3")
  local reward
  local conf = TableData.GetConfig(event.eventId, "BaseManorEvent")
  if conf.reward_pool then
    local confTbl = TableData.GetTable("BaseManorReward")
    for _, v in pairs(confTbl) do
      if v.group_id == conf.reward_pool then
        local min = math.min(v.level[1], v.level[2])
        local max = math.max(v.level[1], v.level[2])
        local lv = AbyssExploreData.GetManorInfo().mapLevel
        if max >= lv and min <= lv then
          reward = v.reward
          break
        end
      end
    end
  elseif conf.reward then
    reward = conf.reward
  end
  local reward_item_id
  if reward then
    info3.visible = true
    local splits = Split(reward[1], ":")
    UIUtil.SetText(info3, T(20220), "WordTxt")
    UIUtil.SetText(info3, splits[3], "NumberTxt")
    reward_item_id = tonumber(splits[2])
    UIUtil.SetIconById(info3:GetChild("BoxTipsInfo3Bg"):GetChild("PicLoader"), reward_item_id)
  else
    info3.visible = false
  end
  btn.onClick:Set(function()
    if not unlock then
      FloatTipsUtil.ShowWarnTips(T(20103, GetRegionName(regionId)))
      return
    end
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.GOTO_EVENT, event)
  end)
  UIUtil.SetBtnText(btn, T(20083))
  local loader = child:GetChild("PicLoader")
  loader.url = UIUtil.GetResUrl(event.icon)
  if reward_item_id then
    local holder = child:GetChild("PicHolder")
    holder.touchable = false
    loader.onClick:Set(function()
      OpenWindow(WinResConfig.ItemTipsWindow.name, nil, reward_item_id)
    end)
  else
    loader.onClick:Clear()
  end
  local cost = event.cost
  local info = child:GetChild("Info1")
  if cost and _G.next(cost) then
    info.visible = true
    UIUtil.SetText(info, T(20219), "WordTxt")
    UIUtil.SetText(info, string.format("-%s", cost[1].value), "NumberTxt")
  else
    info.visible = false
  end
  RedDotAbyss.SaveInspectedTreasure(event, i >= #eventsBuffer - 1)
end
local EventFilter_SpecialRegionsTreasure = function(eventInfo, regions)
  local result = false
  local type, subtype = eventInfo.type, eventInfo.subtype
  if (type == AbyssExploreEventID.POSITIVE or type == AbyssExploreEventID.DAILY_RANDOM) and subtype == AbyssExploreSubEventID.TREASURE then
    local display = true
    local finished = eventInfo.finishTimestamp > 0
    if finished then
      display = eventInfo.refreshTimestamp > 0 and eventInfo.refreshTimestamp > eventInfo.finishTimestamp
    end
    result = display and RegionVerified(regions, eventInfo.x, eventInfo.y)
  end
  return result
end
local treasure_reddot

function RefreshTreasurePanel(index)
  local panel = uis.Main.ActivityTips.BoxRegion
  RefreshActionVal(panel.BoxTopInfo.BuildTopInfo1.NumberTxt)
  panel.BoxTopInfo.WordTxt.text = T(20461)
  local regions = selectedEntry.regions
  local treasureDict = {}
  CreateOrClearEventBuffer()
  local events = AbyssExploreData.GetEvents(EventFilter_SpecialRegionsTreasure, eventsBuffer, regions)
  local tabIndex = math.min(math.max(index or 1, 1), #regions)
  selectedSubtabIndex = tabIndex
  for _, regionId in pairs(regions) do
    local treasures = {}
    for _, event in pairs(events) do
      if regionId == AbyssExploreMgr.GetRegionId(event.x, event.y) then
        table.insert(treasures, event)
      end
    end
    table.sort(treasures, TreasureSortCompare)
    treasureDict[regionId] = treasures
  end
  local treasures = treasureDict[regions[tabIndex]]
  local numTreasures = #treasures
  table.clear(eventsBuffer)
  for i, v in ipairs(treasures) do
    table.insert(eventsBuffer, v)
  end
  local contentlist = panel.TipsList
  contentlist.defaultItem = "ui://Abyss/BoxTipsAni"
  contentlist.itemRenderer = TreasureContentListRenderer
  local tablist = panel.TabList
  tablist.defaultItem = "ui://Abyss/BoxTabBtn"
  tablist.itemRenderer = TreasureRegionsTabRenderer
  tablist.numItems = #regions
  tablist.selectedIndex = tabIndex - 1
  if treasure_reddot then
    RefreshTreasureRedDotData(regions)
    treasure_reddot = false
  end
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.AbyssWindow.name)
  contentlist.numItems = numTreasures
  if not showFromHide then
    contentlist.scrollPane:ScrollLeft()
  end
end

local EventFilter_SpecialRegionsExpedition = function(eventInfo, regions)
  if eventInfo.type == AbyssExploreEventID.EXPEDITION_BUILDING then
    for i, v in pairs(regions) do
      if AbyssExploreMgr.GetRegionId(eventInfo.x, eventInfo.y) == v then
        return true
      end
    end
  end
  return false
end
local exped_reddot
local RefreshExpeditionPanel = function()
  local panel = uis.Main.ActivityTips.ExpeditionRegion
  panel.NameTxt.text = T(20040)
  panel.SubtitleTxt.text = T(20110)
  CreateOrClearEventBuffer()
  local regions = selectedEntry.regions
  local events = AbyssExploreData.GetEvents(EventFilter_SpecialRegionsExpedition, eventsBuffer, regions)
  local chapterIndex, stageIndex = ExpeditionMgr.GetLatestChapterIndex()
  local expedData = ExpeditionData.GetData()
  local isClearedThisTime = ExpeditionMgr.IsClearedThisTime()
  local start = not isClearedThisTime
  local regionId = regions[1]
  local regionIsUnlock = AbyssExploreMgr.RegionIsUnlock(regionId)
  local funcId = FEATURE_ENUM.ADVENTURE_DREAMLAND
  local enterable = EnterClampUtil.WhetherToEnter(funcId, false)
  local lock = panel.root:GetChild("Lock")
  if enterable then
    if regionIsUnlock then
      ChangeUIController(panel.root, "c1", start and (isClearedThisTime and 2 or 1) or 0)
    else
      ChangeUIController(panel.root, "c1", 3)
      UIUtil.SetText(lock, T(20108), "NameTxt")
      UIUtil.SetText(lock, T(20109), "SubtitleTxt")
      lock.onClick:Set(function()
        FloatTipsUtil.ShowWarnTips(T(20103, GetRegionName(regionId)))
      end)
    end
  else
    ChangeUIController(panel.root, "c1", 3)
    local conf = TableData.GetConfig(funcId, "BaseFeature")
    UIUtil.SetText(lock, T(20113, conf.level), "NameTxt")
    UIUtil.SetText(lock, T(20109), "SubtitleTxt")
    lock.onClick:Set(function()
      EnterClampUtil.WhetherToEnter(funcId)
    end)
  end
  local refreshTimestamp = expedData.nextRefreshStamp
  local diff = refreshTimestamp - LoginData.GetCurServerTime()
  local remainTxt = T(20104, TimeUtil.FormatTime(diff))
  panel.Time.TimeTxt.text = remainTxt
  local expedLayer = panel.ExpeditionLayer
  local rewardTxt = expedLayer.root:GetChild("NumberTxt")
  local totalStars = ExpeditionMgr.GetAllStageStars()
  rewardTxt.text = string.format("[size=24][color=#ffcc00]%s[/color][/size]/%s", expedData.highPassStar, totalStars)
  expedLayer.Name1Txt.text = T(20093 + (chapterIndex - 1) * 2)
  expedLayer.Name3Txt.text = string.format("%02d", chapterIndex)
  expedLayer.root.onClick:Set(function()
    OpenWindow(WinResConfig.SimpleExpeditionRewardWindow.name)
  end)
  if exped_reddot then
    RedDotMgr.AddNode({
      windowName = WinResConfig.AbyssActivityWindow.name,
      com = expedLayer.root,
      visibleFunc = function()
        return RedDotExped.HasAnyRewards()
      end,
      dataType = RED_DOT_DATA_TYPE.EXPED
    })
    exped_reddot = false
  end
  panel.GoBtn.onClick:Set(function()
    if not AbyssExploreMgr.RegionIsUnlock(regionId) then
      FloatTipsUtil.ShowWarnTips(T(20103, GetRegionName(regionId)))
      return
    end
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.GOTO_EVENT, events[1])
  end)
  UIUtil.SetBtnText(panel.GoBtn, T(20083))
  if enterable then
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ABYSS_GUIDE_EXPEDITION, 1)
  end
end
local BOSS_ENUM = {
  WATER = ProtoEnum.SCENE_TYPE.BOSS_WATER,
  FIRE = ProtoEnum.SCENE_TYPE.BOSS_FIRE,
  WOOD = ProtoEnum.SCENE_TYPE.BOSS_WOOD
}
BOSS_ENUM[1] = BOSS_ENUM.WATER
BOSS_ENUM[2] = BOSS_ENUM.WOOD
BOSS_ENUM[3] = BOSS_ENUM.FIRE
local bosses, bossTips, selectedBossIndex
local RefreshStageInfo = function()
  local funcId = FEATURE_ENUM.ADVENTURE_BOSS
  local enterable = EnterClampUtil.WhetherToEnter(funcId, false)
  local panel = uis.Main.ActivityTips.BossRegion
  panel.Title.c1Ctr.selectedIndex = enterable and 0 or 1
  if not enterable then
    local lock = panel.Title.Lock.root
    local conf = TableData.GetConfig(funcId, "BaseFeature")
    UIUtil.SetText(lock, T(20113, conf.level), "NameTxt")
    UIUtil.SetText(lock, T(20109), "SubtitleTxt")
    lock.onClick:Set(function()
      EnterClampUtil.WhetherToEnter(funcId)
    end)
  end
  local boss = bosses[selectedBossIndex]
  local firstBoss = boss.list[1]
  local eventId = firstBoss.eventId
  local eventConf = TableData.GetConfig(eventId, "BaseManorEvent")
  local regionId = firstBoss.region
  local chapterId = firstBoss.conf.id
  local Info2Btn = panel.BossTopInfo.Info2Btn
  local loader = Info2Btn:GetChild("PicLoader")
  local itemId = 21000004
  UIUtil.SetIconById(loader, itemId)
  local content = string.format("[color=#e6ff51]%s[/color]/%s", ActorData.GetItemCount(itemId), ActorData.GetEnergyMax())
  UIUtil.SetText(Info2Btn, content, "WordTxt")
  Info2Btn.onClick:Set(function()
    UIUtil.ClickAssetItem(itemId)
  end)
  UIUtil.SetBtnText(panel.Title.BoBtn, T(20083))
  panel.Title.BoBtn.onClick:Set(function()
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.GOTO_EVENT, eventId)
  end)
  panel.Title.NameTxt.text = type(eventConf.name) == "function" and eventConf.name() or "未配置"
  panel.Title.WordTxt.text = "function" == type(eventConf.des) and eventConf.des() or "未配置"
  panel.Title.PicLoader.url = UIUtil.GetResUrl(eventConf.go_to_icon)
end
local BossChallengePanelTabRenderer = function(i, gcmp)
  local panel = uis.Main.ActivityTips.BossRegion
  local tablist = panel.TabList
  local contentlist = panel.TipsList
  local bossItem = bosses[i + 1]
  local firstBoss = bossItem.list[1]
  local eventId = firstBoss.eventId
  UIUtil.SetText(gcmp, GetRegionName(firstBoss.region), "NameTxt")
  local ctrlindex = 0
  if bossItem.type == BOSS_ENUM.WATER then
    ctrlindex = 0
  elseif bossItem.type == BOSS_ENUM.FIRE then
    ctrlindex = 1
  elseif bossItem.type == BOSS_ENUM.WOOD then
    ctrlindex = 2
  end
  ChangeUIController(gcmp, "c1", ctrlindex)
  gcmp.onClick:Set(function()
    local index = i + 1
    if selectedBossIndex == index then
      return
    end
    selectedBossIndex = index
    tablist.selectedIndex = selectedBossIndex - 1
    contentlist.numItems = #bosses[selectedBossIndex].list
    RefreshStageInfo()
  end)
end
local BossChallengeContentListRenderer = function(i, gcmp)
  local list = bosses[selectedBossIndex].list
  local item = list[i + 1]
  local conf = item.conf
  local url = UIUtil.GetResUrl(conf.icon)
  local child = gcmp:GetChild("BossTips")
  child:GetChild("PicLoader").url = url
  local name = conf.name()
  local english = type(conf.name_english) == "function" and conf.name_english() or "未配置"
  UIUtil.SetText(child, name, "NameTxt")
  UIUtil.SetText(child, english, "SubtitleTxt")
  if play_enter_anim then
    child.alpha = 0
    PlayUITrans(gcmp, "up", nil, i * 0.03)
  else
    child.alpha = 1
  end
  local lock = child:GetChild("Lock")
  local spend = child:GetChild("Spend")
  local rewardlist = child:GetChild("RewardList")
  local difficulty = child:GetChild("Difficulty")
  local stages = conf.stages
  local stageConf = TableData.GetConfig(stages[1], "BaseStage")
  local lockLv
  if stageConf.open_condition then
    local arr = Split(stageConf.open_condition, ":")
    lockLv = tonumber(arr[2])
  end
  local funcId = FEATURE_ENUM.ADVENTURE_BOSS
  local enterable = EnterClampUtil.WhetherToEnter(funcId, false)
  if not enterable or lockLv and lockLv > ActorData.GetLevel() or not AdventureData.GetStageOpen(stageConf.chapter_id, stageConf.id) then
    UIUtil.SetText(lock, T(20115), "WordTxt")
    ChangeUIController(child, "c1", 1)
  else
    ChangeUIController(child, "c1", 0)
  end
  local progress = 1
  for j, v in ipairs(stages) do
    if AdventureData.GetStageOpen(conf.id, v) then
      progress = j
    end
  end
  UIUtil.SetText(difficulty, T(20244, progress), "WordTxt")
  stageConf = TableData.GetConfig(stages[progress], "BaseStage")
  local cost = GetConfigItemList(stageConf.cost, true)
  UIUtil.SetIconById(spend:GetChild("PicLoader"), cost[1].id)
  UIUtil.SetText(spend, string.format("-%s", cost[1].value), "WordTxt")
  local items = GetConfigItemList(stageConf.reward_show, true)
  local cnt = #items
  for j = 1, cnt do
    local conf1 = TableData.GetConfig(items[j].value, "BaseBadge")
    for k = j + 1, cnt do
      local conf2 = TableData.GetConfig(items[k].value, "BaseBadge")
      if conf2.suit_group_id == conf1.suit_group_id then
        items[k].duplicate = true
      end
    end
  end
  for j = cnt, 1, -1 do
    if items[j].duplicate then
      table.remove(items, j)
    end
  end
  
  function rewardlist.itemRenderer(j, ggcmp)
    local drop = items[j + 1]
    local itemConfig = TableData.GetConfig(drop.value, "BaseBadge")
    if itemConfig then
      local loader = ggcmp:GetChild("PicLoader")
      local suitConfig = TableData.GetConfig(itemConfig.suit_group_id, "BaseBadgeSuitGroup")
      if loader and suitConfig then
        loader.url = UIUtil.GetResUrl(suitConfig.icon)
      end
      loader.onClick:Set(function()
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
        OpenWindow(WinResConfig.BadgeGetTipsWindow.name, nil, drop.value)
      end)
    end
  end
  
  rewardlist.numItems = #items
end
local EventFilter_SpecialRegionsChallengeBoss = function(eventInfo, regions)
  local result = false
  if eventInfo.type == AbyssExploreEventID.CHALLENGE_BOSS then
    result = RegionVerified(regions, eventInfo.x, eventInfo.y)
  end
  return result
end
local bossChapters
local RefreshBossChallengePanel = function(index)
  local panel = uis.Main.ActivityTips.BossRegion
  local tablist = panel.TabList
  local contentlist = panel.TipsList
  CreateOrClearEventBuffer()
  local regions = selectedEntry.regions
  AbyssExploreData.GetEvents(EventFilter_SpecialRegionsChallengeBoss, eventsBuffer, regions)
  selectedBossIndex = index or 1
  selectedSubtabIndex = selectedBossIndex
  bosses = bosses or {}
  table.clear(bosses)
  for _, v in ipairs(BOSS_ENUM) do
    table.insert(bosses, {
      type = v,
      list = {}
    })
  end
  bossChapters = bossChapters or {}
  table.clear(bossChapters)
  for i, eventInfo in pairs(eventsBuffer) do
    local param = eventInfo.param
    local splits = Split(param, "|")
    for _, v in pairs(splits) do
      local conf = TableData.GetConfig(tonumber(v), "BaseChapter")
      for _, item in pairs(bosses) do
        if item.type == conf.type then
          table.insert(bossChapters, conf.id)
          table.insert(item.list, {
            conf = conf,
            eventId = eventInfo.eventId,
            region = AbyssExploreMgr.GetRegionId(eventInfo.x, eventInfo.y)
          })
        end
      end
    end
  end
  local cnt = #bosses
  for i = cnt, 1, -1 do
    if not _G.next(bosses[i].list) then
      table.remove(bosses, i)
    end
  end
  AdventureService.GetChapterStageReq(bossChapters, function()
    tablist.itemRenderer = BossChallengePanelTabRenderer
    contentlist.itemRenderer = BossChallengeContentListRenderer
    tablist.numItems = #bosses
    contentlist.numItems = #bosses[selectedBossIndex].list
    if tablist.selectedIndex ~= selectedBossIndex - 1 then
      tablist.selectedIndex = selectedBossIndex - 1
    end
    RefreshStageInfo()
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ABYSS_GUIDE_BOSS_CHALLENGE, 1)
  end)
end
local roguelike_reddot
local RefreshRoguelikePanel = function(unlock)
  local panel = uis.Main.ActivityTips.RogueRegion
  if not unlock then
    panel.c2Ctr.selectedIndex = 0
    local conf = TableData.GetConfig(FEATURE_ENUM.ADVENTURE_ROGUE, "BaseFeature")
    local tips = type(conf.unlock_des) == "function" and conf.unlock_des() or "未配置解锁提示" .. tostring(conf.id)
    panel.Lock.NameTxt.text = T(20113, conf.level)
    panel.Lock.root.onClick:Set(function()
      FloatTipsUtil.ShowWarnTips(tips)
    end)
  else
    panel.c2Ctr.selectedIndex = 1
    panel.Score.WordTxt.text = T(1366)
    local rogueInfo = RogueData.GetRogueInfo()
    local topScore = rogueInfo.themeInfo.topScore
    panel.Score.NumberTxt.text = topScore
    ChangeUIController(panel.root, "c1", type(topScore) == "number" and topScore > 0 and 1 or 0)
    UIUtil.SetText(panel.ScoreRewardBtn, T(1359), "WordTxt")
    UIUtil.SetText(panel.ScoreRewardBtn, T(20441, rogueInfo.themeInfo.level), "LevelTxt")
    UIUtil.SetText(panel.ScoreRewardBtn:GetChild("RewardExpand"), T(1362), "WordTxt")
    UIUtil.SetText(panel.RogueLetterBtn, T(1360), "WordTxt")
    UIUtil.SetText(panel.RogueLetterBtn, T(20442, RogueMgr.GetRogueTrendBar(), #rogueInfo.trendInfos), "NumberTxt")
    UIUtil.SetBtnText(panel.GoBtn, T(20083))
    panel.ScoreRewardBtn.onClick:Set(function()
      OpenWindow(WinResConfig.RogueScoreRewardWindow.name, nil, rogueInfo.themeInfo.themeId)
    end)
    local conf = TableData.GetConfig(rogueInfo.themeInfo.themeId, "BaseRogueTheme")
    panel.RogueLetterBtn.onClick:Set(function()
      OpenWindow(WinResConfig.RogueLetterRewardWindow.name, nil, conf.group_id)
    end)
    local evts = AbyssExploreData.GetEventsByType(AbyssExploreEventID.ROGUELIKE)
    panel.GoBtn.onClick:Set(function()
      AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.GOTO_EVENT, evts[1])
    end)
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_ROGUE, false) then
      PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ABYSS_GUIDE_ROGUE, 1)
    end
    if roguelike_reddot then
      RedDotMgr.AddNode({
        windowName = WinResConfig.AbyssActivityWindow.name,
        com = panel.RogueLetterBtn,
        visibleFunc = function()
          return RedDotRogue.CanTaskReward()
        end,
        dataType = RED_DOT_DATA_TYPE.ROGUE
      })
      RedDotMgr.AddNode({
        windowName = WinResConfig.AbyssActivityWindow.name,
        com = panel.ScoreRewardBtn,
        visibleFunc = function()
          return RedDotRogue.CanLevelReward()
        end,
        dataType = RED_DOT_DATA_TYPE.ROGUE
      })
      roguelike_reddot = false
    end
  end
end
local frostdungeon_reddot
local RefreshFrostDungeonPanel = function(unlock)
  local panel = uis.Main.ActivityTips.SuperRegion
  local open, startTimestamp, endTimestamp = AbyssExploreMgr.EventFeatureIsOpen(AbyssExploreEventID.FROST_DUNGEON)
  StartTimer(function()
    local diff
    if open then
      diff = endTimestamp - LoginData.GetCurServerTime()
    else
      diff = startTimestamp - LoginData.GetCurServerTime()
    end
    if diff <= 0 then
      StopTimer()
      wait = true
      AbyssExploreService.FeatureScheduleReq(function()
        RefreshBuildingPanel(unlock)
        wait = false
      end)
    end
  end)
  local timeContentTxt
  if not open then
    local diff = startTimestamp - LoginData.GetCurServerTime()
    panel.c1Ctr.selectedIndex = 2
    panel.End.WordTxt.text = T(20108)
    timeContentTxt = T(20454, TimeUtil.FormatEnTime(diff))
    panel.End.root.onClick:Set(function()
      if not open then
        FloatTipsUtil.ShowWarnTips(T(20333, TimeUtil.FormatEnTime(startTimestamp - LoginData.GetCurServerTime())))
      end
    end)
  else
    local diff = endTimestamp - LoginData.GetCurServerTime()
    timeContentTxt = T(20453, TimeUtil.FormatEnTime(diff))
  end
  panel.Time.WordTxt.text = timeContentTxt
  if not unlock then
    panel.c1Ctr.selectedIndex = 0
    local conf = TableData.GetConfig(FEATURE_ENUM.FROST_DUNGEON, "BaseFeature")
    local tips = type(conf.unlock_des) == "function" and conf.unlock_des() or "未配置解锁提示" .. tostring(conf.id)
    panel.Lock.NameTxt.text = T(20113, conf.level)
    panel.Lock.root.onClick:Set(function()
      FloatTipsUtil.ShowWarnTips(tips)
    end)
  else
    UIUtil.SetBtnText(panel.GoBtn, T(20083))
    if open then
      panel.c1Ctr.selectedIndex = 1
    end
    local progresslist = panel.ProgressList
    local stages = FrostDungeonData.GetLevelList()
    local simpleStages = {
      [1] = {
        stages[1],
        stages[2]
      },
      [2] = {
        stages[3],
        stages[4]
      },
      [3] = {
        stages[5]
      }
    }
    
    function progresslist.itemRenderer(i, gcmp)
      local item = simpleStages[i + 1]
      local stageId = item[1]
      local open, stamp, _ = FrostDungeonMgr.IsLevelOpen(stageId)
      local unlock = FrostDungeonMgr.IsLevelUnlock(stageId)
      local stageConf = TableData.GetConfig(stageId, "BaseStage")
      UIUtil.SetText(gcmp, stageConf.name_subtitle(), "WordTxt")
      ChangeUIController(gcmp, "c1", i <= 1 and 0 or i <= 2 and 1 or 2)
      ChangeUIController(gcmp, "c2", open and unlock and 1 or 0)
      if not open then
        UIUtil.SetText(gcmp:GetChild("Lock"), TimeUtil.FormatTime(stamp - LoginData.GetCurServerTime()), "TimeTxt")
      elseif not unlock then
        UIUtil.SetText(gcmp:GetChild("Lock"), "", "TimeTxt")
      else
        local numStars, maxNumStars = 0, 0
        for _, v in ipairs(item) do
          numStars = numStars + FrostDungeonMgr.GetLevelStars(v)
          maxNumStars = maxNumStars + FrostDungeonMgr.GetLevelMaxStars(v)
        end
        UIUtil.SetText(gcmp:GetChild("Star"), string.format("%s/%s", numStars, maxNumStars), "TimeTxt")
      end
    end
    
    progresslist.numItems = #simpleStages
    panel.RewardBtn.onClick:Set(function()
      OpenWindow(WinResConfig.FrostDungeonRewardWindow.name)
    end)
    local redDot = panel.RewardBtn:GetChild("Red")
    if not redDot then
      redDot = UIMgr:CreateObject("CommonResource", "RedDot")
      panel.RewardBtn:AddChild(redDot)
      redDot.name = "Red"
      redDot.visible = false
      redDot:SetPosition(50, 24)
    end
    panel.GoBtn.onClick:Set(function()
      AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.GOTO_EVENT, AbyssExploreData.GetEventsByType(AbyssExploreEventID.FROST_DUNGEON)[1])
    end)
    if frostdungeon_reddot then
      RedDotMgr.AddNode({
        windowName = WinResConfig.AbyssActivityWindow.name,
        com = panel.RewardBtn,
        visibleFunc = function()
          return RedDotFrostDungeon.HasAnyRewards()
        end,
        dataType = RED_DOT_DATA_TYPE.ABYSS
      })
      frostdungeon_reddot = false
    end
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ABYSS_GUIDE_FROSTDUNGEON, 1)
  end
end
local RefreshExploreAFKPanel = function(unlock)
  local panel = uis.Main.ActivityTips.ExploreRegion
  if unlock then
    local level = ExploreAFKData.GetLevel()
    local exp = ExploreAFKData.GetExp()
    local tbl = TableData.GetTable("BaseDispatchTeam")
    local allTeams = {}
    for i, v in pairs(tbl) do
      table.insert(allTeams, v)
    end
    table.sort(allTeams, function(x, y)
      return x.id < y.id
    end)
    local statelist = panel.StateList
    local exploreLevel = panel.ExploreLevel.root
    UIUtil.SetText(exploreLevel, string.format("%s/%s", level, ExploreAFKData.GetMaxLevel()), "ExpTxt")
    UIUtil.SetText(exploreLevel, T(20556), "ExpMaxTxt")
    UIUtil.SetText(exploreLevel, T(1374, level), "LevelTxt")
    local progressBar = panel.ExploreLevel.ExpProgressBar
    progressBar.value = exp / ExploreAFKData.GetLevelExpThreshold(level) * 100
    
    function statelist.itemRenderer(i, gcmp)
      local team = allTeams[i + 1]
      local nameText = team.name and team.name()
      UIUtil.SetText(gcmp, nameText, "WordTxt")
      if level < team.dispatch_level then
        UIUtil.SetText(gcmp, T(1374, team.dispatch_level), "LockTxt")
        ChangeUIController(gcmp, "c1", 3)
        return
      end
      local groupInfo = ExploreAFKData.GetGroupInfo(team.id)
      UIUtil.SetText(gcmp, T(20557), "NothingTxt")
      if groupInfo then
        local diff = groupInfo.overStamp - LoginData.GetCurServerTime()
        if diff > 0 then
          UIUtil.SetText(gcmp, TimeUtil.FormatTime(diff), "TimeTxt")
          ChangeUIController(gcmp, "c1", 1)
        else
          ChangeUIController(gcmp, "c1", 2)
        end
      else
        ChangeUIController(gcmp, "c1", 0)
      end
    end
    
    statelist.numItems = #allTeams
  end
  local goBtn = panel.GoBtn
  goBtn.onClick:Set(function()
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.GOTO_EVENT, AbyssExploreData.GetEventsByType(AbyssExploreEventID.EXPLORE_AFK)[1])
  end)
end
local defaultTabType, defaultSelectedPage, defaultSelectedTab
local RefreshPanel = function(entry)
  if wait then
    return
  end
  local panel = uis.Main.ActivityTips
  local categories = entry.categories
  selectedEntry = entry
  local num = #categories
  StopTimer()
  if num >= 1 then
    local tuple = categories[1]
    local type, subtype = tuple.type, tuple.subtype
    RedDotMgr.UpdateNodeByWindowName(WinResConfig.AbyssActivityWindow.name)
    if type == AbyssExploreEventID.CHALLENGE_BOSS then
      panel.c1Ctr.selectedIndex = 0
      RefreshBossChallengePanel(selectedBossIndex)
    elseif type == AbyssExploreEventID.EXPEDITION_BUILDING then
      panel.c1Ctr.selectedIndex = 1
      ld("Expedition", function()
        ExpeditionService.GetExpeditionInfoReq(function()
          RefreshExpeditionPanel(selectedSubtabIndex)
        end)
      end)
    elseif type == AbyssExploreEventID.BUILDING then
      panel.c1Ctr.selectedIndex = 2
      ld("TideDungeon")
      if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.TIDE_DUNGEON, false) then
        TideDungeonService.GetTideDungeonInfoReq(AbyssTideDungeon, function()
          RefreshBuildingPanel(true)
        end)
      else
        RefreshBuildingPanel(false)
      end
    elseif (type == AbyssExploreEventID.POSITIVE or type == AbyssExploreEventID.DAILY_RANDOM) and subtype == AbyssExploreSubEventID.TREASURE then
      panel.c1Ctr.selectedIndex = 3
      RefreshTreasurePanel(selectedSubtabIndex)
    elseif type == AbyssExploreEventID.ROGUELIKE then
      panel.c1Ctr.selectedIndex = 4
      ld("Rogue")
      if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_ROGUE, false) then
        RogueService.GetRogueInfoReq(function()
          RefreshRoguelikePanel(true)
        end)
      else
        RefreshRoguelikePanel(false)
      end
    elseif type == AbyssExploreEventID.FROST_DUNGEON then
      panel.c1Ctr.selectedIndex = 5
      ld("FrostDungeon")
      if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.FROST_DUNGEON, false) then
        FrostDungeonService.GetFrostDungeonInfoReq(function()
          RefreshFrostDungeonPanel(true)
        end)
      else
        RefreshFrostDungeonPanel(false)
      end
    elseif type == AbyssExploreEventID.EXPLORE_AFK then
      panel.c1Ctr.selectedIndex = 6
      ld("ExploreAFK")
      ExploreAFKService.GetExploreAFKInfoReq(function()
        RefreshExploreAFKPanel(true)
      end)
    else
      return
    end
  end
end
local RefreshPageRedDotData = function()
  RedDotMgr.RemoveNode(WinResConfig.AbyssActivityWindow.name)
  local panel = uis.Main.ActivityTips
  local tablist = panel.TabList
  local treasureIndex, expedIndex, bossIndex, buildingIndex, frostDungeonIndex, roguelikeIndex
  local entries = selectedPage.entries
  for i, entry in ipairs(entries) do
    local categories = entry.categories
    for _, category in pairs(categories) do
      if category.type == AbyssExploreEventID.POSITIVE and category.subtype == AbyssExploreSubEventID.TREASURE then
        treasureIndex = i
      elseif category.type == AbyssExploreEventID.EXPEDITION_BUILDING then
        expedIndex = i
      elseif category.type == AbyssExploreEventID.CHALLENGE_BOSS then
        bossIndex = i
      elseif category.type == AbyssExploreEventID.BUILDING then
        buildingIndex = i
      elseif category.type == AbyssExploreEventID.FROST_DUNGEON then
        frostDungeonIndex = i
      elseif category.type == AbyssExploreEventID.ROGUELIKE then
        roguelikeIndex = i
      end
    end
  end
  if type(treasureIndex) == "number" then
    RedDotMgr.AddNode({
      windowName = WinResConfig.AbyssActivityWindow.name,
      com = tablist:GetChildAt(treasureIndex - 1),
      visibleFunc = function()
        return RedDotAbyss.HasNewTreasures()
      end,
      dataType = RED_DOT_DATA_TYPE.ABYSS
    })
  end
  if type(expedIndex) == "number" then
    RedDotMgr.AddNode({
      windowName = WinResConfig.AbyssActivityWindow.name,
      com = tablist:GetChildAt(expedIndex - 1),
      visibleFunc = function()
        return RedDotExped.HasAnyRewards()
      end,
      newFlagVisibleFunc = function()
        return RedDotAbyss.ExpeditionIsNew()
      end,
      newFlagName = "abyss",
      onlyNew = true,
      dataType = RED_DOT_DATA_TYPE.ABYSS
    })
  end
  if type(bossIndex) == "number" then
    RedDotMgr.AddNode({
      windowName = WinResConfig.AbyssActivityWindow.name,
      com = tablist:GetChildAt(bossIndex - 1),
      newFlagVisibleFunc = function()
        return RedDotAbyss.BossChallengeIsNew()
      end,
      newFlagName = "abyss",
      onlyNew = true,
      dataType = RED_DOT_DATA_TYPE.ABYSS
    })
  end
  if type(buildingIndex) == "number" then
    RedDotMgr.AddNode({
      windowName = WinResConfig.AbyssActivityWindow.name,
      com = tablist:GetChildAt(buildingIndex - 1),
      visibleFunc = function()
        if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.TIDE_DUNGEON, false) then
          return RedDotAbyss.TideDungeonHasAnyRewards()
        end
        return false
      end,
      newFlagVisibleFunc = function()
        return RedDotAbyss.BuildingIsNew()
      end,
      newFlagName = "abyss",
      onlyNew = true,
      dataType = RED_DOT_DATA_TYPE.ABYSS
    })
  end
  if type(frostDungeonIndex) == "number" then
    RedDotMgr.AddNode({
      windowName = WinResConfig.AbyssActivityWindow.name,
      com = tablist:GetChildAt(frostDungeonIndex - 1),
      visibleFunc = function()
        if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.FROST_DUNGEON, false) then
          return RedDotFrostDungeon.HasAnyRewards()
        end
        return false
      end,
      newFlagVisibleFunc = function()
        return RedDotAbyss.FrostDungeonIsNew()
      end,
      newFlagName = "abyss",
      onlyNew = true,
      dataType = RED_DOT_DATA_TYPE.ABYSS
    })
  end
  if type(roguelikeIndex) == "number" then
    RedDotMgr.AddNode({
      windowName = WinResConfig.AbyssActivityWindow.name,
      com = tablist:GetChildAt(roguelikeIndex - 1),
      visibleFunc = function()
        if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_ROGUE, false) then
          return RedDotRogue.CanLevelReward() or RedDotRogue.CanTaskReward()
        end
        return false
      end,
      newFlagVisibleFunc = function()
        return RedDotAbyss.RoguelikeIsNew()
      end,
      newFlagName = "abyss",
      onlyNew = true,
      dataType = RED_DOT_DATA_TYPE.ABYSS
    })
  end
end
local SetTab = function(tabIndex)
  local panel = uis.Main.ActivityTips
  local tablist = panel.TabList
  tablist.numItems = #selectedPage.entries
  local entry = selectedPage.entries[tabIndex]
  RefreshPanel(entry)
  local list_selected_index = tabIndex - 1
  if tablist.selectedIndex ~= list_selected_index then
    tablist.selectedIndex = list_selected_index
  end
  selectedTabIndex = tabIndex
end
local SetPageAndTab = function(pageIndex, tabIndex, playanim)
  play_enter_anim = playanim
  local panel = uis.Main.ActivityTips
  local titlelist = panel.TitleList
  local tablist = panel.TabList
  local list_selected_index = pageIndex - 1
  if titlelist.selectedIndex ~= list_selected_index then
    titlelist.selectedIndex = list_selected_index
  end
  local page_changed = selectedPageIndex ~= pageIndex
  selectedPage = pages[pageIndex]
  selectedPageIndex = pageIndex
  SetTab(tabIndex)
  if page_changed then
    RefreshPageRedDotData()
    exped_reddot = true
    treasure_reddot = true
    building_reddot = true
    roguelike_reddot = true
    frostdungeon_reddot = true
  end
end

function AbyssActivityWindow.ReInitData()
end

function AbyssActivityWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.AbyssActivityWindow.package, WinResConfig.AbyssActivityWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    defaultTabType = type(bridgeObj.argTable[1]) == "number" and bridgeObj.argTable[1]
    uis = GetAbyss_ActivityWindowUis(contentPane)
    AbyssActivityWindow.UpdateInfo()
    AbyssActivityWindow.InitBtn()
  end)
end

local PRE_REQUIRE_FEATURES = {
  [FEATURE_ENUM.TIDE_DUNGEON] = function(rspCallback)
    ld("TideDungeon")
    TideDungeonService.GetTideDungeonInfoReq(AbyssTideDungeon, rspCallback)
  end,
  [FEATURE_ENUM.FROST_DUNGEON] = function(rspCallback)
    ld("FrostDungeon")
    FrostDungeonService.GetFrostDungeonInfoReq(rspCallback)
  end,
  [FEATURE_ENUM.ADVENTURE_ROGUE] = {
    [1] = function(rspCallback)
      ld("Rogue")
      RogueService.GetRogueInfoReq(rspCallback)
    end,
    [2] = function(rspCallback)
      ld("Rogue")
      RogueService.GetCycleTaskInfoReq(rspCallback)
    end
  }
}

function AbyssActivityWindow.UpdateInfo()
  uis.Main.ActivityTips.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.AbyssActivityWindow.name)
  end)
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.AbyssActivityWindow.name)
  end)
  pages = {}
  local panel = uis.Main.ActivityTips
  local tablist = panel.TabList
  local titlelist = panel.TitleList
  tablist.defaultItem = "ui://Abyss/ActivityTabBtn"
  titlelist.defaultItem = "ui://Abyss/ActivityTitleBtn"
  local configTbl = TableData.GetTable("BaseManorGoTo")
  for _, conf in pairs(configTbl) do
    local g_id = conf.group_id
    local index = 0
    for i, v in pairs(pages) do
      if v.groupId == g_id then
        index = i
        break
      end
    end
    local page, entries
    if 0 == index then
      entries = {}
      page = {groupId = g_id, entries = entries}
      table.insert(pages, page)
    else
      page = pages[index]
      entries = page.entries
    end
    local regions = {}
    for _, v in pairs(conf.map_sub_id) do
      table.insert(regions, v)
    end
    local categories = {}
    for _, v in pairs(conf.event_type) do
      local splits = Split(v, ":")
      table.insert(categories, {
        type = tonumber(splits[1]),
        subtype = tonumber(splits[2])
      })
    end
    table.insert(entries, {
      id = conf.id,
      regions = regions,
      categories = categories,
      sort = conf.sort
    })
  end
  for i, page in pairs(pages) do
    table.sort(page.entries, function(x, y)
      return x.sort < y.sort
    end)
  end
  
  function tablist.itemRenderer(j, tab)
    if selectedPage then
      local entries = selectedPage.entries
      local tabIndex = j + 1
      local entry = entries[tabIndex]
      local conf = TableData.GetConfig(entry.id, "BaseManorGoTo")
      local name = conf.name()
      local name_english = conf.name_english()
      local e_type_str = conf.event_type[1]
      local splits = Split(e_type_str, ":")
      local e_type = tonumber(splits[1])
      local timeTxt = tab:GetChild("TimeTxt")
      if e_type == AbyssExploreEventID.FROST_DUNGEON or e_type == AbyssExploreEventID.BUILDING then
        local open, startTimestamp, endTimestamp = AbyssExploreMgr.EventFeatureIsOpen(e_type)
        if open then
          timeTxt.text = string.format("%s-%s", TimeUtil.FormatDate("%m.%d", startTimestamp), TimeUtil.FormatDate("%m.%d", endTimestamp))
        end
        ChangeUIController(tab, "c1", open and 1 or 0)
      else
        ChangeUIController(tab, "c1", 0)
      end
      UIUtil.SetText(tab:GetChild("AbyssSign"), T(20251), "WordTxt")
      UIUtil.SetText(tab, name, "NameTxt")
      UIUtil.SetText(tab, name_english, "SubtitleTxt")
      tab.onClick:Set(function()
        if selectedTabIndex ~= tabIndex then
          SetTab(tabIndex)
        end
      end)
    end
  end
  
  function titlelist.itemRenderer(i, title)
    local pageIndex = i + 1
    local nameId = 20118 + (2 * i + 1)
    local subNameId = nameId + 1
    UIUtil.SetText(title, T(nameId), "NameTxt")
    UIUtil.SetText(title, T(subNameId), "SubtitleTxt")
    title.onClick:Set(function()
      if selectedPageIndex ~= pageIndex then
        SetPageAndTab(pageIndex, 1, true)
      end
    end)
  end
  
  local numPages = #pages
  titlelist.numItems = numPages
  if numPages < 2 then
    for i = 1, numPages do
      local child = titlelist:GetChildAt(i - 1)
      child.visible = false
    end
  end
  defaultSelectedPage = 1
  defaultSelectedTab = 1
  if defaultTabType then
    for i, page in pairs(pages) do
      local index = false
      for j, entry in pairs(page.entries) do
        for _, category in pairs(entry.categories) do
          if category.type == defaultTabType then
            index = j
            break
          end
        end
        if index then
          break
        end
      end
      if index then
        defaultSelectedPage = i
        defaultSelectedTab = index
      end
    end
  end
  local requirelist = {}
  for k, callback in pairs(PRE_REQUIRE_FEATURES) do
    if EnterClampUtil.WhetherToEnter(k, false) then
      if type(callback) == "function" then
        table.insert(requirelist, callback)
      elseif "table" == type(callback) then
        for _, v in pairs(callback) do
          table.insert(requirelist, v)
        end
      end
    end
  end
  local cnt = #requirelist
  if cnt > 0 then
    local progress = 0
    for _, callback in ipairs(requirelist) do
      callback(function()
        progress = progress + 1
        if progress >= cnt then
          SetPageAndTab(defaultSelectedPage, defaultSelectedTab, true)
        end
      end)
    end
  else
    SetPageAndTab(defaultSelectedPage, defaultSelectedTab, true)
  end
end

function AbyssActivityWindow.InitBtn()
end

function AbyssActivityWindow.OnShown()
  if UIMgr:IsShowFromHide(WinResConfig.AbyssActivityWindow.name) then
    showFromHide = true
    SetPageAndTab(selectedPageIndex, selectedTabIndex)
    RedDotMgr.UpdateNodeByWindowName(WinResConfig.AbyssActivityWindow.name)
  end
  showFromHide = false
end

function AbyssActivityWindow.OnClose()
  uis = nil
  contentPane = nil
  if bossTips then
    bossTips:Dispose()
  end
  bossTips = nil
  selectedTabIndex = nil
  selectedPageIndex = nil
  selectedBossIndex = nil
  selectedSubtabIndex = nil
  bosses = nil
  eventsBuffer = nil
  selectedEntry = nil
  showFromHide = nil
  if timer then
    timer:stop()
  end
  timer = nil
  wait = false
  RedDotMgr.RemoveNode(WinResConfig.AbyssActivityWindow.name)
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.AbyssWindow.name)
end

return AbyssActivityWindow
