require("Message_TokensUseMarkByName")

function GetMessage_DetailsBtnUis(ui)
  local uis = {}
  uis.UseMark = GetMessage_TokensUseMarkUis(ui:GetChild("UseMark"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
