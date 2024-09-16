require("Battle_PlayerBuffLookByName")

function GetBattle_BuffListWordUis(ui)
  local uis = {}
  uis.PlayerBuff = GetBattle_PlayerBuffLookUis(ui:GetChild("PlayerBuff"))
  uis.LineImage = ui:GetChild("LineImage")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
