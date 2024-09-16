require("CommonResource_BackGroundByName")

function GetDiamondTips_DiamondUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.GoToBtn = ui:GetChild("GoToBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
