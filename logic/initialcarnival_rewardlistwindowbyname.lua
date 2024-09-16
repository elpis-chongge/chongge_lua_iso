require("InitialCarnival_RewardList2ByName")

function GetInitialCarnival_RewardListWindowUis(ui)
  local uis = {}
  uis.Main = GetInitialCarnival_RewardList2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
