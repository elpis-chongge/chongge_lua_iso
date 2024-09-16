require("Badge_TabBtnBgByName")

function GetBadge_TabBtnUis(ui)
  local uis = {}
  uis.TabBtnBg = GetBadge_TabBtnBgUis(ui:GetChild("TabBtnBg"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
