require("CommonResource_AbyssTipsWordByName")

function GetAbyssFunctionOpen_AbyssButtonTipsUis(ui)
  local uis = {}
  uis.AbyssTipsBtn = ui:GetChild("AbyssTipsBtn")
  uis.AbyssTipsWord = GetCommonResource_AbyssTipsWordUis(ui:GetChild("AbyssTipsWord"))
  uis.root = ui
  return uis
end
