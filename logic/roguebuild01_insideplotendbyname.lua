require("CommonResource_BackGroundByName")

function GetRogueBuild01_InsidePlotEndUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.WordList = ui:GetChild("WordList")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
