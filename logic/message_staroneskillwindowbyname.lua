require("Message_StarOneSkill2ByName")

function GetMessage_StarOneSkillWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_StarOneSkill2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
