require("Arena_ArenaWindowByName")
require("Arena_EnemyInfoBtnByName")
local ArenaWindow = {}
local uis, contentPane, timeInfo, iconUrl, isSettle, rank, buyNum, bgPrefab, timeLineObj
local updateCd = 1
local tween, root, jumpTb, headScale, buildingListData, mapListData

function ArenaWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ArenaWindow.package, WinResConfig.ArenaWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetArena_ArenaWindowUis(contentPane)
    uis.Main.BattleInfo.root.alpha = 0
    ArenaWindow.LoadBgTexture()
    iconUrl = TableData.GetConfig(ARENA_ENUM.BATTLE_NUM_ICON, "BaseFixed").array_value
    buyNum = ArenaWindow.GetBuyNum(2)
    updateCd = TableData.GetConfig(ARENA_ENUM.UPDATE_ENEMY_CD, "BaseFixed").int_value
    headScale = true
    ArenaWindow.UpdateTextDisplay()
    SoundUtil.PlayMusic(30004)
    ArenaService.ArenaGetAllReq(function()
      if uis and bgPrefab then
        ArenaWindow.InitBtn()
        ArenaWindow.Init()
        ArenaWindow.InitRedDot()
      end
    end)
  end)
end

function ArenaWindow.InitRedDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.ArenaWindow.name,
    com = uis.Main.RewardBtn,
    visibleFunc = function()
      return RedDotArena.ShowHome()
    end,
    dataType = RED_DOT_DATA_TYPE.ADVENTURE
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.ArenaWindow.name,
    com = uis.Main.DefenseBtn,
    newFlagName = "new",
    newFlagVisibleFunc = function()
      return RedDotArena.ShowArenaDefense()
    end,
    onlyNew = true,
    dataType = RED_DOT_DATA_TYPE.ARENA_DEFENSE_MAP_NEW
  })
end

function ArenaWindow.UpdateTextDisplay()
  UIUtil.SetBtnText(uis.Main.DefenseBtn, T(371), T(372))
  UIUtil.SetBtnText(uis.Main.RecordBtn, T(373), T(374))
  UIUtil.SetText(uis.Main.BuyNumberBtn, T(375), "WordTxt")
end

function ArenaWindow.Init()
  ArenaWindow.UpdateEnemy()
  headScale = nil
  ArenaWindow.ShowCD()
  if ArenaMgr.CheckTime() then
    uis.Main.Time.WordTxt.text = T(370)
    ChangeController(uis.Main.Time.c1Ctr, 1)
  else
    uis.Main.Time.TimeTxt.text = TimeUtil.FormatEnTime(ArenaData.Info.seasonEndTime - LoginData.GetCurServerTime())
    ChangeController(uis.Main.Time.c1Ctr, 0)
    ArenaWindow.IsNewSeason()
  end
  ArenaWindow.RefreshTextInfo()
  ArenaWindow.InitBuilding()
  ArenaWindow.InitMap()
  local tran = uis.Main.LockEntry.root:GetTransition("up")
  local isMap = false
  uis.Main.LockEntry.SwitchBtn.onClick:Set(function()
    if tran then
      tran:SetHook("Sign", function()
        isMap = not isMap
        uis.Main.LockEntry.root:SwapChildrenAt(0, 1)
        ChangeController(uis.Main.LockEntry.c1Ctr, isMap and 1 or 0)
      end)
      if isMap then
        tran:PlayReverse()
      else
        tran:Play()
      end
    end
  end)
  if uis.Main.LockEntry.BuildLockEntryBtn.visible and uis.Main.LockEntry.MapLockEntryBtn.visible then
    ChangeController(uis.Main.LockEntry.c2Ctr, 0)
  elseif uis.Main.LockEntry.BuildLockEntryBtn.visible and uis.Main.LockEntry.MapLockEntryBtn.visible == false then
    ChangeController(uis.Main.LockEntry.c2Ctr, 1)
  end
  if uis.Main.LockEntry.BuildLockEntryBtn.visible == false and uis.Main.LockEntry.MapLockEntryBtn.visible == false then
    uis.Main.LockEntry.SwitchBtn.visible = false
  end
end

function ArenaWindow.InitBuilding()
  local arr = TableData.GetConfig(70010114, "BaseFixed").array_value
  arr = Split(arr, "|")
  buildingListData = {}
  local lockData
  local historyHighRank = ArenaData.Info.historyHighRank
  for i = 1, #arr do
    local tempData = TableData.GetConfig(tonumber(arr[i]), "BaseBuilding")
    if tempData then
      table.insert(buildingListData, tempData)
      if nil == lockData and tempData.use_rank and (historyHighRank > tempData.use_rank or historyHighRank <= 0) then
        lockData = tempData
      end
    end
  end
  local buildBtn = uis.Main.LockEntry.BuildLockEntryBtn
  if lockData then
    UIUtil.SetText(buildBtn, T(1332), "TitleTxt")
    UIUtil.SetText(buildBtn, lockData.name(), "NameTxt")
    UIUtil.SetText(buildBtn, T(1333, lockData.use_rank), "LockTxt")
    buildBtn:GetChild("PicLoader").url = UIUtil.GetResUrl(lockData.head_icon_square)
    buildBtn.onClick:Set(function()
      local showBol = {
        uis.Main.LockEntry.BuildLockEntryBtn.visible,
        uis.Main.LockEntry.MapLockEntryBtn.visible,
        0
      }
      OpenWindow(WinResConfig.BuildLockWindow.name, nil, buildingListData, mapListData, showBol)
    end)
    buildBtn.visible = true
  else
    buildBtn.visible = false
  end
end

function ArenaWindow.InitMap()
  local mapData = TableData.GetTable("BaseArenaMap")
  local lockData
  mapListData = {}
  local historyHighRank = ArenaData.Info.historyHighRank
  for i, v in pairs(mapData) do
    table.insert(mapListData, v)
  end
  local a_rank, b_rank
  table.sort(mapListData, function(a, b)
    a_rank = a.use_rank or 0
    b_rank = b.use_rank or 0
    return a_rank > b_rank
  end)
  for i, v in ipairs(mapListData) do
    if nil == lockData and v.use_rank and (historyHighRank > v.use_rank or historyHighRank <= 0) then
      lockData = v
    end
  end
  local mapBtn = uis.Main.LockEntry.MapLockEntryBtn
  if lockData then
    UIUtil.SetText(mapBtn, T(1338), "TitleTxt")
    UIUtil.SetText(mapBtn, lockData.name(), "NameTxt")
    UIUtil.SetText(mapBtn, T(1333, lockData.use_rank), "LockTxt")
    mapBtn:GetChild("PicLoader").url = UIUtil.GetResUrl(lockData.icon)
    mapBtn.onClick:Set(function()
      local showBol = {
        uis.Main.LockEntry.BuildLockEntryBtn.visible,
        uis.Main.LockEntry.MapLockEntryBtn.visible,
        1
      }
      OpenWindow(WinResConfig.BuildLockWindow.name, nil, buildingListData, mapListData, showBol)
    end)
    mapBtn.visible = true
  else
    mapBtn.visible = false
  end
end

function ArenaWindow.CheckNewSeasonTime()
  if ArenaMgr.CheckTime() then
    ArenaService.ArenaGetAllReq(function()
      ArenaWindow.Init()
    end)
  end
end

function ArenaWindow.LoadBgTexture()
  bgPrefab = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Aenra/FX_ui_arena_background.prefab")
  UIMgr:PlayAlphaChangeAnimIn(bgPrefab)
  timeLineObj = LuaUtil.FindChild(bgPrefab.transform, "timeline", true)
  LuaUtil.SetTimeLine(timeLineObj.gameObject, "Assets/Art/Animation/Arena/UI_aenra_getin.playable")
  root = {}
  for i = 1, 3 do
    root[i] = LuaUtil.FindChild(bgPrefab.transform, "head_icon_" .. i, true)
  end
end

function ArenaWindow.IsNewSeason()
  local endTime = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.NEW_SEASON)
  local curTime = LoginData.GetCurServerTime()
  if 0 == endTime then
    if curTime >= ArenaData.Info.seasonStartTime and curTime <= ArenaData.Info.seasonEndTime then
      PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.NEW_SEASON, ArenaData.Info.seasonEndStartTime)
    end
  elseif endTime < curTime then
    uis.root.touchable = false
    LeanTween.delayedCall(1, function()
      uis.root.touchable = true
      OpenWindow(WinResConfig.ArenaSeasonTipsWindow.name)
      PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ARENA_DAY, 0)
      PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.NEW_SEASON, ArenaData.Info.seasonEndStartTime)
    end)
  end
end

function ArenaWindow.RefreshTextInfo()
  local r = ArenaMgr.GetRank()
  if type(r) == "number" then
    uis.Main.MyRank.RankTxt.text = r
    uis.Main.MyRank.c1Ctr.selectedIndex = 0
  else
    uis.Main.MyRank.c1Ctr.selectedIndex = 1
    uis.Main.MyRank.WordTxt.text = r
  end
  ArenaWindow.ShowBuyNum()
end

function ArenaWindow.UpdateEnemy(update)
  uis.Main.BattleInfo.root.alpha = 0
  local tbInd = {
    3,
    1,
    2
  }
  table.sort(ArenaData.Info.matchInfo.opponents, function(a, b)
    return a.rank < b.rank
  end)
  for i = 1, 3 do
    local ind = update and tbInd[i] or i
    local headRoot = root[ind]:Find("head_iconpoint")
    local uiPanel = headRoot:GetComponent(typeof(FairyGUI.UIPanel))
    local ui = uiPanel.ui
    if ui then
      local EnemyInfo = GetArena_EnemyInfoBtnUis(ui)
      if headScale then
        local initPos = ui.displayObject.gameObject.transform.localPosition
        local scale = Const.DefaultUIScale / headRoot.localScale.x * ui.scaleX
        ui:SetScale(scale, scale)
        UIUtil.SetHolderCenter(uis.Main.BattleInfo.root)
        uis.Main.BattleInfo.root:SetScale(scale, scale)
        LuaUtil.SetLocalPos(ui.displayObject.gameObject, initPos.x * scale, initPos.y * scale, initPos.z * scale)
      end
      local data = ArenaData.Info.matchInfo.opponents[i]
      if EnemyInfo and data then
        local fashionData = TableData.GetConfig(data.info.faceId, "BaseFashion")
        if fashionData then
          EnemyInfo.CardPic.CardPicLoader.url = UIUtil.GetResUrl(fashionData.head_icon_rect)
        end
        EnemyInfo.EnemyRank.RankTxt.text = data.rank
        local enemy = uis.Main.BattleInfo.root:GetChild("Enemy" .. i)
        enemy.onClick:Set(function()
          ArenaWindow.StartBattle(data)
        end)
      end
    end
  end
end

function ArenaWindow.StartBattle(data)
  if ArenaMgr.CheckTime() then
    FloatTipsUtil.ShowWarnTips(T(439))
    return
  end
  rank = nil
  if ArenaData.Info.fightNum < 1 then
    FloatTipsUtil.ShowWarnTips(T(434))
    return
  end
  if isSettle then
    FloatTipsUtil.ShowWarnTips(T(439))
    return
  end
  if timeInfo then
    rank = data.rank
    ArenaWindow.ClearCd()
    return
  end
  ArenaService.ArenaGetOpponentFormationReq(data.rank)
end

function ArenaWindow.ShowCD()
  local curTime = ArenaData.Info.nextFightTime - LoginData.GetCurServerTime()
  if curTime > 0 then
    local TimeTxt = uis.Main.BuyNumberBtn:GetChild("TimeTxt")
    TimeTxt.text = TimeUtil.GetTimeStr(curTime, true)
    timeInfo = TimerUtil.new(1, curTime, function(timer, tickTime)
      TimeTxt.text = TimeUtil.GetTimeStr(curTime - tickTime, true)
    end, function()
      ChangeUIController(uis.Main.BuyNumberBtn, "c1", 0)
      timeInfo:stop()
      timeInfo = nil
    end)
    timeInfo:start()
    ChangeUIController(uis.Main.BuyNumberBtn, "c1", 1)
  else
    ChangeUIController(uis.Main.BuyNumberBtn, "c1", 0)
  end
end

function ArenaWindow.GetBuyNum(buyType)
  local num = 0
  local config = TableData.GetTable("BaseBuyTime")
  for i, v in pairs(config) do
    if v.type == buyType then
      num = v.finish
    end
  end
  return num
end

function ArenaWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ArenaWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.ADVENTURE_ARENA)
  uis.Main.RefreshBtn.onClick:Set(function()
    if ArenaMgr.CheckTime() then
      FloatTipsUtil.ShowWarnTips(T(439))
      return
    end
    ArenaService.ArenaGetMatchReq()
    uis.Main.RefreshBtn.touchable = false
    tween = LeanTween.delayedCall(updateCd, function()
      uis.Main.RefreshBtn.touchable = true
      tween = nil
    end)
  end)
  uis.Main.BuyNumberBtn.onClick:Set(function()
    if ArenaMgr.CheckTime() then
      FloatTipsUtil.ShowWarnTips(T(439))
      return
    end
    local curTime = ArenaData.Info.nextFightTime - LoginData.GetCurServerTime()
    if curTime > 0 then
      ArenaWindow.ClearCd()
      return
    end
    if ArenaData.Info.fightNum > 0 then
      return
    end
    if ArenaData.Info.buyNum >= buyNum then
      FloatTipsUtil.ShowWarnTips(T(440))
      return
    end
    local num = TableData.GetConfig(ARENA_ENUM.BATTLE_NUM_ICON, "BaseFixed").int_value
    local arr = GetBuyExpend(2, ArenaData.Info.buyNum + 1)
    if num and arr then
      OpenWindow(WinResConfig.BattleNumberWindow.name, nil, {
        text = T(871, arr.id, arr.value, num),
        arr = arr,
        callBack = function()
          ArenaService.ArenaResetFightNumReq()
        end
      })
    end
  end)
  uis.Main.DefenseBtn.onClick:Set(function()
    ArenaService.ArenaGetAllDefenseReq(function()
      GuideData.SaveCaptionOpen(ArenaMgr.DefenseWinId)
    end)
  end)
  uis.Main.RewardBtn.onClick:Set(function()
    OpenWindow(WinResConfig.ArenaRewardWindow.name)
  end)
  uis.Main.RankBtn.onClick:Set(function()
    ArenaService.ArenaGetTopRankReq()
  end)
  uis.Main.RecordBtn.onClick:Set(function()
    ArenaService.ArenaGetRecordReq()
  end)
end

function ArenaWindow.ClearCd()
  local data = TableData.GetConfig(ARENA_ENUM.BATTLE_CD_EXPEND, "BaseFixed")
  if data then
    local arr = Split(data.array_value, ":")
    if arr then
      arr = {
        id = tonumber(arr[2]),
        value = tonumber(arr[3])
      }
      local text = T(423, arr.id, arr.value)
      OpenWindow(WinResConfig.BattleNumberWindow.name, nil, {
        text = text,
        arr = arr,
        callBack = function()
          UIMgr:CloseWindow(WinResConfig.BattleNumberWindow.name)
          if timeInfo then
            ArenaService.ArenaRefreshFightCDReq()
          end
        end
      })
    end
  end
end

function ArenaWindow.ShowBuyNum()
  if ArenaData.Info.fightNum > 0 then
    ChangeUIController(uis.Main.BuyNumberBtn, "c2", 1)
    UIUtil.SetText(uis.Main.BuyNumberBtn, ArenaData.Info.fightNum, "NumberTxt")
  elseif ArenaData.Info.buyNum >= buyNum then
    ChangeUIController(uis.Main.BuyNumberBtn, "c2", 1)
    UIUtil.SetText(uis.Main.BuyNumberBtn, T(885, ArenaData.Info.fightNum), "NumberTxt")
  else
    UIUtil.SetText(uis.Main.BuyNumberBtn, T(885, ArenaData.Info.fightNum), "NumberTxt")
    ChangeUIController(uis.Main.BuyNumberBtn, "c2", 0)
  end
end

function ArenaWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Arena.GET_MATCH then
    LuaUtil.SetTimeLine(timeLineObj.gameObject, "Assets/Art/Animation/Arena/UI_arena_background.playable")
    LeanTween.delayedCall(0.1, function()
      if uis then
        ArenaWindow.UpdateEnemy(true)
        uis.Main.MyRank.RankTxt.text = ArenaMgr.GetRank()
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ARENA_REFRESH)
      end
    end)
  elseif msgId == WindowMsgEnum.Arena.BUY then
    ArenaWindow.ShowBuyNum()
  elseif msgId == WindowMsgEnum.Arena.FIGHT then
    ArenaWindow.ShowBuyNum()
    ArenaWindow.ShowCD()
  elseif msgId == WindowMsgEnum.Arena.CLEAR_CD then
    if timeInfo then
      ChangeUIController(uis.Main.BuyNumberBtn, "c1", 0)
      timeInfo:stop()
      timeInfo = nil
    end
    if rank then
      ArenaService.ArenaGetOpponentFormationReq(rank)
      rank = nil
    end
  elseif msgId == WindowMsgEnum.Common.E_MSG_SERVER_TIME_CHANGE then
    ArenaWindow.CheckNewSeasonTime()
  elseif msgId == WindowMsgEnum.Common.E_MSG_UPDATE_OPERATE_RECORD then
  end
end

function ArenaWindow.OnClose()
  ResourceManager.DestroyGameObject(bgPrefab, false)
  RedDotMgr.RemoveNode(WinResConfig.ArenaWindow.name)
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  root = nil
  if tween then
    LeanTween.cancel(tween.uniqueId)
    tween = nil
  end
  uis = nil
  contentPane = nil
  bgPrefab = nil
  isSettle = nil
  iconUrl = nil
  rank = nil
  buyNum = nil
  buildingListData = nil
  mapListData = nil
  if timeInfo then
    timeInfo:stop()
    timeInfo = nil
  end
end

return ArenaWindow
