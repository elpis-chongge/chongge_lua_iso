require("ActivityDungeon1002_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1002_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1002_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
