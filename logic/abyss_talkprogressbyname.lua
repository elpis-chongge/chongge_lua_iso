function GetAbyss_TalkProgressUis(ui)
  local uis = {}
  
  uis.Progress1Txt = ui:GetChild("Progress1Txt")
  uis.Progress2Txt = ui:GetChild("Progress2Txt")
  uis.root = ui
  return uis
end
