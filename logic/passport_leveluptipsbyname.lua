require("CommonResource_PopupBgByName")
require("Passport_LevelUpBgByName")

function GetPassport_LevelUpTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.LevelUpBg = GetPassport_LevelUpBgUis(ui:GetChild("LevelUpBg"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
