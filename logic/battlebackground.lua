BattleBackground = {
  model = nil,
  modelUp = nil,
  sound = nil
}

function BattleBackground.Init()
  local mapId = BattleScene.GetMapId()
  local mapConfig = TableData.GetConfig(mapId, "BaseMap")
  local model = ResourceManager.Instantiate(ModelUtil.GetFullPath(mapConfig.background_path, RES_PATH_PREFIX.MAP_BACKGROUND))
  model:AddComponent(typeof(CS.SceneLightHelper))
  if BattleControl.isOver == true then
    ResourceManager.DestroyGameObject(model)
    return
  end
  SoundUtil.PlayMusic(mapConfig.sound_id)
  BattleBackground.model = model
  LuaUtil.ChangeLayer(model.transform, "Default")
  local scale = BattleData.battleCameraScale * Const.mapScale / BattleData.battleRootScale
  BattleResourceManager:AddGameObject(model, 0, 0, 0, scale, scale, scale)
  local SortingHelper = require("SortingHelper")
  SortingHelper.SetOrderInLayer(model, BATTLE_CONFIG_ENUM.SORTING_ORDER_BACKGROUND)
  if BattleData.stageConfig then
    local path = BattleData.stageConfig.effect_path
    if path then
      ResourceManager.InstantiateAsync(path, function(effect)
        if BattleControl.isOver == true then
          ResourceManager.DestroyGameObject(effect)
          return
        end
        LuaUtil.ChangeLayer(effect.transform, "Default")
        local scale2 = BattleData.battleCameraScale * Const.mapScale / BattleData.battleRootScale
        BattleResourceManager:AddGameObject(effect, 0, 0, 0, scale2, scale2, scale2)
        SortingHelper.SetOrderInLayer(effect, BATTLE_CONFIG_ENUM.SORTING_ORDER_MAP_EFFECT)
      end)
    end
  end
  if mapConfig.background_up_path then
    local modelUp = ResourceManager.Instantiate(ModelUtil.GetFullPath(mapConfig.background_up_path, RES_PATH_PREFIX.MAP_BACKGROUND))
    if BattleControl.isOver == true then
      ResourceManager.DestroyGameObject(modelUp)
      return
    end
    BattleBackground.modelUp = modelUp
    LuaUtil.ChangeLayer(modelUp.transform, "Default")
    BattleResourceManager:AddGameObject(modelUp, 0, 0, 0, scale, scale, scale)
    SortingHelper.SetOrderInLayer(model, BATTLE_CONFIG_ENUM.SORTING_ORDER_BACKGROUND)
  end
end

function BattleBackground.Clear()
  if BattleBackground.model then
    BattleBackground.model = nil
  end
  if BattleBackground.modelUp then
    BattleBackground.modelUp = nil
  end
  SoundUtil.StopCurMusic(false, true)
end
