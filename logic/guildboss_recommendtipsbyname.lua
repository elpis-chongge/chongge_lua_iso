require("GuildBoss_RecommendIntegralByName")

function GetGuildBoss_RecommendTipsUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.SkillList = ui:GetChild("SkillList")
  uis.HeadList = ui:GetChild("HeadList")
  uis.Integral = GetGuildBoss_RecommendIntegralUis(ui:GetChild("Integral"))
  uis.TimeAxisBtn = ui:GetChild("TimeAxisBtn")
  uis.DataBtn = ui:GetChild("DataBtn")
  uis.PlayBackBtn = ui:GetChild("PlayBackBtn")
  uis.UseBtn = ui:GetChild("UseBtn")
  uis.root = ui
  return uis
end
