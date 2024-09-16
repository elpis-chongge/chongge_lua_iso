BattleBuffEffect = {}
local tonumber = tonumber
local floor = math.floor
local ceil = math.ceil
local BUFF_EFFECT_VALUE = BUFF_EFFECT_VALUE
local BATTLE_DEPEND_TYPE = BATTLE_DEPEND_TYPE
local EFFECT_ATTR_CAL_TYPE = EFFECT_ATTR_CAL_TYPE
local BUFF_EFFECT_ID = BUFF_EFFECT_ID
local ATTR_ENUM = ATTR_ENUM
local ATTR_ID = ProtoEnum.ATTR_ID
local Split = Split

function BattleBuffEffect.InitLocalVar()
end

function BattleBuffEffect.NewEffect(effectStr, belongBuffUid)
  local effect = {}
  
  function effect:Init()
    local strs = Split(effectStr, ":")
    self.updateValueBeforeHurt = false
    self.effectId = tonumber(strs[1])
    self.effectDepend = tonumber(strs[2])
    self.effectCalType = tonumber(strs[3])
    self.effectCalAttrId = tonumber(strs[4])
    self.effectCalValue = tonumber(strs[5])
    self.effectCalAttrCalType = tonumber(strs[6])
    self.effectCommonParam = tonumber(strs[7])
    self.effectConfig = TableData.GetConfig(self.effectId, "BaseSkillBuffEffect")
    self.controlType = {}
    self.effectTags = {}
    if self.effectConfig then
      self.needShowIcon = self.effectConfig.icon_path ~= nil
      self.attributeId = self.effectConfig.attribute_id
      if self.attributeId and self.attributeId > 0 then
        self.attributeConfig = TableData.GetConfig(self.attributeId, "BaseAttribute")
      end
      self.controlType = self.effectConfig.control_type or {}
      self.effectTags = self.effectConfig.effect_tag or {}
    end
    self.finalValue = 0
    self.belongBuffUid = belongBuffUid
    local belongBuff = BattleBuffMgr.savedBuffList[belongBuffUid]
    self.settleFrame = belongBuff.settleFrame
    self.fromUnitUid = belongBuff.fromUnitUid
    self.fromCardSkillId = belongBuff.fromCardSkillId
    self.toUnitUid = belongBuff.toUnitUid
    self.toBulletUid = belongBuff.toBulletUid
    self.lastToUnitUid = nil
    if belongBuff.triggerFromBuffUid then
      local buff = BattleBuffMgr.savedBuffList[belongBuff.triggerFromBuffUid]
      if buff then
        self.lastToUnitUid = buff.toUnitUid
      end
    end
    self.beAffectedWithEffects = belongBuff.beAffectedWithEffects
    self.shieldMax = nil
    self.shieldSpecialMax = nil
    self.tenacityMax = nil
    self:UpdateValue()
    if self.attributeConfig and self.attributeId ~= ATTR_ID.HP and self.attributeId ~= ATTR_ID.RAGE then
      self.containAttributeValue = true
    end
  end
  
  function effect:UpdateValue(params)
    if self.effectCalType ~= BUFF_EFFECT_VALUE.NONE then
      local settleUnit
      self.finalValue = BattleBuffEffect.GetEffectValue(self, nil, params)
      local belongBuff = BattleBuffMgr.savedBuffList[belongBuffUid]
      if belongBuff.overlayNum then
        self.finalValue = self.finalValue * belongBuff.overlayNum
      end
      local effectConfig = self.effectConfig
      if effectConfig and 1 == effectConfig.be_treat_add then
        local unit = BattleScene.GetUnitByUid(self.fromUnitUid)
        if unit then
          local treatAdd = unit:GetAttr(ATTR_ENUM.treat_add)
          if 0 ~= treatAdd then
            print_battle("治疗buff 挂载时，治疗加成：", treatAdd)
            self.finalValue = floor(MathUtil.TruncateFloat(self.finalValue * (10000 + treatAdd) / 10000))
          end
        end
      end
      if effectConfig and 1 == effectConfig.def then
        settleUnit = settleUnit or BattleScene.GetUnitByUid(self.toUnitUid)
        if settleUnit then
          local fangyu_jianmian = BattleDataCount.PanDingFangYu(nil, settleUnit)
          local kezhi = BattleDataCount.PanDingKeZhiBuff(self, settleUnit)
          self.finalValue = ceil(MathUtil.TruncateFloat(self.finalValue * (10000 + fangyu_jianmian) * (10000 + kezhi) / 100000000))
        end
      end
      if self.attributeId == ATTR_ID.SHIELD then
        settleUnit = settleUnit or BattleScene.GetUnitByUid(self.toUnitUid)
        if settleUnit then
          local contain, effectList = BattleBuffMgr.GetContainedEffect(settleUnit, BUFF_EFFECT_ID.SHIELD_ADD_PER)
          if contain then
            local totalValue = 0
            for _, v in ipairs(effectList) do
              totalValue = totalValue + v.finalValue
            end
            self.finalValue = ceil(MathUtil.TruncateFloat(self.finalValue * (10000 + totalValue) / 10000))
          end
        end
        self.shieldMax = self.finalValue
      elseif self.attributeId == ATTR_ID.TENACITY then
        self.tenacityMax = self.finalValue
      elseif self.attributeId == ATTR_ID.SHIELD_SPECIAL then
        self.shieldSpecialMax = self.finalValue
      elseif self:ContainPersistentDamage() then
        local fromUnit = BattleScene.GetUnitByUid(self.fromUnitUid)
        if fromUnit then
          local contain, effectList = BattleBuffMgr.GetContainedEffect(fromUnit, BUFF_EFFECT_ID.DOT_HURT_ADD_PER)
          if contain then
            local totalValue = 0
            for _, v in ipairs(effectList) do
              totalValue = totalValue + v.finalValue
            end
            self.finalValue = ceil(MathUtil.TruncateFloat(self.finalValue * (10000 + totalValue) / 10000))
          end
        end
      end
    end
  end
  
  function effect:ContainPersistentDamage()
    local effectTags = self.effectTags
    if effectTags then
      for _, tag in ipairs(effectTags) do
        if tag == BUFF_EFFECT_TAG.PERSIST_DAMAGE then
          return true
        end
      end
    end
  end
  
  function effect:UpdateShieldValue(shieldValue)
    if self.finalValue - shieldValue > 0 then
      print_battle("护盾吸收伤害：", self.finalValue - shieldValue, "护盾剩余：", shieldValue)
    end
    self.finalValue = shieldValue
    if self.finalValue <= 0 then
      local belongBuff = BattleBuffMgr.savedBuffList[belongBuffUid]
      if belongBuff and belongBuff:IsShieldUsedUp() == true then
        print_battle("护盾值为0，移除buff")
        belongBuff:Remove()
      end
    end
    local settleUnit = BattleScene.GetUnitByUid(self.toUnitUid)
    if settleUnit then
      settleUnit:UpdateAttrCacheFromBuff(ATTR_ID.SHIELD)
    end
  end
  
  function effect:UpdateShieldSpecialValue(shieldSpecialValue)
    if self.finalValue - shieldSpecialValue > 0 then
      print_battle("特殊护盾吸收伤害：", self.finalValue - shieldSpecialValue, "特殊护盾剩余：", shieldSpecialValue)
    end
    self.finalValue = shieldSpecialValue
    if self.finalValue <= 0 then
      local belongBuff = BattleBuffMgr.savedBuffList[belongBuffUid]
      if belongBuff and belongBuff:IsShieldSpecialUsedUp() == true then
        print_battle("特殊护盾值为0，移除buff")
        belongBuff:Remove()
      end
    end
    local settleUnit = BattleScene.GetUnitByUid(self.toUnitUid)
    if settleUnit then
      settleUnit:UpdateAttrCacheFromBuff(ATTR_ID.SHIELD_SPECIAL)
    end
  end
  
  function effect:UpdateTenacityValue(tenacityValue)
    if self.finalValue - tenacityValue > 0 then
      print_battle("韧性吸收伤害：", self.finalValue - tenacityValue, "韧性剩余：", tenacityValue)
    end
    self.finalValue = tenacityValue
    if self.finalValue <= 0 then
      local belongBuff = BattleBuffMgr.savedBuffList[belongBuffUid]
      if belongBuff and belongBuff:IsTenacityUsedUp() == true then
        print_battle("韧性值为0，移除buff")
        belongBuff:Remove()
      end
    end
    local settleUnit = BattleScene.GetUnitByUid(self.toUnitUid)
    if settleUnit then
      settleUnit:UpdateAttrCacheFromBuff(ATTR_ID.TENACITY)
    end
  end
  
  function effect:IsValidAttributeEffect()
    if self.isValidAttributeEffect == nil then
      self.isValidAttributeEffect = self.effectId ~= BUFF_EFFECT_ID.DIRECT_DAMAGE and self.effectId ~= BUFF_EFFECT_ID.DIRECT_DAMAGE_RATE and self.effectId ~= BUFF_EFFECT_ID.DIRECT_TREAT and self.effectId ~= BUFF_EFFECT_ID.EXTRA_DAMAGE_ATTACK and self.effectId ~= BUFF_EFFECT_ID.EXTRA_TREAT
    end
    return self.isValidAttributeEffect
  end
  
  function effect:IsEffectiveForSkill(skillLevelUpId)
    if nil == skillLevelUpId then
      return true
    end
    local effective_skills = self.effectConfig.effective_skills
    if nil == effective_skills then
      return true
    end
    for i, v in ipairs(effective_skills) do
      if v == skillLevelUpId then
        return true
      end
    end
    return false
  end
  
  function effect:Destroy()
    self = {}
    self = nil
  end
  
  effect:Init()
  return effect
end

function BattleBuffEffect.DealBeAffectedWithEffect(effect, finalValue)
  if effect.beAffectedWithEffects and effect.fromUnitUid then
    local fromUnit = BattleScene.GetUnitByUid(effect.fromUnitUid)
    for _, id in ipairs(effect.beAffectedWithEffects) do
      local totalValue = BattleBuffMgr.GetValueById(fromUnit, id)
      if 0 ~= totalValue then
        finalValue = ceil(MathUtil.TruncateFloat(finalValue * (10000 + totalValue) / 10000))
      end
    end
  end
  return finalValue
end

function BattleBuffEffect.GetEffectValue(effect, params, getValueParams)
  local finalValue = 0
  local effectId, unitUid, effectDepend, effectCalType, effectCalValue, attributeId, effectCalAttrCalType, addAtkValue
  if params then
    effectId, unitUid, effectCalType, effectCalValue, attributeId, effectCalAttrCalType = params.effectId, params.effectUnitUid, params.effectCalType, params.effectCalValue, params.effectCalAttrId, params.effectCalAttrCalType
    addAtkValue = params.addAtkValue
    if effectCalType == BUFF_EFFECT_VALUE.NONE then
      return 0
    elseif effectCalType == BUFF_EFFECT_VALUE.VALUE then
      finalValue = BattleBuffEffect.DealBeAffectedWithEffect(params, effectCalValue)
      return finalValue
    end
  else
    print_battle(effectDepend, effect.fromUnitUid, effect.toUnitUid)
    effectId = effect.effectId
    unitUid, effectDepend, effectCalType, effectCalValue, attributeId, effectCalAttrCalType = nil, effect.effectDepend, effect.effectCalType, effect.effectCalValue, effect.effectCalAttrId, effect.effectCalAttrCalType
    if effectCalType == BUFF_EFFECT_VALUE.NONE then
      return 0
    elseif effectCalType == BUFF_EFFECT_VALUE.VALUE then
      finalValue = BattleBuffEffect.DealBeAffectedWithEffect(effect, effectCalValue)
      return finalValue
    end
    if effectDepend == BATTLE_DEPEND_TYPE.FROM then
      unitUid = effect.fromUnitUid
    elseif effectDepend == BATTLE_DEPEND_TYPE.TO then
      unitUid = effect.toUnitUid
    elseif effectDepend == BATTLE_DEPEND_TYPE.LAST_TO then
      unitUid = effect.lastToUnitUid
    end
  end
  local dependUnit, dependValue
  if unitUid then
    dependUnit = BattleScene.GetUnitByUid(unitUid)
    if nil == dependUnit then
      return finalValue
    end
    if 0 ~= attributeId then
      local attrConfig = TableData.GetConfig(attributeId, "BaseAttribute")
      if attrConfig then
        local attrName = attrConfig.name
        if effectCalAttrCalType == EFFECT_ATTR_CAL_TYPE.CURRENT then
          dependValue = dependUnit:GetAttr(attrName)
        elseif effectCalAttrCalType == EFFECT_ATTR_CAL_TYPE.BASIC then
          dependValue = dependUnit:GetBaseAttr(attrName)
        end
      end
    end
  end
  if effectCalType == BUFF_EFFECT_VALUE.ATTR_PERCENT then
    if dependValue then
      if addAtkValue then
        dependValue = MathUtil.TruncateFloat(dependValue * (10000 + addAtkValue) / 10000)
      end
      if effectCalValue > 0 then
        finalValue = ceil(MathUtil.TruncateFloat(dependValue * effectCalValue / 10000))
      else
        finalValue = floor(MathUtil.TruncateFloat(dependValue * effectCalValue / 10000))
      end
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.FIRE_COUNT then
    local unitList = BattleChoose.GetUnitListBySide(dependUnit, true, nil, nil, BATTLE_UNIT_ELEMENT_TYPE.FIRE)
    print_battle("buff属性计算 buff挂载方阵容火系角色数量 ", #unitList)
    finalValue = effectCalValue * #unitList
  elseif effectCalType == BUFF_EFFECT_VALUE.ATTR_PERCENT_WITH_CLEAN then
    local belongBuff = BattleBuffMgr.savedBuffList[effect.belongBuffUid]
    if belongBuff and belongBuff.extraParams and belongBuff.extraParams.cleanCount then
      local cleanCount = belongBuff.extraParams.cleanCount
      local lastValue = 0
      for i = 1, cleanCount do
        if 1 == i then
          finalValue = 1500
          lastValue = 1500
        else
          lastValue = MathUtil.TruncateFloat(lastValue * (10000 + effectCalValue) / 10000)
          finalValue = lastValue + finalValue
        end
      end
      finalValue = ceil(finalValue)
      print_battle("buff属性计算 驱散 ", cleanCount, effectCalValue, finalValue)
    else
      printError("buff属性计算 未找到对应的buff")
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.ATTR_PERCENT_WITH_MOVE_SPEED then
    local moveSpeed = dependUnit:GetSpdMove()
    local baseMoveSpeed = dependUnit:GetBaseAttr(ATTR_ENUM.spd_move)
    if dependValue then
      local count = floor(MathUtil.TruncateFloat(math.max(moveSpeed - baseMoveSpeed, 0) / 50))
      finalValue = ceil(MathUtil.TruncateFloat(count * dependValue * effectCalValue / 10000))
      print_battle("buff属性计算 当前移速 ", moveSpeed, "基础移速", baseMoveSpeed, dependUnit.positionIndex, dependValue, effectCalValue, finalValue)
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.VALUE_WITH_ENEMY_EFFECT then
    local tempEffectId = attributeId
    local count = BattleBuffMgr.GetBuffCountByCampAndId(dependUnit.enemyCamp, tempEffectId)
    print_battle("buff属性计算 敌方阵容", dependUnit.enemyCamp, ",包含", tempEffectId, "效果的数量", count)
    finalValue = effectCalValue * count
  elseif effectCalType == BUFF_EFFECT_VALUE.ATTR_PERCENT_WITH_ATK_RANGE then
    local atkRange = dependUnit:GetAttr(ATTR_ENUM.range_atk)
    if dependValue then
      local count = floor(MathUtil.TruncateFloat(atkRange / 50))
      finalValue = ceil(MathUtil.TruncateFloat(count * dependValue * effectCalValue / 10000))
      print_battle("buff属性计算 当前攻击距离 ", atkRange, dependUnit.positionIndex, dependValue, effectCalValue, finalValue)
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.ATTR_PERCENT_WITH_FLY_DIS then
    effect.updateValueBeforeHurt = true
    local buffUid = effect.belongBuffUid
    local buff = BattleBuffMgr.savedBuffList[buffUid]
    local bullet = BattleScene.GetBulletByUid(buff.toBulletUid)
    if bullet then
      local flyDis = MathUtil.GetVector3Module(MathUtil.GetVector3Subtract(bullet.position, bullet.startPosition)) * BattleScene.pixelsPerUnit
      local count = floor(MathUtil.TruncateFloat(flyDis / 50))
      finalValue = ceil(MathUtil.TruncateFloat(count * dependValue * effectCalValue / 10000))
      print_battle("buff属性计算 当前飞行距离 ", flyDis, dependUnit.positionIndex, dependValue, effectCalValue, finalValue)
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.VALUE_WITH_SELF_SUMMON then
    local count = BattleBuffMgr.GetSummonCountByCamp(dependUnit.camp)
    print_battle("buff属性计算 阵营", dependUnit.camp, ",召唤物的数量", count)
    finalValue = effectCalValue * count
  elseif effectCalType == BUFF_EFFECT_VALUE.ATTR_PERCENT_WITH_SELF_SUMMON then
    local count = BattleBuffMgr.GetSummonCountByCamp(dependUnit.camp)
    if dependValue then
      print_battle("buff属性计算 阵营", dependUnit.camp, ",召唤物的数量", count, dependValue, effectCalValue)
      finalValue = ceil(MathUtil.TruncateFloat(count * dependValue * effectCalValue / 10000))
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.VALUE_WITH_SELF_CAMP_ALIVE then
    local count = BattleBuffMgr.GetAliveUnitCountByCamp(dependUnit.camp)
    print_battle("buff属性计算 阵营", dependUnit.camp, ",存活角色数量", count)
    finalValue = effectCalValue * count
  elseif effectCalType == BUFF_EFFECT_VALUE.BASE_ATTR_DEF then
    print_battle("buff属性计算 基础防御力 ", dependValue, ",固定值", effectCalValue)
    finalValue = math.floor(MathUtil.TruncateFloat(dependValue / 50)) * effectCalValue
    finalValue = math.min(10000, finalValue)
  elseif effectCalType == BUFF_EFFECT_VALUE.BASE_ATTR_HP then
    print_battle("buff属性计算 基础生命值 ", dependValue, ",固定万分比", effectCalValue)
    finalValue = math.floor(MathUtil.TruncateFloat(dependValue / 500)) * effectCalValue
    finalValue = math.max(-3000, finalValue)
  elseif effectCalType == BUFF_EFFECT_VALUE.ATTR_PERCENT_WITH_ALIVE_ENEMY then
    local list = BattleScene.GetAliveCardByCamp(dependUnit.enemyCamp)
    finalValue = ceil(#list * dependValue * effectCalValue / 10000)
    print_battle("buff属性计算 当前存活敌方角色总数量 ", #list, dependValue, effectCalValue, finalValue)
  elseif effectCalType == BUFF_EFFECT_VALUE.VALUE_WITH_ALIVE_ENEMY then
    local list = BattleScene.GetAliveCardByCamp(dependUnit.enemyCamp)
    print_battle("buff属性计算 当前存活敌方角色总数量", #list, ",固定值", effectCalValue)
    finalValue = effectCalValue * #list
  elseif effectCalType == BUFF_EFFECT_VALUE.VALUE_WITH_BUFF_FROM_EFFECT then
    if dependUnit then
      finalValue = BattleBuffMgr.GetValueById(dependUnit, effectCalValue)
      print_battle("buff属性计算 buff释放方指定属性：", effectCalValue, "的总值为：", finalValue)
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.PERCENT_WITH_ENEMY_CAMP_ATTR_TOTAL then
    local camp = dependUnit.enemyCamp
    local unitList = BattleScene.GetUnitListByCampDirect(camp)
    local attrName = CardAttribute.GetNameById(attributeId)
    for _, unit in ipairs(unitList) do
      if unit:IsAlive() then
        finalValue = finalValue + unit:GetAttr(attrName)
      end
    end
    print_battle("buff属性计算 己方阵容所有角色的指定属性总和：", finalValue)
    finalValue = ceil(effectCalValue * finalValue / 10000)
  elseif effectCalType == BUFF_EFFECT_VALUE.ATTR_PERCENT_WITH_EFFECT_1102 then
    if dependValue then
      local count = BattleBuffMgr.GetBuffCountByCampAndId(dependUnit.camp, 1102)
      if count > 0 then
        if effectCalValue > 0 then
          effectCalValue = (effectCalValue / 10000) ^ count
          finalValue = ceil(dependValue * (effectCalValue - 1))
        else
          effectCalValue = -math.abs((effectCalValue / 10000) ^ count)
          finalValue = floor(dependValue * (effectCalValue + 1))
        end
        print_battle("buff属性计算 属性增加值：", finalValue, "，百分比计算值：", effectCalValue, ",effect 1102的层数：", count)
      end
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.VALUE_WITH_PARTNER_AROUND then
    local unitList = BattleScene.GetInRangeUnit(dependUnit, BATTLE_RANGE_TYPE.CIRCLE, 80, 80, true, nil, nil, false)
    if effectCalValue > 0 then
      finalValue = math.min(5000, #unitList * effectCalValue)
    elseif effectCalValue < 0 then
      finalValue = math.max(-5000, #unitList * effectCalValue)
    end
    print_battle("buff属性计算 周围80半径内同阵营目标数量：", #unitList)
  elseif effectCalType == BUFF_EFFECT_VALUE.ROGUE_ATTR_PERCENT_WITH_DEFENSE then
    local count = BattleData.GetRogueAliveCountByType(BATTLE_UNIT_TYPE.DEFENSE)
    finalValue = ceil(count * dependValue * effectCalValue / 10000)
    print_battle("buff属性计算 当前已招募且存活的坚甲数量 ", count)
  elseif effectCalType == BUFF_EFFECT_VALUE.ROGUE_ATTR_PERCENT_WITH_MELEE then
    local count = BattleData.GetRogueAliveCountByType(BATTLE_UNIT_TYPE.MELEE_ATTACK)
    finalValue = ceil(count * dependValue * effectCalValue / 10000)
    print_battle("buff属性计算 当前已招募且存活的异刃数量 ", count)
  elseif effectCalType == BUFF_EFFECT_VALUE.ROGUE_ATTR_PERCENT_WITH_SUPPORT then
    local count = BattleData.GetRogueAliveCountByType(BATTLE_UNIT_TYPE.SUPPORT)
    finalValue = ceil(count * dependValue * effectCalValue / 10000)
    print_battle("buff属性计算 当前已招募且存活的言灵数量 ", count)
  elseif effectCalType == BUFF_EFFECT_VALUE.ROGUE_ATTR_PERCENT_WITH_RANGED then
    local count = BattleData.GetRogueAliveCountByType(BATTLE_UNIT_TYPE.RANGED_ATTACK)
    finalValue = ceil(count * dependValue * effectCalValue / 10000)
    print_battle("buff属性计算 当前已招募且存活的猎影数量 ", count)
  elseif effectCalType == BUFF_EFFECT_VALUE.ROGUE_VALUE_WITH_TOKEN then
    if BattleData.rogueData then
      local count = BattleData.rogueData.tokenCount
      finalValue = floor(count / 10) * effectCalValue
      print_battle("buff属性计算 当前已拥有代币 ", count)
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.ROGUE_VALUE_WITH_TOKEN_2 then
    if BattleData.rogueData then
      local count = BattleData.rogueData.tokenCount
      finalValue = floor(count / 50) * effectCalValue
      print_battle("buff属性计算 当前已拥有代币 ", count)
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.ROGUE_VALUE_WITH_COST_POINT then
    if BattleData.rogueData then
      local count = BattleData.rogueData.consumeAttribPoint
      finalValue = floor(count / 10) * effectCalValue
      print_battle("buff属性计算 当前所消耗的属性点总量 ", count)
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.ROGUE_VALUE_WITH_COST_POINT then
    if BattleData.rogueData then
      local count = BattleData.rogueData.consumeAttribPoint
      finalValue = floor(count / 10 * effectCalValue)
      print_battle("buff属性计算 当前所消耗的属性点总量 ", count)
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.SELF_HP_ADD_WITH_VALUE_PERCENT then
    if dependUnit then
      finalValue = floor(dependUnit.treatedTemp_1 * effectCalValue / 10000)
      print_battle("buff属性计算 自身累计生命回复值 ", dependUnit.treatedTemp_1)
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.PARTNER_ALIVE_WITH_ATTR_PERCENT then
    local list = BattleScene.GetAliveCardByCamp(dependUnit.camp)
    finalValue = ceil((#list - 1) * dependValue * effectCalValue / 10000)
    print_battle("buff属性计算 当前存活己方角色总数量 ", #list, dependValue, effectCalValue, finalValue)
  elseif effectCalType == BUFF_EFFECT_VALUE.ATK_SPEED_WITH_VALUE then
    local spd_atk_enhance = dependUnit:GetBuffAttr(ATTR_ENUM.spd_atk_enhance)
    if spd_atk_enhance > 0 then
      finalValue = floor(spd_atk_enhance / 100) * effectCalValue
    elseif spd_atk_enhance < 0 then
      finalValue = ceil(spd_atk_enhance / 100) * effectCalValue
    end
    print_battle("buff属性计算 攻速正负变化量 ", spd_atk_enhance)
  elseif effectCalType == BUFF_EFFECT_VALUE.VALUE_WITH_BUFF_DEDUCE_COUNT then
    local belongBuff = BattleBuffMgr.savedBuffList[effect.belongBuffUid]
    if belongBuff then
      finalValue = belongBuff.deduceCount * effectCalValue
      print_battle("buff属性计算 BUFF扣减次数 ", belongBuff.deduceCount, effectCalValue)
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.PERCENT_WITH_TREAT_NUM then
    local belongBuff = BattleBuffMgr.savedBuffList[effect.belongBuffUid]
    if belongBuff then
      finalValue = floor(belongBuff.triggerFromTreatNum * effectCalValue / 10000)
      print_battle("buff属性计算 治疗量 ", belongBuff.triggerFromTreatNum, effectCalValue)
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.ATTR_PERCENT_WITH_ELEMENT_COUNT then
    local defUnit = getValueParams and getValueParams.defUnit
    if defUnit then
      local count = BattleBuffMgr.GetBuffCountByUnitAndTag(defUnit, BUFF_EFFECT_TAG.PERSIST_DAMAGE)
      finalValue = ceil(math.min(count, 10) * dependValue * effectCalValue / 10000)
      print_battle("buff属性计算 目标当前元素持续伤害效果层数 ", count)
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.ATTR_PERCENT_WITH_HOLY_COUNT then
    local defUnit = getValueParams and getValueParams.defUnit
    if defUnit then
      local count = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(defUnit, BUFF_EFFECT_ID.SANCTIONS)
      if count > 0 then
        count = 1
        finalValue = ceil(count * dependValue * effectCalValue / 10000)
        print_battle("buff属性计算 目标当前圣光层数 ", count)
      else
        print_battle("buff属性计算 目标当前圣光层数 ", 0)
      end
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.MANUALLY_SKILL_ATK then
    local fromBuff = BattleBuffMgr.GetBuffByUid(effect.belongBuffUid)
    if fromBuff then
      local manuallySkill = BattleScene.GetManuallySkill(fromBuff.fromManuallySkillId, fromBuff.fromSkillCamp)
      if manuallySkill then
        finalValue = ceil(manuallySkill.skillAtk * effectCalValue / 10000)
      end
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.ATTR_PERCENT_WITH_SPD_BUFF then
    if dependUnit then
      local count = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(dependUnit, 601)
      if count > 0 then
        finalValue = ceil(count * dependValue * effectCalValue / 10000)
        print_battle("buff属性计算 目标当前的加攻速层数 ", count)
      else
        print_battle("buff属性计算 目标当前的加攻速层数 ", 0)
      end
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.ATTR_PERCENT_WITH_BASE_SPD_MOVE then
    local baseMoveSpeed = dependUnit:GetBaseAttr(ATTR_ENUM.spd_move)
    if dependValue then
      finalValue = ceil(math.floor(baseMoveSpeed / 10) * dependValue * effectCalValue / 10000)
      print_battle("buff属性计算 基础移速", baseMoveSpeed, dependUnit.positionIndex, dependValue, effectCalValue, finalValue)
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.ATTR_PERCENT_WITH_1008_COUNT then
    local defUnit = getValueParams and getValueParams.defUnit
    if defUnit then
      local count = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(defUnit, BUFF_EFFECT_ID.HEART_OF_MACHINE)
      if count > 0 then
        finalValue = ceil(math.min(count, 10) * dependValue * effectCalValue / 10000)
      end
      print_battle("buff属性计算 目标当前机械之心层数层数 ", count)
    end
  elseif effectCalType == BUFF_EFFECT_VALUE.VALUE_WITH_CHARGE_AND_ALIVE_COUNT and dependUnit and dependUnit.chargeValue then
    local list = BattleScene.GetAliveCardByCamp(dependUnit.camp)
    if #list > 0 then
      finalValue = math.ceil(dependUnit.chargeValue * effectCalValue / #list / 10000)
      print_battle("buff属性计算 角色充能量 ", dependUnit.chargeValue, effectCalValue, "存活人数", #list)
    end
  end
  finalValue = BattleBuffEffect.DealBeAffectedWithEffect(effect, finalValue)
  return finalValue
end
