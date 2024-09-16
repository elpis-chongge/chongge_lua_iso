require("Card_CardSkillUpHeadBgByName")
require("Card_CardSkillUpBreachByName")

function GetCard_CardSkillUpHeadBtnUis(ui)
  local uis = {}
  uis.HeadBg = GetCard_CardSkillUpHeadBgUis(ui:GetChild("HeadBg"))
  uis.Breach = GetCard_CardSkillUpBreachUis(ui:GetChild("Breach"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
