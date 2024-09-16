require("Card_StarUpTipsByName")

function GetCard_StarUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetCard_StarUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
