require("ActorInfo_SetIconByName")
require("ActorInfo_WeatherByName")
require("ActorInfo_LanguageByName")
require("ActorInfo_BurstShowByName")

function GetActorInfo_SetTipsUis(ui)
  local uis = {}
  uis.SetIcon = GetActorInfo_SetIconUis(ui:GetChild("SetIcon"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.VoiceSlider = ui:GetChild("VoiceSlider")
  uis.SetSwitchBtn = ui:GetChild("SetSwitchBtn")
  uis.AdaptBtn = ui:GetChild("AdaptBtn")
  uis.Weather = GetActorInfo_WeatherUis(ui:GetChild("Weather"))
  uis.Language = GetActorInfo_LanguageUis(ui:GetChild("Language"))
  uis.BurstShow = GetActorInfo_BurstShowUis(ui:GetChild("BurstShow"))
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
