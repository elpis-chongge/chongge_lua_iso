require("CommonResource_BackGroundByName")
require("PlayerInfo_CardTypeChoiceByName")
require("PlayerInfo_CardScreenByName")
require("CommonResource_CurrencyReturnByName")

function GetPlayerInfo_ChoiceUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.ChoiceList = ui:GetChild("ChoiceList")
  uis.CardTypeChoice = GetPlayerInfo_CardTypeChoiceUis(ui:GetChild("CardTypeChoice"))
  uis.CardScreen = GetPlayerInfo_CardScreenUis(ui:GetChild("CardScreen"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
