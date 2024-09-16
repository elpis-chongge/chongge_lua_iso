require("Abyss_CardTitleShowByName")
require("Abyss_TalkProgressByName")
require("Abyss_TalkSummaryByName")

function GetAbyss_TalkTipsUis(ui)
  local uis = {}
  uis.CardTitleShow = GetAbyss_CardTitleShowUis(ui:GetChild("CardTitleShow"))
  uis.TalkProgress = GetAbyss_TalkProgressUis(ui:GetChild("TalkProgress"))
  uis.TalkSummary = GetAbyss_TalkSummaryUis(ui:GetChild("TalkSummary"))
  uis.NextStepBtn = ui:GetChild("NextStepBtn")
  uis.EndChoiceBtn = ui:GetChild("EndChoiceBtn")
  uis.ChoiceList = ui:GetChild("ChoiceList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
