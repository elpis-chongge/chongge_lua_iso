require("RogueBuild01_ChoiceCardList_CardByName")

function GetRogueBuild01_ChoiceCardList_CardAniUis(ui)
  local uis = {}
  uis.Card = GetRogueBuild01_ChoiceCardList_CardUis(ui:GetChild("Card"))
  uis.root = ui
  return uis
end
