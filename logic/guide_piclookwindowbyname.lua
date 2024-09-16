require("CommonResource_PopupBgByName")
require("Guide_PicLookByName")

function GetGuide_PicLookWindowUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Main = GetGuide_PicLookUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
