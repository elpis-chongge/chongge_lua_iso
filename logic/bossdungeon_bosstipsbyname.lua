require("BossDungeon_StageByName")

function GetBossDungeon_BossTipsUis(ui)
  local uis = {}
  uis.Stage = GetBossDungeon_StageUis(ui:GetChild("Stage"))
  uis.HeadBtn = ui:GetChild("HeadBtn")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.ElementList = ui:GetChild("ElementList")
  uis.LookBtn = ui:GetChild("LookBtn")
  uis.ChoiceBtn = ui:GetChild("ChoiceBtn")
  uis.root = ui
  return uis
end
