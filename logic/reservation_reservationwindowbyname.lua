require("Reservation_ReservationByName")

function GetReservation_ReservationWindowUis(ui)
  local uis = {}
  uis.Main = GetReservation_ReservationUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
