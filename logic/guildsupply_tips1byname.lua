require("GuildSupply_ItemByName")
require("GuildSupply_QualityByName")

function GetGuildSupply_Tips1Uis(ui)
  local uis = {}
  uis.OrderTxt = ui:GetChild("OrderTxt")
  uis.DayTxt = ui:GetChild("DayTxt")
  uis.Item = GetGuildSupply_ItemUis(ui:GetChild("Item"))
  uis.Quality = GetGuildSupply_QualityUis(ui:GetChild("Quality"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.stateCtr = ui:GetController("state")
  uis.root = ui
  return uis
end
