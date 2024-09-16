require("Team_CardTipsByName")

function GetTeam_TeamTipsUis(ui)
  local uis = {}
  uis.UnUseBtn = ui:GetChild("UnUseBtn")
  uis.CardTips = GetTeam_CardTipsUis(ui:GetChild("CardTips"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
