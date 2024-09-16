require("Abyss_CardPlotProgressByName")

function GetAbyss_DetailsTipsUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.Progress = GetAbyss_CardPlotProgressUis(ui:GetChild("Progress"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
