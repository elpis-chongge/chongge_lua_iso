require("CommonResource_BackGroundByName")
require("RogueBuild01_BookEventPicByName")
require("RogueBuild01_BookEventTitleByName")
require("CommonResource_CurrencyReturnByName")

function GetRogueBuild01_BookEventUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.EventPic = GetRogueBuild01_BookEventPicUis(ui:GetChild("EventPic"))
  uis.Title = GetRogueBuild01_BookEventTitleUis(ui:GetChild("Title"))
  uis.TabList = ui:GetChild("TabList")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
