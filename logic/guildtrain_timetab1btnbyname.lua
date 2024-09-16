require("GuildTrain_TimeTabDown1ByName")
require("GuildTrain_TimeTabUp1ByName")
require("GuildTrain_TimeTabBg1ByName")

function GetGuildTrain_TimeTab1BtnUis(ui)
  local uis = {}
  uis.Down = GetGuildTrain_TimeTabDown1Uis(ui:GetChild("Down"))
  uis.Up = GetGuildTrain_TimeTabUp1Uis(ui:GetChild("Up"))
  uis.TimeTabBg = GetGuildTrain_TimeTabBg1Uis(ui:GetChild("TimeTabBg"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
