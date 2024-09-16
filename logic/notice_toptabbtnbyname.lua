require("Notice_TopTabBtnBgByName")

function GetNotice_TopTabBtnUis(ui)
  local uis = {}
  uis.TopTabBtnBg = GetNotice_TopTabBtnBgUis(ui:GetChild("TopTabBtnBg"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
