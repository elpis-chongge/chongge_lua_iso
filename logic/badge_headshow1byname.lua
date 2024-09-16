require("Badge_HeadShow1BgByName")

function GetBadge_HeadShow1Uis(ui)
  local uis = {}
  uis.HeadShowBg = GetBadge_HeadShow1BgUis(ui:GetChild("HeadShowBg"))
  uis.root = ui
  return uis
end
