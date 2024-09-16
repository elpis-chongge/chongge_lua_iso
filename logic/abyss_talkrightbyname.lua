require("Abyss_TalkHead1ByName")

function GetAbyss_TalkRightUis(ui)
  local uis = {}
  uis.Head = GetAbyss_TalkHead1Uis(ui:GetChild("Head"))
  uis.WordList = ui:GetChild("WordList")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.root = ui
  return uis
end
