require("ActivityDungeon1_MiniGameByName")

function GetActivityDungeon1_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
