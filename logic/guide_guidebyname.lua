require("Guide_PointerByName")
require("Guide_WordByName")
require("Guide_FrameByName")

function GetGuide_GuideUis(ui)
  local uis = {}
  uis.Mask = GetGuide_PointerUis(ui:GetChild("Mask"))
  uis.Pointer = GetGuide_PointerUis(ui:GetChild("Pointer"))
  uis.Word = GetGuide_WordUis(ui:GetChild("Word"))
  uis.Frame = GetGuide_FrameUis(ui:GetChild("Frame"))
  uis.root = ui
  return uis
end
