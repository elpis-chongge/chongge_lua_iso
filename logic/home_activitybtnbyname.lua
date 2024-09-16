require("CommonResource_RedDotByName")

function GetHome_ActivityBtnUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.TitleWordTxt = ui:GetChild("TitleWordTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.LockTxt = ui:GetChild("LockTxt")
  uis.LockWordTxt = ui:GetChild("LockWordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
