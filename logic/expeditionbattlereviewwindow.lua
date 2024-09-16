require("Expedition_BattleReviewWindowByName")
local ExpeditionBattleReviewWindow = {}
local uis, contentPane, selectedChapterIndex, RefreshRecords
local Seconds2TimeStr = function(seconds)
  local minutes = math.floor(seconds / 60)
  seconds = math.floor(seconds % 60)
  return string.format("%02d:%02d", minutes, seconds)
end
local Frames2TimeStr = function(frames)
  local seconds = frames / BATTLE_CONFIG_ENUM.FIXED_FPS
  return Seconds2TimeStr(seconds)
end
local SetStageBattleRecordDetail = function(battleRecords, gcmp)
  local detaillist = gcmp:GetChild("TipsList")
  detaillist.defaultItem = "ui://sksayrjcn76j1s"
  
  function detaillist.itemRenderer(_, gcmp2)
    local switchBtn
    for i = 1, 2 do
      local battleRecord = battleRecords[i]
      if battleRecord then
        local battleData = battleRecord.battleData
        local initData = battleData.initData
        local selfCards = initData.actorLeft.unitList
        local time = Frames2TimeStr(battleData.totalFrame)
        local name = string.format("Wave%s", i)
        local child = gcmp2:GetChild(name)
        ChangeUIController(child, "c1", i - 1)
        UIUtil.SetText(child, T(20239), "WordTxt")
        UIUtil.SetText(child, time, "TimeTxt")
        local headlist = child:GetChild("HeadList")
        local stageConf = TableData.GetConfig(initData.stageId, "BaseStage")
        local mapList = stageConf.expedition_map_list
        local config = TableData.GetConfig(mapList[i], "BaseExpeditionMap")
        local numCards, limit = #selfCards, config.role_num
        headlist.defaultItem = "ui://sksayrjcn76j24"
        
        function headlist.itemRenderer(k, gcmp3)
          if k < limit then
            if k < numCards then
              ChangeUIController(gcmp3, "c2", 0)
              local card = selfCards[k + 1]
              UIUtil.ShowCardTips(card, gcmp3)
              UIUtil.SetHeadByFaceId(card.fashionId, gcmp3:GetChild("HeadBg"):GetChild("PicLoader"), HEAD_ICON_TYPE_ENUM.RECT)
            else
              ChangeUIController(gcmp3, "c2", 1)
            end
          else
            ChangeUIController(gcmp3, "c2", 2)
          end
        end
        
        headlist.numItems = 8
        if 1 == i then
          switchBtn = child:GetChild("SwitchBtn")
        end
      end
    end
    if switchBtn then
      ChangeUIController(switchBtn, "button", 0)
      switchBtn.onClick:Set(function()
        for i = 1, 2 do
          local name = string.format("Wave%s", i)
          local child = gcmp2:GetChild(name)
          local headlist = child:GetChild("HeadList")
          for j = 1, headlist.numItems do
            local ctrl = headlist:GetChildAt(j - 1):GetController("c1")
            ctrl.selectedIndex = (ctrl.selectedIndex + 1) % 2
          end
        end
      end)
    end
  end
  
  detaillist.numItems = 1
end
local extend = 70
local RecordListItemRenderer = function(i, gcmp)
  local expedData = ExpeditionData.GetData()
  local records = expedData.records
  local chapterId = expedData.chapters[selectedChapterIndex].chapterId
  local chapterConf = TableData.GetConfig(chapterId, "BaseChapter")
  local stages = chapterConf.stages
  local title = T(20249)
  local time = T(20232)
  local stageIndex = i + 1
  local stageId = stages[stageIndex]
  local subgcmp = gcmp:GetChild("ReviewTips1")
  ChangeUIController(subgcmp, "c1", i)
  local k = table.keyof(records, stageId, "stageId")
  gcmp.touchable = nil ~= k
  subgcmp.touchable = nil ~= k
  local maxStars, numStars = 3, 0
  local record = k and records[k]
  ChangeUIController(subgcmp, "c2", record and 0 or 1)
  if record then
    local totalSeconds = 0
    local stageBattleRecords = ExpeditionData.GetStageBattleRecords()
    local battleRecords = stageBattleRecords[record.stageId]
    for _, v in pairs(battleRecords) do
      local battleData = v.battleData
      totalSeconds = totalSeconds + math.floor(battleData.totalFrame / BATTLE_CONFIG_ENUM.FIXED_FPS)
    end
    title = T(20231)
    time = Seconds2TimeStr(totalSeconds)
    SetStageBattleRecordDetail(battleRecords, gcmp)
    gcmp.onClick:Set(function()
    end)
    subgcmp.onClick:Set(function()
      local recordlist = uis.Main.TipsList
      local selectedIndex = recordlist.selectedIndex
      if selectedIndex == i then
        recordlist.selectedIndex = -1
        if selectedIndex > -1 and selectedIndex < 2 then
          local item = recordlist:GetChildAt(selectedIndex)
          LeanTween.delayedCall(0.025, function()
            item.width = item.width + extend
          end)
        end
        return
      end
      recordlist.selectedIndex = i
      if selectedIndex > -1 and selectedIndex < 2 then
        local item = recordlist:GetChildAt(selectedIndex)
        LeanTween.delayedCall(0.025, function()
          item.width = item.width + extend
        end)
      end
      if i > -1 and i < 2 then
        local item = recordlist:GetChildAt(i)
        LeanTween.delayedCall(0.025, function()
          item.width = item.width - extend
        end)
      end
      local target = i * (239 + recordlist.columnGap)
      LeanTween.value(recordlist.scrollPane.posX, target, 0.25):setOnUpdate(function(val)
        recordlist.scrollPane:SetPosX(val, false)
      end)
    end)
  end
  local starlist = subgcmp:GetChild("StarList")
  starlist.numItems = maxStars
  local achievedCnt = ExpeditionMgr.GetAchievedChallengeCount(stageId)
  for j = 1, maxStars do
    local child = starlist:GetChildAt(j - 1)
    ChangeUIController(child, "c1", j <= achievedCnt and 1 or 0)
  end
  UIUtil.SetText(subgcmp, title)
  subgcmp:GetChild("WordTxt").visible = true
  UIUtil.SetText(subgcmp, time, "TimeTxt")
end
local wait = false

function RefreshRecords(expedData, chapterIndex)
  selectedChapterIndex = chapterIndex
  local chapters = expedData.chapters
  local tabParent = uis.Main.ReviewTabRegion.root
  ChangeUIController(tabParent, "c1", chapterIndex - 1)
  for i = 1, 4 do
    local child = tabParent:GetChild(string.format("Tab%sBtn", i))
    local switch_progress = 0
    local chapterId = chapters[i].chapterId
    local chapterConf = TableData.GetConfig(chapterId, "BaseChapter")
    local stages = chapterConf.stages
    local chapterName = string.format("%02d", i)
    UIUtil.SetText(child, chapterName, "NumberTxt")
    local selected = i == chapterIndex
    local unlock, _, _ = ExpeditionMgr.IsChapterUnlock(chapterId)
    if unlock then
      ChangeUIController(child, "c1", selected and 1 or 0)
    else
      ChangeUIController(child, "c1", 2)
    end
    child.onClick:Set(function()
      if wait then
        return
      end
      if unlock then
        if selectedChapterIndex == i then
          return
        end
        local recordlist = uis.Main.TipsList
        local selectedIndex = recordlist.selectedIndex
        if selectedIndex > -1 and selectedIndex < 2 then
          local item = recordlist:GetChildAt(selectedIndex)
          item.width = item.width + extend
        end
        recordlist.selectedIndex = -1
        wait = true
        ExpeditionMgr.RequestStageRecords(i, function()
          wait = false
          RefreshRecords(expedData, i)
        end, true)
      else
        FloatTipsUtil.ShowWarnTips(T(20233))
      end
    end)
    if selected then
      local nameTitle = chapterConf.name()
      uis.Main.ReviewTitle.NameTxt.text = nameTitle
      local recordlist = uis.Main.TipsList
      local numItems = #stages
      recordlist.numItems = numItems
    end
  end
end

function ExpeditionBattleReviewWindow.ReInitData()
end

local jumpTb

function ExpeditionBattleReviewWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExpeditionBattleReviewWindow.package, WinResConfig.ExpeditionBattleReviewWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExpedition_BattleReviewWindowUis(contentPane)
    jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ExpeditionBattleReviewWindow.name, uis.Main.CurrencyReturn)
    ExpeditionBattleReviewWindow.UpdateInfo()
    ExpeditionBattleReviewWindow.InitBtn()
  end)
end

function ExpeditionBattleReviewWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(11703, "BaseFeature").back_ground)
  local recordlist = uis.Main.TipsList
  recordlist.defaultItem = "ui://sksayrjcn76j2c"
  recordlist.itemRenderer = RecordListItemRenderer
  local expedData = ExpeditionData.GetData()
  uis.Main.ReviewProgress.NumberTxt.text = expedData.highPassStar
  local chapterIndex, stageIndex = ExpeditionMgr.GetLatestChapterIndex()
  local chapters = expedData.chapters
  if stageIndex then
    while chapterIndex > 0 and stageIndex > 0 do
      local chapterId = chapters[chapterIndex].chapterId
      local chapterConf = TableData.GetConfig(chapterId, "BaseChapter")
      local stageId = chapterConf.stages[stageIndex]
      if not stageId or not ExpeditionMgr.IsStagePassed(stageId) then
        stageIndex = stageIndex - 1
        if stageIndex <= 0 then
          chapterIndex = chapterIndex - 1
          stageIndex = 3
        end
      elseif ExpeditionMgr.IsStagePassed(stageId) then
        break
      end
    end
  end
  local name
  if chapterIndex > 0 and stageIndex > 0 then
    local chapterId = chapters[chapterIndex].chapterId
    local chapterConf = TableData.GetConfig(chapterId, "BaseChapter")
    local stageId = chapterConf.stages[stageIndex]
    local stageConf = TableData.GetConfig(stageId, "BaseStage")
    name = stageConf.name()
  else
    name = "--"
  end
  local content = T(20240, name)
  uis.Main.ReviewProgress.WordTxt.text = content
  local defaultChapterIndex = 1
  ExpeditionMgr.RequestStageRecords(defaultChapterIndex, function()
    RefreshRecords(expedData, defaultChapterIndex)
  end, true)
end

function ExpeditionBattleReviewWindow.InitBtn()
end

function ExpeditionBattleReviewWindow.OnClose()
  uis = nil
  contentPane = nil
  selectedChapterIndex = nil
  wait = false
end

return ExpeditionBattleReviewWindow
