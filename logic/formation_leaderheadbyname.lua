require("Formation_LeaderHeadBgByName")

function GetFormation_LeaderHeadUis(ui)
  local uis = {}
  uis.LeaderHeadBg = GetFormation_LeaderHeadBgUis(ui:GetChild("LeaderHeadBg"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
