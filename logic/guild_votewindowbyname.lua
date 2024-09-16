require("Guild_Vote2ByName")

function GetGuild_VoteWindowUis(ui)
  local uis = {}
  uis.Main = GetGuild_Vote2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
