require("CommonResource_BackGroundByName")

function GetPlotDungeon_OpenSceneUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.Number1Txt = ui:GetChild("Number1Txt")
  uis.Number2Txt = ui:GetChild("Number2Txt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
