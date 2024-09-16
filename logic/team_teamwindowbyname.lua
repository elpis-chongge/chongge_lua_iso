require("Team_TeamByName")

function GetTeam_TeamWindowUis(ui)
  local uis = {}
  uis.Main = GetTeam_TeamUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
