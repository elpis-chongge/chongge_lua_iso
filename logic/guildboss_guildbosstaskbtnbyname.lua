require("CommonResource_RedDotByName")

function GetGuildBoss_GuildBossTaskBtnUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
