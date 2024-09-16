require("Base_NoneComponentByName")

function GetBase_UILayerUis(ui)
  local uis = {}
  uis.Bottom = GetBase_NoneComponentUis(ui:GetChild("Bottom"))
  uis.MainUI = GetBase_NoneComponentUis(ui:GetChild("MainUI"))
  uis.HUD = GetBase_NoneComponentUis(ui:GetChild("HUD"))
  uis.HUD1 = GetBase_NoneComponentUis(ui:GetChild("HUD1"))
  uis.Popup = GetBase_NoneComponentUis(ui:GetChild("Popup"))
  uis.Notice = GetBase_NoneComponentUis(ui:GetChild("Notice"))
  uis.Guide = GetBase_NoneComponentUis(ui:GetChild("Guide"))
  uis.Loading = GetBase_NoneComponentUis(ui:GetChild("Loading"))
  uis.NetCheck = GetBase_NoneComponentUis(ui:GetChild("NetCheck"))
  uis.root = ui
  return uis
end
