require("Explore_SettlementCardHeadBgByName")

function GetExplore_SettlementCardHeadUis(ui)
  local uis = {}
  uis.HeadBg = GetExplore_SettlementCardHeadBgUis(ui:GetChild("HeadBg"))
  uis.root = ui
  return uis
end
