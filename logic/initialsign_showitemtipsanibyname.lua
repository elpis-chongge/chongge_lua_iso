require("InitialSign_ShowItemTipsByName")

function GetInitialSign_ShowItemTipsAniUis(ui)
  local uis = {}
  uis.ShowItemTips = GetInitialSign_ShowItemTipsUis(ui:GetChild("ShowItemTips"))
  uis.root = ui
  return uis
end
