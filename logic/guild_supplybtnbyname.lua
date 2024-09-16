require("CommonResource_RedDotByName")

function GetGuild_SupplyBtnUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.bossCtr = ui:GetController("boss")
  uis.root = ui
  return uis
end
