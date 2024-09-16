require("Card_SkillUpIconType2ByName")

function GetCard_SkillUpIcon2BtnUis(ui)
  local uis = {}
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.Type = GetCard_SkillUpIconType2Uis(ui:GetChild("Type"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
