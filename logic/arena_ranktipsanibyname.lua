require("Arena_RankTipsByName")

function GetArena_RankTipsAniUis(ui)
  local uis = {}
  uis.RankTips = GetArena_RankTipsUis(ui:GetChild("RankTips"))
  uis.root = ui
  return uis
end
