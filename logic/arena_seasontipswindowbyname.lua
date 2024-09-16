require("Arena_SeasonTips2ByName")

function GetArena_SeasonTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetArena_SeasonTips2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
