require("BattleData_BuildTypeByName")

function GetBattleData_BuildHeadBtnUis(ui)
  local uis = {}
  uis.BuildType = GetBattleData_BuildTypeUis(ui:GetChild("BuildType"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
