require("RogueBuild01_InsideMidAni_01ByName")

function GetRogueBuild01_InsideMidUis(ui)
  local uis = {}
  uis.n003 = GetRogueBuild01_InsideMidAni_01Uis(ui:GetChild("n003"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
