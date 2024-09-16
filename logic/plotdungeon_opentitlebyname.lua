require("CommonResource_PopupBgByName")

function GetPlotDungeon_OpenTitleUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.EffectBgHolder = ui:GetChild("EffectBgHolder")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
