require("GuildTrain_TeamDetailsByName")

function GetGuildTrain_TeamDetailsWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildTrain_TeamDetailsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
