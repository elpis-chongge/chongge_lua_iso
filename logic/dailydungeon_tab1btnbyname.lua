require("DailyDungeon_TabBtnBgByName")
require("DailyDungeon_Badge2ByName")
require("DailyDungeon_Badge1ByName")

function GetDailyDungeon_Tab1BtnUis(ui)
  local uis = {}
  uis.TabBtnBg = GetDailyDungeon_TabBtnBgUis(ui:GetChild("TabBtnBg"))
  uis.Badge2 = GetDailyDungeon_Badge2Uis(ui:GetChild("Badge2"))
  uis.Badge1 = GetDailyDungeon_Badge1Uis(ui:GetChild("Badge1"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.button1Ctr = ui:GetController("button1")
  uis.root = ui
  return uis
end
