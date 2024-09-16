require("CommonResource_PopupBgByName")

function GetActivityDungeon1001_MiniStart_EndRewardUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.NumberWordTxt = ui:GetChild("NumberWordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.AgainBtn = ui:GetChild("AgainBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
