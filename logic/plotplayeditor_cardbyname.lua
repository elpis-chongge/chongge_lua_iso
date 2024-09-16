require("PlotPlayEditor_CardSkinByName")
require("PlotPlayEditor_CardTimelineByName")
require("PlotPlayEditor_CardBlinkByName")
require("PlotPlayEditor_CardScaleAndPositionByName")
require("PlotPlayEditor_CardEffectByName")
require("PlotPlayEditor_CardSpeakByName")
require("PlotPlayEditor_ShakeByName")

function GetPlotPlayEditor_CardUis(ui)
  local uis = {}
  uis.ChooseCardBtn = ui:GetChild("ChooseCardBtn")
  uis.CardSkin = GetPlotPlayEditor_CardSkinUis(ui:GetChild("CardSkin"))
  uis.CardTimeline = GetPlotPlayEditor_CardTimelineUis(ui:GetChild("CardTimeline"))
  uis.CardBlink = GetPlotPlayEditor_CardBlinkUis(ui:GetChild("CardBlink"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.CardHolder = ui:GetChild("CardHolder")
  uis.CardScaleAndPosition = GetPlotPlayEditor_CardScaleAndPositionUis(ui:GetChild("CardScaleAndPosition"))
  uis.CardEffect = GetPlotPlayEditor_CardEffectUis(ui:GetChild("CardEffect"))
  uis.CardSpeak = GetPlotPlayEditor_CardSpeakUis(ui:GetChild("CardSpeak"))
  uis.CardShake = GetPlotPlayEditor_ShakeUis(ui:GetChild("CardShake"))
  uis.ClearBtn = ui:GetChild("ClearBtn")
  uis.SaveBtn = ui:GetChild("SaveBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
