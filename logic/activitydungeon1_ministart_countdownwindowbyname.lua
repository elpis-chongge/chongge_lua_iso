require("ActivityDungeon1_MiniStart_CountdownByName")

function GetActivityDungeon1_MiniStart_CountdownWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1_MiniStart_CountdownUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
