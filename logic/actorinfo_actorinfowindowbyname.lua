require("ActorInfo_ActorInfoByName")

function GetActorInfo_ActorInfoWindowUis(ui)
  local uis = {}
  uis.Main = GetActorInfo_ActorInfoUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
