RedDotFrostDungeon = {}
local HasAnyRewardsByStageId = function(stageId)
  local challenges = FrostDungeonData.GetLevelChallenges(stageId)
  if challenges then
    for i, v in pairs(challenges) do
      if v.state == ProtoEnum.CHALLENGE_STAT_TYPE.CST_FINISH then
        return true
      end
    end
  end
end
local HasAnyRewards = function()
  local list = FrostDungeonData.GetLevelList()
  if list then
    for i, v in pairs(list) do
      if HasAnyRewardsByStageId(v) then
        return true
      end
    end
  end
end
RedDotFrostDungeon.HasAnyRewards = HasAnyRewards
RedDotFrostDungeon.HasAnyRewardsByStageId = HasAnyRewardsByStageId
