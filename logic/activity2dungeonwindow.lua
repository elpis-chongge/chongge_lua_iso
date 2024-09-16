require("ActivityDungeon1001_ActivityDungeonWindowByName")
local Activity2DungeonWindow = {}
local uis, contentPane, jumpTb, configData, activityInfo, effect
local InitMiniGameInfo = function()
  local data = ActivityDungeonData.GetActivityData()
  if data.id == 70440001 then
    ld("Activity1_MiniGame")
    Activity1_MiniGameService.MiniGameInfoReq(function()
      RedDotMgr.AddNode({
        windowName = WinResConfig.Activity2DungeonWindow.name,
        com = uis.Main.MiniGameBtn,
        visibleFunc = function()
          return RedDotActivityDungeon.MiniGame1_TaskRewardable() or RedDotActivityDungeon.MiniGame1_DailyTaskRewardable()
        end,
        dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
      })
      RedDotMgr.UpdateNodeByWindowName(WinResConfig.Activity2DungeonWindow.name)
    end)
  elseif data.id == 70440002 then
    ld("Activity2_MiniGame")
    Activity2_MiniGameService.MiniGameInfoReq(function()
      RedDotMgr.AddNode({
        windowName = WinResConfig.Activity2DungeonWindow.name,
        com = uis.Main.MiniGameBtn,
        visibleFunc = function()
          return RedDotActivityDungeon.MiniGame2_TaskRewardable() or RedDotActivityDungeon.MiniGame2_DailyTaskRewardable()
        end,
        dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
      })
      RedDotMgr.UpdateNodeByWindowName(WinResConfig.Activity2DungeonWindow.name)
    end)
  end
end

function Activity2DungeonWindow.ReInitData()
end

function Activity2DungeonWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity2DungeonWindow.package, WinResConfig.Activity2DungeonWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1001_ActivityDungeonWindowUis(contentPane)
    local trans = uis.Main.root:GetTransition("in")
    if trans then
      uis.Main.root.touchable = false
      trans:SetHook("sign", function()
        uis.Main.root.touchable = true
      end)
    end
    Activity2DungeonWindow.InitBtn()
    configData = ActivityDungeonData.GetActivityData()
    activityInfo = ActivityDungeonData.GetActivityInfo()
    if configData and activityInfo then
      Activity2DungeonWindow.InitBtnTxt()
      Activity2DungeonWindow.UpdateInfo()
      Activity2DungeonWindow.InitRedDot()
      UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
      effect = UIUtil.SetEffectToUI(configData.bg_main, uis.Main.BackGround.BackGroundHolder)
      local spine = LuaUtil.FindChild(effect, "eventcovers_0001", true)
      local spineBg = LuaUtil.FindChild(effect, "eventcovers_0001_bg", true)
      SkeletonAnimationUtil.SetAnimation(spine, 0, "idle", true)
      SkeletonAnimationUtil.SetAnimation(spineBg, 0, "idle", true)
      if configData.sound then
        SoundUtil.PlayMusic(configData.sound)
      end
    end
  end)
end

function Activity2DungeonWindow.InitRedDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity2DungeonWindow.name,
    com = uis.Main.SignBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanSgin(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity2DungeonWindow.name,
    com = uis.Main.PassBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanHomePass(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity2DungeonWindow.name,
    com = uis.Main.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanTask(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity2DungeonWindow.name,
    com = uis.Main.MaterialBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanMaterialRed(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
end

function Activity2DungeonWindow.UpdateInfo()
  activityInfo = ActivityDungeonData.GetActivityInfo()
  if activityInfo.baseInfo.startStamp > 0 and activityInfo.baseInfo.endStamp > 0 then
    local startStamp = TimeUtil.FormatDate("%m/%d", activityInfo.baseInfo.startStamp)
    local endStamp = TimeUtil.FormatDate("%m/%d", activityInfo.baseInfo.endStamp)
    uis.Main.MainTitle.Time1Txt.text = T(1520, startStamp, endStamp)
    uis.Main.MainTitle.Time2Txt.text = T(1521, TimeUtil.FormatEnTime(activityInfo.baseInfo.endStamp - LoginData.GetCurServerTime(), true))
  end
  if configData then
    if configData.shop_id then
      local shopData = TableData.GetConfig(configData.shop_id, "BaseActivityShop")
      if shopData then
        UIUtil.SetIconById(uis.Main.ShopBtn:GetChild("PicLoader"), shopData.token_id)
        UIUtil.SetText(uis.Main.ShopBtn, ActorData.GetItemCount(shopData.token_id), "NumberTxt")
      end
    end
    if configData.cream_chapter_ids then
      local arr = Split(configData.cream_chapter_ids, ":")
      if 3 == #arr then
        local stageId = tonumber(arr[2])
        local lock = table.contain(activityInfo.finishStages, stageId)
        ChangeUIController(uis.Main.MaterialBtn, "lock", lock and 1 or 0)
        local stageData = TableData.GetConfig(stageId, "BaseStage")
        local tips = ""
        if stageData then
          UIUtil.SetText(uis.Main.MaterialBtn, T(1535, stageData.name()), "LockTxt")
          tips = T(1542, stageData.name())
        end
        uis.Main.MaterialBtn.onClick:Set(function()
          if lock then
            OpenWindow(WinResConfig.Activity2MaterialWindow.name)
          else
            FloatTipsUtil.ShowWarnTips(tips)
          end
        end)
      end
    end
    if configData.boss_chapter_ids then
      local arr = Split(configData.boss_chapter_ids, ":")
      if 2 == #arr then
        local stageId = tonumber(arr[2])
        local lock = table.contain(activityInfo.finishStages, stageId)
        ChangeUIController(uis.Main.BossBtn, "lock", lock and 1 or 0)
        local stageData = TableData.GetConfig(stageId, "BaseStage")
        local tips = ""
        if stageData then
          UIUtil.SetText(uis.Main.BossBtn, T(1535, stageData.name()), "LockTxt")
          tips = T(1542, stageData.name())
        end
        uis.Main.BossBtn.onClick:Set(function()
          if lock then
            OpenWindow(WinResConfig.Activity2BossBattleWindow.name)
          else
            FloatTipsUtil.ShowWarnTips(tips)
          end
        end)
      end
    end
  end
  ChangeUIController(uis.Main.NormalBtn, "new", RedDotActivityDungeon.CanDailyNew() and 1 or 0)
  ChangeUIController(uis.Main.BossBtn, "new", RedDotActivityDungeon.CanBossNew() and 1 or 0)
  if activityInfo and LoginData.GetCurServerTime() < activityInfo.baseInfo.endStamp then
    ActivityDungeonService.GetActivityAllReq()
    InitMiniGameInfo()
  end
end

function Activity2DungeonWindow.InitBtnTxt()
  UIUtil.SetText(uis.Main.BossBtn, T(1625))
  UIUtil.SetText(uis.Main.MaterialBtn, T(1626))
  uis.Main.NormalBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity2ChallengeWindow.name)
  end)
  UIUtil.SetText(uis.Main.NormalBtn, T(1627))
  if configData and configData.pass_port_id then
    local passData = TableData.GetConfig(configData.pass_port_id, "BaseBattlePassport")
    if passData then
      uis.Main.PassBtn.onClick:Set(function()
        PassportService.GetBattlePassInfoReq(function()
          ActivityDungeonMgr.activityIndex = 0
          OpenWindow(WinResConfig.Activity2PassportWindow.name)
        end)
      end)
      UIUtil.SetText(uis.Main.PassBtn, passData.name())
    end
    UIUtil.SetText(uis.Main.MiniGameBtn, configData.game_name and configData.game_name() or "", "NameTxt")
  end
  uis.Main.PlotBtn.onClick:Set(function()
    local id = ActivityDungeonMgr.GetUnlockPlotId()
    if table.getLen(id) > 0 then
      OpenWindow(WinResConfig.Activity2PlotWindow.name, nil, id)
    else
      FloatTipsUtil.ShowWarnTips(T(1607))
    end
  end)
  UIUtil.SetText(uis.Main.PlotBtn, T(1622))
  uis.Main.ShopBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity2ShopWindow.name)
  end)
  UIUtil.SetText(uis.Main.ShopBtn, T(1624))
  uis.Main.SignBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity2SignWindow.name)
  end)
  UIUtil.SetText(uis.Main.SignBtn, T(1628))
  uis.Main.TaskBtn.onClick:Set(function()
    ActivityDungeonService.GetActivityAllReq(function()
      OpenWindow(WinResConfig.Activity2TaskWindow.name)
    end)
  end)
  UIUtil.SetText(uis.Main.TaskBtn, T(1623))
  uis.Main.MiniGameBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity2MiniGameMainWindow.name)
  end)
end

function Activity2DungeonWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.Activity2DungeonWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_ADVENTURE)
end

function Activity2DungeonWindow.OnShown()
  if uis then
    Activity2DungeonWindow.UpdateInfo()
  end
end

function Activity2DungeonWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.Activity2DungeonWindow.name)
  uis = nil
  if effect then
    ResourceManager.DestroyGameObject(effect, false)
    effect = nil
  end
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  configData = nil
  activityInfo = nil
end

function Activity2DungeonWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    ActivityDungeonMgr.CheckActivityEnd()
  end
end

return Activity2DungeonWindow
