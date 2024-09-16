local supplies
local AddSupplies = function(supply_list)
  if supply_list and _G.next(supply_list) then
    supplies = supplies or {}
    for i, v in ipairs(supply_list) do
      table.insert(supplies, v)
    end
  end
end
local GetSupplies = function()
  return supplies
end
local Clear = function()
  supplies = nil
end
return {
  AddSupplies = AddSupplies,
  GetSupplies = GetSupplies,
  Clear = Clear
}
