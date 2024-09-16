require("CommonResource_BackGroundByName")

function GetGuildBoss_GuildCardAssistUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.FunctionDetailsBtn = ui:GetChild("FunctionDetailsBtn")
  uis.root = ui
  return uis
end
