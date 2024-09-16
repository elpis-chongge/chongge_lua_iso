require("CommonResource_BackGroundByName")
require("Abyss_CardPlotTalkLeftByName")
require("Abyss_WeatherByName")
require("Abyss_TalkTipsByName")

function GetAbyss_CardPlotTalkUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.TabRegion = GetAbyss_CardPlotTalkLeftUis(ui:GetChild("TabRegion"))
  uis.Weather = GetAbyss_WeatherUis(ui:GetChild("Weather"))
  uis.TalkList = ui:GetChild("TalkList")
  uis.TalkAutoBtn = ui:GetChild("TalkAutoBtn")
  uis.TalkSkipBtn = ui:GetChild("TalkSkipBtn")
  uis.TalkTips = GetAbyss_TalkTipsUis(ui:GetChild("TalkTips"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
