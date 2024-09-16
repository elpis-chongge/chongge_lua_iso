require("Guild_ExpProgressFillByName")

function GetGuild_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetGuild_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
