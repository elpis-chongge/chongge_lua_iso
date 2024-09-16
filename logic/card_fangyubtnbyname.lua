require("Card_BgAniByName")

function GetCard_FangYuBtnUis(ui)
  local uis = {}
  uis.BgAni = GetCard_BgAniUis(ui:GetChild("BgAni"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
