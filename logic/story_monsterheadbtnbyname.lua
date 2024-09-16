require("Story_MonsterHeadBgByName")
require("Story_NewByName")

function GetStory_MonsterHeadBtnUis(ui)
  local uis = {}
  uis.MonsterHeadBg = GetStory_MonsterHeadBgUis(ui:GetChild("MonsterHeadBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.New = GetStory_NewUis(ui:GetChild("New"))
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.FlagCtr = ui:GetController("Flag")
  uis.root = ui
  return uis
end
