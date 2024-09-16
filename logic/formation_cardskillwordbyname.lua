require("Formation_CardSkillTypeByName")

function GetFormation_CardSkillWordUis(ui)
  local uis = {}
  uis.CardSkillType = GetFormation_CardSkillTypeUis(ui:GetChild("CardSkillType"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
