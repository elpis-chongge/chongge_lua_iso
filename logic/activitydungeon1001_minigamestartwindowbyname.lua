require("ActivityDungeon1001_MiniGameStartByName")

function GetActivityDungeon1001_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1001_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
