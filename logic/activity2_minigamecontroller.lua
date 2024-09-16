local MAX_FRUIT_LEVEL = 11
local THICKNESS_OF_WALL = 2
local THICKNESS_OF_GAME_OVER_LINE = 0.02
local CONTAINER_ORIGIN = Vector3(0, 0, 0)
local CONTAINER_WIDTH, CONTAINER_HEIGHT = 5.28, 7.4
local FRUIT_LEVEL_COLLIDER_SETTINGS_LOOKUP = {
  [1] = {
    offset = Vector2(27, -27),
    radius = 27,
    radius_offset = 0,
    mass = 0.5,
    bounciness = 0
  },
  [2] = {
    offset = Vector2(32, -33),
    radius = 32,
    radius_offset = 0,
    mass = 1,
    bounciness = 0
  },
  [3] = {
    offset = Vector2(38, -40),
    radius = 38,
    radius_offset = 0,
    mass = 2,
    bounciness = 0
  },
  [4] = {
    offset = Vector2(46, -46),
    radius = 46,
    radius_offset = 0,
    mass = 3,
    bounciness = 0
  },
  [5] = {
    offset = Vector2(55, -55),
    radius = 55,
    radius_offset = 0,
    mass = 4.5,
    bounciness = 0
  },
  [6] = {
    offset = Vector2(66, -66),
    radius = 66,
    radius_offset = 0,
    mass = 7,
    bounciness = 0
  },
  [7] = {
    offset = Vector2(78, -78),
    radius = 78,
    radius_offset = 0,
    mass = 10.5,
    bounciness = 0
  },
  [8] = {
    offset = Vector2(95, -95),
    radius = 95,
    mass = 15,
    bounciness = 0
  },
  [9] = {
    offset = Vector2(111, -111),
    radius = 114,
    radius_offset = 0,
    mass = 22.5,
    bounciness = 0
  },
  [10] = {
    offset = Vector2(137, -137),
    radius = 137,
    radius_offset = 0,
    mass = 33,
    bounciness = 0
  },
  [11] = {
    offset = Vector2(164, -164),
    radius = 164,
    radius_offset = 0,
    mass = 45,
    bounciness = 0
  }
}
local GRAVITY_SCALE = 1
local COMBINE_BOMB_SCALE = 1
local RANDOM_FRUIT_LEVEL_FLOOR_LIMIT = 1
local RANDOM_FRUIT_LEVEL_UPPER_LIMIT = 5
local MOVE_SPEED = 5
local CREATE_FRUIT_INTERVAL = 0.5
local INEFFECTIVE_TIME_AFTER_COMBINE = 0.3
local dropFruit, miniGameElapse, pause, gameOver
local clampMin, clampMax = Vector3.negativeInfinity, Vector3.positiveInfinity
local uiRoot, world, __createfruitfunc, __destroyfruitfunc, __ongameover, __onnextfruit, __oncombine, __onstaygameoverline, __onexitgameoverline
local collisionUtils = CS.CollisionUtils
local Collision2DEnterCallback, Collision2DStayCallback, Trigger2DEnterCallback, Trigger2DStayCallback, Trigger2DExitCallback, readyFruit, nextFruitLevel, fruits, reusableFruits
local FindFruitByGameObject = function(go)
  local k = table.keyof(fruits, go, "go")
  if k then
    return fruits[k], k
  end
end
local FindFruitByBody = function(body)
  local k = table.keyof(fruits, body, "body")
  if k then
    return fruits[k], k
  end
end
require("PhysicsScriptList")
local CreateFruit = function(level, x, y)
  local go = __createfruitfunc(level, nil == x and nil == y)
  local isCombined = false
  local transform = go.transform
  if x and y then
    isCombined = true
    transform.position = Vector3(x, y, 0)
  end
  local settings = FRUIT_LEVEL_COLLIDER_SETTINGS_LOOKUP[level]
  local scale = UIContentScaler.scaleFactor * Stage.inst.scaleX
  local offset = settings.offset * UIContentScaler.scaleFactor * Stage.inst.scaleX
  local circle = Circle.New(transform.position.x, transform.position.y, (settings.radius + (settings.radius_offset or 0)) * scale)
  circle:setMass(1)
  circle:init()
  local fruit
  if #reusableFruits > 0 then
    fruit = table.remove(reusableFruits)
  else
    fruit = {}
  end
  fruit.go = go
  fruit.transform = transform
  fruit.body = circle
  fruit.level = level
  fruit.radius = settings.radius
  fruit.offset = offset
  fruit.collide = nil
  fruit.firstTriggerGameOverLine = true
  table.insert(fruits, fruit)
  return fruit
end
local CreateReadyFruit = function()
  local level = type(nextFruitLevel) == "number" and nextFruitLevel or math.random(RANDOM_FRUIT_LEVEL_FLOOR_LIMIT, RANDOM_FRUIT_LEVEL_UPPER_LIMIT)
  readyFruit = CreateFruit(level)
  nextFruitLevel = math.random(RANDOM_FRUIT_LEVEL_FLOOR_LIMIT, RANDOM_FRUIT_LEVEL_UPPER_LIMIT)
  if type(__onnextfruit) == "function" then
    __onnextfruit(nextFruitLevel)
  end
end
local DestroyFruit = function(fruit)
  local inst, k
  if type(fruit) == "table" then
    k = table.keyof(fruits, fruit)
    if k then
      inst = fruits[k]
    end
  elseif type(fruit) == "userdata" then
    inst, k = FindFruitByGameObject(fruit)
  end
  table.remove(fruits, k)
  local go = inst.go
  local body = inst.body
  world:removeBody(body)
  inst.go = nil
  inst.body = nil
  inst.transform = nil
  inst.stayGameOverLine = nil
  table.insert(reusableFruits, inst)
  if type(__destroyfruitfunc) == "function" then
    __destroyfruitfunc(go)
  end
end
local Screen2WorldPosition = function(global)
  local sc = StageCamera.main
  local position = sc:ScreenToWorldPoint(Vector3(global.x, Screen.height - global.y, -sc.transform.position.z))
  return position
end
local World2ScreenPosition = function(position)
  local sc = StageCamera.main
  local sp = sc:WorldToScreenPoint(position)
  return Vector2(sp.x, Screen.height - sp.y)
end
local MoveReadyFruit = function(deltaX)
  if pause then
    return
  end
  if readyFruit then
    local transform = readyFruit.transform
    local position = transform.position
    local max = uiRoot:GlobalToLocal(World2ScreenPosition(clampMax))
    local min = uiRoot:GlobalToLocal(World2ScreenPosition(clampMin))
    position.x = position.x + deltaX * Time.deltaTime * MOVE_SPEED
    local p = uiRoot:GlobalToLocal(World2ScreenPosition(position))
    p.x = math.min(math.max(p.x, min.x + readyFruit.radius), max.x - readyFruit.radius)
    local result = Screen2WorldPosition(uiRoot:LocalToGlobal(p))
    position.x = result.x
    transform.position = position
    readyFruit.body:setPos(position.x, readyFruit.body.y)
    return position, readyFruit.radius
  end
end
local DropReadyFruit = function()
  if gameOver then
    return
  end
  if pause then
    return
  end
  if readyFruit and not dropFruit then
    local body = readyFruit.body
    body.velAng = -2
    world:addBody(body)
    dropFruit = true
    readyFruit = nil
  end
end
local OverlapCircleAll = CS.UnityEngine.Physics2D.OverlapCircleAll
local Bomb = function(combined, point, radius)
  local results = OverlapCircleAll(point, radius * 1.5)
  if results then
    local scale = 0.01
    for i = 0, results.Length - 1 do
      local collider = results[i]
      local fruit = FindFruitByGameObject(collider.gameObject)
      if fruit and fruit ~= combined then
        local transform = fruit.transform
        local position = transform.position
        local center = position + Vector3.Normalize(transform.right - transform.up) * fruit.radius * scale
        local rigidbody = fruit.rigidbody
        local direction = Vector3(center.x - point.x, center.y - point.y).normalized
        rigidbody:AddForce(direction * 10 * COMBINE_BOMB_SCALE)
      end
    end
  end
end
local Collision = function(go, collision)
  local this = FindFruitByGameObject(go)
  local other = FindFruitByGameObject(collision.gameObject)
  if this and other and not this.ineffectiveTime and not other.ineffectiveTime then
    local level = this.level
    if level == other.level and level < MAX_FRUIT_LEVEL then
      local scale = 0.01
      local thisTrans, otherTrans = go.transform, collision.transform
      local selfPosition, otherPosition = thisTrans.position, otherTrans.position
      local thisX, thisY = this.size and this.size.x * 0.5 or this.radius, this.size and this.size.y * 0.5 or this.radius
      local otherX, otherY = other.size and other.size.x * 0.5 or other.radius, other.size and other.size.y * 0.5 or other.radius
      local selfCenter = selfPosition + (thisTrans.right.normalized * thisX - thisTrans.up.normalized * thisY) * scale
      local otherCenter = otherPosition + (otherTrans.right.normalized * otherX - otherTrans.up.normalized * otherY) * scale
      local newLevel = level + 1
      local newRadius = FRUIT_LEVEL_COLLIDER_SETTINGS_LOOKUP[newLevel].radius
      this.collider.enabled = false
      other.collider.enabled = false
      local radius = newRadius * scale
      local positionX = math.min(math.max((selfCenter.x + otherCenter.x) * 0.5 - radius, clampMin.x), clampMax.x + 2 * radius)
      local positionY = math.min(math.max((selfCenter.y + otherCenter.y) * 0.5 + radius, clampMin.y - 2 * radius), clampMax.y)
      local combined = CreateFruit(newLevel, positionX, positionY)
      local point = Vector3(positionX + radius, positionY - radius)
      combined.firstTriggerGameOverLine = false
      DestroyFruit(this)
      DestroyFruit(other)
      if type(__oncombine) == "function" then
        __oncombine(point, combined.transform, newLevel)
      end
      return
    end
  end
  this.collide = true
end
local onCollided = function(_, bodyA, bodyB, arbiter, timeStep)
  local this = FindFruitByBody(bodyA)
  local other = FindFruitByBody(bodyB)
  if this and other and not this.ineffectiveTime and not other.ineffectiveTime then
    local level = this.level
    if level == other.level and level < MAX_FRUIT_LEVEL then
      local scale = UIContentScaler.scaleFactor * Stage.inst.scaleX
      local thisTrans, otherTrans = this.transform, other.transform
      local selfPosition, otherPosition = thisTrans.position, otherTrans.position
      local newLevel = level + 1
      local newRadius = FRUIT_LEVEL_COLLIDER_SETTINGS_LOOKUP[newLevel].radius
      local radius = newRadius * scale
      local positionX = math.min(math.max((selfPosition.x + otherPosition.x) * 0.5, clampMin.x + radius), clampMax.x - radius)
      local positionY = math.min(math.max((selfPosition.y + otherPosition.y) * 0.5, clampMin.y + radius), clampMax.y - radius)
      local combined = CreateFruit(newLevel, positionX, positionY)
      combined.firstTriggerGameOverLine = false
      DestroyFruit(this)
      DestroyFruit(other)
      world:addBody(combined.body)
      local point = Vector3(positionX, positionY)
      if type(__oncombine) == "function" then
        __oncombine(point, combined.transform, newLevel)
      end
      return
    end
    this.collide = true
    other.collide = true
  elseif bodyA.isTrigger or bodyB.isTrigger then
    local fruit
    if bodyA.isTrigger then
      fruit = FindFruitByBody(bodyB)
    else
      fruit = FindFruitByBody(bodyA)
    end
    if fruit and fruit.collide then
      fruit.stayGameOverLine = true
    end
  end
end
local onSeparated = function(_, bodyA, bodyB, timeStep)
  if bodyA.isTrigger or bodyB.isTrigger then
    local fruit
    if bodyA.isTrigger then
      fruit = FindFruitByBody(bodyB)
    else
      fruit = FindFruitByBody(bodyA)
    end
    if fruit then
      if type(__onexitgameoverline) == "function" then
        __onexitgameoverline(fruit)
      end
      fruit.stayGameOverLine = nil
      fruit.stayGameOverLineTime = nil
    end
  end
end

function Collision2DEnterCallback(go, collision)
  Collision(go, collision)
end

function Collision2DStayCallback(go, collision)
  Collision(go, collision)
end

function Trigger2DEnterCallback(go, collider)
  local other = collider.gameObject
  if other.name == "GAME_OVER_LINE" then
    local fruit = FindFruitByGameObject(go)
    if fruit and fruit.firstTriggerGameOverLine then
      fruit.firstTriggerGameOverLine = false
    end
  end
end

function Trigger2DStayCallback(go, collider)
  local other = collider.gameObject
  if other.name == "GAME_OVER_LINE" then
    local fruit = FindFruitByGameObject(go)
    if fruit and fruit.collide then
      fruit.stayGameOverLine = true
    end
  end
end

function Trigger2DExitCallback(go, collider)
  local other = collider.gameObject
  if other.name == "GAME_OVER_LINE" then
    local fruit = FindFruitByGameObject(go)
    if fruit then
      if type(__onexitgameoverline) == "function" then
        __onexitgameoverline(fruit)
      end
      fruit.stayGameOverLine = nil
      fruit.stayGameOverLineTime = nil
    end
  end
end

local rotatePoint = function(x, y, angle)
  local deg = math.rad(angle)
  local cos, sin = math.cos(deg), math.sin(deg)
  local newX = x * cos - y * sin
  local newY = x * sin + y * cos
  return newX, newY
end
local rotatePointAround = function(x, y, angle, aroundx, aroundy)
  local deg = math.rad(angle)
  local cos, sin = math.cos(deg), math.sin(deg)
  local newX = (x - aroundx) * cos - (y - aroundy) * sin + aroundx
  local newY = (x - aroundx) * sin + (y - aroundy) * cos + aroundy
  return newX, newY
end
local Update = function()
  if gameOver then
    return
  end
  if pause then
    return
  end
  if world then
    world:step(Time.deltaTime)
  end
  for _, fruit in ipairs(fruits) do
    if fruit ~= readyFruit then
      local body = fruit.body
      local x, y = body.x, body.y
      local bodyPosition = Vector3(x, y, 0)
      local transform = fruit.transform
      local position = bodyPosition
      local eulerAngles = transform.localEulerAngles
      eulerAngles.z = math.deg(body.angle)
      transform.localEulerAngles = eulerAngles
      transform.position = position
    end
  end
  for i, v in ipairs(fruits) do
    if v ~= readyFruit and v.stayGameOverLine then
      v.stayGameOverLineTime = (v.stayGameOverLineTime or 0) + Time.deltaTime
      if type(__onstaygameoverline) == "function" then
        __onstaygameoverline(v, v.stayGameOverLineTime)
      end
      if v.stayGameOverLineTime > 2 then
        gameOver = true
        if type(__ongameover) == "function" then
          __ongameover(miniGameElapse)
        end
        return
      end
    end
    local ineffectiveTime = v.ineffectiveTime
    if type(ineffectiveTime) == "number" and ineffectiveTime > 0 then
      ineffectiveTime = ineffectiveTime - Time.deltaTime
      if ineffectiveTime <= 0 then
        ineffectiveTime = nil
      end
    end
    v.ineffectiveTime = ineffectiveTime
  end
  if dropFruit then
    miniGameElapse = miniGameElapse + Time.deltaTime
    if miniGameElapse > CREATE_FRUIT_INTERVAL then
      dropFruit = false
      CreateReadyFruit()
      miniGameElapse = 0
    end
  end
end
local translatePoints = function(points, x, y)
  for i = 1, #points do
    points[i][1] = points[i][1] + x
    points[i][2] = points[i][2] + y
  end
  return points
end
local createRect = function(w, h)
  w = w or 1
  h = h or 1
  local vertices = {
    {
      -w / 2,
      -h / 2
    },
    {
      w / 2,
      -h / 2
    },
    {
      w / 2,
      h / 2
    },
    {
      -w / 2,
      h / 2
    }
  }
  return vertices
end
local CreateRectangleBody = function(width, height, x, y, bodyType, scale)
  local vertices = createRect(width * (scale or 1), height * (scale or 1))
  vertices = translatePoints(vertices, x, y)
  local rectangle = Rectangle.New()
  rectangle.bodyType = bodyType
  rectangle.vertices = vertices
  if bodyType == BodyType.Static then
    rectangle.mass = MathConst.Infinity
  end
  rectangle:init()
  return rectangle
end
local GenMiniGameContainer = function(uiRoot, localPosition, linePosition, origin, width, height)
  local position = Screen2WorldPosition(uiRoot:LocalToGlobal(Vector2(localPosition.x, localPosition.y)))
  linePosition = Screen2WorldPosition(uiRoot:LocalToGlobal(Vector2(linePosition.x, linePosition.y)))
  local scale = UIContentScaler.scaleFactor * Stage.inst.scaleX * 100
  local center, lineCenter = Vector2(position.x, position.y), Vector2(linePosition.x, linePosition.y)
  local scaledWidth, scaledHeight, scaledThickness = width * scale, height * scale, THICKNESS_OF_WALL * scale
  local leftPos = center - Vector2.right * (width + THICKNESS_OF_WALL) * 0.5 * scale
  local rightPos = center + Vector2.right * (width + THICKNESS_OF_WALL) * 0.5 * scale
  local bottomPos = center - Vector2.up * (height + THICKNESS_OF_WALL) * 0.5 * scale
  local topPos = center + Vector2.up * (height + THICKNESS_OF_WALL) * 0.5 * scale
  local linePos = lineCenter + Vector2.up * THICKNESS_OF_GAME_OVER_LINE * 0.5 * scale
  local leftBody = CreateRectangleBody(scaledThickness, scaledHeight, leftPos.x, leftPos.y, BodyType.Static)
  local rightBody = CreateRectangleBody(scaledThickness, scaledHeight, rightPos.x, rightPos.y, BodyType.Static)
  local bottomBody = CreateRectangleBody(scaledWidth, scaledThickness, bottomPos.x, bottomPos.y, BodyType.Static)
  local topBody = CreateRectangleBody(scaledWidth, scaledThickness, topPos.x, topPos.y, BodyType.Static)
  local gameOverLineBody = CreateRectangleBody(scaledWidth, THICKNESS_OF_GAME_OVER_LINE, linePos.x, linePos.y, BodyType.Static)
  gameOverLineBody.isTrigger = true
  world:addBody(leftBody)
  world:addBody(rightBody)
  world:addBody(bottomBody)
  world:addBody(topBody)
  world:addBody(gameOverLineBody)
end
local Init = function(root, localPosition, linePosition)
  world = World.New(onCollided, onCollided, onSeparated)
  world.gravityY = -13.72
  uiRoot = root
  fruits = fruits or {}
  reusableFruits = reusableFruits or {}
  table.clear(fruits)
  table.clear(reusableFruits)
  GenMiniGameContainer(root, localPosition, linePosition, CONTAINER_ORIGIN, CONTAINER_WIDTH, CONTAINER_HEIGHT)
end
local Release = function()
  UpdateManager.RemoveUpdateHandler(Update)
  if fruits then
    local n = #fruits
    for i = n, 1, -1 do
      DestroyFruit(fruits[i])
    end
  end
  world = nil
  nextFruitLevel = nil
  __createfruitfunc = nil
  __destroyfruitfunc = nil
  __ongameover = nil
  __onnextfruit = nil
  __oncombine = nil
  __onstaygameoverline = nil
  __onexitgameoverline = nil
end
local SetMinMax = function(min, max)
  clampMin = min
  clampMax = max
end
local Start = function(root, localPosition, linePosition, createFunc, destroyFunc, onGameOver, onNextFruit, onCombine, onStayGameOverline, onExitGameOverline)
  Init(root, localPosition, linePosition)
  gameOver = false
  dropFruit = false
  pause = false
  miniGameElapse = 0
  UpdateManager.RemoveUpdateHandler(Update)
  UpdateManager.AddUpdateHandler(Update)
  __createfruitfunc = createFunc
  __destroyfruitfunc = destroyFunc
  __ongameover = onGameOver
  __onnextfruit = onNextFruit
  __oncombine = onCombine
  __onstaygameoverline = onStayGameOverline
  __onexitgameoverline = onExitGameOverline
  CreateReadyFruit()
end
local Pause = function(isPause)
  pause = isPause
end
local GetSettings = function(level)
  return FRUIT_LEVEL_COLLIDER_SETTINGS_LOOKUP[level]
end
local GetElapse = function()
  return miniGameElapse
end
return {
  Start = Start,
  Release = Release,
  Pause = Pause,
  SetMinMax = SetMinMax,
  CreateReadyFruit = CreateReadyFruit,
  MoveReadyFruit = MoveReadyFruit,
  DropReadyFruit = DropReadyFruit,
  GetSettings = GetSettings,
  GetElapse = GetElapse
}
