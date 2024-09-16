function GetPlotPlayEditor_DialogEffectUis(ui)
  local uis = {}
  
  uis.CameraMoveCBox = ui:GetChild("CameraMoveCBox")
  uis.CameraScaleCBox = ui:GetChild("CameraScaleCBox")
  uis.CameraMoveDelayTxt = ui:GetChild("CameraMoveDelayTxt")
  uis.CameraScaleDelayTxt = ui:GetChild("CameraScaleDelayTxt")
  uis.CameraShakeCBox = ui:GetChild("CameraShakeCBox")
  uis.CameraShakeDelayTxt = ui:GetChild("CameraShakeDelayTxt")
  uis.CameraMoveStartTxt = ui:GetChild("CameraMoveStartTxt")
  uis.CameraScaleStartTxt = ui:GetChild("CameraScaleStartTxt")
  uis.CameraMoveTimeTxt = ui:GetChild("CameraMoveTimeTxt")
  uis.CameraScaleTimeTxt = ui:GetChild("CameraScaleTimeTxt")
  uis.CameraShakeTimeTxt = ui:GetChild("CameraShakeTimeTxt")
  uis.TopEffectPathTxt = ui:GetChild("TopEffectPathTxt")
  uis.TopEffectDelayTxt = ui:GetChild("TopEffectDelayTxt")
  uis.root = ui
  return uis
end
