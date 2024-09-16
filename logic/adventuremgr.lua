AdventureMgr = {
  curType = 1,
  dataType = {1},
  dailyMapIndex = 1,
  currentChapter = nil,
  lastPlotChapter = 0
}
AdventureType = {
  STORY_ADVENTURE = 1,
  EXPERIMENT = 2,
  TOWER = 3,
  ARENA = 4,
  RAID_BOSS = 5
}

function AdventureMgr.UpdateChallengeStageData(msg)
  local info = msg.info
  if info then
    AdventureData.SaveOneStageInfo(info)
  end
  local CallBackFun = function()
    local stageData = TableData.GetConfig(msg.stageId, "BaseStage")
    if stageData and msg.sceneType == ProtoEnum.SCENE_TYPE.MAIN_LINE and msg.win then
      if stageData.next then
        UIMgr:SendWindowMessage(WinResConfig.PlotDungeonWindow.name, WindowMsgEnum.Adventure.REFRESH_STAGE)
      else
        AdventureMgr.plotCurChapterEnd = true
        local sceneInfo = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
        if info and sceneInfo and sceneInfo.currentChapter >= info.chapterId then
          AdventureMgr.SaveChangeChapterId(stageData.chapter_id)
          UIMgr:SendWindowMessage(WinResConfig.PlotDungeonWindow.name, WindowMsgEnum.Adventure.CHANGE_MAIN_CHAPTER)
        end
      end
    end
    local type = ProtoEnum.SCENE_TYPE
    local GetStageDataType = {
      type.DAILY_MATERIAL,
      type.DAILY_COIN,
      type.DAILY_SKILL_BOOK,
      type.DAILY_ROLE_EXP,
      type.DAILY_QUALITY_UP,
      type.DAILY_BADGE_EXP,
      type.BOSS_FIRE,
      type.BOSS_WATER,
      type.BOSS_WOOD,
      type.BOSS_LIGHT,
      type.BOSS_DARK
    }
    if table.contain(GetStageDataType, msg.sceneType) and stageData then
      AdventureService.GetChapterStageReq({
        stageData.chapter_id
      })
    end
  end
  if msg.win then
    if msg.sceneType == ProtoEnum.SCENE_TYPE.ACTIVITY_BOSS or msg.sceneType == ProtoEnum.SCENE_TYPE.ACTIVITY_CREAM or msg.sceneType == ProtoEnum.SCENE_TYPE.ACTIVITY_NORAML then
      ActivityDungeonService.GetActivityAllReq()
    else
      AdventureService.GetSceneInfoReq({
        msg.sceneType
      }, CallBackFun)
    end
  else
    CallBackFun()
  end
end

function AdventureMgr.SaveDailyStageNew(sceneType, stageId)
  if sceneType and stageId then
    local types = ProtoEnum.SCENE_TYPE
    if sceneType == types.DAILY_COIN or sceneType == types.DAILY_BADGE_EXP or sceneType == types.DAILY_MATERIAL or sceneType == types.CLIMB_TOWER or sceneType == types.DAILY_ROLE_EXP or sceneType == types.DAILY_SKILL_BOOK or sceneType == types.DAILY_QUALITY_UP then
      if not AdventureData.GetPassedStageInfo(stageId) then
        AdventureData.SaveDailyStageNew(stageId)
      end
    elseif sceneType == types.MAIN_LINE and not AdventureData.IsStagePassed(stageId) then
      AdventureData.SaveDailyStageNew(stageId)
    end
  end
end

function AdventureMgr.GetTowerNextChapterId(curChapter)
  local tb = {}
  local config = TableData.GetTable("BaseChapter")
  for i, v in pairs(config) do
    if v.type == ProtoEnum.SCENE_TYPE.CLIMB_TOWER then
      table.insert(tb, v)
    end
  end
  table.sort(tb, function(a, b)
    return a.id < b.id
  end)
  for i, v in ipairs(tb) do
    if curChapter < v.id then
      return v.id
    end
  end
  return curChapter
end

function AdventureMgr.GetAllPlotChapterId()
  local tb = {}
  local config = TableData.GetTable("BaseChapter")
  for i, v in pairs(config) do
    if v.type == ProtoEnum.SCENE_TYPE.MAIN_LINE then
      table.insert(tb, v)
    end
  end
  table.sort(tb, function(a, b)
    return a.id < b.id
  end)
  return tb
end

function AdventureMgr.GetNextRewardedChapter(curChapter)
  local allId = AdventureMgr.GetAllPlotChapterId()
  for i, v in ipairs(allId) do
    if curChapter < v.id then
      return v.id
    end
  end
  return curChapter
end

local waitPlayEndChapterId

function AdventureMgr.EnterPlotMain()
  AdventureMgr.playSpineAnim = true
  AdventureMgr.playListAnim = true
  waitPlayEndChapterId = nil
  local info = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
  if info then
    AdventureMgr.tempStageId = info.currentStage
  end
end

function AdventureMgr.ClearChapterEnd()
  waitPlayEndChapterId = nil
  print("清除章节结束动画>>>>>>>>>>>>>>>>>>>>>")
end

function AdventureMgr.GetPlayEndChapterId()
  return waitPlayEndChapterId
end

function AdventureMgr.SaveChangeChapterId(chapterId)
  waitPlayEndChapterId = chapterId
  PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.PLOT_ANIM_CHAPTER_OPEN, chapterId)
  print("记录结束开启章节id>>>>>>>>>>>", chapterId)
end

function AdventureMgr.ShowChapterEndTips()
  if waitPlayEndChapterId then
    print("IsShowChapterOpen 章节结束动画未播>>>>>>>>>>>>>>>>>>>>>", waitPlayEndChapterId)
    return
  end
  if GuideMgr.guideBol or GuideMgr.waitStoryId then
    print("IsShowChapterOpen 新手引导中 >>>>>>>>>>>>>>>>>>>>>", GuideMgr.guideBol, GuideMgr.waitStoryId)
    return
  end
  local chapterId = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.PLOT_ANIM_CHAPTER_OPEN)
  local screenInfo = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
  if 0 ~= chapterId and chapterId < screenInfo.currentChapter then
    return true
  end
end

function AdventureMgr.Init()
  AdventureMgr.curType = 1
  AdventureMgr.dataType = {1}
  AdventureMgr.currentChapter = nil
end
