function GetGuild_Examine_infoUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.Word2Txt = ui:GetChild("Word2Txt")
  uis.AllRefuseBtn = ui:GetChild("AllRefuseBtn")
  uis.AllAdoptBtn = ui:GetChild("AllAdoptBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
