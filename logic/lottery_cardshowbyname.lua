require("Lottery_CardTipsContainerByName")

function GetLottery_CardShowUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.PicHolder = ui:GetChild("PicHolder")
  uis.CardTipsContainer = GetLottery_CardTipsContainerUis(ui:GetChild("CardTipsContainer"))
  uis.root = ui
  return uis
end
