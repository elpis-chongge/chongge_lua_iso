require("AbyssFunctionOpen_FunctionOpen2ByName")

function GetAbyssFunctionOpen_FunctionOpenWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyssFunctionOpen_FunctionOpen2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
