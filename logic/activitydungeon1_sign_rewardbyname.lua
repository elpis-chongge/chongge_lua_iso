require("ActivityDungeon1_Sign_AllFrameByName")

function GetActivityDungeon1_Sign_RewardUis(ui)
  local uis = {}
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.Number1Txt = ui:GetChild("Number1Txt")
  uis.Item = GetActivityDungeon1_Sign_AllFrameUis(ui:GetChild("Item"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
