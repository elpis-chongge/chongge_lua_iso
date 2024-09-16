require("PlayerInfo_ChoiceByName")

function GetPlayerInfo_ChoiceWindowUis(ui)
  local uis = {}
  uis.Main = GetPlayerInfo_ChoiceUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
