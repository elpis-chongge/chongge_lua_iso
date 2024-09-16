require("Abyss_CardTaskTimeByName")

function GetAbyss_CardTaskUis(ui)
  local uis = {}
  uis.Time = GetAbyss_CardTaskTimeUis(ui:GetChild("Time"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.TaskDirectionBtn = ui:GetChild("TaskDirectionBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
