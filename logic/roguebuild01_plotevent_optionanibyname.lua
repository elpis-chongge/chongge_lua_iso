require("RogueBuild01_PlotEvent_OptionByName")

function GetRogueBuild01_PlotEvent_OptionAniUis(ui)
  local uis = {}
  uis.Option = GetRogueBuild01_PlotEvent_OptionUis(ui:GetChild("Option"))
  uis.choiceCtr = ui:GetController("choice")
  uis.root = ui
  return uis
end
