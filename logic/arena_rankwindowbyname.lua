require("Arena_RankByName")

function GetArena_RankWindowUis(ui)
  local uis = {}
  uis.Main = GetArena_RankUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
