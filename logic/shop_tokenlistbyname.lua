function GetShop_TokenListUis(ui)
  local uis = {}
  
  uis.TokenList = ui:GetChild("TokenList")
  uis.root = ui
  return uis
end
