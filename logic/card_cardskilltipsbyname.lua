require("Card_SkillTipsRegionByName")

function GetCard_CardSkillTipsUis(ui)
  local uis = {}
  uis.SkillTips = GetCard_SkillTipsRegionUis(ui:GetChild("SkillTips"))
  uis.root = ui
  return uis
end
