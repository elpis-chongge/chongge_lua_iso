require("Biography_BiographyByName")

function GetBiography_BiographyWindowUis(ui)
  local uis = {}
  uis.Main = GetBiography_BiographyUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
