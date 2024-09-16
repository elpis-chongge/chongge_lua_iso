require("Lottery_Complement2ByName")

function GetLottery_ComplementWindowUis(ui)
  local uis = {}
  uis.Main = GetLottery_Complement2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
