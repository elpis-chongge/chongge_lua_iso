require("Abyss_BigMapPicByName")
require("Abyss_Area1ByName")
require("Abyss_Area2ByName")
require("Abyss_Area3ByName")
require("Abyss_Area4ByName")
require("Abyss_Area5ByName")
require("Abyss_Area6ByName")
require("Abyss_Area7ByName")
require("Abyss_Area8ByName")
require("Abyss_BigMapEventPicByName")

function GetAbyss_BigMapPicDragUis(ui)
  local uis = {}
  uis.BigMapPic = GetAbyss_BigMapPicUis(ui:GetChild("BigMapPic"))
  uis.Area1 = GetAbyss_Area1Uis(ui:GetChild("Area1"))
  uis.Area2 = GetAbyss_Area2Uis(ui:GetChild("Area2"))
  uis.Area3 = GetAbyss_Area3Uis(ui:GetChild("Area3"))
  uis.Area4 = GetAbyss_Area4Uis(ui:GetChild("Area4"))
  uis.Area5 = GetAbyss_Area5Uis(ui:GetChild("Area5"))
  uis.Area6 = GetAbyss_Area6Uis(ui:GetChild("Area6"))
  uis.Area7 = GetAbyss_Area7Uis(ui:GetChild("Area7"))
  uis.Area8 = GetAbyss_Area8Uis(ui:GetChild("Area8"))
  uis.BigMapEventPic = GetAbyss_BigMapEventPicUis(ui:GetChild("BigMapEventPic"))
  uis.root = ui
  return uis
end
