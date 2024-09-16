require("Home_CardShowByName")

function GetHome_CardShowNullUis(ui)
  local uis = {}
  uis.CardShow = GetHome_CardShowUis(ui:GetChild("CardShow"))
  uis.root = ui
  return uis
end
