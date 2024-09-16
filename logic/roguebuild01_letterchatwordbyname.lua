require("RogueBuild01_LetterChatHeadByName")

function GetRogueBuild01_LetterChatWordUis(ui)
  local uis = {}
  uis.Head = GetRogueBuild01_LetterChatHeadUis(ui:GetChild("Head"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
