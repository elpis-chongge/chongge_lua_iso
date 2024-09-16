local tideDungeons
local SetTideDungeonInfo = function(info)
  tideDungeons = tideDungeons or {}
  local key = table.keyof(tideDungeons, info.sceneType, "sceneType")
  if not key then
    table.insert(tideDungeons, info)
  else
    tideDungeons[key] = info
  end
end
local GetTideDungeonInfo = function(type)
  if not tideDungeons then
    return
  end
  local key = table.keyof(tideDungeons, type, "sceneType")
  if key then
    return tideDungeons[key]
  end
end
local Clear = function()
  tideDungeons = nil
end
return {
  SetTideDungeonInfo = SetTideDungeonInfo,
  GetTideDungeonInfo = GetTideDungeonInfo,
  Clear = Clear
}
