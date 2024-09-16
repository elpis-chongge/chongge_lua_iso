BattleBuff = {}

function BattleBuff.InitLocalVar()
end

function BattleBuff.NewBuff(_id, _from, _to, _settleNow, _extraParams, _delayParams)
  local buff = {}
  local tonumber = tonumber
  local ATTR_ENUM = ATTR_ENUM
  local ATTR_ID = ProtoEnum.ATTR_ID
  local BUFF_EFFECT_ID = BUFF_EFFECT_ID
  local BUFF_DEDUCE_TYPE = BUFF_DEDUCE_TYPE
  local TRIGGER_CONDITION = TRIGGER_CONDITION
  local BUFF_STATE_ENUM = BUFF_STATE_ENUM
  local BATTLE_STATE_ENUM = BATTLE_STATE_ENUM
  local BATTLE_CONFIG_ENUM = BATTLE_CONFIG_ENUM
  local BUFF_SETTLE_TYPE = BUFF_SETTLE_TYPE
  local Split = Split
  
  function buff:Init(id, from, to, settleNow, extraParams, delayParams)
    self:Clear()
    self.id = id
    self.from = from
    self.to = to
    self.fromUnitUid = from.unitUid
    self.fromCamp = from.camp
    self.fromSkillCamp = from.skillCamp
    self.fromManuallySkillId = from.manuallySkillId
    self.fromSkillId = from.skillId
    self.fromCardSkillId = from.cardSkillId
    self.toBulletUid = to.bulletUid
    self.toBombUid = to.bombUid
    self.toUnitUid = to.unitUid
    self.toCamp = to.camp
    self.destroyUnitWhenRemove = false
    local triggerFromBuffUid = extraParams and extraParams.triggerFromBuffUid
    if triggerFromBuffUid then
      local fromBuff = BattleBuffMgr.savedBuffList[triggerFromBuffUid]
      if fromBuff then
        self.lastBuffToUnitUid = fromBuff.toUnitUid
        if self.toUnitUid then
          local fromBuffConfig = fromBuff.buffConfig
          if 1 == fromBuffConfig.trigger_buff_unique then
            local toUnit = BattleScene.GetUnitByUid(self.toUnitUid)
            if BattleBuffMgr.IsContainBuffFromBuffUid(toUnit, triggerFromBuffUid) then
              self:Clear()
              return
            end
          end
        end
      end
    end
    self.uid = BattleBuffMgr.GetBuffGlobalIndex()
    self.triggerFromBuffUid = triggerFromBuffUid
    self.extraParams = extraParams
    if extraParams and extraParams.treatNum then
      self.triggerFromTreatNum = extraParams.treatNum
    end
    local buffConfig = TableData.GetConfig(id, "BaseSkillBuff")
    self.buffConfig = buffConfig
    if BattleMgr.isBattleServer ~= true then
      local buffPathId = extraParams and extraParams.buffPathId
      if buffPathId then
        local config = TableData.GetConfig(buffPathId, "BaseBuffPath")
        if config then
          if config.fashion_settle_paths and self.fromUnitUid then
            local fromUnit = BattleScene.GetUnitByUid(self.fromUnitUid)
            for _, v in ipairs(config.fashion_settle_paths) do
              local strs = Split(v, ":")
              if strs[1] == tostring(fromUnit.fashionId) then
                self.settleEffectPath = strs[2]
                break
              end
            end
          end
          if self.settleEffectPath == nil then
            self.settleEffectPath = config.settle_path
          end
          self.settleFullscreenEffectPath = config.fullscreen_effect
          self.settleEffectBindSlot = config.settle_bind_slot
          self.effectLoop = 1 == config.loop
          self.deduceEffectPath = config.deduce_path
          self.deduceEffectBindSlot = config.deduce_bind_slot
        end
      end
      self.settleSound = buffConfig.settle_sound
      self.deduceSound = buffConfig.deduce_sound
    end
    self.settleType = buffConfig.settle_type
    self.deduceType = buffConfig.deduce_type
    self.deduceTypeParam = buffConfig.deduce_type_param
    self.removeType = buffConfig.remove_type
    if self.deduceType == BUFF_DEDUCE_TYPE.NONE or 1 == buffConfig.singleton then
      self.overlayNum = extraParams and extraParams.overlayNum or 1
    end
    if self.deduceType == BUFF_DEDUCE_TYPE.NONE then
      self.deduceType = nil
    end
    self.deduceMaxCount = buffConfig.deduce_cnt
    self.deduceSettled = 1 == buffConfig.deduce_settled
    self.beAffectedWithEffects = buffConfig.be_affected_with_effects
    self.extraEffectPath = buffConfig.extra_effect_path
    local effectStrTable = buffConfig.value
    local strs, effectId, effectConfig, toUnit
    if self.toUnitUid then
      toUnit = BattleScene.GetUnitByUid(self.toUnitUid)
    end
    local tempContainedEffectList = {}
    local tempContainedEffectTagList = {}
    for i = 1, #effectStrTable do
      strs = Split(effectStrTable[i], ":")
      effectId = tonumber(strs[1])
      tempContainedEffectList[effectId] = 1
      effectConfig = TableData.GetConfig(effectId, "BaseSkillBuffEffect")
      if effectConfig then
        if effectConfig.delay_frame_settle then
          self.delayFrameSettle = effectConfig.delay_frame_settle
        end
        if effectConfig.attribute_id then
          self.containAttributeIdMap[effectConfig.attribute_id] = 1
        end
        if effectConfig.effect_tag then
          for _, tag in ipairs(effectConfig.effect_tag) do
            tempContainedEffectTagList[tag] = 1
          end
        end
      end
    end
    if buffConfig.delay_frame_settle then
      self.delayFrameSettle = buffConfig.delay_frame_settle
    end
    if delayParams then
      if delayParams.settleDelay then
        if self.delayFrameSettle then
          self.delayFrameSettle = self.delayFrameSettle + delayParams.settleDelay
        else
          self.delayFrameSettle = delayParams.settleDelay
        end
      end
      if delayParams.deduceDelay then
        self.delayFrameDeduce = delayParams.deduceDelay
      end
    end
    local canSettle, triggerReset
    if (nil == self.delayFrameSettle or self.delayFrameSettle <= 0) and (true == settleNow or self.settleType == BUFF_SETTLE_TYPE.NOW) then
      canSettle, triggerReset = self:CanSettle()
      if false == canSettle and false == triggerReset then
        self:Clear()
        return
      end
    end
    self.type = buffConfig.type
    if 1 == tempContainedEffectList[BUFF_EFFECT_ID.REDUCE_CATAPULT_DAMAGE] and self.fromUnitUid then
      local fromUnit = BattleScene.GetUnitByUid(self.fromUnitUid)
      if fromUnit then
        local count = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(fromUnit, 1114)
        self.deduceMaxCount = self.deduceMaxCount + count
      end
    end
    if self.deduceType == BUFF_DEDUCE_TYPE.PER_TIME then
      self.deducePerFrames = buffConfig.deduce_value * BATTLE_CONFIG_ENUM.FIXED_FPS
      if self.deduceMaxCount and self.deduceMaxCount >= 0 then
        if 1 == tempContainedEffectList[BUFF_EFFECT_ID.CHANGE_DEDUCE_CNT_WITH_SKILL_COUNT] then
          if self.toUnitUid and self.fromCardSkillId then
            local settleUnit = BattleScene.GetUnitByUid(self.toUnitUid)
            if settleUnit then
              local count = settleUnit:GetSkillAlreadyTriggerCount(self.fromCardSkillId)
              if count > 0 then
                self.deduceMaxCount = self.deduceMaxCount * count
              end
            end
          end
        elseif 1 == tempContainedEffectList[BUFF_EFFECT_ID.CHANGE_DEDUCE_CNT_WITH_BUFF_COUNT] then
          if self.toUnitUid then
            local settleUnit = BattleScene.GetUnitByUid(self.toUnitUid)
            if settleUnit then
              local _buffId = self.deduceTypeParam
              if _buffId then
                local count = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(settleUnit, tonumber(_buffId))
                if count > 0 then
                  self.deduceMaxCount = self.deduceMaxCount + count
                end
              end
            end
          end
          if self.deduceMaxCount <= 0 then
            self:Clear()
            return
          end
        end
        self.remainMaxFrames = self.deducePerFrames * self.deduceMaxCount
        self.remainFrames = self.remainMaxFrames
      end
    elseif self.deduceType == BUFF_DEDUCE_TYPE.PER_FRAME then
      self.deducePerFrames = buffConfig.deduce_value
      if self.deduceMaxCount and self.deduceMaxCount >= 0 then
        self.remainMaxFrames = self.deducePerFrames * self.deduceMaxCount
        self.remainFrames = self.remainMaxFrames
      end
    elseif self.deduceType == BUFF_DEDUCE_TYPE.AFTER_NORMAL_ATTACK then
      if buffConfig.deduce_value and buffConfig.deduce_value > 0 then
        self.maxDeduceWaitCount = buffConfig.deduce_value
        self.curDeduceWaitCount = self.maxDeduceWaitCount
      end
    elseif self.deduceType == BUFF_DEDUCE_TYPE.AFTER_FRAME then
      self.deducePerFrames = buffConfig.deduce_value or 0
      if self.deduceMaxCount and self.deduceMaxCount >= 0 then
        if 1 == tempContainedEffectTagList[BUFF_EFFECT_TAG.CONTROL] and self.toUnitUid then
          local settleUnit = BattleScene.GetUnitByUid(self.toUnitUid)
          local changeControlTimeEffectId = BUFF_EFFECT_ID.CHANGE_CONTROL_TIME
          if BattleBuffMgr.ContainEffectId(settleUnit, changeControlTimeEffectId) then
            local totalValue = settleUnit:GetEffectTotalValue(changeControlTimeEffectId)
            self.deducePerFrames = self.deducePerFrames + totalValue
          end
        end
        if (1 == tempContainedEffectList[BUFF_EFFECT_ID.SLOW_DOWN_ATK_SPD] or 1 == tempContainedEffectList[BUFF_EFFECT_ID.SLOW_DOWN_ATK_SPD_TRANS]) and self.fromUnitUid then
          local fromUnit = BattleScene.GetUnitByUid(self.fromUnitUid)
          local changeTimeEffectId = BUFF_EFFECT_ID.SLOW_DOWN_ATK_SPD_TIME
          if BattleBuffMgr.ContainEffectId(fromUnit, changeTimeEffectId) then
            local totalValue = fromUnit:GetEffectTotalValue(changeTimeEffectId)
            self.deducePerFrames = math.ceil(self.deducePerFrames * (10000 + totalValue) / 10000)
          end
        end
        if 1 == tempContainedEffectList[BUFF_EFFECT_ID.CHANGE_DEDUCE_CNT_WITH_BUFF_COUNT] then
          if self.toUnitUid then
            local settleUnit = BattleScene.GetUnitByUid(self.toUnitUid)
            if settleUnit then
              local _buffId = self.deduceTypeParam
              if _buffId then
                local count = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(settleUnit, tonumber(_buffId))
                if count > 0 then
                  self.deducePerFrames = self.deducePerFrames + count * BATTLE_CONFIG_ENUM.FIXED_FPS
                end
              end
            end
          end
          if self.deducePerFrames <= 0 then
            self:Clear()
            return
          end
        end
        self.remainMaxFrames = self.deducePerFrames * self.deduceMaxCount
        self.remainFrames = self.remainMaxFrames
      end
    end
    self.activeForever = buffConfig.active_forever
    self:SetState(BUFF_STATE_ENUM.TEMP)
    BattleBuffMgr.AddToBuffList(self)
    print_battle("释放buff BuffId", id, "BuffUid", self.uid, "是否立即挂载", settleNow)
    if true == settleNow or self.settleType == BUFF_SETTLE_TYPE.NOW then
      self:Settle(canSettle, triggerReset)
    else
      BattleBuffMgr.RegisterSettleListener(self)
    end
  end
  
  function buff:Clear()
    self.id = nil
    self.uid = nil
    self.triggerFromBuffUid = nil
    self.fromUnitUid = nil
    self.fromCamp = nil
    self.fromSkillCamp = nil
    self.fromManuallySkillId = nil
    self.fromSkillId = nil
    self.fromCardSkillId = nil
    self.lastBuffToUnitUid = nil
    self.toUnitUid = nil
    self.toBulletUid = nil
    self.toBombUid = nil
    self.toCamp = nil
    self.alreadyMove = 0
    self.effectModel = nil
    self.position = {x = 0, y = 0}
    self.effectList = {}
    self.effectTagList = {}
    self.needShowBuffIcon = nil
    self.containEffect = {}
    self.containAttributeIdMap = {}
    self.activeCount = nil
    self.curState = nil
    self.lastDeduceFrame = nil
    self.nextUpdateFrame = nil
    self.settleFrame = nil
    self.settleType = nil
    self.deduceType = nil
    self.deduceSettled = nil
    self.deduceCount = 0
    self.deduceMaxCount = 0
    self.deducePerFrames = nil
    self.remainFrames = nil
    self.remainMaxFrames = nil
    self.deduceTriggerUnitUid = nil
    self.waitSettle = nil
    self.delayFrameSettle = nil
    self.waitDeduce = nil
    self.delayFrameDeduce = nil
    self.curDeduceWaitCount = nil
    self.maxDeduceWaitCount = nil
    self.cachedBulletTargetUid = {}
    self.beAffectedWithEffects = nil
    self.settleEffectPath = nil
    self.settleFullscreenEffectPath = nil
    self.settleEffectBindSlot = nil
    self.deduceEffectPath = nil
    self.deduceEffectBindSlot = nil
    self.effectLoop = false
    self.settleEffect = nil
    self.overlayNum = nil
    self.attackWarningEffectList = nil
    self.pause = false
  end
  
  function buff:SetDeduceTriggerUnitUid(uid)
    self.deduceTriggerUnitUid = uid
  end
  
  function buff:AddBulletTargetUid(uid)
    self.cachedBulletTargetUid[uid] = 1
  end
  
  function buff:IsAlreadyInBulletTarget(uid)
    return 1 == self.cachedBulletTargetUid[uid]
  end
  
  function buff:ContainEffectIdBeforeSettle(effectId)
    local effectStrTable = self.buffConfig.value
    if effectStrTable then
      local strList
      for _, v in ipairs(effectStrTable) do
        strList = Split(v, ":")
        if strList and strList[1] == tostring(effectId) then
          return true
        end
      end
    end
    return false
  end
  
  function buff:ContainEffectTagBeforeSettle(effectTag)
    local effectStrTable = self.buffConfig.value
    if effectStrTable then
      local strList, effectId, effectConfig
      for _, v in ipairs(effectStrTable) do
        strList = Split(v, ":")
        if strList[1] then
          effectId = tonumber(strList[1])
          effectConfig = TableData.GetConfig(effectId, "BaseSkillBuffEffect")
          if effectConfig and effectConfig.effect_tag and table.contain(effectConfig.effect_tag, effectTag) then
            return true
          end
        end
      end
    end
    return false
  end
  
  function buff:Settle(canSettle, triggerReset, param)
    if self.delayFrameSettle ~= nil then
      if self.delayFrameSettle > 0 then
        self.delayFrameSettle = self.delayFrameSettle - 1
        self.waitSettle = true
        return
      else
        self.delayFrameSettle = nil
        self.waitSettle = nil
      end
    end
    local settleUnit, settleBullet, settleCamp, settleBomb
    if self.toUnitUid then
      settleUnit = BattleScene.GetUnitByUid(self.toUnitUid)
    elseif self.toBulletUid then
      settleBullet = BattleScene.GetBulletByUid(self.toBulletUid)
    elseif self.toCamp then
      settleCamp = BattleScene.GetCampObject(self.toCamp)
    elseif self.toBombUid then
      settleBomb = BattleScene.GetBombByUid(self.toBombUid)
    end
    if settleUnit then
      if settleUnit:IsAlive() == false and false == self:ContainEffectIdBeforeSettle(BUFF_EFFECT_ID.WAIT_FOR_REVIVE) and false == self:ContainEffectIdBeforeSettle(BUFF_EFFECT_ID.REVIVE) and false == self:ContainEffectIdBeforeSettle(BUFF_EFFECT_ID.SUMMON) and 1 ~= self.buffConfig.settle_when_dead then
        self:Remove()
        return
      end
      if nil == canSettle then
        canSettle, triggerReset = self:CanSettle()
      end
      if true == triggerReset then
        local count, list
        count, list = BattleBuffMgr.GetSettledBuffByUnitAndId(settleUnit, self.id, function(array)
          table.sort(array, function(a, b)
            return a.uid < b.uid
          end)
        end)
        if count > 0 then
          for i = 1, #list do
            list[i]:Reset()
          end
        end
        print_battle("buff重置：", self.id)
      end
      if false == canSettle then
        print_battle("buff挂载条件不足：", self.id)
        self:Remove()
        return
      end
      self.lastDeduceFrame = BattleControl.curFixedFrame
      local isClean, cleanCount = self:DealClean(settleUnit)
      print_battle("驱散", isClean, cleanCount)
      if true == isClean then
        local cleanAddBuff = self.buffConfig.clean_add_buff
        local cleanAddBuffUnit = self.buffConfig.clean_add_buff_unit
        if cleanAddBuff and #cleanAddBuff > 0 then
          if 1 == cleanAddBuffUnit then
            for i = 1, cleanCount do
              BattleBuffMgr.AnalysisBuffList(cleanAddBuff, self.from, {
                self.to
              }, true, {
                triggerFromBuffUid = self.uid,
                cleanCount = cleanCount
              })
            end
          else
            BattleBuffMgr.AnalysisBuffList(cleanAddBuff, self.from, {
              self.to
            }, true, {
              triggerFromBuffUid = self.uid,
              cleanCount = cleanCount
            })
          end
        end
      end
      if true == self:ContainEffectIdBeforeSettle(BUFF_EFFECT_ID.ATTRACT) then
        local isContain, _, buffList = BattleBuffMgr.GetContainedEffect(settleUnit, BUFF_EFFECT_ID.ATTRACT, nil, true)
        if true == isContain then
          for i = 1, #buffList do
            buffList[i]:Remove()
          end
        end
      end
      if self.deduceType == BUFF_DEDUCE_TYPE.MOVE then
        self.alreadyMove = settleUnit.totalMove
      end
    else
      if settleBullet then
        local conditionResult = self:TestCondition(self.buffConfig.trigger_condition, self.buffConfig.trigger_type, self.buffConfig.trigger_value)
        if false == conditionResult then
          print_battle("buff挂载条件不足：", self.id)
          self:Remove()
          return
        end
      end
      if settleCamp then
        local isClean, cleanCount = self:DealClean(nil, settleCamp)
        print_battle("驱散", isClean, cleanCount)
      end
      self.lastDeduceFrame = BattleControl.curFixedFrame
    end
    self.settleFrame = BattleControl.curFixedFrame
    local effectStrTable = self.buffConfig.value
    local effect
    for i = 1, #effectStrTable do
      effect = BattleBuffEffect.NewEffect(effectStrTable[i], self.uid)
      local effectTags = effect.effectTags
      if effectTags then
        for _, tag in ipairs(effectTags) do
          self.effectTagList[tag] = 1
        end
      end
      self.containEffect[effect.effectId] = true
      self.effectList[#self.effectList + 1] = effect
      if true == effect.containAttributeValue then
        self.containAttributeValue = true
      end
      if false == BattleMgr.isBattleServer then
        if true == effect.needShowIcon then
          self.needShowBuffIcon = true
        end
        effect.extraEffectPath = self.extraEffectPath
      end
    end
    if 1 == self.buffConfig.not_show_icon then
      self.needShowBuffIcon = false
    end
    self:SetState(BUFF_STATE_ENUM.SETTLED)
    BattleBuffMgr.UnRegisterSettleListener(self.uid, self.settleType)
    BattleBuffMgr.RegisterDeduceListener(self)
    BattleBuffMgr.RegisterRemoveListener(self)
    if self.toCamp and true == self:ContainEffectId(BUFF_EFFECT_ID.CHANGE_BURST_ENERGY_ADD) then
      local burst = BattleScene.GetBurst(self.toCamp)
      if burst then
        burst:ChangeEnergyAdd(self:GetEffectTotalValue(BUFF_EFFECT_ID.CHANGE_BURST_ENERGY_ADD))
      end
    end
    if settleUnit then
      if true == self:ContainEffectId(BUFF_EFFECT_ID.CLEAR_ATTACK_TARGET) then
        settleUnit.moveTargetUid = nil
        settleUnit.attackTargetUid = nil
      end
      if true == self:ContainEffectId(BUFF_EFFECT_ID.CLEAR_CHARGE) then
        settleUnit:ClearCharge()
      end
    end
    local fromUnit
    if self.fromUnitUid then
      fromUnit = BattleScene.GetUnitByUid(self.fromUnitUid)
    end
    local settleAsSkillId = self.buffConfig.settle_as_skill_id
    if self.fromUnitUid and settleAsSkillId and fromUnit then
      local skillConfig = TableData.GetConfig(settleAsSkillId, "BaseSkill")
      local curSkill = {
        id = settleAsSkillId,
        type = skillConfig.type,
        isTrigger = true,
        triggerFromBuff = true
      }
      fromUnit:SaveTriggerSkill(curSkill)
    end
    if self.settleSound then
      local soundPathConfig = TableData.GetConfig(self.settleSound, "BaseSoundPath")
      if soundPathConfig then
        BattleActionDisplay.AddWaitDealSound(soundPathConfig.path, soundPathConfig.bank, settleUnit and (settleUnit.model or settleUnit.effectModel))
      end
    end
    local fullscreenPath = self.settleFullscreenEffectPath
    if fullscreenPath then
      BattleActionDisplay.AddWaitDealEffect(nil, nil, fullscreenPath, EffectUtil.GetFullPath(fullscreenPath), true)
    end
    if settleUnit then
      if self.settleEffectPath then
        if self.effectLoop then
          BattleActionDisplay.AddWaitDealEffect(fromUnit, settleUnit, self.settleEffectPath, EffectUtil.GetFullPath(self.settleEffectPath), false, self.settleEffectBindSlot)
        else
          BattleActionDisplay.AddWaitDealEffect(fromUnit, settleUnit, self.settleEffectPath, EffectUtil.GetFullPath(self.settleEffectPath), true, self.settleEffectBindSlot)
        end
      end
      if false == BattleMgr.isBattleServer and self.buffConfig.settle_warning_path then
        self.attackWarningEffectList = {}
        local buffConfig = self.buffConfig
        local rangeType, rangeX, rangeY = buffConfig.range_type, buffConfig.range_x, buffConfig.range_y
        local targetType = 2041
        local warningEffect = buffConfig.settle_warning_path
        local strList = Split(warningEffect, ":")
        self.attackWarningEffectList[#self.attackWarningEffectList + 1] = {
          targetType = targetType,
          rangeType = rangeType,
          rangeX = rangeX,
          rangeY = rangeY,
          frame_start = tonumber(strList[1]),
          frame_end = tonumber(strList[2]),
          effect_path = strList[3],
          alreadyDeal = nil
        }
      end
      if true == self:ContainEffectId(BUFF_EFFECT_ID.SUDDEN_DEATH) then
        settleUnit:ClearControlState()
        settleUnit:SetStateToDead()
        return
      end
      if true == self:ContainEffectId(BUFF_EFFECT_ID.CHANGE_BUFF_DEDUCE_VALUE) then
        local effectList = self:GetEffectListById(BUFF_EFFECT_ID.CHANGE_BUFF_DEDUCE_VALUE)
        if effectList[1] then
          local changeBuffId = effectList[1].effectCommonParam
          if changeBuffId then
            settleUnit:UpdateBuffDeduceValue(changeBuffId, effectList[1].finalValue)
          end
        end
      end
      settleUnit:AddBuff(self.uid, self.needShowBuffIcon)
      if false == BattleMgr.isBattleServer then
        BattleAction.DealBuffSettle(settleUnit, self)
      end
      self:TriggerUnitAttrChanged(settleUnit, true)
      self:TriggerUnitShieldGot(settleUnit)
      if true == self:ContainEffectId(BUFF_EFFECT_ID.SHIELD_SPECIAL) then
        local maxValue = self:GetAttributeValue(ATTR_ID.SHIELD_SPECIAL)
        settleUnit:AddMaxSpecialShield(maxValue)
      end
      local getFromUnitUid = function()
        local fromUnitUid = self.fromUnitUid
        if nil == fromUnitUid then
          fromUnitUid = self.lastBuffToUnitUid
        end
        return fromUnitUid
      end
      local buffStateCheck = {
        {
          id = BUFF_EFFECT_ID.STUN,
          id2 = BUFF_EFFECT_ID.BOSS_STUN,
          callBack = function()
            settleUnit:SetStun(true)
          end
        },
        {
          id = BUFF_EFFECT_ID.SILENT,
          callBack = function()
            settleUnit:SetSilent(true)
          end
        },
        {
          id = BUFF_EFFECT_ID.FREEZE,
          callBack = function()
            settleUnit:SetFreeze(true)
          end,
          updateControlDisplay = true
        },
        {
          id = BUFF_EFFECT_ID.STEALTH,
          callBack = function()
            settleUnit:SetStealth(true)
          end,
          updateControlDisplay = true
        },
        {
          id = BUFF_EFFECT_ID.TIME_PAUSE,
          callBack = function()
            settleUnit:SetTimePause(true)
          end
        },
        {
          id = BUFF_EFFECT_ID.PETRIFIED,
          callBack = function()
            settleUnit:SetPetrified(true)
          end,
          updateControlDisplay = true
        },
        {
          id = BUFF_EFFECT_ID.ATTRACT,
          callBack = function()
            settleUnit:SetBeAttractedUid(getFromUnitUid())
          end
        },
        {
          id = BUFF_EFFECT_ID.CHARM,
          callBack = function()
            settleUnit:SetCharm(true)
          end
        },
        {
          id = BUFF_EFFECT_ID.PERSIST_CAST,
          callBack = function()
            settleUnit:SetPersistCast(true)
          end
        },
        {
          id = BUFF_EFFECT_ID.TRICK,
          callBack = function()
            settleUnit:SetTrick(true)
          end
        },
        {
          id = BUFF_EFFECT_ID.UNABLE_TO_SELECT,
          callBack = function()
            settleUnit:SetUnableToSelect(true)
          end
        },
        {
          id = BUFF_EFFECT_ID.GHOST,
          callBack = function()
            settleUnit:SetGhost(true)
          end
        },
        {
          id = BUFF_EFFECT_ID.DEFENSE,
          callBack = function()
            settleUnit:SetDefense(true)
          end
        },
        {
          id = BUFF_EFFECT_ID.BLIND,
          callBack = function()
            settleUnit:SetBlind(true)
          end
        },
        {
          id = BUFF_EFFECT_ID.FEAR,
          callBack = function()
            settleUnit:SetFear(true, self)
          end
        }
      }
      local enable = false
      local effectId, effectId2, callBack, v
      for i = 1, #buffStateCheck do
        v = buffStateCheck[i]
        effectId = v.id
        effectId2 = v.id2
        callBack = v.callBack
        if effectId2 then
          if true == self:ContainEffectId(effectId) or true == self:ContainEffectId(effectId2) then
            callBack()
            if v.updateControlDisplay then
              enable = true
            end
          end
        elseif true == self:ContainEffectId(effectId) then
          callBack()
          if v.updateControlDisplay then
            enable = true
          end
        end
      end
      if false == BattleMgr.isBattleServer then
        local persistEffect = {
          {
            id = BUFF_EFFECT_ID.PERSIST_BURN,
            motionId = BATTLE_MOTION_STATE_ENUM.PERSIST_BURN
          },
          {
            id = BUFF_EFFECT_ID.PERSIST_WATER,
            motionId = BATTLE_MOTION_STATE_ENUM.PERSIST_WATER
          },
          {
            id = BUFF_EFFECT_ID.PERSIST_ICE,
            motionId = BATTLE_MOTION_STATE_ENUM.PERSIST_ICE
          },
          {
            id = BUFF_EFFECT_ID.PERSIST_LIGHT,
            motionId = BATTLE_MOTION_STATE_ENUM.PERSIST_LIGHT
          },
          {
            id = BUFF_EFFECT_ID.PERSIST_DARK,
            motionId = BATTLE_MOTION_STATE_ENUM.PERSIST_DARK
          },
          {
            id = BUFF_EFFECT_ID.PERSIST_WOOD,
            motionId = BATTLE_MOTION_STATE_ENUM.PERSIST_WOOD
          }
        }
        for _, v in ipairs(persistEffect) do
          if true == self:ContainEffectId(v.id) and true == BattleBuffMgr.ContainEffectId(settleUnit, v.id) then
            settleUnit:AddMotionState(v.motionId)
          end
        end
      end
      if enable then
        BattleActionDisplay.UpdateControlDisplay(settleUnit)
      end
      if 1 == self.activeForever then
        local hpValue = self:GetAttributeValue(ATTR_ID.HP)
        if hpValue < 0 and self.fromUnitUid then
          local unit = BattleScene.GetUnitByUid(self.fromUnitUid)
          BattleBuffMgr.TriggerUnitListener(unit, BUFF_DEDUCE_TYPE.TREAT_PARTNER, nil, {
            treatUnitUid = self.toUnitUid,
            treatNum = -hpValue
          })
        end
      end
      if self:ContainControl() then
        if nil == self.fromUnitUid then
          BattleBuffMgr.TriggerUnitListener(settleUnit, BUFF_DEDUCE_TYPE.CONTROLLED_BY_UNIT)
        else
          local unit = BattleScene.GetUnitByUid(self.fromUnitUid)
          if true ~= unit.isMonster then
            BattleBuffMgr.TriggerUnitListener(settleUnit, BUFF_DEDUCE_TYPE.CONTROLLED_BY_UNIT)
          end
        end
        BattleBuffMgr.TriggerUnitListener(settleUnit, BUFF_DEDUCE_TYPE.CONTROLLED)
      end
      if self:ContainPersistentDamage() then
        BattleBuffMgr.TriggerUnitListener(settleUnit, BUFF_DEDUCE_TYPE.SETTLED_DOT)
      end
      if true == self:ContainEffectTag(BUFF_EFFECT_TAG.DEFENSE_REDUCE) then
        BattleBuffMgr.TriggerUnitListener(settleUnit, BUFF_DEDUCE_TYPE.DEFENSE_REDUCE)
      end
      if true == self:ContainEffectId(BUFF_EFFECT_ID.UNYIELDING) then
        settleUnit:SetAttr(ATTR_ENUM.hp, 1)
      end
      if true == self:ContainEffectId(BUFF_EFFECT_ID.STEALTH) then
        BattleScene.DealClearTarget(settleUnit)
        if self:ContainEffectId(BUFF_EFFECT_ID.SPECIAL_116) and settleUnit.curState ~= BATTLE_STATE_ENUM.WAIT_ATTACK and settleUnit.curState ~= BATTLE_STATE_ENUM.ATTACK and settleUnit.curState ~= BATTLE_STATE_ENUM.ATTACK_OVER then
          BattleAction.ForceChangeState(settleUnit, BATTLE_STATE_ENUM.SPECIAL)
        end
      end
    elseif settleBullet then
      local finalDamageAddPer = self:GetEffectTotalValue(BUFF_EFFECT_ID.GROW_CATAPULT_DAMAGE)
      if finalDamageAddPer then
        settleBullet.finalDamageAddPer = settleBullet.finalDamageAddPer + finalDamageAddPer
      end
      local finalDamageReducePer = self:GetEffectTotalValue(BUFF_EFFECT_ID.REDUCE_CATAPULT_DAMAGE)
      if finalDamageReducePer then
        settleBullet.finalDamageReduceBuffPer = settleBullet.finalDamageReduceBuffPer + finalDamageReducePer
      end
      settleBullet:AddBuff(self.uid)
    elseif settleBomb then
      settleBomb:AddBuff(self.uid)
    elseif settleCamp then
      settleCamp:AddBuff(self.uid)
    end
    if self.toUnitUid then
      print_battle("buff成功挂载，buffId:", self.id, " 挂载方:", self.toUnitUid, " buffUid:", self.uid)
    elseif self.toBulletUid then
      print_battle("buff成功挂载，buffId:", self.id, " 挂载子弹:", self.toBulletUid, " buffUid:", self.uid)
    elseif self.toBombUid then
      print_battle("buff成功挂载，buffId:", self.id, " 挂载炸弹:", self.toBombUid, " buffUid:", self.uid)
    elseif self.toCamp then
      print_battle("buff成功挂载，buffId:", self.id, " 挂载阵营:", self.toCamp == BATTLE_CAMP_FLAG.LEFT and "左" or "右", " buffUid:", self.uid)
    end
    local settleBuffList = self.buffConfig.settle_buff_list
    if settleBuffList and #settleBuffList > 0 then
      BattleBuffMgr.AnalysisBuffList(settleBuffList, self.from, {
        self.to
      }, true, {
        triggerFromBuffUid = self.uid
      })
    end
    if self.deduceType == BUFF_DEDUCE_TYPE.NOW or true == self.deduceSettled then
      if true == self:ContainEffectId(BUFF_EFFECT_ID.BEAT_BACK) then
        local _fromUnit = BattleScene.GetUnitByUid(self.fromUnitUid)
        if _fromUnit and settleUnit then
          local position_fromUnit = _fromUnit.position
          local position_settleUnit = settleUnit.position
          self.delayFrameDeduce = 0
          local trapModel = _fromUnit.model
          if trapModel then
            local fromBuff = BattleBuffMgr.savedBuffList[self.triggerFromBuffUid]
            if fromBuff and true == fromBuff:ContainEffectId(BUFF_EFFECT_ID.TRAP_DISPLAY_10102) then
              local angle = MathUtil.GetVector3Angle(MathUtil.GetVector3Subtract(position_settleUnit, position_fromUnit), {
                x = 1,
                y = 0,
                z = 0
              })
              BattleActionDisplay.PlayBeatBackTrapState(_fromUnit, trapModel, angle, position_settleUnit.z - position_fromUnit.z)
            end
          end
        end
      end
      self:Deduce()
    end
    if self.extraParams and self.extraParams.deduceCountWhenSettled then
      local count = self.extraParams.deduceCountWhenSettled
      if count > 0 then
        self:Deduce({deduceCount = count})
      end
    end
  end
  
  function buff:Deduce(param)
    if self.delayFrameDeduce ~= nil then
      if self.delayFrameDeduce > 0 then
        self.delayFrameDeduce = self.delayFrameDeduce - 1
        self.waitDeduce = true
        return
      else
        self.delayFrameDeduce = nil
        self.waitDeduce = nil
      end
    end
    local curDeduceWaitCount = self.curDeduceWaitCount
    if curDeduceWaitCount and curDeduceWaitCount > 0 then
      if curDeduceWaitCount - 1 > 0 then
        self.curDeduceWaitCount = curDeduceWaitCount - 1
        return
      else
        self.curDeduceWaitCount = self.maxDeduceWaitCount
      end
    end
    local settleUnit, settleBullet, settleCamp, settleBomb
    if self.toUnitUid then
      settleUnit = BattleScene.GetUnitByUid(self.toUnitUid)
      print_battle("buff 生效，buffId:", self.id, " 挂载方:", self.toUnitUid, " buffUid:", self.uid)
    elseif self.toBulletUid then
      settleBullet = BattleScene.GetBulletByUid(self.toBulletUid)
      print_battle("buff 生效，buffId:", self.id, " 挂载子弹:", self.toBulletUid, " buffUid:", self.uid)
    elseif self.toCamp then
      settleCamp = BattleScene.GetCampObject(self.toCamp)
      print_battle("buff 生效，buffId:", self.id, " 挂载阵营:", self.toCamp == BATTLE_CAMP_FLAG.LEFT and "左" or "右", " buffUid:", self.uid)
    elseif self.toBombUid then
      settleBomb = BattleScene.GetBombByUid(self.toBombUid)
      print_battle("buff 生效，buffId:", self.id, " 挂载炸弹:", self.toBombUid, " buffUid:", self.uid)
    end
    if settleUnit then
      if self.deduceType == BUFF_DEDUCE_TYPE.CAMP_TRIGGER_TIME_PAUSE_COUNT then
        local campObject = BattleScene.GetCampObject(settleUnit.camp)
        if campObject then
          if 0 == campObject.triggerTimePauseCount % self.buffConfig.deduce_value then
          else
            return
          end
        else
          return
        end
      elseif self.deduceType == BUFF_DEDUCE_TYPE.HP_LOSS_PER then
        local totalLossPer = MathUtil.TruncateFloat(10000 * settleUnit.totalHurt / settleUnit:GetAttr(ATTR_ENUM.max_hp))
        local needLossPer = self.buffConfig.deduce_value * (self.deduceCount + 1)
        if totalLossPer < needLossPer then
          print_battle("buff生效条件不满足(累计损失血量)：", self.deduceType, totalLossPer, needLossPer)
          return
        end
      elseif self.deduceType == BUFF_DEDUCE_TYPE.SHIELD_ADD then
        local totalShieldGot = settleUnit.totalShieldGot
        local needShieldGot = self.buffConfig.deduce_value * (self.deduceCount + 1)
        if totalShieldGot < needShieldGot then
          print_battle("buff生效条件不满足(累计获得护盾值)：", self.deduceType, totalShieldGot, needShieldGot)
          return
        end
      end
      local available = true
      if (settleUnit.isStun or settleUnit.isFreeze or settleUnit.isPetrified or settleUnit.isTimePause) and self.triggerFromBuffUid then
        local fromBuff = BattleBuffMgr.savedBuffList[self.triggerFromBuffUid]
        if fromBuff and true == fromBuff:ContainEffectId(BUFF_EFFECT_ID.PERSIST_CAST) then
          print_battle("buff暂停生效", self.id, "buff释放者状态，眩晕", settleUnit.isStun, "冰冻", settleUnit.isFreeze, "石化", settleUnit.isPetrified, "时停", settleUnit.isTimePause)
          available = false
        end
      end
      if true == available then
        if 1 == self.activeForever then
          local hpValue = self:DealActiveForeverEffect(settleUnit, nil, nil, param)
          if self:ContainEffectId(BUFF_EFFECT_ID.TRANS_HP_TO_SUMMON_FROM) then
            local summonUnitUid = settleUnit.summonFromUnit
            if summonUnitUid then
              local summonFromUnit = BattleScene.GetUnitByUid(summonUnitUid)
              if summonFromUnit and BattleBuffMgr.IsUnitUntreatable(summonFromUnit) == false then
                local realNum = BattleAction.DealHurt(settleUnit, summonFromUnit, -hpValue)
              end
            end
          end
        else
          if true == self:ContainEffectId(BUFF_EFFECT_ID.BEAT_BACK) then
            local fromUnit = BattleScene.GetUnitByUid(self.lastBuffToUnitUid or self.fromUnitUid)
            BattleAction.InitBeatBackUnitData(settleUnit, fromUnit, self.buffConfig)
            BattleAction.ForceChangeState(settleUnit, BATTLE_STATE_ENUM.BEAT_BACK, true)
          elseif true == self:ContainEffectId(BUFF_EFFECT_ID.DEVOUR) then
            local fromUnit = BattleScene.GetUnitByUid(self.lastBuffToUnitUid or self.fromUnitUid)
            BattleAction.InitDevourUnitData(settleUnit, fromUnit, self.buffConfig)
            BattleAction.ForceChangeState(settleUnit, BATTLE_STATE_ENUM.DEVOUR, true)
          elseif true == self:ContainEffectId(BUFF_EFFECT_ID.PORTAL) then
            BattleAction.DealPortal(settleUnit)
          end
          if true == self:ContainEffectId(BUFF_EFFECT_ID.SMALL_SKILL_TRIGGER_MAX) then
            local value = self:GetEffectTotalValue(BUFF_EFFECT_ID.SMALL_SKILL_TRIGGER_MAX)
            settleUnit.smallSkillTriggerMaxChange = settleUnit.smallSkillTriggerMaxChange + value
          end
          if true == self:ContainEffectId(BUFF_EFFECT_ID.BURST_CD) then
            local value = self:GetEffectTotalValue(BUFF_EFFECT_ID.BURST_CD)
            settleUnit.burstSkillCD = settleUnit.burstSkillCD + value
          end
        end
        self:DealFireJump(settleUnit)
      end
      if self.deduceEffectPath then
        local uid = self.lastBuffToUnitUid or self.fromUnitUid
        local fromUnit
        if uid then
          fromUnit = BattleScene.GetUnitByUid(self.lastBuffToUnitUid or self.fromUnitUid)
        end
        BattleActionDisplay.AddWaitDealEffect(fromUnit, settleUnit, self.deduceEffectPath, EffectUtil.GetFullPath(self.deduceEffectPath), true, self.deduceEffectBindSlot)
      end
      if settleUnit.isBuilding and settleUnit.effectModel then
        SkillEffectsHelper.PlaySkill(settleUnit.effectModel)
      end
      if self:ContainPersistentDamage() then
        BattleBuffMgr.TriggerUnitListener(settleUnit, BUFF_DEDUCE_TYPE.DEDUCED_DOT)
      end
    elseif settleBullet then
      self:DealActiveForeverEffect(nil, settleBullet)
      self:DealFireJump(nil, settleBullet)
    elseif settleBomb then
      self:DealActiveForeverEffect(nil, nil, settleBomb)
    end
    if settleUnit then
      local effectIdSummon = BUFF_EFFECT_ID.SUMMON
      if self:ContainEffectId(effectIdSummon) then
        local effectList = self.effectList
        local v
        for i = 1, #effectList do
          v = effectList[i]
          if v.effectId == effectIdSummon then
            self:DealSummon(v)
          end
        end
      end
      self:TriggerUnitAttrChanged(settleUnit)
      if self.fromUnitUid and true == self:ContainEffectId(BUFF_EFFECT_ID.FORCE_CHANGE_ATTACK_TARGET) then
        local fromUnit = BattleScene.GetUnitByUid(self.fromUnitUid)
        settleUnit:ForceChangeAttackTarget(fromUnit)
      end
    end
    if param and param.deduceCount then
      self.deduceCount = self.deduceCount + param.deduceCount
    else
      self.deduceCount = self.deduceCount + 1
    end
    self.lastDeduceFrame = BattleControl.curFixedFrame
    if settleUnit and settleUnit.camp == BATTLE_CAMP_FLAG.RIGHT then
      BattleBuffMgr.TriggerListenerBuffAdd(BUFF_DEDUCE_TYPE.RIGHT_EFFECT_DEDUCE, {
        triggerByDeduceBuffUid = self.uid
      })
    end
    local deduceAsSkillId = self.buffConfig.deduce_as_skill_id
    if self.fromUnitUid and deduceAsSkillId then
      local fromUnit = BattleScene.GetUnitByUid(self.fromUnitUid)
      if fromUnit then
        local skillConfig = TableData.GetConfig(deduceAsSkillId, "BaseSkill")
        local curSkill = {
          id = deduceAsSkillId,
          type = skillConfig.type,
          isTrigger = true,
          triggerFromBuff = true
        }
        fromUnit:SaveTriggerSkill(curSkill)
      end
    end
    if self.deduceSound then
      local soundPathConfig = TableData.GetConfig(self.deduceSound, "BaseSoundPath")
      if soundPathConfig then
        BattleActionDisplay.AddWaitDealSound(soundPathConfig.path, soundPathConfig.bank, settleUnit and (settleUnit.model or settleUnit.effectModel))
      end
    end
    local deduceBuffList = self.buffConfig.deduce_buff_list
    if deduceBuffList and #deduceBuffList > 0 then
      if self.deduceType == BUFF_DEDUCE_TYPE.TREAT_PARTNER and param and param.treatUnitUid then
        BattleBuffMgr.AnalysisBuffList(deduceBuffList, self.from, {
          {
            unitUid = param.treatUnitUid
          }
        }, true, {
          triggerFromBuffUid = self.uid,
          overlayNum = param and param.deduceCount,
          treatNum = param and param.treatNum
        })
      elseif (self.deduceType == BUFF_DEDUCE_TYPE.HURT_BY_ANYONE or self.deduceType == BUFF_DEDUCE_TYPE.HIT_BY_ENEMY) and param and param.hurtFromUnitUid then
        BattleBuffMgr.AnalysisBuffList(deduceBuffList, self.from, {
          {
            unitUid = param.hurtFromUnitUid
          }
        }, true, {
          triggerFromBuffUid = self.uid,
          overlayNum = param and param.deduceCount
        })
      else
        local unitUid
        if settleBullet then
          unitUid = settleBullet.targetUid
        elseif settleBomb then
          unitUid = settleBomb.targetUid
        end
        BattleBuffMgr.AnalysisBuffList(deduceBuffList, self.from, {
          unitUid and {unitUid = unitUid} or self.to
        }, true, {
          triggerFromBuffUid = self.uid,
          overlayNum = param and param.deduceCount,
          targetUnitList = param and param.targetUnitList
        })
      end
    end
    if self:NeedRemove() then
      self:Remove()
      if settleUnit then
        local buildingType = settleUnit.buildingType
        if buildingType == BATTLE_BUILDING_TYPE.TRAP_TRIGGER then
          settleUnit.waitFrameDying = BATTLE_CONFIG_ENUM.DEFAULT_DYING_FRAMES
          settleUnit:SetStateToDead()
        end
        if true == self:ContainEffectId(BUFF_EFFECT_ID.UNYIELDING) then
          settleUnit:SetAttr(ATTR_ENUM.hp, 0)
        end
      end
      return true
    else
      if 1 == self.buffConfig.deduce_update_effect then
        self:UpdateEffectValue()
      end
      if settleUnit and self.deduceType == BUFF_DEDUCE_TYPE.SHIELD_ADD then
        local totalShieldGot = settleUnit.totalShieldGot
        local needShieldGot = self.buffConfig.deduce_value * (self.deduceCount + 1)
        if totalShieldGot >= needShieldGot then
          self:Deduce(param)
        end
      end
    end
  end
  
  function buff:DealActiveForeverEffect(settleUnit, settleBullet, settleBomb, param)
    local hpValue = self:GetAttributeValue(ATTR_ID.HP)
    if self.fromUnitUid and self:ContainPersistentDamage() == true then
      local fromUnit = BattleScene.GetUnitByUid(self.fromUnitUid)
      local value = fromUnit:GetEffectTotalValue(BUFF_EFFECT_ID.DOT_HURT_ADD_PER_REALTIME)
      if 0 ~= value then
        hpValue = math.ceil(hpValue * (10000 + value) / 10000)
      end
    end
    local rageValue = self:GetAttributeValue(ATTR_ID.RAGE)
    if settleUnit then
      print_battle("buff 生效，触发属性的永久变化 buffId:", self.id, " 挂载方:", self.toUnitUid, hpValue, rageValue)
    elseif settleBullet then
      print_battle("buff 生效，触发属性的永久变化 buffId:", self.id, " 挂载子弹，攻击目标:", settleBullet.targetUid, hpValue, rageValue)
    elseif settleBomb then
      print_battle("buff 生效，触发属性的永久变化 buffId:", self.id, " 挂载炸弹，攻击目标:", settleBomb.targetUid, hpValue, rageValue)
    end
    if true == self:ContainEffectId(BUFF_EFFECT_ID.FIRE_JUMP) then
      hpValue = hpValue * math.ceil(2 ^ self.deduceCount)
    end
    local unit = settleUnit
    if settleBullet then
      unit = BattleScene.GetUnitByUid(settleBullet.targetUid)
    elseif settleBomb then
      unit = BattleScene.GetUnitByUid(settleBomb.targetUid)
    end
    if unit and 0 ~= hpValue then
      local fromUnit
      if self.fromUnitUid then
        fromUnit = BattleScene.GetUnitByUid(self.fromUnitUid)
      end
      if hpValue > 0 and fromUnit and fromUnit.camp ~= unit.camp then
        local finalDamageAddPer = 0
        local isContain, effectList = BattleBuffMgr.GetContainedEffect(fromUnit, BUFF_EFFECT_ID.FINAL_DAMAGE_ADD_PER)
        if isContain then
          for _, v in ipairs(effectList) do
            finalDamageAddPer = finalDamageAddPer + v.finalValue
          end
        end
        isContain, effectList = BattleBuffMgr.GetContainedEffect(fromUnit, BUFF_EFFECT_ID.FINAL_DAMAGE_REDUCE_PER)
        if isContain then
          for _, v in ipairs(effectList) do
            finalDamageAddPer = finalDamageAddPer - v.finalValue
          end
        end
        if 0 ~= finalDamageAddPer then
          hpValue = math.ceil(MathUtil.TruncateFloat(hpValue * (10000 + finalDamageAddPer) / 10000))
          print_battle("buff 最终伤害加成：", finalDamageAddPer)
        end
      end
      local hurtExtraParams = {}
      local isVampire = false
      if true == self:ContainEffectId(BUFF_EFFECT_ID.GOD_DAMAGE) then
        print_battle("神圣伤害", self.id, hpValue)
        hurtExtraParams.isGodHurt = true
      elseif true == self:ContainEffectId(BUFF_EFFECT_ID.VAMPIRE) then
        print_battle("吸收生命", self.id, hpValue)
        hurtExtraParams.isVampire = true
        isVampire = true
      elseif true == self:ContainEffectId(BUFF_EFFECT_ID.HALLUCINATION) then
        print_battle("致幻气体 造成伤害", self.id, hpValue, param.hpAdd)
        hpValue = hpValue * param.hpAdd
        hurtExtraParams.isVampire = true
        isVampire = true
      else
        local buffEffectParams = BattleDataCount.DealBuffEffect(nil, unit, hpValue, nil, true, nil, nil, nil, {
          buffUid = self.uid
        })
        hpValue = buffEffectParams.hurt
        local absorbHurt = buffEffectParams.absorbHurt
        if 0 ~= absorbHurt then
          hurtExtraParams.absorbHurt = absorbHurt
        end
        hurtExtraParams.isInvincible = buffEffectParams.invincible
      end
      if true == self:ContainEffectId(BUFF_EFFECT_ID.REVIVE) then
        unit:SetAttr(ATTR_ENUM.hp, 0)
        unit:SetStateToRevive(self.buffConfig.delay_frame_revive, self.fromUnitUid)
        print_battle("准备复活")
      end
      if unit:CanTargetChosen() == false and false == unit:IsRevive() then
      else
        if 0 == hpValue then
          hurtExtraParams.notDisplay = true
        else
          hurtExtraParams.notDisplay = 1 == self.buffConfig.not_display
        end
        local realNum = BattleAction.DealHurt(fromUnit, unit, hpValue, HURT_NUM_ENUM.BUFF_HURT, hurtExtraParams)
        local absorbHurt = hurtExtraParams.absorbHurt or 0
        if fromUnit then
          if 1 ~= self.buffConfig.not_included_in_statistics then
            fromUnit:SaveSkillDamageForTestBalance(realNum + absorbHurt)
            fromUnit:SaveDamage(realNum + absorbHurt)
          end
          if true == isVampire then
            local realHpAdd = BattleAction.DealHurt(nil, fromUnit, -realNum)
            if 1 ~= self.buffConfig.not_included_in_statistics then
              fromUnit:SaveSkillDamageForTestBalance(realHpAdd)
              fromUnit:SaveDamage(realHpAdd)
            end
            print_battle("buff 吸收生命，吸收量：", -realNum, "实际增加量：", realHpAdd, "血量增加单位：", self.fromUnitUid)
          end
        end
        if 1 ~= self.buffConfig.not_included_in_statistics then
          unit:SaveDamaged(realNum + absorbHurt, fromUnit and fromUnit.uid ~= unit.uid)
        end
        if fromUnit then
          if fromUnit.camp == unit.enemyCamp then
            BattleBuffMgr.TriggerUnitListener(unit, BUFF_DEDUCE_TYPE.HURT_BY_ENEMY)
          end
          if false == fromUnit.isBuilding and fromUnit.uid ~= unit.uid then
            BattleBuffMgr.TriggerUnitListener(unit, BUFF_DEDUCE_TYPE.HURT_BY_ANYONE, nil, {
              hurtFromUnitUid = fromUnit.uid
            })
          end
          if hpValue >= 0 and fromUnit.camp == unit.enemyCamp then
            BattleBuffMgr.TriggerUnitListener(unit, BUFF_DEDUCE_TYPE.HIT_BY_ENEMY, nil, {
              hurtFromUnitUid = fromUnit.uid
            })
          end
        end
        print_battle("buff 生效改变血量：", hpValue, "buffId：", self.id, unit.id)
        if self.fromManuallySkillId and self.fromSkillCamp then
          if hpValue > 0 then
            if self.fromSkillCamp ~= unit.camp then
              local manuallySkill = BattleScene.GetManuallySkill(self.fromManuallySkillId, self.fromSkillCamp)
              if manuallySkill then
                manuallySkill:SaveDamage(hpValue)
              end
            end
          elseif hpValue < 0 and self.fromSkillCamp == unit.camp then
            local manuallySkill = BattleScene.GetManuallySkill(self.fromManuallySkillId, self.fromSkillCamp)
            if manuallySkill then
              manuallySkill:SaveDamage(hpValue)
            end
          end
        end
        if unit.model and true == self:ContainEffectId(BUFF_EFFECT_ID.TRAP_DISPLAY_10101) then
          SkeletonAnimationUtil.SetAnimation(unit.model, 1, SPINE_STATE_ENUM.HIT, false, 0.25, function()
            SkeletonAnimationUtil.StopTrackIndex(unit.model, 1)
          end)
        end
      end
    end
    if not (0 ~= rageValue and unit.haveRage) or unit:CanTargetChosen() == false and false == unit:IsRevive() then
    else
      print_battle("buff 生效改变怒气：", rageValue, "buffId：", self.id)
      BattleAction.DealRageChange(unit, rageValue)
    end
    return hpValue
  end
  
  function buff:DealFireJump(settleUnit, settleBullet)
    if self:ContainEffectId(BUFF_EFFECT_ID.FIRE_JUMP) == true then
      local fromUnit = settleUnit
      if settleBullet then
        fromUnit = BattleScene.GetUnitByUid(settleBullet.targetUid)
      end
      local nextTargetList = BattleChoose.GetNearestUnit(fromUnit, true, nil, 1, nil, true)
      if #nextTargetList > 0 then
        local targetUnit = nextTargetList[1]
        local dis = fromUnit.cachedDistance[targetUnit.uid]
        local config = TableData.GetConfig(42810001, "BaseSkillShowDisplay")
        if dis > config.max_distance then
          return
        end
        local settle = settleUnit or settleBullet
        settle:RemoveBuff(self.uid)
        print("点燃 弹射", self.id, "转递给下一个目标", targetUnit.uid)
        local bullet = BattleBullet.NewBullet(config, fromUnit, targetUnit, nil, nil, nil, nil, config.bullet_speed, {startPointName = "hit"})
        BattleScene.AddBullet(bullet)
        self.toUnitUid = nil
        self.toBulletUid = bullet.uid
        bullet:AddBuff(self.uid)
        BattleBuffMgr.RefreshRegisterDeduceListener(self)
        if settleUnit then
          BattleBuffMgr.DealBulletFinalDamageAdd(settleUnit, nil, bullet)
        elseif settleBullet then
          BattleBuffMgr.DealBulletFinalDamageAdd(nil, settleBullet, bullet)
        end
      end
    end
  end
  
  function buff:DealSummon(effect)
    local summonId = effect.effectCalValue
    local fromUnit = BattleScene.GetUnitByUid(self.fromUnitUid)
    local settleUnit = BattleScene.GetUnitByUid(self.toUnitUid)
    local summonConfig = TableData.GetConfig(summonId, "BaseSkillSummon")
    local scale = 1
    if settleUnit.camp == BATTLE_CAMP_FLAG.RIGHT then
      scale = -1
    end
    local x = settleUnit.position.x
    local y = 0
    local z = settleUnit.position.z
    local posConfig = summonConfig.pos
    if posConfig then
      local posType = posConfig[1]
      if 1 == posType then
        x = x + scale * MathUtil.TruncateFloat(posConfig[2] / BattleScene.pixelsPerUnit)
        z = z + MathUtil.TruncateFloat(posConfig[3] / BattleScene.pixelsPerUnit)
      elseif 2 == posType then
        local r = MathUtil.TruncateFloat(posConfig[2] / BattleScene.pixelsPerUnit)
        local rand = math.rad(BattleData.GetRandomSeed() * 360 / 10000)
        x = x + scale * math.cos(rand) * r
        z = z + math.sin(rand) * r
      elseif 3 == posType then
        local r = MathUtil.TruncateFloat(posConfig[2] / BattleScene.pixelsPerUnit)
        local rand = math.rad(BattleData.GetRandomSeed() * 360 / 10000)
        local offX = scale * math.cos(rand) * r
        if settleUnit.camp == BATTLE_CAMP_FLAG.LEFT then
          if offX < 0 then
            offX = -offX
          end
        elseif settleUnit.camp == BATTLE_CAMP_FLAG.RIGHT and offX > 0 then
          offX = -offX
        end
        x = x + offX
        z = z + math.sin(rand) * r
      end
    end
    local param = {
      summonId = summonId,
      camp = fromUnit.camp,
      position = {
        x = x,
        y = y,
        z = z
      },
      state = BATTLE_STATE_ENUM.START,
      summonFromUnit = self.fromUnitUid,
      buffParams = {
        fromUnitUid = self.fromUnitUid,
        toUnitUid = self.toUnitUid
      }
    }
    print_battle("处理buff召唤")
    BattleAction.DealSummon(param, true)
  end
  
  function buff:ContainEffectId(effectId)
    if self.curState == BUFF_STATE_ENUM.SETTLED then
      return self.containEffect[effectId] or false
    else
      return self:ContainEffectIdBeforeSettle(effectId)
    end
  end
  
  function buff:GetEffectListById(effectId)
    if self:ContainEffectId(effectId) == false then
      return {}
    end
    local list = {}
    local effectList = self.effectList
    local v
    for i = 1, #effectList do
      v = effectList[i]
      if v.effectId == effectId then
        list[#list + 1] = v
      end
    end
    return list
  end
  
  function buff:GetEffectTotalValue(effectId)
    if self:ContainEffectId(effectId) == false then
      return
    end
    local effectList = self.effectList
    local v
    local totalValue = 0
    for i = 1, #effectList do
      v = effectList[i]
      if v.effectId == effectId then
        totalValue = totalValue + v.finalValue
      end
    end
    return totalValue
  end
  
  function buff:GetAttributeValue(attributeId)
    if self:ContainAttributeId(attributeId) ~= true then
      return 0, 0
    end
    local value = 0
    local valueMax = 0
    local v
    for i = 1, #self.effectList do
      v = self.effectList[i]
      if v.attributeId == attributeId and v:IsValidAttributeEffect() then
        value = value + v.finalValue
        if attributeId == ATTR_ID.TENACITY then
          valueMax = valueMax + v.tenacityMax
        elseif attributeId == ATTR_ID.SHIELD_SPECIAL then
          valueMax = valueMax + v.shieldSpecialMax
        end
      end
    end
    return value, valueMax
  end
  
  function buff:ContainEffectTag(tag)
    if self.curState == BUFF_STATE_ENUM.SETTLED then
      return 1 == self.effectTagList[tag]
    end
    return self:ContainEffectTagBeforeSettle(tag)
  end
  
  function buff:ContainPersistentDamage()
    return 1 == self.effectTagList[BUFF_EFFECT_TAG.PERSIST_DAMAGE]
  end
  
  function buff:ContainControl()
    return 1 == self.effectTagList[BUFF_EFFECT_TAG.CONTROL]
  end
  
  function buff:ContainAttributeId(attributeId)
    return 1 == self.containAttributeIdMap[attributeId]
  end
  
  function buff:GetAllAttributeValue()
    local valueList = {}
    for attributeId, contain in pairs(self.containAttributeIdMap) do
      if 1 == contain then
        valueList[attributeId] = self:GetAttributeValue(attributeId)
      end
    end
    return valueList
  end
  
  function buff:UpdateDeduceValue(value)
    if self.deduceType == BUFF_DEDUCE_TYPE.PER_TIME then
      local newDeducePerFrames = math.ceil(self.deducePerFrames + value * BATTLE_CONFIG_ENUM.FIXED_FPS)
      if self.deduceMaxCount and self.deduceMaxCount >= 0 then
        if value > 0 then
          self.remainFrames = (self.deduceMaxCount - self.deduceCount - 1) * newDeducePerFrames + (newDeducePerFrames - (BattleControl.curFixedFrame - self.lastDeduceFrame))
        elseif value < 0 then
          if newDeducePerFrames + self.lastDeduceFrame <= BattleControl.curFixedFrame then
            self.remainFrames = (self.deduceMaxCount - self.deduceCount - 1) * newDeducePerFrames
          else
            self.remainFrames = (self.deduceMaxCount - self.deduceCount - 1) * newDeducePerFrames + (newDeducePerFrames - (BattleControl.curFixedFrame - self.lastDeduceFrame))
          end
        end
        self.remainMaxFrames = newDeducePerFrames * self.deduceMaxCount
      end
      self.deducePerFrames = newDeducePerFrames
    elseif self.deduceType == BUFF_DEDUCE_TYPE.PER_FRAME then
      local newDeducePerFrames = self.deducePerFrames + value
      if self.deduceMaxCount and self.deduceMaxCount >= 0 then
        if value > 0 then
          self.remainFrames = (self.deduceMaxCount - self.deduceCount - 1) * newDeducePerFrames + (newDeducePerFrames - (BattleControl.curFixedFrame - self.lastDeduceFrame))
        elseif value < 0 then
          if newDeducePerFrames + self.lastDeduceFrame <= BattleControl.curFixedFrame then
            self.remainFrames = (self.deduceMaxCount - self.deduceCount - 1) * newDeducePerFrames
          else
            self.remainFrames = (self.deduceMaxCount - self.deduceCount - 1) * newDeducePerFrames + (newDeducePerFrames - (BattleControl.curFixedFrame - self.lastDeduceFrame))
          end
        end
        self.remainMaxFrames = newDeducePerFrames * self.deduceMaxCount
      end
      self.deducePerFrames = newDeducePerFrames
    end
  end
  
  function buff:DealClean(settleUnit, settleCamp)
    local isClean = false
    local cleanCount = 0
    local cleanBuffGroup = self.buffConfig.clean_buff_group
    local cleanLimit = self.buffConfig.clean_buff_num
    if cleanBuffGroup and #cleanBuffGroup > 0 then
      local oneGroup, type, value, num, buffTable, buffGroup
      for i = 1, #cleanBuffGroup do
        buffGroup = cleanBuffGroup[i]
        oneGroup = Split(buffGroup, ":")
        type = tonumber(oneGroup[1])
        value = tonumber(oneGroup[2])
        if 1 == type then
          if settleUnit then
            num, buffTable = BattleBuffMgr.GetSettledBuffByUnitAndId(settleUnit, value, function(array)
              table.sort(array, function(a, b)
                return a.uid > b.uid
              end)
            end)
          elseif settleCamp then
            num, buffTable = BattleBuffMgr.GetSettledBuffByCampAndId(settleCamp, value, function(array)
              table.sort(array, function(a, b)
                return a.uid > b.uid
              end)
            end)
          end
        elseif 2 == type then
          if settleUnit then
            num, buffTable = BattleBuffMgr.GetSettledBuffByUnitAndType(settleUnit, value, function(array)
              table.sort(array, function(a, b)
                return a.uid > b.uid
              end)
            end)
          elseif settleCamp then
            num, buffTable = BattleBuffMgr.GetSettledBuffByCampAndType(settleCamp, value, function(array)
              table.sort(array, function(a, b)
                return a.uid > b.uid
              end)
            end)
          end
        elseif 3 == type then
          if settleUnit then
            num, buffTable = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(settleUnit, value, function(array)
              table.sort(array, function(a, b)
                return a.uid > b.uid
              end)
            end)
          elseif settleCamp then
            num, buffTable = BattleBuffMgr.GetSettledBuffByCampAndEffectID(settleCamp, value, function(array)
              table.sort(array, function(a, b)
                return a.uid > b.uid
              end)
            end)
          end
        elseif 101 == type then
          if settleUnit then
            num, buffTable = BattleBuffMgr.GetSettledBuffByUnitAndEffectTag(settleUnit, value, function(array)
              table.sort(array, function(a, b)
                return a.uid > b.uid
              end)
            end)
          elseif settleCamp then
            num, buffTable = BattleBuffMgr.GetSettledBuffByCampAndEffectTag(settleCamp, value, function(array)
              table.sort(array, function(a, b)
                return a.uid > b.uid
              end)
            end)
          end
        end
        local cleanBuff
        for j = 1, #buffTable do
          cleanBuff = buffTable[j]
          if cleanBuff.overlayNum then
            if cleanLimit and cleanLimit > 0 then
              isClean = true
              cleanCount = cleanCount + math.min(cleanLimit, cleanBuff.overlayNum)
              cleanBuff.overlayNum = cleanBuff.overlayNum - cleanLimit
            else
              isClean = true
              cleanCount = cleanCount + cleanBuff.overlayNum
              cleanBuff.overlayNum = 0
            end
            if cleanBuff.overlayNum <= 0 then
              cleanBuff:Remove()
            else
              cleanBuff:UpdateEffectValue()
            end
          else
            cleanBuff:Remove()
            isClean = true
            cleanCount = cleanCount + 1
          end
          if cleanLimit and cleanLimit <= cleanCount then
            return isClean, cleanCount
          end
        end
      end
    end
    return isClean, cleanCount
  end
  
  function buff:UpdateEffectValue()
    for i = 1, #self.effectList do
      self.effectList[i]:UpdateValue()
    end
    local settleUnit = BattleScene.GetUnitByUid(self.toUnitUid)
    if settleUnit then
      self:TriggerUnitAttrChanged(settleUnit, true)
      self:TriggerUnitShieldGot(settleUnit)
      if self.needShowBuffIcon then
        settleUnit.buffRefreshCurFrame = true
      end
    end
  end
  
  function buff:Reset()
    if 1 == self.buffConfig.reset_last_deduce_time then
      self.lastDeduceFrame = BattleControl.curFixedFrame
    end
    self.deduceCount = 0
    if self.remainMaxFrames then
      self.remainFrames = self.remainMaxFrames - (BattleControl.curFixedFrame - self.lastDeduceFrame)
    end
    self:UpdateEffectValue()
    if self:ContainPersistentDamage() then
      BattleBuffMgr.TriggerUnitListener(settleUnit, BUFF_DEDUCE_TYPE.SETTLED_DOT)
    end
  end
  
  function buff:TriggerRemove(params)
    if self.removeType == BUFF_REMOVE_TYPE.UNIT_FROM_DEAD and params.unitDead and params.unitDead.uid == self.fromUnitUid then
      self:Remove()
    end
  end
  
  function buff:Remove(isClear)
    if self.id == nil then
      return
    end
    if true ~= isClear then
      if self.toUnitUid then
        print_battle("buff 移除，buffId:", self.id, " 挂载方:", self.toUnitUid, " buffUid:", self.uid)
      elseif self.toBulletUid then
        print_battle("buff 移除，buffId:", self.id, " 挂载子弹:", self.toBulletUid, " buffUid:", self.uid)
      elseif self.toBombUid then
        print_battle("buff 移除，buffId:", self.id, " 挂载炸弹:", self.toBombUid, " buffUid:", self.uid)
      end
      if self.curState == BUFF_STATE_ENUM.TEMP then
        BattleBuffMgr.UnRegisterSettleListener(self.uid, self.settleType)
      elseif self.curState == BUFF_STATE_ENUM.SETTLED then
        BattleBuffMgr.UnRegisterDeduceListener(self.uid, self.deduceType)
        BattleBuffMgr.UnRegisterRemoveListener(self.uid, self.removeType)
        if true == self:ContainEffectId(BUFF_EFFECT_ID.CHANGE_BURST_ENERGY_ADD) and self.toCamp then
          local burst = BattleScene.GetBurst(self.toCamp)
          if burst then
            burst:ChangeEnergyAdd(-self:GetEffectTotalValue(BUFF_EFFECT_ID.CHANGE_BURST_ENERGY_ADD))
          end
        end
      end
      if self.curState == BUFF_STATE_ENUM.SETTLED and self.toUnitUid then
        local settleUnit = BattleScene.GetUnitByUid(self.toUnitUid)
        if settleUnit then
          settleUnit:RemoveBuff(self.uid, self.needShowBuffIcon)
          if BattleMgr.isBattleServer == false then
            if self.settleEffectPath then
              settleUnit:RemoveEffect(self.settleEffectPath)
            end
            BattleAction.DealBuffRemove(settleUnit, self)
          end
          if true == self:ContainEffectId(BUFF_EFFECT_ID.CHANGE_BUFF_DEDUCE_VALUE) then
            local effectList = self:GetEffectListById(BUFF_EFFECT_ID.CHANGE_BUFF_DEDUCE_VALUE)
            if effectList[1] then
              local changeBuffId = effectList[1].effectCommonParam
              if changeBuffId then
                settleUnit:UpdateBuffDeduceValue(changeBuffId, -effectList[1].finalValue)
              end
            end
          end
          self:TriggerUnitAttrChanged(settleUnit, true)
          local buffStateCheck = {
            {
              id = BUFF_EFFECT_ID.STUN,
              id2 = BUFF_EFFECT_ID.BOSS_STUN,
              callBack = function()
                settleUnit:SetStun(false)
              end
            },
            {
              id = BUFF_EFFECT_ID.SILENT,
              callBack = function()
                settleUnit:SetSilent(false)
              end
            },
            {
              id = BUFF_EFFECT_ID.FREEZE,
              callBack = function()
                settleUnit:SetFreeze(false)
              end,
              updateControlDisplay = true
            },
            {
              id = BUFF_EFFECT_ID.STEALTH,
              callBack = function()
                settleUnit:SetStealth(false)
              end,
              updateControlDisplay = true
            },
            {
              id = BUFF_EFFECT_ID.TIME_PAUSE,
              callBack = function()
                settleUnit:SetTimePause(false)
              end
            },
            {
              id = BUFF_EFFECT_ID.PETRIFIED,
              callBack = function()
                settleUnit:SetPetrified(false)
              end,
              updateControlDisplay = true
            },
            {
              id = BUFF_EFFECT_ID.ATTRACT,
              callBack = function()
                settleUnit:SetBeAttractedUid(nil)
              end
            },
            {
              id = BUFF_EFFECT_ID.CHARM,
              callBack = function()
                settleUnit:SetCharm(false)
              end
            },
            {
              id = BUFF_EFFECT_ID.PERSIST_CAST,
              callBack = function()
                settleUnit:SetPersistCast(false)
              end
            },
            {
              id = BUFF_EFFECT_ID.TRICK,
              callBack = function()
                settleUnit:SetTrick(false)
              end
            },
            {
              id = BUFF_EFFECT_ID.UNABLE_TO_SELECT,
              callBack = function()
                settleUnit:SetUnableToSelect(false)
              end
            },
            {
              id = BUFF_EFFECT_ID.GHOST,
              callBack = function()
                settleUnit:SetGhost(false)
              end
            },
            {
              id = BUFF_EFFECT_ID.DEFENSE,
              callBack = function()
                settleUnit:SetDefense(false)
              end
            },
            {
              id = BUFF_EFFECT_ID.BLIND,
              callBack = function()
                settleUnit:SetBlind(false)
              end
            },
            {
              id = BUFF_EFFECT_ID.FEAR,
              callBack = function()
                settleUnit:SetFear(false, self)
              end
            }
          }
          local enable = false
          local effectId, effectId2, callBack, v
          for i = 1, #buffStateCheck do
            v = buffStateCheck[i]
            effectId = v.id
            effectId2 = v.id2
            callBack = v.callBack
            if effectId2 then
              if (true == self:ContainEffectId(effectId) or true == self:ContainEffectId(effectId2)) and BattleBuffMgr.ContainEffectId(settleUnit, effectId) == false and BattleBuffMgr.ContainEffectId(settleUnit, effectId2) == false then
                callBack()
                if v.updateControlDisplay then
                  enable = true
                end
              end
            elseif true == self:ContainEffectId(effectId) and BattleBuffMgr.ContainEffectId(settleUnit, effectId) == false then
              callBack()
              if v.updateControlDisplay then
                enable = true
              end
            end
          end
          if BattleMgr.isBattleServer == false then
            local persistEffect = {
              {
                id = BUFF_EFFECT_ID.PERSIST_BURN,
                motionId = BATTLE_MOTION_STATE_ENUM.PERSIST_BURN
              },
              {
                id = BUFF_EFFECT_ID.PERSIST_WATER,
                motionId = BATTLE_MOTION_STATE_ENUM.PERSIST_WATER
              },
              {
                id = BUFF_EFFECT_ID.PERSIST_ICE,
                motionId = BATTLE_MOTION_STATE_ENUM.PERSIST_ICE
              },
              {
                id = BUFF_EFFECT_ID.PERSIST_LIGHT,
                motionId = BATTLE_MOTION_STATE_ENUM.PERSIST_LIGHT
              },
              {
                id = BUFF_EFFECT_ID.PERSIST_DARK,
                motionId = BATTLE_MOTION_STATE_ENUM.PERSIST_DARK
              },
              {
                id = BUFF_EFFECT_ID.PERSIST_WOOD,
                motionId = BATTLE_MOTION_STATE_ENUM.PERSIST_WOOD
              }
            }
            for _, eff in ipairs(persistEffect) do
              if true == self:ContainEffectId(eff.id) and BattleBuffMgr.ContainEffectId(settleUnit, eff.id) == false then
                settleUnit:RemoveMotionState(eff.motionId)
              end
            end
          end
          if enable then
            BattleActionDisplay.UpdateControlDisplay(settleUnit)
          end
          if true == self.destroyUnitWhenRemove then
            settleUnit.needDestroy = true
          end
          if self:ContainPersistentDamage() and false == settleUnit:ContainPersistentDamage() then
            BattleBuffMgr.TriggerUnitListener(settleUnit, BUFF_DEDUCE_TYPE.ALL_DOT_REMOVE)
          end
          if self:ContainControl() and false == settleUnit:ContainControl() then
            BattleBuffMgr.TriggerUnitListener(settleUnit, BUFF_DEDUCE_TYPE.ALL_CONTROL_REMOVE)
          end
          if true == self:ContainEffectTag(BUFF_EFFECT_TAG.DEFENSE_REDUCE) and false == settleUnit:ContainBuffEffectTag(BUFF_EFFECT_TAG.DEFENSE_REDUCE) then
            BattleBuffMgr.TriggerUnitListener(settleUnit, BUFF_DEDUCE_TYPE.ALL_DEFENSE_REDUCE_REMOVE)
          end
        end
      elseif self.toBulletUid then
        local settleBullet = BattleScene.GetBulletByUid(self.toBulletUid)
        if settleBullet then
          settleBullet:RemoveBuff(self.uid)
        end
      elseif self.toBombUid then
        local settleBomb = BattleScene.GetBombByUid(self.toBombUid)
        if settleBomb then
          settleBomb:RemoveBuff(self.uid)
        end
      elseif self.toCamp then
        local settleCamp = BattleScene.GetCampObject(self.toCamp)
        if settleCamp then
          settleCamp:RemoveBuff(self.uid)
        end
      end
      self:SetState(BUFF_STATE_ENUM.REMOVE)
      BattleBuffMgr.RemoveFromBuffList(self.uid)
    end
    self:Destroy()
  end
  
  function buff:TriggerUnitAttrChanged(settleUnit, updateAttrCache)
    settleUnit = settleUnit or BattleScene.GetUnitByUid(self.toUnitUid)
    local effect
    local maxHpId = CardAttribute.GetIdByName(ATTR_ENUM.max_hp)
    for i = 1, #self.effectList do
      effect = self.effectList[i]
      if effect.attributeId and 0 ~= effect.attributeId then
        if effect.attributeId == maxHpId then
          settleUnit.lastHpPer = settleUnit.tempHpPer
        end
        if true == updateAttrCache and true == effect.containAttributeValue then
          settleUnit:UpdateAttrCacheFromBuff(effect.attributeId)
        end
        settleUnit:OnBuffAttrChanged(effect.attributeId, effect.finalValue)
      end
    end
  end
  
  function buff:TriggerUnitShieldGot(settleUnit)
    if self:ContainEffectId(BUFF_EFFECT_ID.SHIELD) == true then
      local shield = self:GetEffectTotalValue(BUFF_EFFECT_ID.SHIELD)
      settleUnit.totalShieldGot = settleUnit.totalShieldGot + shield
      BattleBuffMgr.TriggerUnitListener(settleUnit, BUFF_DEDUCE_TYPE.SHIELD_ADD)
      if self.fromManuallySkillId and self.fromSkillCamp then
        local manuallySkill = BattleScene.GetManuallySkill(self.fromManuallySkillId, self.fromSkillCamp)
        if manuallySkill then
          manuallySkill:SaveShield(shield)
        end
      end
    end
  end
  
  function buff:IsShieldSpecialUsedUp()
    local list = self.effectList
    if list then
      for _, v in ipairs(list) do
        if v.effectId == BUFF_EFFECT_ID.SHIELD_SPECIAL and v.finalValue > 0 then
          return false
        end
      end
    end
    return true
  end
  
  function buff:IsShieldUsedUp()
    local list = self.effectList
    if list then
      for _, v in ipairs(list) do
        if v.effectId == BUFF_EFFECT_ID.SHIELD and v.finalValue > 0 then
          return false
        end
      end
    end
    return true
  end
  
  function buff:IsTenacityUsedUp()
    local list = self.effectList
    if list then
      for _, v in ipairs(list) do
        if (v.effectId == BUFF_EFFECT_ID.TENACITY or v.effectId == BUFF_EFFECT_ID.TENACITY_NO_STATISTICS) and v.finalValue > 0 then
          return false
        end
      end
    end
    return true
  end
  
  function buff:NeedRemove()
    if self.deduceMaxCount < 0 then
      return false
    end
    if self.deduceCount < self.deduceMaxCount then
      return false
    end
    return true
  end
  
  function buff:Update(curFixedFrame)
    if self.pause == true then
      self.lastDeduceFrame = self.lastDeduceFrame + 1
      return
    end
    if self.curState == BUFF_STATE_ENUM.SETTLED then
      if self.deduceType == nil then
        return
      end
      if true == self.waitDeduce then
        self:Deduce()
        return
      end
      local toUnitUid = self.toUnitUid
      if self.attackWarningEffectList then
        for i = 1, #self.attackWarningEffectList do
          local effectPoint = self.attackWarningEffectList[i]
          if nil == effectPoint.alreadyDeal and effectPoint.frame_start == curFixedFrame - self.settleFrame + 1 then
            effectPoint.alreadyDeal = true
            effectPoint.index = BattleActionDisplay.GetWaitWarningEffectIndex()
            local totalFrame = effectPoint.frame_end - effectPoint.frame_start
            local settleUnit = BattleScene.GetUnitByUid(toUnitUid)
            if settleUnit then
              BattleActionDisplay.AddWaitDealWarningEffect(settleUnit, effectPoint.effect_path, effectPoint.targetType, effectPoint.rangeType, effectPoint.rangeX, effectPoint.rangeY, effectPoint.index, totalFrame)
            end
          end
          if true == effectPoint.alreadyDeal and effectPoint.frame_end == curFixedFrame - self.settleFrame + 1 then
            local index = effectPoint.index
            local settleUnit = BattleScene.GetUnitByUid(toUnitUid)
            if settleUnit then
              settleUnit:RemoveEffect(effectPoint.effect_path .. "_" .. index, true)
            end
          end
        end
      end
      local deducePerFrames = self.deducePerFrames
      if nil ~= deducePerFrames then
        local remove
        if curFixedFrame >= deducePerFrames + self.lastDeduceFrame then
          remove = self:Deduce()
        end
        if self.needShowBuffIcon and self.remainFrames then
          local settleUnit = BattleScene.GetUnitByUid(toUnitUid)
          if settleUnit then
            self.remainFrames = self.remainFrames - 1
            settleUnit.buffRefreshCurFrame = true
          end
        end
        return
      end
      if self.deduceType == BUFF_DEDUCE_TYPE.MOVE and toUnitUid then
        local settleUnit = BattleScene.GetUnitByUid(toUnitUid)
        local value = settleUnit.totalMove - self.alreadyMove
        if value >= self.buffConfig.deduce_value * (self.deduceCount + 1) then
          self:Deduce()
        end
      end
    elseif true == self.waitSettle then
      self:Settle()
    end
  end
  
  function buff:CanSettle()
    local conditionResult = self:TestCondition(self.buffConfig.trigger_condition, self.buffConfig.trigger_type, self.buffConfig.trigger_value)
    if false == conditionResult then
      return false, false
    end
    local settleReset
    if self.toUnitUid then
      local toUnit = BattleScene.GetUnitByUid(self.toUnitUid)
      if self.overlayNum then
        local count, list = BattleBuffMgr.GetSettledBuffByUnitAndId(toUnit, self.id)
        if count > 0 then
          local alreadySettleBuff = list[1]
          if alreadySettleBuff then
            local overlayNumMax = self.buffConfig.overlay_num
            local settleReset = self.buffConfig.settle_reset
            if overlayNumMax then
              if overlayNumMax <= alreadySettleBuff.overlayNum then
                print_battle("buff挂载时判断已经超过最大挂载数量限制，buffId:", self.id)
                return false, 1 == settleReset
              else
                alreadySettleBuff.overlayNum = math.min(overlayNumMax, alreadySettleBuff.overlayNum + self.overlayNum)
                alreadySettleBuff:UpdateEffectValue()
              end
            else
              alreadySettleBuff.overlayNum = alreadySettleBuff.overlayNum + self.overlayNum
              alreadySettleBuff:UpdateEffectValue()
            end
            return false, 1 == settleReset
          end
        end
      end
      local overlayNum = self.buffConfig.overlay_num
      settleReset = self.buffConfig.settle_reset
      if overlayNum then
        local getSameBuffCount = BattleBuffMgr.GetSettledBuffByUnitAndId(toUnit, self.id)
        if overlayNum <= getSameBuffCount then
          print_battle("buff挂载时判断已经超过最大挂载数量限制，buffId:", self.id)
          return false, 1 == settleReset
        end
      end
      if BattleBuffMgr.IsBuffImmune(toUnit, self) == true then
        if true ~= BattleMgr.isBattleServer then
          BattleHurtNum.ShowHurtNum(HURT_NUM_ENUM.IMMUNE, 0, toUnit)
        end
        return false, false
      end
    end
    return true, 1 == settleReset
  end
  
  function buff:TestCondition(testCondition, testType, testValue, testUnitUid)
    if testCondition and 0 ~= testCondition then
      local toUnit, fromUnit, bulletTargetUnit
      if nil == testUnitUid then
        if self.toUnitUid then
          toUnit = BattleScene.GetUnitByUid(self.toUnitUid)
        elseif self.toBulletUid then
          local bullet = BattleScene.GetBulletByUid(self.toBulletUid)
          toUnit = BattleScene.GetUnitByUid(bullet.fromUid)
          bulletTargetUnit = BattleScene.GetUnitByUid(bullet.targetUid)
        end
        if self.fromUnitUid then
          fromUnit = BattleScene.GetUnitByUid(self.fromUnitUid)
        end
      end
      local value
      if testCondition == TRIGGER_CONDITION.TARGET_WITH_EFFECT then
        if nil == toUnit then
          return false, false
        end
        if BattleBuffMgr.ContainEffectId(toUnit, testValue) == false then
          print_battle("  不满足条件，携带方不含有对应的effect ", testValue, toUnit.positionIndex)
          return false, false
        end
      elseif testCondition == TRIGGER_CONDITION.TARGET_WITHOUT_EFFECT then
        if nil == toUnit then
          return false, false
        end
        if BattleBuffMgr.ContainEffectId(toUnit, testValue) == true then
          print_battle("  不满足条件，携带方含有对应的effect ", testValue)
          return false, false
        end
      elseif testCondition == TRIGGER_CONDITION.TARGET_WITH_BUFF then
        if nil == toUnit then
          return false, false
        end
        local count = BattleBuffMgr.GetSettledBuffByUnitAndId(toUnit, testValue)
        if count <= 0 then
          print_battle("  不满足条件，携带方不含有对应的BuffId ", testValue, toUnit.positionIndex)
          return false, false
        end
      elseif testCondition == TRIGGER_CONDITION.TARGET_WITHOUT_BUFF then
        if nil == toUnit then
          return false, false
        end
        local count = BattleBuffMgr.GetSettledBuffByUnitAndId(toUnit, testValue)
        if count > 0 then
          print_battle("  不满足条件，携带方含有对应的BuffId ", testValue)
          return false, false
        end
      elseif testCondition == TRIGGER_CONDITION.BULLET_TARGET_WITH_EFFECT then
        if nil == bulletTargetUnit then
          print_battle("  不满足条件，找不到弹道的目标 ")
          return false, false
        end
        if BattleBuffMgr.ContainEffectId(bulletTargetUnit, testValue) == false then
          print_battle("  不满足条件，携带方目标不含有对应的EffectId ", testValue)
          return false, false
        end
      elseif testCondition == TRIGGER_CONDITION.BULLET_TARGET_WITHOUT_EFFECT then
        if nil == bulletTargetUnit then
          print_battle("  不满足条件，找不到弹道的目标 ")
          return false, false
        end
        if BattleBuffMgr.ContainEffectId(bulletTargetUnit, testValue) == true then
          print_battle("  不满足条件，携带方目标含有对应的EffectId ", testValue)
          return false, false
        end
      elseif testCondition == TRIGGER_CONDITION.BULLET_TARGET_WITH_BUFF then
        if nil == bulletTargetUnit then
          print_battle("  不满足条件，找不到弹道的目标 ")
          return false, false
        end
        local count = BattleBuffMgr.GetSettledBuffByUnitAndId(bulletTargetUnit, testValue)
        if count <= 0 then
          print_battle("  不满足条件，携带方目标不含有对应的BuffId ", testValue)
          return false, false
        end
      elseif testCondition == TRIGGER_CONDITION.BULLET_TARGET_WITHOUT_BUFF then
        if nil == bulletTargetUnit then
          print_battle("  不满足条件，找不到弹道的目标 ")
          return false, false
        end
        local count = BattleBuffMgr.GetSettledBuffByUnitAndId(bulletTargetUnit, testValue)
        if count > 0 then
          print_battle("  不满足条件，携带方目标含有对应的BuffId ", testValue)
          return false, false
        end
      elseif testCondition == TRIGGER_CONDITION.TARGET_TARGET_WITH_BUFF then
        if nil == toUnit then
          return false, false
        end
        local targetUid = toUnit:GetAttackTargetUid()
        if nil == targetUid then
          print_battle("  不满足条件，找不到攻击目标 ")
          return false, false
        end
        local targetUnit = BattleScene.GetUnitByUid(targetUid)
        if nil == targetUnit then
          print_battle("  不满足条件，找不到攻击目标 ")
          return false, false
        end
        local count = BattleBuffMgr.GetSettledBuffByUnitAndId(targetUnit, testValue)
        if count <= 0 then
          print_battle("  不满足条件，携带方攻击目标不含有对应的BuffId ", testValue)
          return false, false
        end
      elseif testCondition == TRIGGER_CONDITION.TARGET_TARGET_WITH_EFFECT then
        if nil == toUnit then
          return false, false
        end
        local targetUid = toUnit:GetAttackTargetUid()
        if nil == targetUid then
          print_battle("  不满足条件，找不到攻击目标 ")
          return false, false
        end
        local targetUnit = BattleScene.GetUnitByUid(targetUid)
        if nil == targetUnit then
          print_battle("  不满足条件，找不到攻击目标 ")
          return false, false
        end
        if BattleBuffMgr.ContainEffectId(targetUnit, testValue) == false then
          print_battle("  不满足条件，携带方攻击目标不含有对应的effectId ", testValue)
          return false, false
        end
      elseif testCondition == TRIGGER_CONDITION.TARGET_HP_PERCENT then
        if nil == toUnit then
          return false, false
        end
        local hp = toUnit:GetHp()
        local maxHp = toUnit:GetAttr(ATTR_ENUM.max_hp)
        value = MathUtil.TruncateFloat(10000 * hp / maxHp)
      elseif testCondition == TRIGGER_CONDITION.TARGET_CAMP_COUNT then
        if nil == toUnit then
          return false, false
        end
        value = #BattleChoose.GetUnitListBySide(toUnit, true)
      elseif testCondition == TRIGGER_CONDITION.TARGET_UNIT_TYPE then
        if nil == toUnit then
          return false, false
        end
        value = toUnit.battleUnitType
      elseif testCondition == TRIGGER_CONDITION.TARGET_ATTACK_TARGET_UNIT_TYPE then
        if nil == toUnit then
          return false, false
        end
        local targetUid = toUnit:GetAttackTargetUid()
        if nil == targetUid then
          return false
        end
        local targetUnit = BattleScene.GetUnitByUid(targetUid)
        value = targetUnit.battleUnitType
      elseif testCondition == TRIGGER_CONDITION.TARGET_ELEMENT_TYPE then
        if nil == toUnit then
          return false, false
        end
        value = toUnit.elementTypes
      elseif testCondition == TRIGGER_CONDITION.TARGET_CARD_ID then
        if nil == toUnit then
          return false, false
        end
        value = toUnit.id
      elseif testCondition == TRIGGER_CONDITION.TARGET_SHIELD_VALUE then
        if nil == toUnit then
          return false, false
        end
        value = toUnit:GetAttr(ATTR_ENUM.shield)
      elseif testCondition == TRIGGER_CONDITION.TARGET_ATTACK_TARGET_HP then
        if nil == toUnit then
          return false, false
        end
        local targetUid = toUnit:GetAttackTargetUid()
        if nil == targetUid then
          return false
        end
        local targetUnit = BattleScene.GetUnitByUid(targetUid)
        value = 10000 * targetUnit.tempHpPer
      elseif testCondition == TRIGGER_CONDITION.TARGET_MONSTER_RANK then
        if nil == toUnit then
          return false, false
        end
        value = toUnit.monsterRank
      elseif testCondition == TRIGGER_CONDITION.RANDOM then
        value = BattleData.GetRandomSeed()
      elseif testCondition == TRIGGER_CONDITION.RANDOM_BY_BUFF_ADD_COUNT then
        if nil == toUnit then
          return false, false
        end
        local buffCount, list = BattleBuffMgr.GetSettledBuffByUnitAndId(toUnit, 45702102)
        local count = 1
        if buffCount > 0 then
          count = list[1].overlayNum + 1
        end
        value = BattleData.GetRandomSeed() / count
      elseif testCondition == TRIGGER_CONDITION.SPECIFIC_UNIT_HP_PERCENT then
        if nil == testUnitUid then
          return false
        end
        local targetUnit = BattleScene.GetUnitByUid(testUnitUid)
        value = 10000 * targetUnit.tempHpPer
      elseif testCondition == TRIGGER_CONDITION.UNIT_FROM_CONTAIN_BUFF then
        if nil == fromUnit then
          return false
        end
        local contain = fromUnit:ContainBuffId(testValue)
        if false == contain then
          print_battle("  不满足条件，buff释放方没有挂载Buff的id ", testValue)
          return false, false
        end
      elseif testCondition == TRIGGER_CONDITION.UNIT_FROM_NOT_CONTAIN_BUFF then
        if nil == fromUnit then
          return false
        end
        local contain = fromUnit:ContainBuffId(testValue)
        if true == contain then
          print_battle("  不满足条件，buff释放方的徽章已经挂载Buff的id ", testValue)
          return false, false
        end
      elseif testCondition == TRIGGER_CONDITION.UNIT_FROM_CONTAIN_EFFECT then
        if nil == fromUnit then
          return false
        end
        local contain = BattleBuffMgr.ContainEffectId(fromUnit, testValue)
        if false == contain then
          print_battle("  不满足条件，buff释放方没有挂载effect的id ", testValue)
          return false, false
        end
      elseif testCondition == TRIGGER_CONDITION.UNIT_FROM_NOT_CONTAIN_EFFECT then
        if nil == fromUnit then
          return false
        end
        local contain = BattleBuffMgr.ContainEffectId(fromUnit, testValue)
        if true == contain then
          print_battle("  不满足条件，buff释放方的徽章已经挂载effect的id ", testValue)
          return false, false
        end
      elseif testCondition == TRIGGER_CONDITION.UNIT_FROM_BURST_LEVEL then
        if nil == fromUnit then
          return false
        end
        if nil == fromUnit.burstSkill then
          return false
        end
        value = fromUnit:GetSkillLevel(fromUnit.burstSkill)
      elseif testCondition == TRIGGER_CONDITION.TARGET_ATK_SPEED then
        if nil == toUnit then
          return false, false
        end
        value = toUnit:GetSpdAtk()
      elseif testCondition == TRIGGER_CONDITION.TARGET_ATTACK_TARGET_HP_CONTAIN_EFFECT_TAG then
        if nil == toUnit then
          return false, false
        end
        local targetUid = toUnit:GetAttackTargetUid()
        if nil == targetUid then
          return false
        end
        local targetUnit = BattleScene.GetUnitByUid(targetUid)
        if false == targetUnit:ContainBuffEffectTag(testValue) then
          print_battle("  不满足条件，buff释放方攻击目标已挂载buff不包含dot效果 ", testValue)
          return false, false
        end
      elseif testCondition == TRIGGER_CONDITION.UNIT_FROM_BASE_CRT then
        if nil == fromUnit then
          return false
        end
        value = fromUnit:GetBaseAttr(ATTR_ENUM.crt)
      elseif testCondition == TRIGGER_CONDITION.UNIT_FROM_SMALL_SKILL_LEVEL then
        if nil == fromUnit then
          return false
        end
        value = 0
        local smallSkillIds = fromUnit.savedSmallSkillList
        if #smallSkillIds > 0 then
          value = fromUnit:GetSkillLevel(smallSkillIds[1])
        end
      elseif testCondition == TRIGGER_CONDITION.TARGET_OUTSIDE_BURST then
        if nil == toUnit then
          return false
        end
        local camp = toUnit.camp
        local burst = BattleScene.GetBurst(camp)
        if nil == burst then
          return false
        end
        if burst.energySkillRemainFrame and burst.energySkillRemainFrame > 0 then
          return false
        end
      elseif testCondition == TRIGGER_CONDITION.TARGET_PERSIST_DAMAGE then
        if nil == toUnit then
          return false
        end
        if false == toUnit:ContainPersistentDamage() then
          return false
        end
      elseif testCondition == TRIGGER_CONDITION.TARGET_CONTROL then
        if nil == toUnit then
          return false
        end
        if false == toUnit:ContainControl() then
          return false
        end
      elseif testCondition == TRIGGER_CONDITION.BUFF_COUNT_1008 then
        if nil == toUnit then
          return false
        end
        local count = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(toUnit, BUFF_EFFECT_ID.HEART_OF_MACHINE)
        if count <= 0 then
          return false
        end
        if 0 ~= count % testValue then
          return false
        end
        value = testValue
      else
        return false
      end
      if value then
        if type(value) == "table" then
          local enable = false
          for i = 1, #value do
            if true == CompareNum(testType, value[i], testValue) then
              enable = true
              break
            end
          end
          if false == enable then
            return false
          end
        elseif false == CompareNum(testType, value, testValue) then
          return false
        end
      end
    end
    return true
  end
  
  function buff:CanEffective(testUnitUid)
    local effective_condition = self.buffConfig.effective_condition
    if effective_condition then
      return self:TestCondition(effective_condition, self.buffConfig.effective_type, self.buffConfig.effective_value, testUnitUid)
    else
      return true
    end
  end
  
  function buff:IsBuffImmune(newBuff)
    local immune_group = self.buffConfig.immune_group
    if immune_group then
      local __groupInfo, __type, __id, groupString
      for i = 1, #immune_group do
        groupString = immune_group[i]
        if "4" == groupString then
          return true
        end
        __groupInfo = Split(groupString, ":")
        if #__groupInfo > 1 then
          __type = tonumber(__groupInfo[1])
          __id = tonumber(__groupInfo[2])
          if 1 == __type then
            if newBuff.id == __id then
              return true
            end
          elseif 2 == __type then
            if newBuff.buffConfig.type == __id then
              return true
            end
          elseif 3 == __type then
            if newBuff:ContainEffectId(__id) == true then
              return true
            end
          elseif 5 == __type then
            if newBuff.buffConfig.type ~= __id then
              return true
            end
          elseif 101 == __type and true == newBuff:ContainEffectTag(__id) then
            return true
          end
        end
      end
    end
    return false
  end
  
  function buff:SetState(state)
    self.curState = state
  end
  
  function buff:UpdateDisplay()
  end
  
  function buff:Destroy()
    if self.effectList then
      for i = 1, #self.effectList do
        self.effectList[i]:Destroy()
      end
    end
    self:Clear()
    self = nil
  end
  
  buff:Init(_id, _from, _to, _settleNow, _extraParams, _delayParams)
  return buff
end
