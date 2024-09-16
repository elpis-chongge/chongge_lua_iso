function GetGuild_ChatWordLeftUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
