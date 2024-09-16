require("Message_HU_NumberStripByName")

function GetMessage_DispatchNumber1Uis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberStrip = GetMessage_HU_NumberStripUis(ui:GetChild("NumberStrip"))
  uis.ReasonTxt = ui:GetChild("ReasonTxt")
  uis.root = ui
  return uis
end
