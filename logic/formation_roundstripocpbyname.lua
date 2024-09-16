require("Formation_RoundStripOcpTitleByName")

function GetFormation_RoundStripOcpUis(ui)
  local uis = {}
  uis.RoundStripOcpTitle = GetFormation_RoundStripOcpTitleUis(ui:GetChild("RoundStripOcpTitle"))
  uis.HeadList = ui:GetChild("HeadList")
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
