require("ExploreSign_ExploreSignByName")

function GetExploreSign_ExploreSignWindowUis(ui)
  local uis = {}
  uis.Main = GetExploreSign_ExploreSignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
