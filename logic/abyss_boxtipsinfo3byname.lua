require("Abyss_BoxTipsInfo3BgByName")

function GetAbyss_BoxTipsInfo3Uis(ui)
  local uis = {}
  uis.BoxTipsInfo3Bg = GetAbyss_BoxTipsInfo3BgUis(ui:GetChild("BoxTipsInfo3Bg"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.root = ui
  return uis
end
