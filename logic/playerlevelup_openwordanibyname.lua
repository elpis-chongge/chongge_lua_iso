require("PlayerLevelUp_OpenWordByName")

function GetPlayerLevelUp_OpenWordAniUis(ui)
  local uis = {}
  uis.OpenWord = GetPlayerLevelUp_OpenWordUis(ui:GetChild("OpenWord"))
  uis.root = ui
  return uis
end
