require("Message_MapTipsByName")

function GetMessage_MapTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_MapTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
