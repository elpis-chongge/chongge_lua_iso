function GetPlayerInfo_GuildUis(ui)
  local uis = {}
  
  uis.GuildTxt = ui:GetChild("GuildTxt")
  uis.AddressTxt = ui:GetChild("AddressTxt")
  uis.root = ui
  return uis
end
