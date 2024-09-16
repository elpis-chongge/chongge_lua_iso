require("Abyss_BossTipsLockByName")

function GetAbyss_BossTipsTitleUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Lock = GetAbyss_BossTipsLockUis(ui:GetChild("Lock"))
  uis.BoBtn = ui:GetChild("BoBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
