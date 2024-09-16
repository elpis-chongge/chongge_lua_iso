require("Formation_BgAniByName")

function GetFormation_70BtnUis(ui)
  local uis = {}
  uis.BgAni = GetFormation_BgAniUis(ui:GetChild("BgAni"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
