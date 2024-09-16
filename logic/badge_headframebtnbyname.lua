require("Badge_HeadFrameByName")

function GetBadge_HeadFrameBtnUis(ui)
  local uis = {}
  uis.HeadFrame = GetBadge_HeadFrameUis(ui:GetChild("HeadFrame"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
