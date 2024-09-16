require("Notice_NoticeByName")

function GetNotice_NoticeWindowUis(ui)
  local uis = {}
  uis.Main = GetNotice_NoticeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
