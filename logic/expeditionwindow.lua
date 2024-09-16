require("Expedition_ExpeditionWindowByName")
local ExpeditionWindow = {}
local uis, contentPane
local bg_fx_path = "Assets/Art/Effects/Prefab/UI_prefab/Bosschallenge/FX_ui_Bosschallenge_opbg.prefab"
local LoadBgEffect = function(holder)
  local o = ResourceManager.Instantiate(bg_fx_path)
  holder.pivot = Vector2(0.5, 0.5)
  UIUtil.SetObjectToUI(o, holder, 10000)
  o.transform.localPosition = Vector3.zero
end
local InitPanelText = function()
  local expedTitle = T(20040)
  local expedSubtitle = T(20041)
  local deadlineTips = T(20042)
  local panel = uis.Main.Expedition1
  UIUtil.SetText(panel.CoverTitle.root, expedTitle, "NameTxt")
  UIUtil.SetText(panel.CoverTitle.root, expedSubtitle, "SubtitleTxt")
  UIUtil.SetText(panel.CoverTime.root, deadlineTips, "TitleTxt")
end
local RefreshTips = function()
  MessageBox.Show(T(20080), {})
end
local UpdateRefreshTimeInfo = function(refreshTimestamp)
  local dateTxt = TimeUtil.FormatDate("%Y/%m/%d %H:%M", refreshTimestamp)
  local timezoneOffset = LoginData.timezoneOffset
  local sign = timezoneOffset >= 0 and "+" or "-"
  local timezoneStr = math.ceil(math.abs(timezoneOffset / 3600))
  dateTxt = string.format("%s%s", dateTxt, string.format("(UTC%s%s)", sign, timezoneStr))
  local diff = refreshTimestamp - LoginData.GetCurServerTime()
  local remainTxt = T(10218, TimeUtil.FormatTime(diff))
  local timePanel = uis.Main.Expedition1.CoverTime
  UIUtil.SetText(timePanel.root, dateTxt, "Time1Txt")
  UIUtil.SetText(timePanel.root, remainTxt, "Time2Txt")
end
local refreshTimer
local StartCheckRefreshTimer = function()
  if refreshTimer then
    refreshTimer:stop()
  end
  local nextRefreshStamp = ExpeditionData.GetData().nextRefreshStamp
  local count = math.ceil(nextRefreshStamp - LoginData.GetCurServerTime())
  if count > 0 then
    refreshTimer = TimerUtil.new(1, count, function()
      if LoginData.GetCurServerTime() > nextRefreshStamp then
        ExpeditionService.GetExpeditionInfoReq()
        refreshTimer:stop()
        return
      end
      UpdateRefreshTimeInfo(nextRefreshStamp)
    end)
    refreshTimer:start()
  else
    ExpeditionService.GetExpeditionInfoReq()
  end
end

function ExpeditionWindow.ReInitData()
end

function ExpeditionWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExpeditionWindow.package, WinResConfig.ExpeditionWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExpedition_ExpeditionWindowUis(contentPane)
    SoundUtil.PlayMusic(30006)
    ld("Expedition", function()
      if ExpeditionMgr.data_refresh then
        RefreshTips()
      end
      ExpeditionService.GetExpeditionInfoReq()
    end)
  end)
end

local InitRedDotData = function()
  RedDotMgr.AddNode({
    windowName = WinResConfig.ExpeditionWindow.name,
    com = uis.Main.Expedition1.RewardBtn,
    visibleFunc = function()
      return RedDotExped.HasAnyRewards()
    end,
    dataType = RED_DOT_DATA_TYPE.EXPED
  })
end

function ExpeditionWindow.InitWithData()
  PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ABYSS_GUIDE_EXPEDITION, 1)
  ExpeditionWindow.UpdateInfo()
  ExpeditionWindow.InitBtn()
  local expedData = ExpeditionData.GetData()
  UpdateRefreshTimeInfo(expedData.nextRefreshStamp)
  local passed = ExpeditionMgr.IsClearedThisTime()
  local timePanel = uis.Main.Expedition1.CoverTime
  if passed then
    timePanel.c1Ctr.selectedIndex = 1
    timePanel.EndTipsTxt.text = T(20055)
  else
    timePanel.c1Ctr.selectedIndex = 0
  end
  ExpeditionMgr.InitStageRecords()
  local startBtnTitle = T(20037)
  local reviewBtnTitle = T(20227)
  local chapterIndex, stageIndex = ExpeditionMgr.GetLatestChapterIndex()
  local started = chapterIndex > 1 or stageIndex > 1
  local startBtn = uis.Main.Expedition1.CoverStartBtn
  local challengeProgress = startBtn:GetChild("CoverProgress")
  UIUtil.SetBtnText(uis.Main.Expedition1.ReviewBtn, reviewBtnTitle)
  local continue = started and chapterIndex
  UIUtil.SetBtnText(startBtn, continue and T(20059) or startBtnTitle)
  if started and chapterIndex then
    ChangeUIController(startBtn, "c1", 1)
    challengeProgress.visible = true
    local chapterId = expedData.chapters[chapterIndex].chapterId
    local chapterConf = TableData.GetConfig(chapterId, "BaseChapter")
    local stageConf = TableData.GetConfig(chapterConf.stages[stageIndex], "BaseStage")
    UIUtil.SetText(challengeProgress, T(20054, stageConf.name()), "WordTxt")
  else
    ChangeUIController(startBtn, "c1", 0)
    challengeProgress.visible = false
  end
  startBtn.onClick:Set(function()
    ExpeditionMgr.restart_timeline_animator = true
    ExpeditionMgr.SetLastChapterIndex(nil)
    OpenWindow(WinResConfig.ExpeditionBattleChoiceWindow.name)
  end)
  local totalStars = ExpeditionMgr.GetAllStageStars()
  local rewardBtnTitle = string.format("[size=24][color=#ffcc00]%s[/color][/size]/%s", expedData.highPassStar, totalStars)
  UIUtil.SetBtnText(uis.Main.Expedition1.RewardBtn, rewardBtnTitle)
end

local jumpTb

function ExpeditionWindow.UpdateInfo()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ExpeditionWindow.name, uis.Main.Expedition1.CurrencyReturn, FEATURE_ENUM.ADVENTURE_DREAMLAND)
  InitPanelText()
  LoadBgEffect(uis.Main.Expedition1.BackGround.BackGroundHolder)
  InitRedDotData()
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.ExpeditionWindow.name)
  StartCheckRefreshTimer()
end

function ExpeditionWindow.InitBtn()
  local panel = uis.Main.Expedition1
  panel.RewardBtn.onClick:Set(function()
    OpenWindow(WinResConfig.ExpeditionRewardWindow.name)
  end)
  panel.ReviewBtn.onClick:Set(function()
    ExpeditionMgr.TryOpenExpeditionBattleReviewWindow()
  end)
end

function ExpeditionWindow.OnShown()
end

function ExpeditionWindow.OnHide()
end

function ExpeditionWindow.OnClose()
  uis = nil
  contentPane = nil
  if refreshTimer then
    refreshTimer:stop()
  end
  refreshTimer = nil
  if jumpTb then
    jumpTb.Close()
  end
  jumpTb = nil
end

function ExpeditionWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.ExpeditionWindow.INIT_INFO then
    ExpeditionWindow.InitWithData()
    if para then
      RefreshTips()
    end
  end
end

return ExpeditionWindow
