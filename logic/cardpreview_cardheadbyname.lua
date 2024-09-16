require("CardPreview_CardHeadBgByName")

function GetCardPreview_CardHeadUis(ui)
  local uis = {}
  uis.CardHeadBg = GetCardPreview_CardHeadBgUis(ui:GetChild("CardHeadBg"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
