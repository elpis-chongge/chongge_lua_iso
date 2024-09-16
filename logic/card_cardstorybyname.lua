require("Card_StoryByName")
require("Card_VoiceByName")
require("Card_VoiceWordByName")
require("Card_CVByName")

function GetCard_CardStoryUis(ui)
  local uis = {}
  uis.Story = GetCard_StoryUis(ui:GetChild("Story"))
  uis.Voice = GetCard_VoiceUis(ui:GetChild("Voice"))
  uis.Cultivate1Btn = ui:GetChild("Cultivate1Btn")
  uis.Cultivate2Btn = ui:GetChild("Cultivate2Btn")
  uis.VoiceWord = GetCard_VoiceWordUis(ui:GetChild("VoiceWord"))
  uis.CV = GetCard_CVUis(ui:GetChild("CV"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
