require("DungeonInfo_HeadBtnBgByName")

function GetDungeonInfo_HeadBtnUis(ui)
  local uis = {}
  uis.HeadBtnBg = GetDungeonInfo_HeadBtnBgUis(ui:GetChild("HeadBtnBg"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
