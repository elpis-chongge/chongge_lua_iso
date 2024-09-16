require("InitialSign_RewardShowByName")

function GetInitialSign_RewardShowWindowUis(ui)
  local uis = {}
  uis.Main = GetInitialSign_RewardShowUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
