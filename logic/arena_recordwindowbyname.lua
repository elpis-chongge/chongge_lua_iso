require("Arena_RecordByName")

function GetArena_RecordWindowUis(ui)
  local uis = {}
  uis.Main = GetArena_RecordUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
