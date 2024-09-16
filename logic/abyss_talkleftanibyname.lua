require("Abyss_TalkLeftByName")

function GetAbyss_TalkLeftAniUis(ui)
  local uis = {}
  uis.Talk = GetAbyss_TalkLeftUis(ui:GetChild("Talk"))
  uis.root = ui
  return uis
end
