function GetFormation_OccupationChoiceUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.FangYuBtn = ui:GetChild("FangYuBtn")
  uis.JinZhanBtn = ui:GetChild("JinZhanBtn")
  uis.FaShiBtn = ui:GetChild("FaShiBtn")
  uis.GongJianBtn = ui:GetChild("GongJianBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
