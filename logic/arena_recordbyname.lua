require("CommonResource_BackGroundByName")
require("Arena_TitleByName")
require("CommonResource_CurrencyReturnByName")

function GetArena_RecordUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Title = GetArena_TitleUis(ui:GetChild("Title"))
  uis.RecordTipsList = ui:GetChild("RecordTipsList")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
