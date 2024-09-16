require("OtherPlayerInfo_OnLineByName")

function GetOtherPlayerInfo_InfoUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.GuildTxt = ui:GetChild("GuildTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.OnLine = GetOtherPlayerInfo_OnLineUis(ui:GetChild("OnLine"))
  uis.FunctionList = ui:GetChild("FunctionList")
  uis.root = ui
  return uis
end
