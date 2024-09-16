require("ExploreSign_EndByName")

function GetExploreSign_EndWindowUis(ui)
  local uis = {}
  uis.Main = GetExploreSign_EndUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
