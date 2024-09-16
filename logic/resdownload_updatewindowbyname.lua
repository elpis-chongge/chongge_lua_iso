require("ResDownload_Update2ByName")

function GetResDownload_UpdateWindowUis(ui)
  local uis = {}
  uis.Main = GetResDownload_Update2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
