require("Story_RhythmAniByName")

function GetStory_SongBtnUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.RhythmAni = GetStory_RhythmAniUis(ui:GetChild("RhythmAni"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
