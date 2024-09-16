require("Abyss_TalkHeadBgByName")

function GetAbyss_TalkHead1Uis(ui)
  local uis = {}
  uis.HeadBg = GetAbyss_TalkHeadBgUis(ui:GetChild("HeadBg"))
  uis.root = ui
  return uis
end
