require("CommonResource_ItemFrameByName")

function GetCommonResource_ItemFrameBtnUis(ui)
  local uis = {}
  uis.ItemFrame = GetCommonResource_ItemFrameUis(ui:GetChild("ItemFrame"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
