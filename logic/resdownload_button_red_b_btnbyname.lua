require("ResDownload_Button_Red_BByName")

function GetResDownload_Button_Red_B_BtnUis(ui)
  local uis = {}
  uis.ButtonShadow = GetResDownload_Button_Red_BUis(ui:GetChild("ButtonShadow"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
