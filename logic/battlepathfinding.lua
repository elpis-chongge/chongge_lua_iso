BattlePathFinding = {}
local gridSplitNum = 2
local world = {}
local open = {}
local openMap = {}
local closed = {}
local path = {}
local maxX, maxY
local closedIndex = 0
local targetX = 0
local targetY = 0
local maxCheckTime = 40
local _pixelsPerUnit, _pathCeilLength, _initX, _initY
local math_abs = math.abs
local math_ceil = math.ceil
local cachedPath = {}

function BattlePathFinding.Init(countX, countY)
  BattlePathFinding.Clear()
  maxX = countX * gridSplitNum + 1
  maxY = countY * gridSplitNum + 1
  for i = 1, maxX do
    world[i] = {}
    for j = 1, maxY do
      world[i][j] = 0
    end
  end
  _pixelsPerUnit, _pathCeilLength, _initX, _initY = BattleScene.pixelsPerUnit, MathUtil.TruncateFloat(BattleScene.ceilLength / gridSplitNum), BattleScene.initX, BattleScene.initY
end

function BattlePathFinding.AddCloseIndex(x, y)
  if world[x] and world[x][y] then
    world[x][y] = 1
    if BattleMgr.showPathTest then
      BattlePathFinding.ChangeRed(x, y)
    end
  end
end

function BattlePathFinding.RemoveCloseIndex(x, y)
  if world[x] and world[x][y] then
    world[x][y] = 0
    if BattleMgr.showPathTest then
      BattlePathFinding.ChangeEmpty(x, y)
    end
  end
end

local GetPathIndexByPosition = function(x, y)
  local indexX = math_ceil(MathUtil.TruncateFloat(((x - _initX) * _pixelsPerUnit - _pathCeilLength / 2) / _pathCeilLength))
  local indexY = math_ceil(MathUtil.TruncateFloat(-((y - _initY) * _pixelsPerUnit - _pathCeilLength / 2) / _pathCeilLength))
  return indexX, indexY
end
BattlePathFinding.GetPathIndexByPosition = GetPathIndexByPosition
local GetPositionByPathIndex = function(indexX, indexY)
  return {
    x = _initX + MathUtil.TruncateFloat((indexX - 0.5) * _pathCeilLength / _pixelsPerUnit),
    y = 0,
    z = _initY - MathUtil.TruncateFloat((indexY - 0.5) * _pathCeilLength / _pixelsPerUnit)
  }
end

function BattlePathFinding.Clear()
  world = {}
  open = {}
  openMap = {}
  closed = {}
  cachedPath = {}
end

local DefineStart = function(x, y)
  open[1] = {
    x = x,
    y = y,
    parent = 0,
    g = 0,
    h = 0
  }
  openMap[x * 100 + y] = open[1]
end
local FindLowestF = function(nodeTable)
  local minF = 1000000
  local minFIndex = 0
  local curF = 0
  for i, v in ipairs(nodeTable) do
    curF = v.g + v.h
    if minF >= curF then
      minF = curF
      minFIndex = i
    end
  end
  return minFIndex
end
local FindH = function(curX, curY, tarX, tarY)
  return 10 * (math_abs(curX - tarX) + math_abs(curY - tarY))
end
local math_g_value = {
  [1] = 7,
  [2] = 8,
  [3] = 9,
  [4] = 10
}
local FindG = function(x, y, parent, g_value_index)
  local parentNode = closed[parent]
  local curValue = math_g_value[g_value_index]
  return parentNode.g + curValue
end
local NewOpenEntry = function(newX, newY, g_value_index)
  local myIndex = #open + 1
  local newOpen = {
    x = newX,
    y = newY,
    parent = closedIndex,
    g = FindG(newX, newY, closedIndex, g_value_index),
    h = FindH(newX, newY, targetX, targetY)
  }
  open[myIndex] = newOpen
  openMap[newX * 100 + newY] = newOpen
end
local AlreadyExists = function(newX, newY)
  return openMap[newX * 100 + newY]
end
local ProcessNode = function(newX, newY, g_value_index)
  local targetFound = false
  local existNode = AlreadyExists(newX, newY)
  if nil == existNode then
    if newX == targetX and newY == targetY then
      targetFound = true
    else
      NewOpenEntry(newX, newY, g_value_index)
    end
  else
    local existingG = existNode.g
    local parentG = closed[closedIndex].g
    local curValue = math_g_value[g_value_index]
    local newG = parentG + curValue
    if existingG > newG then
      existNode.parent = closedIndex
    end
  end
  return targetFound
end
local math_list = {}
local FindPath = function()
  local targetFound = false
  local openIndex = FindLowestF(open)
  closedIndex = #closed + 1
  local openNode = open[openIndex]
  if nil == openNode then
    return
  end
  local curX = openNode.x
  local curY = openNode.y
  closed[closedIndex] = {
    x = curX,
    y = curY,
    parent = openNode.parent,
    g = openNode.g,
    h = openNode.h
  }
  local myX, myY = 0, 0
  for k, v in ipairs(math_list) do
    myX = curX + v[1]
    myY = curY + v[2]
    if world[myX] and world[myX][myY] and (1 ~= world[myX][myY] or myX == targetX and myY == targetY) then
      targetFound = ProcessNode(myX, myY, k)
      if targetFound then
        break
      end
    end
  end
  openMap[openNode.x * 100 + openNode.y] = nil
  table.remove(open, openIndex)
  return targetFound
end
local ReverseTable = function(data)
  local temp = {}
  local totalCount = #data
  local endCount = totalCount
  for index = 1, totalCount do
    temp[index] = data[endCount]
    endCount = endCount - 1
  end
  return temp
end
local BuildPath = function()
  local count = 1
  path[count] = {x = targetX, y = targetY}
  count = count + 1
  local closedNode = closed[#closed]
  path[count] = {
    x = closedNode.x,
    y = closedNode.y
  }
  local newPathIndex = closedNode.parent
  local newClosedNode
  while 1 ~= newPathIndex do
    count = count + 1
    newClosedNode = closed[newPathIndex]
    path[count] = {
      x = newClosedNode.x,
      y = newClosedNode.y
    }
    newPathIndex = newClosedNode.parent
  end
  return path
end
local PlaceTarget = function(x, y)
  targetX = x
  targetY = y
  local targetFound = false
  if x <= maxX and x >= 1 and y <= maxY and y >= 1 then
    local time = 0
    repeat
      targetFound = FindPath()
      time = time + 1
    until targetFound or time >= maxCheckTime
    if targetFound then
      local result = BuildPath()
      return result
    else
      print_battle("没有找到路径")
    end
  end
end
local IsSameOrNeighbor = function(indexX1, indexY1, indexX2, indexY2)
  return (indexX1 - indexX2) ^ 2 <= 1 and (indexY1 - indexY2) ^ 2 <= 1
end
local InitMathList = function(x_dis, y_dis)
  if x_dis > 0 then
    if y_dis > 0 then
      if math_abs(x_dis) > math_abs(y_dis) then
        math_list = {
          [1] = {0, -1},
          [2] = {1, 0},
          [3] = {-1, 0},
          [4] = {0, 1}
        }
      else
        math_list = {
          [1] = {1, 0},
          [2] = {0, -1},
          [3] = {0, 1},
          [4] = {-1, 0}
        }
      end
    elseif math_abs(x_dis) > math_abs(y_dis) then
      math_list = {
        [1] = {0, 1},
        [2] = {1, 0},
        [3] = {-1, 0},
        [4] = {0, -1}
      }
    else
      math_list = {
        [1] = {1, 0},
        [2] = {0, 1},
        [3] = {0, -1},
        [4] = {-1, 0}
      }
    end
  elseif y_dis > 0 then
    if math_abs(x_dis) > math_abs(y_dis) then
      math_list = {
        [1] = {0, -1},
        [2] = {-1, 0},
        [3] = {1, 0},
        [4] = {0, 1}
      }
    else
      math_list = {
        [1] = {-1, 0},
        [2] = {0, -1},
        [3] = {0, 1},
        [4] = {1, 0}
      }
    end
  elseif math_abs(x_dis) > math_abs(y_dis) then
    math_list = {
      [1] = {0, 1},
      [2] = {-1, 0},
      [3] = {1, 0},
      [4] = {0, -1}
    }
  else
    math_list = {
      [1] = {-1, 0},
      [2] = {0, 1},
      [3] = {0, -1},
      [4] = {1, 0}
    }
  end
end

function BattlePathFinding.FindPath(startPosition, targetPosition)
  local startIndexX, startIndexY = GetPathIndexByPosition(startPosition.x, startPosition.z)
  local targetIndexX, targetIndexY = GetPathIndexByPosition(targetPosition.x, targetPosition.z)
  if startIndexX and startIndexY and false == IsSameOrNeighbor(startIndexX, startIndexY, targetIndexX, targetIndexY) then
    local resultPath
    local cachedStartIndex = startIndexX * 100 + startIndexY
    local cachedTargetIndex = targetIndexX * 100 + targetIndexY
    if cachedPath[cachedStartIndex] then
      local cachedInfo = cachedPath[cachedStartIndex][cachedTargetIndex]
      if cachedInfo then
        resultPath = cachedInfo.path
      end
    end
    if nil == resultPath then
      InitMathList(targetIndexX - startIndexX, targetIndexY - startIndexY)
      open = {}
      openMap = {}
      closed = {}
      path = {}
      closedIndex = 0
      DefineStart(startIndexX, startIndexY)
      resultPath = PlaceTarget(targetIndexX, targetIndexY)
    end
    if resultPath and #resultPath > 0 then
      if BattleMgr.showPathTest then
        BattlePathFinding.UpdateTestPath(resultPath)
      end
      if nil == cachedPath[cachedStartIndex] then
        cachedPath[cachedStartIndex] = {}
      end
      cachedPath[cachedStartIndex][cachedTargetIndex] = {path = resultPath, usedTime = 2}
      if nil == cachedPath[cachedTargetIndex] then
        cachedPath[cachedTargetIndex] = {}
      end
      cachedPath[cachedTargetIndex][cachedStartIndex] = {
        path = ReverseTable(resultPath),
        usedTime = 2
      }
      local nearestNode = resultPath[#resultPath]
      local nearestNode2 = resultPath[#resultPath - 1]
      local x_off = nearestNode.x - startIndexX
      local y_off = nearestNode.y - startIndexY
      if nearestNode2 then
        local x_off2 = nearestNode2.x - nearestNode.x
        local y_off2 = nearestNode2.y - nearestNode.y
        if 0 == x_off * x_off2 + y_off * y_off2 then
          x_off = x_off + x_off2
          y_off = y_off + y_off2
        end
      end
      local nearestPosition = {
        x = startPosition.x + x_off,
        y = 0,
        z = startPosition.z - y_off
      }
      return nearestPosition
    end
  end
end

function BattlePathFinding.ClearCachedPath()
  cachedPath = {}
end

local worldTestGrid = {}

function BattlePathFinding.CreateTestGrid(contentPane)
  if nil == contentPane then
    return
  end
  local container = contentPane:GetChild("RoadTest")
  local grid
  for x, v in ipairs(world) do
    if nil == worldTestGrid[x] then
      worldTestGrid[x] = {}
    end
    for y, info in ipairs(v) do
      grid = UIMgr:CreateComponent("Battle", "RoadColor")
      ChangeUIController(grid, "c1", 0)
      worldTestGrid[x][y] = grid
      container:AddChild(grid)
      grid:SetXY((x - 1) * _pathCeilLength, (y - 1) * _pathCeilLength)
      local scale = (_pathCeilLength - 2) / grid.width
      grid:SetScale(scale, scale)
      grid.visible = false
    end
  end
end

function BattlePathFinding.ClearTestGrid()
  for i, v in ipairs(worldTestGrid) do
    for j, k in ipairs(v) do
      if 2 == GetControllerIndex(k, "c1") then
        k.visible = false
        ChangeUIController(k, "c1", 0)
      end
    end
  end
end

function BattlePathFinding.ChangeRed(x, y)
  local grid = worldTestGrid[x][y]
  grid.visible = true
  ChangeUIController(grid, "c1", 1)
end

function BattlePathFinding.ChangeEmpty(x, y)
  local grid = worldTestGrid[x][y]
  grid.visible = false
  ChangeUIController(grid, "c1", 0)
end

function BattlePathFinding.UpdateTestPath(resultPath)
  for _, v in ipairs(resultPath) do
    local grid = worldTestGrid[v.x][v.y]
    grid.visible = true
    if 1 ~= world[v.x][v.y] then
      ChangeUIController(grid, "c1", 2)
    end
  end
end
