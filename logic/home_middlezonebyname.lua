function GetHome_MiddleZoneUis(ui)
  local uis = {}
  
  uis.HomeBtn = ui:GetChild("HomeBtn")
  uis.AbyssNewPeopleBtn = ui:GetChild("AbyssNewPeopleBtn")
  uis.GaChaBtn = ui:GetChild("GaChaBtn")
  uis.AdventureBtn = ui:GetChild("AdventureBtn")
  uis.ReasonBtn = ui:GetChild("ReasonBtn")
  uis.ActivityBtn = ui:GetChild("ActivityBtn")
  uis.PassportBtn = ui:GetChild("PassportBtn")
  uis.ShopBtn = ui:GetChild("ShopBtn")
  uis.newpeopleCtr = ui:GetController("newpeople")
  uis.root = ui
  return uis
end
