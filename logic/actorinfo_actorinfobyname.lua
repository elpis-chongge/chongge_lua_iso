require("CommonResource_BackGroundByName")
require("ActorInfo_GameSetByName")
require("ActorInfo_TabRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetActorInfo_ActorInfoUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.GameSet = GetActorInfo_GameSetUis(ui:GetChild("GameSet"))
  uis.TabRegion = GetActorInfo_TabRegionUis(ui:GetChild("TabRegion"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
