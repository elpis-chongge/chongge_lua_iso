BattleOperation = {}
local ATTR_ENUM = ATTR_ENUM
local burstOperationList = {}
local manuallyOperationList = {}
local pausedBurst, compareIntValue
local skillTypeToSort1 = {}
local skillTypeToSort2 = {}

function BattleOperation.InitLocalVar()
end

function BattleOperation.Init()
  burstOperationList = {}
  manuallyOperationList = {}
  pausedBurst = nil
  local config = TableData.GetConfig(70010201, "BaseFixed")
  compareIntValue = config.int_value
  local strs = ParseConfigStr(config.array_value, "|", ":")
  for i = 1, #strs do
    local str = strs[i]
    for m = 1, #str do
      local n = tonumber(str[m])
      if 1 == i then
        skillTypeToSort1[n] = m
      else
        skillTypeToSort2[n] = m
      end
    end
  end
end

function BattleOperation.SavePausedBurst(burst)
  pausedBurst = burst
end

function BattleOperation.GetPausedBurst()
  local burst = pausedBurst
  pausedBurst = nil
  return burst
end

function BattleOperation.AddBurstOperation(skill, camp)
  local operation = {
    skill = skill,
    frame = BattleControl.curFixedFrame,
    camp = camp
  }
  table.insert(burstOperationList, 1, operation)
end

function BattleOperation.AddManuallyOperation(skill, camp)
  local operation = {
    skill = skill,
    frame = BattleControl.curFixedFrame,
    camp = camp
  }
  table.insert(manuallyOperationList, 1, operation)
end

function BattleOperation.DealOperationList()
  local operation, camp, needSp, skill, burst
  if BattleData.savedSkillInfos then
    local skillInfos = BattleData.savedSkillInfos
    local curFixedFrame = BattleControl.curFixedFrame
    for i = 1, #skillInfos do
      local v = skillInfos[i]
      if v.frame == curFixedFrame then
        if BattleData.isMirror then
          if v.camp == BATTLE_CAMP_FLAG.LEFT then
            burst = BattleScene.GetBurst(BATTLE_CAMP_FLAG.RIGHT)
          elseif v.camp == BATTLE_CAMP_FLAG.RIGHT then
            burst = BattleScene.GetBurst(BATTLE_CAMP_FLAG.LEFT)
          end
        else
          burst = BattleScene.GetBurst(v.camp)
        end
        skill = burst:GetSkill(v.skillId)
        if skill.skillType == SKILL_TYPE_ENUM.BURST then
          local state = burst:GetEnergySkillState()
          if state == BATTLE_BURST_STATE.TO_BE_ACTIVATED_ENABLE then
            if v.burstChooseCardInfos and #v.burstChooseCardInfos > 0 then
              local cardInfos = v.burstChooseCardInfos
              local tempCardInfos = {}
              local cachedUnitTypeCountList = {
                [BATTLE_UNIT_TYPE.DEFENSE] = 0,
                [BATTLE_UNIT_TYPE.MELEE_ATTACK] = 0,
                [BATTLE_UNIT_TYPE.SUPPORT] = 0,
                [BATTLE_UNIT_TYPE.RANGED_ATTACK] = 0
              }
              local count = #cardInfos
              for index = 1, count do
                local uid = cardInfos[index].unitUid
                local unit = BattleScene.GetUnitByUid(uid)
                if unit and 0 == cachedUnitTypeCountList[unit.battleUnitType] then
                  table.insert(tempCardInfos, SimpleCopy(cardInfos[index]))
                end
              end
              BattleData.savedBurstChooseCardInfos[burst.camp] = tempCardInfos
              BattleData.savedBurstCardSkillStartFrame[burst.camp] = v.cardSkillStartFrame
            end
            burst:StartEnergySkill()
            burst:SaveLastActiveSkill(v.skillId)
          end
        end
      end
    end
  else
    local curFixedFrame = BattleControl.curFixedFrame
    for i = #burstOperationList, 1, -1 do
      operation = burstOperationList[i]
      if operation.frame + 1 == curFixedFrame then
        skill = operation.skill
        table.remove(burstOperationList, i)
        camp = operation.camp
        burst = BattleScene.GetBurst(camp)
        if skill.skillType == SKILL_TYPE_ENUM.BURST then
          BattleData.savedBurstChooseCardInfos[burst.camp] = nil
          BattleData.savedBurstCardSkillStartFrame[burst.camp] = nil
          burst:StartEnergySkill()
          burst:SaveLastActiveSkill(skill.skillId)
        end
      end
    end
  end
end

function BattleOperation.ChooseBurstSkill(camp)
  local burst = BattleScene.GetBurst(camp)
  if burst then
    local energySkill = burst.energySkill
    if energySkill:CanAutoChosen(burst) == true then
      BattleOperation.AddBurstOperation(energySkill, camp)
    end
  end
end

function BattleOperation.DealManuallyOperationList()
  local manuallySkills = BattleScene.GetAllManuallySkill()
  if nil == manuallySkills or #manuallySkills <= 0 then
    return
  end
  local operation, camp, skill
  if BattleData.savedManuallySkillInfos then
    local skillInfos = BattleData.savedManuallySkillInfos
    local curFixedFrame = BattleControl.curFixedFrame
    for i = 1, #skillInfos do
      local v = skillInfos[i]
      if v.frame == curFixedFrame then
        skill = BattleScene.GetManuallySkill(v.skillId, v.camp)
        if skill and nil == skill.waitCDFrame and skill.maxActiveCount > skill.activeCount then
          local positionX = v.x
          if BattleData.isMirror then
            positionX = -positionX
          end
          skill:SetPosition({
            x = positionX,
            y = v.y,
            z = v.z
          }, true)
          skill:SetActive(true)
          skill:SetWaitCDFrame()
          BattleScene.AddManuallySkillInfo({
            camp = v.camp,
            skillId = skill.skillId,
            skillLevel = skill.skillLevel,
            x = skill.position.x,
            y = skill.position.y,
            z = skill.position.z,
            frame = BattleControl.curFixedFrame
          })
        else
        end
      end
    end
  else
    local curFixedFrame = BattleControl.curFixedFrame
    for i = #manuallyOperationList, 1, -1 do
      operation = manuallyOperationList[i]
      if operation.frame + 1 == curFixedFrame then
        skill = operation.skill
        table.remove(manuallyOperationList, i)
        camp = operation.camp
        print_battle("处理主动技能：", curFixedFrame, skill.skillId, "释放位置：", skill.position.x, skill.position.y, skill.position.z)
        skill:SetActive(true)
        skill:SetWaitCDFrame()
        BattleScene.AddManuallySkillInfo({
          camp = camp,
          skillId = skill.skillId,
          skillLevel = skill.skillLevel,
          x = skill.position.x,
          y = skill.position.y,
          z = skill.position.z,
          frame = BattleControl.curFixedFrame
        })
      end
    end
  end
end

function BattleOperation.ChooseManuallySkill(camp)
  local skillList = BattleScene.GetManuallySkillByCamp(camp)
  if skillList then
    for i, skill in ipairs(skillList) do
      if skill:CanAutoChosen() then
        local success = skill:SetAutoPosition()
        if success then
          BattleOperation.AddManuallyOperation(skill, camp)
          return
        end
      end
    end
  end
end

function BattleOperation.GetAutoSkillConditionSort(camp)
  local unitList = BattleScene.GetUnitListByCamp(camp)
  local minHpPer
  for i = 1, #unitList do
    local v = unitList[i]
    if v.isBuilding ~= true and v.summonId == nil then
      if nil == minHpPer then
        minHpPer = v.tempHpPer
      else
        minHpPer = math.min(v.tempHpPer, minHpPer)
      end
    end
  end
  if minHpPer and minHpPer < compareIntValue / 10000 then
    return skillTypeToSort2
  else
    return skillTypeToSort1
  end
end

function BattleOperation.Clear()
  burstOperationList = {}
  manuallyOperationList = {}
  pausedBurst = nil
end
