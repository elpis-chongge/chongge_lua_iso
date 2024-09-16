function GetRogueBuild01_ScoreRewardListUis(ui)
  local uis = {}
  
  uis.ItemList = ui:GetChild("ItemList")
  uis.DotProgressBar = ui:GetChild("DotProgressBar")
  uis.root = ui
  return uis
end
