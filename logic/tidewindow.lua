require("TideDungeon_TideWindowByName")
local TideWindow = {}
local uis, contentPane, curDungeonType
local TAB_DUNGEON_TYPE = {
  ProtoEnum.SCENE_TYPE.MANOR_WATER,
  ProtoEnum.SCENE_TYPE.MANOR_FIR,
  ProtoEnum.SCENE_TYPE.MANOR_WOOD
}
local RefreshTablist, RefreshStages, RefreshPanelInfo
local GetStages = function()
  local info = TideDungeonData.GetTideDungeonInfo(curDungeonType)
  local conf = TableData.GetConfig(info.currentChapter, "BaseChapter")
  local stages = conf.stages
  return stages
end
local StageItemRenderer = function(i, gcmp)
  local stages = GetStages()
  local stageIndex = i + 1
  local stageId = stages[stageIndex]
  local info = TideDungeonData.GetTideDungeonInfo(curDungeonType)
  local conf = TableData.GetConfig(stageId, "BaseStage")
  local cleared = 0 == info.currentStage
  local latestIndex = cleared and 4 or table.keyof(stages, info.currentStage) or 0
  local child = gcmp:GetChild("TideTips")
  child.alpha = 0
  PlayUITrans(gcmp, "up", nil, i * 0.08)
  if i < #stages then
    LeanTween.delayedCall((i + 1) * 0.08, function()
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_role_card_move_dual")
    end)
  end
  local loader = child:GetChild("PicLoader")
  loader.url = UIUtil.GetResUrl(conf.icon)
  local titleText = conf.name_detail()
  local lockText = T(20322)
  local numberText = conf.name()
  local completeText = T(20323)
  local passed = stageIndex < latestIndex
  local timestamp = LoginData.GetCurServerTime()
  local locked = stageIndex > latestIndex or timestamp < info.sceneOpenStamp or timestamp > info.sceneCloseStamp
  ChangeUIController(child, "c1", passed and 0 or locked and 2 or 1)
  UIUtil.SetText(child, titleText, "WordTxt")
  UIUtil.SetText(child, numberText, "NumberTxt")
  UIUtil.SetText(child:GetChild("TideLock"), lockText, "WordTxt")
  UIUtil.SetText(child:GetChild("TideComplete"), completeText, "WordTxt")
  child.onClick:Set(function()
    if locked then
      if stageIndex > latestIndex then
        FloatTipsUtil.ShowWarnTips(T(20293))
      end
      return
    end
    if LoginData.GetCurServerTime() > info.sceneCloseStamp then
      RefreshTablist(table.keyof(TAB_DUNGEON_TYPE, curDungeonType))
      return
    end
    if stageIndex == latestIndex then
      OpenWindow(WinResConfig.TideDungeonTipsWindow.name, nil, stageId, curDungeonType)
    elseif stageIndex > latestIndex then
      FloatTipsUtil.ShowWarnTips(T(20293))
    else
      FloatTipsUtil.ShowWarnTips(T(10219))
    end
  end)
end

function RefreshStages()
  local panel = uis.Main.TideRegion
  local list = panel.TipsList
  local stages = GetStages()
  list.itemRenderer = StageItemRenderer
  list.numItems = #stages
end

function RefreshTablist(selectedIndex)
  if selectedIndex <= 0 then
    return
  end
  local tablist = uis.Main.TideRegion.TabRegion.TabList
  tablist.selectedIndex = selectedIndex - 1
  tablist.numItems = #TAB_DUNGEON_TYPE
  local dungeonType = TAB_DUNGEON_TYPE[selectedIndex]
  local info = TideDungeonData.GetTideDungeonInfo(dungeonType)
  local conf = TableData.GetConfig(info.currentChapter, "BaseChapter")
  local titleText = conf.name and conf.name() or string.format("未配置章节名%s", tostring(info.currentChapter))
  local panel = uis.Main.TideRegion
  if info.inOpenTime then
    local diff = info.sceneCloseStamp - LoginData.GetCurServerTime()
    local deadlineText = TimeUtil.FormatEnTime(diff)
    local timeText = T(20092, deadlineText)
    panel.Time.WordTxt.text = timeText
  else
    local diff = info.sceneOpenStamp - LoginData.GetCurServerTime()
    local timeText = T(20333, TimeUtil.FormatEnTime(diff))
    panel.Time.WordTxt.text = timeText
  end
  panel.Title.TitleTxt.text = titleText
  panel.Title.c1Ctr.selectedIndex = dungeonType - 61
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(conf.back_ground)
  curDungeonType = dungeonType
  RefreshStages()
end

local TabItemRenderer = function(i, gcmp)
  local dungeonType = TAB_DUNGEON_TYPE[i + 1]
  local info = TideDungeonData.GetTideDungeonInfo(dungeonType)
  local conf = TableData.GetConfig(info.currentChapter, "BaseChapter")
  local name = conf.name and conf.name() or string.format("未配置章节名%s", tostring(info.currentChapter))
  local lockTxt = gcmp:GetChild("LockTxt")
  local nameTxt = gcmp:GetChild("NameTxt")
  local numberTxt = gcmp:GetChild("NumberTxt")
  local inOpenTime = info.inOpenTime
  if not inOpenTime then
    local serverTimestamp = LoginData.GetCurServerTime()
    local diff = info.sceneOpenStamp - serverTimestamp
    local tipsText = T(20333, TimeUtil.FormatEnTime(diff))
    lockTxt.text = tipsText
  else
    local chapterConf = TableData.GetConfig(info.currentChapter, "BaseChapter")
    local stages = chapterConf.stages
    local cleared = 0 == info.currentStage
    local latestIndex = table.keyof(stages, info.currentStage)
    local numStages = #stages
    numberTxt.text = string.format("%s/%s", cleared and numStages or latestIndex - 1, numStages)
  end
  ChangeUIController(gcmp, "c2", inOpenTime and 0 or 1)
  ChangeUIController(gcmp, "c1", dungeonType - 61)
  nameTxt.text = name
  UIUtil.SetTagButtonSwitch(gcmp, uis.Main.TideRegion.root:GetTransition("up"), function()
    local serverTimestamp = LoginData.GetCurServerTime()
    local diff = info.sceneOpenStamp - serverTimestamp
    if diff <= 0 then
      return true
    end
    local tipsText = T(20333, TimeUtil.FormatEnTime(diff))
    FloatTipsUtil.ShowWarnTips(tipsText)
  end, function()
    if info.inOpenTime then
      RefreshTablist(i + 1)
    else
      local serverTimestamp = LoginData.GetCurServerTime()
      local diff = info.sceneOpenStamp - serverTimestamp
      if diff <= 0 then
        TideDungeonService.GetTideDungeonInfoReq(AbyssTideDungeon, function()
          RefreshPanelInfo()
        end)
        return
      end
      local tipsText = T(20333, TimeUtil.FormatEnTime(diff))
      FloatTipsUtil.ShowWarnTips(tipsText)
    end
  end)
end
local timer

function RefreshPanelInfo()
  local tablist = uis.Main.TideRegion.TabRegion.TabList
  tablist.itemRenderer = TabItemRenderer
  tablist.numItems = #TAB_DUNGEON_TYPE
  local index = 1
  for i, v in ipairs(TAB_DUNGEON_TYPE) do
    local info = TideDungeonData.GetTideDungeonInfo(v)
    local inOpenTime = info.inOpenTime
    if inOpenTime and info.currentStage > 0 then
      index = i
      break
    end
  end
  local minOpenTimestamp
  for _, v in ipairs(TAB_DUNGEON_TYPE) do
    local info = TideDungeonData.GetTideDungeonInfo(v)
    local inOpenTime = info.inOpenTime
    if not inOpenTime then
      if not minOpenTimestamp then
        minOpenTimestamp = info.sceneOpenStamp
      else
        minOpenTimestamp = math.min(info.sceneOpenStamp, minOpenTimestamp)
      end
    end
  end
  if minOpenTimestamp then
    if timer then
      timer:stop()
    end
    timer = TimerUtil.setInterval(1, -1, function()
      local diff = minOpenTimestamp - LoginData.GetCurServerTime()
      if diff <= 0 then
        TideDungeonService.GetTideDungeonInfoReq(AbyssTideDungeon, function()
          RefreshPanelInfo()
        end)
        timer:stop()
      end
    end)
    timer:start()
  end
  RefreshTablist(index)
end

function TideWindow.ReInitData()
end

function TideWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.TideWindow.package, WinResConfig.TideWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetTideDungeon_TideWindowUis(contentPane)
    TideWindow.UpdateInfo()
    TideWindow.InitBtn()
  end)
end

function TideWindow.UpdateInfo()
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.TideWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.TIDE_DUNGEON)
  RefreshPanelInfo()
  RedDotMgr.AddNode({
    windowName = WinResConfig.TideWindow.name,
    com = uis.Main.TideRegion.RewardBtn,
    visibleFunc = function()
      return RedDotAbyss.TideDungeonHasAnyRewards()
    end,
    dataType = RED_DOT_DATA_TYPE.ABYSS
  })
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.TideWindow.name)
end

function TideWindow.InitBtn()
  uis.Main.TideRegion.RewardBtn.onClick:Set(function()
    OpenWindow(WinResConfig.TideRewardWindow.name, nil, curDungeonType)
  end)
end

function TideWindow.OnShown()
  if UIMgr:IsShowFromHide(WinResConfig.TideWindow.name) then
    RefreshStages()
    RefreshTablist(table.keyof(TAB_DUNGEON_TYPE, curDungeonType))
    RedDotMgr.UpdateNodeByWindowName(WinResConfig.TideWindow.name)
  end
end

function TideWindow.OnClose()
  uis = nil
  contentPane = nil
  RedDotMgr.RemoveNode(WinResConfig.TideWindow.name)
  if timer then
    timer:stop()
  end
  timer = nil
end

return TideWindow
