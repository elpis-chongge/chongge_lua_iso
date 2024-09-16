require("CommonResource_BackGroundByName")
require("Expedition_ArrangeLevelByName")
require("Expedition_ArrangeTips1ByName")
require("Expedition_ArrangeTips2ByName")
require("Expedition_ArrangeTips3ByName")
require("CommonResource_CurrencyReturnByName")

function GetExpedition_ArrangeUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.ArrangeLevel = GetExpedition_ArrangeLevelUis(ui:GetChild("ArrangeLevel"))
  uis.ArrangeTips1 = GetExpedition_ArrangeTips1Uis(ui:GetChild("ArrangeTips1"))
  uis.ArrangeTips2 = GetExpedition_ArrangeTips2Uis(ui:GetChild("ArrangeTips2"))
  uis.BattleWave1 = GetExpedition_ArrangeTips3Uis(ui:GetChild("BattleWave1"))
  uis.BattleWave2 = GetExpedition_ArrangeTips3Uis(ui:GetChild("BattleWave2"))
  uis.ArrangeStartBtn = ui:GetChild("ArrangeStartBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
