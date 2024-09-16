require("Formation_ElementChoiceByName")
require("Formation_OccupationChoiceByName")
require("Formation_QueueChoiceByName")
require("Formation_SkillCDChoiceByName")

function GetFormation_ScreenTipsUis(ui)
  local uis = {}
  uis.ElementChoice = GetFormation_ElementChoiceUis(ui:GetChild("ElementChoice"))
  uis.OccupationChoice = GetFormation_OccupationChoiceUis(ui:GetChild("OccupationChoice"))
  uis.QueueChoice = GetFormation_QueueChoiceUis(ui:GetChild("QueueChoice"))
  uis.SkillCDChoice = GetFormation_SkillCDChoiceUis(ui:GetChild("SkillCDChoice"))
  uis.root = ui
  return uis
end
