function GetPlotPlayEditor_SelectBtnInListUis(ui)
  local uis = {}
  
  uis.BgHolder = ui:GetChild("BgHolder")
  uis.BgLoader = ui:GetChild("BgLoader")
  uis.CardHolder = ui:GetChild("CardHolder")
  uis.HeadHolder = ui:GetChild("HeadHolder")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
