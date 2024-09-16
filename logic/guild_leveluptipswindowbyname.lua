require("Guild_LevelUpTips2ByName")

function GetGuild_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetGuild_LevelUpTips2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
