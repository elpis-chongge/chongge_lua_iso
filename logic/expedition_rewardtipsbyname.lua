function GetExpedition_RewardTipsUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.WordNumberTxt = ui:GetChild("WordNumberTxt")
  uis.ItemList = ui:GetChild("ItemList")
  uis.ProgressTxt = ui:GetChild("ProgressTxt")
  uis.GetTxt = ui:GetChild("GetTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
