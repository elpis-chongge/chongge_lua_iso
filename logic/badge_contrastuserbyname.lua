require("Badge_HeadShowByName")

function GetBadge_ContrastUserUis(ui)
  local uis = {}
  uis.HeadShow = GetBadge_HeadShowUis(ui:GetChild("HeadShow"))
  uis.root = ui
  return uis
end
