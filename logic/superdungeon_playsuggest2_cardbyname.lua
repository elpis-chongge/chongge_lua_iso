require("SuperDungeon_PlaySuggest2_CardBgByName")

function GetSuperDungeon_PlaySuggest2_CardUis(ui)
  local uis = {}
  uis.n2 = GetSuperDungeon_PlaySuggest2_CardBgUis(ui:GetChild("n2"))
  uis.root = ui
  return uis
end
