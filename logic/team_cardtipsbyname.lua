require("Team_Quality1_1ByName")
require("Team_CardPicByName")
require("Team_Quality1_2ByName")
require("CommonResource_OccupationByName")
require("CommonResource_CardBreachByName")

function GetTeam_CardTipsUis(ui)
  local uis = {}
  uis.Quality1_1 = GetTeam_Quality1_1Uis(ui:GetChild("Quality1_1"))
  uis.CardPic = GetTeam_CardPicUis(ui:GetChild("CardPic"))
  uis.Quality1_2 = GetTeam_Quality1_2Uis(ui:GetChild("Quality1_2"))
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.StarList = ui:GetChild("StarList")
  uis.CardNameTxt = ui:GetChild("CardNameTxt")
  uis.CardLvTxt = ui:GetChild("CardLvTxt")
  uis.CardBreach = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach"))
  uis.root = ui
  return uis
end
