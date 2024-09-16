require("PlayerInfo_ChoiceHeadByName")

function GetPlayerInfo_ChoiceHeadWindowUis(ui)
  local uis = {}
  uis.Main = GetPlayerInfo_ChoiceHeadUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
