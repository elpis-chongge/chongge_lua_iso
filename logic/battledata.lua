BattleData = {
  totalFixedFrames = 0,
  isAuto = false,
  speedIndex = 1,
  speedList = {},
  savedConfigPool = {},
  burstLeft = nil,
  burstRight = nil,
  battleCameraScale = nil,
  battleRootScale = nil,
  cachedChallengeStageRsp = {}
}
local randomSeeds
local curRandomIndex = 0
local curRandomIndex2 = 0
local randomSeedsCount = 0
local curAutoSkillRandomIndex = 0
local curChooseGridRandomIndex = 0
local curRandomIndexDisplay = 0

function BattleData.InitData(isClear)
  BattleData.stageId = nil
  BattleData.battleUid = nil
  BattleData.stageType = nil
  BattleData.buffList = {}
  BattleData.totalFixedFrames = 90 * BATTLE_CONFIG_ENUM.FIXED_FPS
  BattleData.rageTimeUpdate = nil
  BattleData.isAuto = false
  BattleData.isManuallySkillAuto = false
  BattleData.forceAuto = false
  BattleData.speedIndex = 1
  curRandomIndex = 0
  curRandomIndex2 = 0
  randomSeeds = nil
  randomSeedsCount = nil
  curRandomIndexDisplay = 0
  curAutoSkillRandomIndex = 0
  curChooseGridRandomIndex = 0
  BattleData.initData = {}
  BattleData.burstLeft = nil
  BattleData.burstRight = nil
  BattleData.burstOrderSettingLeft = nil
  BattleData.burstOrderSettingRight = nil
  BattleData.leaderCardIdLeft = nil
  BattleData.leaderCardIdRight = nil
  BattleData.savedBurstChooseCardInfos = {}
  BattleData.savedBurstCardSkillStartFrame = {}
  BattleData.savedSkillInfos = nil
  BattleData.savedManuallySkillInfos = nil
  BattleData.leftTotalDamage = 0
  BattleData.initRightTotalHP = 0
  BattleData.curRightTotalHP = 0
  BattleData.isMirror = false
  BattleData.addBuffId = nil
  BattleData.addBuffTotalCount = nil
  BattleData.addBuffAddCount = nil
  BattleData.scoreInfo = nil
  BattleData.totalKillScore = nil
  BattleData.totalDamageScore = nil
  BattleData.challengeTargetInfo = nil
  BattleData.curNeedScore = nil
  BattleData.rogueData = nil
  BattleData.guildWarData = nil
  BattleData.manuallySkillList = nil
  BattleData.maxMoveX = nil
  if nil == isClear then
    BattleData.killMobCount = 0
    BattleData.savedInitData = BattleData.InitBattleData.initData or BattleData.InitBattleData
    local initData = SimpleCopy(BattleData.savedInitData)
    BattleData.initData = initData
    BattleData.rageTimeUpdate = TableData.GetConfig(70010202, "BaseFixed").int_value
    BattleData.battleUid = initData.seqId
    BattleData.stageId = initData.stageId
    BattleData.stageType = initData.sceneType
    BattleData.simulate = initData.simulate
    if initData.buffs then
      local list = {}
      for _, v in ipairs(initData.buffs) do
        if v.value and v.value > 0 then
          table.insert(list, {
            preBuffId = v.key,
            count = v.value
          })
        end
      end
      if #list > 1 then
        table.sort(list, function(a, b)
          return a.preBuffId < b.preBuffId
        end)
      end
      BattleData.buffList = list
    else
      BattleData.buffList = {}
    end
    BattleData.curWaveIndex = initData.specialBattleIndex
    local stageConfig = TableData.GetConfig(initData.stageId, "BaseStage")
    BattleData.stageConfig = stageConfig
    if stageConfig then
      if stageConfig.challenge_condition then
        BattleData.challengeTargetInfo = {}
        for _, challengeId in ipairs(stageConfig.challenge_condition) do
          local challengeConfig = TableData.GetConfig(challengeId, "BaseStageChallenge")
          local condition = Split(challengeConfig.condition[1], ":")
          if "11" == condition[1] then
            local score = tonumber(condition[2])
            if score > 0 then
              if nil == BattleData.curNeedScore then
                BattleData.curNeedScore = score
              end
              table.insert(BattleData.challengeTargetInfo, {needScore = score, meet = false})
            end
          end
        end
      end
      if stageConfig.buff_add then
        BattleData.addBuffId = stageConfig.buff_add
        BattleData.addBuffTotalCount = 0
        local find = false
        local buffList = BattleData.buffList
        for _, buffData in ipairs(buffList) do
          if buffData.preBuffId == BattleData.addBuffId then
            BattleData.addBuffTotalCount = buffData.count
            find = true
          end
        end
        if false == find then
          buffList[#buffList + 1] = {
            preBuffId = stageConfig.buff_add,
            count = 0
          }
          BattleData.addBuffTotalCount = 0
        end
        BattleData.addBuffAddCount = 0
      end
      if stageConfig.score_factor then
        local scoreFactorList = stageConfig.score_factor
        BattleData.scoreInfo = {}
        BattleData.totalKillScore = 0
        BattleData.totalDamageScore = 0
        for i, id in ipairs(scoreFactorList) do
          local scoreConfig = TableData.GetConfig(id, "BaseStageScore")
          table.insert(BattleData.scoreInfo, {
            minFrame = scoreConfig.time_range[1],
            maxFrame = scoreConfig.time_range[2],
            phaseRate = scoreConfig.phase_rate,
            wave = scoreConfig.wave or 1,
            waveRate = scoreConfig.wave_rate or 0,
            monsterScore = scoreConfig.monster_score,
            damageScoreUnit = scoreConfig.damage_score and scoreConfig.damage_score[1] or 1,
            damageScore = scoreConfig.damage_score and scoreConfig.damage_score[2] or 0,
            haveBuffAdd = 1 == scoreConfig.buff_add,
            curWave = 0,
            damage = 0,
            killMonster = {
              0,
              0,
              0,
              0,
              0
            }
          })
        end
      end
      local sceneType = BattleData.stageType
      if initData.sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
        local guildWarData = initData.guildWarData
        if guildWarData and guildWarData.compensateTime > 0 then
          BattleData.totalFixedFrames = guildWarData.compensateTime * BATTLE_CONFIG_ENUM.FIXED_FPS
        elseif stageConfig.limit_frame then
          BattleData.totalFixedFrames = stageConfig.limit_frame
        end
      elseif initData.limitFrame and initData.limitFrame > 0 then
        BattleData.totalFixedFrames = initData.limitFrame
      elseif stageConfig.limit_frame then
        BattleData.totalFixedFrames = stageConfig.limit_frame
      end
      if stageConfig.buff_list then
        local buffList = BattleData.buffList
        for i = 1, #stageConfig.buff_list do
          buffList[#buffList + 1] = {
            preBuffId = stageConfig.buff_list[i],
            count = 1
          }
        end
      end
      if sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR and initData.guildWarData then
        BattleData.guildWarData = initData.guildWarData
        local skillList = initData.guildWarData.guildWarSkills
        BattleData.manuallySkillList = SimpleCopy(skillList)
      end
      if sceneType == ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE then
        BattleMgr.showLeftDamageCount = true
      elseif true == BattleData.IsGuildTrain(sceneType) then
        BattleMgr.showLeftDamageCount = true
      elseif sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
        BattleMgr.showLeftDamageCount = true
      end
      if sceneType == ProtoEnum.SCENE_TYPE.ROGUE then
        local rogueData = initData.rogueData
        if rogueData then
          local buffList = BattleData.buffList
          local difficultyId = rogueData.difficultyId
          if difficultyId then
            local difficultyConfig = TableData.GetConfig(difficultyId, "BaseRogueDifficulty")
            if difficultyConfig and difficultyConfig.buff_list then
              local buff_list = difficultyConfig.buff_list
              for i = 1, #buff_list do
                buffList[#buffList + 1] = {
                  preBuffId = buff_list[i],
                  count = 1
                }
              end
            end
          end
          local rogueTreasureIds = rogueData.rogueTreasureIds
          if rogueTreasureIds then
            for _, id in ipairs(rogueTreasureIds) do
              local config = TableData.GetConfig(id, "BaseRogueTreasure")
              if config then
                if config.buff_list then
                  local buff_list = config.buff_list
                  for i = 1, #buff_list do
                    buffList[#buffList + 1] = {
                      preBuffId = buff_list[i],
                      count = 1
                    }
                  end
                end
                if 13 == config.function_type then
                  local params = Split(Split(config.function_parameter, "|")[1], ":")
                  local buffId = tonumber(params[2])
                  buffList[#buffList + 1] = {preBuffId = buffId, count = 1}
                end
              end
            end
          end
          local rogueHolyIds = rogueData.rogueHolyIds
          if rogueHolyIds then
            for _, id in ipairs(rogueHolyIds) do
              local config = TableData.GetConfig(id, "BaseRogueHoly")
              if config and config.buff_list then
                local buff_list = config.buff_list
                for i = 1, #buff_list do
                  buffList[#buffList + 1] = {
                    preBuffId = buff_list[i],
                    count = 1
                  }
                end
              end
            end
          end
        end
        BattleData.rogueData = rogueData
      end
    elseif BattleData.stageType == ProtoEnum.SCENE_TYPE.ARENA then
      BattleData.totalFixedFrames = TableData.GetConfig(70010113, "BaseFixed").int_value
      local arenaMapId = BattleScene.GetArenaMapId()
      local arenaMapConfig = TableData.GetConfig(arenaMapId, "BaseArenaMap")
      if arenaMapConfig and arenaMapConfig.buff_list then
        local buffList = BattleData.buffList
        local buff_list = arenaMapConfig.buff_list
        for i = 1, #buff_list do
          buffList[#buffList + 1] = {
            preBuffId = buff_list[i],
            count = 1
          }
        end
      end
    end
    if true ~= BattleMgr.isBattleServer and BattleData.stageType then
      if BattleData.stageType == ProtoEnum.SCENE_TYPE.ARENA and initData.actorRight.uin == ActorData.GetUin() then
        BattleData.isMirror = true
      end
      if false == EnterClampUtil.WhetherToEnter(FEATURE_ENUM.BATTLE_AUTO, false) then
        BattleData.isAuto = false
      else
        ld("Formation")
        local curStageType = FormationMgr.GetPrepareSceneType(BattleData.stageType)
        local isAuto = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.BATTLE_AUTO_SKILL, PLAYER_PREF_DEFAULT_VALUE.BATTLE_AUTO_SKILL, curStageType)
        BattleData.isAuto = 1 == isAuto
      end
      if BattleData.stageType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
        ld("Formation")
        local curStageType = FormationMgr.GetPrepareSceneType(BattleData.stageType)
        local isAuto = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.BATTLE_AUTO_MANUALLY_SKILL, PLAYER_PREF_DEFAULT_VALUE.BATTLE_AUTO_MANUALLY_SKILL, curStageType)
        BattleData.isManuallySkillAuto = 1 == isAuto
      end
      if false == EnterClampUtil.WhetherToEnter(FEATURE_ENUM.BATTLE_SPEED_UP, false) then
        BattleData.speedIndex = 2
      else
        ld("Formation")
        local curStageType = FormationMgr.GetPrepareSceneType(BattleData.stageType)
        local speed = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.BATTLE_SPEED, PLAYER_PREF_DEFAULT_VALUE.BATTLE_SPEED, curStageType)
        if BattleData.speedList[speed] then
          BattleData.speedIndex = speed
        else
          BattleData.speedIndex = 1
        end
      end
    end
    if initData.isAuto then
      BattleData.isAuto = true
      if BattleData.stageType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
        BattleData.isManuallySkillAuto = true
      end
    end
    if BattleData.stageType == ProtoEnum.SCENE_TYPE.ARENA then
      BattleData.isAuto = true
      BattleData.forceAuto = true
      if false == BattleMgr.isBattleServer and BattleData.InitBattleData then
        BattleData.savedSkillInfos = BattleData.InitBattleData.skillInfos
      end
    elseif BattleData.stageType == ProtoEnum.SCENE_TYPE.GUILD_WAR and BattleMgr.isPlayback and false == BattleMgr.isBattleServer and BattleData.InitBattleData then
      BattleData.savedSkillInfos = BattleData.InitBattleData.skillInfos
      BattleData.savedManuallySkillInfos = BattleData.InitBattleData.manuallySkillInfos
    end
    if true == BattleMgr.isBattleServer and true == initData.quickBattle then
      BattleData.isAuto = true
      BattleData.forceAuto = true
    end
    if BattleData.isAuto ~= true and true == BattleMgr.isBattleServer and BattleData.SavedCompleteData then
      BattleData.savedSkillInfos = BattleData.SavedCompleteData.skillInfos
      BattleData.savedManuallySkillInfos = BattleData.SavedCompleteData.manuallySkillInfos
    end
    if BattleData.isMirror then
      BattleData.burstLeft = initData.actorRight.burstId
      BattleData.burstRight = initData.actorLeft.burstId
      BattleData.burstOrderSettingLeft = initData.actorRight.burstOrderSetting
      BattleData.burstOrderSettingRight = initData.actorLeft.burstOrderSetting
      BattleData.leaderCardIdLeft = initData.actorRight.leaderCardId or 0
      BattleData.leaderCardIdRight = initData.actorLeft.leaderCardId or 0
    else
      BattleData.burstLeft = initData.actorLeft.burstId
      BattleData.burstRight = initData.actorRight.burstId
      BattleData.burstOrderSettingLeft = initData.actorLeft.burstOrderSetting
      BattleData.burstOrderSettingRight = initData.actorRight.burstOrderSetting
      BattleData.leaderCardIdLeft = initData.actorLeft.leaderCardId or 0
      BattleData.leaderCardIdRight = initData.actorRight.leaderCardId or 0
    end
    randomSeeds = initData.randomSeeds
    if nil == randomSeeds or 0 == #randomSeeds then
      randomSeeds = {}
      for i = 1, 50 do
        table.insert(randomSeeds, math.random(1, 10000))
      end
    end
    randomSeedsCount = #randomSeeds
  end
  BattleData.savedConfigPool = {}
end

function BattleData.GetAllUnitData()
  local curUnitDataList = {}
  local initData = BattleData.initData
  local teamLeft = initData.actorLeft.unitList
  local teamRight = initData.actorRight.unitList
  local teamNeutral
  if initData.neutral then
    teamNeutral = initData.neutral.unitList
  end
  local clientTeamRight, clientTeamNeutral
  local groupId = initData.actorRight.monsterGroupId
  if groupId and 0 ~= groupId then
    clientTeamRight = {}
    clientTeamNeutral = {}
    local groupConfig = TableData.GetConfig(groupId, "BaseMonsterGroup")
    local monster_list = groupConfig.monster_list or {}
    local pos
    for i = 1, #monster_list do
      local unit = CardData.CreateClientUnit(monster_list[i])
      pos = groupConfig.monster_site[i]
      unit.uin = initData.actorRight.uin
      unit.pos = pos
      clientTeamRight[#clientTeamRight + 1] = unit
    end
    local building_list = groupConfig.building_list or {}
    local building_camp = groupConfig.building_camp or {}
    local buildingConfig, monsterId, buildingId
    for i = 1, #building_list do
      buildingId = building_list[i]
      buildingConfig = TableData.GetConfig(buildingId, "BaseBuilding")
      monsterId = buildingConfig.monster_id
      local unit = CardData.CreateClientUnit(monsterId)
      pos = groupConfig.building_site[i]
      unit.id = buildingId
      unit.pos = pos
      if building_camp[i] == BATTLE_CAMP_FLAG.LEFT then
        unit.uin = initData.actorLeft.uin
        teamLeft[#teamLeft + 1] = unit
      elseif building_camp[i] == BATTLE_CAMP_FLAG.RIGHT then
        unit.uin = initData.actorRight.uin
        clientTeamRight[#clientTeamRight + 1] = unit
      elseif building_camp[i] == BATTLE_CAMP_FLAG.NEUTRAL then
        unit.uin = 0
        clientTeamNeutral[#clientTeamNeutral + 1] = unit
      end
    end
    local v, clientRight
    for i = 1, #teamRight do
      v = teamRight[i]
      for j = 1, #clientTeamRight do
        clientRight = clientTeamRight[j]
        if v.id == clientRight.id and v.pos == clientRight.pos then
          clientRight.hp = v.hp
          clientRight.maxHp = v.maxHp
        end
      end
    end
  end
  for i = 1, #teamLeft do
    local v = teamLeft[i]
    v.camp = BATTLE_CAMP_FLAG.LEFT
    if v.hp == nil or v.hp > 0 then
      curUnitDataList[#curUnitDataList + 1] = v
    end
  end
  if clientTeamRight then
    for i = 1, #clientTeamRight do
      local v = clientTeamRight[i]
      v.camp = BATTLE_CAMP_FLAG.RIGHT
      if v.hp == nil or v.hp > 0 then
        curUnitDataList[#curUnitDataList + 1] = v
      end
    end
  else
    for i = 1, #teamRight do
      local v = teamRight[i]
      v.camp = BATTLE_CAMP_FLAG.RIGHT
      local buildingConfig = TableData.GetConfig(v.id, "BaseBuilding")
      if buildingConfig or v.hp == nil or v.hp > 0 then
        curUnitDataList[#curUnitDataList + 1] = v
      end
    end
  end
  if clientTeamNeutral then
    for i = 1, #clientTeamNeutral do
      local v = clientTeamNeutral[i]
      v.camp = BATTLE_CAMP_FLAG.NEUTRAL
      if v.hp == nil or v.hp > 0 then
        curUnitDataList[#curUnitDataList + 1] = v
      end
    end
  elseif teamNeutral then
    for i = 1, #teamNeutral do
      local v = teamNeutral[i]
      v.camp = BATTLE_CAMP_FLAG.NEUTRAL
      if v.hp == nil or v.hp > 0 then
        curUnitDataList[#curUnitDataList + 1] = v
      end
    end
  end
  if BattleData.isMirror then
    for _, unit in ipairs(curUnitDataList) do
      unit.pos = BattleScene.GetMirrorPos(unit.pos)
      if unit.camp == BATTLE_CAMP_FLAG.LEFT then
        unit.camp = BATTLE_CAMP_FLAG.RIGHT
      elseif unit.camp == BATTLE_CAMP_FLAG.RIGHT then
        unit.camp = BATTLE_CAMP_FLAG.LEFT
      end
    end
  end
  BattleData.SortUnitListInit(curUnitDataList)
  return curUnitDataList
end

function BattleData.SortUnitListInit(list)
  local typeA, typeB
  local campLeft = BATTLE_CAMP_FLAG.LEFT
  local campRight = BATTLE_CAMP_FLAG.RIGHT
  table.sort(list, function(a, b)
    if a == b then
      return false
    end
    if a.camp ~= b.camp then
      if BattleData.stageType == ProtoEnum.SCENE_TYPE.ARENA and BattleData.isMirror == false then
        return a.camp > b.camp
      else
        return a.camp < b.camp
      end
    else
      local cardA, isMonsterA, isBuildingA = CardData.GetBaseConfig(a.id)
      local cardB, isMonsterB, isBuildingB = CardData.GetBaseConfig(b.id)
      typeA = false == isBuildingA and cardA.type or 999
      typeB = false == isBuildingB and cardB.type or 999
      if typeA ~= typeB then
        return typeA < typeB
      else
        local a_posX = math.floor(a.pos / 100)
        local a_posY = a.pos % 100
        local b_posX = math.floor(b.pos / 100)
        local b_posY = b.pos % 100
        if a.camp == campLeft then
          if a_posX == b_posX then
            return a_posY < b_posY
          else
            return a_posX > b_posX
          end
        elseif a.camp == campRight then
          if a_posX == b_posX then
            return a_posY < b_posY
          else
            return a_posX < b_posX
          end
        end
      end
    end
  end)
end

function BattleData.GetRandomForChooseGrid()
  if curChooseGridRandomIndex >= randomSeedsCount then
    curChooseGridRandomIndex = 1
  else
    curChooseGridRandomIndex = curChooseGridRandomIndex + 1
  end
  return randomSeeds[curChooseGridRandomIndex]
end

function BattleData.GetRandomSeed()
  if curRandomIndex >= randomSeedsCount then
    curRandomIndex = 1
  else
    curRandomIndex = curRandomIndex + 1
  end
  return randomSeeds[curRandomIndex]
end

function BattleData.GetRandomSeed2()
  if curRandomIndex2 >= randomSeedsCount then
    curRandomIndex2 = 1
  else
    curRandomIndex2 = curRandomIndex2 + 1
  end
  return randomSeeds[curRandomIndex2]
end

function BattleData.GetRandomForAutoSkill()
  if curAutoSkillRandomIndex >= randomSeedsCount then
    curAutoSkillRandomIndex = 1
  else
    curAutoSkillRandomIndex = curAutoSkillRandomIndex + 1
  end
  return randomSeeds[curAutoSkillRandomIndex]
end

function BattleData.GetRandomForDisplay()
  if curRandomIndexDisplay >= randomSeedsCount then
    curRandomIndexDisplay = 1
  else
    curRandomIndexDisplay = curRandomIndexDisplay + 1
  end
  return randomSeeds[curRandomIndexDisplay]
end

function BattleData.IsBattleNoFail(sceneType)
  return BattleData.IsGuildTrain(sceneType) or sceneType == ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE or sceneType == ProtoEnum.SCENE_TYPE.BUFF_STAGE or sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR
end

function BattleData.IsBattlePVP(sceneType)
  return sceneType == ProtoEnum.SCENE_TYPE.ARENA
end

function BattleData.IsGuildTrain(sceneType)
  return sceneType == ProtoEnum.SCENE_TYPE.GUILD_PRACTICE_NONE or sceneType == ProtoEnum.SCENE_TYPE.GUILD_PRACTICE_WATER or sceneType == ProtoEnum.SCENE_TYPE.GUILD_PRACTICE_FIRE or sceneType == ProtoEnum.SCENE_TYPE.GUILD_PRACTICE_WOOD or sceneType == ProtoEnum.SCENE_TYPE.GUILD_PRACTICE_LIGHT or sceneType == ProtoEnum.SCENE_TYPE.GUILD_PRACTICE_DARK
end

function BattleData.IsEffectSkill(skillEffectType)
  return 2 == skillEffectType or 3 == skillEffectType or 6 == skillEffectType
end

function BattleData.Clear()
  BattleData.InitData(true)
end

function BattleData.CacheChallengeStageRsp(data)
  if nil == data then
    return
  end
  local cachedChallengeStageRsp = BattleData.cachedChallengeStageRsp
  for i, v in ipairs(cachedChallengeStageRsp) do
    if data.battleData.initData.seqId == v.battleData.initData.seqId then
      return
    end
  end
  table.insert(cachedChallengeStageRsp, data)
end

function BattleData.ClearCachedChallengeStageRsp()
  BattleData.cachedChallengeStageRsp = {}
end

function BattleData.UpdateBattleScore(unit, damage)
  local scoreInfo = BattleData.scoreInfo
  if scoreInfo then
    local score = 0
    local curFixedTime = BattleControl.curFixedFrame
    if unit then
      for i, v in ipairs(scoreInfo) do
        if curFixedTime < v.maxFrame and curFixedTime >= v.minFrame then
          score = v.monsterScore[unit.monsterRank + 1] * (v.phaseRate + math.floor((v.curWave - 1) / v.wave) * v.waveRate) / 10000
          break
        end
      end
      local addScore = math.floor(score)
      BattleData.totalKillScore = BattleData.totalKillScore + addScore
      print_battle("战斗积分：最新积分：", BattleData.totalKillScore + BattleData.totalDamageScore, "增加 击杀 积分：", addScore)
    elseif damage then
      for i, v in ipairs(scoreInfo) do
        if curFixedTime < v.maxFrame and curFixedTime >= v.minFrame then
          v.damage = v.damage + damage
        end
        score = score + v.damageScore * v.damage / v.damageScoreUnit
      end
      local addScore = math.floor(score) - BattleData.totalDamageScore
      BattleData.totalDamageScore = BattleData.totalDamageScore + addScore
      print_battle("战斗积分：最新积分：", BattleData.totalKillScore + BattleData.totalDamageScore, "增加 伤害 积分：", addScore)
    end
  end
end

function BattleData.GetRogueAliveCountByType(unitType)
  local count = 0
  if BattleData.rogueData then
    local aliveCardCounts = BattleData.rogueData.aliveCardCounts
    if aliveCardCounts then
      for i, v in ipairs(aliveCardCounts) do
        if v.key == unitType then
          count = v.value
          break
        end
      end
    end
  end
  return count
end
