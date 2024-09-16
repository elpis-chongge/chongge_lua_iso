require("PlayerInfo_ChoiceHeadPicByName")

function GetPlayerInfo_ChoiceHeadPicAniBtnUis(ui)
  local uis = {}
  uis.ChoiceHeadPic = GetPlayerInfo_ChoiceHeadPicUis(ui:GetChild("ChoiceHeadPic"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
