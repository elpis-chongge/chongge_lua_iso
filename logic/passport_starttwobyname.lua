require("Passport_PassportPic1ByName")
require("Passport_PassportPicByName")

function GetPassport_StartTwoUis(ui)
  local uis = {}
  uis.Pic1 = GetPassport_PassportPic1Uis(ui:GetChild("Pic1"))
  uis.Pic = GetPassport_PassportPicUis(ui:GetChild("Pic"))
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.root = ui
  return uis
end
