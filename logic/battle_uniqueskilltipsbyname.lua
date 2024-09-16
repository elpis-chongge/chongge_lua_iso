function GetBattle_UniqueSkillTipsUis(ui)
  local uis = {}
  
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
