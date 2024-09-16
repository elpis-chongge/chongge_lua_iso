require("Abyss_MusicShowByName")
require("Abyss_MusicTitleByName")

function GetAbyss_MusicBookUis(ui)
  local uis = {}
  uis.Show = GetAbyss_MusicShowUis(ui:GetChild("Show"))
  uis.Title = GetAbyss_MusicTitleUis(ui:GetChild("Title"))
  uis.MusicNameTxt = ui:GetChild("MusicNameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
