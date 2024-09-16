require("GuildTrain_TimeTabDownByName")
require("GuildTrain_TimeTabUpByName")
require("GuildTrain_TimeTabBgByName")

function GetGuildTrain_TimeTabBtnUis(ui)
  local uis = {}
  uis.Down = GetGuildTrain_TimeTabDownUis(ui:GetChild("Down"))
  uis.Up = GetGuildTrain_TimeTabUpUis(ui:GetChild("Up"))
  uis.TimeTabBg = GetGuildTrain_TimeTabBgUis(ui:GetChild("TimeTabBg"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
