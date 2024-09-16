require("Battle_BuffAddTag1ProgressFillByName")

function GetBattle_BuffAddTag1ProgressBarUis(ui)
  local uis = {}
  uis.bar = GetBattle_BuffAddTag1ProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
