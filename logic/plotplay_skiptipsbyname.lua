require("PlotPlay_PopupBgByName")

function GetPlotPlay_SkipTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetPlotPlay_PopupBgUis(ui:GetChild("PopupBg"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.SkipCloseBtn = ui:GetChild("SkipCloseBtn")
  uis.root = ui
  return uis
end
