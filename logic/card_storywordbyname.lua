function GetCard_StoryWordUis(ui)
  local uis = {}
  
  uis.Word1Txt = ui:GetChild("Word1Txt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
