BattleBurstSkill = {}
local ATTR_ENUM = ATTR_ENUM
local BATTLE_UNIT_TYPE = BATTLE_UNIT_TYPE

function BattleBurstSkill.InitLocalVar()
end

function BattleBurstSkill.NewSkill(skillId, camp, burstId)
  local skill = {
    burstId = nil,
    uid = nil,
    skillId = nil,
    skillType = nil,
    camp = nil,
    enemyCamp = nil,
    cachedSkillConfig = nil,
    cachedSkillLevelUpConfigs = {}
  }
  
  function skill:GetSkillConfig()
    if self.cachedSkillConfig == nil then
      self.cachedSkillConfig = TableData.GetConfig(self.skillId, "BaseSkill")
    end
    return self.cachedSkillConfig
  end
  
  function skill:GetSkillLevelUpConfig(id)
    local key = id or self.skillId
    if self.cachedSkillLevelUpConfigs[key] == nil then
      self.cachedSkillLevelUpConfigs[key] = TableData.GetConfig((id or self.skillId) * 1000 + 1, "BaseSkillLevelUp")
    end
    return self.cachedSkillLevelUpConfigs[key]
  end
  
  function skill:Init()
    self.burstId = burstId
    self.skillId = skillId
    self.camp = camp
    if camp == BATTLE_CAMP_FLAG.LEFT then
      self.enemyCamp = BATTLE_CAMP_FLAG.RIGHT
    else
      self.enemyCamp = BATTLE_CAMP_FLAG.LEFT
    end
    self.skillConfig = self:GetSkillConfig()
    self.skillType = self.skillConfig.type
  end
  
  function skill:CanAutoChosen(burst)
    local state = burst:GetEnergySkillState()
    if state ~= BATTLE_BURST_STATE.TO_BE_ACTIVATED_ENABLE then
      return false
    end
    return true
  end
  
  function skill:TriggerSkillBuff()
    local skillLevelUpConfig = self:GetSkillLevelUpConfig()
    if skillLevelUpConfig.buff_list then
      BattleBuffMgr.GetAllBurstBuff(skillLevelUpConfig, {
        skillCamp = self.camp,
        skillId = self.skillId
      })
    end
  end
  
  function skill:Destroy()
    self.skillId = nil
    self.skillConfig = nil
    self = nil
  end
  
  skill:Init()
  return skill
end
