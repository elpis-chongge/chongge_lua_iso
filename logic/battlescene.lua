BattleScene = {}
local _skillInfos = {}
local _manuallySkillInfos = {}
local _allUnit = {}
local _allAliveUnit = {}
local _allBulletUid = {}
local _allBombUid = {}
local _allBulletUidCopy = {}
local sortBulletListChanged
local _allBombUidCopy = {}
local sortBombListChanged
local _cachedPartnerTriggerCondition = {}
local _cachedEnemyTriggerCondition = {}
local _cachedCardBurstTimerUtilList = {}
local _allBurst = {}
local _allBurstByCamp = {}
local _allCamp = {}
local _allManuallySkill = {}
local _manuallySkillByCamp = {}
local _manuallySkillByUid = {}
local _bulletByUid = {}
local _bombByUid = {}
local _triggerTrap = {}
local _unitByUid = {}
local _gridByUid = {}
local _gridByCamp = {}
local _unitByCamp = {}
local _leftUnitCount = 0
local _leftDeadUnitCount = 0
local _leftUnitCount_NotSummon = 0
local _leftDeadUnitCount_NotSummon = 0
local _rightUnitCount = 0
local _rightDeadUnitCount = 0
local _rightUnitCount_NotSummon = 0
local _rightDeadUnitCount_NotSummon = 0
local _rightUnitCountByRank = {}
local _rightDeadUnitCountByRank = {}
local _winCondition, _winConditionParam
local _isBattleWin = false
local _isBattleLoss = false
local _mapId
local _mapArray = {}
local _mapXCount, _mapYCount, _leftCampXCount, _leftCampYCount, _rightCampXCount, _rightCampYCount
local _allGird = {}
local _initX = 0
local _initY = 0
local _space = 0
local _ceilLength = 80
local _pixelsPerUnit = 0
local t_remove = table.remove
local t_sort = table.sort
local abs = math.abs
local _bulletGlobalIndex = 1
local _bombGlobalIndex = 1
local _unitGlobalIndex = 10000
local _gridUnitGlobalIndex = 1
local _manuallySkillGlobalIndex = 100000
local BATTLE_WIN_CONDITION_TYPE = BATTLE_WIN_CONDITION_TYPE
local BATTLE_UNIT_TYPE = BATTLE_UNIT_TYPE
local BATTLE_RANGE_TYPE = BATTLE_RANGE_TYPE
local SKILL_DIRECTION = SKILL_DIRECTION
local burstBlackEffect, burstPostEffect, burstChangeEffect, charShowEffect, cardShowSpine
local ceil = math.ceil

function BattleScene.InitLocalVar()
end

function BattleScene.Init()
  BattleScene.InitBase()
  BattleScene.InitMap()
  BattleScene.InitAreaData()
  BattleOperation.Init()
  if BattleMgr.isBattleServer ~= true then
    local callback = function()
      if UIMgr:IsWindowOpen(WinResConfig.FormationWindow.name) then
        UIMgr:CloseWindow(WinResConfig.FormationWindow.name, true, true, false)
      end
      BattleScene.InitBg()
      BattleScene.InitUI()
      BattleHurtNum.Init()
      BattleScene.InitBullet()
      BattleScene.InitUnit()
      BattleScene.InitBomb()
      BattleScene.InitBurst()
      BattleScene.InitManuallySkill()
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_UPDATE_MANUALLY_SKILL, true)
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_UPDATE_BURST)
    end
    if BattleData.curWaveIndex and BattleData.curWaveIndex > 1 then
      callback()
    else
      UIUtil.ChangeBattleScreenEffectIn(callback)
    end
  else
    BattleScene.InitBullet()
    BattleScene.InitUnit()
    BattleScene.InitBomb()
    BattleScene.InitBurst()
    BattleScene.InitManuallySkill()
  end
end

function BattleScene.GetMapId()
  return _mapId
end

function BattleScene.GetArenaMapId()
  if BattleData.stageType == ProtoEnum.SCENE_TYPE.ARENA then
    local initData = BattleData.initData
    return initData.mapId
  end
end

function BattleScene.InitBase()
  _winCondition = nil
  _winConditionParam = nil
  _isBattleWin = false
  _isBattleLoss = false
  _mapId = nil
  _mapArray = {}
  _mapXCount = nil
  _mapYCount = nil
  _leftCampXCount = nil
  _leftCampYCount = nil
  _rightCampXCount = nil
  _rightCampYCount = nil
  _initX = 0
  _initY = 0
  _space = 0
  _ceilLength = 80
  _pixelsPerUnit = 0
  _allGird = {}
end

function BattleScene.InitMap()
  _pixelsPerUnit = 15
  BattleScene.pixelsPerUnit = _pixelsPerUnit
  BattleScene.ceilLength = _ceilLength
  _space = MathUtil.TruncateFloat(_ceilLength / _pixelsPerUnit)
  local stageConfig = TableData.GetConfig(BattleData.stageId, "BaseStage")
  if stageConfig then
    local initData = BattleData.initData
    if initData.sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
      local expeditionMapId = stageConfig.expedition_map_list[initData.specialBattleIndex]
      local expeditionConfig = TableData.GetConfig(expeditionMapId, "BaseExpeditionMap")
      _mapId = expeditionConfig.map_id
    else
      _mapId = stageConfig.map_id
    end
    local condition = Split(stageConfig.win_condition, "::")
    _winCondition = tonumber(condition[1])
    _winConditionParam = tonumber(condition[2] or 0)
  else
    local initData = BattleData.initData
    if initData.sceneType == ProtoEnum.SCENE_TYPE.ARENA then
      local arenaMapConfig = TableData.GetConfig(initData.mapId, "BaseArenaMap")
      _mapId = arenaMapConfig.map_id
    else
      _mapId = initData.mapId or 1
    end
    _winCondition = BATTLE_WIN_CONDITION_TYPE.KILL_ENEMY_ALL
  end
  local mapConfig = TableData.GetConfig(_mapId, "BaseMap")
  if mapConfig then
    _leftCampXCount = mapConfig.size_own[1]
    _leftCampYCount = mapConfig.size_own[2]
    _rightCampXCount = mapConfig.size_enemy[1]
    _rightCampYCount = mapConfig.size_enemy[2]
    local sizeX = mapConfig.size[1]
    local sizeY = mapConfig.size[2]
    _mapXCount = sizeX
    _mapYCount = sizeY
    _initX = -MathUtil.TruncateFloat(_mapXCount * _space / 2)
    _initY = MathUtil.TruncateFloat(_mapYCount * _space / 2)
    BattleScene.initX = _initX
    BattleScene.initY = _initY
    if mapConfig.max_move_x then
      BattleData.maxMoveX = tonumber(mapConfig.max_move_x)
    end
    if BattleMgr.isBattleServer ~= true then
      local scale = Const.gridScaleTable[sizeY] * BattleData.battleCameraScale * Const.cardScale
      BattleData.battleRootScale = scale
      BattleResourceManager:SetBattleRootScale(scale)
      BattleShow:AddChangeShaderExclude("FairyGUI/Text")
    end
    _mapArray = {}
    local camp
    local campLeft = BATTLE_CAMP_FLAG.LEFT
    local campRight = BATTLE_CAMP_FLAG.RIGHT
    local campNeutral = BATTLE_CAMP_FLAG.NEUTRAL
    _gridByCamp = {
      [campLeft] = {},
      [campRight] = {},
      [campNeutral] = {}
    }
    for i = 1, sizeX do
      _mapArray[i] = {}
      if i <= _leftCampXCount then
        camp = BattleData.isMirror and campRight or campLeft
      elseif i > _mapXCount - _rightCampXCount then
        camp = BattleData.isMirror and campLeft or campRight
      else
        camp = campNeutral
      end
      for j = 1, sizeY do
        _mapArray[i][j] = {}
        local grid = BattleUnit.NewUnit({
          uid = _gridUnitGlobalIndex,
          isGrid = true,
          positionIndexX = i,
          positionIndexY = j,
          positionIndex = i * 100 + j,
          camp = camp
        })
        table.insert(_allGird, grid)
        table.insert(_gridByCamp[camp], grid)
        _gridByUid[_gridUnitGlobalIndex] = grid
        _gridUnitGlobalIndex = _gridUnitGlobalIndex + 1
      end
    end
  end
end

function BattleScene.InitAreaData()
end

function BattleScene.GetSpace()
  return _space
end

function BattleScene.GetMapArray()
  return _mapArray
end

function BattleScene.GetNoCoverGrid()
  local gridList = {}
  local coverdGripMap = {}
  local position, radius, radiusX, radiusY, indexX, indexY
  for i = 1, #_allAliveUnit do
    local v = _allAliveUnit[i]
    if v:IsDestroy() == false then
      radius = v.coverRadius
      radiusX = radius.r and radius.r * 2 or radius.halfW * 2
      radiusY = radius.r and radius.r * 2 or radius.halfH * 2
      local _needGridX = ceil(MathUtil.TruncateFloat(radiusX / _ceilLength))
      local _needGridY = ceil(MathUtil.TruncateFloat(radiusY / _ceilLength))
      position = v.position
      indexX = ceil(MathUtil.TruncateFloat((position.x - _initX) * _pixelsPerUnit / _ceilLength))
      indexY = ceil(MathUtil.TruncateFloat(-(position.z - _initY) * _pixelsPerUnit / _ceilLength))
      if _needGridX > 1 then
        indexX = indexX - ceil(_needGridX - 1) / 2
      end
      if _needGridY > 1 then
        indexY = indexY - ceil(_needGridY - 1) / 2
      end
      for x_off = 1, _needGridX do
        for y_off = 1, _needGridY do
          local index = (indexX + x_off - 1) * 100 + indexY + y_off - 1
          if nil == coverdGripMap[index] then
            coverdGripMap[index] = 1
          end
        end
      end
    end
  end
  for x = 1, #_mapArray do
    local xArray = _mapArray[x]
    for y = 1, #xArray do
      local index = x * 100 + y
      if nil == coverdGripMap[index] then
        gridList[#gridList + 1] = index
      end
    end
  end
  return gridList
end

function BattleScene.GetMapXCount()
  return _mapXCount
end

function BattleScene.GetLeftCampXCount()
  return _leftCampXCount
end

function BattleScene.GetRightCampXCount()
  return _rightCampXCount
end

function BattleScene.GetInitPosition(posIndex, radiusX, radiusY)
  if BattleData.isMirror then
    posIndex = BattleScene.GetMirrorPos(posIndex)
  end
  local x, y, z
  local yIndex = abs(posIndex) % 100
  local xIndex = math.floor(posIndex / 100)
  if radiusX and radiusY then
    local _needGridX = ceil(MathUtil.TruncateFloat(radiusX / _ceilLength))
    local _needGridY = ceil(MathUtil.TruncateFloat(radiusY / _ceilLength))
    if 0 == _needGridX % 2 then
      x = _initX + xIndex * _space
    else
      x = _initX + (xIndex - 0.5) * _space
    end
    if 0 == _needGridY % 2 then
      y = _initY - (yIndex - 1) * _space
    else
      y = _initY - (yIndex - 0.5) * _space
    end
  else
    x = _initX + (xIndex - 0.5) * _space
    y = _initY - (yIndex - 0.5) * _space
  end
  local angle = math.rad(BATTLE_CONFIG_ENUM.BACKGROUND_ROTATION_X)
  z = y * math.sin(angle)
  y = y * math.cos(angle)
  if BattleData.isMirror then
    x = -x
  end
  return x, y, z
end

function BattleScene.InitBg()
  BattleBackground.Init()
end

function BattleScene.InitUI()
  if UIMgr:IsWindowOpen(WinResConfig.BattleUIWindow.name) == false then
    OpenWindow(WinResConfig.BattleUIWindow.name)
  end
end

function BattleScene.InitBullet()
  _bulletGlobalIndex = 1
  _bulletByUid = {}
  _allBulletUid = {}
  sortBulletListChanged = true
  _allBulletUidCopy = {}
end

function BattleScene.InitBomb()
  _bombGlobalIndex = 1
  _allBombUid = {}
  _bombByUid = {}
  sortBombListChanged = true
  _allBombUidCopy = {}
end

function BattleScene.InitUnit()
  _unitGlobalIndex = 10000
  _gridUnitGlobalIndex = 1
  _leftUnitCount = 0
  _leftUnitCount_NotSummon = 0
  _leftDeadUnitCount = 0
  _leftDeadUnitCount_NotSummon = 0
  _rightUnitCount = 0
  _rightUnitCount_NotSummon = 0
  _rightDeadUnitCount = 0
  _rightDeadUnitCount_NotSummon = 0
  _rightUnitCountByRank = {}
  _rightDeadUnitCountByRank = {}
  for i, v in pairs(BATTLE_MONSTER_RANK) do
    _rightUnitCountByRank[v] = 0
    _rightDeadUnitCountByRank[v] = 0
  end
  _allUnit = {}
  _allAliveUnit = {}
  _cachedPartnerTriggerCondition = {
    [BATTLE_CAMP_FLAG.LEFT] = {},
    [BATTLE_CAMP_FLAG.RIGHT] = {},
    [BATTLE_CAMP_FLAG.NEUTRAL] = {}
  }
  _cachedEnemyTriggerCondition = {
    [BATTLE_CAMP_FLAG.LEFT] = {},
    [BATTLE_CAMP_FLAG.RIGHT] = {},
    [BATTLE_CAMP_FLAG.NEUTRAL] = {}
  }
  local campTable = {
    BATTLE_CAMP_FLAG.LEFT,
    BATTLE_CAMP_FLAG.RIGHT,
    BATTLE_CAMP_FLAG.NEUTRAL
  }
  for i = 1, #campTable do
    local camp = campTable[i]
    _unitByCamp[camp] = {}
    _allCamp[camp] = BattleCamp.NewCamp(camp)
  end
  _unitByUid = {}
  _triggerTrap = {}
  local allUnitData = BattleData.GetAllUnitData()
  local unit, v
  for i = 1, #allUnitData do
    v = allUnitData[i]
    unit = BattleScene.AddUnit(v)
    if v.uid == "" then
      v.uid = unit.uid
    end
  end
  for _, k in ipairs(_allUnit) do
    local campList = _unitByCamp[k.camp]
    campList[#campList + 1] = k
  end
  if BattleMgr.isBattleServer == false and BattleData.stageType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
    local campRightUnitList = BattleScene.GetUnitListByCampDirect(BATTLE_CAMP_FLAG.RIGHT)
    local hp = 0
    for _, _unit in ipairs(campRightUnitList) do
      if _unit.summonId == nil then
        local config, isMonster = _unit:GetBaseConfig()
        if isMonster then
          if 1 ~= config.no_statistics_hp then
            hp = hp + _unit:GetHp()
          end
        else
          hp = hp + _unit:GetHp()
        end
      end
    end
    BattleData.initRightTotalHP = hp
    BattleData.curRightTotalHP = hp
  end
end

function BattleScene.GetMirrorPos(posIndex)
  return (_mapXCount + 1 - math.floor(posIndex / 100)) * 100 + posIndex % 100
end

function BattleScene.GetAllGrid()
  return _allGird
end

function BattleScene.GetAllUnit()
  return _allUnit
end

function BattleScene.GetAllAliveUnit()
  return _allAliveUnit
end

function BattleScene.GetGridListByCamp(camp)
  return _gridByCamp[camp]
end

function BattleScene.GetAliveCardByCamp(camp)
  local returnUnitList = {}
  local unitList = _unitByCamp[camp]
  for i = 1, #unitList do
    local v = unitList[i]
    if v.summonId == nil and v.isBuilding == false and v:IsAlive() then
      returnUnitList[#returnUnitList + 1] = v
    end
  end
  return returnUnitList
end

function BattleScene.GetAliveUnitByCamp(camp)
  local returnUnitList = {}
  local unitList = _unitByCamp[camp]
  for i = 1, #unitList do
    local v = unitList[i]
    if v:IsAlive() then
      returnUnitList[#returnUnitList + 1] = v
    end
  end
  return returnUnitList
end

function BattleScene.GetUnitListForBuffTips(camp)
  local returnUnitList = {}
  local unitList = _unitByCamp[camp]
  for i = 1, #unitList do
    local v = unitList[i]
    if v.isBuilding == false and v:IsAlive() then
      if camp == BATTLE_CAMP_FLAG.LEFT and v.summonId == nil then
        returnUnitList[#returnUnitList + 1] = v
      elseif camp == BATTLE_CAMP_FLAG.RIGHT then
        returnUnitList[#returnUnitList + 1] = v
      end
    end
  end
  if camp == BATTLE_CAMP_FLAG.RIGHT then
    table.sort(returnUnitList, function(a, b)
      if a.monsterRank == b.monsterRank then
        return a.id < b.id
      else
        return a.monsterRank > b.monsterRank
      end
    end)
  end
  return returnUnitList
end

function BattleScene.GetUnitListByCampForManuallySkill(camp)
  local returnUnitList = {}
  local unitList = _unitByCamp[camp]
  for i = 1, #unitList do
    local v = unitList[i]
    if v:CanTargetChosen() == true and v.summonId == nil then
      returnUnitList[#returnUnitList + 1] = v
    end
  end
  return returnUnitList
end

function BattleScene.GetUnitListByCampForManuallySkill2(camp)
  local returnUnitList = {}
  local allUnit = _allUnit
  for _, v in ipairs(allUnit) do
    if v.camp == camp and v.summonId == nil then
      returnUnitList[#returnUnitList + 1] = v
    end
  end
  return returnUnitList
end

function BattleScene.GetUnitListByCamp(camp)
  local returnUnitList = {}
  local unitList = _unitByCamp[camp]
  for i = 1, #unitList do
    local v = unitList[i]
    if v:CanTargetChosen() == true then
      returnUnitList[#returnUnitList + 1] = v
    end
  end
  return returnUnitList
end

function BattleScene.GetBossHaveKOSkill()
  local rightUnits = BattleScene.GetAliveCardUnitListByCamp(BATTLE_CAMP_FLAG.RIGHT)
  for i, v in ipairs(rightUnits) do
    if v.isMonster == true then
      local monsterConfig = v:GetBaseConfig()
      if monsterConfig and monsterConfig.ko_skill_show_id then
        return v, monsterConfig.ko_skill_show_id
      end
    end
  end
end

function BattleScene.GetAliveCardUnitListByCamp(camp)
  local returnUnitList = {}
  local unitList = _unitByCamp[camp]
  for i = 1, #unitList do
    local v = unitList[i]
    if v.isBuilding == false and v:CanTargetChosen() == true then
      returnUnitList[#returnUnitList + 1] = v
    end
  end
  return returnUnitList
end

function BattleScene.GetAllAliveCardUnitList()
  local returnUnitList = {}
  local unitList = _allUnit
  for i = 1, #unitList do
    local v = unitList[i]
    if v.isBuilding == false and v:CanTargetChosen() == true then
      returnUnitList[#returnUnitList + 1] = v
    end
  end
  return returnUnitList
end

function BattleScene.GetUnitListByCampDirect(camp)
  return _unitByCamp[camp]
end

function BattleScene.GetUnitByUid(uid)
  if uid then
    if uid < 10000 then
      return _gridByUid[uid]
    end
    return _unitByUid[uid]
  end
end

function BattleScene.GetUnitById(id, camp)
  for i, v in ipairs(_allAliveUnit) do
    if v.id == id and v.camp == camp then
      return v
    end
  end
end

function BattleScene.GetUnitListByUidList(uidList)
  local returnUnitList = {}
  for i = 1, #uidList do
    returnUnitList[#returnUnitList + 1] = BattleScene.GetUnitByUid(uidList[i])
  end
  return returnUnitList
end

function BattleScene.GetUidListByUnitList(unitList)
  local uidList = {}
  if unitList then
    for i = 1, #unitList do
      uidList[#uidList + 1] = unitList[i].uid
    end
  end
  return uidList
end

function BattleScene.AddSkillInfo(skillInfo)
  _skillInfos[#_skillInfos + 1] = skillInfo
end

function BattleScene.UpdateSkillInfo(skillInfo)
  for i, v in ipairs(_skillInfos) do
    if v.camp == skillInfo.camp and v.frame == skillInfo.frame then
      _skillInfos[i] = skillInfo
    end
  end
end

function BattleScene.UpdateSkillStartFrameInfo(camp, frame, burstCardSkillStartFrame)
  for i, v in ipairs(_skillInfos) do
    if v.camp == camp and v.frame == frame then
      _skillInfos[i].cardSkillStartFrame = burstCardSkillStartFrame
    end
  end
end

function BattleScene.GetSkillInfos()
  return _skillInfos
end

function BattleScene.AddManuallySkillInfo(skillInfo)
  _manuallySkillInfos[#_manuallySkillInfos + 1] = skillInfo
end

function BattleScene.GetManuallySkillInfos()
  return _manuallySkillInfos
end

function BattleScene.AddUnit(data)
  _unitGlobalIndex = _unitGlobalIndex + 1
  local unit = BattleUnit.NewUnit(data)
  _allUnit[#_allUnit + 1] = unit
  _allAliveUnit[#_allAliveUnit + 1] = unit
  _unitByUid[unit.uid] = unit
  local buildingType = unit.buildingType
  if buildingType == BATTLE_BUILDING_TYPE.TRAP_TRIGGER then
    _triggerTrap[#_triggerTrap + 1] = unit
  end
  if unit.isBuilding ~= true then
    if unit.camp == BATTLE_CAMP_FLAG.LEFT then
      _leftUnitCount = _leftUnitCount + 1
      if unit.summonId == nil then
        _leftUnitCount_NotSummon = _leftUnitCount_NotSummon + 1
      end
    elseif unit.camp == BATTLE_CAMP_FLAG.RIGHT then
      _rightUnitCount = _rightUnitCount + 1
      local monsterRank = unit.monsterRank
      if monsterRank and monsterRank >= 0 then
        _rightUnitCountByRank[monsterRank] = _rightUnitCountByRank[monsterRank] + 1
      end
      if unit.summonId == nil then
        _rightUnitCount_NotSummon = _rightUnitCount_NotSummon + 1
      end
    end
  end
  return unit
end

function BattleScene.AddUnitToCampList(unit)
  if nil ~= unit then
    local list = _unitByCamp[unit.camp]
    table.insert(list, unit)
  end
end

function BattleScene.RemoveUnit(unit)
  local uid = unit.uid
  local list = _unitByCamp[unit.camp]
  for i = 1, #list do
    if list[i].uid == uid then
      table.remove(list, i)
      break
    end
  end
  for i = 1, #_allAliveUnit do
    if _allAliveUnit[i].uid == uid then
      table.remove(_allAliveUnit, i)
      break
    end
  end
  if unit.buildingType == BATTLE_BUILDING_TYPE.TRAP_TRIGGER then
    for i = 1, #_triggerTrap do
      if _triggerTrap[i].uid == uid then
        table.remove(_triggerTrap, i)
        break
      end
    end
  end
end

function BattleScene.AddPartnerTrigger(unit, condition, skillId)
  local camp = unit.camp
  local list = _cachedPartnerTriggerCondition[camp]
  if nil == list[condition] then
    list[condition] = {}
  end
  table.insert(list[condition], {unit = unit, skillId = skillId})
end

function BattleScene.RemovePartnerTrigger(unit, condition, skillId)
  local camp = unit.camp
  local list = _cachedPartnerTriggerCondition[camp]
  if nil == list[condition] then
    return
  end
  local unitList = list[condition]
  for i, v in ipairs(unitList) do
    if v.unit.uid == unit.uid and v.skillId == skillId then
      table.remove(unitList, i)
      return
    end
  end
end

function BattleScene.AddEnemyTrigger(unit, condition, skillId)
  local camp = unit.enemyCamp
  local list = _cachedEnemyTriggerCondition[camp]
  if nil == list[condition] then
    list[condition] = {}
  end
  table.insert(list[condition], {unit = unit, skillId = skillId})
end

function BattleScene.RemoveEnemyTrigger(unit, condition, skillId)
  local camp = unit.enemyCamp
  local list = _cachedEnemyTriggerCondition[camp]
  if nil == list[condition] then
    return
  end
  local unitList = list[condition]
  for i, v in ipairs(unitList) do
    if v.unit.uid == unit.uid and v.skillId == skillId then
      table.remove(unitList, i)
      return
    end
  end
end

function BattleScene.GetUnitListByPartnerTrigger(battleUnit, condition, includeSelf)
  local camp = battleUnit.camp
  local list = _cachedPartnerTriggerCondition[camp]
  if nil == list[condition] or 0 == #list[condition] then
    return
  end
  local returnUnitList = {}
  local unitList = list[condition]
  local unit
  for i, v in ipairs(unitList) do
    unit = v.unit
    if (false ~= includeSelf or unit.uid ~= battleUnit.uid) and unit:IsAlive() == true then
      table.insert(returnUnitList, unit)
    end
  end
  return returnUnitList
end

function BattleScene.GetUnitListByEnemyTrigger(battleUnit, condition)
  local camp = battleUnit.camp
  local list = _cachedEnemyTriggerCondition[camp]
  if nil == list[condition] or 0 == #list[condition] then
    return
  end
  local returnUnitList = {}
  local unitList = list[condition]
  local unit
  for i, v in ipairs(unitList) do
    unit = v.unit
    if unit:CanTargetChosen() == true then
      table.insert(returnUnitList, unit)
    end
  end
  return returnUnitList
end

function BattleScene.GetUnitGlobalIndex()
  return _unitGlobalIndex
end

function BattleScene.LeftUnitDead(battleUnit)
  _leftDeadUnitCount = _leftDeadUnitCount + 1
  if battleUnit.summonId == nil then
    _leftDeadUnitCount_NotSummon = _leftDeadUnitCount_NotSummon + 1
  end
end

function BattleScene.RightUnitDead(battleUnit)
  local monsterRank = battleUnit.monsterRank
  if monsterRank and monsterRank >= 0 then
    _rightDeadUnitCountByRank[monsterRank] = _rightDeadUnitCountByRank[monsterRank] + 1
  end
  _rightDeadUnitCount = _rightDeadUnitCount + 1
  if battleUnit.summonId == nil then
    _rightDeadUnitCount_NotSummon = _rightDeadUnitCount_NotSummon + 1
  end
  if BattleMgr.isBattleServer == false then
    UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_SHOW_KILL_ENEMY_COUNT)
  end
end

function BattleScene.IsBattleWin()
  return _isBattleWin
end

function BattleScene.IsBattleLoss()
  return _isBattleLoss
end

function BattleScene.AddBomb(bomb)
  _bombGlobalIndex = _bombGlobalIndex + 1
  _allBombUid[#_allBombUid + 1] = bomb.uid
  _bombByUid[bomb.uid] = bomb
  sortBombListChanged = true
end

function BattleScene.RemoveBomb(uid)
  _bombByUid[uid] = nil
  for i = 1, #_allBombUid do
    if _allBombUid[i] == uid then
      t_remove(_allBombUid, i)
      sortBombListChanged = true
      return true
    end
  end
end

function BattleScene.GetBombGlobalIndex()
  return _bombGlobalIndex
end

function BattleScene.GetBombByUid(uid)
  return _bombByUid[uid]
end

function BattleScene.GetSortBombList()
  if false == sortBombListChanged then
    return _allBombUidCopy
  end
  local tempList = {}
  for i = 1, #_allBombUid do
    tempList[i] = _allBombUid[i]
  end
  _allBombUidCopy = tempList
  sortBombListChanged = false
  return _allBombUidCopy
end

function BattleScene.AddBullet(bullet)
  _bulletGlobalIndex = _bulletGlobalIndex + 1
  _allBulletUid[#_allBulletUid + 1] = bullet.uid
  _bulletByUid[bullet.uid] = bullet
  sortBulletListChanged = true
end

function BattleScene.RemoveBullet(uid)
  _bulletByUid[uid] = nil
  for i = 1, #_allBulletUid do
    if _allBulletUid[i] == uid then
      t_remove(_allBulletUid, i)
      sortBulletListChanged = true
      return true
    end
  end
end

function BattleScene.GetBulletGlobalIndex()
  return _bulletGlobalIndex
end

function BattleScene.GetBulletByUid(uid)
  return _bulletByUid[uid]
end

function BattleScene.GetSortBulletList()
  if false == sortBulletListChanged then
    return _allBulletUidCopy
  end
  local tempList = {}
  for i = 1, #_allBulletUid do
    tempList[i] = _allBulletUid[i]
  end
  _allBulletUidCopy = tempList
  sortBulletListChanged = false
  return _allBulletUidCopy
end

function BattleScene.InitBurst()
  if BattleData.stageType == ProtoEnum.SCENE_TYPE.ARENA and BattleData.isMirror == false then
    local burstId = BattleData.burstRight
    if burstId and 0 ~= burstId then
      local burst = BattleBurst.NewBurst(burstId, BATTLE_CAMP_FLAG.RIGHT)
      BattleScene.AddBurst(burst)
    end
    burstId = BattleData.burstLeft
    if burstId and 0 ~= burstId then
      local burst = BattleBurst.NewBurst(burstId, BATTLE_CAMP_FLAG.LEFT)
      BattleScene.AddBurst(burst)
    end
  else
    local burstId = BattleData.burstLeft
    if burstId and 0 ~= burstId then
      local burst = BattleBurst.NewBurst(burstId, BATTLE_CAMP_FLAG.LEFT)
      BattleScene.AddBurst(burst)
    end
    burstId = BattleData.burstRight
    if burstId and 0 ~= burstId then
      local burst = BattleBurst.NewBurst(burstId, BATTLE_CAMP_FLAG.RIGHT)
      BattleScene.AddBurst(burst)
    end
  end
end

function BattleScene.AddBurst(burst)
  _allBurst[#_allBurst + 1] = burst
  _allBurstByCamp[burst.camp] = burst
end

function BattleScene.GetBurst(camp)
  return _allBurstByCamp[camp]
end

function BattleScene.GetCampObject(camp)
  return _allCamp[camp]
end

function BattleScene.InitManuallySkill()
  _manuallySkillGlobalIndex = 100000
  local skillList = BattleData.manuallySkillList
  if skillList and #skillList > 0 then
    for i, v in ipairs(skillList) do
      local manuallySkill = BattleManuallySkill.NewSkill(v.skillId, v.level, BATTLE_CAMP_FLAG.LEFT)
      BattleScene.AddManuallySkill(manuallySkill)
    end
  end
end

function BattleScene.AddManuallySkill(manuallySkill)
  _manuallySkillGlobalIndex = _manuallySkillGlobalIndex + 1
  _allManuallySkill[#_allManuallySkill + 1] = manuallySkill
  _manuallySkillByUid[manuallySkill.uid] = manuallySkill
  if _manuallySkillByCamp[manuallySkill.camp] == nil then
    _manuallySkillByCamp[manuallySkill.camp] = {manuallySkill}
  else
    table.insert(_manuallySkillByCamp[manuallySkill.camp], manuallySkill)
  end
end

function BattleScene.GetManuallySkill(skillId, camp)
  local list = _manuallySkillByCamp[camp] or {}
  for i, v in ipairs(list) do
    if v.skillId == skillId then
      return v
    end
  end
end

function BattleScene.GetManuallySkillByCamp(camp)
  return _manuallySkillByCamp[camp]
end

function BattleScene.GetAllManuallySkill()
  return _allManuallySkill
end

function BattleScene.GetManuallySkillGlobalIndex()
  return _manuallySkillGlobalIndex
end

function BattleScene.DealPreBattle()
  local state = BATTLE_STATE_ENUM.START
  for i = 1, #_allUnit do
    _allUnit[i]:SetState(state)
  end
  BattleAction.DealPreBattle()
end

function BattleScene.GetTempAliveUnitList()
  local unitList = {}
  for i = 1, #_allAliveUnit do
    unitList[#unitList + 1] = _allAliveUnit[i]
  end
  return unitList
end

function BattleScene.GetTempMoveStateAliveUnitList()
  local unitList = {}
  local stateMove = BATTLE_STATE_ENUM.MOVE
  for i = 1, #_allAliveUnit do
    if _allAliveUnit[i].curState == stateMove and _allAliveUnit[i].moveToPosition == nil then
      unitList[#unitList + 1] = _allAliveUnit[i]
    end
  end
  return unitList
end

function BattleScene.GetTempSpecialStageAliveUnitList()
  local unitList = {}
  local stateSpecial = BATTLE_STATE_ENUM.SPECIAL
  local unit
  for i = 1, #_allAliveUnit do
    unit = _allAliveUnit[i]
    if unit.specialStateEndFrame == BattleControl.curFixedFrame and unit.curState == stateSpecial then
      unitList[#unitList + 1] = unit
    end
  end
  return unitList
end

function BattleScene.UpdateProcess(curFixedFrame)
  local isSecond = 0 == curFixedFrame % BATTLE_CONFIG_ENUM.FIXED_FPS
  local rageTimeUpdate = BattleData.rageTimeUpdate
  if 0 == curFixedFrame % rageTimeUpdate then
    for _, v in ipairs(_allAliveUnit) do
      if v.haveRage == true then
        v:UpdateRagePerSecond(rageTimeUpdate)
      end
    end
  end
  for i = 1, #_allManuallySkill do
    _allManuallySkill[i]:Update()
  end
  local aliveUnitList = BattleScene.GetTempAliveUnitList()
  for i = 1, #aliveUnitList do
    aliveUnitList[i]:Update(isSecond)
  end
  local moveStateAliveUnitList = BattleScene.GetTempMoveStateAliveUnitList()
  local _ForceChangeState = BattleAction.ForceChangeState
  local stateWaitAttack = BATTLE_STATE_ENUM.WAIT_ATTACK
  for _, unit in ipairs(moveStateAliveUnitList) do
    local target, changeToAttack = unit:ChooseMoveTarget()
    if target and true == changeToAttack then
      unit:DealTriggerSkillAll(TRIGGER_CONDITION.FIRST_ATTACK)
      if unit.curState == BATTLE_STATE_ENUM.MOVE then
        _ForceChangeState(unit, stateWaitAttack)
      end
    end
  end
  local specialStageAliveUnitList = BattleScene.GetTempSpecialStageAliveUnitList()
  if #specialStageAliveUnitList > 0 then
    for _, battleUnit in ipairs(specialStageAliveUnitList) do
      BattleAction.ForceChangeState(battleUnit, BATTLE_STATE_ENUM.STAND)
      local _, buffTable = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(battleUnit, BUFF_EFFECT_ID.STEALTH, function(array)
        table.sort(array, function(a, b)
          return a.uid > b.uid
        end)
      end)
      for i = #buffTable, 1, -1 do
        local buff = buffTable[i]
        if buff then
          buff:Remove()
        end
      end
    end
    for _, battleUnit in ipairs(specialStageAliveUnitList) do
      BattleAction.DealSpecialEnd(battleUnit)
    end
  end
  local allBomb = BattleScene.GetSortBombList()
  for i = 1, #allBomb do
    _bombByUid[allBomb[i]]:Update()
  end
  local allBullet = BattleScene.GetSortBulletList()
  for i = 1, #allBullet do
    _bulletByUid[allBullet[i]]:Update()
  end
  BattleBuffMgr.UpdateAllBuff(curFixedFrame)
  for _, unit in ipairs(aliveUnitList) do
    if unit:IsDead() == false and false == unit:IsDestroy() and (true == unit.needDestroy or unit.tempHpPer and unit:GetHp() <= 0) and true ~= unit.skillWhenDying then
      unit.needDestroy = nil
      print_battle("---------------------------濒死，", BattleControl.curFixedFrame, unit.positionIndex, unit.uid)
      BattleAction.DealDying(unit)
    end
  end
  for i = 1, #_allBurst do
    _allBurst[i]:Update()
    _allBurst[i]:UpdateEnergyFrameEnd()
  end
end

function BattleScene.UpdateDisplay()
  local isSecond = 0 == BattleControl.curFrame % 30
  if isSecond then
    local count = _leftUnitCount_NotSummon + _rightUnitCount_NotSummon
    count = math.min(count, 16)
    count = math.max(1, count)
    SoundManager:SetSystemParameter("parameter:/battle/btl_vo_interval", count)
  end
  if BattleScene.IsBattleOver() == false then
    for i = 1, #_allManuallySkill do
      _allManuallySkill[i]:UpdateDisplay()
    end
  end
  for i = 1, #_allUnit do
    local v = _allUnit[i]
    if v.noDisplay ~= true then
      v:UpdateDisplay()
      if false == v:IsDead() and false == v:IsDestroy() then
        v:UpdateShowInSkillRange(false)
      end
    end
  end
  for i = 1, #_allUnit do
    BattleActionDisplay.PlayBuffIconRefresh(_allUnit[i])
  end
end

function BattleScene.Stop(forceClose)
  BattleOperation.Clear()
  BattleSkillWait.Clear()
  BattleSummonWait.Clear()
  BattleTransform.Clear()
  BattleBuffMgr.ClearAllBuff()
  if BattleMgr.isBattleServer ~= true then
    SoundManager:SetSystemParameter("parameter:/battle/btl_ultra", 0)
    if burstChangeEffect then
      BattleResourceManager:DestroyGameObject(burstChangeEffect, false)
      burstChangeEffect = nil
    end
    if burstBlackEffect then
      BattleResourceManager:DestroyGameObject(burstBlackEffect, false)
      burstBlackEffect = nil
    end
    if burstPostEffect then
      BattleResourceManager:DestroyGameObject(burstPostEffect, false)
      burstPostEffect = nil
    end
    BattleHurtNum.ClearHurtNum()
    local v
    for i = 1, #_allAliveUnit do
      v = _allAliveUnit[i]
      if true == v:CanTargetChosen() then
        v:ClearBuff(true)
        v:ClearControlState()
        v:SetState(BATTLE_STATE_ENUM.STAND)
        v:UpdateDisplay(forceClose)
      end
    end
  else
    local v
    for i = 1, #_allAliveUnit do
      v = _allAliveUnit[i]
      if true == v:CanTargetChosen() then
        v:ClearBuff(true)
      end
    end
  end
  for _, bullet in pairs(_bulletByUid) do
    bullet:Destroy(nil, true)
  end
  _bulletByUid = {}
  _allBulletUid = {}
  _allBulletUidCopy = {}
  for _, bomb in pairs(_bombByUid) do
    bomb:Destroy(nil, true)
  end
  _bombByUid = {}
  _allBombUid = {}
  _allBombUidCopy = {}
end

function BattleScene.UpdateBattleOverState()
  if _leftDeadUnitCount_NotSummon >= _leftUnitCount_NotSummon then
    _isBattleLoss = true
    if BattleData.stageType ~= ProtoEnum.SCENE_TYPE.GUILD_WAR then
      return
    end
  end
  if _winCondition == BATTLE_WIN_CONDITION_TYPE.TIME_UP_ALIVE then
    if BattleData.totalFixedFrames <= BattleControl.curFixedFrame then
      _isBattleWin = true
      return
    end
  elseif _winCondition == BATTLE_WIN_CONDITION_TYPE.KILL_ENEMY_ALL then
    if _rightDeadUnitCount >= _rightUnitCount then
      _isBattleWin = true
      return
    end
    if BattleData.totalFixedFrames <= BattleControl.curFixedFrame then
      _isBattleLoss = true
      return
    end
  elseif _winCondition == BATTLE_WIN_CONDITION_TYPE.KILL_ENEMY_COUNT then
    if _rightDeadUnitCount >= _winConditionParam then
      _isBattleWin = true
      return
    end
    if BattleData.totalFixedFrames <= BattleControl.curFixedFrame then
      _isBattleLoss = true
      return
    end
  elseif _winCondition == BATTLE_WIN_CONDITION_TYPE.KILL_ENEMY_BY_RANK then
    if _rightDeadUnitCountByRank[_winConditionParam] >= _rightUnitCountByRank[_winConditionParam] then
      _isBattleWin = true
      return
    end
    if BattleData.totalFixedFrames <= BattleControl.curFixedFrame then
      _isBattleLoss = true
      return
    end
  end
end

function BattleScene.NeedShowKillEnemyCount()
  return _winCondition == BATTLE_WIN_CONDITION_TYPE.KILL_ENEMY_COUNT, _rightDeadUnitCount, _winConditionParam
end

function BattleScene.IsBattleOver()
  return _isBattleWin or _isBattleLoss
end

function BattleScene.PlayDragSkill(isDrag, noRotation)
  local gameObject = BattleCameraParentObject
  local targetTimeScale = 1
  local startRotationX, targetRotationX, startRotationY, targetRotationY
  if isDrag then
    SoundManager:PlaySnapShot("snapshot:/battle/slow_motion")
    targetTimeScale = targetTimeScale * 0.15
    startRotationX = 0
    targetRotationX = 30
  else
    SoundManager:StopSnapShot("snapshot:/battle/slow_motion")
    targetTimeScale = BattleData.speedList[BattleData.speedIndex]
    startRotationX = 30
    targetRotationX = 0
  end
  if BattleMgr.isPlotBattle ~= true then
    Time.timeScale = targetTimeScale
  end
  if true ~= noRotation then
    LeanTween.value(startRotationX, targetRotationX, 0.2):setOnUpdate(function(value)
      LuaUtil.SetLocalEuler(gameObject, value, 0, 0)
    end):setIgnoreTimeScale(true)
  end
end

function BattleScene.PlayBoomShow(show)
  if show then
    local showBurstAnim = 1 == PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.BATTLE_BURST_ANIM_SHOW, PLAYER_PREF_DEFAULT_VALUE.BATTLE_BURST_CARD_SHOW)
    if showBurstAnim then
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BURST_BATTLE)
      SoundManager:SetSystemParameter("parameter:/battle/btl_ultra", 1)
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_UPDATE_UI_IN_BURST, false)
      BattleControl.Pause(true)
      BattleShow:PlayBurstEffect("Assets/Art/Effects/Prefab/UI_prefab/Rocktime/FX_ui_battle_rocktime_show.prefab", function()
        UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_UPDATE_UI_IN_BURST, true)
        SoundManager:SetSystemParameter("parameter:/battle/btl_ultra", 2)
        UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_SHOW_BURST_CARD_CHOOSE)
      end)
    else
      SoundManager:SetSystemParameter("parameter:/battle/btl_ultra", 2)
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_SHOW_BURST_CARD_CHOOSE)
    end
    if nil == burstChangeEffect then
      burstChangeEffect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/battle/FX_battle_rocktime_change.prefab")
      local SortingHelper = require("SortingHelper")
      SortingHelper.SetOrderInLayer(burstChangeEffect, BATTLE_CONFIG_ENUM.SORTING_ORDER_BACKGROUND + 1)
    end
    LuaUtil.SetAlpha(burstChangeEffect, 1)
    burstChangeEffect:SetActiveSafe(true)
    if nil == burstBlackEffect then
      burstBlackEffect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Rocktime/FX_ui_battle_rocktime_black.prefab")
      local SortingHelper = require("SortingHelper")
      SortingHelper.SetOrderInLayer(burstBlackEffect, BATTLE_CONFIG_ENUM.SORTING_ORDER_BACKGROUND + 3)
    end
    LuaUtil.SetAlpha(burstBlackEffect, 1)
    burstBlackEffect:SetActiveSafe(true)
    if nil == burstPostEffect then
      burstPostEffect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Rocktime/FX_ui_rocktime_posteff.prefab")
      local SortingHelper = require("SortingHelper")
      SortingHelper.SetOrderInLayer(burstPostEffect, BATTLE_CONFIG_ENUM.SORTING_ORDER_BACKGROUND + 2)
    end
    LuaUtil.SetAlpha(burstPostEffect, 1)
    burstPostEffect:SetActiveSafe(true)
  else
    SoundManager:SetSystemParameter("parameter:/battle/btl_ultra", 0)
    if burstChangeEffect then
      LeanTween.value(1, 0, 0.2):setOnUpdate(function(alpha)
        if burstChangeEffect then
          LuaUtil.SetAlpha(burstChangeEffect, alpha)
        end
      end):setOnComplete(function()
        if burstChangeEffect then
          burstChangeEffect:SetActiveSafe(false)
        end
      end)
    end
    if burstBlackEffect then
      LeanTween.value(1, 0, 0.2):setOnUpdate(function(alpha)
        if burstBlackEffect then
          LuaUtil.SetAlpha(burstBlackEffect, alpha)
        end
      end):setOnComplete(function()
        if burstBlackEffect then
          burstBlackEffect:SetActiveSafe(false)
        end
      end)
    end
    if burstPostEffect then
      LeanTween.value(1, 0, 0.2):setOnUpdate(function(alpha)
        if burstPostEffect then
          LuaUtil.SetAlpha(burstPostEffect, alpha)
        end
      end):setOnComplete(function()
        if burstPostEffect then
          burstPostEffect:SetActiveSafe(false)
        end
      end)
    end
    if BattleControl.isPause then
      BattleControl.Continue()
    end
  end
end

function BattleScene.PlayBurstSkill(show, battleUnit)
  if show then
    BattleVoice.PlayVoice(battleUnit.uid, BUBBLE_TYPE_ENUM.UNIQUE)
    battleUnit:ShowEffectInBurst()
    BattleControl.Pause(true)
    local effect = battleUnit:CreateEffect("burst_start_effect", "Assets/Art/Effects/Prefab/UI_prefab/Rocktime/FX_uniqueskills_eff.prefab", true)
    local targetOrder = battleUnit.sortingOrder - BATTLE_CONFIG_ENUM.SORTING_ORDER_INIT
    SortingHelper.SetOrderInLayer(effect, targetOrder - 1)
    BattleResourceManager:SetGameObjectUnscaledTime(effect)
    local burstCardShow = 0
    if battleUnit.camp == BATTLE_CAMP_FLAG.LEFT then
      burstCardShow = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.BATTLE_BURST_CARD_SHOW, PLAYER_PREF_DEFAULT_VALUE.BATTLE_BURST_CARD_SHOW)
    end
    if 1 == burstCardShow then
      charShowEffect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/battle/FX_ui_battle_rocktime_charshow.prefab")
      BattleResourceManager:SetGameObjectUnscaledTime(charShowEffect)
      LuaUtil.SetScale(charShowEffect, 4, 4, 1, true)
      LuaUtil.SetLocalEuler(charShowEffect, BATTLE_CONFIG_ENUM.CAMERA_ROTATION_X, 0, 0)
      local fashionConfig = battleUnit.fashionConfig
      cardShowSpine = ResourceManager.Instantiate(ModelUtil.GetFullPath(fashionConfig.show_spine, RES_PATH_PREFIX.CARD_SHOW_SPINE), nil, function(cardShowObject, loader, holder)
        SkeletonAnimationUtil.SetShaderEffectEnable(cardShowObject, false, false, false)
        cardShowObject:SetActiveSafe(false)
      end)
      cardShowSpine:IgnoreTimeScale(true)
      local rt = RTManager:GetModelWithRT(cardShowSpine, 667, 750, 0, RTManager.cameraFovScale, 2, 1)
      local configX = fashionConfig.show_spine_position[1]
      local configY = fashionConfig.show_spine_position[2]
      local inLoaderX = configX - 333.5
      local inLoaderY = configY + 375.0
      local inLoaderScale = 100
      LuaUtil.SetScale(cardShowSpine, inLoaderScale, inLoaderScale, inLoaderScale)
      LuaUtil.SetLocalPos(cardShowSpine, inLoaderX, inLoaderY, 0)
      LuaUtil.ChangeTextureValue(charShowEffect, "_MainTex", rt, "charactor_texture")
      local skillName = charShowEffect.transform:GetComponentInChildren(typeof(FairyGUI.UIPanel), true).ui
      if skillName then
        PlayUITrans(skillName, "up", nil, nil, nil, nil, nil, true)
        local nameTxt = skillName:GetChild("NameTxt")
        local burstSkillConfig = TableData.GetConfig(battleUnit.burstSkill, "BaseSkill")
        nameTxt.text = burstSkillConfig.name()
      end
    end
    local t = TimerUtil.setTimeout(1.5, function(timerUtil)
      if IsNil(charShowEffect) == false then
        ResourceManager.DestroyGameObject(charShowEffect)
        charShowEffect = nil
      end
      if IsNil(cardShowSpine) == false then
        cardShowSpine:IgnoreTimeScale(false)
        RTManager:ReleaseModelWithRT(cardShowSpine)
        ResourceManager.DestroyGameObject(cardShowSpine)
        cardShowSpine = nil
      end
      battleUnit:HideEffectInBurst()
      BattleControl.Continue()
      for i, v in ipairs(_cachedCardBurstTimerUtilList) do
        if v == timerUtil then
          table.remove(_cachedCardBurstTimerUtilList, i)
        end
      end
      if GuideMgr.guideBol == true then
        local stepData = GuideMgr.GetStepData()
        if stepData and stepData.trigger_in_battle == "burst_card_skill_over" then
          local leftBurst = BattleScene.GetBurst(BATTLE_CAMP_FLAG.LEFT)
          if leftBurst and true == leftBurst:IsAllCardSkillDeal() then
            LeanTween.delayedCall(0.1, function()
              UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_PLAY_CARD_SKILL_OVER_GUIDE)
            end)
          end
        end
      end
    end, nil, nil, true)
    table.insert(_cachedCardBurstTimerUtilList, t)
    UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_SHOW_CARD_BURST_EFFECT, battleUnit.uid)
  else
    BattleControl.Continue()
  end
end

function BattleScene.SetCardBurstTimerUtilPause(isPause)
  for _, v in ipairs(_cachedCardBurstTimerUtilList) do
    if isPause then
      v:pause()
    else
      v:Comp()
    end
  end
end

function BattleScene.GetUnitListByTargetUid(targetUid)
  local unitList = {}
  for i = 1, #_allAliveUnit do
    local v = _allAliveUnit[i]
    if v:CanTargetChosen() == true and v.battleUnitType ~= BATTLE_UNIT_TYPE.RANGED_ATTACK and v.battleUnitType ~= BATTLE_UNIT_TYPE.SUPPORT and v:GetAttackTargetUid() == targetUid then
      unitList[#unitList + 1] = v
    end
  end
  return unitList
end

function BattleScene.GetUnitBlockCountByTargetUid(targetUid)
  local unitList = BattleScene.GetUnitListByTargetUid(targetUid)
  local count = 0
  for i = 1, #unitList do
    count = count + unitList[i]:GetBlockCount()
  end
  return count
end

function BattleScene.UpdateCacheDistance(moveUnit)
  local distance, coverR
  local baseCoverR = moveUnit.coverRadiusR
  if nil == baseCoverR then
    return
  end
  local moveUnitUid = moveUnit.uid
  local tempUid
  local moveUnitPosition = moveUnit.position
  local sqrt = math.sqrt
  local position, v
  for i = 1, #_allAliveUnit do
    v = _allAliveUnit[i]
    tempUid = v.uid
    if tempUid ~= moveUnitUid then
      coverR = v.coverRadiusR
      if nil ~= coverR then
        position = v.position
        distance = MathUtil.TruncateFloat(sqrt((moveUnitPosition.x - position.x) ^ 2 + (moveUnitPosition.y - position.y) ^ 2 + (moveUnitPosition.z - position.z) ^ 2) * _pixelsPerUnit - baseCoverR - coverR)
        moveUnit.cachedDistance[tempUid] = distance
        v.cachedDistance[moveUnitUid] = distance
      end
    end
  end
end

function BattleScene.GetInRangeUnit(centerUnit, rangeType, rangeX, rangeY, isSameSide, direction, directionVector, includeSelf)
  local camp
  if true == isSameSide then
    camp = centerUnit.camp
    if nil == includeSelf then
      includeSelf = true
    end
  elseif false == isSameSide then
    camp = centerUnit.enemyCamp
    includeSelf = false
  end
  return BattleScene.GetInRangeUnitWithCamp(centerUnit, rangeType, rangeX, rangeY, camp, direction, directionVector, includeSelf)
end

function BattleScene.GetInRangeUnitWithCamp(centerUnit, rangeType, rangeX, rangeY, camp, direction, directionVector, includeSelf)
  local inRangeUnit = {}
  local centerUid = centerUnit.uid
  for i = 1, #_allAliveUnit do
    local v = _allAliveUnit[i]
    if v:CanRangeChosen() == true and (not camp or v.camp == camp) and (true == includeSelf or v.uid ~= centerUid) and (v.uid == centerUid or true == BattleScene.IsTargetInRange(centerUnit, v, rangeType, rangeX, rangeY, direction, directionVector)) then
      if v.uid == centerUid then
        table.insert(inRangeUnit, 1, v)
      else
        inRangeUnit[#inRangeUnit + 1] = v
      end
    end
  end
  return inRangeUnit
end

function BattleScene.IsTargetCounter(startUnit, targetUnit)
  local centerDisYZ = math.sqrt((startUnit.position.y - targetUnit.position.y) ^ 2 + (startUnit.position.z - targetUnit.position.z) ^ 2) * _pixelsPerUnit
  return centerDisYZ < targetUnit.coverRadiusR + startUnit.coverRadiusR
end

function BattleScene.IsTargetInRange(centerUnit, target, rangeType, rangeX, rangeY, direction, directionVector)
  if centerUnit and target then
    local fromPosX = centerUnit.position.x
    local fromPosY = centerUnit.position.y
    local fromPosZ = centerUnit.position.z
    local targetPosX = target.position.x
    local targetPosY = target.position.y
    local targetPosZ = target.position.z
    local isFlip = centerUnit.savedFlip
    if direction == SKILL_DIRECTION.FRONT then
      if true == isFlip and fromPosX < targetPosX then
        return false
      elseif false == isFlip and fromPosX > targetPosX then
        return false
      end
    elseif direction == SKILL_DIRECTION.BEHIND then
      if true == isFlip and fromPosX > targetPosX then
        return false
      elseif false == isFlip and fromPosX < targetPosX then
        return false
      end
    end
    if true == centerUnit.isGrid or centerUnit.cachedDistance[target.uid] == nil and rangeType == BATTLE_RANGE_TYPE.CIRCLE then
      local centerPosition = centerUnit.position
      local targetPosition = target.position
      centerUnit.cachedDistance[target.uid] = MathUtil.TruncateFloat(math.sqrt((centerPosition.x - targetPosition.x) ^ 2 + (centerPosition.y - targetPosition.y) ^ 2 + (centerPosition.z - targetPosition.z) ^ 2) * _pixelsPerUnit - centerUnit.coverRadiusR - target.coverRadiusR)
    end
    if rangeType == BATTLE_RANGE_TYPE.CIRCLE then
      return rangeX >= centerUnit.cachedDistance[target.uid] + centerUnit.coverRadiusR
    elseif rangeType == BATTLE_RANGE_TYPE.CENTER_RECT then
      return rangeX >= abs(fromPosX - targetPosX) * _pixelsPerUnit - target.coverRadiusR and rangeY >= abs(fromPosZ - targetPosZ) * _pixelsPerUnit - target.coverRadiusR
    elseif rangeType == BATTLE_RANGE_TYPE.RECT_SELF_2_TARGET then
      local attackTargetUid = centerUnit:GetAttackTargetUid()
      if attackTargetUid then
        if nil == directionVector and attackTargetUid == target.uid then
          return rangeX >= centerUnit.cachedDistance[target.uid] + centerUnit.coverRadiusR
        end
        local attackTargetUnit = _unitByUid[attackTargetUid]
        if attackTargetUnit then
          local startPosition = centerUnit.position
          local endPosition = directionVector or attackTargetUnit.position
          local tempPosition = target.position
          local h = MathUtil.GetDistanceToLine(tempPosition, startPosition, endPosition) * _pixelsPerUnit
          if h > target.coverRadiusR + rangeY / 2 then
            return false
          end
          local targetV = MathUtil.GetVector3Subtract(tempPosition, startPosition)
          local directV = MathUtil.GetVector3Subtract(endPosition, startPosition)
          local projection = MathUtil.GetProjection(targetV, directV)
          local m_projection = MathUtil.GetVector3Module(projection)
          local dot = MathUtil.GetVector3Dot(targetV, directV)
          if dot > 0 then
            return rangeX >= m_projection * _pixelsPerUnit - target.coverRadiusR
          elseif dot < 0 then
            return m_projection * _pixelsPerUnit - target.coverRadiusR <= 0
          elseif 0 == dot then
            return true
          end
        end
      end
    elseif rangeType == BATTLE_RANGE_TYPE.FRONT_RECT then
      return rangeX >= abs(fromPosX - targetPosX) * _pixelsPerUnit - target.coverRadiusR and abs(fromPosZ - targetPosZ) * _pixelsPerUnit - target.coverRadiusR <= rangeY / 2
    end
  end
end

function BattleScene.GetOverlapTeammate(unit)
  do return false end
  local allTeammate = BattleScene.GetUnitListByCamp(unit.camp)
  if #allTeammate > 1 then
    for i = 1, #allTeammate do
      local teammate = allTeammate[i]
      if teammate.uid ~= unit.uid and teammate.curState ~= BATTLE_STATE_ENUM.MOVE and unit.cachedDistance[teammate.uid] < 0 then
        unit.speed.y = 0.1
        return true
      end
    end
  end
end

function BattleScene.GetPortalTargetPosition()
  local noCoverGridList = BattleScene.GetNoCoverGrid()
  local index = ceil(MathUtil.TruncateFloat(BattleData.GetRandomSeed() * #noCoverGridList / 10000))
  local gridIndex = noCoverGridList[index]
  local x, y, z = BattleScene.GetInitPosition(gridIndex)
  return {
    x = x,
    y = y,
    z = z
  }
end

function BattleScene.DealClearTarget(battleUnit)
  local uid = battleUnit.uid
  local v
  for i = 1, #_allAliveUnit do
    v = _allAliveUnit[i]
    if v.uid ~= uid then
      local moveTargetUid, isBeAttractedMove, isCharmedMove = v:GetMoveTargetUid()
      if moveTargetUid == uid then
        v.moveTargetUid = nil
        print_battle("清除目标 移动目标处理：", v:GetName(), "清除默认移动目标，不改变当前动作", "是否被嘲讽", isBeAttractedMove, "是否被魅惑", isCharmedMove)
      end
      local attackTargetUid, isBeAttractedAttack, isCharmedAttack = v:GetAttackTargetUid()
      if attackTargetUid == uid then
        v.attackTargetUid = nil
        print_battle("清除目标 攻击目标处理：", v:GetName(), "清除默认攻击目标，不改变当前动作", "是否被嘲讽", isBeAttractedAttack, "是否被魅惑", isCharmedAttack)
      end
    end
  end
end

function BattleScene.IsMoveIntoTRAP(moveUnit)
  local trap
  for i = 1, #_triggerTrap do
    trap = _triggerTrap[i]
    if trap.camp ~= moveUnit.camp and BattleScene.IsTargetInRange(trap, moveUnit, BATTLE_RANGE_TYPE.CENTER_RECT, trap.coverRadiusHalfW, trap.coverRadiusHalfH) then
      return trap
    end
  end
end

function BattleScene.IsBurstTime()
  for _, v in ipairs(_allBurst) do
    if v.energySkillRemainFrame and v.energySkillRemainFrame > 0 then
      return true
    end
  end
  return false
end

function BattleScene.GetSpeed(startPosition, targetPosition, module, moveFront, needFindPath)
  local speed = {
    x = 0,
    y = 0,
    z = 0
  }
  module = MathUtil.TruncateFloat(module / _pixelsPerUnit)
  needFindPath = false
  local dis = MathUtil.GetVector3Subtract(targetPosition, startPosition)
  if moveFront and true ~= needFindPath then
    dis.y = 0
    dis.z = 0
  end
  if 0 ~= dis.x or 0 ~= dis.y or 0 ~= dis.z then
    speed = MathUtil.GetNormVector3(dis, module)
  else
    return speed
  end
  if abs(speed.x) > abs(dis.x) then
    speed.x = dis.x
  end
  if abs(speed.y) > abs(dis.y) then
    speed.y = dis.y
  end
  if abs(speed.z) > abs(dis.z) then
    speed.z = dis.z
  end
  return speed
end

function BattleScene.UpdateHeadInfo()
  if _allAliveUnit then
    for _, v in ipairs(_allAliveUnit) do
      if v.messageBar then
        v.messageBar:UpdateBuffVisible()
        v.messageBar:UpdateVisible()
      end
    end
  end
end

function BattleScene.Clear()
  _unitGlobalIndex = 10000
  _gridUnitGlobalIndex = 1
  _leftUnitCount = 0
  _leftUnitCount_NotSummon = 0
  _leftDeadUnitCount = 0
  _leftDeadUnitCount_NotSummon = 0
  _rightUnitCount = 0
  _rightUnitCount_NotSummon = 0
  _rightDeadUnitCount = 0
  _rightDeadUnitCount_NotSummon = 0
  _mapArray = {}
  _unitByCamp = {}
  _unitByUid = {}
  _gridByUid = {}
  _gridByCamp = {}
  _triggerTrap = {}
  _skillInfos = {}
  _manuallySkillInfos = {}
  for i = 1, #_allGird do
    _allGird[i]:Destroy()
  end
  _allGird = {}
  _allAliveUnit = {}
  for i = 1, #_allUnit do
    _allUnit[i]:Destroy()
  end
  _allUnit = {}
  _cachedPartnerTriggerCondition = {}
  _cachedEnemyTriggerCondition = {}
  for _, v in ipairs(_cachedCardBurstTimerUtilList) do
    v:stop()
  end
  _cachedCardBurstTimerUtilList = {}
  _allBurstByCamp = {}
  for i = 1, #_allBurst do
    _allBurst[i]:Destroy()
  end
  _allBurst = {}
  for i = 1, #_allCamp do
    _allCamp[i]:Destroy()
  end
  _allCamp = {}
  _manuallySkillByCamp = {}
  _manuallySkillByUid = {}
  for i = 1, #_allManuallySkill do
    _allManuallySkill[i]:Destroy()
  end
  _allManuallySkill = {}
  if BattleMgr.isBattleServer ~= true then
    if IsNil(charShowEffect) == false then
      ResourceManager.DestroyGameObject(charShowEffect)
      charShowEffect = nil
    end
    if IsNil(cardShowSpine) == false then
      cardShowSpine:IgnoreTimeScale(false)
      RTManager:ReleaseModelWithRT(cardShowSpine)
      ResourceManager.DestroyGameObject(cardShowSpine)
      cardShowSpine = nil
    end
    BattleBackground.Clear()
    SoundManager:ClearTempBanks()
    BattleResourceManager:ClearBattleResource()
    BattleShow:StopBurstEffect()
  end
end
