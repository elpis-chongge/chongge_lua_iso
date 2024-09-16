require("CardAttribute_BadgeCardInfoByName")

function GetCardAttribute_BadgeCardInfoWindowUis(ui)
  local uis = {}
  uis.Main = GetCardAttribute_BadgeCardInfoUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
