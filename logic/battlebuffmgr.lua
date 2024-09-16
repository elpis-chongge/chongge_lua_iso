BattleBuffMgr = {}
local t_remove = table.remove
local t_sort = table.sort
local tonumber = tonumber
local pairs = pairs
local listenerSettleList = {}
local listenerDeduceList = {}
local listenerRemoveList = {}
local savedBuffList = {}
local sortBuffList = {}
local copySortBuffUidList = {}
local sortBuffListChanged
local buffGlobalIndex = 0
local BUFF_EFFECT_ID = BUFF_EFFECT_ID
local ParseConfigStr = ParseConfigStr
local cachedForceControlEffectIdList = {}

function BattleBuffMgr.InitLocalVar()
end

function BattleBuffMgr.Init(isStart)
  listenerSettleList = {}
  listenerDeduceList = {}
  savedBuffList = {}
  sortBuffList = {}
  copySortBuffUidList = {}
  sortBuffListChanged = true
  buffGlobalIndex = 0
  BattleBuffMgr.savedBuffList = savedBuffList
  cachedForceControlEffectIdList = {}
  if isStart then
    local config = TableData.GetTable("BaseSkillBuffEffect")
    local tag_forceControl = BUFF_EFFECT_TAG.FORCE_CONTROL
    for _, v in pairs(config) do
      if v.effect_tag and table.contain(v.effect_tag, tag_forceControl) == true then
        table.insert(cachedForceControlEffectIdList, v.id)
      end
    end
    table.sort(cachedForceControlEffectIdList, function(a, b)
      return a < b
    end)
  end
end

function BattleBuffMgr.GetForceControlEffectIdList()
  return cachedForceControlEffectIdList
end

function BattleBuffMgr.NewBuff(...)
  return BattleBuff.NewBuff(...)
end

function BattleBuffMgr.AddToBuffList(buff)
  savedBuffList[buff.uid] = buff
  sortBuffList[#sortBuffList + 1] = buff
  sortBuffListChanged = true
end

function BattleBuffMgr.RemoveFromBuffList(uid)
  savedBuffList[uid] = nil
  for i, buff in ipairs(sortBuffList) do
    if buff.uid == uid then
      t_remove(sortBuffList, i)
      sortBuffListChanged = true
      return
    end
  end
end

function BattleBuffMgr.ClearBuffByBuffId(battleUnit, buffId, cleanLimit)
  local num, buffTable = BattleBuffMgr.GetSettledBuffByUnitAndId(battleUnit, buffId, function(array)
    table.sort(array, function(a, b)
      return a.uid > b.uid
    end)
  end)
  if num > 0 then
    local cleanCount = 0
    local cleanBuff
    for j = 1, #buffTable do
      cleanBuff = buffTable[j]
      if cleanBuff.overlayNum then
        if cleanLimit and cleanLimit > 0 then
          cleanCount = cleanCount + math.min(cleanLimit, cleanBuff.overlayNum)
          cleanBuff.overlayNum = cleanBuff.overlayNum - cleanLimit
        else
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
        cleanCount = cleanCount + 1
      end
      if cleanLimit and cleanLimit <= cleanCount then
        return cleanCount
      end
    end
  end
end

function BattleBuffMgr.ClearBuffByEffectId(battleUnit, effectId, cleanLimit)
  local num, buffTable = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(battleUnit, effectId, function(array)
    table.sort(array, function(a, b)
      return a.uid > b.uid
    end)
  end)
  if num > 0 then
    local cleanCount = 0
    local cleanBuff
    for j = 1, #buffTable do
      cleanBuff = buffTable[j]
      if cleanBuff.overlayNum then
        if cleanLimit and cleanLimit > 0 then
          cleanCount = cleanCount + math.min(cleanLimit, cleanBuff.overlayNum)
          cleanBuff.overlayNum = cleanBuff.overlayNum - cleanLimit
        else
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
        cleanCount = cleanCount + 1
      end
      if cleanLimit and cleanLimit <= cleanCount then
        return cleanCount
      end
    end
  end
end

function BattleBuffMgr.ClearAllBuff()
  for uid, buff in pairs(savedBuffList) do
    if buff then
      buff:Remove(true)
    end
  end
  BattleBuffMgr.Init()
end

function BattleBuffMgr.RegisterSettleListener(buff)
  local settleType = buff.settleType
  local t = listenerSettleList[settleType] or {}
  t[#t + 1] = {
    uid = buff.uid,
    fromUnitUid = buff.fromUnitUid,
    toUnitUid = buff.toUnitUid,
    toBulletUid = buff.toBulletUid,
    toBombUid = buff.toBombUid,
    toCamp = buff.toCamp
  }
  listenerSettleList[settleType] = t
end

function BattleBuffMgr.RegisterDeduceListener(buff)
  local deduceType = buff.deduceType
  if nil == deduceType then
    return
  end
  local t = listenerDeduceList[deduceType] or {}
  t[#t + 1] = {
    uid = buff.uid,
    fromUnitUid = buff.fromUnitUid,
    toUnitUid = buff.toUnitUid,
    toBulletUid = buff.toBulletUid,
    toBombUid = buff.toBombUid,
    toCamp = buff.toCamp
  }
  listenerDeduceList[deduceType] = t
end

function BattleBuffMgr.RegisterRemoveListener(buff)
  local removeType = buff.removeType
  if nil == removeType then
    return
  end
  local t = listenerRemoveList[removeType] or {}
  t[#t + 1] = {
    uid = buff.uid,
    fromUnitUid = buff.fromUnitUid,
    toUnitUid = buff.toUnitUid,
    toBulletUid = buff.toBulletUid,
    toBombUid = buff.toBombUid,
    toCamp = buff.toCamp
  }
  listenerRemoveList[removeType] = t
end

function BattleBuffMgr.UnRegisterSettleListenerByUnitUid(unitUid)
  for _, settleList in pairs(listenerSettleList) do
    local count = #settleList
    if count > 0 then
      for i = count, 1, -1 do
        if settleList[i].fromUnitUid == unitUid then
          if BattleMgr.isBattleServer == false then
            local buff = savedBuffList[settleList[i].uid]
            if buff then
              print_battle("清理未成功挂载的buff,buffId:", buff.id, " buffUid:", buff.uid, " 角色uid:", unitUid)
            end
          end
          t_remove(settleList, i)
        end
      end
    end
  end
end

function BattleBuffMgr.UnRegisterSettleListener(uid, settleType)
  local list = listenerSettleList[settleType]
  if list then
    for i = 1, #list do
      if list[i].uid == uid then
        t_remove(list, i)
        return
      end
    end
  end
end

function BattleBuffMgr.UnRegisterDeduceListener(uid, deduceType)
  if nil == deduceType then
    return
  end
  local list = listenerDeduceList[deduceType]
  if list then
    for i = 1, #list do
      if list[i].uid == uid then
        t_remove(list, i)
        return
      end
    end
  end
end

function BattleBuffMgr.UnRegisterRemoveListener(uid, removeType)
  if nil == removeType then
    return
  end
  local list = listenerRemoveList[removeType]
  if list then
    for i = 1, #list do
      if list[i].uid == uid then
        t_remove(list, i)
        return
      end
    end
  end
end

function BattleBuffMgr.RefreshRegisterDeduceListener(buff)
  local list = listenerDeduceList[buff.deduceType]
  if list then
    local tempBuff
    local uid = buff.uid
    for i = 1, #list do
      tempBuff = list[i]
      if tempBuff.uid == uid then
        tempBuff.fromUnitUid = buff.fromUnitUid
        tempBuff.toUnitUid = buff.toUnitUid
        tempBuff.toBulletUid = buff.toBulletUid
        tempBuff.toBombUid = buff.toBombUid
        tempBuff.toCamp = buff.toCamp
        return
      end
    end
  end
end

function BattleBuffMgr.TriggerRemoveListener(removeType, params)
  if nil == removeType then
    return
  end
  local list = BattleBuffMgr.GetListenerRemoveList(removeType)
  if list then
    local buff
    for i = 1, #list do
      buff = savedBuffList[list[i]]
      if buff then
        buff:TriggerRemove(params)
      end
    end
  end
end

function BattleBuffMgr.TriggerUnitListener(unit, deduceType, settleType, deduceParam, settleParam)
  local unitUid = unit and unit.uid
  if nil == unitUid then
    return
  end
  if deduceType then
    local list = BattleBuffMgr.GetListenerDeduceList(deduceType, unitUid)
    if list then
      local buff
      for i = 1, #list do
        buff = savedBuffList[list[i]]
        if buff then
          buff:Deduce(deduceParam)
        end
      end
    end
  end
  if settleType then
    local list = BattleBuffMgr.GetListenerSettleList(settleType, unitUid)
    if list then
      local buff
      for i = 1, #list do
        buff = savedBuffList[list[i]]
        if buff then
          buff:Settle(nil, nil, settleParam)
        end
      end
    end
  end
end

function BattleBuffMgr.TriggerBulletListener(bullet, deduceType)
  local bulletUid = bullet and bullet.uid
  if nil == bulletUid then
    return
  end
  if deduceType then
    local list = BattleBuffMgr.GetListenerDeduceList(deduceType, nil, bulletUid)
    if list then
      local buff
      for i = 1, #list do
        buff = savedBuffList[list[i]]
        if buff then
          buff:Deduce()
        end
      end
    end
  end
end

function BattleBuffMgr.TriggerBombListener(bomb, deduceType)
  local bombUid = bomb and bomb.uid
  if nil == bombUid then
    return
  end
  if deduceType then
    local list = BattleBuffMgr.GetListenerDeduceList(deduceType, nil, nil, bombUid)
    if list then
      local buff
      for i = 1, #list do
        buff = savedBuffList[list[i]]
        if buff then
          buff:Deduce()
        end
      end
    end
  end
end

function BattleBuffMgr.TriggerCampListener(camp, deduceType)
  if nil == camp then
    return
  end
  if deduceType then
    local list = BattleBuffMgr.GetListenerDeduceList(deduceType, nil, nil, nil, camp)
    if list then
      local buff
      for i = 1, #list do
        buff = savedBuffList[list[i]]
        if buff then
          buff:Deduce()
        end
      end
    end
  end
end

function BattleBuffMgr.TriggerListener(deduceType, deduceParam)
  if deduceType then
    local list = BattleBuffMgr.GetListenerDeduceList(deduceType)
    if list then
      local buff
      for i = 1, #list do
        buff = savedBuffList[list[i]]
        if buff then
          if deduceType == BUFF_DEDUCE_TYPE.CAMP_TRIGGER_TIME_PAUSE_COUNT then
            local settleUnitUid = buff.toUnitUid
            if settleUnitUid then
              local unit = BattleScene.GetUnitByUid(settleUnitUid)
              local camp = deduceParam.camp
              if unit and unit.camp == camp then
                local triggerTimePauseCount = deduceParam.triggerTimePauseCount
                if triggerTimePauseCount > 0 then
                  local needCount = buff.buffConfig.deduce_value
                  if 0 == triggerTimePauseCount % needCount then
                    buff:Deduce()
                  end
                end
              end
            end
          else
            buff:Deduce()
          end
        end
      end
    end
  end
end

function BattleBuffMgr.TriggerListenerBuffAdd(deduceType, deduceParam)
  if deduceType then
    local list = BattleBuffMgr.GetListenerDeduceList(deduceType)
    if list then
      local buff
      for i = 1, #list do
        buff = savedBuffList[list[i]]
        if buff then
          if deduceType == BUFF_DEDUCE_TYPE.RIGHT_EFFECT_DEDUCE then
            local effectId = tonumber(buff.deduceTypeParam)
            local triggerBuffUid = deduceParam.triggerByDeduceBuffUid
            local triggerBuff = savedBuffList[triggerBuffUid]
            if triggerBuff and triggerBuff:ContainEffectId(effectId) then
              buff:Deduce()
              if BattleData.addBuffTotalCount then
                BattleData.addBuffTotalCount = BattleData.addBuffTotalCount + 1
              end
              if BattleData.addBuffAddCount then
                BattleData.addBuffAddCount = BattleData.addBuffAddCount + 1
              end
            end
          else
            buff:Deduce()
            if BattleData.addBuffTotalCount then
              BattleData.addBuffTotalCount = BattleData.addBuffTotalCount + 1
            end
            if BattleData.addBuffAddCount then
              BattleData.addBuffAddCount = BattleData.addBuffAddCount + 1
            end
          end
        end
      end
    end
  end
end

function BattleBuffMgr.GetBuffGlobalIndex()
  buffGlobalIndex = buffGlobalIndex + 1
  return buffGlobalIndex
end

function BattleBuffMgr.GetAllBuff(skillLevelUpConfig, from, defUnitUidList, settleNow, extraParams)
  local configBuffList = skillLevelUpConfig.buff_list
  if configBuffList then
    local tos
    if defUnitUidList then
      tos = {}
      for i = 1, #defUnitUidList do
        tos[#tos + 1] = {
          unitUid = defUnitUidList[i]
        }
      end
    end
    BattleBuffMgr.AnalysisBuffList(configBuffList, from, tos or {}, settleNow, extraParams)
  end
end

function BattleBuffMgr.GetAllBurstBuff(skillLevelUpConfig, from)
  local configBuffList = skillLevelUpConfig.buff_list
  if configBuffList then
    local extraParams = {includeStealth = true}
    BattleBuffMgr.AnalysisBuffList(configBuffList, from, {}, true, extraParams)
  end
end

function BattleBuffMgr.GetAllBulletBuff(skillLevelUpConfig, from, to, settleNow)
  local configBuffList = skillLevelUpConfig.bullet_buff_list
  if configBuffList then
    BattleBuffMgr.AnalysisBuffList(configBuffList, from, {to}, settleNow)
  end
end

function BattleBuffMgr.GetAllBombBuff(skillLevelUpConfig, from, to, settleNow)
  local configBuffList = skillLevelUpConfig.bomb_buff_list
  if configBuffList then
    BattleBuffMgr.AnalysisBuffList(configBuffList, from, {to}, settleNow)
  end
end

function BattleBuffMgr.DealBulletDirectDamage(from, to)
  local atkUnit = BattleScene.GetUnitByUid(from.unitUid)
  if atkUnit then
    local isContain, _, buffs = BattleBuffMgr.GetContainedEffect(atkUnit, BUFF_EFFECT_ID.DIRECT_DAMAGE, nil, true)
    if false == isContain then
      isContain, _, buffs = BattleBuffMgr.GetContainedEffect(atkUnit, BUFF_EFFECT_ID.DIRECT_DAMAGE_RATE, nil, true)
    end
    if true == isContain then
      local bulletUid, buff
      for i = 1, #buffs do
        buff = buffs[i]
        if buff.deduceType == BUFF_DEDUCE_TYPE.BULLET_HURT then
          atkUnit:RemoveBuff(buff.uid, buff.needShowBuffIcon)
          bulletUid = to.bulletUid
          buff.toUnitUid = nil
          buff.toBulletUid = bulletUid
          local bullet = BattleScene.GetBulletByUid(bulletUid)
          bullet:AddBuff(buff.uid)
          BattleBuffMgr.RefreshRegisterDeduceListener(buff)
          print_battle("buff从角色转移到子弹", buff.id, from.unitUid, bulletUid)
        end
      end
    end
  end
end

function BattleBuffMgr.DealBulletFinalDamageAdd(fromUnit, fromBullet, toBullet)
  if fromUnit then
    local contain, effectList = BattleBuffMgr.GetContainedEffect(fromUnit, BUFF_EFFECT_ID.FINAL_DAMAGE_ADD_PER, nil)
    if contain then
      local finalDamageAddPer = 0
      for _, v in ipairs(effectList) do
        finalDamageAddPer = finalDamageAddPer + v.finalValue
      end
      toBullet.finalDamageAddPer = toBullet.finalDamageAddPer + finalDamageAddPer
    end
    contain, effectList = BattleBuffMgr.GetContainedEffect(fromUnit, BUFF_EFFECT_ID.FINAL_DAMAGE_REDUCE_PER, nil)
    if contain then
      local finalDamageReducePer = 0
      for _, v in ipairs(effectList) do
        finalDamageReducePer = finalDamageReducePer + v.finalValue
      end
      toBullet.finalDamageAddPer = toBullet.finalDamageAddPer - finalDamageReducePer
    end
  elseif fromBullet then
    toBullet.finalDamageAddPer = toBullet.finalDamageAddPer + fromBullet.finalDamageAddPer
    toBullet.finalDamageReduceBuffPer = toBullet.finalDamageReduceBuffPer + fromBullet.finalDamageReduceBuffPer
  end
end

function BattleBuffMgr.AnalysisBuffList(buffList, buffFrom, buffTos, settleNow, extraParams)
  local buffStrs, totalProp, random, id, targetId, prob, unitList, camp, buffConfig, groupBuff, buffPathId, settleDelay, deduceDelay
  for i = 1, #buffList do
    buffStrs = ParseConfigStr(buffList[i], ";", ":")
    totalProp = 0
    random = BattleData.GetRandomSeed()
    for j = 1, #buffStrs do
      groupBuff = buffStrs[j]
      id = tonumber(groupBuff[1])
      targetId = tonumber(groupBuff[2])
      prob = tonumber(groupBuff[3])
      buffPathId = tonumber(groupBuff[4])
      settleDelay = tonumber(groupBuff[5])
      deduceDelay = tonumber(groupBuff[6])
      if buffPathId and buffPathId > 0 then
        extraParams = extraParams or {}
        extraParams.buffPathId = buffPathId
      elseif extraParams then
        extraParams.buffPathId = nil
      end
      print_battle("当前几率：", random, " 目标几率：", prob, " 累计几率：", totalProp)
      if random <= totalProp + prob then
        if 0 == targetId then
          for k = 1, #buffTos do
            local delayParams = {}
            if settleDelay and settleDelay > 0 then
              delayParams.settleDelay = settleDelay * (k - 1)
            end
            if deduceDelay and deduceDelay > 0 then
              delayParams.deduceDelay = deduceDelay * (k - 1)
            end
            BattleBuffMgr.NewBuff(id, buffFrom, buffTos[k], settleNow, extraParams, delayParams)
          end
          break
        end
        buffConfig = TableData.GetConfig(id, "BaseSkillBuff")
        unitList, camp = BattleChoose.GetBuffTargetUnitList(buffFrom, buffTos, targetId, buffConfig, extraParams)
        if camp then
          BattleBuffMgr.NewBuff(id, buffFrom, {camp = camp}, settleNow, extraParams)
          break
        end
        for k = 1, #unitList do
          local delayParams = {}
          if settleDelay and settleDelay > 0 then
            delayParams.settleDelay = settleDelay * (k - 1)
          end
          if deduceDelay and deduceDelay > 0 then
            delayParams.deduceDelay = deduceDelay * (k - 1)
          end
          BattleBuffMgr.NewBuff(id, buffFrom, {
            unitUid = unitList[k].uid
          }, settleNow, extraParams, delayParams)
        end
        break
      else
        totalProp = totalProp + prob
      end
    end
  end
end

function BattleBuffMgr.GetBuffByUid(uid)
  return savedBuffList[uid]
end

function BattleBuffMgr.GetSavedBuffList()
  return savedBuffList
end

function BattleBuffMgr.UpdateAllBuff(curFixedFrame)
  local tempUidList
  if false == sortBuffListChanged then
    tempUidList = copySortBuffUidList
  else
    tempUidList = {}
    for i, buff in ipairs(sortBuffList) do
      if buff.deduceType or buff.curState == BUFF_STATE_ENUM.TEMP and buff.delayFrameSettle then
        table.insert(tempUidList, buff.uid)
      end
    end
    copySortBuffUidList = tempUidList
    sortBuffListChanged = false
  end
  local buff
  for i = 1, #tempUidList do
    buff = savedBuffList[tempUidList[i]]
    if buff then
      buff:Update(curFixedFrame)
    end
  end
end

function BattleBuffMgr.GetListenerSettleList(settleType, fromUnitUid)
  local list = listenerSettleList[settleType]
  if nil == list then
    return nil
  end
  local copy = {}
  if fromUnitUid then
    for i = 1, #list do
      if list[i].fromUnitUid == fromUnitUid then
        copy[#copy + 1] = list[i].uid
      end
    end
  end
  return copy
end

function BattleBuffMgr.GetListenerRemoveList(removeType)
  if nil == removeType then
    return
  end
  local list = listenerRemoveList[removeType]
  if nil == list then
    return nil
  end
  local copy = {}
  for i = 1, #list do
    copy[#copy + 1] = list[i].uid
  end
  return copy
end

function BattleBuffMgr.GetListenerDeduceList(deduceType, toUnitUid, toBulletUid, toBombUid, toCamp)
  local list = listenerDeduceList[deduceType]
  if nil == list then
    return nil
  end
  local copy = {}
  if toUnitUid then
    for i = 1, #list do
      if list[i].toUnitUid == toUnitUid then
        copy[#copy + 1] = list[i].uid
      end
    end
  elseif toBulletUid then
    for i = 1, #list do
      if list[i].toBulletUid == toBulletUid then
        copy[#copy + 1] = list[i].uid
      end
    end
  elseif toBombUid then
    for i = 1, #list do
      if list[i].toBombUid == toBombUid then
        copy[#copy + 1] = list[i].uid
      end
    end
  elseif toCamp then
    for i = 1, #list do
      if list[i].toCamp == toCamp then
        copy[#copy + 1] = list[i].uid
      end
    end
  else
    for i = 1, #list do
      copy[#copy + 1] = list[i].uid
    end
  end
  return copy
end

function BattleBuffMgr.GetValueById(unit, effectId, bullet, params, bomb)
  local value = 0
  local contain, effectList
  if bomb then
    contain, effectList = BattleBuffMgr.GetBombContainedEffect(bomb, effectId)
  else
    contain, effectList = BattleBuffMgr.GetContainedEffect(unit, effectId, bullet)
  end
  if contain then
    local effect
    if params and params.testEffective then
      for i = 1, #effectList do
        effect = effectList[i]
        local buffUid = effect.belongBuffUid
        local buff = savedBuffList[buffUid]
        if buff:CanEffective() then
          if params.testRealtimeValue and 1 == buff.buffConfig.realtime_update_effect then
            effect:UpdateValue(params)
          end
          value = value + effect.finalValue
        end
      end
    else
      for i = 1, #effectList do
        effect = effectList[i]
        if params and params.testRealtimeValue then
          local buffUid = effect.belongBuffUid
          local buff = savedBuffList[buffUid]
          if 1 == buff.buffConfig.realtime_update_effect then
            effect:UpdateValue(params)
          end
        end
        value = value + effect.finalValue
      end
    end
  end
  return value
end

function BattleBuffMgr.GetValueByCampAndId(camp, effectId)
  local value = 0
  local unitList = BattleScene.GetAliveUnitByCamp(camp)
  for i = 1, #unitList do
    value = value + BattleBuffMgr.GetValueById(unitList[i], effectId)
  end
  return value
end

function BattleBuffMgr.GetBuffCountByUnitAndTag(unit, tag)
  local buffUidList = unit.buffUidList
  local buff
  local count = 0
  for buffUid, enable in pairs(buffUidList) do
    buff = savedBuffList[buffUid]
    if buff:ContainEffectTag(tag) == true then
      count = count + 1
    end
  end
  return count
end

function BattleBuffMgr.GetBuffCountByCampAndId(camp, effectId)
  local value = 0
  local unitList = BattleScene.GetAliveUnitByCamp(camp)
  local isContain, returnEffect, returnBuff
  for i = 1, #unitList do
    isContain, returnEffect, returnBuff = BattleBuffMgr.GetContainedEffect(unitList[i], effectId, nil, true)
    if true == isContain then
      value = value + #returnBuff
    end
  end
  return value
end

function BattleBuffMgr.GetSummonCountByCamp(camp)
  local unitList = BattleScene.GetAliveUnitByCamp(camp)
  local targetUnitList = BattleChoose.GetSummonUnit(unitList)
  return #targetUnitList
end

function BattleBuffMgr.GetAliveUnitCountByCamp(camp)
  local unitList = BattleScene.GetAllAliveUnit()
  local returnList = {}
  for _, v in ipairs(unitList) do
    if v.camp == camp and v.isBuilding == false and v.summonId == nil and v:IsAlive() then
      table.insert(returnList, v)
    end
  end
  return #returnList
end

function BattleBuffMgr.UpdateUnitBuffShield(unit, hurt)
  local totalAbsorbHurt = 0
  local contain, effectList
  if hurt > 0 then
    contain, effectList = BattleBuffMgr.GetContainedEffect(unit, BUFF_EFFECT_ID.SHIELD_SPECIAL)
    if contain then
      local count = #effectList
      if count > 0 then
        local absorbHurt = 0
        if count > 1 then
          t_sort(effectList, function(a, b)
            return a.settleFrame < b.settleFrame
          end)
        end
        local curShieldSpecial, effect
        for i = 1, #effectList do
          effect = effectList[i]
          curShieldSpecial = effect.finalValue
          if effect.shieldSpecialMax and curShieldSpecial > 0 then
            if hurt >= curShieldSpecial then
              effect:UpdateShieldSpecialValue(0)
              totalAbsorbHurt = totalAbsorbHurt + curShieldSpecial
              absorbHurt = absorbHurt + curShieldSpecial
              hurt = hurt - curShieldSpecial
            else
              effect:UpdateShieldSpecialValue(curShieldSpecial - hurt)
              totalAbsorbHurt = totalAbsorbHurt + hurt
              absorbHurt = absorbHurt + hurt
              hurt = 0
            end
          end
          if hurt <= 0 then
            break
          end
        end
      end
    end
  end
  if hurt > 0 then
    contain, effectList = BattleBuffMgr.GetContainedEffect(unit, BUFF_EFFECT_ID.TENACITY)
    if contain then
      local count = #effectList
      if count > 0 then
        local absorbHurt = 0
        if count > 1 then
          t_sort(effectList, function(a, b)
            return a.settleFrame < b.settleFrame
          end)
        end
        local curTenacity, effect
        for i = 1, #effectList do
          effect = effectList[i]
          curTenacity = effect.finalValue
          if effect.tenacityMax and curTenacity > 0 then
            if hurt >= curTenacity then
              effect:UpdateTenacityValue(0)
              totalAbsorbHurt = totalAbsorbHurt + curTenacity
              absorbHurt = absorbHurt + curTenacity
              hurt = hurt - curTenacity
            else
              effect:UpdateTenacityValue(curTenacity - hurt)
              totalAbsorbHurt = totalAbsorbHurt + hurt
              absorbHurt = absorbHurt + hurt
              hurt = 0
            end
          end
          if hurt <= 0 then
            break
          end
        end
      end
    end
  end
  if hurt > 0 then
    contain, effectList = BattleBuffMgr.GetContainedEffect(unit, BUFF_EFFECT_ID.TENACITY_NO_STATISTICS)
    if contain then
      local count = #effectList
      if count > 0 then
        if count > 1 then
          t_sort(effectList, function(a, b)
            return a.settleFrame < b.settleFrame
          end)
        end
        local curTenacity, effect
        for i = 1, #effectList do
          effect = effectList[i]
          curTenacity = effect.finalValue
          if effect.tenacityMax and curTenacity > 0 then
            if hurt >= curTenacity then
              effect:UpdateTenacityValue(0)
              hurt = hurt - curTenacity
            else
              effect:UpdateTenacityValue(curTenacity - hurt)
              hurt = 0
            end
          end
          if hurt <= 0 then
            break
          end
        end
      end
    end
  end
  if hurt > 0 then
    contain, effectList = BattleBuffMgr.GetContainedEffect(unit, BUFF_EFFECT_ID.SHIELD)
    if contain then
      local count = #effectList
      if count > 0 then
        local absorbHurt = 0
        if count > 1 then
          t_sort(effectList, function(a, b)
            return a.settleFrame < b.settleFrame
          end)
        end
        local curShield, effect
        for i = 1, #effectList do
          effect = effectList[i]
          curShield = effect.finalValue
          if effect.shieldMax and curShield > 0 then
            if hurt >= curShield then
              effect:UpdateShieldValue(0)
              totalAbsorbHurt = totalAbsorbHurt + curShield
              absorbHurt = absorbHurt + curShield
              hurt = hurt - curShield
            else
              effect:UpdateShieldValue(curShield - hurt)
              totalAbsorbHurt = totalAbsorbHurt + hurt
              absorbHurt = absorbHurt + hurt
              hurt = 0
            end
          end
          if hurt <= 0 then
            break
          end
        end
        if absorbHurt > 0 then
          local shieldAttr = unit:GetAttr(ATTR_ENUM.shield)
          if shieldAttr <= 0 then
            BattleBuffMgr.TriggerUnitListener(unit, BUFF_DEDUCE_TYPE.SHIELD_USED_UP)
          end
        end
      end
    end
  end
  return hurt, totalAbsorbHurt
end

function BattleBuffMgr.GetUnitListContainEffect(effectId, camp)
  local list
  if camp then
    list = BattleScene.GetAliveUnitByCamp(camp)
  else
    list = BattleScene.GetAllAliveUnit()
  end
  local unitList = {}
  for _, unit in ipairs(list) do
    if BattleBuffMgr.ContainEffectId(unit, effectId) then
      table.insert(unitList, unit)
    end
  end
  return unitList
end

function BattleBuffMgr.ContainEffectId(unit, effectId, bullet)
  local list
  if unit then
    list = unit.cachedBuffEffect[effectId]
    if list and #list > 0 then
      return true
    end
  end
  if bullet then
    list = bullet.cachedBuffEffect[effectId]
    if list and #list > 0 then
      return true
    end
  end
  return false
end

function BattleBuffMgr.GetContainedEffect(unit, effectId, bullet, containBuff, returnEffect, returnBuff)
  returnEffect = returnEffect or {}
  returnBuff = returnBuff or {}
  local buff
  local tempBuffUid = {}
  local list
  if unit then
    list = unit.cachedBuffEffect[effectId]
    if list then
      local v
      for i = 1, #list do
        v = list[i]
        returnEffect[#returnEffect + 1] = v
        if true == containBuff and tempBuffUid[v.belongBuffUid] == nil then
          buff = savedBuffList[v.belongBuffUid]
          if buff then
            returnBuff[#returnBuff + 1] = buff
            tempBuffUid[v.belongBuffUid] = 1
          end
        end
      end
    end
  end
  if bullet then
    list = bullet.cachedBuffEffect[effectId]
    if list then
      local v
      for i = 1, #list do
        v = list[i]
        returnEffect[#returnEffect + 1] = v
        if true == containBuff and tempBuffUid[v.belongBuffUid] == nil then
          buff = savedBuffList[v.belongBuffUid]
          if buff then
            returnBuff[#returnBuff + 1] = buff
            tempBuffUid[v.belongBuffUid] = 1
          end
        end
      end
    end
  end
  return #returnEffect > 0, returnEffect, returnBuff
end

function BattleBuffMgr.GetBombContainedEffect(bomb, effectId, containBuff, returnEffect, returnBuff)
  if bomb then
    returnEffect = returnEffect or {}
    returnBuff = returnBuff or {}
    local buff
    local tempBuffUid = {}
    local list
    list = bomb.cachedBuffEffect[effectId]
    if list then
      local v
      for i = 1, #list do
        v = list[i]
        returnEffect[#returnEffect + 1] = v
        if true == containBuff and tempBuffUid[v.belongBuffUid] == nil then
          buff = savedBuffList[v.belongBuffUid]
          if buff then
            returnBuff[#returnBuff + 1] = buff
            tempBuffUid[v.belongBuffUid] = 1
          end
        end
      end
    end
  end
  return #returnEffect > 0, returnEffect, returnBuff
end

function BattleBuffMgr.GetSettledBuffByUnitAndId(unit, buffId, sortFunc)
  local count, list = 0, {}
  local buff
  local buffUidList = unit.buffUidList
  for buffUid, enable in pairs(buffUidList) do
    buff = savedBuffList[buffUid]
    if buff.id == buffId then
      if buff.overlayNum then
        count = count + buff.overlayNum
      else
        count = count + 1
      end
      table.insert(list, buff)
    end
  end
  if sortFunc then
    sortFunc(list)
  end
  return count, list
end

function BattleBuffMgr.GetSettledBuffByUnitAndType(unit, type, sortFunc)
  local count, list = 0, {}
  local buff
  local buffUidList = unit.buffUidList
  for buffUid, enable in pairs(buffUidList) do
    buff = savedBuffList[buffUid]
    if buff.type == type then
      if buff.overlayNum then
        count = count + buff.overlayNum
      else
        count = count + 1
      end
      table.insert(list, buff)
    end
  end
  if sortFunc then
    sortFunc(list)
  end
  return count, list
end

function BattleBuffMgr.GetSettledBuffByUnitAndEffectID(unit, effectId, sortFunc)
  local count, list = 0, {}
  local contain = BattleBuffMgr.GetContainedEffect(unit, effectId)
  if false == contain then
    return count, list
  end
  local buff
  local buffUidList = unit.buffUidList
  for buffUid, enable in pairs(buffUidList) do
    buff = savedBuffList[buffUid]
    if buff:ContainEffectId(effectId) == true then
      if buff.overlayNum then
        count = count + buff.overlayNum
      else
        count = count + 1
      end
      table.insert(list, buff)
    end
  end
  if sortFunc then
    sortFunc(list)
  end
  return count, list
end

function BattleBuffMgr.GetSettledBuffByUnitAndEffectTag(unit, effectTag, sortFunc)
  local count, list = 0, {}
  local buff
  local buffUidList = unit.buffUidList
  for buffUid, enable in pairs(buffUidList) do
    buff = savedBuffList[buffUid]
    if buff:ContainEffectTag(effectTag) == true then
      if buff.overlayNum then
        count = count + buff.overlayNum
      else
        count = count + 1
      end
      table.insert(list, buff)
    end
  end
  if sortFunc then
    sortFunc(list)
  end
  return count, list
end

function BattleBuffMgr.GetSettledBuffByCampAndId(camp, buffId, sortFunc)
  local count, list = 0, {}
  local buff
  local buffUidList = camp.buffUidList
  for buffUid, enable in pairs(buffUidList) do
    buff = savedBuffList[buffUid]
    if buff.id == buffId then
      if buff.overlayNum then
        count = count + buff.overlayNum
      else
        count = count + 1
      end
      table.insert(list, buff)
    end
  end
  if sortFunc then
    sortFunc(list)
  end
  return count, list
end

function BattleBuffMgr.GetSettledBuffByCampAndType(camp, type, sortFunc)
  local count, list = 0, {}
  local buff
  local buffUidList = camp.buffUidList
  for buffUid, enable in pairs(buffUidList) do
    buff = savedBuffList[buffUid]
    if buff.type == type then
      if buff.overlayNum then
        count = count + buff.overlayNum
      else
        count = count + 1
      end
      table.insert(list, buff)
    end
  end
  if sortFunc then
    sortFunc(list)
  end
  return count, list
end

function BattleBuffMgr.GetSettledBuffByCampAndEffectID(camp, effectId, sortFunc)
  local count, list = 0, {}
  local buff
  local buffUidList = camp.buffUidList
  for buffUid, enable in pairs(buffUidList) do
    buff = savedBuffList[buffUid]
    if buff:ContainEffectId(effectId) == true then
      if buff.overlayNum then
        count = count + buff.overlayNum
      else
        count = count + 1
      end
      table.insert(list, buff)
    end
  end
  if sortFunc then
    sortFunc(list)
  end
  return count, list
end

function BattleBuffMgr.GetSettledBuffByCampAndEffectTag(camp, effectTag, sortFunc)
  local count, list = 0, {}
  local buff
  local buffUidList = camp.buffUidList
  for buffUid, enable in pairs(buffUidList) do
    buff = savedBuffList[buffUid]
    if buff:ContainEffectTag(effectTag) == true then
      if buff.overlayNum then
        count = count + buff.overlayNum
      else
        count = count + 1
      end
      table.insert(list, buff)
    end
  end
  if sortFunc then
    sortFunc(list)
  end
  return count, list
end

function BattleBuffMgr.IsContainBuffFromBuffUid(unit, uid)
  local buff
  local buffUidList = unit.buffUidList
  for buffUid, enable in pairs(buffUidList) do
    buff = savedBuffList[buffUid]
    if buff.triggerFromBuffUid == uid then
      return true
    end
  end
  return false
end

function BattleBuffMgr.IsBuffImmune(unit, newBuff)
  local buff
  local buffUidList = unit.buffUidList
  for buffUid, enable in pairs(buffUidList) do
    buff = savedBuffList[buffUid]
    if buff:IsBuffImmune(newBuff) == true then
      print_battle("buff被免疫，buff", newBuff.id, "被buff", buff.id, "免疫")
      return true
    end
  end
end

function BattleBuffMgr.IsUnitUntreatable(unit)
  return BattleBuffMgr.ContainEffectId(unit, BUFF_EFFECT_ID.UNTREATABLE) == true
end

function BattleBuffMgr.IsUnitUnyielding(unit)
  return BattleBuffMgr.ContainEffectId(unit, BUFF_EFFECT_ID.UNYIELDING) == true
end

function BattleBuffMgr.IsUnitInvincible(unit)
  return BattleBuffMgr.ContainEffectId(unit, BUFF_EFFECT_ID.INVINCIBLE) == true
end

function BattleBuffMgr.IsUnitStealth(unit)
  return BattleBuffMgr.ContainEffectId(unit, BUFF_EFFECT_ID.STEALTH) == true
end

function BattleBuffMgr.IsUnitImmuneBuffHurt(unit)
  return BattleBuffMgr.ContainEffectId(unit, BUFF_EFFECT_ID.SKILL_ONLY) == true
end
