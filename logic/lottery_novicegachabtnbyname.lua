function GetLottery_NoviceGaChaBtnUis(ui)
  local uis = {}
  
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.Word1Txt = ui:GetChild("Word1Txt")
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.Word2Txt = ui:GetChild("Word2Txt")
  uis.Word3Txt = ui:GetChild("Word3Txt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
