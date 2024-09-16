require("Abyss_TalkWordByName")

function GetAbyss_TalkWordAniUis(ui)
  local uis = {}
  uis.TalkWord = GetAbyss_TalkWordUis(ui:GetChild("TalkWord"))
  uis.root = ui
  return uis
end
