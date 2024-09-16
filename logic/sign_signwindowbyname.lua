require("Sign_Sign2ByName")

function GetSign_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetSign_Sign2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
