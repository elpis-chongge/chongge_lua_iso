require("ActorInfo_BattleInfoByName")

function GetActorInfo_BattleInfoWindowUis(ui)
  local uis = {}
  uis.Main = GetActorInfo_BattleInfoUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
