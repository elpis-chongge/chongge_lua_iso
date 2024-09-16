require("TideDungeon_TideTipsByName")

function GetTideDungeon_TideTipsAniUis(ui)
  local uis = {}
  uis.TideTips = GetTideDungeon_TideTipsUis(ui:GetChild("TideTips"))
  uis.root = ui
  return uis
end
