require("Card_SkillLockTipsByName")

function GetCard_StarSkillBtnUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.Lock = GetCard_SkillLockTipsUis(ui:GetChild("Lock"))
  uis.buttonCtr = ui:GetController("button")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
