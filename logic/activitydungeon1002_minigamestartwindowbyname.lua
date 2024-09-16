require("ActivityDungeon1002_MiniGameStartByName")

function GetActivityDungeon1002_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1002_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
