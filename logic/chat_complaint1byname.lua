require("Chat_ContentByName")

function GetChat_Complaint1Uis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Content = GetChat_ContentUis(ui:GetChild("Content"))
  uis.OptionList = ui:GetChild("OptionList")
  uis.root = ui
  return uis
end
