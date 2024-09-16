require("InitialSign_PopupBgByName")
require("InitialSign_RewardShowListByName")

function GetInitialSign_RewardShowUis(ui)
  local uis = {}
  uis.PopupBg = GetInitialSign_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.RewardShowList = GetInitialSign_RewardShowListUis(ui:GetChild("RewardShowList"))
  uis.root = ui
  return uis
end
