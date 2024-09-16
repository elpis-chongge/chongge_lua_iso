require("CommonResource_PopupBgByName")
require("ActivityDungeon1_PassportUp_LevelUpBgByName")

function GetActivityDungeon1_PassportUp_LevelUpTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.LevelUpBg = GetActivityDungeon1_PassportUp_LevelUpBgUis(ui:GetChild("LevelUpBg"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
