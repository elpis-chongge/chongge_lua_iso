function GetLottery_1TimeBtnUis(ui)
  local uis = {}
  
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.Word1Txt = ui:GetChild("Word1Txt")
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.Word2Txt = ui:GetChild("Word2Txt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
