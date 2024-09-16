require("CommonResource_BtnGroupByName")

function GetCommonResource_Popup_OpalUis(ui)
  local uis = {}
  uis.BtnGroup = GetCommonResource_BtnGroupUis(ui:GetChild("BtnGroup"))
  uis.root = ui
  return uis
end
