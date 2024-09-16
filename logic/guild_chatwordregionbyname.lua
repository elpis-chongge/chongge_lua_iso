require("Guild_ChatWordLeftByName")
require("Guild_ChatWordRightByName")

function GetGuild_ChatWordRegionUis(ui)
  local uis = {}
  uis.ChatWordLeft = GetGuild_ChatWordLeftUis(ui:GetChild("ChatWordLeft"))
  uis.ChatWordRight = GetGuild_ChatWordRightUis(ui:GetChild("ChatWordRight"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
