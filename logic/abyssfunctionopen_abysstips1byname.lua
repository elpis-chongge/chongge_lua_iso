require("AbyssFunctionOpen_AbyssTips1BgByName")
require("AbyssFunctionOpen_TipsInfo1ByName")
require("AbyssFunctionOpen_TipsSignByName")

function GetAbyssFunctionOpen_AbyssTips1Uis(ui)
  local uis = {}
  uis.AbyssTips1Bg = GetAbyssFunctionOpen_AbyssTips1BgUis(ui:GetChild("AbyssTips1Bg"))
  uis.TipsCloseBtn = ui:GetChild("TipsCloseBtn")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TipsInfoList = ui:GetChild("TipsInfoList")
  uis.TipsInfo1 = GetAbyssFunctionOpen_TipsInfo1Uis(ui:GetChild("TipsInfo1"))
  uis.TipsLeftBtn = ui:GetChild("TipsLeftBtn")
  uis.TipsRightBtn = ui:GetChild("TipsRightBtn")
  uis.TipsSign = GetAbyssFunctionOpen_TipsSignUis(ui:GetChild("TipsSign"))
  uis.TipsSwitchList = ui:GetChild("TipsSwitchList")
  uis.TipsGoToBtn = ui:GetChild("TipsGoToBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.leftCtr = ui:GetController("left")
  uis.rightCtr = ui:GetController("right")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
