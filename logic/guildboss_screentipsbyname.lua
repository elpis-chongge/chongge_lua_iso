require("GuildBoss_ScreenTipsTitleByName")

function GetGuildBoss_ScreenTipsUis(ui)
  local uis = {}
  uis.Popup_S_Black_Btn = ui:GetChild("Popup_S_Black_Btn")
  uis.Popup_S_Green_Btn = ui:GetChild("Popup_S_Green_Btn")
  uis.Title1 = GetGuildBoss_ScreenTipsTitleUis(ui:GetChild("Title1"))
  uis.CardList = ui:GetChild("CardList")
  uis.Title2 = GetGuildBoss_ScreenTipsTitleUis(ui:GetChild("Title2"))
  uis.ScreenList = ui:GetChild("ScreenList")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
