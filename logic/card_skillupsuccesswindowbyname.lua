require("Card_SkillUpSuccess2ByName")

function GetCard_SkillUpSuccessWindowUis(ui)
  local uis = {}
  uis.Main = GetCard_SkillUpSuccess2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
