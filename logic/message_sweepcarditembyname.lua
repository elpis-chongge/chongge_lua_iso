require("CommonResource_ItemFrameByName")

function GetMessage_SweepCardItemUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Item = GetCommonResource_ItemFrameUis(ui:GetChild("Item"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.root = ui
  return uis
end
