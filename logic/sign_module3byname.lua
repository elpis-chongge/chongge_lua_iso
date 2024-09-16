require("CommonResource_ItemFrameByName")
require("Sign_Module3ReceivedByName")

function GetSign_Module3Uis(ui)
  local uis = {}
  uis.Item = GetCommonResource_ItemFrameUis(ui:GetChild("Item"))
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.Module3Received = GetSign_Module3ReceivedUis(ui:GetChild("Module3Received"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
