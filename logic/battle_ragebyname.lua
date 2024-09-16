require("Battle_RagePopupBgByName")
require("Battle_RageBgByName")
require("Battle_RageCircle1ByName")
require("Battle_RageCircle3ByName")

function GetBattle_RageUis(ui)
  local uis = {}
  uis.PopupBg = GetBattle_RagePopupBgUis(ui:GetChild("PopupBg"))
  uis.RageBg = GetBattle_RageBgUis(ui:GetChild("RageBg"))
  uis.Circle1 = GetBattle_RageCircle1Uis(ui:GetChild("Circle1"))
  uis.Circle3 = GetBattle_RageCircle3Uis(ui:GetChild("Circle3"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.RageLookBtn = ui:GetChild("RageLookBtn")
  uis.root = ui
  return uis
end
