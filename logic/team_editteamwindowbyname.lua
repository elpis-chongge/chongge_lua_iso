require("Team_EditTeamByName")

function GetTeam_EditTeamWindowUis(ui)
  local uis = {}
  uis.Main = GetTeam_EditTeamUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
