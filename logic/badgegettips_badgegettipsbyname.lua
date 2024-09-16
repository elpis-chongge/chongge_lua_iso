require("CommonResource_BackGroundByName")
require("BadgeGetTips_LightByName")
require("BadgeGetTips_BadgePicByName")

function GetBadgeGetTips_BadgeGetTipsUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Light = GetBadgeGetTips_LightUis(ui:GetChild("Light"))
  uis.BadgePic = GetBadgeGetTips_BadgePicUis(ui:GetChild("BadgePic"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
