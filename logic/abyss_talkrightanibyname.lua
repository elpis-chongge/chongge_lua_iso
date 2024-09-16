require("Abyss_TalkRightByName")

function GetAbyss_TalkRightAniUis(ui)
  local uis = {}
  uis.Talk = GetAbyss_TalkRightUis(ui:GetChild("Talk"))
  uis.root = ui
  return uis
end
