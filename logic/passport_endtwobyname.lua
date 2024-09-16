require("Passport_AllFrame_EByName")

function GetPassport_EndTwoUis(ui)
  local uis = {}
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.LevelWordTxt = ui:GetChild("LevelWordTxt")
  uis.Item1 = GetPassport_AllFrame_EUis(ui:GetChild("Item1"))
  uis.Item2 = GetPassport_AllFrame_EUis(ui:GetChild("Item2"))
  uis.root = ui
  return uis
end
