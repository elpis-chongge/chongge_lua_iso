require("Message_FloatTipsByName")

function GetMessage_FloatTipsUnitUis(ui)
  local uis = {}
  uis.FloatTips = GetMessage_FloatTipsUis(ui:GetChild("FloatTips"))
  uis.root = ui
  return uis
end
