require("Abyss_NewByName")

function GetAbyss_StoryBtnUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Red = GetAbyss_NewUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
