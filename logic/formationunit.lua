FormationUnit = {}

function FormationUnit.New(position, range, cardType, buildingType)
  local card = {}
  card.position = position
  card.range = range
  card.cardType = cardType
  card.buildingType = buildingType
  return card
end

function FormationUnit.GetCurTarget(curPosition, curRange, curType)
  local enemy = FormationData.cachedEnemyList
  if 0 == #enemy then
    return
  end
  local sortList = {}
  for i, v in ipairs(enemy) do
    local distance = math.sqrt((curPosition.x - v.position.x) ^ 2 + (curPosition.y - v.position.y) ^ 2) - curRange.x - v.range.x
    local distanceY = math.abs(curPosition.y - v.position.y)
    table.insert(sortList, {
      unit = v,
      distance = distance,
      distanceY = distanceY
    })
  end
  table.sort(sortList, function(a, b)
    if a.distance ~= b.distance then
      return a.distance < b.distance
    elseif a.distanceY ~= b.distanceY then
      return a.distanceY < b.distanceY
    elseif a.unit.position.x ~= b.unit.position.x then
      return a.unit.position.x < b.unit.position.x
    else
      return a.unit.position.y < b.unit.position.y
    end
  end)
  if curType == BATTLE_UNIT_TYPE.MELEE_ATTACK then
    for _, v in ipairs(sortList) do
      if FormationUnit.IsTargetCounter(curPosition, v) then
        return v.unit
      end
    end
    for _, v in ipairs(sortList) do
      if v.unit.cardType == BATTLE_UNIT_TYPE.SUPPORT or v.unit.cardType == BATTLE_UNIT_TYPE.RANGED_ATTACK then
        return v.unit
      end
    end
  end
  return sortList[1].unit
end

function FormationUnit.IsTargetCounter(curPosition, targetUnit)
  local centerDisYZ = math.abs(curPosition.y - targetUnit.unit.position.y)
  return centerDisYZ < targetUnit.unit.range.x
end
