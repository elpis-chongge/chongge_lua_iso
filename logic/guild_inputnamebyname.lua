function GetGuild_InputNameUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SearchBtn = ui:GetChild("SearchBtn")
  uis.root = ui
  return uis
end
