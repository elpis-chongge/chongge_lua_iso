require("AbyssFunctionOpen_AbyssTips2ByName")

function GetAbyssFunctionOpen_AbyssTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyssFunctionOpen_AbyssTips2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
