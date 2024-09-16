require("Lottery_StartChoiceByName")

function GetLottery_StartChoiceWindowUis(ui)
  local uis = {}
  uis.Main = GetLottery_StartChoiceUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
