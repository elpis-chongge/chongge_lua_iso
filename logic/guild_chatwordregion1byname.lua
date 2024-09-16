require("Guild_ChatWordLeft1ByName")
require("Guild_ChatWordRight1ByName")

function GetGuild_ChatWordRegion1Uis(ui)
  local uis = {}
  uis.ChatWordLeft = GetGuild_ChatWordLeft1Uis(ui:GetChild("ChatWordLeft"))
  uis.ChatWordRight = GetGuild_ChatWordRight1Uis(ui:GetChild("ChatWordRight"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
