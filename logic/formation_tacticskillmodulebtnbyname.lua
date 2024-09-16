require("Formation_TacticSkillWearByName")

function GetFormation_TacticSkillModuleBtnUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.Wear = GetFormation_TacticSkillWearUis(ui:GetChild("Wear"))
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.wearCtr = ui:GetController("wear")
  uis.root = ui
  return uis
end
