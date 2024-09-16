require("CommonResource_HeadByName")
require("Chat_ShieldOnLineByName")

function GetChat_PlayerInfoUis(ui)
  local uis = {}
  uis.Head = GetCommonResource_HeadUis(ui:GetChild("Head"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.OnLine = GetChat_ShieldOnLineUis(ui:GetChild("OnLine"))
  uis.DeleteBtn = ui:GetChild("DeleteBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
