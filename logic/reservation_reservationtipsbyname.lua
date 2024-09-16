require("Reservation_LockByName")

function GetReservation_ReservationTipsUis(ui)
  local uis = {}
  uis.Lock = GetReservation_LockUis(ui:GetChild("Lock"))
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.RewardGetBtn = ui:GetChild("RewardGetBtn")
  uis.CardLookBtn = ui:GetChild("CardLookBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
