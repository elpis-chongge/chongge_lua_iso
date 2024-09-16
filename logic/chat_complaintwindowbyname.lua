require("Chat_Complaint2ByName")

function GetChat_ComplaintWindowUis(ui)
  local uis = {}
  uis.Main = GetChat_Complaint2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
