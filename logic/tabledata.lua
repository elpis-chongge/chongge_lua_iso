local TableData = {delayClear = false}
local require = require
local package = package
local globalTableCache = {}

function TableData.ClearCache(tableName)
  _G[tableName] = nil
  package.loaded[tableName] = nil
  globalTableCache[tableName] = nil
end

function TableData.ClearAllCache()
  globalTableCache = {}
end

function TableData.GetTable(tableName)
  if nil == globalTableCache[tableName] then
    require(tableName)
    local config = _G[tableName]
    if config.step then
      config.requiredSplitTable = {}
    end
    globalTableCache[tableName] = config
    _G[tableName] = nil
    package.loaded[tableName] = nil
  end
  return globalTableCache[tableName]
end

function TableData.GetConfig(id, tableName, noPrint)
  local config = TableData.GetTable(tableName)
  if config then
    if IsBattleServer ~= true and nil == config[id] then
      if config.step then
        local index = math.floor((id - config.minId) / config.step)
        if nil == config.requiredSplitTable[index] then
          if id > config.maxId or id < config.minId then
            print("id不存在", tableName, id)
            return
          end
          local childTableName = tableName .. "Part" .. index
          local state = pcall(require, childTableName)
          if true == state then
            local childTableConfig = _G[childTableName]
            if childTableConfig then
              for i, v in pairs(childTableConfig) do
                config[i] = v
              end
            end
            _G[childTableName] = nil
            package.loaded[childTableName] = nil
            config.requiredSplitTable[index] = 1
          else
            return
          end
        end
      end
      if nil == config[id] and true ~= noPrint then
        print("未找到配置", tableName, id)
        return
      end
    end
    return config[id]
  end
end

function TableData.GetConfigByType(type, id)
  local tupleType = ProtoEnum.TUPLE_TYPE
  if type == tupleType.ITEM then
    return TableData.GetConfig(id, "BaseItem")
  elseif type == tupleType.CARD then
    return TableData.GetConfig(id, "BaseCard")
  elseif type == tupleType.BADGE then
    return TableData.GetConfig(id, "BaseBadge")
  elseif type == tupleType.T_FASHION then
    return TableData.GetConfig(id, "BaseFashion")
  end
end

function TableData.GetTupleTypeById(id)
  if TableData.GetConfig(id, "BaseItem") then
    return ProtoEnum.TUPLE_TYPE.ITEM
  elseif TableData.GetConfig(id, "BaseBadge") then
    return ProtoEnum.TUPLE_TYPE.BADGE
  elseif TableData.GetConfig(id, "BaseCard") then
    return ProtoEnum.TUPLE_TYPE.CARD
  elseif TableData.GetConfig(id, "BaseFashion") then
    return ProtoEnum.TUPLE_TYPE.T_FASHION
  end
end

return TableData
