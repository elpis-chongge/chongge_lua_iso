require("CommonResource_BackGroundByName")

function GetTower_SceneUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.MapList = ui:GetChild("MapList")
  uis.root = ui
  return uis
end
