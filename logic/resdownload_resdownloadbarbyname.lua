require("ResDownload_ResDownloadFillByName")
require("ResDownload_LightByName")

function GetResDownload_ResDownloadBarUis(ui)
  local uis = {}
  uis.bar = GetResDownload_ResDownloadFillUis(ui:GetChild("bar"))
  uis.n6 = GetResDownload_LightUis(ui:GetChild("n6"))
  uis.root = ui
  return uis
end
