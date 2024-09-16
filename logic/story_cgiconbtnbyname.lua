require("Story_NewByName")

function GetStory_CGIconBtnUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.New = GetStory_NewUis(ui:GetChild("New"))
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.FlagCtr = ui:GetController("Flag")
  uis.root = ui
  return uis
end
