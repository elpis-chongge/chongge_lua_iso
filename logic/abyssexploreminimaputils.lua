local WorldPositionToMapRatio = function(position)
  local referSize = AbyssExploreSettings.Map.size
  local referPosition = AbyssExploreSettings.Map.origin
  local diffx = position.x - referPosition.x
  local diffy = position.y - referPosition.y
  local x = diffx / referSize.x
  local y = diffy / referSize.y
  return x, y
end
local DEFAULT_RECT = {
  x = 0.23,
  y = 0.061,
  w = 0.52,
  h = 0.81
}
local NormalizedPosToMinimap = function(ratio_x, ratio_y, mapgobj, maprect)
  local rect = maprect or DEFAULT_RECT
  local width, height = mapgobj.width, mapgobj.height
  local px = width * (rect.w * ratio_x + rect.x)
  local py = height * (rect.h * (1 - ratio_y) + rect.y)
  return Vector2(px, py)
end
local WorldPositionToMinimap = function(position, mapgobj, maprect)
  local x, y = WorldPositionToMapRatio(position)
  return NormalizedPosToMinimap(x, y, mapgobj, maprect)
end
local ClampPosWithWH = function(gobj, position, clampPosition, clampWidth, clampHeight)
  local scaleFactor = UIContentScaler.scaleFactor
  local width, height = gobj.width * scaleFactor, gobj.height * scaleFactor
  local min = Vector2(clampPosition.x + clampWidth, clampPosition.y + clampHeight) - Vector2(width, height)
  local max = Vector2(clampPosition.x, clampPosition.y)
  position.x = math.min(math.max(min.x, position.x), max.x)
  position.y = math.min(math.max(min.y, position.y), max.y)
  return position
end
local ClampPosWithContainer = function(gobj, position, container)
  return ClampPosWithWH(gobj, position, container:LocalToGlobal(Vector2.zero), container.width, container.height)
end
return {
  WorldPositionToMapRatio = WorldPositionToMapRatio,
  WorldPositionToMinimap = WorldPositionToMinimap,
  NormalizedPosToMinimap = NormalizedPosToMinimap,
  ClampPosWithWH = ClampPosWithWH,
  ClampPosWithContainer = ClampPosWithContainer
}
