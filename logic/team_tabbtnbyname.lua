require("Team_TabBtnBgByName")

function GetTeam_TabBtnUis(ui)
  local uis = {}
  uis.TabBtnBg = GetTeam_TabBtnBgUis(ui:GetChild("TabBtnBg"))
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
