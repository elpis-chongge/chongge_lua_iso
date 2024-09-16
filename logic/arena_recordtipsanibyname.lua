require("Arena_RecordTipsByName")

function GetArena_RecordTipsAniUis(ui)
  local uis = {}
  uis.RecordTips = GetArena_RecordTipsUis(ui:GetChild("RecordTips"))
  uis.root = ui
  return uis
end
