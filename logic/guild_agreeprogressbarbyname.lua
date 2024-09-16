require("Guild_AgreeProgressFillByName")

function GetGuild_AgreeProgressBarUis(ui)
  local uis = {}
  uis.bar = GetGuild_AgreeProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
