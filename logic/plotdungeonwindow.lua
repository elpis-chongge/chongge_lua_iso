require("PlotDungeon_PlotDungeonWindowByName")
local PlotDungeonWindow = {}
local uis, contentPane, currentSelectChapter, curChapterData, currentChapterIndex, jumpTb, playAnim
local pointPath = {
  "Assets/Art/Models/UI_spine/prefab/ui_adventure_point1.prefab",
  "Assets/Art/Models/UI_spine/prefab/ui_adventure_point2.prefab",
  "Assets/Art/Models/UI_spine/prefab/ui_adventure_point3.prefab"
}
local spinePoint

function PlotDungeonWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.PlotDungeonWindow.package, WinResConfig.PlotDungeonWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    currentSelectChapter = bridgeObj.argTable[1]
    uis = GetPlotDungeon_PlotDungeonWindowUis(contentPane)
    if bridgeObj.argTable[2] then
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.PLOT_CHAPTER_NEXT3)
      playAnim = true
      UIMgr:SetWindowArgs(WinResConfig.PlotDungeonWindow.name, {
        bridgeObj.argTable[1],
        nil
      })
      UIMgr:CloseWindow(WinResConfig.OpenTitleWindow.name, true, true)
      UIMgr:CloseWindow(WinResConfig.OpenSceneWindow.name, true, true)
    end
    PlotDungeonWindow.ChapterEndTips()
    PlotDungeonWindow.ChapterOpenTips()
    PlotDungeonWindow.InitInfo()
    PlotDungeonWindow.InitBtn()
    SoundUtil.PlayMusic(30001)
    BiographyService.GetPlantInfoReq()
    PlotDungeonWindow.InitChapterReward()
    if GuideMgr.openAbyssTips and not AdventureMgr.GetPlayEndChapterId() and not AdventureMgr.ShowChapterEndTips() then
      LeanTween.delayedCall(0.25, function()
        OpenWindow(WinResConfig.AbyssButtonTipsWindow.name, UILayer.Guide, true)
      end)
      GuideMgr.openAbyssTips = nil
    end
  end)
end

function PlotDungeonWindow.LoadSpine(animName)
  local adventureSpine = UIUtil.SetEffectToUI("Assets/Art/Models/UI_spine/prefab/UI_adventure_vines.prefab", uis.Main.EffectHolder, Const.DefaultShowSpineScale)
  if adventureSpine then
    if "in" == animName then
      if AdventureMgr.playSpineAnim then
        AdventureMgr.playSpineAnim = nil
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.PLOT_MAIN_IN)
        SkeletonAnimationUtil.SetAnimation(adventureSpine, 0, animName, false, 0, function()
        end)
      end
    else
      SkeletonAnimationUtil.SetAnimation(adventureSpine, 0, animName, false, 0, function()
      end)
    end
  end
end

function PlotDungeonWindow.InitInfo()
  if uis then
    local info = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
    if currentSelectChapter and info.currentChapter >= currentSelectChapter then
      PlotDungeonWindow.ShowChapterInfo(currentSelectChapter, true)
      if playAnim then
        PlayUITrans(uis.Main.root, "narrow")
      end
      playAnim = nil
    else
      PlotDungeonWindow.ShowChapterInfo(info.currentChapter)
    end
  end
end

function PlotDungeonWindow.ShowChapterInfo(chapterId)
  local data = TableData.GetConfig(chapterId, "BaseChapter")
  if data then
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(data.back_ground)
    PlotDungeonWindow.ItemOnClick(data)
  end
end

function PlotDungeonWindow.LoadChapterInfo(data)
  if data.map_path then
    if uis.Main.DungeonMap.MapList.numItems > 0 then
      for i = 1, uis.Main.DungeonMap.MapList.numItems do
        uis.Main.DungeonMap.MapList:RemoveChildAt(0, true)
      end
    end
    spinePoint = {}
    local mapPath = Split(data.map_path, ":")
    local chapterMap = UIMgr:CreateObject(mapPath[1], mapPath[2])
    uis.Main.DungeonMap.MapList:AddChild(chapterMap)
    PlotDungeonWindow.ShowStageInfo(chapterMap, data.stages)
  end
end

function PlotDungeonWindow.ShowStageInfo(chapterMap, stages)
  local stateIndex = 0
  local info = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
  local curStage = info.currentStage
  local curStageOpen = info.currentStageOpen
  local lastStage = true
  local stageNum = #stages
  local index
  local len = #pointPath
  local maxPerx
  local scrollPane = uis.Main.DungeonMap.MapList.scrollPane
  local lastPerx = scrollPane.percX
  local soundEnd = true
  scrollPane.onScroll:Set(function()
    if maxPerx and scrollPane.percX >= maxPerx then
      scrollPane:CancelDragging()
      uis.Main.DungeonMap.MapList:StopDrag()
      scrollPane.percX = maxPerx
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.PLOT_CHAPTER_STOP)
      soundEnd = true
    end
    if soundEnd then
      lastPerx = scrollPane.percX
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.PLOT_CHAPTER_IN)
      soundEnd = false
    end
  end)
  scrollPane.onScrollEnd:Set(function()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.PLOT_CHAPTER_STOP)
    soundEnd = true
  end)
  
  function scrollPane.onScrollUpdateLua(x, y)
    local value = math.abs(x) / 30
    SoundManager:SetSystemParameter("parameter:/system/ui_chapt_slide_velocity", math.min(value, 100))
  end
  
  local ResetStage = function()
    if uis then
      for i = 1, stageNum do
        ChangeUIController(chapterMap:GetChild("Q" .. i), "c2", 0)
      end
    end
  end
  for i = 1, stageNum do
    local unlocked = false
    local stageCom = chapterMap:GetChild("Q" .. i)
    if stageCom then
      local btn = stageCom:GetChild("PlotInfoBtn")
      if btn then
        ChangeUIController(stageCom, "c2", 0)
        local stageData = TableData.GetConfig(stages[i], "BaseStage")
        if curStage > stageData.id or 0 == curStage then
          unlocked = true
          ChangeUIController(stageCom, "c1", 1)
          ChangeUIController(btn, "c2", 1)
        elseif stageData.id == curStage and curStageOpen then
          ChangeUIController(stageCom, "c1", 1)
          unlocked = true
          ChangeUIController(btn, "c2", 0)
          if AdventureData.CanShowStageNew(stageData.id) then
            ChangeUIController(btn, "c3", 1)
          else
            ChangeUIController(btn, "c3", 0)
          end
          stateIndex = i
        else
          if nil == maxPerx then
            maxPerx = (i - 2) / (stageNum - 1)
          end
          lastStage = false
          ChangeUIController(stageCom, "c1", 0)
        end
        index = i % len
        index = 0 == index and len or index
        if nil == spinePoint[i] and (unlocked or i <= stateIndex + 1) then
          spinePoint[i] = UIUtil.SetEffectToUI(pointPath[index], stageCom:GetChild("EffectHolder"):GetChild("EffectHolder"))
          if spinePoint[i] then
            LuaUtil.SetScale(spinePoint[i], 100, 100, 100)
          end
        end
        if unlocked then
          UIUtil.SetText(btn, stageData.name_detail(), "NameTxt")
          UIUtil.SetText(btn, stageData.name(), "NumberTxt")
          if stageData.type == ProtoEnum.STAGE_TYPE.DISPOSABLE then
            if -1 == stageData.challenge_num or stageData.challenge_num > 1 then
              ChangeUIController(btn, "c1", 1)
            else
              ChangeUIController(btn, "c1", 0)
            end
          elseif stageData.type == ProtoEnum.STAGE_TYPE.PLOT then
            ChangeUIController(btn, "c1", 2)
          elseif stageData.type == ProtoEnum.STAGE_TYPE.BOX then
            ChangeUIController(btn, "c1", 3)
          end
          if stateIndex == i and AdventureMgr.tempStageId and curStage > AdventureMgr.tempStageId or stateIndex == i and AdventureMgr.firstOpenChapter then
            AdventureMgr.tempStageId = curStage
            AdventureMgr.firstOpenChapter = nil
            PlayUITrans(stageCom, "up")
            SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.PLOT_STAGE_IN)
            SkeletonAnimationUtil.SetAnimation(spinePoint[i], 0, "idle1", true)
            TimerUtil.setTimeout(0.25, function()
              if spinePoint and spinePoint[i] then
                SkeletonAnimationUtil.SetAnimation(spinePoint[i], 0, "change", false, 0, function()
                  SkeletonAnimationUtil.SetAnimation(spinePoint[i], 0, "idle2", true)
                end)
              end
            end)
          elseif spinePoint[i] then
            SkeletonAnimationUtil.SetAnimation(spinePoint[i], 0, "idle2", true)
          end
        elseif spinePoint[i] then
          SkeletonAnimationUtil.SetAnimation(spinePoint[i], 0, "idle1", true)
        end
        btn.onClick:Set(function()
          local sceneInfo = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
          if stageData.id < sceneInfo.currentStage or 0 == sceneInfo.currentStage then
            if stageData.type == ProtoEnum.STAGE_TYPE.PLOT then
              MessageBox.Show(T(1165), {
                touchCallback = function()
                  uis.Main.PlotBtn.onClick:Call()
                end
              }, {})
            else
              FloatTipsUtil.ShowWarnTips(T(1164))
            end
            return
          end
          if stageData.type == ProtoEnum.STAGE_TYPE.PLOT then
            scrollPane:SetPercX((i - 1) / (stageNum - 1), true)
            TimerUtil.setTimeout(0.3, function()
              PlotDungeonWindow.StageItemClick(unlocked, stageData, nil, btn)
            end)
          else
            for ii = 1, stageNum do
              stageCom = chapterMap:GetChild("Q" .. ii)
              if i == ii then
                ChangeUIController(stageCom, "c2", 0)
              elseif i - 1 == ii then
                ChangeUIController(stageCom, "c2", 1)
              else
                ChangeUIController(stageCom, "c2", 2)
              end
            end
            scrollPane:SetPercX((i - 1) / (stageNum - 1), true)
            PlotDungeonWindow.StageItemClick(unlocked, stageData, ResetStage, btn)
          end
        end)
      end
    end
  end
  if 0 == curStage or lastStage then
    stateIndex = lastStage and stageNum or 1
  end
  scrollPane:SetPercX((stateIndex - 1) / (stageNum - 1))
  if AdventureMgr.playListAnim then
    PlayUITrans(uis.Main.DungeonMap.root, "in")
    AdventureMgr.playListAnim = nil
  end
end

function PlotDungeonWindow.StageItemClick(unlocked, stage_Data, resetStageFunc, plotButton)
  if unlocked then
    if stage_Data.type == ProtoEnum.STAGE_TYPE.PLOT then
      if stage_Data.cost then
        local bol = false
        local energy = false
        local arr = GetConfigItemList(stage_Data.cost, true)
        for i, v in pairs(arr) do
          if ActorData.GetItemCount(v.id) < v.value then
            bol = true
            if v.id == COMMON_ITEM_ID.ENERGY then
              energy = true
            end
          end
        end
        if bol then
          if energy then
            ld("Energy", function()
              EnergyService.GetEnergyRecoverInfoReq()
            end)
          end
          return
        end
      end
      ld("PlotPlay", function()
        PlotPlayMgr.PlayPlot(stage_Data.story_id, nil, nil, function()
          ld("Battle", function()
            local sendMsg = {}
            sendMsg.stageId = stage_Data.id
            sendMsg.win = true
            sendMsg.sceneType = ProtoEnum.SCENE_TYPE.MAIN_LINE
            BattleMgr.SendBattleOverMsg(sendMsg)
          end)
        end, nil, nil, PLOT_PLAY_TYPE.MAIN_LINE)
      end)
      ChangeUIController(plotButton, "c3", 0)
      AdventureData.SaveDailyStageNew(stage_Data.id)
    elseif EnterClampUtil.WhetherToEnter(FEATURE_ENUM.STAGE_INFO_WINDOW, false) == true then
      OpenWindow(WinResConfig.DungeonInfoWindow.name, nil, {
        stageId = stage_Data.id
      }, resetStageFunc)
    else
      ld("Formation", function()
        local params = {
          sceneType = ProtoEnum.SCENE_TYPE.MAIN_LINE,
          stageId = stage_Data.id
        }
        FormationMgr.TryOpenFormationWindow(params)
      end)
    end
    UIMgr:SetWindowArgs(WinResConfig.PlotDungeonWindow.name, {
      stage_Data.chapter_id,
      nil
    })
    print(">>>>>>>\232\174\190\231\189\174\229\189\147\229\137\141\231\171\160\232\138\130>>>>>>>>", stage_Data.chapter_id)
  else
    FloatTipsUtil.ShowWarnTips(T(229))
  end
end

function PlotDungeonWindow.ItemOnClick(data)
  currentSelectChapter = data.id
  curChapterData = data
  uis.Main.Title.NumberTxt.text = data.name()
  currentChapterIndex = tonumber(data.name())
  uis.Main.Title.NameTxt.text = data.name_detail()
  uis.Main.Title.SubtitleTxt.text = data.chapter_english()
  uis.Main.Title.WordTxt.text = data.des()
  PlotDungeonWindow.LoadChapterInfo(data)
  PlotDungeonWindow.UpdateChapterPage()
  if data.biography_id then
    local biographyData = TableData.GetConfig(data.biography_id, "BaseBiography")
    if biographyData and biographyData.chapter_icon then
      uis.Main.RewardBtn:GetChild("PicLoader").url = UIUtil.GetResUrl(biographyData.chapter_icon)
    end
  end
  uis.Main.RewardBtn.onClick:Set(function()
    if data.biography_id and EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BIOGRAPHY) then
      CurrencyReturnWindow.jumpBiography(nil, data.biography_id)
    end
  end)
  RedDotMgr.AddNode({
    windowName = WinResConfig.PlotDungeonWindow.name,
    com = uis.Main.RewardBtn,
    dataType = RED_DOT_DATA_TYPE.BIOGRAHY,
    visibleFunc = function()
      return RedDotTask.CanBiographyFlower()
    end
  })
  local bol = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BIOGRAPHY, false)
  uis.Main.RewardBtn.visible = bol and true or false
end

function PlotDungeonWindow.UpdateChapterPage()
  if curChapterData then
    local info = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
    local chapterData, numName
    if curChapterData.pre and 0 ~= curChapterData.pre and info.currentChapter >= curChapterData.pre then
      chapterData = TableData.GetConfig(curChapterData.pre, "BaseChapter")
      if chapterData then
        numName = tonumber(chapterData.name())
        if numName then
          UIUtil.SetText(uis.Main.LeftBtn, LuaUtil.FormatNum(numName, "00"), "NumberTxt")
        end
      end
      ChangeController(uis.Main.c1Ctr, 1)
    else
      ChangeController(uis.Main.c1Ctr, 0)
    end
    if info.currentChapter >= curChapterData.next then
      ChangeUIController(uis.Main.RightRegion.RightBtn, "lock", 0)
    else
      ChangeUIController(uis.Main.RightRegion.RightBtn, "lock", 1)
    end
    chapterData = TableData.GetConfig(curChapterData.next, "BaseChapter")
    if chapterData then
      numName = tonumber(chapterData.name())
      if numName then
        UIUtil.SetText(uis.Main.RightRegion.RightBtn, LuaUtil.FormatNum(numName, "00"), "NumberTxt")
      end
      ChangeController(uis.Main.RightRegion.c1Ctr, 0)
    else
      ChangeController(uis.Main.RightRegion.c1Ctr, 1)
    end
    ChangeController(uis.Main.c2Ctr, 1)
  end
end

function PlotDungeonWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.PlotDungeonWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.ADVENTURE_STORY)
  uis.Main.PlotBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_STORY) then
      ActorService.GetStoryListReq(0)
      ld("Story", function()
        StoryService.GetStoryMonsterListReq(function()
          StoryMgr.InitData()
          if currentChapterIndex and currentSelectChapter then
            UIMgr:SetWindowArgs(WinResConfig.PlotDungeonWindow.name, {currentSelectChapter, nil})
            OpenWindow(WinResConfig.StoryWindow.name, nil, currentChapterIndex)
          end
        end)
      end)
    end
  end)
  local bol = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_STORY, false)
  uis.Main.PlotBtn.visible = bol and true or false
  uis.Main.LeftBtn.onClick:Set(function()
    local info = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
    if curChapterData and curChapterData.pre and curChapterData.pre > 0 and info.currentChapter >= curChapterData.pre then
      currentSelectChapter = curChapterData.pre
      playAnim = true
      PlotDungeonWindow.InitInfo()
    end
  end)
  UIUtil.SetText(uis.Main.RightRegion.RightUnknownBtn, T(1261), "WordTxt")
  UIUtil.SetText(uis.Main.RightRegion.RightUnknownBtn, T(1262), "NumberTxt")
  UIUtil.SetText(uis.Main.RightRegion.RightBtn, T(1261), "WordTxt")
  UIUtil.SetText(uis.Main.LeftBtn, T(1261), "WordTxt")
  uis.Main.RightRegion.root.onClick:Set(function()
    if curChapterData then
      local info = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
      if curChapterData.next == nil or 0 == curChapterData.next then
        MessageBox.Show(T(1264), {})
        return
      elseif info.currentChapter >= curChapterData.next then
        currentSelectChapter = curChapterData.next
        playAnim = true
        PlotDungeonWindow.InitInfo()
      elseif curChapterData.next > 0 then
        local tempData = TableData.GetConfig(curChapterData.next, "BaseChapter")
        if tempData and tempData.open_condition then
          local arr = Split(tempData.open_condition, "|")
          for i = 1, #arr do
            local condition = Split(arr[i], ":")
            if 2 == #condition then
              local id = tonumber(condition[1])
              if CONDITION_ENUM.LV == id then
                local lv = tonumber(condition[2])
                if lv > ActorData.GetLevel() then
                  FloatTipsUtil.ShowWarnTips(T(80601001, lv))
                  return
                end
              elseif CONDITION_ENUM.STAGE == id then
                FloatTipsUtil.ShowWarnTips(T(1263))
                return
              end
            end
          end
        end
      end
    end
  end)
end

function PlotDungeonWindow.InitChapterReward()
  local screenInfo = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
  if screenInfo then
    local chapterId = screenInfo.rewardedChapter
    local nextChapterId = AdventureMgr.GetNextRewardedChapter(chapterId)
    nextChapterId = nextChapterId >= screenInfo.currentChapter and screenInfo.currentChapter or nextChapterId
    local data = TableData.GetConfig(nextChapterId, "BaseChapter")
    if data then
      uis.Main.ChapterRewardBtn.onClick:Set(function()
        OpenWindow(WinResConfig.PlotRewardWindow.name)
      end)
    end
    local red = uis.Main.ChapterRewardBtn:GetChild("Red")
    if red then
      red.visible = RedDotPlotDungeon.ShowHome() and true or false
    end
  end
end

function PlotDungeonWindow.ChapterEndTips()
  if AdventureMgr.GetPlayEndChapterId() then
    UIMgr:SetUILayerTouchable(false)
    PlotDungeonWindow.LoadSpine("out")
    LeanTween.delayedCall(0.35, function()
      UIMgr:SetUILayerTouchable(true)
      OpenWindow(WinResConfig.OpenTitleWindow.name)
    end)
  else
    PlotDungeonWindow.LoadSpine("in")
  end
end

function PlotDungeonWindow.OnShown()
  if uis then
    PlotDungeonWindow.InitChapterReward()
  end
end

function PlotDungeonWindow.ChapterOpenTips()
  if AdventureMgr.ShowChapterEndTips() then
    OpenWindow(WinResConfig.OpenSceneWindow.name)
    PlotDungeonWindow.LoadSpine("in")
  end
end

function PlotDungeonWindow.OnClose()
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.PLOT_CHAPTER_STOP)
  uis = nil
  spinePoint = nil
  contentPane = nil
  currentSelectChapter = nil
  currentChapterIndex = nil
  curChapterData = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  RedDotMgr.RemoveNode(WinResConfig.PlotDungeonWindow.name)
end

function PlotDungeonWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Adventure.REFRESH_STAGE then
    if uis.Main.DungeonMap.MapList.numItems > 0 then
      local chapterMap = uis.Main.DungeonMap.MapList:GetChildAt(0)
      local data = TableData.GetConfig(currentSelectChapter, "BaseChapter")
      if data and chapterMap then
        PlotDungeonWindow.ShowStageInfo(chapterMap, data.stages)
      end
    end
  elseif msgId == WindowMsgEnum.Adventure.CHANGE_MAIN_CHAPTER then
    PlotDungeonWindow.ChapterEndTips()
  elseif msgId == WindowMsgEnum.Adventure.UPADTE_CHAPTER_ICON then
    PlotDungeonWindow.InitChapterReward()
  end
end

return PlotDungeonWindow
