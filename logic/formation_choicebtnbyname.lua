require("Formation_ChoiceAniByName")

function GetFormation_ChoiceBtnUis(ui)
  local uis = {}
  uis.ChoiceAni = GetFormation_ChoiceAniUis(ui:GetChild("ChoiceAni"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
