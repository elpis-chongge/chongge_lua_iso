local MINI_GAME_DURATION = 30
local ROW, COL = 3, 3
local FLOWER_ENUM = {
  A = 1,
  B = 2,
  C = 3
}
local FLOWER_GEN_DELAY = {
  [FLOWER_ENUM.A] = 0,
  [FLOWER_ENUM.B] = 5.5,
  [FLOWER_ENUM.C] = 15.7
}
local FLOWER_GEN_INTERVAL = {
  [FLOWER_ENUM.A] = {
    {elapse = 16, interval = 1},
    {elapse = 28, interval = 0.5}
  },
  [FLOWER_ENUM.B] = {
    {elapse = 18, interval = 2},
    {elapse = 25, interval = 1},
    {elapse = 28, interval = 0.5}
  },
  [FLOWER_ENUM.C] = {
    {elapse = 25, interval = 2},
    {elapse = 28, interval = 1}
  }
}
local FLOWER_GEN_INTERVAL_MIN = {
  [FLOWER_ENUM.A] = 0.5,
  [FLOWER_ENUM.B] = 0.5,
  [FLOWER_ENUM.C] = 0.5
}
local FLOWER_GEN_INTERVAL_DELTA = {
  [FLOWER_ENUM.A] = 0,
  [FLOWER_ENUM.B] = 0,
  [FLOWER_ENUM.C] = 0
}
local FLOWER_DISAPPEAR_INTERVAL = {
  [FLOWER_ENUM.A] = 2,
  [FLOWER_ENUM.B] = 2,
  [FLOWER_ENUM.C] = 2
}
local FLOWER_GEN_THRESHOLD = {
  [FLOWER_ENUM.A] = 40,
  [FLOWER_ENUM.B] = 20,
  [FLOWER_ENUM.C] = 8
}
local start, pause, complete, miniGameElapse, positions, availablePositions, flowerGenIntervals, flowerGenIntervalDeltas, flowerGenNums, __oncreateflower, __ondeleteflower, __onelapse, __onend
local IndexToRowCol = function(index)
  local row = math.ceil(index / COL)
  local col = index - (row - 1) * COL
  return row, col
end
local RowColToIndex = function(row, col)
  return (row - 1) * COL + col
end
local UpdateAvailablePositions = function()
  table.clear(availablePositions)
  for i, v in ipairs(positions) do
    if not v then
      table.insert(availablePositions, i)
    end
  end
end
local reusableFlowers, flowers
local CreateFlower = function(flowerType, index)
  local inst
  if reusableFlowers and _G.next(reusableFlowers) then
    inst = table.remove(reusableFlowers)
  else
    inst = {}
  end
  inst.type = flowerType
  local row, col = IndexToRowCol(index)
  inst.row = row
  inst.col = col
  inst.position = index
  inst.disappearTimer = FLOWER_DISAPPEAR_INTERVAL[flowerType]
  positions[index] = inst
  UpdateAvailablePositions()
  table.insert(flowers, inst)
  if type(__oncreateflower) == "function" then
    __oncreateflower(index, flowerType)
  end
end
local DeleteFlower = function(index)
  if pause or complete then
    return false
  end
  if index > 0 and index <= #positions then
    local inst = positions[index]
    positions[index] = false
    if inst then
      if type(__ondeleteflower) == "function" then
        __ondeleteflower(index, UpdateAvailablePositions)
      else
        UpdateAvailablePositions()
      end
      local i = table.keyof(flowers, inst)
      if i then
        table.remove(flowers, i)
      end
      table.insert(reusableFlowers, inst)
      return true, inst.type
    end
  end
  return false
end
local GetFlowerInterval = function(f_type, elapse)
  local result = 0
  local interval = FLOWER_GEN_INTERVAL[f_type]
  if type(interval) == "table" then
    for _, entry in ipairs(interval) do
      if elapse < entry.elapse then
        result = entry.interval
        break
      end
    end
  else
    result = interval + FLOWER_GEN_INTERVAL_DELTA[f_type] * elapse
  end
  return result
end
local Update = function()
  if complete then
    return
  end
  if not start then
    return
  end
  if pause then
    return
  end
  local deltaTime = Time.deltaTime
  miniGameElapse = miniGameElapse + deltaTime
  if type(__onelapse) then
    __onelapse(miniGameElapse)
  end
  for _, v in pairs(FLOWER_ENUM) do
    local delay = FLOWER_GEN_DELAY[v]
    if delay <= miniGameElapse and MINI_GAME_DURATION - miniGameElapse >= 1.5 then
      local num = flowerGenNums[v]
      if num > 0 then
        local interval = flowerGenIntervals[v]
        interval = interval - deltaTime
        flowerGenIntervals[v] = interval
        if interval <= 0 then
          local minVal = FLOWER_GEN_INTERVAL_MIN[v]
          flowerGenIntervals[v] = math.max(minVal, GetFlowerInterval(v, miniGameElapse))
          local n = #availablePositions
          if n > 0 then
            local position = availablePositions[math.random(1, n)]
            CreateFlower(v, position)
            flowerGenNums[v] = num - 1
          end
        end
      end
    end
  end
  if miniGameElapse > MINI_GAME_DURATION then
    if not complete and type(__onend) == "function" then
      __onend()
    end
    complete = true
  end
  if flowers then
    local n = #flowers
    for i = n, 1, -1 do
      local flower = flowers[i]
      flower.disappearTimer = flower.disappearTimer - deltaTime
      if flower.disappearTimer <= 0 then
        DeleteFlower(flower.position)
      end
    end
  end
end
local Init = function()
  positions = positions or {}
  availablePositions = availablePositions or {}
  table.clear(positions)
  table.clear(availablePositions)
  local n = RowColToIndex(ROW, COL)
  for i = 1, n do
    positions[i] = false
  end
  UpdateAvailablePositions()
  flowers = flowers or {}
  reusableFlowers = reusableFlowers or {}
  flowerGenIntervals = flowerGenIntervals or {}
  flowerGenIntervalDeltas = flowerGenIntervalDeltas or {}
  flowerGenNums = flowerGenNums or {}
  table.clear(flowers)
  table.clear(reusableFlowers)
  table.clear(flowerGenIntervals)
  table.clear(flowerGenIntervalDeltas)
  table.clear(flowerGenNums)
  for _, v in pairs(FLOWER_ENUM) do
    flowerGenIntervals[v] = 0
    flowerGenIntervalDeltas[v] = 0
    flowerGenNums[v] = FLOWER_GEN_THRESHOLD[v]
  end
end
local Release = function()
  if flowers then
    for i, v in ipairs(flowers) do
      table.insert(reusableFlowers, v)
    end
    table.clear(flowers)
  end
end
local Start = function(onCreateFlower, onDeleteFlower, onElapse, onEnd)
  Init()
  start = true
  pause = false
  complete = false
  miniGameElapse = 0
  __oncreateflower = onCreateFlower
  __ondeleteflower = onDeleteFlower
  __onelapse = onElapse
  __onend = onEnd
  UpdateManager.RemoveUpdateHandler(Update)
  UpdateManager.AddUpdateHandler(Update)
end
local Exit = function()
  UpdateManager.RemoveUpdateHandler(Update)
  start = false
  complete = true
  pause = false
  Release()
end
local Pause = function(val)
  pause = val
end
local IsPaused = function()
  return pause
end
local GetElapseTime = function()
  return miniGameElapse
end
return {
  Start = Start,
  Exit = Exit,
  Pause = Pause,
  IsPaused = IsPaused,
  DeleteFlower = DeleteFlower,
  GetElapseTime = GetElapseTime
}
