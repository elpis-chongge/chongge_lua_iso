require("Message_OpalNumberByName")
require("Message_OpalNumberStripByName")

function GetMessage_MainOpalExchange1Uis(ui)
  local uis = {}
  uis.Pic1Loader = ui:GetChild("Pic1Loader")
  uis.Pic2Loader = ui:GetChild("Pic2Loader")
  uis.Number1 = GetMessage_OpalNumberUis(ui:GetChild("Number1"))
  uis.Number2 = GetMessage_OpalNumberUis(ui:GetChild("Number2"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.OpalNumberStrip = GetMessage_OpalNumberStripUis(ui:GetChild("OpalNumberStrip"))
  uis.root = ui
  return uis
end
