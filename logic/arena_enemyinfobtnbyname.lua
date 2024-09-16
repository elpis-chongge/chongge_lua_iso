require("Arena_CardPicByName")
require("Arena_EnemyRankByName")

function GetArena_EnemyInfoBtnUis(ui)
  local uis = {}
  uis.CardPic = GetArena_CardPicUis(ui:GetChild("CardPic"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.EnemyRank = GetArena_EnemyRankUis(ui:GetChild("EnemyRank"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
