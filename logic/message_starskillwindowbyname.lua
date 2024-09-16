require("Message_StarSkill2ByName")

function GetMessage_StarSkillWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_StarSkill2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
