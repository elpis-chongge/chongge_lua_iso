require("CommonResource_BackGroundByName")
require("InitialLevelReward_LetterContentByName")
require("InitialLevelReward_LetterRewardByName")

function GetInitialLevelReward_InitialLevelRewardUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.PicHolder = ui:GetChild("PicHolder")
  uis.LetterContent = GetInitialLevelReward_LetterContentUis(ui:GetChild("LetterContent"))
  uis.LetterReward = GetInitialLevelReward_LetterRewardUis(ui:GetChild("LetterReward"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.root = ui
  return uis
end
