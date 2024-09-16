require("CommonResource_ItemFrameByName")

function GetBag_ItemAniUis(ui)
  local uis = {}
  uis.ItemFrame = GetCommonResource_ItemFrameUis(ui:GetChild("ItemFrame"))
  uis.root = ui
  return uis
end
