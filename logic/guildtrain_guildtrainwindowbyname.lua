require("GuildTrain_GuildTrainByName")

function GetGuildTrain_GuildTrainWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildTrain_GuildTrainUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
