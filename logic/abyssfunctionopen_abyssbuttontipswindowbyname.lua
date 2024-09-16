require("AbyssFunctionOpen_AbyssButtonTipsByName")

function GetAbyssFunctionOpen_AbyssButtonTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyssFunctionOpen_AbyssButtonTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
