require("Guild_Time2ByName")

function GetGuild_ApplyButtonBtnUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Time = GetGuild_Time2Uis(ui:GetChild("Time"))
  uis.buttonAniCtr = ui:GetController("buttonAni")
  uis.root = ui
  return uis
end
