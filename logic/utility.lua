local type = type

function _G.tableToString(t)
  local string_format = string.format
  local string_rep = string.rep
  local address = {}
  if "userdata" == type(t) then
    return tableToString(getmetatable(t))
  end
  if "table" ~= type(t) then
    print(t)
    return
  end
  address[t] = 0
  local ret = ""
  local space, deep = string_rep(" ", 4), 0
  
  local function _dump(t)
    local temp = {}
    for k, v in pairs(t) do
      local key = tostring(k)
      if "table" == type(v) and not address[v] then
        address[v] = 0
        deep = deep + 2
        ret = ret .. string_format([[
%s[%s] => Table
%s(
]], string_rep(space, deep - 1), key, string_rep(space, deep))
        _dump(v)
        ret = ret .. string_format("%s)\n", string_rep(space, deep))
        deep = deep - 2
      else
        if "string" ~= type(v) then
          v = tostring(v)
        end
        ret = ret .. string_format("%s[%s] => %s\n", string_rep(space, deep + 1), key, v)
      end
    end
  end
  
  ret = ret .. string_format([[
Table
(
]])
  _dump(t)
  ret = ret .. string_format(")\n")
  return ret
end

function _G.GetDivideStringList(sourceString)
  local divideList = {}
  local len = string.len(sourceString)
  local stPos = 1
  local utf8Sign = {
    192,
    224,
    240,
    248,
    252
  }
  while len >= stPos do
    local sign = string.byte(sourceString, stPos)
    local chLen = 1
    for i = 1, 6 do
      if sign < utf8Sign[i] then
        chLen = i
        break
      end
    end
    local ch = string.sub(sourceString, stPos, stPos + chLen - 1)
    stPos = stPos + chLen
    table.insert(divideList, ch)
  end
  return divideList
end
