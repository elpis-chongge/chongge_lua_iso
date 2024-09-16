require("Battle_BuffAddTag2ByName")
require("Battle_BuffAddTag1ByName")

function GetBattle_BuffAddTagUis(ui)
  local uis = {}
  uis.Tag2 = GetBattle_BuffAddTag2Uis(ui:GetChild("Tag2"))
  uis.Tag1 = GetBattle_BuffAddTag1Uis(ui:GetChild("Tag1"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
