require("Abyss_MonsterShowByName")
require("Abyss_MonsterTitleByName")

function GetAbyss_MonsterBookUis(ui)
  local uis = {}
  uis.Show = GetAbyss_MonsterShowUis(ui:GetChild("Show"))
  uis.Title = GetAbyss_MonsterTitleUis(ui:GetChild("Title"))
  uis.MonsterNameTxt = ui:GetChild("MonsterNameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
