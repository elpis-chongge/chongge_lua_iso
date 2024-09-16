require("DailyDungeon_TabBtnBgByName")
require("DailyDungeon_Occupation2ByName")
require("DailyDungeon_Occupation1ByName")

function GetDailyDungeon_TabBtnUis(ui)
  local uis = {}
  uis.TabBtnBg = GetDailyDungeon_TabBtnBgUis(ui:GetChild("TabBtnBg"))
  uis.Badge2 = GetDailyDungeon_Occupation2Uis(ui:GetChild("Badge2"))
  uis.Badge1 = GetDailyDungeon_Occupation1Uis(ui:GetChild("Badge1"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.button1Ctr = ui:GetController("button1")
  uis.root = ui
  return uis
end
