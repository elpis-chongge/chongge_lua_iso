require("ActivityDungeon1002_BossBattle_Info1ByName")

function GetActivityDungeon1002_BossBattle_InfoUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = GetActivityDungeon1002_BossBattle_Info1Uis(ui:GetChild("WordTxt"))
  uis.root = ui
  return uis
end
