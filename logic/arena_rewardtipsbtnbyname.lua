require("Arena_RewardGetRegionByName")
require("Arena_CompleteTipsByName")

function GetArena_RewardTipsBtnUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.ProgressTxt = ui:GetChild("ProgressTxt")
  uis.RewardGetRegion = GetArena_RewardGetRegionUis(ui:GetChild("RewardGetRegion"))
  uis.RewardList = ui:GetChild("RewardList")
  uis.CompleteTips = GetArena_CompleteTipsUis(ui:GetChild("CompleteTips"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
