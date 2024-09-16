require("CardAttribute_SkillLeaderLcokByName")

function GetCardAttribute_DetailsSkillTipsAniUis(ui)
  local uis = {}
  uis.TipsList = ui:GetChild("TipsList")
  uis.SkillLeaderLcok = GetCardAttribute_SkillLeaderLcokUis(ui:GetChild("SkillLeaderLcok"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
