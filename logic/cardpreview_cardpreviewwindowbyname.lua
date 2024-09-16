require("CardPreview_CardPreviewByName")

function GetCardPreview_CardPreviewWindowUis(ui)
  local uis = {}
  uis.Main = GetCardPreview_CardPreviewUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
