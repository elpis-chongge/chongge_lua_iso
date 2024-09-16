BattleActionDisplay = {}
local waitSoundAction = {}
local waitVoiceAction = {}
local waitEffectAction = {}
local waitWarningEffectAction = {}
local waitWarningEffectIndex

function BattleActionDisplay.Init()
  BattleActionDisplay.ClearAction()
end

function BattleActionDisplay.ClearAction()
  waitSoundAction = {}
  waitVoiceAction = {}
  waitEffectAction = {}
  waitWarningEffectAction = {}
  waitWarningEffectIndex = 0
end

function BattleActionDisplay.GetWaitWarningEffectIndex()
  waitWarningEffectIndex = waitWarningEffectIndex + 1
  return waitWarningEffectIndex
end

function BattleActionDisplay.AddWaitDealSound(path, bank, model)
  table.insert(waitSoundAction, {
    path = path,
    bank = bank,
    model = model
  })
end

function BattleActionDisplay.AddWaitDealEffect(fromUnit, targetUnit, name, path, autoDestroy, bindSlot)
  table.insert(waitEffectAction, {
    targetUnit = targetUnit,
    fromUnit = fromUnit,
    name = name,
    path = path,
    autoDestroy = autoDestroy,
    bindSlot = bindSlot
  })
end

function BattleActionDisplay.AddWaitDealVoice(unitUid, bubbleType)
  table.insert(waitVoiceAction, {unitUid = unitUid, bubbleType = bubbleType})
end

function BattleActionDisplay.AddWaitDealWarningEffect(unit, path, targetType, rangeType, rangeX, rangeY, index, totalFrame)
  local warningEffect = {
    unit = unit,
    path = path,
    targetType = targetType,
    rangeType = rangeType,
    rangeX = rangeX,
    rangeY = rangeY,
    index = index,
    totalFrame = totalFrame
  }
  table.insert(waitWarningEffectAction, warningEffect)
end

function BattleActionDisplay.DealWaitAction()
  if #waitSoundAction > 0 then
    for i, v in ipairs(waitSoundAction) do
      SoundUtil.PlaySfxInBattle(v.path, v.bank, v.model)
    end
    waitSoundAction = {}
  end
  if #waitVoiceAction > 0 then
    for i, v in ipairs(waitVoiceAction) do
      BattleVoice.PlayVoice(v.unitUid, v.bubbleType)
    end
    waitVoiceAction = {}
  end
  if #waitEffectAction > 0 then
    local unit
    for i, v in ipairs(waitEffectAction) do
      unit = v.targetUnit
      if nil ~= unit then
        local effect = unit:CreateEffect(v.name, v.path, v.autoDestroy, v.bindSlot)
        if effect and SkillEffectsHelper.IsRotationWithAttackDirection(effect) and v.fromUnit then
          SkillEffectsHelper.BindObject(effect, unit.model or unit.effectModel, v.fromUnit.model or v.fromUnit.effectModel)
        end
      else
        ResourceManager.InstantiateAsync(v.path, function(effect)
          if BattleControl.isOver == true then
            ResourceManager.DestroyGameObject(effect)
            return
          end
          LuaUtil.ChangeLayer(effect.transform, "Default")
          local scale = 1
          BattleResourceManager:AddGameObject(effect, 0, 0, 0, scale, scale, scale)
          EffectUtil.SetAutoDestroyCallback(effect, function()
            if BattleControl.isOver == true then
              return
            end
            ResourceManager.DestroyGameObject(effect)
          end)
        end)
      end
    end
    waitEffectAction = {}
  end
  if #waitWarningEffectAction > 0 then
    for i, v in ipairs(waitWarningEffectAction) do
      local path = v.path
      local targetType = v.targetType
      local rangeType = v.rangeType
      local rangeX = v.rangeX
      local rangeY = v.rangeY
      local unit = v.unit
      local totalFrame = v.totalFrame
      if 2011 == targetType or 2041 == targetType or 2461 == targetType or 1 == targetType then
        if rangeType == BATTLE_RANGE_TYPE.CIRCLE then
          ResourceManager.Instantiate(path, "", function(eff)
            if BattleControl.isOver == true then
              ResourceManager.DestroyGameObject(eff)
              return
            end
            local key = path .. "_" .. v.index
            unit.skillEffectList[key] = {effect = eff}
            local scale = rangeX * 2 / BattleScene.pixelsPerUnit / 2
            BattleResourceManager:AddGameObject(eff, 0, 0, 0, scale, scale, scale)
            SkillEffectsHelper.SetUnderfoot(eff, true, true)
            LuaUtil.SetTimeLineDuration(eff, totalFrame / BATTLE_CONFIG_ENUM.FIXED_FPS)
            if 2011 == targetType then
              local attackUid = unit:GetAttackTargetUid()
              local targetUnit = BattleScene.GetUnitByUid(attackUid)
              if targetUnit then
                SkillEffectsHelper.BindObject(eff, targetUnit.model)
              else
                unit:RemoveEffect(key, true)
              end
            elseif 2461 == targetType then
              local tempList = BattleChoose.GetContainEffectIdCards(unit, false, 1111)
              if tempList then
                if tempList[1] then
                  SkillEffectsHelper.BindObject(eff, tempList[1].model)
                else
                  unit:RemoveEffect(key, true)
                end
              end
            else
              SkillEffectsHelper.BindObject(eff, unit.model)
            end
          end)
        end
      elseif 2331 == targetType or 2540 == targetType then
        if rangeType == BATTLE_RANGE_TYPE.RECT_SELF_2_TARGET then
          ResourceManager.Instantiate(path, "", function(eff)
            if BattleControl.isOver == true then
              ResourceManager.DestroyGameObject(eff)
              return
            end
            local key = path .. "_" .. v.index
            unit.skillEffectList[key] = {effect = eff}
            local scaleX = rangeX / BattleScene.pixelsPerUnit / 2
            local scaleZ = rangeY / BattleScene.pixelsPerUnit / 2
            BattleResourceManager:AddGameObject(eff, 0, 0, 0, scaleX, 1, scaleZ)
            SkillEffectsHelper.SetUnderfoot(eff, true, true)
            LuaUtil.SetTimeLineDuration(eff, totalFrame / BATTLE_CONFIG_ENUM.FIXED_FPS)
            SkillEffectsHelper.SetRotationAroundY(eff, true)
            local uid = unit:GetAttackTargetUid()
            local target = BattleScene.GetUnitByUid(uid)
            if target then
              SkillEffectsHelper.BindObject(eff, unit.model, target.model or target.effectModel)
            end
          end)
        end
      elseif 2061 == targetType then
        if rangeType == BATTLE_RANGE_TYPE.FRONT_RECT then
          ResourceManager.Instantiate(path, "", function(eff)
            if BattleControl.isOver == true then
              ResourceManager.DestroyGameObject(eff)
              return
            end
            local key = path .. "_" .. v.index
            unit.skillEffectList[key] = {effect = eff}
            local scaleX = rangeX / BattleScene.pixelsPerUnit * (unit.isFlip and -1 or 1)
            local scaleZ = rangeY / BattleScene.pixelsPerUnit
            BattleResourceManager:AddGameObject(eff, 0, 0, 0, scaleX, 1, scaleZ)
            SkillEffectsHelper.SetUnderfoot(eff, true, true)
            LuaUtil.SetTimeLineDuration(eff, totalFrame / BATTLE_CONFIG_ENUM.FIXED_FPS)
            SkillEffectsHelper.SetRotationAroundY(eff, true)
            SkillEffectsHelper.BindObject(eff, unit.model)
          end)
        end
      elseif 2341 == targetType then
        if rangeType == BATTLE_RANGE_TYPE.RECT_SELF_2_TARGET then
          ResourceManager.Instantiate(path, "", function(eff)
            if BattleControl.isOver == true then
              ResourceManager.DestroyGameObject(eff)
              return
            end
            local key = path .. "_" .. v.index
            unit.skillEffectList[key] = {effect = eff}
            local scaleX = rangeX / BattleScene.pixelsPerUnit / 2
            local scaleZ = rangeY / BattleScene.pixelsPerUnit / 2
            BattleResourceManager:AddGameObject(eff, 0, 0, 0, scaleX, 1, scaleZ)
            SkillEffectsHelper.SetUnderfoot(eff, true, true)
            LuaUtil.SetTimeLineDuration(eff, totalFrame / BATTLE_CONFIG_ENUM.FIXED_FPS)
            SkillEffectsHelper.SetRotationAroundY(eff, true)
            local uid = unit:GetAttackTargetUid()
            local target = BattleScene.GetUnitByUid(uid)
            if target then
              SkillEffectsHelper.BindObject(eff, unit.model, target.model or target.effectModel)
            end
          end)
        end
      else
        local targetUidList = unit:GetTargetUidList()
        if #targetUidList > 0 then
          local targetUnitList = BattleScene.GetUnitListByUidList(targetUidList)
          local key = path .. "_" .. v.index
          local effectList = {}
          unit.skillEffectList[key] = {effectList = effectList}
          for _, targetUnit in ipairs(targetUnitList) do
            ResourceManager.Instantiate(path, "", function(eff)
              if BattleControl.isOver == true then
                ResourceManager.DestroyGameObject(eff)
                return
              end
              table.insert(effectList, eff)
              local scale = 80 / BattleScene.pixelsPerUnit / 2
              BattleResourceManager:AddGameObject(eff, 0, 0, 0, scale, scale, scale)
              SkillEffectsHelper.SetUnderfoot(eff, true, true)
              SkillEffectsHelper.BindObject(eff, targetUnit.model)
              LuaUtil.SetTimeLineDuration(eff, totalFrame / BATTLE_CONFIG_ENUM.FIXED_FPS)
            end)
          end
        end
      end
    end
    waitWarningEffectAction = {}
  end
end

local Shakable

function BattleActionDisplay.InitLocalVar()
  if CS and nil == Shakable then
    Shakable = CS.Shakable
  end
end

function BattleActionDisplay.PlayStart(battleUnit)
  battleUnit:ChangeAnimation(SPINE_STATE_ENUM.IDLE, true)
end

function BattleActionDisplay.PlayStand(battleUnit)
  if battleUnit.spineState == SPINE_STATE_ENUM.DIE then
    battleUnit:RemoveMotionState(BATTLE_MOTION_STATE_ENUM.DEAD)
    battleUnit:ChangeAnimation(SPINE_STATE_ENUM.UP, false, function()
      battleUnit:ChangeAnimation(SPINE_STATE_ENUM.IDLE, true)
    end)
  elseif BattleBuffMgr.ContainEffectId(battleUnit, BUFF_EFFECT_ID.TENACITY_IDLE) == true then
    battleUnit:ChangeAnimation("skill3_idle", true)
  else
    battleUnit:ChangeAnimation(SPINE_STATE_ENUM.IDLE, true)
  end
end

function BattleActionDisplay.PlayMove(battleUnit)
  battleUnit:SetPosition()
  battleUnit:ChangeAnimation(SPINE_STATE_ENUM.RUN, true)
end

function BattleActionDisplay.PlayWaitAttack(battleUnit)
  if battleUnit.waitAttackFrame and battleUnit.waitAttackFrame > 0 then
    battleUnit:ChangeAnimation(SPINE_STATE_ENUM.IDLE, true)
  end
end

function BattleActionDisplay.GetUnitRotation(targetUnit, fromUnit)
  local targetPosition = targetUnit.position
  local fromPosition = fromUnit.position
  if 0 == targetPosition.x - fromPosition.x then
    if targetPosition.z >= fromPosition.z then
      return 90
    else
      return -90
    end
  else
    local angle = math.atan((targetPosition.z - fromPosition.z) / (targetPosition.x - fromPosition.x)) * 180 / math.pi
    return angle
  end
end

function BattleActionDisplay.PlayAttack(battleUnit)
  if BattleScene.IsBattleOver() == true then
    return
  end
  local displayConfig = battleUnit.curSkillShowDisplayConfig
  if displayConfig then
    local buffChangeShow = displayConfig.buff_change_show
    if buffChangeShow then
      local splitStr = Split(buffChangeShow, ":")
      local effectId = tonumber(splitStr[1])
      local changeShowId
      if BattleBuffMgr.ContainEffectId(battleUnit, effectId) then
        changeShowId = tonumber(splitStr[2])
        displayConfig = TableData.GetConfig(changeShowId, "BaseSkillShowDisplay")
      end
    end
    local success = battleUnit:ChangeAnimation(displayConfig.spine_state, false, function()
      if BattleScene.IsBattleOver() == true and nil ~= battleUnit then
        battleUnit:ChangeAnimation(SPINE_STATE_ENUM.IDLE, true)
      end
    end, nil, nil)
    if success then
      local curSkillType = battleUnit.curSkill.type
      if curSkillType == SKILL_TYPE_ENUM.SMALL or curSkillType == SKILL_TYPE_ENUM.UNIQUE then
        BattleHurtNum.ShowBattleSkillTipsAni(battleUnit, curSkillType, battleUnit.curSkill.id)
      end
      if displayConfig.effect then
        battleUnit:CreateSkillEffect(displayConfig, EffectUtil.GetFullPath(displayConfig.effect))
        if displayConfig.remote_effect then
          local param = Split(displayConfig.remote_effect, ":")
          local disParam = tonumber(param[1])
          local path = param[2]
          local targetUidList = battleUnit:GetTargetUidList()
          if targetUidList and #targetUidList > 0 then
            for _, uid in ipairs(targetUidList) do
              local dis = battleUnit.cachedDistance[uid]
              if dis and disParam < dis then
                local target = BattleScene.GetUnitByUid(uid)
                if target then
                  ResourceManager.InstantiateAsync(EffectUtil.GetFullPath(path), function(eff)
                    if BattleControl.isOver == true then
                      ResourceManager.DestroyGameObject(eff)
                      return
                    end
                    local key = eff:GetInstanceID()
                    battleUnit.skillEffectList[key] = {effect = eff}
                    BattleResourceManager:AddGameObject(eff)
                    EffectUtil.Overturn(eff, battleUnit.isFlip)
                    SkillEffectsHelper.BindObject(eff, battleUnit.model, target.model)
                    EffectUtil.SetEffectSpeed(eff, battleUnit.modelTimeScale)
                    EffectUtil.SetAutoDestroyCallback(eff, function()
                      if BattleControl.isOver == true then
                        return
                      end
                      if eff then
                        battleUnit:RemoveEffect(key, true)
                      end
                    end)
                  end)
                end
              end
            end
          end
        end
      end
      if displayConfig.effect_target then
        local targetUidList = battleUnit:GetTargetUidList()
        if targetUidList and #targetUidList > 0 then
          local limit = displayConfig.effect_target_limit
          local mainSkillLevelUpConfig = battleUnit:GetSkillLevelUpConfig(battleUnit.curSkill.id)
          for index, uid in ipairs(targetUidList) do
            if limit and index > limit then
              break
            end
            local initDelayFrame = 0
            if mainSkillLevelUpConfig.bomb_interval_frame then
              initDelayFrame = mainSkillLevelUpConfig.bomb_interval_frame * (index - 1)
            end
            local target = BattleScene.GetUnitByUid(uid)
            if target then
              local showEffectFunc = function()
                ResourceManager.InstantiateAsync(EffectUtil.GetFullPath(displayConfig.effect_target), function(eff)
                  if BattleControl.isOver == true then
                    ResourceManager.DestroyGameObject(eff)
                    return
                  end
                  local attackSoundTargetList = battleUnit.attackSoundTargetList
                  if attackSoundTargetList and #attackSoundTargetList > 0 then
                    local soundPoint
                    for i = 1, #attackSoundTargetList do
                      soundPoint = attackSoundTargetList[i]
                      SoundUtil.PlaySfxInBattle(soundPoint.path, soundPoint.bank, target.model or target.effectModel)
                    end
                  end
                  local key = eff:GetInstanceID()
                  battleUnit.skillEffectList[key] = {effect = eff}
                  BattleResourceManager:AddGameObject(eff)
                  SkillEffectsHelper.BindObject(eff, nil, target.model)
                  if SkillEffectsHelper.IsRotationWithAttackDirection(eff) then
                    if battleUnit and target then
                      SkillEffectsHelper.UpdateHitEffectRotation(eff, battleUnit.model or battleUnit.effectModel, target.model or target.effectModel)
                    end
                  else
                    EffectUtil.Overturn(eff, battleUnit.isFlip)
                  end
                  EffectUtil.SetEffectSpeed(eff, battleUnit.modelTimeScale)
                  EffectUtil.SetAutoDestroyCallback(eff, function()
                    if BattleControl.isOver == true then
                      return
                    end
                    if eff then
                      battleUnit:RemoveEffect(key, true)
                    end
                  end)
                end)
              end
              if initDelayFrame > 0 then
                LeanTween.delayedCall(initDelayFrame / BATTLE_CONFIG_ENUM.FIXED_FPS, showEffectFunc)
              else
                showEffectFunc()
              end
            end
          end
        end
      end
      local path = displayConfig.effect_line or displayConfig.effect_line_underfoot
      if path then
        local targetUidList = battleUnit:GetTargetUidList()
        if targetUidList and #targetUidList > 0 then
          for _, uid in ipairs(targetUidList) do
            local target = BattleScene.GetUnitByUid(uid)
            if target then
              ResourceManager.InstantiateAsync(EffectUtil.GetFullPath(path), function(eff)
                if BattleControl.isOver == true then
                  ResourceManager.DestroyGameObject(eff)
                  return
                end
                local key = eff:GetInstanceID()
                battleUnit.skillEffectList[key] = {effect = eff}
                BattleResourceManager:AddGameObject(eff)
                if displayConfig.effect_line_underfoot then
                  SortingHelper.SetOrderInLayer(eff, BATTLE_CONFIG_ENUM.SORTING_ORDER_EFFECT_LINE)
                end
                local startPoints = displayConfig.start_points
                SkillEffectsHelper.BindObject(eff, battleUnit.model, target.model, startPoints and startPoints[1])
                EffectUtil.Overturn(eff, battleUnit.isFlip)
                EffectUtil.SetEffectSpeed(eff, battleUnit.modelTimeScale)
                EffectUtil.SetAutoDestroyCallback(eff, function()
                  if BattleControl.isOver == true then
                    return
                  end
                  if eff then
                    battleUnit:RemoveEffect(key, true)
                  end
                end)
              end)
            end
          end
        end
      end
    end
  end
end

function BattleActionDisplay.PlayDead(battleUnit)
  local success = battleUnit:ChangeAnimation(SPINE_STATE_ENUM.DIE, false)
  if success then
    battleUnit:AddMotionState(BATTLE_MOTION_STATE_ENUM.DEAD)
    BattleVoice.PlayVoice(battleUnit.uid, BUBBLE_TYPE_ENUM.DEATH)
  end
end

function BattleActionDisplay.PlayRevive(battleUnit)
  battleUnit:ChangeAnimation(SPINE_STATE_ENUM.DIE, false)
end

function BattleActionDisplay.PlayDestroy(battleUnit)
  if battleUnit.canDestroy == false then
    return
  end
  if battleUnit.messageBar ~= nil then
    battleUnit.messageBar:Hide()
  end
  local dissolveCallback = function(showDissolve)
    battleUnit.canDestroy = false
    if battleUnit.model == nil then
      return
    end
    SkeletonAnimationUtil.SetGhostEnable(battleUnit.model, false)
    if showDissolve then
      local time = 0.5
      local path = string.format("Assets/Art/TextureSingle/SpineEffect/dissolve%d.png", math.random(1, 10))
      SkeletonAnimationUtil.Dissolve(battleUnit.model, path, time, false == battleUnit.isBuilding)
      LeanTween.delayedCall(time, function()
        battleUnit:DestroyModel(true)
      end)
    else
      battleUnit:DestroyModel(true)
    end
    if battleUnit.showBossMessage then
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_BOSS_DIE)
    end
  end
  if false == battleUnit.isBuilding and battleUnit.model then
    if battleUnit.summonId and false == SkeletonAnimationUtil.ContainStatue(battleUnit.model, SPINE_STATE_ENUM.DIE) then
      dissolveCallback()
      return
    end
    local success = battleUnit:ChangeAnimation(SPINE_STATE_ENUM.DIE, false, function()
      dissolveCallback(true)
    end)
    if false == success then
      local trackEntry = SkeletonAnimationUtil.GetAnimationStateTrackEntry(battleUnit.model, 0, SPINE_STATE_ENUM.DIE)
      if trackEntry and false == trackEntry.IsComplete then
        function trackEntry.completeAction()
          dissolveCallback(true)
        end
      else
        dissolveCallback(true)
      end
    else
      BattleVoice.PlayVoice(battleUnit.uid, BUBBLE_TYPE_ENUM.DEATH)
      dissolveCallback(true)
    end
  else
    if battleUnit.isBuilding then
      if battleUnit.model then
        dissolveCallback(true)
      elseif battleUnit.effectModel then
        local time = SkillEffectsHelper.Disappear(battleUnit.effectModel)
        TimerUtil.setTimeout(time, function()
          battleUnit:DestroyModel(true)
        end)
      elseif battleUnit.effectModelList then
        local time = 0
        for i, v in ipairs(battleUnit.effectModelList) do
          time = math.max(time, SkillEffectsHelper.Disappear(v))
        end
        TimerUtil.setTimeout(time, function()
          battleUnit:DestroyModel(true)
        end)
      end
      return
    end
    dissolveCallback()
  end
end

function BattleActionDisplay.PlayStun(battleUnit)
  battleUnit:ChangeAnimation(SPINE_STATE_ENUM.DIZZY, true)
end

function BattleActionDisplay.PlayBeatBack(battleUnit)
  battleUnit:SetPosition()
  battleUnit:ChangeAnimation(SPINE_STATE_ENUM.HIT, false)
end

function BattleActionDisplay.PlayDevour(battleUnit)
  battleUnit:SetPosition()
  battleUnit:ChangeAnimation(SPINE_STATE_ENUM.HIT, false)
end

function BattleActionDisplay.PlayFear(battleUnit)
  battleUnit:SetPosition()
  battleUnit:ChangeAnimation(SPINE_STATE_ENUM.RUN, true)
end

function BattleActionDisplay.PlaySpecial(battleUnit)
  if battleUnit.id == SPECIAL_CARD_OR_MONSTER.HEI_YU and battleUnit.dealSpecialStateDisplay ~= true then
    battleUnit.dealSpecialStateDisplay = true
    local fashionId = battleUnit.fashionId
    local fashionIndex = fashionId % 10
    if battleUnit.cachedSummonUids then
      local uid = battleUnit.cachedSummonUids[1]
      if uid then
        local summonUnit = BattleScene.GetUnitByUid(uid)
        if fashionIndex > 2 then
          summonUnit:CreateEffect("FX_20713_1_draw", "Assets/Art/Effects/Prefab/20713_1/FX_20713_1_draw.prefab", true)
        else
          summonUnit:CreateEffect("FX_20713_draw", "Assets/Art/Effects/Prefab/20713/FX_20713_draw.prefab", true)
        end
      end
    end
    if fashionIndex > 2 then
      battleUnit:CreateEffect("skill4_disappear", "Assets/Art/Effects/Prefab/10061_1/FX_10061_1_skill4_disappear.prefab", true)
      SoundUtil.PlaySfxInBattle("event:/sfx/sfx_btl/10061-1/10061-1_4_dis", "bank:/sfx/sfx_btl/10061-1", battleUnit.model)
    else
      battleUnit:CreateEffect("skill4_disappear", "Assets/Art/Effects/Prefab/10061/FX_10061_skill4_disappear.prefab", true)
      SoundUtil.PlaySfxInBattle("event:/sfx/sfx_btl/10061/10061_4_dis", "bank:/sfx/sfx_btl/10061", battleUnit.model)
    end
    battleUnit:ChangeAnimation("skill4_disappear", false, function()
      battleUnit:SetPosition()
      if fashionIndex > 2 then
        battleUnit:CreateEffect("skill4_draw", "Assets/Art/Effects/Prefab/10061_1/FX_10061_1_skill4_draw.prefab", true)
        SoundUtil.PlaySfxInBattle("event:/sfx/sfx_btl/10061-1/10061-1_4_draw", "bank:/sfx/sfx_btl/10061-1", battleUnit.model)
      else
        battleUnit:CreateEffect("skill4_draw", "Assets/Art/Effects/Prefab/10061/FX_10061_skill4_draw.prefab", true)
        SoundUtil.PlaySfxInBattle("event:/sfx/sfx_btl/10061/10061_4_draw", "bank:/sfx/sfx_btl/10061", battleUnit.model)
      end
      battleUnit:ChangeAnimation("skill4_draw", false, function()
        battleUnit:SetPosition()
        if battleUnit.spineState == "skill4_draw" then
          battleUnit:ChangeAnimation(SPINE_STATE_ENUM.IDLE, true)
        end
      end)
    end)
  end
end

function BattleActionDisplay.PlayPersistCast(battleUnit)
  if battleUnit.isStun == true then
    battleUnit:ChangeAnimation(SPINE_STATE_ENUM.IDLE, true)
  else
    battleUnit:ChangeAnimation(SPINE_STATE_ENUM.SKILL_LOOP, true)
  end
end

function BattleActionDisplay.PlayHurt(battleUnit)
  local hurtList = battleUnit.savedHurtDisplayList
  if #hurtList > 0 then
    local info, num, hurtNumType, absorbHurt, hurtExtraParams, hurtEffectParams
    for i = #hurtList, 1, -1 do
      info = hurtList[i]
      num = info.num
      hurtNumType = info.displayType
      hurtExtraParams = info.hurtExtraParams
      hurtEffectParams = info.hurtEffectParams
      battleUnit.messageBar:UpdateHp(battleUnit)
      if hurtExtraParams then
        absorbHurt = hurtExtraParams.absorbHurt
      end
      local notDisplay = hurtExtraParams and hurtExtraParams.notDisplay
      if true ~= notDisplay then
        if num > 0 then
          if hurtEffectParams then
            local attackUnitUid = info.attackUnitUid
            local attackUnit = BattleScene.GetUnitByUid(attackUnitUid)
            BattleActionDisplay.PlayHitEffect(attackUnit, battleUnit, hurtEffectParams, info.hurtEffectFlip)
          end
          BattleHurtNum.ShowHurtNum(hurtNumType or HURT_NUM_ENUM.NOR_HURT, num, battleUnit, hurtExtraParams)
          if battleUnit.mixSkeleton == false then
            SkeletonAnimationUtil.TwinkleColor(battleUnit.model, Application.targetFrameRate / 3)
          end
          battleUnit:AddMotionState(BATTLE_MOTION_STATE_ENUM.HIT)
          local fashionConfig = battleUnit:GetFashionConfig()
          if fashionConfig and fashionConfig.spd_random_hit then
            BattleActionDisplay.PlayRandomHit(battleUnit, fashionConfig.spd_random_hit)
          end
        elseif num < 0 then
          BattleHurtNum.ShowHurtNum(hurtNumType or HURT_NUM_ENUM.NOR_TREATMENT, -num, battleUnit, hurtExtraParams)
          battleUnit:CreateEffect("upblood", BATTLE_RES_PATH.NORMAL_TREATMENT, true)
        elseif hurtNumType then
          if hurtNumType == HURT_NUM_ENUM.ABSORB_HURT then
            if hurtEffectParams then
              local attackUnitUid = info.attackUnitUid
              local attackUnit = BattleScene.GetUnitByUid(attackUnitUid)
              BattleActionDisplay.PlayHitEffect(attackUnit, battleUnit, hurtEffectParams, info.hurtEffectFlip)
            end
            BattleHurtNum.ShowHurtNum(hurtNumType, absorbHurt, battleUnit, hurtEffectParams)
          else
            BattleHurtNum.ShowHurtNum(hurtNumType, 0, battleUnit, hurtEffectParams)
          end
        end
      end
      if hurtEffectParams and hurtEffectParams.hitSound and hurtEffectParams.hitSound > 0 then
        local config = TableData.GetConfig(hurtEffectParams.hitSound, "BaseSoundPath")
        if config then
          SoundUtil.PlaySfxInBattle(config.path, config.bank, battleUnit.model or battleUnit.effectModel)
        end
      end
      table.remove(battleUnit.savedHurtDisplayList, i)
    end
  end
end

function BattleActionDisplay.PlayRandomHit(battleUnit, randomHit)
  local state = randomHit[math.random(1, #randomHit)]
  SkeletonAnimationUtil.SetAnimation(battleUnit.model, 1, state, false, function()
    SkeletonAnimationUtil.StopTrackIndex(battleUnit.model, 1)
  end)
end

function BattleActionDisplay.PlayRage(battleUnit)
  local rageList = battleUnit.savedRageDisplayList
  if #rageList > 0 then
    local info, num
    for i = #rageList, 1, -1 do
      info = rageList[i]
      num = info.num
      battleUnit.messageBar:UpdateRage(battleUnit)
      table.remove(battleUnit.savedRageDisplayList, i)
    end
  end
end

function BattleActionDisplay.PlayBuffWords(battleUnit)
  local wordsList = battleUnit.savedBuffWordsDisplayList
  if #wordsList > 0 then
    local info, path
    for i = #wordsList, 1, -1 do
      info = wordsList[i]
      path = info.path
      BattleHurtNum.ShowBuffWord(path, battleUnit)
      table.remove(battleUnit.savedBuffWordsDisplayList, i)
    end
  end
end

function BattleActionDisplay.PlayBuffEffect(battleUnit)
  local effectList = battleUnit.savedBuffEffectDisplayList
  if #effectList > 0 then
    local info, name, path, type, bindName
    for i = #effectList, 1, -1 do
      info = effectList[i]
      type = info.type
      name = info.name
      path = info.path
      bindName = info.bindName
      if type == BATTLE_OPERATION_TYPE.ADD then
        if bindName then
          battleUnit:CreateEffect(name, path, nil, nil, bindName)
        else
          battleUnit:CreateEffect(name, path)
        end
      elseif type == BATTLE_OPERATION_TYPE.DEL then
        battleUnit:RemoveEffect(name)
      end
      table.remove(battleUnit.savedBuffEffectDisplayList, i)
    end
  end
end

function BattleActionDisplay.PlayHitEffect(attackUnit, defUnit, hurtEffectParams, hurtEffectFlip)
  local hurtEffect, displayAttackUnit
  if hurtEffectParams.showDisplayConfig then
    if hurtEffectParams.isBullet then
      if hurtEffectParams.showDisplayConfig.bullet_hit_effect_list and hurtEffectParams.hurtIndex then
        hurtEffect = hurtEffectParams.showDisplayConfig.bullet_hit_effect_list[hurtEffectParams.hurtIndex]
      else
        hurtEffect = hurtEffectParams.showDisplayConfig.bullet_hit_effect
      end
      displayAttackUnit = BattleScene.GetUnitByUid(hurtEffectParams.fromUid)
    else
      if hurtEffectParams.showDisplayConfig.hit_effect_list and hurtEffectParams.hurtIndex then
        hurtEffect = hurtEffectParams.showDisplayConfig.hit_effect_list[hurtEffectParams.hurtIndex]
      else
        hurtEffect = hurtEffectParams.showDisplayConfig.hit_effect
      end
      displayAttackUnit = attackUnit
    end
  elseif hurtEffectParams.effectPath then
    hurtEffect = hurtEffectParams.effectPath
  end
  if hurtEffect and "" ~= hurtEffect then
    ResourceManager.InstantiateAsync(EffectUtil.GetFullPath(hurtEffect), function(eff)
      if BattleControl.isOver == true then
        ResourceManager.DestroyGameObject(eff)
        return
      end
      BattleResourceManager:AddGameObject(eff)
      local pos, slotName
      if SkillEffectsHelper.IsUsePositionZero(eff) then
        LuaUtil.SetLocalPositionAndRotation(eff, defUnit.position.x, defUnit.position.y, defUnit.position.z, 0, 0, 0)
      else
        local name = defUnit:GetHitPointName()
        pos = defUnit:GetPointPositionBySlotName(name)
        if pos then
          slotName = name
          LuaUtil.SetLocalPositionAndRotation(eff, pos.x, pos.y, pos.z, 0, 0, 0)
        else
          LuaUtil.SetLocalPositionAndRotation(eff, defUnit.position.x, defUnit.position.y, defUnit.position.z, 0, 0, 0)
        end
      end
      if SkillEffectsHelper.IsRotationWithAttackDirection(eff) then
        if displayAttackUnit and defUnit then
          SkillEffectsHelper.UpdateHitEffectRotation(eff, displayAttackUnit.model or displayAttackUnit.effectModel, defUnit.model or defUnit.effectModel)
        end
      elseif hurtEffectFlip then
        EffectUtil.Overturn(eff, true)
      else
        EffectUtil.Overturn(eff, false)
      end
      EffectUtil.SetAutoDestroyCallback(eff, function()
        if BattleControl.isOver == true then
          return
        end
        if eff then
          BattleResourceManager:DestroyGameObject(eff)
        end
      end)
    end)
  end
  if defUnit.isBuilding then
    Shakable.ShakeOnce(defUnit.model or defUnit.effectModel)
  end
end

function BattleActionDisplay.PlayBuffIconRefresh(battleUnit)
  if battleUnit.buffRefreshCurFrame then
    battleUnit:UpdateBuffIcon()
    battleUnit.buffRefreshCurFrame = nil
  end
end

function BattleActionDisplay.ClearAttackDisplay(battleUnit)
  battleUnit.spineState = nil
end

function BattleActionDisplay.ClearSkillEffect(battleUnit)
  battleUnit:RemoveAllSkillEffect()
end

function BattleActionDisplay.UpdateModelFlipWhenAttack(battleUnit)
  battleUnit:UpdateFlip()
end

function BattleActionDisplay.UpdateModelTimescale(battleUnit)
  if battleUnit.spineState == nil then
    return
  end
  battleUnit:UpdateModelTimeScale()
end

function BattleActionDisplay.UpdateControlDisplay(battleUnit, interval)
  if BattleMgr.isBattleServer == true then
    return
  end
  if battleUnit.model == nil then
    return
  end
  if battleUnit.isStealth then
    BattleActionDisplay.ShowStealthDisplay(battleUnit)
  elseif battleUnit.isFreeze then
    BattleActionDisplay.ShowFreezeDisplay(battleUnit)
  elseif battleUnit.isPetrified then
    BattleActionDisplay.ShowPetrifiedDisplay(battleUnit)
  else
    SkeletonAnimationUtil.SetSecondaryAlbedo(battleUnit.model, nil, 0, 0)
  end
end

function BattleActionDisplay.ShowStealthDisplay(battleUnit)
  SkeletonAnimationUtil.SetSecondaryAlbedo(battleUnit.model, "Assets/Art/TextureSingle/SpineEffect/stealth.png", 0.8, 0.3)
end

function BattleActionDisplay.ShowFreezeDisplay(battleUnit)
  SkeletonAnimationUtil.SetSecondaryAlbedo(battleUnit.model, "Assets/Art/TextureSingle/SpineEffect/freeze.png", 0.8, 0.3)
end

function BattleActionDisplay.ShowPetrifiedDisplay(battleUnit)
  SkeletonAnimationUtil.SetSecondaryAlbedo(battleUnit.model, "Assets/Art/TextureSingle/SpineEffect/petrified.png", 0.8, 0.3)
end

function BattleActionDisplay.PlayBeatBackTrapState(battleUnit, model, angle, z_dis)
  local stateName
  local isFlip = battleUnit.isFlip
  if angle <= 22.5 then
    stateName = isFlip and "left" or "right"
  elseif angle > 22.5 and angle <= 67.5 then
    if z_dis > 0 then
      stateName = isFlip and "up_left" or "up_right"
    else
      stateName = isFlip and "down_left" or "down_right"
    end
  elseif angle > 67.5 and angle <= 112.5 then
    if z_dis > 0 then
      stateName = "up"
    else
      stateName = "down"
    end
  elseif angle > 112.5 and angle <= 157.5 then
    if z_dis > 0 then
      stateName = isFlip and "up_right" or "up_left"
    else
      stateName = isFlip and "down_right" or "down_left"
    end
  else
    stateName = isFlip and "right" or "left"
  end
  local stateBackName = stateName .. "_back"
  SkeletonAnimationUtil.SetAnimation(model, 0, stateName, false, function()
    SkeletonAnimationUtil.SetAnimation(model, 0, stateBackName, false)
  end)
end

function BattleActionDisplay.PlayTransform(battleUnit, transformEffect, sound, callback, pause)
  if battleUnit.model == nil then
    return
  end
  if pause then
    BattleControl.Pause()
  end
  if sound then
    local soundPathConfig = TableData.GetConfig(sound, "BaseSoundPath")
    if soundPathConfig then
      SoundUtil.PlaySfxInBattle(soundPathConfig.path, soundPathConfig.bank, battleUnit.model or battleUnit.effectModel)
    end
  end
  local transformCallback = function(unit)
    callback(unit)
    if unit.monsterRank >= 3 then
      OpenWindow(WinResConfig.RageWindow.name, nil, unit)
    elseif pause then
      BattleControl.Continue()
    end
  end
  BattleActionDisplay.UpdateControlDisplay(battleUnit, 0)
  BattleActionDisplay.UpdateModelTimescale(battleUnit)
  battleUnit:ChangeModel(transformCallback, transformEffect)
  battleUnit.buffRefreshCurFrame = true
end
