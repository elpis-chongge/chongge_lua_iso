require("InitialSign_InitialSignAutoByName")

function GetInitialSign_InitialSignAutoWindowUis(ui)
  local uis = {}
  uis.Main = GetInitialSign_InitialSignAutoUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
