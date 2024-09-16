require("Card_SkillInfoByName")

function GetCard_SkillWordUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.SkillInfo = GetCard_SkillInfoUis(ui:GetChild("SkillInfo"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
