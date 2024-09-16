require("Home_HomeByName")

function GetHome_HomeWindowUis(ui)
  local uis = {}
  uis.Main = GetHome_HomeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
