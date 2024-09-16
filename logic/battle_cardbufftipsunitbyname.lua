require("Battle_CardBuffTipsByName")

function GetBattle_CardBuffTipsUnitUis(ui)
  local uis = {}
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.CardBuffTips = GetBattle_CardBuffTipsUis(ui:GetChild("CardBuffTips"))
  uis.root = ui
  return uis
end
