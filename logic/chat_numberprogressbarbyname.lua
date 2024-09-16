require("Chat_NumberProgressFillByName")

function GetChat_NumberProgressBarUis(ui)
  local uis = {}
  uis.bar = GetChat_NumberProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
