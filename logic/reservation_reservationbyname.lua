require("CommonResource_PopupBgByName")
require("Reservation_ReservationTipsByName")

function GetReservation_ReservationUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Tips = GetReservation_ReservationTipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
