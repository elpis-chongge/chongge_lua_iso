function GetGuildBoss_RecommendCurrency1Uis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
