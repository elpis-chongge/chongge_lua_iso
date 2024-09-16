require("CommonResource_HeadBgByName")

function GetCommonResource_HeadUis(ui)
  local uis = {}
  uis.HeadBg = GetCommonResource_HeadBgUis(ui:GetChild("HeadBg"))
  uis.FrameLoader = ui:GetChild("FrameLoader")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
