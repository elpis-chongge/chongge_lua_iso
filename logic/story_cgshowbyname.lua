require("CommonResource_BackGroundByName")

function GetStory_CGShowUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.CGShowCloseBtn = ui:GetChild("CGShowCloseBtn")
  uis.HideWordBtn = ui:GetChild("HideWordBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
