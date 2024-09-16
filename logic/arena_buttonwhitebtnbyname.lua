require("CommonResource_ArenaDefendNewByName")

function GetArena_ButtonWhiteBtnUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.New = GetCommonResource_ArenaDefendNewUis(ui:GetChild("New"))
  uis.buttonCtr = ui:GetController("button")
  uis.newCtr = ui:GetController("new")
  uis.root = ui
  return uis
end
