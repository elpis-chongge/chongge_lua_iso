require("Story_NewByName")

function GetStory_CoverBtnUis(ui)
  local uis = {}
  uis.CoverLoader = ui:GetChild("CoverLoader")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.New = GetStory_NewUis(ui:GetChild("New"))
  uis.buttonCtr = ui:GetController("button")
  uis.FlagCtr = ui:GetController("Flag")
  uis.root = ui
  return uis
end
