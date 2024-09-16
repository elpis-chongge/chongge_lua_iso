require("Mail_MailByName")

function GetMail_MailWindowUis(ui)
  local uis = {}
  uis.Main = GetMail_MailUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
