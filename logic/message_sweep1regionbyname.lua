require("Message_ReasonSpendByName")

function GetMessage_Sweep1RegionUis(ui)
  local uis = {}
  uis.ReasonSpend = GetMessage_ReasonSpendUis(ui:GetChild("ReasonSpend"))
  uis.SweepBtn = ui:GetChild("SweepBtn")
  uis.root = ui
  return uis
end
