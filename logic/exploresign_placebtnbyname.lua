require("ExploreSign_EffectByName")
require("ExploreSign_SelectedWordByName")
require("ExploreSign_GetWordByName")

function GetExploreSign_PlaceBtnUis(ui)
  local uis = {}
  uis.Effect = GetExploreSign_EffectUis(ui:GetChild("Effect"))
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.SelectedWord = GetExploreSign_SelectedWordUis(ui:GetChild("SelectedWord"))
  uis.GetWord = GetExploreSign_GetWordUis(ui:GetChild("GetWord"))
  uis.buttonCtr = ui:GetController("button")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
