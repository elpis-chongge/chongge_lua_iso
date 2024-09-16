require("Guild_IconChoice2ByName")

function GetGuild_IconChoiceWindowUis(ui)
  local uis = {}
  uis.Main = GetGuild_IconChoice2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
