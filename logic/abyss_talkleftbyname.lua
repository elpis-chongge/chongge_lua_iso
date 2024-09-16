require("Abyss_TalkHeadByName")

function GetAbyss_TalkLeftUis(ui)
  local uis = {}
  uis.Head = GetAbyss_TalkHeadUis(ui:GetChild("Head"))
  uis.WordList = ui:GetChild("WordList")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.root = ui
  return uis
end
