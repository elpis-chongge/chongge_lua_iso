require("Message_BreachAttributeContentByName")

function GetMessage_BreachAttributeUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.BreachSkillContent = GetMessage_BreachAttributeContentUis(ui:GetChild("BreachSkillContent"))
  uis.root = ui
  return uis
end
