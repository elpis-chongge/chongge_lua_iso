require("DungeonInfo_PlayerBgAni1ByName")

function GetDungeonInfo_PlayerLabel1BtnUis(ui)
  local uis = {}
  uis.BgAni = GetDungeonInfo_PlayerBgAni1Uis(ui:GetChild("BgAni"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
