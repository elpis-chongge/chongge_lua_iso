require("GuildBoss_GuildSkillWearByName")

function GetGuildBoss_GuildSkillModuleBtnUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.Wear = GetGuildBoss_GuildSkillWearUis(ui:GetChild("Wear"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.wearCtr = ui:GetController("wear")
  uis.root = ui
  return uis
end
