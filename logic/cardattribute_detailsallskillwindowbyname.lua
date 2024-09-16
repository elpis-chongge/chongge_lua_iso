require("CardAttribute_DetailsAllSkillByName")

function GetCardAttribute_DetailsAllSkillWindowUis(ui)
  local uis = {}
  uis.Main = GetCardAttribute_DetailsAllSkillUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
