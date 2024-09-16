function GetCard_ElementChoiceUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.ShuiBtn = ui:GetChild("ShuiBtn")
  uis.HuoBtn = ui:GetChild("HuoBtn")
  uis.MuBtn = ui:GetChild("MuBtn")
  uis.AnBtn = ui:GetChild("AnBtn")
  uis.GuangBtn = ui:GetChild("GuangBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
