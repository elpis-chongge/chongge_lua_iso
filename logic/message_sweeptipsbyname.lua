require("Message_Sweep10RegionByName")
require("Message_Sweep1RegionByName")
require("Message_SweepResultListByName")
require("Message_SweepWordByName")
require("Message_SweepCardByName")
require("Message_SweepFallByName")
require("Message_SweepDecorationByName")

function GetMessage_SweepTipsUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.ReasonBtn = ui:GetChild("ReasonBtn")
  uis.Sweep10Region = GetMessage_Sweep10RegionUis(ui:GetChild("Sweep10Region"))
  uis.Sweep1Region = GetMessage_Sweep1RegionUis(ui:GetChild("Sweep1Region"))
  uis.SweepResultList = GetMessage_SweepResultListUis(ui:GetChild("SweepResultList"))
  uis.SweepWord = GetMessage_SweepWordUis(ui:GetChild("SweepWord"))
  uis.SweepCard = GetMessage_SweepCardUis(ui:GetChild("SweepCard"))
  uis.SweepFall = GetMessage_SweepFallUis(ui:GetChild("SweepFall"))
  uis.SweepDecoration = GetMessage_SweepDecorationUis(ui:GetChild("SweepDecoration"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
