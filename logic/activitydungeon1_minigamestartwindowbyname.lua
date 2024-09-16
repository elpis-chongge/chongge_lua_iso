require("ActivityDungeon1_MiniGameStartByName")

function GetActivityDungeon1_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
