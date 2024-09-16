require("Battle_FailBgByName")

function GetBattle_FailUis(ui)
  local uis = {}
  uis.WinBg = GetBattle_FailBgUis(ui:GetChild("WinBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.root = ui
  return uis
end
