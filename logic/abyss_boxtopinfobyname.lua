require("Abyss_BoxTopInfo1ByName")

function GetAbyss_BoxTopInfoUis(ui)
  local uis = {}
  uis.BuildTopInfo1 = GetAbyss_BoxTopInfo1Uis(ui:GetChild("BuildTopInfo1"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
