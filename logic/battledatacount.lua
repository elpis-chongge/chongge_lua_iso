BattleDataCount = {isInit = false}
local ceil = math.ceil
local floor = math.floor
local min = math.min
local max = math.max
local ATTR_ENUM = ATTR_ENUM
local BUFF_EFFECT_ID = BUFF_EFFECT_ID
local BATTLE_UNIT_TYPE = BATTLE_UNIT_TYPE
local BATTLE_SKILL_ENUM = SKILL_TYPE_ENUM
local BUFF_DEDUCE_TYPE = BUFF_DEDUCE_TYPE
local TRIGGER_CONDITION = TRIGGER_CONDITION

function BattleDataCount.InitLocalVar()
end

local RestraintAddName = {
  "restraint_add1",
  "restraint_add2",
  "restraint_add3",
  "restraint_add4",
  "restraint_add5"
}
local RestraintSubName = {
  "restraint_sub1",
  "restraint_sub2",
  "restraint_sub3",
  "restraint_sub4",
  "restraint_sub5"
}
local shanbi_max, shanbi_min, baoji_max, baoji_min, baojil_jiacheng_max, baojil_jiacheng_min, gedang_max, gedang_min, gedang_jiacheng_max, gedang_jiacheng_min, gongfang, shanghai_fudong_min, shanghai_fudong_max, zhiliao_baoji_max, zhiliao_baoji_min, zhiliao_baoji_jiacheng_max, zhiliao_baoji_jiacheng_min, zhiliao_fudong_min, zhiliao_fudong_max, shanghai_jianmian_min, shanghai_jianmian_max

function BattleDataCount.Init()
  if BattleDataCount.isInit == false then
    local SkillParameterData = TableData.GetTable("BaseSkillParameter")
    shanbi_max = SkillParameterData[40001001].data
    shanbi_min = SkillParameterData[40001002].data
    baoji_max = SkillParameterData[40001003].data
    baoji_min = SkillParameterData[40001004].data
    baojil_jiacheng_max = SkillParameterData[40001005].data
    baojil_jiacheng_min = SkillParameterData[40001006].data
    gedang_max = SkillParameterData[40001007].data
    gedang_min = SkillParameterData[40001008].data
    gedang_jiacheng_max = SkillParameterData[40001009].data
    gedang_jiacheng_min = SkillParameterData[40001010].data
    gongfang = SkillParameterData[40001011].data
    shanghai_fudong_min = SkillParameterData[40001012].data
    shanghai_fudong_max = SkillParameterData[40001013].data
    zhiliao_baoji_max = SkillParameterData[40001014].data
    zhiliao_baoji_min = SkillParameterData[40001021].data
    zhiliao_baoji_jiacheng_max = SkillParameterData[40001015].data
    zhiliao_baoji_jiacheng_min = SkillParameterData[40001016].data
    zhiliao_fudong_min = SkillParameterData[40001017].data
    zhiliao_fudong_max = SkillParameterData[40001018].data
    shanghai_jianmian_min = SkillParameterData[40001019].data
    shanghai_jianmian_max = SkillParameterData[40001020].data
    BattleDataCount.isInit = true
  end
end

local PanDingShanBi = function(atkUnit, defUnit, skillType)
  if atkUnit and atkUnit.isBlind == true and skillType == BATTLE_SKILL_ENUM.NORMAL then
    return true
  end
  if true == defUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_DEFEND_DODGE) then
    return false
  end
  local shanbi_def = defUnit:GetAttr(ATTR_ENUM.eva)
  local shanbi = min(shanbi_max, max(shanbi_min, shanbi_def))
  local isShanbi = shanbi >= BattleData.GetRandomSeed()
  return isShanbi
end
local PanDingBaoJi = function(atkUnit, defUnit, isTreat)
  local baoji_atk = atkUnit:GetAttr(ATTR_ENUM.crt)
  local baoji_qiangdu_atk = atkUnit:GetAttr(ATTR_ENUM.crt_int)
  local baoji = min(isTreat and zhiliao_baoji_max or baoji_max, max(isTreat and zhiliao_baoji_min or baoji_min, baoji_atk))
  if baoji >= BattleData.GetRandomSeed() then
    return min(isTreat and zhiliao_baoji_jiacheng_max or baojil_jiacheng_max, isTreat and zhiliao_baoji_jiacheng_min or baojil_jiacheng_min + baoji_qiangdu_atk)
  else
    return 0
  end
end
local PanDingGeDang = function(atkUnit, defUnit)
  if defUnit:ContainControlType(BUFF_CONTROL_TYPE.FORBIDDEN_BLOCK) == true then
    return 0
  end
  local gedang_def = defUnit:GetAttr(ATTR_ENUM.blk)
  local gedang_qiangdu_def = defUnit:GetAttr(ATTR_ENUM.blk_int)
  local gedang = min(gedang_max, max(gedang_min, gedang_def))
  if gedang >= BattleData.GetRandomSeed() then
    return -min(gedang_jiacheng_max, gedang_jiacheng_min + gedang_qiangdu_def)
  else
    return 0
  end
end
local PanDingFangYu = function(atkUnit, defUnit, isSkillAttack, extraParams)
  local fangyu_def = max(defUnit:GetAttr(ATTR_ENUM.def), 0)
  if true == isSkillAttack then
    local bullet
    if extraParams and extraParams.bulletUid then
      bullet = BattleScene.GetBulletByUid(extraParams.bulletUid)
    end
    local isContain, effectList = BattleBuffMgr.GetContainedEffect(atkUnit, BUFF_EFFECT_ID.IGNORE_DEFENSE_PER, bullet)
    if true == isContain then
      local value = 0
      for i = 1, #effectList do
        value = value + effectList[i].finalValue
      end
      if 0 ~= value then
        fangyu_def = max(fangyu_def * (10000 - value) / 10000, 0)
      end
    end
    isContain, effectList = BattleBuffMgr.GetContainedEffect(atkUnit, BUFF_EFFECT_ID.IGNORE_DEFENSE_VALUE, bullet)
    if true == isContain then
      local value = 0
      for i = 1, #effectList do
        value = value + effectList[i].finalValue
      end
      if 0 ~= value then
        fangyu_def = max(fangyu_def - value, 0)
      end
    end
    if defUnit.battleUnitType == BATTLE_UNIT_TYPE.DEFENSE then
      isContain, effectList = BattleBuffMgr.GetContainedEffect(atkUnit, BUFF_EFFECT_ID.IGNORE_DEFENSE_TO_DEFENSE, bullet)
      if true == isContain then
        local value = 0
        for i = 1, #effectList do
          value = value + effectList[i].finalValue
        end
        if 0 ~= value then
          fangyu_def = max(fangyu_def * (10000 - value) / 10000, 0)
        end
      end
    end
  end
  return -min(shanghai_jianmian_max, max(shanghai_jianmian_min, ceil(10000 * fangyu_def / (fangyu_def + gongfang))))
end
BattleDataCount.PanDingFangYu = PanDingFangYu
local PanDingKeZhi = function(atkUnit, defUnit, skill)
  local elementTypeAtk, skillConfig
  if skill then
    elementTypeAtk = skill.elementTypes
    skillConfig = skill:GetSkillConfig()
  elseif atkUnit then
    elementTypeAtk = atkUnit.elementTypes
  end
  local elementTypeDef = defUnit.elementTypes
  local kezhi = 0
  for i = 1, #elementTypeDef do
    local v = elementTypeDef[i]
    if skill then
      kezhi = kezhi + (skillConfig[RestraintAddName[v]] or 0)
    elseif atkUnit then
      kezhi = kezhi + atkUnit:GetAttr(RestraintAddName[v])
    end
  end
  for i = 1, #elementTypeAtk do
    kezhi = kezhi + defUnit:GetAttr(RestraintSubName[elementTypeAtk[i]])
  end
  return kezhi
end

function BattleDataCount.PanDingKeZhiBuff(effect, defUnit)
  local config = effect.effectConfig
  local elementTypeAtk = config.element_type
  if nil == elementTypeAtk then
    return 0
  end
  local elementTypeDef = defUnit.elementTypes
  local kezhi = 0
  if elementTypeDef then
    for i = 1, #elementTypeDef do
      kezhi = kezhi + (config[RestraintAddName[elementTypeDef[i]]] or 0)
    end
  end
  for i = 1, #elementTypeAtk do
    kezhi = kezhi + defUnit:GetAttr(RestraintSubName[elementTypeAtk[i]])
  end
  return kezhi
end

function BattleDataCount.GetSkillHurt(skillId, subSkillId, atkUnit, defUnit, bulletParams, hurtIndex, params)
  local hurt = 0
  local hurtExtraParams = {}
  local skillLevel = atkUnit:GetSkillLevel(skillId)
  if atkUnit.calculateUseSummonFrom and atkUnit.summonFromUnit then
    local unit = BattleScene.GetUnitByUid(atkUnit.summonFromUnit)
    if unit and unit:IsAlive() then
      atkUnit = unit
    else
      return 0, hurtExtraParams
    end
  end
  local skillBaseConfig = TableData.GetConfig(skillId, "BaseSkill")
  local skillType = skillBaseConfig.type
  if skillType == BATTLE_SKILL_ENUM.PASSIVE and skillBaseConfig.calculate_type then
    skillType = skillBaseConfig.calculate_type
  end
  local skillLevelUpConfig = TableData.GetConfig(skillId * 1000 + skillLevel, "BaseSkillLevelUp")
  local subSkillConfig = TableData.GetConfig(subSkillId, "BaseSubSkill")
  local gongji_atk = atkUnit:GetAttr(ATTR_ENUM.atk)
  local subSkillDamageRate = subSkillConfig.damage_rate[skillLevel + 1] or subSkillConfig.damage_rate[1]
  local mainSkillDamageRate = skillLevelUpConfig.damage_rate
  if skillLevelUpConfig.damage_rate_pvp and BattleData.IsBattlePVP(BattleData.stageType) then
    mainSkillDamageRate = skillLevelUpConfig.damage_rate_pvp
  end
  if mainSkillDamageRate < 0 and subSkillDamageRate > 0 then
    if BattleBuffMgr.IsUnitUntreatable(defUnit) == true then
      hurtExtraParams.isUntreatable = true
      return 0, hurtExtraParams
    end
    local treat_add_atk = atkUnit:GetAttr(ATTR_ENUM.treat_add)
    local be_treat_add_def = defUnit:GetAttr(ATTR_ENUM.be_treat_add)
    local baoji_jiacheng = PanDingBaoJi(atkUnit, defUnit)
    local skillBaseTreat = gongji_atk * mainSkillDamageRate + (skillLevelUpConfig.damage or 0) * 10000 * subSkillDamageRate / 100000000
    hurt = floor(min(zhiliao_fudong_min + BattleData.GetRandomSeed() * (zhiliao_fudong_max - zhiliao_fudong_min) / 10000, skillBaseTreat * (10000 + baoji_jiacheng) * (10000 + treat_add_atk + be_treat_add_def) / 100000000))
    local buffEffectParams = BattleDataCount.DealBuffEffect(atkUnit, defUnit, hurt, skillType, false, nil, subSkillId, hurtIndex)
    hurt = buffEffectParams.hurt
  elseif mainSkillDamageRate > 0 and subSkillDamageRate > 0 then
    if true == BattleBuffMgr.IsUnitInvincible(defUnit) then
      hurtExtraParams.isInvincible = true
      return 0, hurtExtraParams
    end
    if true == BattleBuffMgr.IsUnitStealth(defUnit) then
      return 0, hurtExtraParams
    end
    if true == BattleBuffMgr.IsUnitUnyielding(defUnit) then
      hurtExtraParams.isUnyielding = true
      return 0, hurtExtraParams
    end
    local isShanbi = PanDingShanBi(atkUnit, defUnit, skillBaseConfig)
    if isShanbi then
      hurtExtraParams.isDodge = true
      return hurt, hurtExtraParams
    end
    if true == BattleBuffMgr.ContainEffectId(defUnit, BUFF_EFFECT_ID.IMMUNE_ATTACK) then
      hurtExtraParams.immune = true
      BattleBuffMgr.TriggerUnitListener(defUnit, BUFF_DEDUCE_TYPE.AFTER_IMMUNE_ATTACK)
      return hurt, hurtExtraParams
    end
    local baoji_jiacheng = PanDingBaoJi(atkUnit, defUnit)
    if baoji_jiacheng > 0 then
      hurtExtraParams.isCrit = true
    end
    local gedang_jiangdi = PanDingGeDang(atkUnit, defUnit)
    if gedang_jiangdi < 0 then
      hurtExtraParams.isBlock = true
    end
    local fangyu_jianmian = PanDingFangYu(atkUnit, defUnit, true, bulletParams)
    local kezhi = PanDingKeZhi(atkUnit, defUnit)
    local damage_add_atk = atkUnit:GetAttr(ATTR_ENUM.damage_add)
    local damage_sub_def = defUnit:GetAttr(ATTR_ENUM.damage_sub)
    local damage_add_job = 0
    if defUnit.battleUnitType then
      damage_add_job = atkUnit:GetJobConfig()[string.format("damage_add_%d", defUnit.battleUnitType)]
    end
    local finalDamageAddPer = 0
    local directValue = BattleBuffMgr.GetValueById(atkUnit, BUFF_EFFECT_ID.DIRECT_DAMAGE, nil, {testRealtimeValue = true, defUnit = defUnit})
    if directValue > 0 then
      print_battle(defUnit.positionIndex, "位置 受到额外伤害：", directValue)
    end
    local value_657 = BattleBuffMgr.GetValueById(atkUnit, BUFF_EFFECT_ID.EXTRA_DAMAGE_EFFECT_704)
    if value_657 > 0 then
      local _contain = BattleBuffMgr.ContainEffectId(defUnit, 704)
      if _contain then
        directValue = directValue + value_657
        print_battle(defUnit.positionIndex, "位置 受到657效果额外伤害：", value_657)
      end
    end
    if params and params.bombUid then
      local bomb = BattleScene.GetBombByUid(params.bombUid)
      local directValueBomb = BattleBuffMgr.GetValueById(nil, BUFF_EFFECT_ID.DIRECT_DAMAGE, nil, {testRealtimeValue = true, defUnit = defUnit}, bomb)
      if directValueBomb > 0 then
        directValue = directValue + directValueBomb
        print_battle(defUnit.positionIndex, "位置 受到炸弹额外伤害：", directValueBomb)
      end
    end
    local directValueRate = BattleBuffMgr.GetValueById(atkUnit, BUFF_EFFECT_ID.DIRECT_DAMAGE_RATE)
    if bulletParams and bulletParams.bulletUid then
      local bullet = BattleScene.GetBulletByUid(bulletParams.bulletUid)
      local directValueBullet = BattleBuffMgr.GetValueById(nil, BUFF_EFFECT_ID.DIRECT_DAMAGE, bullet, {
        testEffective = true,
        testRealtimeValue = true,
        defUnit = defUnit
      })
      if directValueBullet > 0 then
        print_battle(defUnit.positionIndex, "位置 受到子弹额外伤害：", directValueBullet)
        directValue = directValue + directValueBullet
      end
      local directValueBulletRate = BattleBuffMgr.GetValueById(nil, BUFF_EFFECT_ID.DIRECT_DAMAGE_RATE, bullet, {testEffective = true})
      if directValueBulletRate > 0 then
        directValueRate = directValueRate + directValueBulletRate
      end
      finalDamageAddPer = bullet.finalDamageAddPer
      local finalDamageReducePer = bullet.finalDamageReduceBuffPer
      if 0 ~= finalDamageReducePer then
        local isContain = BattleBuffMgr.ContainEffectId(atkUnit, BUFF_EFFECT_ID.IGNORE_REDUCE_CATAPULT_DAMAGE)
        if false == isContain then
          finalDamageReducePer = math.max(finalDamageReducePer, -8000)
          finalDamageAddPer = finalDamageAddPer + finalDamageReducePer
        end
      end
    else
      local contain, effectList = BattleBuffMgr.GetContainedEffect(atkUnit, BUFF_EFFECT_ID.FINAL_DAMAGE_ADD_PER)
      if true == contain then
        for _, v in ipairs(effectList) do
          finalDamageAddPer = finalDamageAddPer + v.finalValue
        end
      end
      contain, effectList = BattleBuffMgr.GetContainedEffect(atkUnit, BUFF_EFFECT_ID.FINAL_DAMAGE_REDUCE_PER)
      if true == contain then
        for _, v in ipairs(effectList) do
          finalDamageAddPer = finalDamageAddPer - v.finalValue
        end
      end
    end
    local skillBaseDamage = 0
    if bulletParams and bulletParams.effectUnitUid and bulletParams.effectCalType and bulletParams.effectCalValue and bulletParams.effectCalAttrId and 0 ~= bulletParams.effectCalAttrId and bulletParams.effectCalAttrCalType then
      local addAtkValue = 0
      local contain, _, buffList = BattleBuffMgr.GetContainedEffect(atkUnit, BUFF_EFFECT_ID.TEMP_ATTACK_ADD_WITH_TARGET_HP, nil, true)
      if true == contain then
        for i = 1, #buffList do
          local buff = buffList[i]
          if true == buff:CanEffective(defUnit.uid) then
            local effectList = buff.effectList
            for j = 1, #effectList do
              addAtkValue = addAtkValue + effectList[j].finalValue
            end
          end
        end
        bulletParams.addAtkValue = addAtkValue
      end
      local effectValue = BattleBuffEffect.GetEffectValue(nil, bulletParams)
      skillBaseDamage = (effectValue + directValue) * subSkillDamageRate / 10000
    else
      local damageRate = mainSkillDamageRate
      if atkUnit.extraUniqueSkillDamageRate and skillType == BATTLE_SKILL_ENUM.UNIQUE then
        print_battle("必杀技追击，伤害比例", atkUnit.extraUniqueSkillDamageRate)
        damageRate = damageRate * atkUnit.extraUniqueSkillDamageRate / 10000
      elseif atkUnit.extraBurstSkillDamageRate and skillType == BATTLE_SKILL_ENUM.BURST_CARD then
        print_battle("爆裂技能追击，伤害比例", atkUnit.extraBurstSkillDamageRate)
        damageRate = damageRate * atkUnit.extraBurstSkillDamageRate / 10000
      end
      local extraDamageRate = 10000
      if bulletParams then
        if bulletParams.effectId == BUFF_EFFECT_ID.EXTRA_DAMAGE_ATTACK then
          extraDamageRate = bulletParams.finalValue
        elseif bulletParams.effectId == BUFF_EFFECT_ID.SPLASH or bulletParams.effectId == BUFF_EFFECT_ID.SPLASH_TWO then
          extraDamageRate = bulletParams.finalValue
        elseif bulletParams.bulletDamageRate then
          print_battle("转移箭，伤害比例", bulletParams.bulletDamageRate)
          damageRate = damageRate * bulletParams.bulletDamageRate / 10000
        end
      end
      local contain, _, buffList = BattleBuffMgr.GetContainedEffect(atkUnit, BUFF_EFFECT_ID.TEMP_ATTACK_ADD_WITH_TARGET_HP, nil, true)
      if true == contain then
        local addValue = 0
        for i = 1, #buffList do
          local buff = buffList[i]
          if true == buff:CanEffective(defUnit.uid) then
            local effectList = buff.effectList
            for j = 1, #effectList do
              addValue = addValue + effectList[j].finalValue
            end
          end
        end
        if 0 ~= addValue then
          gongji_atk = gongji_atk * (10000 + addValue) / 10000
        end
      end
      skillBaseDamage = (gongji_atk * (damageRate + directValueRate) + directValue * 10000 + (skillLevelUpConfig.damage or 0) * 10000) * subSkillDamageRate / 100000000 * extraDamageRate / 10000
    end
    if finalDamageAddPer > 0 then
      print_battle("最终伤害加成：", finalDamageAddPer)
    end
    local skillDamageAdd = 1
    if skillType == BATTLE_SKILL_ENUM.NORMAL then
      local atkNormalDamageAddPer = 0
      local contain, effectList = BattleBuffMgr.GetContainedEffect(atkUnit, BUFF_EFFECT_ID.NORMAL_DAMAGE_ADD_PER)
      if true == contain then
        for _, v in ipairs(effectList) do
          atkNormalDamageAddPer = atkNormalDamageAddPer + v.finalValue
        end
      end
      if 0 ~= atkNormalDamageAddPer then
        skillDamageAdd = (10000 + atkNormalDamageAddPer) / 10000
      end
    elseif skillType == BATTLE_SKILL_ENUM.SMALL then
      local atkSmallDamageAddPer = 0
      local contain, effectList = BattleBuffMgr.GetContainedEffect(atkUnit, BUFF_EFFECT_ID.SMALL_DAMAGE_ADD_PER)
      if true == contain then
        for _, v in ipairs(effectList) do
          atkSmallDamageAddPer = atkSmallDamageAddPer + v.finalValue
        end
      end
      if 0 ~= atkSmallDamageAddPer then
        skillDamageAdd = (10000 + atkSmallDamageAddPer) / 10000
      end
    elseif skillType == BATTLE_SKILL_ENUM.UNIQUE then
      local atkSmallDamageAddPer = 0
      local contain, effectList = BattleBuffMgr.GetContainedEffect(atkUnit, BUFF_EFFECT_ID.UNIQUE_DAMAGE_ADD_PER)
      if true == contain then
        for _, v in ipairs(effectList) do
          atkSmallDamageAddPer = atkSmallDamageAddPer + v.finalValue
        end
      end
      if 0 ~= atkSmallDamageAddPer then
        skillDamageAdd = (10000 + atkSmallDamageAddPer) / 10000
      end
    elseif skillType == BATTLE_SKILL_ENUM.BURST_CARD then
      local defBurstDamageAddPer = 0
      local atkBurstDamageAddPer = 0
      local contain, effectList = BattleBuffMgr.GetContainedEffect(defUnit, BUFF_EFFECT_ID.BE_BURST_DAMAGE_ADD_PER)
      if true == contain then
        for _, v in ipairs(effectList) do
          defBurstDamageAddPer = defBurstDamageAddPer + v.finalValue
        end
      end
      contain, effectList = BattleBuffMgr.GetContainedEffect(atkUnit, BUFF_EFFECT_ID.BURST_DAMAGE_ADD_PER)
      if true == contain then
        for _, v in ipairs(effectList) do
          atkBurstDamageAddPer = atkBurstDamageAddPer + v.finalValue
        end
      end
      if 0 ~= defBurstDamageAddPer or 0 ~= atkBurstDamageAddPer then
        skillDamageAdd = (10000 + atkBurstDamageAddPer) / 10000 * (10000 + defBurstDamageAddPer) / 10000
      end
    end
    hurt = ceil(max(shanghai_fudong_min + BattleData.GetRandomSeed() * (shanghai_fudong_max - shanghai_fudong_min) / 10000, skillBaseDamage * (10000 + fangyu_jianmian) * (10000 + baoji_jiacheng + gedang_jiangdi) / 100000000 * (10000 + kezhi) * (10000 + damage_add_atk + damage_sub_def) / 100000000 * (10000 + damage_add_job) / 10000 * skillDamageAdd * (10000 + finalDamageAddPer) / 10000))
    if params then
      params.dealCounter = true
    else
      params = {dealCounter = true}
    end
    local buffEffectParams = BattleDataCount.DealBuffEffect(atkUnit, defUnit, hurt, skillType, false, bulletParams, subSkillId, hurtIndex, params)
    local absorbHurt = buffEffectParams.absorbHurt
    hurt = buffEffectParams.hurt
    if 0 ~= absorbHurt then
      hurtExtraParams.absorbHurt = absorbHurt
    end
    if buffEffectParams.counter then
      hurtExtraParams.counter = buffEffectParams.counter
    end
    if hurt > 0 then
      defUnit.curHurt = hurt
      defUnit:DealTriggerSkillAll(TRIGGER_CONDITION.SELF_HURT_MORE)
    end
  else
    print_battle("没有伤害或加血，只有动作 ", skillId)
    return nil, hurtExtraParams
  end
  if skillType == BATTLE_SKILL_ENUM.SMALL or skillType == BATTLE_SKILL_ENUM.UNIQUE or skillType == BATTLE_SKILL_ENUM.BURST_CARD then
    hurtExtraParams.alwaysShow = true
  end
  return hurt, hurtExtraParams
end

function BattleDataCount.DealBuffEffect(atkUnit, defUnit, hurt, skillType, isBuff, extraParams, subSkillId, hurtIndex, params)
  local absorbHurt = 0
  local buffEffectParams = {
    hurt = nil,
    absorbHurt = nil,
    lockBlood = false,
    invincible = false,
    unyielding = false,
    untreatable = false,
    immune = false
  }
  if hurt > 0 then
    if BattleBuffMgr.IsUnitInvincible(defUnit) == true then
      buffEffectParams.hurt = 0
      buffEffectParams.invincible = true
      return buffEffectParams
    end
    if true == BattleBuffMgr.IsUnitStealth(defUnit) then
      buffEffectParams.hurt = 0
      return buffEffectParams
    end
    if true == BattleBuffMgr.IsUnitUnyielding(defUnit) then
      buffEffectParams.hurt = 0
      buffEffectParams.unyielding = true
      return buffEffectParams
    end
    if true == BattleBuffMgr.IsUnitImmuneBuffHurt(defUnit) then
      if nil == subSkillId or hurtIndex and 1 ~= hurtIndex then
        buffEffectParams.hurt = 0
        return buffEffectParams
      else
        buffEffectParams.hurt = 1
        return buffEffectParams
      end
    end
    if atkUnit and skillType then
      hurt = BattleDataCount.DealSpecialDamageAdd(atkUnit, defUnit, hurt, extraParams, skillType, params)
      if params and params.finalDamageUpRatio then
        local count = params.finalDamageUpRatio
        if count and count > 0 then
          hurt = ceil(hurt * count)
        end
      end
    end
    if isBuff and params and params.buffUid then
      local buffUid = params.buffUid
      local buff = BattleBuffMgr.GetBuffByUid(buffUid)
      if buff then
        local add, sub = 0, 0
        local damageUp = 0
        local fromUnitUid = buff.fromUnitUid
        if fromUnitUid and fromUnitUid ~= buff.toUnitUid then
          local unit = BattleScene.GetUnitByUid(fromUnitUid)
          if unit and unit:IsAlive() then
            add = unit:GetAttr(ATTR_ENUM.damage_add)
            if buff:ContainEffectId(BUFF_EFFECT_ID.HOLY_WOOD_ONCE) then
              local value = unit:GetEffectTotalValue(BUFF_EFFECT_ID.HOLY_DAMAGE_UP)
              if 0 ~= value then
                damageUp = damageUp + value
              end
            end
          end
        end
        sub = defUnit:GetAttr(ATTR_ENUM.damage_sub)
        if 0 ~= add or 0 ~= sub or 0 ~= damageUp then
          hurt = ceil(hurt * (10000 + add + sub) / 10000 * (10000 + damageUp) / 10000)
        end
      end
    end
    if hurt <= 0 then
      buffEffectParams.hurt = 0
      return buffEffectParams
    end
    if (nil == params or true ~= params.ignoreShareHurt) and hurt > 0 and BattleBuffMgr.GetContainedEffect(defUnit, BUFF_EFFECT_ID.SHARE_HP) then
      local unitList = BattleBuffMgr.GetUnitListContainEffect(BUFF_EFFECT_ID.SHARE_HP)
      if #unitList > 1 then
        for _, unit in ipairs(unitList) do
          if unit.uid ~= defUnit.uid then
            local share_buffEffectParams = BattleDataCount.DealBuffEffect(atkUnit, unit, hurt, nil, false, nil, nil, nil, {ignoreShareHurt = true})
            share_buffEffectParams.notDisplay = true
            BattleAction.DealHurt(atkUnit, unit, share_buffEffectParams.hurt, nil, share_buffEffectParams)
            print_battle("共享血量 共享角色", unit.uid, "共享伤害", hurt)
          end
        end
      end
    end
    if skillType then
      local isContain, effectList
      isContain, effectList = BattleBuffMgr.GetContainedEffect(defUnit, BUFF_EFFECT_ID.ASSIST)
      if true == isContain then
        local assistFromUnit, fromUid, assistValue, _buffEffectParams, effect
        for i = 1, #effectList do
          effect = effectList[i]
          fromUid = effect.fromUnitUid
          assistFromUnit = BattleScene.GetUnitByUid(fromUid)
          if assistFromUnit:CanTargetChosen() then
            assistValue = ceil(hurt * effect.finalValue / 10000)
            hurt = hurt - assistValue
            print_battle("援护伤害 援护角色", fromUid, "分摊的伤害", assistValue, "分摊后剩余伤害", hurt)
            _buffEffectParams = BattleDataCount.DealBuffEffect(nil, assistFromUnit, assistValue, nil, false)
            BattleAction.DealHurt(atkUnit, assistFromUnit, _buffEffectParams.hurt, nil, _buffEffectParams)
            if atkUnit then
              atkUnit:SaveDamage(_buffEffectParams.hurt)
            end
            assistFromUnit:SaveDamaged(_buffEffectParams.hurt)
            if atkUnit then
              if atkUnit.camp == assistFromUnit.enemyCamp then
                BattleBuffMgr.TriggerUnitListener(assistFromUnit, BUFF_DEDUCE_TYPE.HURT_BY_ENEMY)
              end
              if false == atkUnit.isBuilding and atkUnit.uid ~= assistFromUnit.uid then
                BattleBuffMgr.TriggerUnitListener(assistFromUnit, BUFF_DEDUCE_TYPE.HURT_BY_ANYONE, nil, {
                  hurtFromUnitUid = atkUnit.uid
                })
              end
              if assistValue >= 0 and atkUnit.camp == assistFromUnit.enemyCamp then
                BattleBuffMgr.TriggerUnitListener(assistFromUnit, BUFF_DEDUCE_TYPE.HIT_BY_ENEMY, nil, {
                  hurtFromUnitUid = atkUnit.uid
                })
              end
            end
          end
        end
      end
    end
    hurt, absorbHurt = BattleBuffMgr.UpdateUnitBuffShield(defUnit, hurt)
    buffEffectParams.absorbHurt = absorbHurt
    if hurt > 0 then
      local isContain = BattleBuffMgr.ContainEffectId(defUnit, BUFF_EFFECT_ID.LOCK_BLOOD)
      if true == isContain then
        hurt = 0
        buffEffectParams.lockBlood = true
      end
    end
    if params and true == params.dealCounter then
      local isContain, effectList = BattleBuffMgr.GetContainedEffect(defUnit, BUFF_EFFECT_ID.COUNTER)
      if true == isContain then
        local value = 0
        local effect, extraEffectPath
        for i = 1, #effectList do
          effect = effectList[i]
          effect:UpdateValue()
          value = value + effect.finalValue
          if effect.extraEffectPath then
            extraEffectPath = effect.extraEffectPath
          end
        end
        if 0 ~= value then
          local fangyu_jianmian_counter = PanDingFangYu(defUnit, atkUnit)
          local kezhi_counter = PanDingKeZhi(defUnit, atkUnit)
          value = ceil(value * (10000 + fangyu_jianmian_counter) * (10000 + kezhi_counter) / 100000000)
          if 0 ~= value then
            local finalDamageAddPer_counter = 0
            isContain, effectList = BattleBuffMgr.GetContainedEffect(defUnit, BUFF_EFFECT_ID.FINAL_DAMAGE_ADD_PER)
            if true == isContain then
              for _, v in ipairs(effectList) do
                finalDamageAddPer_counter = finalDamageAddPer_counter + v.finalValue
              end
            end
            isContain, effectList = BattleBuffMgr.GetContainedEffect(defUnit, BUFF_EFFECT_ID.FINAL_DAMAGE_REDUCE_PER)
            if true == isContain then
              for _, v in ipairs(effectList) do
                finalDamageAddPer_counter = finalDamageAddPer_counter - v.finalValue
              end
            end
            if 0 ~= finalDamageAddPer_counter then
              print_battle("反伤 最终伤害加成：", finalDamageAddPer_counter)
              value = math.ceil(value * (10000 + finalDamageAddPer_counter) / 10000)
            end
          end
          local buffEffectParamsCounter = BattleDataCount.DealBuffEffect(defUnit, atkUnit, value, nil, false, nil, nil, nil)
          buffEffectParams.counter = {
            counterValue = buffEffectParamsCounter.hurt,
            absorbHurt = buffEffectParamsCounter.absorbHurt,
            counterEffectPath = extraEffectPath
          }
        end
      end
    end
    if (nil == params or true ~= params.ignoreShareHurt) and hurt > 0 then
      local isContain = BattleBuffMgr.GetContainedEffect(defUnit, BUFF_EFFECT_ID.SHARE_HURT)
      if isContain then
        local unitList = BattleBuffMgr.GetUnitListContainEffect(BUFF_EFFECT_ID.SHARE_HURT)
        if #unitList > 1 then
          hurt = math.ceil(hurt / #unitList)
          for _, unit in ipairs(unitList) do
            if unit.uid ~= defUnit.uid then
              local share_buffEffectParams = BattleDataCount.DealBuffEffect(atkUnit, unit, hurt, nil, false, nil, nil, nil, {ignoreShareHurt = true})
              BattleAction.DealHurt(atkUnit, unit, share_buffEffectParams.hurt, nil, share_buffEffectParams)
              if atkUnit then
                atkUnit:SaveDamage(share_buffEffectParams.hurt)
              end
              unit:SaveDamaged(share_buffEffectParams.hurt)
              print_battle("分摊伤害 分摊角色", unit.uid, "分摊的伤害", hurt)
              if atkUnit then
                if atkUnit.camp == unit.enemyCamp then
                  BattleBuffMgr.TriggerUnitListener(unit, BUFF_DEDUCE_TYPE.HURT_BY_ENEMY)
                end
                if false == atkUnit.isBuilding and atkUnit.uid ~= defUnit.uid then
                  BattleBuffMgr.TriggerUnitListener(unit, BUFF_DEDUCE_TYPE.HURT_BY_ANYONE, nil, {
                    hurtFromUnitUid = atkUnit.uid
                  })
                end
                if atkUnit.camp == unit.enemyCamp then
                  BattleBuffMgr.TriggerUnitListener(unit, BUFF_DEDUCE_TYPE.HIT_BY_ENEMY, nil, {
                    hurtFromUnitUid = atkUnit.uid
                  })
                end
              end
            end
          end
        end
      end
    end
  elseif hurt < 0 then
    if true == BattleBuffMgr.IsUnitUntreatable(defUnit) then
      buffEffectParams.hurt = 0
      buffEffectParams.untreatable = true
      return buffEffectParams
    end
    if skillType then
      local directValue = BattleBuffMgr.GetValueById(defUnit, BUFF_EFFECT_ID.DIRECT_TREAT)
      if directValue < 0 then
        hurt = hurt + directValue
        print_battle("301buff效果 直接：", directValue)
      end
    elseif true == isBuff then
      local beTreatAdd = defUnit:GetAttr(ATTR_ENUM.be_treat_add)
      if 0 ~= beTreatAdd then
        print_battle("治疗buff 生效时被治疗加成：", beTreatAdd)
        hurt = floor(hurt * (10000 + beTreatAdd) / 10000)
      end
    end
  end
  buffEffectParams.hurt = hurt
  return buffEffectParams
end

function BattleDataCount.DealSpecialDamageAdd(atkUnit, defUnit, hurt, extraParams, skillType, params)
  local total = 0
  local addDamagePer = 0
  local isContain, effectList, bullet
  if extraParams and extraParams.bulletUid then
    bullet = BattleScene.GetBulletByUid(extraParams.bulletUid)
  end
  local GetContainedEffect = BattleBuffMgr.GetContainedEffect
  local ContainEffectId = BattleBuffMgr.ContainEffectId
  if defUnit.isFreeze == true then
    isContain, effectList = GetContainedEffect(atkUnit, BUFF_EFFECT_ID.ATTACK_FREEZE_DAMAGE, bullet)
    if true == isContain then
      for i = 1, #effectList do
        addDamagePer = addDamagePer + effectList[i].finalValue
      end
    end
    print_battle("攻击冰冻角色，伤害变化", addDamagePer)
    total = total + addDamagePer
  end
  if true == defUnit.isStun then
    isContain, effectList = GetContainedEffect(atkUnit, BUFF_EFFECT_ID.STUN_DAMAGE, bullet)
    if true == isContain then
      for i = 1, #effectList do
        addDamagePer = addDamagePer + effectList[i].finalValue
      end
    end
    print_battle("攻击眩晕角色，伤害变化", addDamagePer)
    total = total + addDamagePer
  end
  isContain, effectList = GetContainedEffect(atkUnit, BUFF_EFFECT_ID.PERSIST_BURN_DAMAGE, bullet)
  if true == isContain and true == ContainEffectId(defUnit, BUFF_EFFECT_ID.PERSIST_BURN) then
    addDamagePer = 0
    for i = 1, #effectList do
      addDamagePer = addDamagePer + effectList[i].finalValue
    end
    print_battle("攻击灼烧【103】伤害变化", addDamagePer)
    total = total + addDamagePer
  end
  isContain, effectList = GetContainedEffect(atkUnit, BUFF_EFFECT_ID.PERSIST_WOOD_DAMAGE, bullet)
  if true == isContain and true == ContainEffectId(defUnit, BUFF_EFFECT_ID.PERSIST_WOOD) then
    addDamagePer = 0
    for i = 1, #effectList do
      addDamagePer = addDamagePer + effectList[i].finalValue
    end
    print_battle("攻击木伤【110】伤害变化", addDamagePer)
    total = total + addDamagePer
  end
  isContain, effectList = GetContainedEffect(atkUnit, BUFF_EFFECT_ID.NORMAL_ATTACK_MISS_DAMAGE, bullet)
  if true == isContain and true == defUnit.isBlind then
    addDamagePer = 0
    for i = 1, #effectList do
      addDamagePer = addDamagePer + effectList[i].finalValue
    end
    print_battle("攻击失明【508】伤害变化", addDamagePer)
    total = total + addDamagePer
  end
  if defUnit.battleUnitType == BATTLE_UNIT_TYPE.DEFENSE then
    isContain, effectList = GetContainedEffect(atkUnit, BUFF_EFFECT_ID.ATTACK_DEFENSE_DAMAGE, bullet)
    if true == isContain then
      addDamagePer = 0
      for i = 1, #effectList do
        addDamagePer = addDamagePer + effectList[i].finalValue
      end
      print_battle("打【防御】伤害加成", addDamagePer)
      total = total + addDamagePer
    end
  elseif defUnit.battleUnitType == BATTLE_UNIT_TYPE.MELEE_ATTACK then
    isContain, effectList = GetContainedEffect(atkUnit, BUFF_EFFECT_ID.ATTACK_MELEE_ATTACK_DAMAGE, bullet)
    if true == isContain then
      addDamagePer = 0
      for i = 1, #effectList do
        addDamagePer = addDamagePer + effectList[i].finalValue
      end
      print_battle("打【近战】伤害加成", addDamagePer)
      total = total + addDamagePer
    end
  elseif defUnit.battleUnitType == BATTLE_UNIT_TYPE.RANGED_ATTACK then
    isContain, effectList = GetContainedEffect(atkUnit, BUFF_EFFECT_ID.ATTACK_RANGED_ATTACK_DAMAGE, bullet)
    if true == isContain then
      addDamagePer = 0
      for i = 1, #effectList do
        addDamagePer = addDamagePer + effectList[i].finalValue
      end
      print_battle("打【弓箭】伤害加成", addDamagePer)
      total = total + addDamagePer
    end
  elseif defUnit.battleUnitType == BATTLE_UNIT_TYPE.SUPPORT then
    isContain, effectList = GetContainedEffect(atkUnit, BUFF_EFFECT_ID.ATTACK_SUPPORT_DAMAGE, bullet)
    if true == isContain then
      addDamagePer = 0
      for i = 1, #effectList do
        addDamagePer = addDamagePer + effectList[i].finalValue
      end
      print_battle("打【法师】伤害加成", addDamagePer)
      total = total + addDamagePer
    end
  end
  if atkUnit.battleUnitType == BATTLE_UNIT_TYPE.DEFENSE then
    isContain, effectList = GetContainedEffect(defUnit, BUFF_EFFECT_ID.BE_ATTACKED_DEFENSE_DAMAGE, bullet)
    if true == isContain then
      addDamagePer = 0
      for i = 1, #effectList do
        addDamagePer = addDamagePer + effectList[i].finalValue
      end
      print_battle("受到【防御】的伤害减免", addDamagePer)
      total = total + addDamagePer
    end
  elseif atkUnit.battleUnitType == BATTLE_UNIT_TYPE.MELEE_ATTACK then
    isContain, effectList = GetContainedEffect(defUnit, BUFF_EFFECT_ID.BE_ATTACKED_MELEE_ATTACK_DAMAGE, bullet)
    if true == isContain then
      addDamagePer = 0
      for i = 1, #effectList do
        addDamagePer = addDamagePer + effectList[i].finalValue
      end
      print_battle("受到【近战】的伤害减免", addDamagePer)
      total = total + addDamagePer
    end
  elseif atkUnit.battleUnitType == BATTLE_UNIT_TYPE.RANGED_ATTACK then
    isContain, effectList = GetContainedEffect(defUnit, BUFF_EFFECT_ID.BE_ATTACKED_RANGED_ATTACK_DAMAGE, bullet)
    if true == isContain then
      addDamagePer = 0
      for i = 1, #effectList do
        addDamagePer = addDamagePer + effectList[i].finalValue
      end
      print_battle("受到【弓箭】的伤害减免", addDamagePer)
      total = total + addDamagePer
    end
  elseif atkUnit.battleUnitType == BATTLE_UNIT_TYPE.SUPPORT then
    isContain, effectList = GetContainedEffect(defUnit, BUFF_EFFECT_ID.BE_ATTACKED_SUPPORT_DAMAGE, bullet)
    if true == isContain then
      addDamagePer = 0
      for i = 1, #effectList do
        addDamagePer = addDamagePer + effectList[i].finalValue
      end
      print_battle("受到【法师】的伤害减免", addDamagePer)
      total = total + addDamagePer
    end
  end
  isContain, effectList = GetContainedEffect(defUnit, BUFF_EFFECT_ID.BE_DAMAGE_ADD_PER, bullet)
  if true == isContain then
    addDamagePer = 0
    for i = 1, #effectList do
      addDamagePer = addDamagePer + effectList[i].finalValue
    end
    print_battle("受到所有伤害加成", addDamagePer)
    total = total + addDamagePer
  end
  if params and params.finalDamageUpPer then
    addDamagePer = addDamagePer + params.finalDamageUpPer
    total = total + addDamagePer
  end
  if skillType == BATTLE_SKILL_ENUM.UNIQUE then
    isContain, effectList = GetContainedEffect(defUnit, BUFF_EFFECT_ID.UNIQUE_DAMAGE_UP, bullet)
    if true == isContain then
      addDamagePer = 0
      for i = 1, #effectList do
        addDamagePer = addDamagePer + effectList[i].finalValue
      end
      print_battle("受到必杀的伤害提升", addDamagePer)
      total = total + addDamagePer
    end
  end
  isContain, effectList = GetContainedEffect(atkUnit, BUFF_EFFECT_ID.DISTANCE_DAMAGE, bullet)
  if true == isContain then
    addDamagePer = 0
    for i = 1, #effectList do
      addDamagePer = addDamagePer + effectList[i].finalValue
    end
    local distance = atkUnit.cachedDistance[defUnit.uid]
    addDamagePer = addDamagePer * floor(distance / 10)
    print_battle("距离目标每增加10，伤害提升N%", distance, addDamagePer)
    total = total + addDamagePer
  end
  isContain, effectList = GetContainedEffect(defUnit, BUFF_EFFECT_ID.DAMAGE_REDUCE_DISTANCE, bullet)
  if true == isContain then
    addDamagePer = 0
    for i = 1, #effectList do
      addDamagePer = addDamagePer + effectList[i].finalValue
    end
    local distance = atkUnit.cachedDistance[defUnit.uid]
    addDamagePer = addDamagePer * floor(distance / 100)
    print_battle("距离目标每增加100，伤害减免N%", distance, addDamagePer)
    total = total + addDamagePer
  end
  if 0 ~= total then
    hurt = max(ceil(hurt * (10000 + total) / 10000), 0)
  end
  return hurt
end

function BattleDataCount.GetManuallySkillHurt(skill, subSkillId, defUid)
  local skillAtk = skill:GetSkillAtk()
  local defUnit = BattleScene.GetUnitByUid(defUid)
  local hurtExtraParams = {}
  local hurt = 0
  local skillLevelUpConfig = skill:GetSkillLevelUpConfig()
  local subSkillConfig = TableData.GetConfig(subSkillId, "BaseSubSkill")
  local damageRate = skillLevelUpConfig.damage_rate * subSkillConfig.damage_rate[1]
  if damageRate > 0 then
    if BattleBuffMgr.IsUnitInvincible(defUnit) == true then
      hurtExtraParams.isInvincible = true
      return hurt, hurtExtraParams
    end
    if true == BattleBuffMgr.IsUnitStealth(defUnit) then
      return hurt, hurtExtraParams
    end
    if true == BattleBuffMgr.IsUnitUnyielding(defUnit) then
      hurtExtraParams.isUnyielding = true
      return 0, hurtExtraParams
    end
    local isShanbi = PanDingShanBi(nil, defUnit)
    if isShanbi then
      hurtExtraParams.isDodge = true
      return hurt, hurtExtraParams
    end
    local gedang_jiangdi = PanDingGeDang(nil, defUnit)
    if gedang_jiangdi < 0 then
      hurtExtraParams.isBlock = true
    end
    local fangyu_jianmian = PanDingFangYu(nil, defUnit)
    local kezhi = PanDingKeZhi(nil, defUnit, skill)
    local skillBaseDamage = skillAtk * damageRate / 100000000
    hurt = ceil(max(shanghai_fudong_min + BattleData.GetRandomSeed() * (shanghai_fudong_max - shanghai_fudong_min) / 10000, skillBaseDamage * (10000 + fangyu_jianmian) * (10000 + gedang_jiangdi) / 100000000) * (10000 + kezhi) / 10000)
    local buffEffectParams = BattleDataCount.DealBuffEffect(nil, defUnit, hurt, SKILL_TYPE_ENUM.MANUALLY, false, nil, subSkillId)
    local absorbHurt = buffEffectParams.absorbHurt
    hurt = buffEffectParams.hurt
    if 0 ~= absorbHurt then
      hurtExtraParams.absorbHurt = absorbHurt
    end
    hurtExtraParams.isInvincible = buffEffectParams.invincible
    if hurt > 0 then
      defUnit.curHurt = hurt
      defUnit:DealTriggerSkillAll(TRIGGER_CONDITION.SELF_HURT_MORE)
    end
  else
    if true == BattleBuffMgr.IsUnitUntreatable(defUnit) then
      hurtExtraParams.isUntreatable = true
      return 0, hurtExtraParams
    end
    local be_treat_add_def = defUnit:GetAttr(ATTR_ENUM.be_treat_add)
    local skillBaseTreat = skillAtk * damageRate / 100000000
    hurt = floor(min(zhiliao_fudong_min + BattleData.GetRandomSeed() * (zhiliao_fudong_max - zhiliao_fudong_min) / 10000, skillBaseTreat * (10000 + be_treat_add_def) / 10000))
    local buffEffectParams = BattleDataCount.DealBuffEffect(nil, defUnit, hurt, SKILL_TYPE_ENUM.MANUALLY, false, nil, subSkillId)
    hurt = buffEffectParams.hurt
  end
  if 0 ~= skillLevelUpConfig.damage_rate then
    hurtExtraParams.alwaysShow = true
  end
  return hurt, hurtExtraParams
end
