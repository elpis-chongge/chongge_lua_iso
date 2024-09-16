CurrencyReturnWindow = {}

function CurrencyReturnWindow.AutoOpenCaption(featureId, root, detailsBtn)
  local data = TableData.GetConfig(featureId, "BaseFeature")
  if data and data.caption_id then
    if data.auto_open_caption and GuideData.CanShowCaption(data.id) then
      root.touchable = false
      LeanTween.delayedCall(data.caption_time and data.caption_time or 0.28, function()
        WindowLoadPackages[WinResConfig.GuidePicLookWindow.name] = {
          "Guide_" .. Language.curLanguage
        }
        OpenWindow(WinResConfig.GuidePicLookWindow.name, nil, data.caption_id, nil, true)
        root.touchable = true
      end)
      GuideData.SaveCaptionOpen(data.id)
    end
    if detailsBtn then
      detailsBtn.onClick:Set(function()
        WindowLoadPackages[WinResConfig.GuidePicLookWindow.name] = {
          "Guide_" .. Language.curLanguage
        }
        OpenWindow(WinResConfig.GuidePicLookWindow.name, nil, data.caption_id, nil, true)
      end)
    end
  end
end

function CurrencyReturnWindow.SetCurrencyReturn(windowName, currencyReturn, featureId, backFunc, jumpFunc, detailFunc, jumpBtnVisible, jumpToMainBtnVisible)
  local obj = {}
  local uis = currencyReturn
  
  function obj.Close()
    uis = nil
    obj = nil
  end
  
  if nil == currencyReturn then
    return
  end
  if nil == jumpBtnVisible then
    jumpBtnVisible = true
  end
  if nil == jumpToMainBtnVisible then
    jumpToMainBtnVisible = true
  end
  local returnBtn = currencyReturn.ReturnBtn
  if returnBtn then
    local bol = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.JUMP_BACK, false)
    returnBtn.visible = bol and true or false
    returnBtn.soundFmod = SOUND_EVENT_ENUM.COMMON_BACK
    returnBtn.onClick:Set(function()
      if jumpBtnVisible and uis.CurrencyIndex2.root.visible then
        obj.HideWin()
      elseif backFunc then
        backFunc()
      else
        UIMgr:CloseWindow(windowName)
      end
    end)
  end
  local jumpBtn = currencyReturn.FunctionJumpBtn
  if jumpBtnVisible then
    local bol = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.JUMP_DETAIL, false)
    jumpBtn.visible = bol and true or false
    jumpBtn.onClick:Set(function()
      if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.JUMP_DETAIL) then
        if jumpFunc then
          jumpFunc()
        else
          obj.InitJump()
        end
      end
    end)
  else
    jumpBtn.visible = false
  end
  local detailBtn = currencyReturn.FunctionDetailsBtn
  if detailFunc and detailBtn then
    detailBtn.visible = true
    detailBtn.onClick:Set(detailFunc)
  else
    local data = TableData.GetConfig(featureId, "BaseFeature")
    if data and data.caption_id then
      detailBtn.onClick:Set(function()
        WindowLoadPackages[WinResConfig.GuidePicLookWindow.name] = {
          "Guide_" .. Language.curLanguage
        }
        OpenWindow(WinResConfig.GuidePicLookWindow.name, nil, data.caption_id, nil, true)
      end)
      detailBtn.visible = true
      if data.auto_open_caption and GuideData.CanShowCaption(data.id) then
        uis.root.touchable = false
        LeanTween.delayedCall(data.caption_time and data.caption_time or 0.25, function()
          if featureId == FEATURE_ENUM.ADVENTURE_ARENA then
            local showBol = false
            local info = ActorData.GetGuideInfo()
            for i, v in pairs(info) do
              if v.guideId == 70721000 and not table.contain(v.steps, 70711007) then
                showBol = true
              end
            end
            if showBol then
              WindowLoadPackages[WinResConfig.GuidePicLookWindow.name] = {
                "Guide_" .. Language.curLanguage
              }
              OpenWindow(WinResConfig.GuidePicLookWindow.name, nil, 70730100)
            end
          else
            detailBtn.onClick:Call()
          end
          uis.root.touchable = true
        end)
        GuideData.SaveCaptionOpen(data.id)
      end
    else
      detailBtn.visible = false
    end
  end
  if jumpToMainBtnVisible then
    local bol = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.JUMP_HOME, false)
    currencyReturn.FunctionMainBtn.visible = bol and true or false
    currencyReturn.FunctionMainBtn.onClick:Set(function()
      if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_EXPLORE, false) and AbyssExploreMgr and AbyssExploreMgr.Exists() then
        JumpToWindow(AbyssExploreMgr.GetMainWindow())
      elseif EnterClampUtil.WhetherToEnter(FEATURE_ENUM.JUMP_HOME) then
        if UIMgr:IsWindowInList(WinResConfig.HomeWindow.name) then
          UIMgr:CloseToWindow(WinResConfig.HomeWindow.name)
        else
          ld("Home", function()
            UIUtil.ChangeLoginScreenEffectIn(function()
              OpenWindow(WinResConfig.HomeWindow.name, UILayer.MainUI)
            end)
          end)
        end
      end
    end)
  else
    currencyReturn.FunctionMainBtn.visible = false
  end
  
  function obj.InitJump()
    uis.CurrencyIndex2.root.visible = true
    uis.CurrencyIndex2.c1Ctr.selectedIndex = 1
    PlayUITrans(uis.CurrencyIndex2.root, "in")
    uis.FunctionJumpBtn.touchable = false
    obj.InitBtn()
  end
  
  local showUnlocked = function(id, btn, name)
    local featureData = TableData.GetConfig(id, "BaseFeature")
    if EnterClampUtil.WhetherToEnter(id, false) then
      btn.onClick:Set(function()
        ChangeUIController(btn, "c1", 0)
        if CurrencyReturnWindow.jumpFun[id] then
          if UIMgr:IsWindowOpen(name) then
            obj.HideWin()
            return
          end
          CurrencyReturnWindow.jumpFun[id].fun(true)
          if featureData.sound then
            SoundUtil.PlayMusic(featureData.sound)
          else
            SoundUtil.PlayHomeMusic()
          end
        end
      end)
    else
      ChangeUIController(btn, "c1", 1)
      btn.onClick:Set(function()
        FloatTipsUtil.ShowWarnTips(featureData.unlock_des())
      end)
    end
  end
  
  function obj.InitBtn()
    uis.CurrencyIndex2.TouchScreenBtn.onClick:Set(obj.HideWin)
    local index1 = uis.CurrencyIndex2.CurrencyIndex1.CurrencyIndex1
    showUnlocked(FEATURE_ENUM.HOME_EXPLORE, index1.AbyssBtn, WinResConfig.AbyssWindow.name)
    UIUtil.SetBtnText(index1.AbyssBtn, T(20066), T(10164))
    showUnlocked(FEATURE_ENUM.HOME_CARD, index1.CardBtn, WinResConfig.CardListWindow.name)
    UIUtil.SetBtnText(index1.CardBtn, T(7), T(10167))
    showUnlocked(FEATURE_ENUM.HOME_ADVENTURE, index1.AdventureBtn, WinResConfig.AdventureWindow.name)
    UIUtil.SetBtnText(index1.AdventureBtn, T(929), T(930))
    showUnlocked(FEATURE_ENUM.HOME_SHOP, index1.ShopBtn, WinResConfig.ShopWindow.name)
    UIUtil.SetBtnText(index1.ShopBtn, T(12), T(10172))
    showUnlocked(FEATURE_ENUM.DAILY_TASK, index1.TaskBtn, WinResConfig.CarnivalWindow.name)
    UIUtil.SetBtnText(index1.TaskBtn, T(931), T(932))
    showUnlocked(FEATURE_ENUM.HOME_GUILD, index1.GuildBtn, WinResConfig.GuildWindow.name)
    UIUtil.SetBtnText(index1.GuildBtn, T(5), T(10165))
    showUnlocked(FEATURE_ENUM.HOME_STORY, index1.StoryBtn, WinResConfig.StoryWindow.name)
    UIUtil.SetBtnText(index1.StoryBtn, T(6), T(10166))
    showUnlocked(FEATURE_ENUM.HOME_SUMMON, index1.LotteryBtn, WinResConfig.LotteryWindow.name)
    UIUtil.SetBtnText(index1.LotteryBtn, T(3), T(10163))
    showUnlocked(FEATURE_ENUM.HOME_BADGE, index1.BadgeBtn, WinResConfig.BadgeWindow.name)
    UIUtil.SetBtnText(index1.BadgeBtn, T(8), T(10168))
  end
  
  function obj.HideWin()
    uis.c1Ctr.selectedIndex = 0
    PlayUITrans(uis.CurrencyIndex2.root, "out", function()
      uis.CurrencyIndex2.root.visible = false
      uis.FunctionJumpBtn.touchable = true
      uis.CurrencyIndex2.c1Ctr.selectedIndex = 0
    end)
  end
  
  return obj
end

function CurrencyReturnWindow.SetJumpFun(btn, featureData, goToData, jump, closeFun, itemNeedInfo, startCallBack)
  if btn and featureData then
    if CurrencyReturnWindow.jumpFun[featureData.id] then
      btn.onClick:Set(function()
        if featureData.window_name and UIMgr:IsWindowOpen(featureData.window_name) then
          if closeFun then
            closeFun()
          end
          if featureData.id == FEATURE_ENUM.ABYSS_SHOP_MATERIAL then
            UIMgr:SendWindowMessage(WinResConfig.AbyssShopWindow.name, WindowMsgEnum.AbyssShopWindow.SWITCH_PANEL, 3)
          elseif featureData.window_name == WinResConfig.DailyMapWindow.name then
            local data = CurrencyReturnWindow.GetTrialDataByFeatureId(featureData.id)
            if data then
              AdventureService.GetChapterStageReq(data.chapter_id, function()
                if goToData.go_to_stage and not AdventureData.GetStageOpen(data.chapter_id, goToData.go_to_stage) and UIMgr:IsWindowOpen(WinResConfig.DungeonInfoWindow.name) then
                  UIMgr:CloseWindow(WinResConfig.DungeonInfoWindow.name)
                end
                UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_WINDOW_INFO_UPDATE, {
                  data = data,
                  stageId = goToData.go_to_stage
                })
              end)
            end
          end
          return
        end
        if EnterClampUtil.WhetherToEnter(featureData.id) then
          if type(startCallBack) == "function" then
            startCallBack()
          end
          local stageId, page, parameter
          if goToData then
            stageId = goToData.go_to_stage
            page = goToData.go_to_page
            parameter = goToData.go_to_parameter
          end
          CurrencyReturnWindow.jumpFun[featureData.id].fun(jump, stageId, page, parameter, itemNeedInfo)
          if featureData.sound then
            SoundUtil.PlayMusic(featureData.sound)
          else
            SoundUtil.PlayHomeMusic()
          end
        end
      end)
    else
      btn.onClick:Set(function()
        if featureData.window_name and WinResConfig[featureData.window_name] then
          if UIMgr:IsWindowOpen(featureData.window_name) then
            if closeFun then
              closeFun()
            end
            return
          end
          if EnterClampUtil.WhetherToEnter(featureData.id) then
            if type(startCallBack) == "function" then
              startCallBack()
            end
            ld(WinResConfig[featureData.window_name].package, function()
              if jump then
                JumpToWindow(featureData.window_name)
              else
                OpenWindow(featureData.window_name)
              end
              if featureData.sound then
                SoundUtil.PlayMusic(featureData.sound)
              else
                SoundUtil.PlayHomeMusic()
              end
            end)
          end
        end
      end)
    end
  end
end

CurrencyReturnWindow.jumpFun = {
  [FEATURE_ENUM.TRIAL_GOLD] = {
    fun = function(...)
      CurrencyReturnWindow.jumpTrial(FEATURE_ENUM.TRIAL_GOLD, ...)
    end
  },
  [FEATURE_ENUM.TRIAL_EXP] = {
    fun = function(...)
      CurrencyReturnWindow.jumpTrial(FEATURE_ENUM.TRIAL_EXP, ...)
    end
  },
  [FEATURE_ENUM.TRIAL_QUALITY] = {
    fun = function(...)
      CurrencyReturnWindow.jumpTrial(FEATURE_ENUM.TRIAL_QUALITY, ...)
    end
  },
  [FEATURE_ENUM.TRIAL_QUALITY_COMMON] = {
    fun = function(...)
      CurrencyReturnWindow.jumpTrial(FEATURE_ENUM.TRIAL_QUALITY_COMMON, ...)
    end
  },
  [FEATURE_ENUM.TRIAL_SKILL] = {
    fun = function(...)
      CurrencyReturnWindow.jumpTrial(FEATURE_ENUM.TRIAL_SKILL, ...)
    end
  },
  [FEATURE_ENUM.TRIAL_BADGE] = {
    fun = function(...)
      CurrencyReturnWindow.jumpTrial(FEATURE_ENUM.TRIAL_BADGE, ...)
    end
  },
  [FEATURE_ENUM.ADVENTURE_TOWER] = {
    fun = function(...)
      CurrencyReturnWindow.jumpTower(...)
    end
  },
  [FEATURE_ENUM.ADVENTURE_GOLD] = {
    fun = function(...)
      CurrencyReturnWindow.jumpExperiment(...)
    end
  },
  [FEATURE_ENUM.ADVENTURE_STORY] = {
    fun = function(...)
      CurrencyReturnWindow.jumpMainLine(...)
    end
  },
  [FEATURE_ENUM.ADVENTURE_BOSS] = {
    fun = function(...)
      CurrencyReturnWindow.jumpBoss(...)
    end
  },
  [FEATURE_ENUM.ADVENTURE_ARENA] = {
    fun = function(...)
      CurrencyReturnWindow.jumpArena(...)
    end
  },
  [FEATURE_ENUM.HOME_MAIL] = {
    fun = function(...)
      CurrencyReturnWindow.jumpMail(...)
    end
  },
  [FEATURE_ENUM.HOME_TASK] = {
    fun = function(...)
      CurrencyReturnWindow.jumpPassport(...)
    end
  },
  [FEATURE_ENUM.HOME_GUILD] = {
    fun = function(...)
      CurrencyReturnWindow.jumpGuild(...)
    end
  },
  [FEATURE_ENUM.HOME_SUMMON] = {
    fun = function(...)
      CurrencyReturnWindow.jumpLottery(...)
    end
  },
  [FEATURE_ENUM.HOME_CARNIVAL] = {
    fun = function(...)
      CurrencyReturnWindow.jumpCarnival(...)
    end
  },
  [FEATURE_ENUM.HOME_FRIEND] = {
    fun = function(...)
      CurrencyReturnWindow.jumpFriend(...)
    end
  },
  [FEATURE_ENUM.HOME_SETTING] = {
    fun = function(...)
      CurrencyReturnWindow.jumpSetting(...)
    end
  },
  [FEATURE_ENUM.HOME_LOOK_ROLE] = {
    fun = function(...)
      CurrencyReturnWindow.jumpLookRole(...)
    end
  },
  [FEATURE_ENUM.HOME_TAKE_PHOTO] = {
    fun = function(...)
      CurrencyReturnWindow.jumpTakePhoto(...)
    end
  },
  [FEATURE_ENUM.HOME_BIOGRAPHY] = {
    fun = function(...)
      CurrencyReturnWindow.jumpBiography(...)
    end
  },
  [FEATURE_ENUM.HOME_ADVENTURE] = {
    fun = function(...)
      CurrencyReturnWindow.jumpAdventure(...)
    end
  },
  [FEATURE_ENUM.HOME_BADGE] = {
    fun = function(...)
      CurrencyReturnWindow.jumpBadge(...)
    end
  },
  [FEATURE_ENUM.HOME_CHAT] = {
    fun = function(...)
      CurrencyReturnWindow.jumpChat(...)
    end
  },
  [FEATURE_ENUM.HOME_NOTICE] = {
    fun = function(...)
      CurrencyReturnWindow.jumpNotice(...)
    end
  },
  [FEATURE_ENUM.HOME_STORY] = {
    fun = function(...)
      CurrencyReturnWindow.jumpStory(...)
    end
  },
  [FEATURE_ENUM.HOME_SHOP] = {
    fun = function(...)
      CurrencyReturnWindow.jumpShop(...)
    end
  },
  [FEATURE_ENUM.HOME_EXPLORE] = {
    fun = function(...)
      CurrencyReturnWindow.jumpAbyssExplore(...)
    end
  },
  [FEATURE_ENUM.HOME_CARD] = {
    fun = function(...)
      CurrencyReturnWindow.jumpCardList(...)
    end
  },
  [FEATURE_ENUM.HOME_TASK_LIST] = {
    fun = function(...)
      CurrencyReturnWindow.jumpTaskList(...)
    end
  },
  [FEATURE_ENUM.GUILD_SIGN_IN] = {
    fun = function(...)
      CurrencyReturnWindow.jumpGuildSign(...)
    end
  },
  [FEATURE_ENUM.ABYSS_SHOP] = {
    fun = function(...)
      CurrencyReturnWindow.jumpAbyssShop(...)
    end
  },
  [FEATURE_ENUM.ABYSS_SHOP_MATERIAL] = {
    fun = function(...)
      CurrencyReturnWindow.jumpAbyssMaterialTransaction(...)
    end
  },
  [FEATURE_ENUM.ADVENTURE_DREAMLAND] = {
    fun = function(...)
      CurrencyReturnWindow.jumpAbyssExpedition(...)
    end
  },
  [FEATURE_ENUM.DAILY_TASK] = {
    fun = function(...)
      CurrencyReturnWindow.jumpDayTask(...)
    end
  },
  [FEATURE_ENUM.ABYSS_BUILDING] = {
    fun = function(...)
      CurrencyReturnWindow.jumpAbyssBuilding(...)
    end
  },
  [FEATURE_ENUM.BADGE_DECOMPOSE] = {
    fun = function(...)
      CurrencyReturnWindow.jumpBadgeDecompose(...)
    end
  },
  [FEATURE_ENUM.ITEM_SHOP_ONE] = {
    fun = function(...)
      CurrencyReturnWindow.jumpItemShopOne(...)
    end
  },
  [FEATURE_ENUM.ITEM_SHOP_TWE] = {
    fun = function(...)
      CurrencyReturnWindow.jumpItemShopTwe(...)
    end
  },
  [FEATURE_ENUM.ACTIVITY_ITEM_DUNGEON] = {
    fun = function(...)
      CurrencyReturnWindow.jumpActivityItemDungeon(...)
    end
  },
  [FEATURE_ENUM.ACTIVITY_MIN_GAME] = {
    fun = function(...)
      CurrencyReturnWindow.jumpActivityMinGame(...)
    end
  },
  [FEATURE_ENUM.ACTIVITY_TWO_ITEM_DUNGEON] = {
    fun = function(...)
      CurrencyReturnWindow.jumpActivityTwoItemDungeon(...)
    end
  },
  [FEATURE_ENUM.ACTIVITY_TWO_MIN_GAME] = {
    fun = function(...)
      CurrencyReturnWindow.jumpActivityTwoMinGame(...)
    end
  },
  [FEATURE_ENUM.ACTIVITY_THREE_ITEM_DUNGEON] = {
    fun = function(...)
      CurrencyReturnWindow.jumpActivityThreeItemDungeon(...)
    end
  },
  [FEATURE_ENUM.ACTIVITY_THREE_MIN_GAME] = {
    fun = function(...)
      CurrencyReturnWindow.jumpActivityThreeMinGame(...)
    end
  }
}

function CurrencyReturnWindow.EnterWindow(featureId)
  if EnterClampUtil.WhetherToEnter(featureId) then
    CurrencyReturnWindow.jumpFun[featureId].fun()
  end
end

function CurrencyReturnWindow.jumpAbyssExplore(jump)
  ld("AbyssExplore")
  if AbyssExploreMgr and AbyssExploreMgr.Exists() then
    if jump then
      JumpToWindow(WinResConfig.AbyssWindow.name)
    else
      OpenWindow(WinResConfig.AbyssWindow.name)
    end
  else
    AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ABYSS, nil, jump)
  end
end

function CurrencyReturnWindow.jumpAbyssShop(jump)
  ld("AbyssExplore")
  AbyssExploreMgr.OpenShopExternal(jump)
end

function CurrencyReturnWindow.jumpAbyssMaterialTransaction(jump)
  ld("AbyssExplore")
  AbyssExploreMgr.OpenShopExternal(jump, 3)
end

function CurrencyReturnWindow.jumpAbyssExpedition(jump)
  ld("AbyssExplore")
  if AbyssExploreMgr and AbyssExploreMgr.Exists() then
    if jump then
      JumpToWindow(WinResConfig.AbyssWindow.name)
    else
      OpenWindow(WinResConfig.AbyssWindow.name)
    end
    AbyssExploreMgr.GoToExpedition()
  else
    AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ABYSS, AbyssExploreMgr.GoToExpedition, jump)
  end
end

function CurrencyReturnWindow.jumpAbyssBuilding(jump)
  ld("AbyssExplore")
  if AbyssExploreMgr and AbyssExploreMgr.Exists() then
    if jump then
      JumpToWindow(WinResConfig.AbyssWindow.name)
    else
      OpenWindow(WinResConfig.AbyssWindow.name)
    end
    OpenWindow(WinResConfig.AbyssActivityWindow.name, nil, AbyssExploreEventID.BUILDING)
  else
    AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ABYSS, function()
      OpenWindow(WinResConfig.AbyssActivityWindow.name, nil, AbyssExploreEventID.BUILDING)
    end, jump)
  end
end

function CurrencyReturnWindow.jumpBadgeDecompose(jump)
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BADGE) then
    BadgeMgr.Init()
    if jump then
      JumpToWindow(WinResConfig.BadgeDecomposeWindow.name)
    else
      OpenWindow(WinResConfig.BadgeDecomposeWindow.name)
    end
  end
end

function CurrencyReturnWindow.jumpCardList(jump)
  ld("Card", function()
    if jump then
      JumpToWindow(WinResConfig.CardListWindow.name)
    else
      OpenWindow(WinResConfig.CardListWindow.name)
    end
  end)
end

function CurrencyReturnWindow.jumpAdventure(jump)
  ld("Adventure", function()
    AdventureService.GetSceneInfoReq({
      ProtoEnum.SCENE_TYPE.CLIMB_TOWER,
      ProtoEnum.SCENE_TYPE.MAIN_LINE
    }, function()
      AdventureMgr.Init()
      if jump then
        JumpToWindow(WinResConfig.AdventureWindow.name)
      else
        OpenWindow(WinResConfig.AdventureWindow.name)
      end
    end)
  end)
end

function CurrencyReturnWindow.jumpTower(jump, stageId)
  ld("Adventure", function()
    AdventureService.GetSceneInfoReq({
      ProtoEnum.SCENE_TYPE.CLIMB_TOWER
    }, function()
      if stageId then
        local info = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.CLIMB_TOWER)
        if stageId < info.currentStage then
          FloatTipsUtil.ShowWarnTips(T(10219))
          return
        elseif stageId > info.currentStage then
          FloatTipsUtil.ShowWarnTips(T(549))
          return
        end
      end
      if jump then
        JumpToWindow(WinResConfig.TowerListWindow.name)
      else
        OpenWindow(WinResConfig.TowerListWindow.name)
      end
    end)
  end)
end

function CurrencyReturnWindow.jumpExperiment(jump)
  ld("Adventure", function()
    local enum = ProtoEnum.SCENE_TYPE
    AdventureService.GetSceneInfoReq({
      enum.DAILY_COIN,
      enum.DAILY_ROLE_EXP,
      enum.DAILY_SKILL_BOOK,
      enum.DAILY_QUALITY_UP,
      enum.DAILY_MATERIAL,
      enum.DAILY_BADGE_EXP
    }, function()
      if jump then
        JumpToWindow(WinResConfig.DailyDungeonWindow.name)
      else
        OpenWindow(WinResConfig.DailyDungeonWindow.name)
      end
    end)
  end)
end

function CurrencyReturnWindow.GetTrialDataByFeatureId(featureId)
  local data = TableData.GetTable("BaseDailyDungeon")
  for i, v in pairs(data) do
    if v.feature_id == featureId then
      return v
    end
  end
end

function CurrencyReturnWindow.jumpTrial(featureId, jump, stageId, page, parameter, itemNeedInfo)
  ld("Adventure", function()
    local data = CurrencyReturnWindow.GetTrialDataByFeatureId(featureId)
    if data then
      local fun = function()
        if stageId then
          local stageData = TableData.GetConfig(stageId, "BaseStage")
          if stageData then
            if AdventureData.GetStageOpen(stageData.chapter_id, stageData.id) and itemNeedInfo then
              if itemNeedInfo.itemNeedCount and itemNeedInfo.itemNeedCount > 0 then
                ld("Sweep")
                SweepData.InitSweepTarget({
                  stageId = stageId,
                  targetItemId = itemNeedInfo.itemId,
                  targetItemCount = itemNeedInfo.itemNeedCount,
                  curItemGotCount = 0,
                  fromCardId = itemNeedInfo.fromCardId
                })
              else
                ld("Sweep")
                SweepData.ClearData()
              end
            end
            if jump then
              JumpToWindow(WinResConfig.DailyMapWindow.name, nil, nil, {data = data, stageId = stageId})
            else
              OpenWindow(WinResConfig.DailyMapWindow.name, nil, {data = data, stageId = stageId})
            end
          end
        else
          AdventureMgr.dailyMapIndex = 1
          if jump then
            JumpToWindow(WinResConfig.DailyMapWindow.name, nil, nil, {data = data})
          else
            OpenWindow(WinResConfig.DailyMapWindow.name, nil, {data = data})
          end
        end
      end
      AdventureService.GetSceneInfoReq({
        data.type
      }, function()
        local sceneInfo = AdventureData.GetSceneData(data.type)
        if sceneInfo then
          if not sceneInfo.unlocked then
            local featureData = TableData.GetConfig(featureId, "BaseFeature")
            if featureData and featureData.unlock_des then
              FloatTipsUtil.ShowWarnTips(featureData.unlock_des())
            end
            return
          end
          if not sceneInfo.inOpenTime then
            FloatTipsUtil.ShowWarnTips(data.des())
            return
          end
          if AdventureData.GetChapterUnlocked(data.chapter_id) then
            fun()
          else
            AdventureService.GetChapterStageReq(data.chapter_id, function()
              fun()
            end)
          end
        end
      end)
    end
  end)
end

function CurrencyReturnWindow.jumpMainLine(jump)
  ld("Adventure", function()
    AdventureService.GetSceneInfoReq({
      ProtoEnum.SCENE_TYPE.MAIN_LINE
    }, function()
      AdventureMgr.EnterPlotMain()
      if jump then
        JumpToWindow(WinResConfig.PlotDungeonWindow.name)
      else
        OpenWindow(WinResConfig.PlotDungeonWindow.name)
      end
    end)
  end)
end

function CurrencyReturnWindow.jumpBoss(jump, stageId, page, parameter)
  ld("BossDungeon", function()
    local chapterId = BossDungeonMgr.GetJumpChapterId(parameter, stageId)
    if chapterId then
      ld("AbyssExplore", function()
        if AbyssExploreMgr and AbyssExploreMgr.Exists() then
          if jump then
            JumpToWindow(WinResConfig.AbyssWindow.name)
          else
            OpenWindow(WinResConfig.AbyssWindow.name)
          end
          AbyssExploreMgr.GoToBossChallenge(chapterId)
        else
          AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ABYSS, function()
            AbyssExploreMgr.GoToBossChallenge(chapterId)
          end, jump)
        end
      end)
    end
  end)
end

function CurrencyReturnWindow.jumpMail(jump)
  ld("Mail", function()
    MailService.GetAllMailsReq(0, function()
      MailMgr.OpenMailWindow(jump)
    end)
  end)
end

function CurrencyReturnWindow.jumpArena(jump)
  ld("Arena", function()
    ArenaService.ArenaGetAllReq(function()
      if ArenaData.Info.seasonStat == ProtoEnum.ARENA_SEASON_STAT.DAILY_SETTLE or ArenaData.Info.seasonStat == ProtoEnum.ARENA_SEASON_STAT.SETTLE or ArenaData.Info.seasonStat == ProtoEnum.ARENA_SEASON_STAT.CLOSE then
        FloatTipsUtil.ShowWarnTips(T(439))
        return
      end
      if jump then
        JumpToWindow(WinResConfig.ArenaWindow.name)
      else
        OpenWindow(WinResConfig.ArenaWindow.name)
      end
    end)
  end)
end

function CurrencyReturnWindow.jumpPassport(jump)
  PassportService.GetBattlePassInfoReq(function()
    PassportMgr.OpenPassportWindow(jump)
  end)
end

function CurrencyReturnWindow.jumpGuild(jump)
  ld("Guild", function()
    GuildService.EnterGuild(jump)
  end)
end

function CurrencyReturnWindow.jumpLottery(jump, stageId)
  ld("Lottery", function()
    LotteryService.GetGachaInfoReq(jump, function()
      if stageId and LotteryData.Info.openList[stageId] == nil then
        return
      end
      if jump then
        JumpToWindow(WinResConfig.LotteryWindow.name, nil, nil, stageId)
      else
        OpenWindow(WinResConfig.LotteryWindow.name, nil, stageId)
      end
    end)
  end)
end

function CurrencyReturnWindow.jumpCarnival(jump)
  if jump then
    JumpToWindow(WinResConfig.CarnivalWindow.name, nil, nil, ACTIVITY_ID.CARNIVAL)
  else
    OpenWindow(WinResConfig.CarnivalWindow.name, nil, ACTIVITY_ID.CARNIVAL)
  end
end

function CurrencyReturnWindow.jumpDayTask(jump)
  if jump then
    JumpToWindow(WinResConfig.CarnivalWindow.name, nil, nil, ACTIVITY_ID.DAILY_TASK)
  else
    OpenWindow(WinResConfig.CarnivalWindow.name, nil, ACTIVITY_ID.DAILY_TASK)
  end
end

function CurrencyReturnWindow.jumpFriend(jump)
  ld("Friend", function()
    FriendMgr.TryToOpenFriendWindow(jump)
  end)
end

function CurrencyReturnWindow.jumpSetting(jump)
  if jump then
    JumpToWindow(WinResConfig.ActorInfoWindow.name)
  else
    OpenWindow(WinResConfig.ActorInfoWindow.name)
  end
end

function CurrencyReturnWindow.jumpLookRole(jump)
  if jump then
    JumpToWindow(WinResConfig.WatchWindow.name)
  else
    OpenWindow(WinResConfig.WatchWindow.name)
  end
end

function CurrencyReturnWindow.jumpBadge(jump)
  ld("Badge", function()
    if jump then
      JumpToWindow(WinResConfig.BadgeWindow.name)
    else
      OpenWindow(WinResConfig.BadgeWindow.name)
    end
  end)
end

function CurrencyReturnWindow.jumpTakePhoto(jump)
end

function CurrencyReturnWindow.jumpBiography(jump, biographyId)
  if jump then
    JumpToWindow(WinResConfig.CarnivalWindow.name, nil, nil, ACTIVITY_ID.BIOGRAPHY, biographyId)
  else
    OpenWindow(WinResConfig.CarnivalWindow.name, nil, ACTIVITY_ID.BIOGRAPHY, biographyId)
  end
end

function CurrencyReturnWindow.jumpChat(jump)
  ld("Chat", function()
    if jump then
      JumpToWindow(WinResConfig.ChatWindow.name)
    else
      OpenWindow(WinResConfig.ChatWindow.name)
    end
  end)
end

function CurrencyReturnWindow.jumpExplore(jump)
  CurrencyReturnWindow.jumpAdventure(jump)
end

function CurrencyReturnWindow.jumpNotice(jump)
  ld("Notice", function()
    NoticeService.GetAllNoticesReq(true, jump)
  end)
end

function CurrencyReturnWindow.jumpTaskList(jump)
  if jump then
    JumpToWindow(WinResConfig.CarnivalWindow.name, nil, nil, CarnivalData.GetEnterActivityId())
  else
    OpenWindow(WinResConfig.CarnivalWindow.name, nil, CarnivalData.GetEnterActivityId())
  end
end

function CurrencyReturnWindow.jumpStory(jump)
  ActorService.GetStoryListReq(0)
  ld("Story", function()
    StoryService.GetStoryMonsterListReq(function()
      if jump then
        JumpToWindow(WinResConfig.StoryWindow.name)
      else
        OpenWindow(WinResConfig.StoryWindow.name)
      end
    end)
  end)
end

function CurrencyReturnWindow.jumpShop(jump, stageId, page, twoPage, notReopen)
  ld("Shop", function()
    if UIMgr:IsWindowOpen(WinResConfig.ShopWindow.name) then
      UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.CHANG_PAGE, page)
      return
    end
    ShopService.PurchaseGetReq(function()
      ShopMgr.recommendPage = 0
      if jump then
        JumpToWindow(WinResConfig.ShopWindow.name, nil, nil, page, twoPage, notReopen)
      else
        OpenWindow(WinResConfig.ShopWindow.name, nil, page, twoPage, notReopen)
      end
    end)
  end)
end

function CurrencyReturnWindow.jumpItemShopOne(jump)
  ld("Shop", function()
    if UIMgr:IsWindowOpen(WinResConfig.ShopWindow.name) then
      UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.CHANG_PAGE, 5, 0)
      return
    end
    ShopService.PurchaseGetReq(function()
      ShopMgr.recommendPage = 0
      if jump then
        JumpToWindow(WinResConfig.ShopWindow.name, nil, nil, 5, 0)
      else
        OpenWindow(WinResConfig.ShopWindow.name, nil, 5, 0)
      end
    end)
  end)
end

function CurrencyReturnWindow.jumpItemShopTwe(jump)
  ld("Shop", function()
    if UIMgr:IsWindowOpen(WinResConfig.ShopWindow.name) then
      UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.CHANG_PAGE, 5, 1)
      return
    end
    ShopService.PurchaseGetReq(function()
      ShopMgr.recommendPage = 0
      if jump then
        JumpToWindow(WinResConfig.ShopWindow.name, nil, nil, 5, 1)
      else
        OpenWindow(WinResConfig.ShopWindow.name, nil, 5, 1)
      end
    end)
  end)
end

function CurrencyReturnWindow.jumpActivityItemDungeon(jump)
  local info = ActivityDungeonData.GetActivityStageByShowId(1)
  local configData = ActivityDungeonData.GetActivityDataByShowId(1)
  if info and configData and configData.cream_chapter_ids then
    local arr = Split(configData.cream_chapter_ids, ":")
    if 3 == #arr then
      local stageId = tonumber(arr[2])
      if stageId and table.contain(info.finishStages, stageId) then
        ActivityDungeonService.GetActivityAllReq(function()
          if jump then
            JumpToWindow(WinResConfig.ActivityMaterialWindow.name)
          else
            OpenWindow(WinResConfig.ActivityMaterialWindow.name)
          end
        end)
      else
        local stageData = TableData.GetConfig(stageId, "BaseStage")
        if stageData then
          FloatTipsUtil.ShowWarnTips(T(1542, stageData.name()))
        end
      end
    end
  end
end

function CurrencyReturnWindow.jumpActivityMinGame(jump)
  local info = ActivityDungeonData.GetActivityStageByShowId(1)
  if info then
    if jump then
      JumpToWindow(WinResConfig.ActivityMiniGameMainWindow.name)
    else
      OpenWindow(WinResConfig.ActivityMiniGameMainWindow.name)
    end
  end
end

function CurrencyReturnWindow.jumpActivityTwoItemDungeon(jump)
  local info = ActivityDungeonData.GetActivityStageByShowId(2)
  local configData = ActivityDungeonData.GetActivityDataByShowId(2)
  if info and configData and configData.cream_chapter_ids then
    local arr = Split(configData.cream_chapter_ids, ":")
    if 3 == #arr then
      local stageId = tonumber(arr[2])
      if stageId and table.contain(info.finishStages, stageId) then
        ActivityDungeonService.GetActivityAllReq(function()
          if jump then
            JumpToWindow(WinResConfig.Activity2MaterialWindow.name)
          else
            OpenWindow(WinResConfig.Activity2MaterialWindow.name)
          end
        end)
      else
        local stageData = TableData.GetConfig(stageId, "BaseStage")
        if stageData then
          FloatTipsUtil.ShowWarnTips(T(1542, stageData.name()))
        end
      end
    end
  end
end

function CurrencyReturnWindow.jumpActivityTwoMinGame(jump)
  local info = ActivityDungeonData.GetActivityStageByShowId(2)
  if info then
    if jump then
      JumpToWindow(WinResConfig.Activity2MiniGameMainWindow.name)
    else
      OpenWindow(WinResConfig.Activity2MiniGameMainWindow.name)
    end
  end
end

function CurrencyReturnWindow.jumpGuildSign(jump)
  ld("Guild", function()
    GuildService.GetMyGuildInfoReq(false, nil, function(msg)
      if msg.info then
        GuildService.GetActorSignInReq(function()
          if jump then
            JumpToWindow(WinResConfig.GuildSupplyWindow.name)
          else
            OpenWindow(WinResConfig.GuildSupplyWindow.name)
          end
        end)
      elseif jump then
        JumpToWindow(WinResConfig.GuildListWindow.name)
      else
        OpenWindow(WinResConfig.GuildListWindow.name)
      end
    end)
  end)
end

function CurrencyReturnWindow.jumpActivityThreeMinGame(jump)
  local info = ActivityDungeonData.GetActivityStageByShowId(3)
  if info then
    if jump then
      JumpToWindow(WinResConfig.Activity3MiniGameMainWindow.name)
    else
      OpenWindow(WinResConfig.Activity3MiniGameMainWindow.name)
    end
  end
end

function CurrencyReturnWindow.jumpActivityThreeItemDungeon(jump)
  local info = ActivityDungeonData.GetActivityStageByShowId(3)
  local configData = ActivityDungeonData.GetActivityDataByShowId(3)
  if info and configData and configData.cream_chapter_ids then
    local arr = Split(configData.cream_chapter_ids, ":")
    if 3 == #arr then
      local stageId = tonumber(arr[2])
      if stageId and table.contain(info.finishStages, stageId) then
        ActivityDungeonService.GetActivityAllReq(function()
          if jump then
            JumpToWindow(WinResConfig.Activity3MaterialWindow.name)
          else
            OpenWindow(WinResConfig.Activity3MaterialWindow.name)
          end
        end)
      else
        local stageData = TableData.GetConfig(stageId, "BaseStage")
        if stageData then
          FloatTipsUtil.ShowWarnTips(T(1542, stageData.name()))
        end
      end
    end
  end
end

return CurrencyReturnWindow
