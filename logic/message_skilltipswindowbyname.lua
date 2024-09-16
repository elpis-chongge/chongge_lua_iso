require("Message_SkillTipsByName")

function GetMessage_SkillTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_SkillTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
