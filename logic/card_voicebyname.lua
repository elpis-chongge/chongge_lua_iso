require("Card_VoiceTitleByName")
require("Card_VoiceListByName")

function GetCard_VoiceUis(ui)
  local uis = {}
  uis.StoryTitle = GetCard_VoiceTitleUis(ui:GetChild("StoryTitle"))
  uis.VoiceList = GetCard_VoiceListUis(ui:GetChild("VoiceList"))
  uis.root = ui
  return uis
end
