require("FunctionOpen_FunctionByName")

function GetFunctionOpen_FunctionWindowUis(ui)
  local uis = {}
  uis.Main = GetFunctionOpen_FunctionUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
