require("Formation_LeaderHeadByName")

function GetFormation_BurstLeaderSkillRegionUis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.LeaderHead = GetFormation_LeaderHeadUis(ui:GetChild("LeaderHead"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.HeadList = ui:GetChild("HeadList")
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
