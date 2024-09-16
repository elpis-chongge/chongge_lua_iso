require("CommonResource_BackGroundByName")
require("ActivityDungeon1_MainTitleByName")
require("CommonResource_CurrencyReturnByName")

function GetActivityDungeon1_ActivityDungeonUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.PlotBtn = ui:GetChild("PlotBtn")
  uis.TaskBtn = ui:GetChild("TaskBtn")
  uis.ShopBtn = ui:GetChild("ShopBtn")
  uis.NormalBtn = ui:GetChild("NormalBtn")
  uis.MaterialBtn = ui:GetChild("MaterialBtn")
  uis.BossBtn = ui:GetChild("BossBtn")
  uis.MiniGameBtn = ui:GetChild("MiniGameBtn")
  uis.SignBtn = ui:GetChild("SignBtn")
  uis.PassBtn = ui:GetChild("PassBtn")
  uis.MainTitle = GetActivityDungeon1_MainTitleUis(ui:GetChild("MainTitle"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
