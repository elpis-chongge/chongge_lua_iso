require("Team_OccupationBtnBgByName")

function GetTeam_OccupationBtnUis(ui)
  local uis = {}
  uis.OccupationBtnBg = GetTeam_OccupationBtnBgUis(ui:GetChild("OccupationBtnBg"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
