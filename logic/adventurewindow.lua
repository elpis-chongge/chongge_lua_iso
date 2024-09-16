require("Adventure_AdventureWindowByName")
local AdventureWindow = {}
local uis, chapterId, chapterData, chapterTypeMap, contentPane, isFirst, trans, jumpTb
local lastIndex = 0
local dailyDungeonData, arenaTempDay
local effectPath = {
  [AdventureType.ARENA] = "Assets/Art/Effects/Prefab/UI_prefab/Adventuredoor/FX_ui_adventuredoor_battleground.prefab",
  [AdventureType.STORY_ADVENTURE] = "Assets/Art/Effects/Prefab/UI_prefab/Adventuredoor/FX_ui_adventuredoor_adventure.prefab",
  [AdventureType.EXPERIMENT] = "Assets/Art/Effects/Prefab/UI_prefab/Adventuredoor/FX_ui_adventuredoor_itemcollet.prefab",
  [AdventureType.TOWER] = "Assets/Art/Effects/Prefab/UI_prefab/Adventuredoor/FX_ui_adventuredoor_pata.prefab",
  [AdventureType.RAID_BOSS] = "Assets/Art/Effects/Prefab/UI_prefab/SoloBosschallenge/FX_ui_back_solobosschallenge.prefab"
}
local bgEffect = {}

function AdventureWindow.OnInit(bridgeObj)
  chapterId = bridgeObj.argTable[1]
  bridgeObj:SetViewAsync(WinResConfig.AdventureWindow.package, WinResConfig.AdventureWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAdventure_AdventureWindowUis(contentPane)
    AdventureWindow.InitData()
    trans = uis.Main.root:GetTransition("up")
    if trans then
      trans:SetHook("Switch", AdventureWindow.ChangePage)
    end
    AdventureWindow.InitBtn()
    AdventureWindow.InitList()
    isFirst = true
    uis.Main.TabRegion.c1Ctr.selectedIndex = AdventureMgr.curType - 1
    lastIndex = AdventureMgr.curType
    if AdventureMgr.curType == AdventureType.RAID_BOSS or AdventureMgr.curType == AdventureType.ARENA then
      AdventureWindow.GetSceneInfoReq()
    else
      AdventureWindow.RefreshMapList()
    end
    AdventureWindow.InitRedDot()
    SoundUtil.PlayHomeMusic()
  end)
end

function AdventureWindow.InitRedDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.AdventureWindow.name,
    com = uis.Main.TabRegion.Tab4Btn,
    visibleFunc = function()
      return RedDotArena.ShowHome()
    end,
    dataType = RED_DOT_DATA_TYPE.ADVENTURE
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.AdventureWindow.name,
    com = uis.Main.TabRegion.Tab1Btn,
    visibleFunc = function()
      return RedDotPlotDungeon.ShowHome()
    end,
    dataType = RED_DOT_DATA_TYPE.ADVENTURE
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.AdventureWindow.name,
    com = uis.Main.TabRegion.Tab3Btn,
    visibleFunc = function()
      return RedDotTower.ShowHome()
    end,
    dataType = RED_DOT_DATA_TYPE.ADVENTURE
  })
  AdventureWindow.ShowSeasonTime()
  AdventureWindow.ShowTowerNew()
end

function AdventureWindow.InitList()
  chapterTypeMap = {}
  bgEffect = {}
  for i, v in ipairs(chapterData) do
    local resStrTable = Split(v.map_path, ":")
    if resStrTable and #resStrTable > 1 then
      local map = UIMgr:CreateObject(resStrTable[1], resStrTable[2])
      map:SetSize(uis.Main.Content.root.width, uis.Main.Content.root.height)
      chapterTypeMap[i] = map
      local type = v.show_type + 1
      if type == AdventureType.STORY_ADVENTURE then
        AdventureWindow.RefreshStoryMapItem(map, v, i)
      elseif type == AdventureType.EXPERIMENT then
        AdventureWindow.RefreshDailyDungeonMapItem(map, v)
      elseif type == AdventureType.TOWER then
        AdventureWindow.RefreshTowerMapItem(map, v)
      elseif type == AdventureType.ARENA then
        AdventureWindow.RefreshArenaMapItem(map, v)
      elseif type == AdventureType.RAID_BOSS then
        AdventureWindow.RefreshRaidBossItem(map, v)
      end
      uis.Main.Content.root:AddChild(map)
      map.name = map.gameObjectName
      if 1 ~= i then
        chapterTypeMap[i].visible = false
      end
    end
  end
end

function AdventureWindow.TabOnClick(data)
  AdventureMgr.dataType = data.type
  AdventureWindow.GetSceneInfoReq()
end

function AdventureWindow.InitData()
  chapterData = {}
  local config = TableData.GetTable("BaseAdventure")
  for i, v in pairs(config) do
    if v.map_path then
      table.insert(chapterData, v)
    end
  end
  table.sort(chapterData, function(a, b)
    return a.sort < b.sort
  end)
end

function AdventureWindow.GetSceneInfoReq()
  if AdventureMgr.dataType[1] == ProtoEnum.SCENE_TYPE.ARENA then
    ld("Arena", function()
      ArenaService.ArenaGetAllReq()
    end)
  elseif AdventureMgr.dataType[1] == ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE then
    ld("RaidBoss", function()
      RaidBossService.GetRaidBossInfoReq()
    end)
  else
    AdventureService.GetSceneInfoReq(AdventureMgr.dataType)
  end
end

local GetCtrPage = function(type)
  if type == ProtoEnum.SCENE_TYPE.MAIN_LINE then
    uis.Main.TabRegion.c1Ctr.selectedIndex = 0
  elseif type == ProtoEnum.SCENE_TYPE.CLIMB_TOWER then
    uis.Main.TabRegion.c1Ctr.selectedIndex = 2
  elseif type == ProtoEnum.SCENE_TYPE.ARENA then
    uis.Main.TabRegion.c1Ctr.selectedIndex = 3
  elseif type == ProtoEnum.SCENE_TYPE.DAILY_COIN or type == ProtoEnum.SCENE_TYPE.DAILY_MATERIAL or type == ProtoEnum.SCENE_TYPE.DAILY_SKILL_BOOK or type == ProtoEnum.SCENE_TYPE.DAILY_ROLE_EXP or type == ProtoEnum.SCENE_TYPE.DAILY_BADGE_EXP then
    uis.Main.TabRegion.c1Ctr.selectedIndex = 1
  end
end

function AdventureWindow.RefreshMapList(type)
  local bol = uis.Main.TabRegion.c1Ctr.selectedIndex + 1 == AdventureMgr.curType
  local index = AdventureMgr.curType
  if type then
    GetCtrPage(type)
    index = uis.Main.TabRegion.c1Ctr.selectedIndex + 1
    AdventureMgr.curType = index
  else
    uis.Main.TabRegion.c1Ctr.selectedIndex = AdventureMgr.curType - 1
  end
  if isFirst then
    isFirst = false
    AdventureWindow.ChangePage()
  else
    if bol then
      AdventureWindow.ShowPlotTag()
      return
    end
    trans:Play()
  end
end

function AdventureWindow.ChangePage()
  if nil == uis then
    return
  end
  local index = uis.Main.TabRegion.c1Ctr.selectedIndex + 1
  AdventureWindow.ShowMap(index)
  if index == AdventureType.STORY_ADVENTURE then
    if chapterData then
      AdventureWindow.RefreshManBar(chapterData[index].type, index)
      AdventureWindow.ShowPlotTag()
    end
  elseif index == AdventureType.EXPERIMENT then
    AdventureWindow.RefreshExperimentInfo(index)
  elseif index == AdventureType.TOWER then
    AdventureWindow.RefreshTowerInfo(index)
  elseif index == AdventureType.ARENA then
    AdventureWindow.RefreshArenaInfo(index)
  elseif index == AdventureType.RAID_BOSS then
    AdventureWindow.RefreshRaidBossInfo(index)
  end
end

function AdventureWindow.RefreshManBar(type, index)
  AdventureWindow.LoadBgEffect(AdventureType.STORY_ADVENTURE, index)
  local title = chapterTypeMap[index]:GetChild("PlotTitle")
  local info = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
  if title then
    local data = TableData.GetConfig(info.currentChapter, "BaseChapter")
    if data then
      UIUtil.SetText(title, data.name_detail(), "NameTxt")
      if data.chapter_english then
        UIUtil.SetText(title, data.chapter_english(), "SubtitleTxt")
      end
      UIUtil.SetText(title, data.des(), "WordTxt")
    end
  end
  AdventureWindow.ShowPlotTag()
end

function AdventureWindow.ShowPlotTag()
  local chapterId = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.PLOT_ANIM_CHAPTER_OPEN)
  local screenInfo = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
  if 0 ~= chapterId and chapterId < screenInfo.currentChapter then
    ChangeUIController(uis.Main.TabRegion.Tab1Btn, "PlotDungeon", 1)
    local tempChapterData = TableData.GetConfig(screenInfo.currentChapter, "BaseChapter")
    if tempChapterData then
      local numName = tempChapterData.name()
      if numName then
        UIUtil.SetText(uis.Main.TabRegion.Tab1Btn:GetChild("PlotDungeon"), T(1314, numName), "WordTxt")
      end
    end
  else
    ChangeUIController(uis.Main.TabRegion.Tab1Btn, "PlotDungeon", 0)
  end
end

function AdventureWindow.RefreshTowerInfo(index)
  AdventureWindow.LoadBgEffect(AdventureType.TOWER, index)
  local info = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.CLIMB_TOWER)
  if info and info.currentChapter and info.currentStage then
    local towerProgress = chapterTypeMap[index]:GetChild("TowerProgress")
    if 0 == info.currentStage then
      ChangeUIController(chapterTypeMap[index], "c1", 0)
    else
      UIUtil.SetText(towerProgress, AdventureWindow.GetTowerDes(info.currentChapter), "NumberTxt")
    end
  end
end

function AdventureWindow.ShowTowerNew()
  local info = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.CLIMB_TOWER)
  if info then
    local chapterId = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.TOWER_CHAPTER_OPEN)
    if 0 ~= chapterId and chapterId < info.currentChapter then
      ChangeUIController(uis.Main.TabRegion.Tab3Btn, "Tower", 1)
      local tempChapterData = TableData.GetConfig(info.currentChapter, "BaseChapter")
      if tempChapterData then
        local numName = tempChapterData.rate_name()
        if numName then
          UIUtil.SetText(uis.Main.TabRegion.Tab3Btn:GetChild("Tower"), T(1315, numName), "WordTxt")
        end
      end
    end
  end
end

function AdventureWindow.GetTowerDes(id)
  local map = TableData.GetTable("BaseTowerMap")
  for i, v in pairs(map) do
    if table.contain(v.chapter_id, id) then
      return v.des()
    end
  end
  return ""
end

function AdventureWindow.GetDailyDungeonData()
  local tb = TableData.GetTable("BaseDailyDungeon")
  local data = {}
  for i, v in pairs(tb) do
    table.insert(data, v)
  end
  table.sort(data, function(a, b)
    return a.sort < b.sort
  end)
  return data
end

function AdventureWindow.RefreshExperimentInfo(index)
  AdventureWindow.LoadBgEffect(AdventureType.EXPERIMENT, index)
  local list = chapterTypeMap[index]:GetChild("DailyTypeList")
  if nil == dailyDungeonData then
    dailyDungeonData = AdventureWindow.GetDailyDungeonData()
  end
  local data
  
  function list.itemRenderer(i, item)
    data = dailyDungeonData[i + 1]
    if data then
      local info = AdventureData.GetSceneData(data.type)
      if info then
        ChangeUIController(item, "c1", data.type - 11)
        if info.unlocked and info.inOpenTime then
          ChangeUIController(item, "c2", 1)
        else
          ChangeUIController(item, "c2", 0)
        end
      end
    end
  end
  
  list.numItems = #dailyDungeonData
end

function AdventureWindow.ShowMap(index)
  if chapterTypeMap then
    for i = 1, #chapterTypeMap do
      if i == index then
        chapterTypeMap[i].visible = true
      else
        chapterTypeMap[i].visible = false
      end
    end
  end
end

function AdventureWindow.RefreshArenaInfo(index)
  AdventureWindow.LoadBgEffect(AdventureType.ARENA, index)
  local startBtn = chapterTypeMap[index]:GetChild("ArenaStartBtn")
  local curTime = LoginData.GetCurServerTime()
  if startBtn then
    startBtn.onClick:Set(function()
      AdventureWindow.ItemClick()
      if arenaTempDay then
        PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ARENA_DAY, arenaTempDay)
      end
    end)
  end
  UIUtil.SetText(chapterTypeMap[index]:GetChild("ArenaRank"), ArenaMgr.GetRank(), "NumbrTxt")
  ChangeUIController(chapterTypeMap[index], "c1", 1)
  local time = chapterTypeMap[index]:GetChild("ArenaTime")
  local ShowTime = function()
    local down = math.floor(ArenaData.Info.seasonEndTime - curTime)
    printWarning("uin:", ActorData.GetUin(), ">>>剩余时间:", down, "赛季结束时间:", ArenaData.Info.seasonEndTime, "当前时间:", curTime)
    if down > 0 then
      UIUtil.SetText(time, TimeUtil.FormatEnTime(down), "TimeTxt")
      ChangeUIController(time, "c1", 0)
    else
      UIUtil.SetText(time, T(370), "WordTxt")
      ChangeUIController(time, "c1", 1)
    end
  end
  if ArenaData.Info.seasonStat == ProtoEnum.ARENA_SEASON_STAT.DAILY_SETTLE or ArenaData.Info.seasonStat == ProtoEnum.ARENA_SEASON_STAT.SETTLE or ArenaData.Info.seasonStat == ProtoEnum.ARENA_SEASON_STAT.CLOSE then
    if curTime > ArenaData.Info.seasonEndTime and curTime < ArenaData.Info.seasonEndStartTime or ArenaData.Info.seasonStat == ProtoEnum.ARENA_SEASON_STAT.SETTLE then
      UIUtil.SetText(time, T(370), "WordTxt")
      ChangeUIController(time, "c1", 1)
    else
      ShowTime()
    end
  else
    ShowTime()
  end
  if ArenaData.Info.seasonStat == ProtoEnum.ARENA_SEASON_STAT.DAILY_SETTLE or ArenaData.Info.seasonStat == ProtoEnum.ARENA_SEASON_STAT.SETTLE or ArenaData.Info.seasonStat == ProtoEnum.ARENA_SEASON_STAT.OPEN then
    local down = math.floor(ArenaData.Info.seasonEndTime - curTime)
    if down <= 1 then
      printError("uin:", ActorData.GetUin(), ">>>剩余时间:", down, "赛季结束时间:", ArenaData.Info.seasonEndTime, "当前时间:", curTime)
    end
  end
  AdventureWindow.ShowSeasonTime()
end

function AdventureWindow.ShowSeasonTime()
  if ArenaData.Info == nil then
    return
  end
  local curTime = LoginData.GetCurServerTime()
  if ArenaData.Info.seasonStat ~= ProtoEnum.ARENA_SEASON_STAT.DAILY_SETTLE and ArenaData.Info.seasonStat ~= ProtoEnum.ARENA_SEASON_STAT.SETTLE and ArenaData.Info.seasonStat ~= ProtoEnum.ARENA_SEASON_STAT.CLOSE then
    local day = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ARENA_DAY)
    local showBtnTime = function(word)
      UIUtil.SetText(uis.Main.TabRegion.Tab4Btn:GetChild("ArenaTime"), word, "WordTxt")
      ChangeUIController(uis.Main.TabRegion.Tab4Btn, "ArenaTime", 1)
    end
    local down = ArenaData.Info.seasonEndTime - curTime
    local hours = math.ceil(math.floor(down) / 3600)
    if hours < 24 and hours > 0 then
      if 1 ~= day then
        arenaTempDay = 1
        showBtnTime(showBtnTime(T(1162, hours)))
      else
        ChangeUIController(uis.Main.TabRegion.Tab4Btn, "ArenaTime", 0)
      end
    elseif hours < 48 and hours > 0 then
      if 2 ~= day then
        arenaTempDay = 2
        showBtnTime(T(1161, 1))
      else
        ChangeUIController(uis.Main.TabRegion.Tab4Btn, "ArenaTime", 0)
      end
    elseif hours < 72 and hours > 0 then
      if 3 ~= day then
        arenaTempDay = 1
        showBtnTime(T(1161, 2))
      else
        ChangeUIController(uis.Main.TabRegion.Tab4Btn, "ArenaTime", 0)
      end
    else
      ChangeUIController(uis.Main.TabRegion.Tab4Btn, "ArenaTime", 0)
    end
  end
  local endTime = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.NEW_SEASON)
  if 0 ~= endTime and curTime > endTime then
    UIUtil.SetText(uis.Main.TabRegion.Tab4Btn:GetChild("ArenaNewSeason"), T(1163), "WordTxt")
    ChangeUIController(uis.Main.TabRegion.Tab4Btn, "ArenaNewSeason", 1)
    return
  end
  ChangeUIController(uis.Main.TabRegion.Tab4Btn, "ArenaNewSeason", 0)
end

function AdventureWindow.RefreshRaidBossInfo(index)
  local conf = RaidBossMgr.GetCurrentRaidBossConfig()
  local map = chapterTypeMap[index]:GetChild("PicMap")
  if map then
    local holder = map:GetChild("PicHolder")
    if holder then
      holder:SetPivot(0.5, 0.5, true)
      holder:Center()
      UIUtil.SetEffectToUI(conf.cover_effect_path, holder)
    end
  end
  local panel = chapterTypeMap[index]
  local time = panel:GetChild("RaidBossTime")
  local notopen = panel:GetChild("RaidBossUnopen")
  UIUtil.SetText(panel, T(20483), "WordTxt")
  local data = RaidBossData.GetRaidBossData()
  local serverTimestamp = LoginData.GetCurServerTime()
  local inProgress = true
  if serverTimestamp > data.endStamp and serverTimestamp < data.nextStartStamp then
    inProgress = false
  end
  ChangeUIController(panel, "c1", inProgress and 1 or 2)
  if inProgress then
    local deadline = RaidBossData.GetDeadline()
    local timestamp = LoginData.GetCurServerTime()
    local remainTxt = TimeUtil.FormatEnTime(deadline - timestamp)
    UIUtil.SetText(time, T(20340, remainTxt), "TimeTxt")
  else
    local diff = data.nextStartStamp - serverTimestamp
    UIUtil.SetText(notopen, T(20331, TimeUtil.FormatEnTime(diff)), "WordTxt")
  end
end

function AdventureWindow.LoadBgEffect(type, index)
  if nil == bgEffect[type] then
    local map = chapterTypeMap[index]:GetChild("PicMap")
    if map then
      local holder = map:GetChild("PicHolder")
      if holder then
        holder:SetPivot(0.5, 0.5, true)
        holder:Center()
        UIUtil.SetEffectToUI(effectPath[type], holder)
        bgEffect[type] = true
      end
    end
  end
end

function AdventureWindow.InitMapInfo(map, data, titleName, startName)
  local title = map:GetChild(titleName)
  if title then
    title:GetChild("NameTxt").text = data.page_name()
    title:GetChild("SubtitleTxt").text = data.page_name_detail()
    title:GetChild("WordTxt").text = data.des()
  end
  local startBtn = map:GetChild(startName)
  if startBtn then
    startBtn.onClick:Set(function()
      AdventureWindow.ItemClick()
    end)
  end
end

function AdventureWindow.RefreshDailyDungeonMapItem(map, data)
  AdventureWindow.InitMapInfo(map, data, "DailyTitle", "DailyStartBtn")
end

function AdventureWindow.RefreshTowerMapItem(map, data)
  AdventureWindow.InitMapInfo(map, data, "TowerTitle", "TowerStartBtn")
  ChangeUIController(map, "c1", 1)
end

function AdventureWindow.RefreshArenaMapItem(map, data)
  AdventureWindow.InitMapInfo(map, data, "ArenaTitle", "ArenaStartBtn")
  local rankCom = map:GetChild("ArenaRank")
  UIUtil.SetText(rankCom, T(921), "WordTxt")
end

function AdventureWindow.RefreshStoryMapItem(map)
  local startBtn = map:GetChild("PlotStartBtn")
  if startBtn then
    startBtn.onClick:Set(function()
      AdventureWindow.ItemClick()
    end)
  end
end

function AdventureWindow.RefreshRaidBossItem(map)
  local startBtn = map:GetChild("RaidBossStartBtn")
  if startBtn then
    startBtn.onClick:Set(AdventureWindow.ItemClick)
  end
  ld("RaidBoss", function()
    local unlock = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_RAID, false)
    if unlock then
      RaidBossService.GetRaidBossInfoReq(function()
        local nearlyDeadline, diff = RedDotRaidBoss.IsNearlyDeadline()
        local tips = uis.Main.TabRegion.Tab5Btn:GetChild("RaidBoss")
        RedDotMgr.AddNode({
          windowName = WinResConfig.AdventureWindow.name,
          com = uis.Main.TabRegion.Tab5Btn,
          visibleFunc = function()
            return RedDotRaidBoss.TodayHasChallengeCount() or RedDotRaidBoss.HasAnyRewards()
          end,
          dataType = RED_DOT_DATA_TYPE.ADVENTURE
        })
        RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ADVENTURE)
        if RaidBossMgr.IsInProgress() then
          if nearlyDeadline then
            local content = diff > 86400 and T(20339) or T(20338)
            UIUtil.SetText(tips, content, "WordTxt")
            ChangeUIController(uis.Main.TabRegion.Tab5Btn, "RaidBoss", 1)
            ChangeUIController(tips, "c1", 1)
          elseif RedDotRaidBoss.IsNewSeason() then
            UIUtil.SetText(tips, T(20308), "WordTxt")
            ChangeUIController(uis.Main.TabRegion.Tab5Btn, "RaidBoss", 1)
            ChangeUIController(tips, "c1", 0)
          end
        end
      end)
      return
    end
    ChangeUIController(uis.Main.TabRegion.Tab5Btn, "RaidBoss", 0)
  end)
end

function AdventureWindow.ItemClick()
  if AdventureMgr.curType == AdventureType.STORY_ADVENTURE then
    AdventureMgr.EnterPlotMain()
    OpenWindow(WinResConfig.PlotDungeonWindow.name)
  elseif AdventureMgr.curType == AdventureType.EXPERIMENT then
    OpenWindow(WinResConfig.DailyDungeonWindow.name)
  elseif AdventureMgr.curType == AdventureType.TOWER then
    OpenWindow(WinResConfig.TowerListWindow.name)
  elseif AdventureMgr.curType == AdventureType.ARENA then
    if BlockInTestPackage() then
      return
    end
    if ArenaData.Info then
      OpenWindow(WinResConfig.ArenaWindow.name)
    end
  elseif AdventureMgr.curType == AdventureType.RAID_BOSS then
    OpenWindow(WinResConfig.RaidBossWindow.name)
  end
end

function AdventureWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.AdventureWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_ADVENTURE)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Adventuredoor/FX_ui_adventuredoor_blackpar.prefab", uis.Main.EffectHolder)
  local tab = uis.Main.TabRegion
  local tb = {
    tab.Tab1Btn,
    tab.Tab2Btn,
    tab.Tab3Btn,
    tab.Tab4Btn,
    tab.Tab5Btn
  }
  for i = 1, #tb do
    UIUtil.SetBtnText(tb[i], chapterData[i].name(), chapterData[i].name_detail())
    tb[i].soundFmod = nil
    tb[i].changeStateOnClick = false
    if EnterClampUtil.WhetherToEnter(chapterData[i].feature_id, false) then
      ChangeUIController(tb[i], "c1", 0)
    else
      ChangeUIController(tb[i], "c1", 1)
    end
    tb[i].onClick:Set(function()
      if EnterClampUtil.WhetherToEnter(chapterData[i].feature_id) and lastIndex ~= i then
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.TAB_TAG_BOTTOM)
        AdventureMgr.curType = chapterData[i].show_type + 1
        lastIndex = i
        AdventureWindow.TabOnClick(chapterData[i])
      end
    end)
  end
end

function AdventureWindow.RefreshMapUnlockUI()
  for i, v in ipairs(chapterData) do
    local resStrTable = Split(v.map_path, ":")
    if resStrTable and #resStrTable > 1 then
      AdventureWindow.RefreshStoryMapItem(chapterTypeMap[i], v)
    end
  end
end

function AdventureWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Adventure.REFRESH_MAP then
    AdventureWindow.RefreshMapList(para)
  elseif msgId == WindowMsgEnum.Adventure.REFRESH_BOSS_MAP and AdventureMgr.curType == AdventureType.RAID_BOSS then
    AdventureWindow.RefreshMapList(para)
  end
end

function AdventureWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.AdventureWindow.name)
  uis = nil
  trans = nil
  bgEffect = nil
  isFirst = nil
  dailyDungeonData = nil
  lastIndex = nil
  chapterId = nil
  chapterData = nil
  chapterTypeMap = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return AdventureWindow
