require("ResDownload_BackGroundByName")

function GetResDownload_ResDownloadUis(ui)
  local uis = {}
  uis.BackGround = GetResDownload_BackGroundUis(ui:GetChild("BackGround"))
  uis.ResDownLoadProgressBar = ui:GetChild("ResDownLoadProgressBar")
  uis.SizeTxt = ui:GetChild("SizeTxt")
  uis.SpeedTxt = ui:GetChild("SpeedTxt")
  uis.PercentageTxt = ui:GetChild("PercentageTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.VersionTxt = ui:GetChild("VersionTxt")
  uis.CopyrightTxt = ui:GetChild("CopyrightTxt")
  uis.root = ui
  return uis
end
