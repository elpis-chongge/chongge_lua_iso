require("CommonResource_PopupBgByName")

function GetRaidBossTips_RageSkillUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.SkillList = ui:GetChild("SkillList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
