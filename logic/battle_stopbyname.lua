require("Battle_OutTipsByName")

function GetBattle_StopUis(ui)
  local uis = {}
  uis.WaveWordTxt = ui:GetChild("WaveWordTxt")
  uis.OutTips = GetBattle_OutTipsUis(ui:GetChild("OutTips"))
  uis.root = ui
  return uis
end
