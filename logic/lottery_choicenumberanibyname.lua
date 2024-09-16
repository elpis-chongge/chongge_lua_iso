require("Lottery_ChoiceNumberByName")

function GetLottery_ChoiceNumberAniUis(ui)
  local uis = {}
  uis.ChoiceNumber = GetLottery_ChoiceNumberUis(ui:GetChild("ChoiceNumber"))
  uis.root = ui
  return uis
end
