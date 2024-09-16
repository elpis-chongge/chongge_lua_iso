BattleSkillWait = {}

function BattleSkillWait.InitLocalVar()
end

local skillWaitList = {}

function BattleSkillWait.Init()
  skillWaitList = {}
end

function BattleSkillWait.AddSkill(unitUid, skillId, targetUidList, specificCondition)
  local canAdd = true
  local v
  for i = 1, #skillWaitList do
    v = skillWaitList[i]
    if v.skillId == skillId and v.unitUid == unitUid then
      canAdd = false
      return
    end
  end
  if true == canAdd then
    local skill = {
      frame = BattleControl.curFixedFrame,
      unitUid = unitUid,
      skillId = skillId,
      targetUidList = targetUidList,
      specificCondition = specificCondition
    }
    table.insert(skillWaitList, 1, skill)
  end
end

function BattleSkillWait.IsSkillWait(unitUid, skillId)
  local v
  for i = 1, #skillWaitList do
    v = skillWaitList[i]
    if v.unitUid == unitUid and v.skillId == skillId then
      return true
    end
  end
  return false
end

function BattleSkillWait.DealSkillWaitList()
  local battleUnit, skill, remove, skillLevelUpConfig
  for i = #skillWaitList, 1, -1 do
    skill = skillWaitList[i]
    battleUnit = BattleScene.GetUnitByUid(skill.unitUid)
    if nil == battleUnit then
      remove = true
    elseif battleUnit:IsDead() or battleUnit:IsDestroy() then
      remove = true
      local skillConfig = TableData.GetConfig(skill.skillId, "BaseSkill")
      if skillConfig.type == SKILL_TYPE_ENUM.BURST_CARD then
        local burst = BattleScene.GetBurst(battleUnit.camp)
        if burst then
          burst:ResetCardBurstWaitFrame()
        end
      end
    else
      skillLevelUpConfig = battleUnit:GetSkillLevelUpConfig(skill.skillId)
      remove = BattleAction.DealUnitSkill(battleUnit, skill.skillId, skillLevelUpConfig, skill.targetUidList, true, skill.specificCondition)
    end
    if true == remove then
      table.remove(skillWaitList, i)
    end
  end
end

function BattleSkillWait.RemoveSkillWait(unitUid, skillId)
  local v
  for i = 1, #skillWaitList do
    v = skillWaitList[i]
    if v.unitUid == unitUid and v.skillId == skillId then
      table.remove(skillWaitList, i)
      return
    end
  end
end

function BattleSkillWait.Clear()
  skillWaitList = {}
end
