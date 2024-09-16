require("GuildSupply_GuildSupplyByName")

function GetGuildSupply_GuildSupplyWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildSupply_GuildSupplyUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
