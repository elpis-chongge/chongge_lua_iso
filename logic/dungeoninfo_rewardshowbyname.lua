function GetDungeonInfo_RewardShowUis(ui)
  local uis = {}
  
  uis.RewardList = ui:GetChild("RewardList")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
