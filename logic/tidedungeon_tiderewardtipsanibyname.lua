require("TideDungeon_TideRewardTipsByName")

function GetTideDungeon_TideRewardTipsAniUis(ui)
  local uis = {}
  uis.RewardTips = GetTideDungeon_TideRewardTipsUis(ui:GetChild("RewardTips"))
  uis.root = ui
  return uis
end
