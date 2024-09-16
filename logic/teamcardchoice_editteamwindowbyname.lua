require("TeamCardChoice_EditTeamByName")

function GetTeamCardChoice_EditTeamWindowUis(ui)
  local uis = {}
  uis.Main = GetTeamCardChoice_EditTeamUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
