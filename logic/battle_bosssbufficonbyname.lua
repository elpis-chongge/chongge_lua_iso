function GetBattle_BosssBuffIconUis(ui)
  local uis = {}
  
  uis.BuffIconLoader = ui:GetChild("BuffIconLoader")
  uis.BuffIconProgressBar = ui:GetChild("BuffIconProgressBar")
  uis.LoaderTxt = ui:GetChild("LoaderTxt")
  uis.root = ui
  return uis
end
