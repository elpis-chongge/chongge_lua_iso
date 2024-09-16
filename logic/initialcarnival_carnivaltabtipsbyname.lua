require("InitialCarnival_CarnivalTabBigByName")
require("InitialCarnival_CarnivalTabSmallByName")
require("CommonResource_RedDotByName")

function GetInitialCarnival_CarnivalTabTipsUis(ui)
  local uis = {}
  uis.Big = GetInitialCarnival_CarnivalTabBigUis(ui:GetChild("Big"))
  uis.Small = GetInitialCarnival_CarnivalTabSmallUis(ui:GetChild("Small"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.LockImage = ui:GetChild("LockImage")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
