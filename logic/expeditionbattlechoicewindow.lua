require("Expedition_BattleChoiceWindowByName")
local ExpeditionBattleChoiceWindow = {}
local uis, contentPane, bgEffect, bgTree_gameObject, bgTree_animator, bgTree_timeline, tree_children, playing, selectedChapterIndex
local stageEntrance_eff_boss = "Assets/Art/Effects/Prefab/UI_prefab/Expedition/FX_ui_expedition_icon_boss.prefab"
local stageEntrance_eff_normal = "Assets/Art/Effects/Prefab/UI_prefab/Expedition/FX_ui_expedition_icon_normal.prefab"
local stageEntrance_eff_complete = "Assets/Art/Effects/Prefab/UI_prefab/Expedition/FX_ui_expedition_icon_end.prefab"
local EnterLevelSelected, RefreshLevelSelectedPanel

function RefreshLevelSelectedPanel(expedData, chapterIndex, play_animation)
  local animator = bgTree_animator
  bgTree_gameObject:SetActive(true)
  local cnt = #tree_children
  for i = 1, cnt do
    tree_children[i]:SetActive(i == chapterIndex)
  end
  local tree_anim_duration = 0
  local panel = uis.Main
  local curChapterIndex = ExpeditionMgr.GetLatestChapterIndex()
  local lastChapterIndex = ExpeditionMgr.GetLastChapterIndex()
  if type(lastChapterIndex) == "number" then
    play_animation = play_animation or false
  end
  if play_animation then
    animator:SetTrigger("Display")
    tree_anim_duration = 0.667
    panel.Title.root:TweenFade(1, tree_anim_duration)
    panel.TabRegion.root:TweenFade(1, tree_anim_duration)
    panel.ReviewBtn:TweenFade(1, tree_anim_duration)
    panel.RewardBtn:TweenFade(1, tree_anim_duration)
  else
    animator:Play("FX_ui_expedition_tree_show", 0, 1)
    panel.Title.root.alpha = 1
    panel.TabRegion.root.alpha = 1
    panel.ReviewBtn.alpha = 1
    panel.RewardBtn.alpha = 1
  end
  local curStage = expedData.curStage
  local chapters = expedData.chapters
  local chapter = chapters[chapterIndex].chapterId
  local conf = TableData.GetConfig(chapter, "BaseChapter")
  local nameTitle = conf.name()
  panel.Title.TitleTxt.text = nameTitle
  local maplist = panel.MapList
  maplist:RemoveChildrenToPool()
  local defaultItem = "ui://Expedition/Map" .. tostring(chapterIndex)
  maplist.defaultItem = defaultItem
  ExpeditionMgr.SetLastChapterIndex(curChapterIndex)
  selectedChapterIndex = chapterIndex
  local chapterIsCleared = chapterIndex < curChapterIndex
  local isCurrentChapter = chapterIndex == curChapterIndex
  
  function maplist.itemRenderer(_, gcmp)
    local stages = conf.stages
    local numStages = #stages
    local progress = 0
    for j = 1, numStages do
      local stageId = stages[j]
      local stageIsCleared = ExpeditionMgr.IsStagePassed(stageId)
      local isCurrentStage = curStage == stageId
      local challengeable = not chapterIsCleared and isCurrentChapter and (stageIsCleared or isCurrentStage)
      local stageEntrance = gcmp:GetChild("Tips" .. tostring(j))
      local subItem = stageEntrance:GetChild("MapTipsBtn")
      local holder = subItem:GetChild("PicHolder")
      local path = (chapterIsCleared or stageIsCleared) and stageEntrance_eff_complete or j == numStages and stageEntrance_eff_boss or stageEntrance_eff_normal
      local eff = ResourceManager.Instantiate(path)
      holder.pivot = Vector2(0.5, 0.5)
      UIUtil.SetObjectToUI(eff, holder)
      eff.transform.localPosition = Vector3.zero
      if play_animation then
        LuaUtil.PlayEffect(eff)
      else
        LuaUtil.PlayEffectAtTime(eff, 3)
      end
      ChangeUIController(subItem, "c1", j - 1)
      if not challengeable then
        ChangeUIController(subItem, "c3", 0)
      else
        ChangeUIController(subItem, "c3", ExpeditionMgr.IsNewStage(stageId) and 1 or 2)
      end
      local maxStar = 3
      local starlist = subItem:GetChild("StarList")
      starlist.numItems = maxStar
      local achievedCnt = ExpeditionMgr.GetAchievedChallengeCount(stageId)
      for K = 1, maxStar do
        local child = starlist:GetChildAt(K - 1)
        ChangeUIController(child, "c1", K <= achievedCnt and 1 or 0)
      end
      if play_animation then
        subItem.alpha = 0
        PlayUITrans(stageEntrance, "in", function()
          progress = progress + 1
          if progress >= numStages then
            playing = false
          end
        end, tree_anim_duration + (j - 1) * 0.08)
      end
      subItem.onClick:Set(function()
        if playing then
          return
        end
        if challengeable then
          ExpeditionMgr.KeepStage(stageId)
          ExpeditionMgr.restart_timeline_animator = false
          local buffId = ExpeditionMgr.GetChapterBuff(chapterIndex)
          OpenWindow(WinResConfig.ExpeditionStageWindow.name, nil, buffId, stageId, j)
        else
          FloatTipsUtil.ShowWarnTips(T(10220))
        end
      end)
    end
  end
  
  maplist.numItems = 1
  local play_switch_animation = function(callback)
    local container = maplist:GetChildAt(0)
    local numChildren = container.numChildren
    for i = 0, numChildren - 1 do
      local item = container:GetChildAt(i)
      PlayUITrans(item, "Switch", callback, nil, 1, 0, 0.75)
    end
  end
  local tabParent = panel.TabRegion.root
  for i = 1, 4 do
    local child = tabParent:GetChild(string.format("Tab%sBtn", i))
    if play_animation then
      PlayUITrans(child, "up")
    end
    local switch_progress = 0
    local chapterId = chapters[i].chapterId
    local unlock, prechapter, remaining = ExpeditionMgr.IsChapterUnlock(chapterId)
    if unlock then
      ChangeUIController(child, "c1", i == chapterIndex and 1 or 0)
    else
      local c = child:GetChild("n9")
      if remaining > 0 then
        local text = T(20229, TimeUtil.FormatEnTime(remaining))
        UIUtil.SetText(c, text)
        ChangeUIController(child, "c1", 2)
      elseif not prechapter then
        local text = T(20230)
        UIUtil.SetText(c, text)
        ChangeUIController(child, "c1", 2)
      end
    end
    local conf = TableData.GetConfig(chapterId, "BaseChapter")
    local chapterName = type(conf.chapter_english) == "function" and conf.chapter_english() or "未配置"
    UIUtil.SetText(child, chapterName, "NumbetTxt")
    child.onClick:Set(function()
      if playing then
        return
      end
      local chapterIsUnlock, prechapter, remain = ExpeditionMgr.IsChapterUnlock(chapterId)
      if not chapterIsUnlock or i == chapterIndex then
        if not prechapter then
          FloatTipsUtil.ShowWarnTips(T(10220))
        elseif remain > 0 then
          local text = T(20229, TimeUtil.FormatEnTime(remaining))
          FloatTipsUtil.ShowWarnTips(text)
        end
        return
      end
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.SLIDE_NUMBER_CHANGE)
      playing = true
      animator:SetTrigger("Dissolve")
      panel.Title.root:TweenFade(0, tree_anim_duration)
      panel.TabRegion.root:TweenFade(0, tree_anim_duration)
      panel.ReviewBtn:TweenFade(0, tree_anim_duration)
      panel.RewardBtn:TweenFade(0, tree_anim_duration)
      play_switch_animation(function()
        switch_progress = switch_progress + 1
        if switch_progress >= maplist.numItems then
          RefreshLevelSelectedPanel(expedData, i, true)
        end
      end)
    end)
  end
end

function EnterLevelSelected(expedData, chapterIndex, play_animation)
  local duration = bgTree_timeline.duration
  local panel = uis.Main
  panel.Title.root.alpha = 0
  panel.TabRegion.root.alpha = 0
  panel.ReviewBtn.alpha = 0
  panel.RewardBtn.alpha = 0
  if play_animation then
    playing = true
    bgTree_timeline.time = 0
    bgTree_timeline:Play()
    TimerUtil.setTimeout(duration * 0.1, function()
      RefreshLevelSelectedPanel(expedData, chapterIndex, true)
    end)
  else
    bgTree_timeline.time = duration
    bgTree_timeline:Evaluate()
    RefreshLevelSelectedPanel(expedData, chapterIndex, false)
  end
end

local UpdateRefreshTimeInfo = function(refreshTimestamp)
  local dateTxt = TimeUtil.FormatDate("%Y/%m/%d %H:%M", refreshTimestamp)
  local timezoneOffset = LoginData.timezoneOffset
  local sign = timezoneOffset >= 0 and "+" or "-"
  local timezoneStr = math.ceil(math.abs(timezoneOffset / 3600))
  dateTxt = string.format("%s%s", dateTxt, string.format("(UTC%s%s)", sign, timezoneStr))
  local panel = uis.Main
  panel.Title.TimeTxt.text = string.format("%s%s", T(20042), dateTxt)
end
local UpdateChapterUnlockTimeInfo = function()
  local expedData = ExpeditionData.GetData()
  local chapters = expedData.chapters
  local tabParent = uis.Main.TabRegion.root
  for i, v in ipairs(chapters) do
    local unlock, prechater, remain = ExpeditionMgr.IsChapterUnlock(v.chapterId)
    local child = tabParent:GetChild(string.format("Tab%sBtn", i))
    local ctrl = child:GetController("c1")
    if remain <= 0 then
      if prechater and 2 == ctrl.selectedIndex then
        ctrl.selectedIndex = 0
      end
    else
      if 2 ~= ctrl.selectedIndex then
        ctrl.selectedIndex = 2
      end
      local c = child:GetChild("n9")
      local text = T(20229, TimeUtil.FormatEnTime(remain))
      UIUtil.SetText(c, text)
    end
  end
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
      UpdateChapterUnlockTimeInfo()
    end)
    refreshTimer:start()
  else
    ExpeditionService.GetExpeditionInfoReq()
  end
end
local InitRedDotData = function()
  RedDotMgr.AddNode({
    windowName = WinResConfig.ExpeditionBattleChoiceWindow.name,
    com = uis.Main.RewardBtn,
    visibleFunc = function()
      return RedDotExped.HasAnyRewards()
    end,
    dataType = RED_DOT_DATA_TYPE.EXPED
  })
end

function ExpeditionBattleChoiceWindow.ReInitData()
end

local jumpTb

function ExpeditionBattleChoiceWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExpeditionBattleChoiceWindow.package, WinResConfig.ExpeditionBattleChoiceWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExpedition_BattleChoiceWindowUis(contentPane)
    jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ExpeditionBattleChoiceWindow.name, uis.Main.CurrencyReturn)
    ExpeditionService.GetExpeditionInfoReq(function(msg)
      if ExpeditionMgr.data_refresh then
        return
      end
      ExpeditionBattleChoiceWindow.UpdateInfo()
      ExpeditionBattleChoiceWindow.InitBtn()
    end)
  end)
end

function ExpeditionBattleChoiceWindow.UpdateInfo()
  bgEffect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Expedition/FX_ui_expedition.prefab")
  local effectRoot = bgEffect.transform
  effectRoot.position = Vector3(1000, 1000, 0)
  bgTree_gameObject = LuaUtil.FindChild(effectRoot, "Tree", true).gameObject
  bgTree_animator = bgTree_gameObject:GetComponent(typeof(CS.UnityEngine.Animator))
  bgTree_gameObject:SetActive(false)
  tree_children = {}
  for i = 1, 4 do
    local child = LuaUtil.FindChild(effectRoot, string.format("expedition_tree%s", i + 1), true)
    tree_children[i] = child.gameObject
  end
  local go = LuaUtil.FindChild(effectRoot, "timeline", true)
  local director = go:GetComponent(typeof(CS.UnityEngine.Playables.PlayableDirector))
  director.time = 0
  director:Evaluate()
  director:Stop()
  bgTree_timeline = director
  local expedData = ExpeditionData.GetData()
  local isClearedThisTime = ExpeditionMgr.IsClearedThisTime()
  local totalStars = ExpeditionMgr.GetAllStageStars()
  local rewardBtnTitle = string.format("[size=24][color=#ffcc00]%s[/color][/size]/%s", expedData.highPassStar, totalStars)
  local reviewBtnTitle = T(20227)
  local buffBtnTitle = T(20228)
  UIUtil.SetBtnText(uis.Main.RewardBtn, rewardBtnTitle)
  UIUtil.SetBtnText(uis.Main.ReviewBtn, reviewBtnTitle)
  UIUtil.SetBtnText(uis.Main.Title.BuffBtn, buffBtnTitle)
  UpdateRefreshTimeInfo(expedData.nextRefreshStamp)
  local play = true
  if ExpeditionMgr.restart_timeline_animator ~= nil then
    play = ExpeditionMgr.restart_timeline_animator
    ExpeditionMgr.restart_timeline_animator = true
  end
  local lastChapterIndex = ExpeditionMgr.GetLastChapterIndex()
  local latestChapterIndex = ExpeditionMgr.GetLatestChapterIndex()
  if type(lastChapterIndex) == "number" then
    if lastChapterIndex < latestChapterIndex then
      EnterLevelSelected(expedData, latestChapterIndex, play)
    else
      EnterLevelSelected(expedData, selectedChapterIndex or latestChapterIndex, play)
    end
  else
    EnterLevelSelected(expedData, latestChapterIndex, play)
  end
  StartCheckRefreshTimer()
end

function ExpeditionBattleChoiceWindow.InitBtn()
  uis.Main.RewardBtn.onClick:Set(function()
    if playing then
      return
    end
    ExpeditionMgr.restart_timeline_animator = false
    OpenWindow(WinResConfig.ExpeditionRewardWindow.name)
  end)
  uis.Main.ReviewBtn.onClick:Set(function()
    if playing then
      return
    end
    ExpeditionMgr.restart_timeline_animator = false
    ExpeditionMgr.TryOpenExpeditionBattleReviewWindow()
  end)
  uis.Main.Title.BuffBtn.onClick:Set(function()
    ExpeditionMgr.restart_timeline_animator = false
    OpenWindow(WinResConfig.ExpeditionBuffTipsWindow.name, nil, selectedChapterIndex)
  end)
end

function ExpeditionBattleChoiceWindow.OnClose()
  uis = nil
  contentPane = nil
  if bgEffect then
    ResourceManager.DestroyGameObject(bgEffect)
  end
  bgEffect = nil
  bgTree_gameObject = nil
  bgTree_timeline = nil
  bgTree_animator = nil
  tree_children = nil
  if jumpTb then
    jumpTb.Close()
  end
  jumpTb = nil
  if refreshTimer then
    refreshTimer:stop()
  end
  refreshTimer = nil
end

return ExpeditionBattleChoiceWindow
