require("Badge_HeadShowBgByName")

function GetBadge_HeadShowUis(ui)
  local uis = {}
  uis.HeadShowBg = GetBadge_HeadShowBgUis(ui:GetChild("HeadShowBg"))
  uis.root = ui
  return uis
end
