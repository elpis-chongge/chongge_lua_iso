require("DungeonInfo_PlayerBgAni2ByName")

function GetDungeonInfo_PlayerLabel2BtnUis(ui)
  local uis = {}
  uis.BgAni = GetDungeonInfo_PlayerBgAni2Uis(ui:GetChild("BgAni"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
