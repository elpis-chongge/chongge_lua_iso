require("GuildTrain_ElementTabBgByName")

function GetGuildTrain_ElementTabBtnUis(ui)
  local uis = {}
  uis.ElementTabBg = GetGuildTrain_ElementTabBgUis(ui:GetChild("ElementTabBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
