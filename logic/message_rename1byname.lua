require("Message_SpendByName")

function GetMessage_Rename1Uis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Spend = GetMessage_SpendUis(ui:GetChild("Spend"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
