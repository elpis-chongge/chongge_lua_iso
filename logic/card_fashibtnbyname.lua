require("Card_BgAniByName")

function GetCard_FaShiBtnUis(ui)
  local uis = {}
  uis.BgAni = GetCard_BgAniUis(ui:GetChild("BgAni"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
