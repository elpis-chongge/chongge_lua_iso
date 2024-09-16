BattleGrid = {}

function BattleGrid.InitLocalVar()
end

function BattleGrid.NewGrid(indexX, indexY)
  local grid = {}
  
  function grid:Init()
    self.indexX = indexX
    self.indexY = indexY
    local x, y, z = BattleScene.GetInitPosition(indexX * 100 + indexY)
    self.position = {
      x = x,
      y = y,
      z = z
    }
    if BattleMgr.isBattleServer == false then
      self:CreateModel()
    end
  end
  
  function grid:CreateModel()
    if Application.platform == RuntimePlatform.WindowsEditor or Application.platform == RuntimePlatform.OSXEditor then
      if self.indexX <= BattleScene.GetLeftCampXCount() then
        self.model = ResourceManager.Instantiate("Assets/Art/Test/green.prefab")
      elseif self.indexX > BattleScene.GetMapXCount() - BattleScene.GetRightCampXCount() then
        self.model = ResourceManager.Instantiate("Assets/Art/Test/red.prefab")
      else
        self.model = ResourceManager.Instantiate("Assets/Art/Test/black.prefab")
      end
      self.model.name = string.format("格子_%s_%s", self.indexX, self.indexY)
    else
      self.model = ResourceManager.Instantiate("Assets/Art/Test/empty.prefab")
    end
    local scale = 5
    BattleResourceManager:AddGameObject(self.model, self.position.x, self.position.y, self.position.z, scale, scale, scale)
    LuaUtil.SetLocalEuler(self.model, BATTLE_CONFIG_ENUM.BACKGROUND_ROTATION_X, 0, 0)
    SortingHelper.SetOrderInLayer(self.model, BATTLE_CONFIG_ENUM.SORTING_ORDER_BACKGROUND + 1)
  end
  
  function grid:Destroy()
    self.indexX = nil
    self.indexY = nil
    if self.model then
      ResourceManager.DestroyGameObject(self.model)
      self.model = nil
    end
    self.position = nil
    self = nil
  end
  
  grid:Init()
  return grid
end
