require("Message_TokensTipsAniByName")

function GetMessage_TokensTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_TokensTipsAniUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
