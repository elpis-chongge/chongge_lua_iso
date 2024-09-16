require("ActivityDungeon1_ChallengeWindowByName")
local ActivityChallengeWindow = {}
local uis, contentPane, activityInfo, scrollingTween

function ActivityChallengeWindow.ReInitData()
end

function ActivityChallengeWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityChallengeWindow.package, WinResConfig.ActivityChallengeWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1_ChallengeWindowUis(contentPane)
    ActivityChallengeWindow.UpdateInfo()
    ActivityChallengeWindow.InitBtn()
  end)
end

local OnScrollCallback = function()
  local bglist = uis.Main.BgList
  local child = bglist:GetChildAt(0)
  local bgWidth = child.width
  local maplist = uis.Main.Map.MapList
  local maxX = bgWidth - bglist.width
  bglist.container.x = -maplist.scrollPane.percX * maxX
end

function ActivityChallengeWindow.UpdateInfo()
  activityInfo = ActivityDungeonData.GetActivityInfo()
  if activityInfo then
    local firstChapterData = ActivityChallengeWindow.GetFirstChapter()
    local curChapterData, curStage = ActivityChallengeWindow.GetCurStage(firstChapterData)
    if curChapterData and curStage then
      AdventureData.SaveDailyStageNew(curChapterData.id, true)
      local chapterIds = ActivityChallengeWindow.GetAllChapterId()
      local curTime = LoginData.GetCurServerTime()
      
      function uis.Main.ChapterList.itemRenderer(i, item)
        local tempData = TableData.GetConfig(chapterIds[i + 1], "BaseChapter")
        if tempData then
          UIUtil.SetText(item, tempData.name(), "NameTxt")
          local lock = ActivityChallengeWindow.GetChapterPassById(tempData.pre)
          if curTime >= activityInfo.normalChapter[tempData.id] and lock then
            ChangeUIController(item, "c1", 1)
            item.onClick:Set(function()
              uis.Main.Map.MapList:RemoveChildren(0, -1, true)
              uis.Main.BgList:RemoveChildren(0, -1, true)
              local bgPath = Split(tempData.back_ground, ":")
              local bg = UIMgr:CreateObject(bgPath[1], bgPath[2])
              uis.Main.BgList:AddChild(bg)
              local path = Split(tempData.map_path, ":")
              local map = UIMgr:CreateObject(path[1], path[2])
              uis.Main.Map.MapList.scrollPane.onScroll:Set(OnScrollCallback)
              uis.Main.Map.MapList:AddChild(map)
              uis.Main.ChapterList.selectedIndex = i
              ActivityChallengeWindow.ShoweStage(map, tempData, true)
            end)
          else
            local tipsTxt
            if activityInfo.normalChapter[tempData.id] > curTime then
              tipsTxt = T(1532, TimeUtil.FormatEnTime(activityInfo.normalChapter[tempData.id] - curTime))
            else
              tipsTxt = T(1533)
            end
            UIUtil.SetText(item:GetChild("Lock"), tipsTxt, "NameTxt")
            ChangeUIController(item, "c1", 0)
            item.onClick:Set(function()
              local str = activityInfo.normalChapter[tempData.id] > curTime and T(1541) or T(1533)
              FloatTipsUtil.ShowWarnTips(str)
            end)
          end
          if tempData.id == curChapterData.id then
            item.onClick:Call()
          end
        end
      end
      
      uis.Main.ChapterList.numItems = #chapterIds
    end
  end
  ActivityChallengeWindow.ShopInfo()
end

function ActivityChallengeWindow.ShoweStage(map, chapterData, anim)
  local curChapterData, curStage, pass = ActivityChallengeWindow.GetCurStage(chapterData, true)
  local x = 0
  for i = 1, #chapterData.stages do
    local stageBtn = map:GetChild(string.format("Point%dBtn", i))
    local stageData = TableData.GetConfig(chapterData.stages[i], "BaseStage")
    if stageBtn and stageData then
      local unlocked = true
      if curStage > stageData.id then
        unlocked = false
        ChangeUIController(stageBtn, "c2", 2)
        stageBtn.onClick:Set(function()
          FloatTipsUtil.ShowWarnTips(T(1540))
        end)
      elseif stageData.id == curStage then
        ChangeUIController(stageBtn, "c2", pass and 2 or 1)
        x = stageBtn.x
        stageBtn.onClick:Set(function()
          if not pass then
            ActivityChallengeWindow.StageItemClick(stageData)
          else
            FloatTipsUtil.ShowWarnTips(T(1540))
          end
        end)
      else
        unlocked = false
        ChangeUIController(stageBtn, "c2", 0)
      end
      ChangeUIController(stageBtn, "c1", stageData.type == ProtoEnum.STAGE_TYPE.PLOT and 1 or 0)
      UIUtil.SetText(stageBtn, stageData.name(), "NameTxt")
    end
  end
  x = x - uis.Main.root.width / 2
  local scrollPane = uis.Main.Map.MapList.scrollPane
  if scrollingTween then
    LeanTween.cancel(scrollingTween.uniqueId)
  end
  if anim then
    scrollingTween = LeanTween.value(scrollPane.posX, x, 0.45):setEase(LeanTweenType.easeInOutQuad):setOnUpdate(function(value)
      scrollPane.posX = value
      OnScrollCallback()
    end):setOnComplete(function()
      scrollPane.posX = x
    end)
  else
    scrollPane:SetPosX(x, false)
  end
end

function ActivityChallengeWindow.StageItemClick(stageData, resetStageFunc)
  if stageData.type == ProtoEnum.STAGE_TYPE.PLOT then
    if stageData.cost then
      local bol = false
      local energy = false
      local arr = GetConfigItemList(stageData.cost, true)
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
      PlotPlayMgr.PlayPlot(stageData.story_id, nil, nil, function()
        ld("Battle", function()
          local sendMsg = {}
          sendMsg.stageId = stageData.id
          sendMsg.win = true
          sendMsg.sceneType = ProtoEnum.SCENE_TYPE.ACTIVITY_NORAML
          BattleMgr.SendBattleOverMsg(sendMsg)
        end)
      end, nil, nil, PLOT_PLAY_TYPE.ACTIVITY_NORAML)
    end)
  elseif EnterClampUtil.WhetherToEnter(FEATURE_ENUM.STAGE_INFO_WINDOW, false) == true then
    OpenWindow(WinResConfig.DungeonInfoWindow.name, nil, {
      stageId = stageData.id
    }, resetStageFunc)
  else
    ld("Formation", function()
      local params = {
        sceneType = ProtoEnum.SCENE_TYPE.ACTIVITY_NORAML,
        stageId = stageData.id
      }
      FormationMgr.TryOpenFormationWindow(params)
    end)
  end
end

function ActivityChallengeWindow.ShopInfo()
  local configData = ActivityDungeonData.GetActivityData()
  if configData and configData.shop_id then
    local shopData = TableData.GetConfig(configData.shop_id, "BaseActivityShop")
    if shopData then
      UIUtil.SetIconById(uis.Main.ShopBtn:GetChild("PicLoader"), shopData.token_id)
      UIUtil.SetText(uis.Main.ShopBtn, ActorData.GetItemCount(shopData.token_id), "NumberTxt")
      uis.Main.ShopBtn.onClick:Set(function()
        OpenWindow(WinResConfig.ActivityShopWindow.name)
      end)
    end
  end
end

function ActivityChallengeWindow.GetChapterPassById(id)
  if nil == id or 0 == id then
    return true
  end
  activityInfo = ActivityDungeonData.GetActivityInfo()
  local chapterData = TableData.GetConfig(id, "BaseChapter")
  if activityInfo and chapterData then
    local stage = activityInfo.finishStages
    local endStage = chapterData.stages[#chapterData.stages]
    if table.contain(stage, endStage) then
      return true
    end
  end
end

function ActivityChallengeWindow.GetCurStage(chapterData, isChapter)
  if chapterData then
    local stage = activityInfo.finishStages
    local endStage = chapterData.stages[#chapterData.stages]
    if table.contain(stage, endStage) then
      if chapterData.next and chapterData.next > 0 and nil == isChapter then
        local nextData = TableData.GetConfig(chapterData.next, "BaseChapter")
        if nextData and LoginData.GetCurServerTime() > activityInfo.normalChapter[nextData.id] then
          return ActivityChallengeWindow.GetCurStage(nextData)
        else
          return chapterData, endStage, true
        end
      else
        return chapterData, endStage, true
      end
    else
      for i = 1, #chapterData.stages do
        if not table.contain(stage, chapterData.stages[i]) then
          return chapterData, chapterData.stages[i]
        end
      end
    end
  end
end

function ActivityChallengeWindow.GetFirstChapter()
  local chapterData
  for i, v in pairs(activityInfo.normalChapter) do
    chapterData = TableData.GetConfig(i, "BaseChapter")
    if chapterData and (chapterData.pre == nil or 0 == chapterData.pre) then
      return chapterData
    end
  end
end

function ActivityChallengeWindow.GetAllChapterId()
  local chapterId = {}
  for i, v in pairs(activityInfo.normalChapter) do
    table.insert(chapterId, i)
  end
  table.sort(chapterId, function(a, b)
    return a < b
  end)
  return chapterId
end

function ActivityChallengeWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(ActivityChallengeWindow.CloseWindow)
  UIUtil.SetText(uis.Main.ShopBtn, T(1515))
end

function ActivityChallengeWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.ActivityChallengeWindow.name)
end

function ActivityChallengeWindow.OnShown()
  if uis then
    ActivityChallengeWindow.UpdateInfo()
  end
end

function ActivityChallengeWindow.OnClose()
  uis = nil
  contentPane = nil
  activityInfo = nil
  if scrollingTween then
    LeanTween.cancel(scrollingTween.uniqueId)
    scrollingTween = nil
  end
end

return ActivityChallengeWindow
