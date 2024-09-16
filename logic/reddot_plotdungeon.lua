RedDotPlotDungeon = {}

function RedDotPlotDungeon.ShowHome()
  if AdventureData then
    local screenInfo = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
    if screenInfo then
      local nextChapterId = AdventureMgr.GetNextRewardedChapter(screenInfo.rewardedChapter)
      nextChapterId = nextChapterId >= screenInfo.currentChapter and screenInfo.currentChapter or nextChapterId
      local data = TableData.GetConfig(nextChapterId, "BaseChapter")
      if nextChapterId > screenInfo.rewardedChapter and (data.chapter_reward_stage < screenInfo.currentStage or 0 == screenInfo.currentStage) then
        return true
      end
    end
  end
end
