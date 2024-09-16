require("Guild_DisagreeProgressFillByName")

function GetGuild_DisagreeProgressBarUis(ui)
  local uis = {}
  uis.bar = GetGuild_DisagreeProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
