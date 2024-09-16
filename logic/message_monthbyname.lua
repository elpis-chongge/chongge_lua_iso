require("Message_MonthTimeByName")

function GetMessage_MonthUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.PicHolder = ui:GetChild("PicHolder")
  uis.MonthTime = GetMessage_MonthTimeUis(ui:GetChild("MonthTime"))
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.root = ui
  return uis
end
