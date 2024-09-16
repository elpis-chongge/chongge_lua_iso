require("Card_VoicProgressFillByName")

function GetCard_VoicProgressBarUis(ui)
  local uis = {}
  uis.bar = GetCard_VoicProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
