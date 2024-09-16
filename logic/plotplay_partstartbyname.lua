require("PlotPlay_CardByName")
require("PlotPlay_PartStartBgByName")

function GetPlotPlay_PartStartUis(ui)
  local uis = {}
  uis.BackGround = GetPlotPlay_CardUis(ui:GetChild("BackGround"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.PartStartBg = GetPlotPlay_PartStartBgUis(ui:GetChild("PartStartBg"))
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
