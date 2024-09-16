require("Abyss_MaterialTabBtnBgByName")

function GetAbyss_MaterialTabBtnUis(ui)
  local uis = {}
  uis.MaterialTabBtnBg = GetAbyss_MaterialTabBtnBgUis(ui:GetChild("MaterialTabBtnBg"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
