require("RogueBuild01_SmallTipsHeadByName")

function GetRogueBuild01_SmallTipsUis(ui)
  local uis = {}
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.Head = GetRogueBuild01_SmallTipsHeadUis(ui:GetChild("Head"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.typeCtr = ui:GetController("type")
  uis.root = ui
  return uis
end
