require("Land_AccountDisplayByName")

function GetLand_StateUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.CloseTipsTxt = ui:GetChild("CloseTipsTxt")
  uis.AccountDisplay = GetLand_AccountDisplayUis(ui:GetChild("AccountDisplay"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
