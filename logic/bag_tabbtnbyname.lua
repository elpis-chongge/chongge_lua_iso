require("Bag_TabBtnBgByName")
require("Bag_BadgeMemoryByName")

function GetBag_TabBtnUis(ui)
  local uis = {}
  uis.TabBtnBg = GetBag_TabBtnBgUis(ui:GetChild("TabBtnBg"))
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.BadgeMemory = GetBag_BadgeMemoryUis(ui:GetChild("BadgeMemory"))
  uis.buttonCtr = ui:GetController("button")
  uis.BadgeCtr = ui:GetController("Badge")
  uis.root = ui
  return uis
end
