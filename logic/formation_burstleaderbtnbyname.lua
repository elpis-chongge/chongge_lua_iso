require("Formation_BurstLeaderBgByName")

function GetFormation_BurstLeaderBtnUis(ui)
  local uis = {}
  uis.BurstLeaderBg = GetFormation_BurstLeaderBgUis(ui:GetChild("BurstLeaderBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
