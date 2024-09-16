require("MonthlyPass_MonthGetByName")

function GetMonthlyPass_MonthGetWindowUis(ui)
  local uis = {}
  uis.Main = GetMonthlyPass_MonthGetUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
