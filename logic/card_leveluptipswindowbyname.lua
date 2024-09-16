require("Card_LevelUpTips2ByName")

function GetCard_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetCard_LevelUpTips2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
