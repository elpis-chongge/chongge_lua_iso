require("ActivityDungeon1001_MiniGameByName")

function GetActivityDungeon1001_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1001_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
