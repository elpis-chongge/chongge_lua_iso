require("Message_ItemGetTipsByName")

function GetMessage_ItemGetTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_ItemGetTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
