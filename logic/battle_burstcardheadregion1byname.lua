function GetBattle_BurstCardHeadRegion1Uis(ui)
  local uis = {}
  
  uis.BurstCardHeadList = ui:GetChild("BurstCardHeadList")
  uis.BurstAutoProgressBar = ui:GetChild("BurstAutoProgressBar")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.root = ui
  return uis
end
