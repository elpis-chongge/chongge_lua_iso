require("PlotPlayEditor_OptionByName")

function GetPlotPlayEditor_DialogTextUis(ui)
  local uis = {}
  uis.TalkWordTxt = ui:GetChild("TalkWordTxt")
  uis.ExplainWordNameTxt = ui:GetChild("ExplainWordNameTxt")
  uis.ExplainWordTxt = ui:GetChild("ExplainWordTxt")
  uis.NarratorWordTxt = ui:GetChild("NarratorWordTxt")
  uis.MiddleWordTxt = ui:GetChild("MiddleWordTxt")
  uis.Option1 = GetPlotPlayEditor_OptionUis(ui:GetChild("Option1"))
  uis.Option2 = GetPlotPlayEditor_OptionUis(ui:GetChild("Option2"))
  uis.Option3 = GetPlotPlayEditor_OptionUis(ui:GetChild("Option3"))
  uis.Option4 = GetPlotPlayEditor_OptionUis(ui:GetChild("Option4"))
  uis.IndexTxt1 = ui:GetChild("IndexTxt1")
  uis.IndexTxt2 = ui:GetChild("IndexTxt2")
  uis.IndexTxt3 = ui:GetChild("IndexTxt3")
  uis.IndexTxt4 = ui:GetChild("IndexTxt4")
  uis.SaveBtn = ui:GetChild("SaveBtn")
  uis.IsSelfBtn = ui:GetChild("IsSelfBtn")
  uis.IsOSBtn = ui:GetChild("IsOSBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
