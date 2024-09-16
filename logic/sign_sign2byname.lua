require("CommonResource_PopupBgByName")
require("Sign_Sign1ByName")

function GetSign_Sign2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Sign1 = GetSign_Sign1Uis(ui:GetChild("Sign1"))
  uis.root = ui
  return uis
end
