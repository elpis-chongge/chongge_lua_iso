require("Abyss_MonsterBookByName")
require("Abyss_MusicBookByName")
require("Abyss_HandBookEventCollectByName")

function GetAbyss_HandBookEventUis(ui)
  local uis = {}
  uis.MonsterBook = GetAbyss_MonsterBookUis(ui:GetChild("MonsterBook"))
  uis.MusicBook = GetAbyss_MusicBookUis(ui:GetChild("MusicBook"))
  uis.Collect = GetAbyss_HandBookEventCollectUis(ui:GetChild("Collect"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
