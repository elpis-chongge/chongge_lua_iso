BattleBomb = {}

function BattleBomb.InitLocalVar()
end

function BattleBomb.NewBomb(showDisplayConfig, fromUnit, targetUnit, skillId, subSkillId, bombExtraParams)
  local bomb = {
    inited = false,
    id = nil,
    uid = nil,
    fromUid = nil,
    targetUid = nil,
    showDisplayConfig = nil,
    fromUnit = nil,
    targetUnit = nil,
    model = nil,
    hurtIndex = 0,
    isDestroy = false,
    buffUidList = {},
    cachedBuffEffect = {},
    initDelayFrame = 0,
    bombDelayFrame = 0,
    hitSameTargetCount = nil,
    damageRate = nil,
    bombEffect = nil,
    bombSound = nil,
    bombHitSound = nil,
    hitSound = nil,
    alreadyHurt = false,
    finalDamageUpRatio = nil,
    finalDamageUpPer = nil
  }
  
  function bomb:Init()
    self.skillConfig = TableData.GetConfig(self.skillId, "BaseSkill")
    self.fromUid = self.fromUnit.uid
    self.targetUid = self.targetUnit.uid
    if self.fromUnit:IsAlive() == false then
      self:Destroy()
      return
    end
    if self.targetUnit:IsAlive() == false then
      self:Destroy()
      return
    end
    if false == BattleMgr.isBattleServer then
      self.bombSound = self.showDisplayConfig.bomb_sound_target
      self.bombHitSound = self.showDisplayConfig.bomb_sound_target_hit
      self:CreateModel()
    end
    self.inited = true
  end
  
  function bomb:CreateModel()
    local configPath = self.showDisplayConfig.bomb_effect_target
    if configPath then
      local splitPath = Split(configPath, ":")
      for _, path in ipairs(splitPath) do
        local effectPath = EffectUtil.GetFullPath(path)
        local effect = ResourceManager.Instantiate(effectPath)
        self.model = effect
        BattleResourceManager:AddGameObject(effect)
        SkillEffectsHelper.BindObject(effect, nil, self.targetUnit.model)
        EffectUtil.Overturn(effect, self.fromUnit.isFlip)
        EffectUtil.SetAutoDestroyCallback(effect, function()
          if BattleControl.isOver == true then
            return
          end
          if effect then
            BattleResourceManager:DestroyGameObject(effect)
          end
        end)
        if self.model and self.bombSound then
          local soundPathConfig = TableData.GetConfig(self.bombSound, "BaseSoundPath")
          if soundPathConfig then
            BattleActionDisplay.AddWaitDealSound(soundPathConfig.path, soundPathConfig.bank, self.model)
          end
        end
      end
    end
  end
  
  function bomb:AddBuff(uid)
    self.buffUidList[uid] = 1
    self:UpdateCachedBuffEffect()
  end
  
  function bomb:RemoveBuff(uid)
    self.buffUidList[uid] = nil
    self:UpdateCachedBuffEffect()
  end
  
  function bomb:UpdateCachedBuffEffect()
    local buffUidList = self.buffUidList
    local effectId, buff, effect, effectList
    local cachedList = {}
    local cachedEffectList
    local savedBuffList = BattleBuffMgr.savedBuffList
    for buffUid, enable in pairs(buffUidList) do
      buff = savedBuffList[buffUid]
      effectList = buff.effectList
      for i = 1, #effectList do
        effect = effectList[i]
        effectId = effect.effectId
        cachedEffectList = cachedList[effectId] or {}
        cachedEffectList[#cachedEffectList + 1] = effect
        cachedList[effectId] = cachedEffectList
      end
    end
    self.cachedBuffEffect = cachedList
  end
  
  function bomb:Update()
    if self.inited == false then
      if self.initDelayFrame then
        self.initDelayFrame = self.initDelayFrame - 1
        if self.initDelayFrame > 0 then
          return
        end
      end
      self:Init()
    end
    if self.isDestroy == true then
      return
    end
    if self.bombDelayFrame then
      self.bombDelayFrame = self.bombDelayFrame - 1
      if self.bombDelayFrame > 0 then
        return
      end
    end
    self:DealHurt()
    self:Destroy(true)
  end
  
  function bomb:SetVisible(visible)
    if BattleMgr.isBattleServer == true then
      return
    end
    if self.visible ~= visible and self.model then
      self.model:SetActive(visible)
    end
    self.visible = visible
  end
  
  function bomb:DealHurt()
    local defUnit = self.targetUnit
    if nil == defUnit then
      return false
    end
    if defUnit:IsAlive() == false then
      return false
    end
    if self.alreadyHurt == true then
      return false
    end
    local attackUnit = self.fromUnit
    if self.skillId and self.subSkillId then
      local curSkillType = self.skillConfig.type
      local realNum = 0
      local params = {
        bombUid = self.uid
      }
      if self.finalDamageUpRatio then
        params.finalDamageUpRatio = self.finalDamageUpRatio
      end
      local _count, _buffList = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(attackUnit, BUFF_EFFECT_ID.DAMAGE_REDUCE_BY_SAME_TARGET)
      if _count > 0 then
        local buff = _buffList[1]
        if buff then
          local buffConfig = buff.buffConfig
          local _param = Split(buffConfig.extra_param, ":")
          if #_param > 0 then
            local _index = self.hitSameTargetCount
            params.finalDamageUpPer = tonumber(_param[_index] or _param[#_param])
          end
        end
      end
      local hurtNum, hurtExtraParams = BattleDataCount.GetSkillHurt(self.skillId, self.subSkillId, attackUnit, defUnit, nil, self.hurtIndex, params)
      if hurtNum then
        if hurtNum >= 0 and defUnit.battleUnitType == BATTLE_UNIT_TYPE.MELEE_ATTACK then
          BattleAction.DealMoveToAttack(attackUnit, defUnit)
        elseif hurtNum < 0 and 1 == self.hurtIndex then
          BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.TREAT_PARTNER, nil, {
            treatUnitUid = defUnit.uid,
            treatNum = -hurtNum
          })
        end
        local hurtEffectParams = {
          showDisplayConfig = attackUnit.curSkillShowDisplayConfig,
          fromUid = attackUnit.uid,
          hurtIndex = self.hurtIndex,
          hitSound = self.hitSound
        }
        realNum = BattleAction.DealHurt(attackUnit, defUnit, hurtNum, nil, hurtExtraParams, hurtEffectParams, attackUnit.position.x > defUnit.position.x)
        local absorbHurt = hurtExtraParams.absorbHurt or 0
        local num = realNum + absorbHurt
        if 0 ~= num then
          attackUnit:SaveSkillDamageForTestBalance(num, curSkillType)
          attackUnit:SaveDamage(num)
          defUnit:SaveDamaged(num, attackUnit.uid ~= defUnit.uid)
          if attackUnit.camp == defUnit.enemyCamp then
            BattleBuffMgr.TriggerUnitListener(defUnit, BUFF_DEDUCE_TYPE.HURT_BY_ENEMY)
          end
          if false == attackUnit.isBuilding and attackUnit.uid ~= defUnit.uid then
            BattleBuffMgr.TriggerUnitListener(defUnit, BUFF_DEDUCE_TYPE.HURT_BY_ANYONE, nil, {
              hurtFromUnitUid = attackUnit.uid
            })
          end
        end
        if hurtNum >= 0 and attackUnit.camp == defUnit.enemyCamp then
          BattleBuffMgr.TriggerUnitListener(defUnit, BUFF_DEDUCE_TYPE.HIT_BY_ENEMY, nil, {
            hurtFromUnitUid = attackUnit.uid
          })
        end
        if 1 == self.hurtIndex and defUnit.haveRage then
          BattleAction.DealRageChange(defUnit, defUnit:GetAttr(ATTR_ENUM.rage_hit))
        end
      end
      BattleBuffMgr.TriggerBombListener(self, BUFF_DEDUCE_TYPE.BOMB_HURT)
      if hurtExtraParams.counter then
        local counterEffectParams
        if hurtExtraParams.counter.counterEffectPath then
          counterEffectParams = {
            effectPath = hurtExtraParams.counter.counterEffectPath
          }
        end
        realNum = BattleAction.DealHurt(defUnit, attackUnit, hurtExtraParams.counter.counterValue, nil, nil, counterEffectParams)
        local absorbHurt = hurtExtraParams.counter.absorbHurt or 0
        local num = realNum + absorbHurt
        if 0 ~= num then
          defUnit:SaveSkillDamageForTestBalance(num)
          defUnit:SaveDamage(num)
          attackUnit:SaveDamaged(num)
          if defUnit.camp == attackUnit.enemyCamp then
            BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.HURT_BY_ENEMY)
          end
          if false == defUnit.isBuilding and attackUnit.uid ~= defUnit.uid then
            BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.HURT_BY_ANYONE, nil, {
              hurtFromUnitUid = defUnit.uid
            })
          end
        end
        if attackUnit.camp == defUnit.enemyCamp then
          BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.HIT_BY_ENEMY, nil, {
            hurtFromUnitUid = defUnit.uid
          })
        end
      end
    end
    if self.model and self.bombHitSound then
      local soundPathConfig = TableData.GetConfig(self.bombHitSound, "BaseSoundPath")
      if soundPathConfig then
        BattleActionDisplay.AddWaitDealSound(soundPathConfig.path, soundPathConfig.bank, self.model)
      end
    end
    self.alreadyHurt = true
  end
  
  function bomb:UpdateSortingOrder()
  end
  
  function bomb:Destroy(inBattleClear, battleOverClear)
    if true ~= battleOverClear then
      self:RemoveAllBuff()
      BattleScene.RemoveBomb(self.uid)
    end
    self.isDestroy = true
    if self.model then
      self.model = nil
    end
    self = nil
  end
  
  function bomb:RemoveAllBuff()
    local buff
    local savedBuffList = BattleBuffMgr.savedBuffList
    local buffUidArray = table.mapKey2Array(self.buffUidList, function(array)
      table.sort(array, function(a, b)
        return a < b
      end)
    end)
    for _, buffUid in ipairs(buffUidArray) do
      buff = savedBuffList[buffUid]
      if buff then
        buff:Remove()
      end
    end
    self.buffUidList = {}
  end
  
  bomb.uid = BattleScene.GetBombGlobalIndex()
  bomb.hurtIndex = bombExtraParams.hurtIndex
  bomb.hitSound = bombExtraParams.hitSound
  bomb.initDelayFrame = bombExtraParams.initDelayFrame or 0
  bomb.bombDelayFrame = bombExtraParams.bombDelayFrame or 0
  bomb.hitSameTargetCount = bombExtraParams.hitSameTargetCount or 1
  bomb.fromUnit = fromUnit
  bomb.targetUnit = targetUnit
  bomb.skillId = skillId
  bomb.subSkillId = subSkillId
  bomb.showDisplayConfig = showDisplayConfig
  if 0 == bomb.delayFrame then
    bomb:Init()
  end
  return bomb
end
