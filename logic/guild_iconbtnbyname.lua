function GetGuild_IconBtnUis(ui)
  local uis = {}
  
  uis.GulidIconLoader = ui:GetChild("GulidIconLoader")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
