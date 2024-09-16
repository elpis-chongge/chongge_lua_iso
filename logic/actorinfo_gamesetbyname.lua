require("ActorInfo_SetUIByName")

function GetActorInfo_GameSetUis(ui)
  local uis = {}
  uis.SetUI = GetActorInfo_SetUIUis(ui:GetChild("SetUI"))
  uis.root = ui
  return uis
end
