require("ActivityDungeon1002_ActivityDungeonWindowByName")
local Activity3DungeonWindow = {}
local uis, contentPane, jumpTb, configData, activityInfo, effect
local InitMiniGameInfo = function()
  local data = ActivityDungeonData.GetActivityData()
  if data.id == 70440001 then
    ld("Activity1_MiniGame")
    Activity1_MiniGameService.MiniGameInfoReq(function()
      RedDotMgr.AddNode({
        windowName = WinResConfig.Activity3DungeonWindow.name,
        com = uis.Main.MiniGameBtn,
        visibleFunc = function()
          return RedDotActivityDungeon.MiniGame1_TaskRewardable() or RedDotActivityDungeon.MiniGame1_DailyTaskRewardable()
        end,
        dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
      })
      RedDotMgr.UpdateNodeByWindowName(WinResConfig.Activity3DungeonWindow.name)
    end)
  elseif data.id == 70440002 then
    ld("Activity2_MiniGame")
    Activity2_MiniGameService.MiniGameInfoReq(function()
      RedDotMgr.AddNode({
        windowName = WinResConfig.Activity3DungeonWindow.name,
        com = uis.Main.MiniGameBtn,
        visibleFunc = function()
          return RedDotActivityDungeon.MiniGame2_TaskRewardable() or RedDotActivityDungeon.MiniGame2_DailyTaskRewardable()
        end,
        dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
      })
      RedDotMgr.UpdateNodeByWindowName(WinResConfig.Activity3DungeonWindow.name)
    end)
  elseif data.id == 70440003 then
    ld("Activity3_MiniGame")
    Activity3_MiniGameService.MiniGameInfoReq(function()
      RedDotMgr.AddNode({
        windowName = WinResConfig.Activity3DungeonWindow.name,
        com = uis.Main.MiniGameBtn,
        visibleFunc = function()
          return RedDotActivityDungeon.MiniGame3_TaskRewardable() or RedDotActivityDungeon.MiniGame3_DailyTaskRewardable()
        end,
        dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
      })
      RedDotMgr.UpdateNodeByWindowName(WinResConfig.Activity3DungeonWindow.name)
    end)
  end
end

function Activity3DungeonWindow.ReInitData()
end

function Activity3DungeonWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity3DungeonWindow.package, WinResConfig.Activity3DungeonWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1002_ActivityDungeonWindowUis(contentPane)
    local trans = uis.Main.root:GetTransition("in")
    if trans then
      uis.Main.root.touchable = false
      trans:SetHook("sign", function()
        uis.Main.root.touchable = true
      end)
    end
    Activity3DungeonWindow.InitBtn()
    configData = ActivityDungeonData.GetActivityData()
    activityInfo = ActivityDungeonData.GetActivityInfo()
    if configData and activityInfo then
      Activity3DungeonWindow.InitBtnTxt()
      Activity3DungeonWindow.UpdateInfo()
      Activity3DungeonWindow.InitRedDot()
      UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
      effect = UIUtil.SetEffectToUI(configData.bg_main, uis.Main.BackGround.BackGroundHolder)
      LuaUtil.PlayEffect(effect)
      local spine = LuaUtil.FindChild(effect, "eventcovers_0003_2", true)
      local spineBg = LuaUtil.FindChild(effect, "eventcovers_0003_1", true)
      SkeletonAnimationUtil.SetAnimation(spine, 0, "in", false, 0, function()
        if spine and uis then
          SkeletonAnimationUtil.SetAnimation(spine, 0, "idle", true)
        end
      end)
      SkeletonAnimationUtil.SetAnimation(spineBg, 0, "in", false, 0, function()
        if spineBg and uis then
          SkeletonAnimationUtil.SetAnimation(spineBg, 0, "idle", true)
        end
      end)
      if configData.sound then
        SoundUtil.PlayMusic(configData.sound)
      end
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_THREE_MAIN_IN)
    end
  end)
end

function Activity3DungeonWindow.InitRedDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity3DungeonWindow.name,
    com = uis.Main.SignBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanSgin(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity3DungeonWindow.name,
    com = uis.Main.PassBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanHomePass(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity3DungeonWindow.name,
    com = uis.Main.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanTask(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity3DungeonWindow.name,
    com = uis.Main.MaterialBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanMaterialRed(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
end

function Activity3DungeonWindow.UpdateInfo()
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
            OpenWindow(WinResConfig.Activity3MaterialWindow.name)
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
            OpenWindow(WinResConfig.Activity3BossBattleWindow.name)
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

function Activity3DungeonWindow.InitBtnTxt()
  UIUtil.SetText(uis.Main.BossBtn, T(1647))
  UIUtil.SetText(uis.Main.MaterialBtn, T(1648))
  uis.Main.NormalBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity3ChallengeWindow.name)
  end)
  UIUtil.SetText(uis.Main.NormalBtn, T(1649))
  if configData and configData.pass_port_id then
    local passData = TableData.GetConfig(configData.pass_port_id, "BaseBattlePassport")
    if passData then
      uis.Main.PassBtn.onClick:Set(function()
        PassportService.GetBattlePassInfoReq(function()
          ActivityDungeonMgr.activityIndex = 0
          OpenWindow(WinResConfig.Activity3PassportWindow.name)
        end)
      end)
      UIUtil.SetText(uis.Main.PassBtn, passData.name())
    end
    UIUtil.SetText(uis.Main.MiniGameBtn, configData.game_name and configData.game_name() or "", "NameTxt")
  end
  uis.Main.PlotBtn.onClick:Set(function()
    local id = ActivityDungeonMgr.GetUnlockPlotId()
    if table.getLen(id) > 0 then
      OpenWindow(WinResConfig.Activity3PlotWindow.name, nil, id)
    else
      FloatTipsUtil.ShowWarnTips(T(1607))
    end
  end)
  UIUtil.SetText(uis.Main.PlotBtn, T(1644))
  uis.Main.ShopBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity3ShopWindow.name)
  end)
  UIUtil.SetText(uis.Main.ShopBtn, T(1646))
  uis.Main.SignBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity3SignWindow.name)
  end)
  UIUtil.SetText(uis.Main.SignBtn, T(1650))
  uis.Main.TaskBtn.onClick:Set(function()
    ActivityDungeonService.GetActivityAllReq(function()
      OpenWindow(WinResConfig.Activity3TaskWindow.name)
    end)
  end)
  UIUtil.SetText(uis.Main.TaskBtn, T(1645))
  uis.Main.MiniGameBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity3MiniGameMainWindow.name)
  end)
end

function Activity3DungeonWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.Activity3DungeonWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_ADVENTURE)
end

function Activity3DungeonWindow.OnShown()
  if uis then
    Activity3DungeonWindow.UpdateInfo()
  end
end

function Activity3DungeonWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.Activity3DungeonWindow.name)
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

function Activity3DungeonWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    ActivityDungeonMgr.CheckActivityEnd()
  end
end

return Activity3DungeonWindow
