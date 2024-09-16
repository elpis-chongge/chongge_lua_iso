local type = type
local s_sub = string.sub
local s_find = string.find
local s_len = string.len
local s_format = string.format
local t_concat = table.concat
local t_sort = table.sort
local pairs = pairs
local tostring = tostring

function table.getMaxKey(t)
  local maxKey = 0
  for i, v in pairs(t) do
    if "number" == type(i) then
      maxKey = math.max(i, maxKey)
    end
  end
  return maxKey
end

function table.contain(t, value)
  for k, v in pairs(t) do
    if v == value then
      return true, k
    end
  end
  return false
end

function table.getLen(t)
  local count = 0
  for i, v in pairs(t) do
    if v then
      count = count + 1
    end
  end
  return count
end

function table.randomSort(t)
  if "table" ~= type(t) then
    return
  end
  local _result = {}
  local _index = 1
  while 0 ~= #t do
    local ran = math.random(0, #t)
    if nil ~= t[ran] then
      _result[_index] = t[ran]
      table.remove(t, ran)
      _index = _index + 1
    end
  end
  return _result
end

function table.randomx(m, n, cnt)
  if cnt > n - m + 1 then
    return {}
  end
  local t = {}
  local tmp = {}
  while cnt > 0 do
    local x = math.random(m, n)
    if not tmp[x] then
      t[#t + 1] = x
      tmp[x] = 1
      cnt = cnt - 1
    end
  end
  return t
end

function table.equal(tableA, tableB)
  for i, v in pairs(tableA) do
    if tableB[i] then
      if type(v) == type(tableB[i]) then
        if "table" == type(v) then
          if table.equal(v, tableB[i]) == false then
            return false
          end
        elseif v ~= tableB[i] then
          return false
        end
      else
        return false
      end
    else
      return false
    end
  end
  for i, v in pairs(tableB) do
    if tableA[i] then
      if type(v) == type(tableA[i]) then
        if "table" == type(v) then
          if table.equal(v, tableA[i]) == false then
            return false
          end
        elseif v ~= tableA[i] then
          return false
        end
      else
        return false
      end
    else
      return false
    end
  end
  return true
end

function table.reverseTable(t)
  if "table" ~= type(t) then
    return
  end
  local tmp = {}
  for i = 1, #t do
    local key = #t + 1 - i
    tmp[i] = t[key]
  end
  return tmp
end

function table.clear(t)
  for k, _ in pairs(t) do
    t[k] = nil
  end
end

function table.keyof(t, value, member)
  for k, v in pairs(t) do
    if "string" == type(member) then
      if v[member] == value then
        return k
      end
    elseif v == value then
      return k
    end
  end
end

function table.swapByIndex(t, index_a, index_b)
  local a = t[index_a]
  t[index_a] = t[index_b]
  t[index_b] = a
end

function table.mapKey2Array(map, sortFunc)
  local array = {}
  for i, v in pairs(map) do
    array[#array + 1] = i
  end
  if sortFunc then
    sortFunc(array)
  end
  return array
end

function table.map2Array(map, sortFunc)
  local array = {}
  for _, v in pairs(map) do
    array[#array + 1] = v
  end
  if sortFunc then
    sortFunc(array)
  end
  return array
end

function string.getByteCount(str)
  if string.len(str) <= 0 then
    return 0
  end
  local realByteCount = #str
  local length = 0
  local curBytePos = 1
  while true do
    local step = 1
    local byteVal = string.byte(str, curBytePos)
    if byteVal > 239 then
      step = 4
    elseif byteVal > 223 then
      step = 3
    elseif byteVal > 191 then
      step = 2
    else
      step = 1
    end
    curBytePos = curBytePos + step
    length = length + 1
    if realByteCount < curBytePos then
      break
    end
  end
  return length
end

function string.trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function string.isEmptyOrNil(s)
  return nil == s or "" == s
end

local stringBuilder = CS and CS.System.Text.StringBuilder()

function string.formatNum(num, gap)
  if stringBuilder then
    local integer, frac = math.modf(num)
    stringBuilder:Clear()
    stringBuilder:Append(tostring(integer))
    local length = stringBuilder.Length
    local head, tail = length - gap + 1, length
    while tail > 0 do
      local index = head - 1
      if index > 0 then
        stringBuilder:Insert(index, ",")
      end
      head = math.max(1, head - gap)
      tail = tail - gap
    end
    if frac > 0 then
      length = stringBuilder.Length
      stringBuilder:AppendFormat("{0:F2}", frac)
      stringBuilder:Remove(length, 1)
    end
    return stringBuilder:ToString()
  end
end

local replaceTableNil = function(t)
  if t then
    local maxKey = table.getMaxKey(t)
    if maxKey > 0 then
      for i = 1, maxKey do
        if nil == t[i] then
          t[i] = "nil"
        elseif "string" ~= type(t[i]) then
          t[i] = tostring(t[i])
        end
      end
    end
  end
  return t
end
local unityLog = CS and CS.UnityEngine.Debug.Log

function print(...)
  if unityLog then
    local args = {
      ...
    }
    args = replaceTableNil(args)
    unityLog(t_concat(args, "    "))
  end
end

local unityLogWarning = CS and CS.UnityEngine.Debug.LogWarning

function printWarning(...)
  if unityLogWarning then
    local args = {
      ...
    }
    args = replaceTableNil(args)
    unityLogWarning(t_concat(args, "    "))
  end
end

local unityLogError = CS and CS.UnityEngine.Debug.LogError

function printError(...)
  if unityLogError then
    local args = {
      ...
    }
    args = replaceTableNil(args)
    unityLogError(t_concat(args, "    "))
  end
end

function Split(s, delim)
  if nil == s or nil == delim then
    return {}
  end
  if "string" ~= type(delim) or s_len(delim) <= 0 then
    return {}
  end
  if s_len(s) <= 0 then
    return {}
  end
  local start = 1
  local t = {}
  while true do
    local pos = s_find(s, delim, start, true)
    if not pos then
      break
    end
    t[#t + 1] = s_sub(s, start, pos - 1)
    start = pos + s_len(delim)
  end
  t[#t + 1] = s_sub(s, start)
  return t
end

function ParseConfigStr(str, delim_1, delim_2)
  local split = Split
  local mTable = {}
  local configs = split(str, delim_1 or ";")
  for i = 1, #configs do
    local data = split(configs[i], delim_2 or ":")
    mTable[#mTable + 1] = data
  end
  return mTable
end

function T(id, ...)
  if "string" == type(id) then
    id = tonumber(id)
  end
  if IsBattleServer == nil then
    local configName = Language.wordConfigName
    local config = TableData.GetConfig(id, configName)
    if config and config.name then
      return s_format(config.name, ...)
    end
    if config and config.sub_name then
      return s_format(config.sub_name, ...)
    end
    return s_format("未配置：%d", id)
  else
    return ""
  end
end

function T_S(id, ...)
  if "string" == type(id) then
    id = tonumber(id)
  end
  if IsBattleServer == nil then
    local configName = Language.plotWordConfigName
    local config = TableData.GetConfig(id, configName)
    if config and config.name then
      return s_format(config.name, ...)
    end
    return "剧情文字未配置：" .. id
  else
    return ""
  end
end

function PrintTable(root, frontStr, name)
  local cache = {
    [root] = "."
  }
  local result = ""
  
  local function _dump(t, space, t_name)
    local temp = {}
    local tableKey = {}
    for key in pairs(t) do
      if nil ~= key then
        tableKey[#tableKey + 1] = key
      end
    end
    t_sort(tableKey, function(a, b)
      return a < b
    end)
    for i = 1, #tableKey do
      local key = tableKey[i]
      local v = t[key]
      if "number" == type(key) then
        key = t_concat({
          "[",
          key,
          "]"
        })
      else
        key = tostring(key)
      end
      if cache[v] then
        temp[#temp + 1] = t_concat({
          "\n",
          key,
          " = {",
          cache[v],
          [[

},]]
        })
      elseif "table" == type(v) then
        local new_key = t_concat({
          t_name,
          ".",
          key
        })
        cache[v] = new_key
        temp[#temp + 1] = t_concat({
          key,
          " = { \n",
          _dump(v, "", new_key),
          [[

},]]
        })
      else
        if "string" == type(v) then
          v = t_concat({
            "\"",
            v,
            "\""
          })
        end
        temp[#temp + 1] = t_concat({
          key,
          "=",
          tostring(v),
          ","
        })
      end
    end
    return t_concat(temp, "\n")
  end
  
  local str = frontStr or ""
  if nil ~= name then
    if "ReqHeartBeat" == name or "ResHeartBeat" == name then
      result = t_concat({
        str,
        " ",
        name,
        "\n",
        _dump(root, "", "")
      })
      print(result)
    else
      result = t_concat({
        str,
        " ",
        name,
        "\n",
        _dump(root, "", "")
      })
      printWarning(result)
    end
  else
    result = t_concat({
      str,
      "= {\n",
      _dump(root, "", ""),
      [[

}]]
    })
    printWarning(result)
  end
  return result
end

local function CopyOne(t2, t1)
  if "table" == type(t1) then
    for k, v in pairs(t1) do
      if "table" == type(v) then
        local d2 = {}
        CopyOne(d2, v)
        t2[k] = d2
      else
        t2[k] = v
      end
    end
  end
end

function SimpleCopy(t1)
  if nil == t1 then
    return {}
  end
  local t2 = {}
  CopyOne(t2, t1)
  return t2
end

function CompareNum(symbol, Num1, Num2)
  local num1 = tonumber(Num1)
  local num2 = tonumber(Num2)
  local COMPARE_TYPE = COMPARE_TYPE
  if symbol == COMPARE_TYPE.GREATER then
    return num1 > num2
  elseif symbol == COMPARE_TYPE.EQUAL then
    return num1 == num2
  elseif symbol == COMPARE_TYPE.LESS then
    return num1 < num2
  elseif symbol == COMPARE_TYPE.LESS_EQUAL then
    return num1 <= num2
  elseif symbol == COMPARE_TYPE.GREATER_EQUAL then
    return num1 >= num2
  elseif symbol == COMPARE_TYPE.NOT_EQUAL then
    return num1 ~= num2
  end
end

function GetAddAttrList(add_attr, keyArr)
  local attrList = {}
  if add_attr then
    local split = Split
    local addType, attrId, addValue, addValuePer, tipsType, oneAddAttr
    for i = 1, #add_attr do
      local addAttr = split(add_attr[i], ":")
      if addAttr and #addAttr > 1 then
        if 3 == #addAttr then
          addType = tonumber(addAttr[1])
          attrId = tonumber(addAttr[2])
          if 1 == addType then
            addValue = tonumber(addAttr[3])
            addValuePer = 0
          elseif 2 == addType then
            addValue = 0
            addValuePer = tonumber(addAttr[3])
          end
        elseif 2 == #addAttr then
          attrId = tonumber(addAttr[1])
          addValue = tonumber(addAttr[2])
          addValuePer = 0
        elseif 4 == #addAttr then
          addType = tonumber(addAttr[1])
          attrId = tonumber(addAttr[2])
          tipsType = tonumber(addAttr[4])
          if 1 == addType then
            addValue = tonumber(addAttr[3])
            addValuePer = 0
          elseif 2 == addType then
            addValue = 0
            addValuePer = tonumber(addAttr[3])
          end
        end
        oneAddAttr = {
          type = addType,
          id = attrId,
          value = addValue,
          tipsType = tipsType,
          valuePer = addValuePer
        }
        if keyArr then
          attrList[#attrList + 1] = oneAddAttr
        else
          attrList[attrId] = oneAddAttr
        end
      end
    end
  end
  return attrList
end

function GetConfigItemList(item_str, keyArr)
  local itemList = {}
  if item_str then
    local split = Split
    local itemType, itemId, count, tipsType, oneItem
    for i = 1, #item_str do
      local addAttr = split(item_str[i], ":")
      if addAttr and #addAttr > 1 then
        if 3 == #addAttr then
          itemType = tonumber(addAttr[1])
          itemId = tonumber(addAttr[2])
          count = tonumber(addAttr[3])
        elseif 2 == #addAttr then
          itemId = tonumber(addAttr[1])
          count = tonumber(addAttr[2])
        elseif 4 == #addAttr then
          itemType = tonumber(addAttr[1])
          itemId = tonumber(addAttr[2])
          count = tonumber(addAttr[3])
          tipsType = tonumber(addAttr[4])
        end
        oneItem = {
          type = itemType,
          id = itemId,
          value = count,
          tipsType = tipsType
        }
        if keyArr then
          itemList[#itemList + 1] = oneItem
        else
          itemList[itemId] = oneItem
        end
      end
    end
  end
  return itemList
end

function GetStageRewardShow(item_str, keyArr)
  local itemList = {}
  if item_str then
    local split = Split
    local oneItem, itemId
    for i = 1, #item_str do
      local addAttr = split(item_str[i], ":")
      if addAttr and 4 == #addAttr then
        itemId = tonumber(addAttr[3])
        oneItem = {
          type = tonumber(addAttr[1]),
          itemType = tonumber(addAttr[2]),
          id = itemId,
          tipsType = tonumber(addAttr[4])
        }
        if keyArr then
          itemList[#itemList + 1] = oneItem
        else
          itemList[itemId] = oneItem
        end
      end
    end
  end
  return itemList
end

function MergeTable(table1, table2)
  for id, info in pairs(table2) do
    if table1[id] then
      table1[id].value = info.value + table1[id].value
      table1[id].valuePer = info.valuePer + table1[id].valuePer
    else
      table1[id] = info
    end
  end
end

function IsNil(gameObject)
  return nil == gameObject or gameObject:Equals(nil)
end

function FormatUin(key)
  local uin = ActorData.GetUin()
  if uin then
    return uin .. "_" .. key
  else
    return key
  end
end

function FormatOpenId(key)
  return LoginData.openId .. "_" .. key
end

function FormatValidateNum(num)
  if num <= 0 then
    return 0
  else
    local t1, t2 = math.modf(num)
    if t2 > 0 then
      return num
    else
      return t1
    end
  end
end

function FormatStrByLen(s, length)
  local getIndex = function(str, count)
    local len = #str
    local left = len
    local cnt = 0
    local strIndex
    local arr = {
      0,
      192,
      224,
      240,
      248,
      252
    }
    while 0 ~= left do
      local tmp = string.byte(str, -left)
      local i = #arr
      while arr[i] do
        if tmp >= arr[i] then
          left = left - i
          break
        end
        i = i - 1
      end
      cnt = cnt + 1
      if cnt == count then
        strIndex = len - left
      end
    end
    return cnt, strIndex
  end
  local num, endIndex = getIndex(s, length - 1)
  if length <= num then
    return T(382, string.sub(s, 0, endIndex))
  else
    return s
  end
end

function GetPreciseDecimal(nNum, n)
  if "number" ~= type(nNum) then
    return nNum
  end
  n = n or 0
  if 0 == n then
    local integer = math.modf(nNum)
    return integer
  end
  n = math.floor(n)
  if n < 0 then
    n = 0
  end
  local nDecimal = 10 ^ n
  local nTemp = math.floor(nNum * nDecimal)
  local nRet = nTemp / nDecimal
  return nRet
end

function DicToTable(CSharpDic)
  local dic = {}
  if CSharpDic then
    local iter = CSharpDic:GetEnumerator()
    while iter:MoveNext() do
      local k = iter.Current.Key
      local v = iter.Current.Value
      dic[k] = v
    end
  end
  return dic
end

function DataTableToTable(CSharpDataTable)
end

function ListToTable(CSharpList)
  local list = {}
  if CSharpList then
    local index = 1
    local iter = CSharpList:GetEnumerator()
    while iter:MoveNext() do
      local v = iter.Current
      list[index] = v
      index = index + 1
    end
  else
    logError("Error,CSharpList is null")
  end
  return list
end

function GetBuyExpend(buyType, num)
  local config = TableData.GetTable("BaseBuyTime")
  for i, v in pairs(config) do
    if v.type == buyType and num >= v.start and num <= v.finish then
      local costList = GetConfigItemList(v.cost)
      for ii, vv in pairs(costList) do
        return vv, v.finish
      end
    end
  end
end

function GetDiamondConvertValue()
  local config = TableData.GetConfig(COMMON_ITEM_ID.RECHARGE_DIAMOND, "BaseItem")
  if config and config.effect_value then
    local itemConfig
    local arr = Split(config.effect_value, ":")
    if 3 == #arr then
      itemConfig = {
        type = tonumber(arr[1]),
        id = tonumber(arr[2]),
        value = tonumber(arr[3])
      }
      return itemConfig
    end
  end
end

function LevelIsWithTheRange(fixedId)
  local config = TableData.GetConfig(fixedId, "BaseFixed")
  if config then
    local arr = Split(config.array_value, "|")
    local lv = ActorData.GetLevel()
    if 2 == #arr and lv >= tonumber(arr[1]) and lv <= tonumber(arr[2]) then
      return true
    end
  end
end

function PowerRankIsWithTheRange(fixedId, cardId, cardList)
  local config = TableData.GetConfig(fixedId, "BaseFixed")
  if config then
    local rank = CardMgr.GetPowerRank(cardList, cardId)
    if config.int_value and rank and rank <= config.int_value then
      return true
    end
  end
end

function GetActivityWeight(activityId)
  local config = TableData.GetConfig(activityId, "BaseActivity")
  if config and config.open_sort then
    return config.open_sort
  end
end

function GetHomeRedDotSort(featureId)
  local config = TableData.GetConfig(featureId, "BaseFeature")
  if config and config.red_point_priority then
    return config.red_point_priority
  end
end

function Decimal2Binary(num, bitCount, sep)
  bitCount = bitCount or 7
  local t = {}
  for i = bitCount, 0, -1 do
    t[#t + 1] = math.floor(num / 2 ^ i)
    num = num % 2 ^ i
  end
  return table.concat(t, sep or ""), t
end

local savedDefaultPlatformFPSLevel

function GetDefaultPlatformFPSLevel()
  if savedDefaultPlatformFPSLevel then
    return savedDefaultPlatformFPSLevel
  end
  savedDefaultPlatformFPSLevel = 1
  return savedDefaultPlatformFPSLevel
end

function GetDefaultScreenAdaptRatio()
  return UIMgr.DefaultScreenAdaptRatio
end

function NumberByCommaStyle(numTmp)
  local resultNum = numTmp
  if "number" == type(numTmp) then
    local inter, point = math.modf(numTmp)
    local strNum = tostring(inter)
    local newStr = ""
    local numLen = string.len(strNum)
    local count = 0
    for i = numLen, 1, -1 do
      if 0 == count % 3 and 0 ~= count then
        newStr = string.format("%s,%s", string.sub(strNum, i, i), newStr)
      else
        newStr = string.format("%s%s", string.sub(strNum, i, i), newStr)
      end
      count = count + 1
    end
    if point > 0 then
      local strPoint = string.format("%.2f", point)
      resultNum = string.format("%s%s", newStr, string.sub(strPoint, 2, string.len(strPoint)))
    else
      resultNum = newStr
    end
  end
  return resultNum
end
