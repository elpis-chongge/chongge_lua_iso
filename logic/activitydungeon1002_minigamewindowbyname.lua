require("ActivityDungeon1002_MiniGameByName")

function GetActivityDungeon1002_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1002_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
