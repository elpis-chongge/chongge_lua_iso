require("Guide_GuideMergeByName")

function GetGuide_GuideWindowUis(ui)
  local uis = {}
  uis.Main = GetGuide_GuideMergeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
