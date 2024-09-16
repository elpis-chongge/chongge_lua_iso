require("DungeonInfo_BossHpProgressFillByName")

function GetDungeonInfo_BossHpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetDungeonInfo_BossHpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
