require("Battle_EndBgByName")

function GetBattle_EndUis(ui)
  local uis = {}
  uis.EndBg = GetBattle_EndBgUis(ui:GetChild("EndBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.root = ui
  return uis
end
