RedDot_Mail = {}

function RedDot_Mail.ShowHome()
  return RedDot_Mail.CanGetItem()
end

function RedDot_Mail.CanGetItem()
  if MailData.mails then
    local time = LoginData.GetCurServerTime()
    for i, v in pairs(MailData.mails) do
      if time < v.expireStamp and string.isEmptyOrNil(v.attachment) == false and false == v.fetched then
        return true
      end
    end
  end
  return false
end
