require("Abyss_EventSpendByName")

function GetAbyss_EventTipsUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.EventSpend = GetAbyss_EventSpendUis(ui:GetChild("EventSpend"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
