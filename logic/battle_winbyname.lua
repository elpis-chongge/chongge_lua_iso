require("Battle_WinBgByName")

function GetBattle_WinUis(ui)
  local uis = {}
  uis.WinBg = GetBattle_WinBgUis(ui:GetChild("WinBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.root = ui
  return uis
end
