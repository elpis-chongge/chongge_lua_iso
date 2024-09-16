function GetHome_BottomAreaUis(ui)
  local uis = {}
  
  uis.MemberBtn = ui:GetChild("MemberBtn")
  uis.BadgeBtn = ui:GetChild("BadgeBtn")
  uis.GuildBtn = ui:GetChild("GuildBtn")
  uis.PlotBtn = ui:GetChild("PlotBtn")
  uis.root = ui
  return uis
end
