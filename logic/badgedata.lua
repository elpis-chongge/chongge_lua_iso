BadgeData = {}
BADGE_SORT_TYPE_ENUM = {STAR = 0, LEVEL = 1}

function BadgeData.InitScreeningData()
  BadgeData.SuitId = {}
  BadgeData.StarNum = {}
  BadgeData.MainAttribute = {}
  BadgeData.ViceAttribute = {}
end

function BadgeData.IsScreen()
  if table.getLen(BadgeData.SuitId) > 0 or table.getLen(BadgeData.StarNum) > 0 or table.getLen(BadgeData.MainAttribute) > 0 or table.getLen(BadgeData.ViceAttribute) > 0 then
    return true
  end
end

function BadgeData.InitSortData()
  BadgeData.SortAttribute = {}
  BadgeData.sortType = BADGE_SORT_TYPE_ENUM.LEVEL
end

function BadgeData.DeleteOneSuitId(id)
  for i, v in ipairs(BadgeData.SuitId) do
    if v == id then
      table.remove(BadgeData.SuitId, i)
      return
    end
  end
end

function BadgeData.DeleteOneMainAttribute(id)
  for i, v in ipairs(BadgeData.MainAttribute) do
    if v == id then
      table.remove(BadgeData.MainAttribute, i)
      return
    end
  end
end

function BadgeData.DeleteOneViceAttribute(id)
  for i, v in ipairs(BadgeData.ViceAttribute) do
    if v == id then
      table.remove(BadgeData.ViceAttribute, i)
      return
    end
  end
end

function BadgeData.UpdateTakeoffOrWearInfo(cardInfos, badgeInfos)
  for i, v in pairs(cardInfos) do
    ActorData.AddCard(v)
  end
  for i, v in pairs(badgeInfos) do
    ActorData.UpdateOneBadgeData(v)
  end
end

local GetValue = function(strValue)
  local addAttr = Split(strValue, ":")
  if 3 == #addAttr then
    return {
      type = tonumber(addAttr[1]),
      id = tonumber(addAttr[2]),
      value = tonumber(addAttr[3])
    }
  end
end

function BadgeData.GetAttribute(level, id, formatNum)
  local data = TableData.GetConfig(id, "BaseBadgeAttribute")
  if data then
    local arr = GetValue(data.value)
    if arr then
      local add = data.value_add or 0
      local lv = level or 0
      local value = arr.value + add * lv
      if 1 == data.show_type then
        return value
      elseif 2 == data.show_type then
        if false == formatNum then
          return T(1246, value / 100)
        end
        return T(1246, FormatValidateNum(value / 100))
      elseif 3 == data.show_type then
        return GetPreciseDecimal(value / 1000, 2)
      elseif 4 == data.show_type then
        if false == formatNum then
          return T(1246, math.abs(value / 100))
        end
        return T(1246, FormatValidateNum(math.abs(value / 100)))
      end
    end
  end
  return ""
end

function BadgeData.GetBadgeByPart(part, firstBadgeUid, reverseSort, notShowWear)
  local badge = {}
  local allData = ActorData.GetAllBadge()
  local id, wear, tempFirstData
  for _, v in ipairs(allData) do
    wear = not notShowWear and true or 0 == v.wearCardId
    if wear then
      id = v.badgeId
      local config = TableData.GetConfig(id, "BaseBadge")
      if config then
        if 0 == part then
          if firstBadgeUid and v.badgeUid == firstBadgeUid then
            tempFirstData = {
              data = config,
              info = SimpleCopy(v)
            }
          else
            table.insert(badge, {
              data = config,
              info = SimpleCopy(v)
            })
          end
        elseif config.type == part then
          if firstBadgeUid and v.badgeUid == firstBadgeUid then
            tempFirstData = {
              data = config,
              info = SimpleCopy(v)
            }
          else
            table.insert(badge, {
              data = config,
              info = SimpleCopy(v)
            })
          end
        end
      end
    end
  end
  if #badge > 0 then
    if BadgeData.sortType == nil or BadgeData.sortType == BADGE_SORT_TYPE_ENUM.STAR then
      badge = BadgeData.SortByStar(badge)
    else
      badge = BadgeData.SortByLevel(badge)
    end
  end
  if reverseSort then
    badge = table.reverseTable(badge)
  end
  if tempFirstData then
    table.insert(badge, 1, tempFirstData)
  end
  return badge
end

function BadgeData.GetBadgePartName(type)
  if 1 == type then
    return T(1186)
  elseif 2 == type then
    return T(1187)
  elseif 3 == type then
    return T(1188)
  elseif 0 == type then
    return T(1195)
  end
end

function BadgeData.GetBadgeAttributeName(type)
  local wordId = {
    1200,
    1201,
    1202,
    1203,
    1204,
    1205,
    1206,
    1207,
    1208,
    1209,
    1210,
    1211,
    1212,
    1213
  }
  if wordId[type] then
    return T(wordId[type])
  end
end

function BadgeData.GetAttributeNameByInfo(type)
  local wordId = {
    1200,
    1201,
    1202,
    1250,
    1251,
    1252,
    1206,
    1207,
    1208,
    1209,
    1210,
    1211,
    1212,
    1213
  }
  if wordId[type] then
    return T(wordId[type])
  end
end

function BadgeData.GetMainAttribute()
  local str = TableData.GetConfig(70010034, "BaseFixed").array_value
  return Split(str, "|")
end

local GetAllBadgeId = function(suitId)
  local new = {}
  for _, v in pairs(suitId) do
    local data = TableData.GetConfig(v, "BaseBadgeSuit")
    if data then
      for i = 1, #data.badge_ids do
        new[data.badge_ids[i]] = true
      end
    end
  end
  return new
end

function BadgeData.GetSuitCountBySuitId(suitId)
  local num = 0
  if suitId then
    local allId = GetAllBadgeId(suitId)
    local badges = ActorData.GetAllBadge()
    if allId then
      for i, v in ipairs(badges) do
        if allId[v.badgeId] then
          num = num + 1
        end
      end
    end
  end
  return num
end

local CheckSuit = function(badgeId)
  if 0 == table.getLen(BadgeData.SuitId) then
    return true
  end
  local data = TableData.GetConfig(badgeId, "BaseBadge")
  if data and table.contain(BadgeData.SuitId, data.suit_group_id) then
    return true
  end
end
local CheckStar = function(badgeId, data)
  if 0 == table.getLen(BadgeData.StarNum) then
    return true
  end
  if data and BadgeData.StarNum[data.star] then
    return true
  end
end
local CheckMainAttribute = function(mainAttributeId)
  if 0 == table.getLen(BadgeData.MainAttribute) then
    return true
  end
  local data = TableData.GetConfig(mainAttributeId, "BaseBadgeAttribute")
  if data and table.contain(BadgeData.MainAttribute, data.type) then
    return true
  end
end
local CheckViceAttribute = function(viceAttributeId)
  if 0 == table.getLen(BadgeData.ViceAttribute) then
    return true
  end
  local data
  local allType = {}
  for i, v in pairs(viceAttributeId) do
    data = TableData.GetConfig(v, "BaseBadgeAttribute")
    allType[data.type] = true
  end
  local bol = true
  for i, v in pairs(BadgeData.ViceAttribute) do
    if not allType[v] then
      bol = false
      break
    end
  end
  return bol
end

function BadgeData.GetDefaultScreeningResult(type, firstBadgeUid, reverseSort, notShowWear)
  local badges = ActorData.GetAllBadge()
  local newBadges = {}
  local tempFirstData, wear
  for i, v in ipairs(badges) do
    local data = TableData.GetConfig(v.badgeId, "BaseBadge")
    wear = not notShowWear and true or 0 == v.wearCardId
    if data and (0 == type or data.type == type) and wear then
      if firstBadgeUid and v.badgeUid == firstBadgeUid then
        tempFirstData = {
          data = data,
          info = SimpleCopy(v)
        }
      elseif CheckSuit(v.badgeId) and CheckStar(v.badgeId, data) and CheckMainAttribute(v.mainAttribute) and CheckViceAttribute(v.viceAttributes) then
        table.insert(newBadges, {
          data = data,
          info = SimpleCopy(v)
        })
      end
    end
  end
  if BadgeData.sortType == nil or BadgeData.sortType == BADGE_SORT_TYPE_ENUM.STAR then
    newBadges = BadgeData.SortByStar(newBadges)
  else
    newBadges = BadgeData.SortByLevel(newBadges)
  end
  if reverseSort then
    newBadges = table.reverseTable(newBadges)
  end
  if tempFirstData then
    table.insert(newBadges, 1, tempFirstData)
  end
  return newBadges
end

local SortBySuit = function(a, b)
  local temp1, temp2
  if a.data.suit_group_id == b.data.suit_group_id then
    temp1 = #a.info.viceAttributes
    temp2 = #b.info.viceAttributes
    if temp1 == temp2 then
      return a.info.badgeId > b.info.badgeId
    else
      return temp1 > temp2
    end
  else
    temp1 = TableData.GetConfig(a.data.suit_group_id, "BaseBadgeSuitGroup")
    temp2 = TableData.GetConfig(b.data.suit_group_id, "BaseBadgeSuitGroup")
    return temp1.sort < temp2.sort
  end
end
local GetSortValue = function(id)
  local data = TableData.GetConfig(id, "BaseBadgeAttribute")
  if data then
    local bol, k = table.contain(BadgeData.SortAttribute, data.type)
    if bol then
      return k
    end
  end
end

function BadgeData.SortByStar(badges)
  local sort = function(a, b)
    if #BadgeData.SortAttribute > 0 then
      local aSort = GetSortValue(a.info.mainAttribute)
      local bSort = GetSortValue(b.info.mainAttribute)
      if aSort and bSort then
        return aSort < bSort
      elseif aSort and nil == bSort then
        return true
      elseif nil == aSort and bSort then
        return false
      else
        return SortBySuit(a, b)
      end
    else
      return SortBySuit(a, b)
    end
  end
  local aSort, bSort
  table.sort(badges, function(a, b)
    aSort = 0 ~= a.info.wearCardId
    bSort = 0 ~= b.info.wearCardId
    if aSort and bSort then
      if a.data.star == b.data.star then
        return sort(a, b)
      else
        return a.data.star > b.data.star
      end
    elseif aSort and false == bSort then
      return true
    elseif false == aSort and bSort then
      return false
    elseif a.data.star == b.data.star then
      return sort(a, b)
    else
      return a.data.star > b.data.star
    end
  end)
  return badges
end

local StarBySort = function(a, b)
  local aSort, bSort
  aSort = 0 ~= a.info.wearCardId
  bSort = 0 ~= b.info.wearCardId
  if aSort and bSort then
    if a.data.star == b.data.star then
      return SortBySuit(a, b)
    else
      return a.data.star > b.data.star
    end
  elseif aSort and false == bSort then
    return true
  elseif false == aSort and bSort then
    return false
  elseif a.data.star == b.data.star then
    return SortBySuit(a, b)
  else
    return a.data.star > b.data.star
  end
end

function BadgeData.SortByLevel(badges)
  table.sort(badges, function(a, b)
    if a.info.level == b.info.level then
      if #BadgeData.SortAttribute > 0 then
        local aSort = GetSortValue(a.info.mainAttribute)
        local bSort = GetSortValue(b.info.mainAttribute)
        if aSort and bSort then
          return aSort < bSort
        elseif aSort and nil == bSort then
          return true
        elseif nil == aSort and bSort then
          return false
        else
          return StarBySort(a, b)
        end
      else
        return StarBySort(a, b)
      end
    else
      return a.info.level > b.info.level
    end
  end)
  return badges
end
