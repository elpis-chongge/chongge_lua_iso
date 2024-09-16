function GetDailyDungeon_MapTipsBtnUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.NewImage = ui:GetChild("NewImage")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
