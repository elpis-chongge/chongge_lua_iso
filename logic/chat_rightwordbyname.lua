require("CommonResource_HeadByName")

function GetChat_RightWordUis(ui)
  local uis = {}
  uis.Head = GetCommonResource_HeadUis(ui:GetChild("Head"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
