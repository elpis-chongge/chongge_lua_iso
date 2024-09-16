require("CommonResource_BackGroundByName")
require("Biography_FullScreenByName")

function GetBiography_BiographyUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.FullScreen = GetBiography_FullScreenUis(ui:GetChild("FullScreen"))
  uis.TaskBtn = ui:GetChild("TaskBtn")
  uis.LeftBtn = ui:GetChild("LeftBtn")
  uis.RightBtn = ui:GetChild("RightBtn")
  uis.root = ui
  return uis
end
