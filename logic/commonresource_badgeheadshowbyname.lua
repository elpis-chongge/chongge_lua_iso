require("CommonResource_BadgeHeadShowBgByName")

function GetCommonResource_BadgeHeadShowUis(ui)
  local uis = {}
  uis.HeadShowBg = GetCommonResource_BadgeHeadShowBgUis(ui:GetChild("HeadShowBg"))
  uis.root = ui
  return uis
end
