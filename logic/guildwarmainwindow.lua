require("GuildBoss_GuildBossWindowByName")
local GuildWarMainWindow = {}
local uis, contentPane, prevMapId
local RefreshPanelInfo = function()
  local title = uis.Main.Title
  title.NameTxt.text = GuildData.GuildInfo.info.name
  local level = GuildData.GuildInfo.info.level
  local data = TableData.GetConfig(GuildEnum.GUILD_LEVEL_UP_ID * 10 + level, "BaseGuildLevelUp")
  if data then
    title.NumberTxt.text = T(20504, GuildData.GuildInfo.info.memberCount, data.max_member)
  end
  title.LevelTxt.text = T(1014, GuildData.GuildInfo.info.level)
  local headData = TableData.GetConfig(GuildData.GuildInfo.info.iconId, "BaseGuildHeadIcon")
  if headData then
    title.GulidIconLoader.url = UIUtil.GetResUrl(headData.icon)
  end
  local playerInfo = GuildWarData.GetGuildPlayerInfo()
  local scheduleInfo = GuildWarData.GetGuildScheduleInfo()
  local progressInfo = GuildWarData.GetGuildWarProgressInfo()
  local startTimestamp, endTimestamp = scheduleInfo.startStamp, scheduleInfo.endStamp
  local fightCnt = playerInfo.fightCount
  local restTimestamp = playerInfo.dailyResetStamp
  local diff = endTimestamp - LoginData.GetCurServerTime()
  local timeText = TimeUtil.FormatEnTime(diff)
  uis.Main.EndTime.WordTxt.text = T(20092, timeText)
  uis.Main.Round.WordTxt.text = T(20502, progressInfo.round)
  local maxFightCnt = TableData.GetConfig(70011405, "BaseFixed").int_value
  local remainFightCnt = maxFightCnt - fightCnt
  uis.Main.BattleNumber.WordTxt.text = T(20503, remainFightCnt, maxFightCnt)
end
local BadgeBtnUnlockCallback = function(isUnlock)
  ChangeUIController(uis.Main.BadgeBtn, "lock", isUnlock and 0 or 1)
end
local eventTipsRoot
local OnPopupEventTips = function(events)
  local parent = uis.Main.root
  if not eventTipsRoot then
    eventTipsRoot = UIMgr:CreateObject("Abyss", "EventTipsList")
    eventTipsRoot.opaque = false
    local childIndex = parent:GetChildIndex(uis.Main.BackGround.root)
    parent:AddChildAt(eventTipsRoot, childIndex + 1)
    AbyssEventList.Reset(eventTipsRoot)
  end
  AbyssEventList.PopupEventList(eventTipsRoot, events)
end
local OnChrStartMoving = function()
  if not eventTipsRoot then
    return
  end
  AbyssEventList.ClearEventTips(eventTipsRoot, true, nil, true)
end
local eventTipsPositionOffset = Vector3(0.5, 0, 0)
local UpdateEventTipsPosition = function()
  if eventTipsRoot and eventTipsRoot.visible then
    local position = AbyssExploreChrCtrl.GetPosition()
    position = position + eventTipsPositionOffset
    local sp = AbyssExploreMgr.WorldToScreenPoint(position)
    local parent = uis.Main.root
    local lp = parent:RootToLocal(sp)
    eventTipsRoot:SetXY(lp.x, lp.y)
  end
end
local OnUpdate = function()
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.HOME_BADGE, BadgeBtnUnlockCallback)
  if not AbyssExploreMgr.Exists() then
    return
  end
  UpdateEventTipsPosition()
end
local OpenGuideIfNecessary = function()
  local data = TableData.GetConfig(FEATURE_ENUM.GUILD_WAR_SCENE_MAIN, "BaseFeature")
  if data and data.caption_id then
    local root = uis.Main.root
    if data.auto_open_caption and GuideData.CanShowCaption(data.id) then
      root.touchable = false
      LeanTween.delayedCall(0.25, function()
        uis.Main.ExplainBtn.onClick:Call()
        root.touchable = true
      end)
      GuideData.SaveCaptionOpen(data.id)
    end
  end
end
local getD_H = function(timestamp)
  local day = math.floor(timestamp / 86400)
  local mod = timestamp % 86400
  local hour = (mod + LoginData.timezoneOffset) / 3600 % 24
  return day, hour
end
local setSpritesColor = function(go, color)
  local spriteRenderers = go:GetComponentsInChildren(typeof(CS.UnityEngine.SpriteRenderer))
  if spriteRenderers then
    for i = 0, spriteRenderers.Length - 1 do
      local sr = spriteRenderers[i]
      sr.color = color
    end
  end
end
local tweenId, effect
local PlayDailyEntranceAnimIfNecessary = function()
  local key = PLAYER_PREF_ENUM.GUILD_WAR_DAILY_ENTRANCE
  local timestamp = LoginData.GetCurServerTime()
  local d, h = getD_H(timestamp)
  local lastTimestamp = PlayerPrefsUtil.GetFloat(key, 0)
  local last_d, last_h = getD_H(lastTimestamp)
  if d - last_d > 1 or d > last_d and h >= 5 or d == last_d and last_h < 5 and h > 5 then
    SoundUtil.PlaySfxByPath("event:/sfx/sfx_amb/system_boss/sfx_amb_system_boss_in", "bank:/sfx/sfx_amb/sfx_amb_system_boss")
    PlayerPrefsUtil.SetFloat(key, timestamp)
    effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/TradeUnionWar_cover/FX_ui_TradeUnionWar_cover.prefab")
    local parent = uis.Main.root
    local holder = parent:GetChild("EffectHolder")
    if not holder then
      holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
      holder.name = "EffectHolder"
      holder.pivotAsAnchor = true
      holder.scaleX = 1.1
      holder.scaleY = 1.1
      holder:SetPivot(0.5, 0.5)
      parent:AddChild(holder)
      holder:Center()
      UIUtil.SetObjectToUI(effect, holder)
      effect.transform.localPosition = Vector3.zero
    end
    uis.Main.root.touchable = false
    EffectUtil.PlayTimeLineByName(effect, "timeline")
    local color = Color.white
    LuaUtil.ResetAlpha(effect)
    setSpritesColor(effect, color)
    SkeletonAnimationUtil.SetAlpha(effect, 1)
    tweenId = LeanTween.delayedCall(9, function()
      local parent = uis.Main.root
      local holder = parent:GetChild("EffectHolder")
      tweenId = LeanTween.value(1, 0, 0.8):setOnUpdate(function(val)
        LuaUtil.SetAlpha(effect, val, true)
        color.a = val
        setSpritesColor(effect, color)
        SkeletonAnimationUtil.SetAlpha(effect, val)
      end):setOnComplete(function()
        tweenId = nil
        effect = nil
        holder:Dispose()
        uis.Main.root.touchable = true
        OpenGuideIfNecessary()
      end).id
    end).id
  end
end
local RegisterListeners = function()
  AbyssExploreMgr.AddListener(AbyssExploreMsgEnum.POPUP_EVENT_TIPS, OnPopupEventTips)
  AbyssExploreMgr.AddListener(AbyssExploreMsgEnum.CHA_START_MOVING, OnChrStartMoving)
end
local UnregisterListeners = function()
  AbyssExploreMgr.RemoveListener(AbyssExploreMsgEnum.POPUP_EVENT_TIPS, OnPopupEventTips)
  AbyssExploreMgr.RemoveListener(AbyssExploreMsgEnum.CHA_START_MOVING, OnChrStartMoving)
end

function GuildWarMainWindow.ReInitData()
end

function GuildWarMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildWarMainWindow.package, WinResConfig.GuildWarMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_GuildBossWindowUis(contentPane)
    prevMapId = bridgeObj.argTable[1]
    GuildWarMainWindow.UpdateInfo()
    GuildWarMainWindow.InitBtn()
    GuildWarMainWindow.InitRedDot()
    GuildWarMainWindow.UpdateRank()
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.COLLECT_EVENTS)
    SoundUtil.PlayMusic(30011)
  end)
end

function GuildWarMainWindow.UpdateInfo()
  GuildWarService.GetGuildWarAllInfoReq(RefreshPanelInfo)
  UIUtil.SetBtnText(uis.Main.MemberBtn, T(7), T(10167))
  UIUtil.SetBtnText(uis.Main.BadgeBtn, T(8), T(10168))
  UIUtil.SetText(uis.Main.RankBtn, T(1575), "WordTxt")
  UIUtil.SetText(uis.Main.HelpBtn, T(1576), "WordTxt")
  UIUtil.SetText(uis.Main.SkillBtn, T(1577), "WordTxt")
  UIUtil.SetText(uis.Main.TaskBtn, T(20512), "WordTxt")
  UIUtil.SetText(uis.Main.BattleBtn, T(20513), "WordTxt")
  UIUtil.SetText(uis.Main.LogBtn, T(20534), "WordTxt")
  UIUtil.SetText(uis.Main.RankRewardBtn, T(20535), "WordTxt")
  UIUtil.SetBtnText(uis.Main.ReturnBtn, T(20077))
  RegisterListeners()
  UpdateManager.AddUpdateHandler(OnUpdate)
  local timestamp = LoginData.GetCurServerTime()
  PlayerPrefsUtil.SetFloat(PLAYER_PREF_ENUM.GUILD_WAR_TODAY_HAS_FIGHT_COUNT, timestamp)
  PlayDailyEntranceAnimIfNecessary()
end

function GuildWarMainWindow.InitBtn()
  uis.Main.MemberBtn.onClick:Set(function()
    AbyssEventList.SetBusy(true)
    OpenWindow(WinResConfig.CardListWindow.name)
  end)
  uis.Main.BadgeBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BADGE) then
      AbyssEventList.SetBusy(true)
      ld("Badge")
      OpenWindow(WinResConfig.BadgeWindow.name)
    end
  end)
  uis.Main.BattleBtn.onClick:Set(function()
    GuildWarService.GetGuildWarAllInfoReq(function()
      OpenWindow(WinResConfig.GuildWarLevelSelectedWindow.name)
    end)
  end)
  uis.Main.ReturnBtn.onClick:Set(function()
    if type(prevMapId) == "number" and prevMapId == EXPLORE_MAP_ID.ABYSS then
      AbyssExploreMgr.Enter(prevMapId)
    else
      AbyssExploreMgr.Release()
      UIMgr:CloseWindow(WinResConfig.GuildWarMainWindow.name)
    end
  end)
  uis.Main.SkillBtn.onClick:Set(function()
    OpenWindow(WinResConfig.GuildWarSkillWindow.name)
  end)
  uis.Main.HelpBtn.onClick:Set(function()
    OpenWindow(WinResConfig.GuildWarCardAssistWindow.name)
  end)
  uis.Main.RankBtn.onClick:Set(function()
    GuildWarService.GetGuildWarRankReq(0, function()
      OpenWindow(WinResConfig.GuildWarRankWindow.name)
    end)
  end)
  uis.Main.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.GuildWarBossTaskWindow.name)
  end)
  uis.Main.RankRewardBtn.onClick:Set(function()
    GuildWarService.GetGuildWarRankReq(0, function()
      local rankInfo = GuildWarData.GetRankInfo()
      local rank
      if 0 ~= rankInfo.rank and rankInfo.rank < 101 then
        rank = rankInfo.rank
      else
        rank = rankInfo.rankRatio
      end
      OpenWindow(WinResConfig.GuildWarRankRewardWindow.name, nil, rank)
    end)
  end)
  uis.Main.LogBtn.onClick:Set(function()
    GuildWarService.GetGuildWarBattleRecordReq(function()
      local record = GuildWarData.GetBattleRecord()
      if record and table.getLen(record) > 0 then
        OpenWindow(WinResConfig.GuildBattleRecordWindow.name)
      else
        FloatTipsUtil.ShowWarnTips(T(1621))
      end
    end)
  end)
  local data = TableData.GetConfig(FEATURE_ENUM.GUILD_WAR_SCENE_MAIN, "BaseFeature")
  local detailBtn = uis.Main.ExplainBtn
  if data and data.caption_id then
    detailBtn.visible = true
    local root = uis.Main.root
    detailBtn.onClick:Set(function()
      WindowLoadPackages[WinResConfig.GuidePicLookWindow.name] = {
        "Guide_" .. Language.curLanguage
      }
      OpenWindow(WinResConfig.GuidePicLookWindow.name, nil, data.caption_id, nil, true)
    end)
    if not effect and data.auto_open_caption and GuideData.CanShowCaption(data.id) then
      root.touchable = false
      LeanTween.delayedCall(0.25, function()
        detailBtn.onClick:Call()
        root.touchable = true
      end)
      GuideData.SaveCaptionOpen(data.id)
    end
  else
    detailBtn.visible = false
  end
end

function GuildWarMainWindow.InitRedDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.GuildWarMainWindow.name,
    com = uis.Main.TaskBtn,
    visibleFunc = function()
      return RedDotGuildWar.CanTask()
    end,
    dataType = RED_DOT_DATA_TYPE.GUILD_WAR
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.AbyssWindow.name,
    com = uis.Main.MemberBtn,
    visibleFunc = function()
      return RedDotCard.CanAnyCardGrowUp()
    end,
    dataType = RED_DOT_DATA_TYPE.CARD
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.AbyssWindow.name,
    com = uis.Main.BadgeBtn,
    visibleFunc = function()
      return RedDotBadge.CanShowHome()
    end,
    dataType = RED_DOT_DATA_TYPE.BADGE,
    homeLimitSort = GetHomeRedDotSort(FEATURE_ENUM.BADGE)
  })
end

local show

function GuildWarMainWindow.OnShown()
  AbyssExploreMgr.SetActive(true)
  AbyssEventList.SetBusy(false)
  if not show then
    AbyssExploreMgr.EnableGestureOp(true)
  end
  show = true
  if uis then
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.COLLECT_EVENTS)
    GuildWarMainWindow.UpdateRank()
  end
end

function GuildWarMainWindow.UpdateRank()
  GuildWarService.GetGuildWarRankReq(0, function()
    local rankInfo = GuildWarData.GetRankInfo()
    local rank
    if 0 ~= rankInfo.rank and rankInfo.rank < 101 then
      UIUtil.SetText(uis.Main.RankBtn, T(429, rankInfo.rank), "RankTxt")
      rank = rankInfo.rank
      ChangeUIController(uis.Main.RankBtn, "c1", 1)
    elseif rankInfo.rankRatio > 100 then
      UIUtil.SetText(uis.Main.RankBtn, T(1640, math.floor(rankInfo.rankRatio / 100)), "RankTxt")
      ChangeUIController(uis.Main.RankBtn, "c1", 1)
    else
      ChangeUIController(uis.Main.RankBtn, "c1", 0)
    end
  end)
end

function GuildWarMainWindow.OnHide()
  AbyssExploreMgr.SetActive(false)
  if show then
    AbyssExploreMgr.EnableGestureOp(false)
  end
  show = false
end

function GuildWarMainWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.GuildWarMainWindow.name)
  AbyssExploreMgr.SetActive(false)
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  UnregisterListeners()
  if eventTipsRoot then
    AbyssEventList.ImmediateComplete(eventTipsRoot)
    eventTipsRoot:Dispose()
  end
  eventTipsRoot = nil
  prevMapId = nil
  uis = nil
  contentPane = nil
  if tweenId then
    LeanTween.cancel(tweenId)
  end
  tweenId = nil
end

return GuildWarMainWindow
