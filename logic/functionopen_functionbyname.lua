require("FunctionOpen_PopupBgByName")
require("FunctionOpen_LineRightByName")
require("FunctionOpen_LineLeftByName")
require("FunctionOpen_LockWordByName")

function GetFunctionOpen_FunctionUis(ui)
  local uis = {}
  uis.PopupBg = GetFunctionOpen_PopupBgUis(ui:GetChild("PopupBg"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LineRight = GetFunctionOpen_LineRightUis(ui:GetChild("LineRight"))
  uis.LineLeft = GetFunctionOpen_LineLeftUis(ui:GetChild("LineLeft"))
  uis.LockWord = GetFunctionOpen_LockWordUis(ui:GetChild("LockWord"))
  uis.EffectHolder2 = ui:GetChild("EffectHolder2")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
