require("RogueBuild01_RogueWindowByName")
local RogueWindow = {}
local uis, contentPane, jumpTb, rogueThemeData, rogueInfo, tween

function RogueWindow.ReInitData()
end

function RogueWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueWindow.package, WinResConfig.RogueWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_RogueWindowUis(contentPane)
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    local bgEffect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Rugel/FX_ui_rugel_cover_001.prefab", uis.Main.BackGround.BackGroundHolder)
    LuaUtil.PlayEffect(bgEffect)
    local animatorObj = LuaUtil.FindChild(bgEffect.transform, "ani", true)
    local animator
    if animatorObj then
      animator = animatorObj:GetComponent(typeof(CS.UnityEngine.Animator))
      if animator then
        animator.enabled = true
      end
    end
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ROGUE_MAIN_IN)
    tween = LeanTween.delayedCall(4, function()
      if uis and animator then
        animator.enabled = false
        tween = nil
      end
    end)
    rogueInfo = RogueData.GetRogueInfo()
    RogueMgr.difficultyLevel = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ROGUE_DIFFICULTY_LEVEL)
    if -1 == RogueMgr.difficultyLevel then
      RogueMgr.difficultyLevel = rogueInfo.themeInfo.curDifficultyLevel
    end
    RogueWindow.UpdateInfo()
    RogueWindow.InitRedDot()
    RogueWindow.InitBtn()
  end)
end

function RogueWindow.InitRedDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.RogueWindow.name,
    com = uis.Main.CoverScoreRewardBtn,
    visibleFunc = function()
      return RedDotRogue.CanLevelReward()
    end,
    dataType = RED_DOT_DATA_TYPE.ROGUE
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.RogueWindow.name,
    com = uis.Main.CoverLetterBtn,
    visibleFunc = function()
      return RedDotRogue.CanTaskReward()
    end,
    dataType = RED_DOT_DATA_TYPE.ROGUE
  })
end

function RogueWindow.UpdateInfo()
  rogueThemeData = TableData.GetConfig(rogueInfo.themeInfo.themeId, "BaseRogueTheme")
  RogueWindow.UpdateTxt()
end

function RogueWindow.ShowMapNew()
  if uis then
    local newBol = RogueMgr.CanMapNew() or RogueMgr.CanEndindNew() or RogueMgr.CanEventNew()
    ChangeUIController(uis.Main.CoverHandBookBtn, "new", newBol and 1 or 0)
  end
end

function RogueWindow.UpdateTxt()
  UIUtil.SetText(uis.Main.CoverScoreBtn, rogueInfo.themeInfo.topScore, "NumberTxt")
  UIUtil.SetText(uis.Main.CoverScoreRewardBtn, T(1368, rogueInfo.themeInfo.level), "LevelTxt")
  local cnt = TableData.GetConfig(70011301, "BaseFixed").int_value
  UIUtil.SetText(uis.Main.CoverSweepBtn, T(20499, math.max(0, cnt - rogueInfo.themeInfo.sweepCount), cnt), "WordTxt")
  if rogueThemeData and rogueInfo then
    local data = RogueMgr.GetDifficultyData(rogueThemeData.group_id, RogueMgr.difficultyLevel)
    if data then
      UIUtil.SetText(uis.Main.CoverDifficultyBtn, data.name(), "NameTxt")
    end
    local rogueChapterData = TableData.GetConfig(rogueInfo.themeInfo.chapterId, "BaseRogueChapter")
    if rogueChapterData then
      uis.Main.CoverLayers.NameTxt.text = rogueChapterData.name()
    end
    UIUtil.SetText(uis.Main.CoverTalentBtn, ActorData.GetItemCount(rogueThemeData.talent_item), "NumberTxt")
    local lv = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ROGUE_LOCK_LEVEL)
    if lv then
      ChangeUIController(uis.Main.CoverScoreRewardBtn, "c1", lv < rogueInfo.themeUnlockLevel and 1 or 0)
    end
  end
  ChangeController(uis.Main.c3Ctr, rogueInfo.themeInfo.topScore > 0 and 1 or 0)
  ChangeController(uis.Main.c2Ctr, rogueInfo.themeInfo.topScore > 0 and 1 or 0)
  ChangeController(uis.Main.c1Ctr, rogueInfo.themeInfo.running and 1 or 0)
  UIUtil.SetText(uis.Main.CoverDifficultyBtn, rogueInfo.themeInfo.running and T(1361) or T(1490), "WordTxt")
  RogueService.GetCycleTaskInfoReq()
  RogueService.GetRogueTrendsReq(function()
    if uis then
      UIUtil.SetText(uis.Main.CoverLetterBtn, T(1367, RogueMgr.GetRogueTrendBar(), #rogueInfo.trendInfos), "NumberTxt")
    end
  end)
  RogueService.GetRoguePicNewStateReq(function()
    if uis then
      RogueWindow.ShowMapNew()
    end
  end)
  uis.Main.CoverTalentBtn:GetChild("Red").visible = RogueMgr.CanTalentNew()
  ChangeUIController(uis.Main.CoverTalentBtn, "new", 1)
end

function RogueWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.RogueWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.ADVENTURE_ROGUE)
  UIUtil.SetText(uis.Main.CoverStartBtn, T(1363), "WordTxt")
  uis.Main.CoverStartBtn.onClick:Set(function()
    RogueGameMgr.Start(RogueMgr.difficultyLevel)
  end)
  UIUtil.SetText(uis.Main.CoverHandBookBtn, T(1357), "WordTxt")
  uis.Main.CoverHandBookBtn.onClick:Set(function()
    OpenWindow(WinResConfig.RogueHandBookWindow.name, nil, rogueThemeData.id)
  end)
  UIUtil.SetText(uis.Main.CoverTalentBtn, T(1358), "WordTxt")
  uis.Main.CoverTalentBtn.onClick:Set(function()
    OpenWindow(WinResConfig.RogueTalentWindow.name, nil, rogueThemeData.id)
  end)
  UIUtil.SetText(uis.Main.CoverScoreBtn, T(1366), "WordTxt")
  uis.Main.CoverScoreBtn.onClick:Set(function()
    RogueService.GetRogueTopScoreRecordReq(function()
      OpenWindow(WinResConfig.RogueScoreDetailsWindow.name)
    end)
  end)
  UIUtil.SetText(uis.Main.CoverScoreRewardBtn, T(1359), "WordTxt")
  UIUtil.SetText(uis.Main.CoverScoreRewardBtn:GetChild("RewardExpand"), T(1362), "WordTxt")
  uis.Main.CoverScoreRewardBtn.onClick:Set(function()
    OpenWindow(WinResConfig.RogueScoreRewardWindow.name, nil, rogueThemeData.id)
  end)
  UIUtil.SetText(uis.Main.CoverLetterBtn, T(1360), "WordTxt")
  uis.Main.CoverLetterBtn.onClick:Set(function()
    RogueService.GetRogueTrendsReq(function()
      OpenWindow(WinResConfig.RogueLetterRewardWindow.name, nil, rogueThemeData.group_id)
    end)
  end)
  UIUtil.SetText(uis.Main.CoverGiveUpBtn, T(1365), "WordTxt")
  uis.Main.CoverGiveUpBtn.onClick:Set(function()
    OpenWindow(WinResConfig.RogueGiveUpWindow.name)
  end)
  uis.Main.CoverLayers.WordTxt.text = T(1364)
  uis.Main.CoverDifficultyBtn.onClick:Set(function()
    if RogueData.GetRogueTheme().running then
      FloatTipsUtil.ShowWarnTips(T(1453))
      return
    end
    OpenWindow(WinResConfig.RogueDifficultyChoiceWindow.name, nil, rogueThemeData.group_id)
  end)
  UIUtil.SetText(uis.Main.CoverGiveUpBtn, T(1365), "WordTxt")
  local cnt = TableData.GetConfig(70011301, "BaseFixed").int_value
  UIUtil.SetText(uis.Main.CoverSweepBtn, T(20499, math.max(0, cnt - rogueInfo.themeInfo.sweepCount), cnt), "WordTxt")
  uis.Main.CoverSweepBtn.onClick:Set(function()
    if rogueInfo.themeInfo.sweepCount >= cnt then
      FloatTipsUtil.ShowWarnTips(T(20500))
      return
    end
    MessageBox.Show(T(20498, cnt), {
      touchCallback = function()
        RogueService.SweepReq(rogueThemeData.id, function()
        end)
      end
    }, {})
  end)
end

function RogueWindow.OnShown()
  if uis then
    rogueInfo = RogueData.GetRogueInfo()
    RogueWindow.UpdateTxt()
  end
end

function RogueWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.RogueWindow.name)
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  if tween then
    LeanTween.cancel(tween.uniqueId)
    tween = nil
  end
end

function RogueWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    RogueService.GetRogueTrendsReq()
  end
end

return RogueWindow
