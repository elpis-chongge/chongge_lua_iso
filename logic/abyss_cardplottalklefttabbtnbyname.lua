require("Abyss_CardPlotTalkLeftSignByName")

function GetAbyss_CardPlotTalkLeftTabBtnUis(ui)
  local uis = {}
  uis.Sign = GetAbyss_CardPlotTalkLeftSignUis(ui:GetChild("Sign"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
