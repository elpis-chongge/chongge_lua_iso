local SortingHelper = {}

function SortingHelper.SetOrderInLayer(gameObject, layerInt)
  if IsNil(gameObject) == false then
    local layer = math.ceil(layerInt) or 0
    LuaUtil.SetChildrenOrderInLayer(gameObject, layer)
  else
    print("Error: GameObject is Nil")
  end
end

return SortingHelper
