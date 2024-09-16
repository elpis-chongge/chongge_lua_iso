function GetPlotPlayEditor_DialogOpenUis(ui)
  local uis = {}
  
  uis.Title1Txt = ui:GetChild("Title1Txt")
  uis.Title2Txt = ui:GetChild("Title2Txt")
  uis.ChooseBtn = ui:GetChild("ChooseBtn")
  uis.ClearBtn = ui:GetChild("ClearBtn")
  uis.BgHolder = ui:GetChild("BgHolder")
  uis.BgLoader = ui:GetChild("BgLoader")
  uis.BgMoveCBox = ui:GetChild("BgMoveCBox")
  uis.BgScaleCBox = ui:GetChild("BgScaleCBox")
  uis.BgMoveDelayTxt = ui:GetChild("BgMoveDelayTxt")
  uis.BgScaleDelayTxt = ui:GetChild("BgScaleDelayTxt")
  uis.BgMoveStartTxt = ui:GetChild("BgMoveStartTxt")
  uis.BgScaleStartTxt = ui:GetChild("BgScaleStartTxt")
  uis.BgMoveTimeTxt = ui:GetChild("BgMoveTimeTxt")
  uis.BgScaleTimeTxt = ui:GetChild("BgScaleTimeTxt")
  uis.root = ui
  return uis
end
