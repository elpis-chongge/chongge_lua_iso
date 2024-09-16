require("ActivityDungeon1002_MiniGameStartWindowByName")
local Activity3MiniGameWindow = {}
local uis, contentPane
local mapW = 7
local mapH = 4
local mapAddH = 5
local map = {}
local mapIndex = {}
local tempMap = {}
local endPosRandom = {}
local getFront = {
  [1] = 4,
  [2] = 5,
  [3] = 6,
  [4] = 1,
  [5] = 2,
  [6] = 3
}
local disNum = {min = 8, max = 15}
local startPosNum = {min = 2, max = 4}
local GridType = {
  start = 0,
  mapLine = 1,
  target = 2,
  none = 3
}
local checkEndPoint = {}
local testLine = {}
local needMaxLine, needMaxGrid, specialPoints, curDifficultyData, allDifficultyData, startIndex, lastLattice

function Activity3MiniGameWindow.ReInitData()
end

function Activity3MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity3MiniGameWindow.package, WinResConfig.Activity3MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1002_MiniGameStartWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1002/MiniGame_1001"
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame003/FX_minigame_003_eff.prefab", uis.Main.BackGround.BackGroundHolder)
    Activity3MiniGameWindow.InitBtn()
    Activity3MiniGameWindow.UpdateInfo()
  end)
end

function Activity3MiniGameWindow.UpdateInfo()
  Activity3MiniGameWindow.CreateMap()
end

function Activity3MiniGameWindow.InitMap()
  map = {}
  mapIndex = {}
  specialPoints = {}
  endPosRandom = {}
  local activityInfo = ActivityDungeonData.GetActivityInfo()
  local info = Activity3_MiniGameData.GetMiniGameInfo()
  if activityInfo and info then
    local curDay = math.ceil((LoginData.GetCurServerTime() - activityInfo.baseInfo.startStamp) / 86400)
    allDifficultyData = Activity3MiniGameWindow.GetCurDifficulty(curDay)
    local miniDailyNum = info.miniDailyNum + 1
    local index = miniDailyNum > #allDifficultyData and #allDifficultyData or miniDailyNum
    curDifficultyData = allDifficultyData[index]
    if curDifficultyData then
      endPosRandom = curDifficultyData.game_initial
      for i = 1, mapW do
        map[i] = {}
        local maxH = 1 == i % 2 and mapH or mapAddH
        for h = 1, maxH do
          map[i][h] = {
            type = GridType.none,
            front = {}
          }
          table.insert(mapIndex, {x = i, y = h})
        end
      end
    end
  end
end

function Activity3MiniGameWindow.GetCurDifficulty(curDay)
  local data = TableData.GetTable("BaseActivityGameDifficulty")
  local maxDay = 0
  local curDifficulty = {}
  for i, v in pairs(data) do
    if v.game_day == curDay then
      table.insert(curDifficulty, v)
    end
    if maxDay < v.game_day then
      maxDay = v.game_day
    end
  end
  if #curDifficulty < 1 then
    return Activity3MiniGameWindow.GetCurDifficulty(maxDay)
  end
  table.sort(curDifficulty, function(a, b)
    return a.id < b.id
  end)
  return curDifficulty
end

local GetIndex = function(pos)
  return mapIndex[pos]
end
local GetIndexByV2 = function(v2)
  for i = 1, #mapIndex do
    if mapIndex[i].x == v2.x and mapIndex[i].y == v2.y then
      return i
    end
  end
end
local SetGridByPos = function(pos, type)
  local v2 = GetIndex(pos)
  map[v2.x][v2.y] = type
end
local FindGrid = function(v2, mapData, gridType)
  local pos = {}
  local upIndx = v2.y - 1
  if mapData[v2.x] and mapData[v2.x][upIndx] and mapData[v2.x][upIndx].type == gridType then
    table.insert(pos, {
      x = v2.x,
      y = upIndx,
      f = 4
    })
  end
  if mapData[v2.x + 1] and mapData[v2.x + 1][v2.y] and mapData[v2.x + 1][v2.y].type == gridType then
    table.insert(pos, {
      x = v2.x + 1,
      y = v2.y,
      f = 0 == v2.x % 2 and 6 or 5
    })
  end
  local ry = 0 == (v2.x + 1) % 2 and v2.y + 1 or v2.y - 1
  if mapData[v2.x + 1] and mapData[v2.x + 1][ry] and mapData[v2.x + 1][ry].type == gridType then
    table.insert(pos, {
      x = v2.x + 1,
      y = ry,
      f = ry < v2.y and 5 or 6
    })
  end
  local downIndx = v2.y + 1
  if mapData[v2.x] and mapData[v2.x][downIndx] and mapData[v2.x][downIndx].type == gridType then
    table.insert(pos, {
      x = v2.x,
      y = downIndx,
      f = 1
    })
  end
  if mapData[v2.x - 1] and mapData[v2.x - 1][v2.y] and mapData[v2.x - 1][v2.y].type == gridType then
    table.insert(pos, {
      x = v2.x - 1,
      y = v2.y,
      f = 0 == v2.x % 2 and 2 or 3
    })
  end
  local ly = 0 == (v2.x - 1) % 2 and v2.y + 1 or v2.y - 1
  if mapData[v2.x - 1] and mapData[v2.x - 1][ly] and mapData[v2.x - 1][ly].type == gridType then
    table.insert(pos, {
      x = v2.x - 1,
      y = ly,
      f = ly > v2.y and 2 or 3
    })
  end
  return pos
end
local RemoveGrid = function(posGrid, lastGrid)
  local IsContain = function(v2)
    if #lastGrid > 0 then
      for i = 1, #lastGrid do
        if lastGrid[i].x == v2.x and lastGrid[i].x == v2.y then
          return true
        end
      end
    end
  end
  for i = #posGrid, 1, -1 do
    if IsContain(posGrid[i]) then
      table.remove(posGrid, i)
    end
  end
  return posGrid
end
local RemoveStartGrid = function(posGrid, left, leftMax, rightMax)
  for i = #posGrid, 1, -1 do
    if left then
      if posGrid[i].x < 2 then
        table.remove(posGrid, i)
      end
    elseif posGrid[i].x > 6 then
      table.remove(posGrid, i)
    end
  end
  return posGrid
end

function Activity3MiniGameWindow.CreateStartLine(targetV2)
  local line = {}
  local curLinePos = targetV2
  tempMap[curLinePos.x][curLinePos.y] = {
    type = GridType.mapLine
  }
  local dis = curDifficultyData.game_grid
  while dis > #line do
    local pos = FindGrid(curLinePos, tempMap, GridType.none)
    if #line > 0 and #pos > 0 then
      local lastPos = FindGrid(line[#line], tempMap, GridType.none)
      pos = RemoveGrid(pos, lastPos)
    end
    if #pos > 0 then
      if 0 == #line then
        pos = RemoveStartGrid(pos, curLinePos.x <= 2, 2, 6)
      end
      if 1 == #line then
        pos = RemoveStartGrid(pos, curLinePos.x <= 3, 3, 5)
      end
      curLinePos = pos[math.random(1, #pos)]
      table.insert(line, curLinePos)
      tempMap[curLinePos.x][curLinePos.y] = {
        type = GridType.mapLine
      }
    else
      tempMap = SimpleCopy(map)
      return Activity3MiniGameWindow.CreateStartLine(targetV2)
    end
  end
  return line
end

function Activity3MiniGameWindow.CreateMap()
  Activity3MiniGameWindow.InitMap()
  lastLattice = nil
  if nil == curDifficultyData then
    return
  end
  local tPos = endPosRandom[math.random(1, #endPosRandom)]
  local v2T = GetIndex(tPos)
  SetGridByPos(tPos, {
    type = GridType.target
  })
  local endPosNum = curDifficultyData.game_end - 1
  tempMap = SimpleCopy(map)
  local line = Activity3MiniGameWindow.CreateStartLine(v2T)
  local length = #line
  local numIndex = math.floor((length - 2) / endPosNum)
  local tempEndRot = {}
  table.insert(tempEndRot, v2T)
  for ii = 1, length do
    if ii == length then
      map[line[ii].x][line[ii].y] = {
        type = GridType.start
      }
      startIndex = GetIndexByV2(line[ii])
      specialPoints[startIndex] = 0
    elseif endPosNum > 0 and endPosNum >= table.getLen(tempEndRot) and 0 == ii % numIndex then
      map[line[ii].x][line[ii].y] = {
        type = GridType.target
      }
      table.insert(tempEndRot, line[ii])
    else
      map[line[ii].x][line[ii].y] = {
        type = GridType.mapLine
      }
    end
  end
  specialPoints[tPos] = 0
  Activity3MiniGameWindow.InitLine()
  local root = uis.Main.MidRegion
  local index = 0
  for i = 1, mapW do
    local maxH = 1 == i % 2 and mapH or mapAddH
    for h = 1, maxH do
      index = index + 1
      local lattice = root["Lattice" .. index].Lattice
      if lattice and map[i][h] then
        if map[i][h].type == GridType.start or map[i][h].type == GridType.mapLine or map[i][h].type == GridType.target then
          Activity3MiniGameWindow.ShowLatticeLine(lattice, map[i][h].front)
          lattice.root.onClick:Set(function()
            lattice.root.touchable = false
            SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_THREE_GAME_TURN)
            lattice.Line.root:TweenRotate(lattice.Line.root.rotation + 60, 0.15):SetEase(FairyGUI.EaseType.Linear):OnComplete(function()
              lattice.Line.root.rotation = lattice.Line.root.rotation % 360
              Activity3MiniGameWindow.UpdateRotationCtrPage(i, h)
              local curLine, curGrid = Activity3MiniGameWindow.UpdateLine(true)
              lattice.root.touchable = true
              print(curLine, needMaxLine, ">>>>>>>>>>>>>>>", curGrid, needMaxGrid)
              if Activity3MiniGameWindow.CheckLinePlayMusice({x = i, y = h}) then
                SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_THREE_GAME_COM)
              end
              if curGrid >= needMaxGrid and Activity3MiniGameWindow.CheckSpecialBol(testLine) then
                Activity3MiniGameWindow.GameOverAmin()
              end
            end)
            if lastLattice and lastLattice ~= lattice then
              ChangeController(lastLattice.c3Ctr, 0)
            end
            ChangeController(lattice.c3Ctr, 1)
            lastLattice = lattice
          end)
        end
        ChangeController(lattice.c1Ctr, map[i][h].type)
      end
      lattice.root.alpha = 0
      map[i][h].lattice = lattice
      Activity3MiniGameWindow.UpdateRotationCtrPage(i, h)
    end
  end
  for i, v in pairs(tempEndRot) do
    map[v.x][v.y].type = GridType.mapLine
    specialPoints[GetIndexByV2(v)] = 0
  end
  needMaxLine, needMaxGrid = Activity3MiniGameWindow.UpdateLine()
  print(needMaxLine, needMaxGrid, ">>>>>init>>>>>>>>>>>>>>>>>>>")
  for i, v in pairs(specialPoints) do
    if testLine[i] then
      specialPoints[i] = table.getLen(testLine[i])
    end
  end
  Activity3MiniGameWindow.StartRandomRotation()
  Activity3MiniGameWindow.UpdateLine(true)
  uis.Main.MidRegion.root.touchable = true
end

function Activity3MiniGameWindow.StartRandomRotation()
  local tb = {}
  local index = 0
  for x = 1, mapW do
    local maxH = 1 == x % 2 and mapH or mapAddH
    for h = 1, maxH do
      index = index + 1
      table.insert(tb, index)
      local lattice = uis.Main.MidRegion["Lattice" .. index].Lattice
      if lattice and map[x][h] and (map[x][h].type == GridType.start or map[x][h].type == GridType.mapLine or map[x][h].type == GridType.target) then
        lattice.Line.root.rotation = math.random(1, 6) * 60 % 360
        Activity3MiniGameWindow.UpdateRotationCtrPage(x, h)
      end
    end
  end
  local newTb = table.randomSort(tb)
  local max = #newTb
  uis.Main.MidRegion.root.touchable = false
  for i = 1, max do
    if i == max then
      PlayUITrans(uis.Main.MidRegion["Lattice" .. newTb[i]].root, "up", function()
        uis.Main.MidRegion.root.touchable = true
      end, i * 0.02)
    else
      PlayUITrans(uis.Main.MidRegion["Lattice" .. newTb[i]].root, "up", nil, i * 0.02)
    end
  end
end

function Activity3MiniGameWindow.GameOverAmin()
  uis.Main.MidRegion.root.touchable = false
  local addCallBack
  for i = 1, #mapIndex do
    local lattice = uis.Main.MidRegion["Lattice" .. i].Lattice
    if testLine[i] then
      local len = 0
      for ind = 1, 6 do
        if testLine[i][ind] then
          if nil == addCallBack then
            addCallBack = true
            PlayUITrans(lattice.Line["Line" .. ind].root, "up", function()
              uis.Main.MidRegion.root.touchable = true
              Activity3MiniGameWindow.OnGameOver()
            end)
          else
            PlayUITrans(lattice.Line["Line" .. ind].root, "up")
          end
        end
      end
    end
  end
end

function Activity3MiniGameWindow.UpdateLine(showNumber)
  checkEndPoint = {}
  testLine = {}
  local needLine = 0
  local startPos = Activity3MiniGameWindow.GetGridByType(GridType.start)
  Activity3MiniGameWindow.CheckConnectLine(startPos)
  for i = 1, #mapIndex do
    local lattice = uis.Main.MidRegion["Lattice" .. i].Lattice
    if testLine[i] then
      local len = 0
      for ind = 1, 6 do
        if testLine[i][ind] then
          if showNumber then
            len = len + 1
            ChangeController(lattice.Line["Line" .. ind].c1Ctr, 1)
          end
          needLine = needLine + 1
        elseif showNumber then
          ChangeController(lattice.Line["Line" .. ind].c1Ctr, 0)
        end
      end
      if (2 == lattice.c1Ctr.selectedIndex or 0 == lattice.c1Ctr.selectedIndex) and startIndex ~= i and specialPoints[i] and specialPoints[i] > 0 then
        ChangeController(lattice.c1Ctr, len >= specialPoints[i] and 0 or 2)
      end
    else
      for ind = 1, 6 do
        ChangeController(lattice.Line["Line" .. ind].c1Ctr, 0)
      end
    end
  end
  return needLine, Activity3MiniGameWindow.GetLen(testLine)
end

function Activity3MiniGameWindow.GetLen(tb)
  local len = 0
  for i, v in pairs(tb) do
    if v and table.getLen(v) > 0 then
      len = len + 1
    end
  end
  return len
end

function Activity3MiniGameWindow.CheckSpecialBol(tb)
  for i, v in pairs(specialPoints) do
    if nil == tb[i] or v > table.getLen(tb[i]) then
      return false
    end
  end
  return true
end

function Activity3MiniGameWindow.UpdateRotationCtrPage(x, y)
  if map[x][y] and map[x][y].front and map[x][y].lattice then
    local rotFront = {}
    for i, v in pairs(map[x][y].front) do
      local addPage = math.ceil(map[x][y].lattice.Line.root.rotation / 60)
      local page = (v + addPage) % 6
      local cur = 0 == page and 6 or page
      rotFront[cur] = v
    end
    map[x][y].rotFront = rotFront
  end
end

function Activity3MiniGameWindow.CheckLinePlayMusice(curPos)
  local nextPos = {}
  local indexTb = {
    [1] = 4,
    [2] = 5,
    [3] = 6,
    [4] = 1,
    [5] = 2,
    [6] = 3
  }
  local SetFun = function(i, v, pos)
    local tempPage1 = map[v.x][v.y].rotFront[i]
    local tempPage2 = map[pos.x][pos.y].rotFront[indexTb[i]]
    if tempPage1 and tempPage2 then
      return tempPage1, tempPage2
    end
  end
  local pos = FindGrid(curPos, map, GridType.mapLine)
  local sPos = FindGrid(curPos, map, GridType.start)
  if #sPos > 0 then
    for i = 1, #sPos do
      table.insert(pos, sPos[i])
    end
  end
  local startIndex = GetIndexByV2(curPos)
  local root = uis.Main.MidRegion
  for i = 1, #pos do
    local startPage, endPage = SetFun(pos[i].f, curPos, pos[i])
    if startPage and endPage then
      local endIndex = GetIndexByV2(pos[i])
      if endIndex and startIndex then
        local sLattice = root["Lattice" .. startIndex].Lattice
        local eLattice = root["Lattice" .. endIndex].Lattice
        if eLattice and sLattice and 1 == eLattice.Line["Line" .. endPage].c1Ctr.selectedIndex and 1 == sLattice.Line["Line" .. startPage].c1Ctr.selectedIndex then
          return true
        end
      end
    end
  end
  return false
end

function Activity3MiniGameWindow.CheckConnectLine(startPos)
  local nextPos = {}
  local indexTb = {
    [1] = 4,
    [2] = 5,
    [3] = 6,
    [4] = 1,
    [5] = 2,
    [6] = 3
  }
  local SetFun = function(i, v, pos)
    local tempPage1 = map[v.x][v.y].rotFront[i]
    local tempPage2 = map[pos.x][pos.y].rotFront[indexTb[i]]
    if tempPage1 and tempPage2 then
      return tempPage1, tempPage2
    end
  end
  for _, v in pairs(startPos) do
    local pos = FindGrid(v, map, GridType.mapLine)
    local startIndex = GetIndexByV2(v)
    table.insert(checkEndPoint, v)
    for i = 1, #pos do
      local endIndex = GetIndexByV2(pos[i])
      local startPage, endPage = SetFun(pos[i].f, v, pos[i])
      testLine[startIndex] = testLine[startIndex] or {}
      testLine[endIndex] = testLine[endIndex] or {}
      if startPage and Activity3MiniGameWindow.CanCheck(pos[i]) then
        testLine[startIndex][startPage] = true
        testLine[endIndex][endPage] = true
        table.insert(nextPos, pos[i])
      end
    end
  end
  if #nextPos > 0 then
    Activity3MiniGameWindow.CheckConnectLine(nextPos)
  end
end

function Activity3MiniGameWindow.CanCheck(v2)
  for i = 1, #checkEndPoint do
    if checkEndPoint[i].x == v2.x and checkEndPoint[i].y == v2.y then
      return false
    end
  end
  return true
end

function Activity3MiniGameWindow.GetGridByType(gridType)
  local grid = {}
  for x = 1, mapW do
    local maxH = 1 == x % 2 and mapH or mapAddH
    for y = 1, maxH do
      if map[x][y] and map[x][y].type == gridType then
        table.insert(grid, {x = x, y = y})
      end
    end
  end
  return grid
end

function Activity3MiniGameWindow.InitLine()
  local checkType = function(selfType, targetType, mapData)
    if selfType == GridType.mapLine then
      return true
    elseif (selfType == GridType.start or selfType == GridType.target) and targetType == GridType.mapLine then
      return true
    end
  end
  local IsHave = function(v2, mapData)
    local ctrPage = {}
    local tempType = {}
    local upIndx = v2.y - 1
    if mapData[v2.x] and mapData[v2.x][upIndx] and mapData[v2.x][upIndx].type ~= GridType.none and checkType(mapData[v2.x][v2.y].type, mapData[v2.x][upIndx].type, mapData) then
      table.insert(ctrPage, 4)
      tempType[4] = mapData[v2.x][upIndx].type
    end
    if mapData[v2.x + 1] and mapData[v2.x + 1][v2.y] and mapData[v2.x + 1][v2.y].type ~= GridType.none and checkType(mapData[v2.x][v2.y].type, mapData[v2.x + 1][v2.y].type, mapData) then
      local page = 0 == v2.x % 2 and 6 or 5
      table.insert(ctrPage, page)
      tempType[page] = mapData[v2.x + 1][v2.y].type
    end
    local ry = 0 == (v2.x + 1) % 2 and v2.y + 1 or v2.y - 1
    if mapData[v2.x + 1] and mapData[v2.x + 1][ry] and mapData[v2.x + 1][ry].type ~= GridType.none and checkType(mapData[v2.x][v2.y].type, mapData[v2.x + 1][ry].type, mapData) then
      local page = ry < v2.y and 5 or 6
      table.insert(ctrPage, page)
      tempType[page] = mapData[v2.x + 1][ry].type
    end
    local downIndx = v2.y + 1
    if mapData[v2.x] and mapData[v2.x][downIndx] and mapData[v2.x][downIndx].type ~= GridType.none and checkType(mapData[v2.x][v2.y].type, mapData[v2.x][downIndx].type, mapData) then
      table.insert(ctrPage, 1)
      tempType[1] = mapData[v2.x][downIndx].type
    end
    if mapData[v2.x - 1] and mapData[v2.x - 1][v2.y] and mapData[v2.x - 1][v2.y].type ~= GridType.none and checkType(mapData[v2.x][v2.y].type, mapData[v2.x - 1][v2.y].type, mapData) then
      local page = 0 == v2.x % 2 and 2 or 3
      table.insert(ctrPage, page)
      tempType[page] = mapData[v2.x - 1][v2.y].type
    end
    local ly = 0 == (v2.x - 1) % 2 and v2.y + 1 or v2.y - 1
    if mapData[v2.x - 1] and mapData[v2.x - 1][ly] and mapData[v2.x - 1][ly].type ~= GridType.none and checkType(mapData[v2.x][v2.y].type, mapData[v2.x - 1][ly].type, mapData) then
      local page = ly > v2.y and 2 or 3
      table.insert(ctrPage, page)
      tempType[page] = mapData[v2.x - 1][ly].type
    end
    if #ctrPage > 4 then
      local new = {}
      for i, v in pairs(tempType) do
        if v == GridType.mapLine then
          table.insert(new, i)
        end
      end
      local rTb = table.randomx(1, #new, #ctrPage > 5 and 2 or 1)
      local removeData = {}
      for i = 1, #rTb do
        removeData[new[rTb[i]]] = true
      end
      for i = #ctrPage, 1, -1 do
        if removeData[ctrPage[i]] then
          table.remove(ctrPage, i)
        end
      end
    end
    return ctrPage
  end
  for i = 1, mapW do
    local maxH = 1 == i % 2 and mapH or mapAddH
    for h = 1, maxH do
      map[i][h].front = IsHave({x = i, y = h}, map)
    end
  end
end

function Activity3MiniGameWindow.ShowLatticeLine(lattice, frontData)
  if frontData and lattice then
    for i, v in pairs(frontData) do
      ChangeController(lattice.Line[string.format("Line%sCtr", v)], 1)
      if lattice.Line[string.format("Line%s", v)] then
        lattice.Line[string.format("Line%s", v)].root:GetChild("AddImage").alpha = 0
      end
    end
  end
end

function Activity3MiniGameWindow.OnGameOver()
  OpenWindow(WinResConfig.Activity3MiniGameSubmitWindow.name)
end

function Activity3MiniGameWindow.OnNext()
  Activity3MiniGameWindow.ResetUI()
  Activity3MiniGameWindow.CreateMap()
end

function Activity3MiniGameWindow.ResetUI()
  local index = 0
  for x = 1, mapW do
    local maxH = 1 == x % 2 and mapH or mapAddH
    for y = 1, maxH do
      index = index + 1
      local lattice = uis.Main.MidRegion["Lattice" .. index].Lattice
      if lattice and map[x][y] then
        ChangeController(lattice.c1Ctr, 3)
        for i = 1, 6 do
          ChangeController(lattice.Line[string.format("Line%sCtr", i)], 0)
        end
        lattice.Line.root.rotation = 0
        lattice.root.onClick:Clear()
      end
    end
  end
end

function Activity3MiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    MessageBox.Show(T(1662), {
      touchCallback = function()
        UIMgr:CloseWindow(WinResConfig.Activity3MiniGameWindow.name)
      end
    }, {})
  end)
end

function Activity3MiniGameWindow.OnClose()
  uis = nil
  contentPane = nil
  checkEndPoint = nil
  testLine = nil
  map = nil
  needMaxLine, needMaxGrid = nil, nil
  mapIndex = nil
  tempMap = nil
  endPosRandom = nil
  specialPoints = nil
  lastLattice = nil
  lastLine = nil
end

function Activity3MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity3_MiniGame.RESET then
    Activity3MiniGameWindow.OnNext()
  end
end

return Activity3MiniGameWindow
