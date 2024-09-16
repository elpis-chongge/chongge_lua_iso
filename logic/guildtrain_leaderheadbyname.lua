require("GuildTrain_LeaderHeadBgByName")

function GetGuildTrain_LeaderHeadUis(ui)
  local uis = {}
  uis.LeaderHeadBg = GetGuildTrain_LeaderHeadBgUis(ui:GetChild("LeaderHeadBg"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
