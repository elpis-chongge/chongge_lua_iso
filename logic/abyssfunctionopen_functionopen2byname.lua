require("AbyssFunctionOpen_PopupBgByName")
require("AbyssFunctionOpen_FunctionOpen1ByName")
require("AbyssFunctionOpen_FunctionOpenIconByName")

function GetAbyssFunctionOpen_FunctionOpen2Uis(ui)
  local uis = {}
  uis.PopupBg = GetAbyssFunctionOpen_PopupBgUis(ui:GetChild("PopupBg"))
  uis.FunctionOpen1 = GetAbyssFunctionOpen_FunctionOpen1Uis(ui:GetChild("FunctionOpen1"))
  uis.Pic = GetAbyssFunctionOpen_FunctionOpenIconUis(ui:GetChild("Pic"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
