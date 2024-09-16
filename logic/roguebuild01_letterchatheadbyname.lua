require("RogueBuild01_LetterChatHeadBgByName")

function GetRogueBuild01_LetterChatHeadUis(ui)
  local uis = {}
  uis.Bg = GetRogueBuild01_LetterChatHeadBgUis(ui:GetChild("Bg"))
  uis.root = ui
  return uis
end
