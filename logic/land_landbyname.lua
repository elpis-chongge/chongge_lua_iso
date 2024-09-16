require("Land_BackGroundByName")
require("Land_StateByName")
require("Land_AccountByName")
require("Land_FilingsWordByName")
require("Land_TabRegionScreenByName")
require("Land_PopupByName")

function GetLand_LandUis(ui)
  local uis = {}
  uis.BackGround = GetLand_BackGroundUis(ui:GetChild("BackGround"))
  uis.TouchStartBtn = ui:GetChild("TouchStartBtn")
  uis.State = GetLand_StateUis(ui:GetChild("State"))
  uis.VerTxt = ui:GetChild("VerTxt")
  uis.IDTxt = ui:GetChild("IDTxt")
  uis.Account = GetLand_AccountUis(ui:GetChild("Account"))
  uis.FilingsWord = GetLand_FilingsWordUis(ui:GetChild("FilingsWord"))
  uis.SetBtn = ui:GetChild("SetBtn")
  uis.AgeBtn = ui:GetChild("AgeBtn")
  uis.TabRegionScreen = GetLand_TabRegionScreenUis(ui:GetChild("TabRegionScreen"))
  uis.Popup = GetLand_PopupUis(ui:GetChild("Popup"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
