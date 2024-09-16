require("ActivityDungeon1001_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1001_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1001_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
