local base = Polygon
local Rectangle = Create("Rectangle", base)

function Rectangle:__ctor()
  self.shapeType = ShapeType.Poly
  self.mass = 0
  self.inertia = 0
end

return Rectangle
