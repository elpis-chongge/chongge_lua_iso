require("ActivityDungeon1001_MiniStart_RightNextByName")

function GetActivityDungeon1001_MiniStart_RightRegionUis(ui)
  local uis = {}
  uis.Next = GetActivityDungeon1001_MiniStart_RightNextUis(ui:GetChild("Next"))
  uis.PutBtn = ui:GetChild("PutBtn")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
