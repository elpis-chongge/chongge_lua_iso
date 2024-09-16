require("Message_DetailsAllSkillByName")

function GetMessage_DetailsAllSkillWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_DetailsAllSkillUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
