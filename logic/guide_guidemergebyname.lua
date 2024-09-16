require("Guide_GuideByName")
require("Guide_ExplainByName")

function GetGuide_GuideMergeUis(ui)
  local uis = {}
  uis.Guide = GetGuide_GuideUis(ui:GetChild("Guide"))
  uis.Eeplain = GetGuide_ExplainUis(ui:GetChild("Eeplain"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
