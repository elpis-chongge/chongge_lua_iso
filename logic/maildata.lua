MailData = {}
MailData.mails = {}
MailData.deleteTempId = nil
local FormatParams = function(wordId, params)
  local id = tonumber(wordId)
  if id and params then
    if #params > 0 then
      local bol, str = pcall(T, id, table.unpack(params))
      if bol and str then
        return str
      end
      return ""
    else
      local str = T(id)
      if str then
        if string.find(str, "%%s") or string.find(str, "%%d") then
          return ""
        else
          return str
        end
      end
    end
  end
end

function MailData.FormatMail()
  for i, v in pairs(MailData.mails) do
    if v.cliParse then
      v.senderName = FormatParams(v.senderName, v.senderParams)
      v.title = FormatParams(v.title, v.titleParams)
      v.content = FormatParams(v.content, v.contentParams)
    end
  end
end

function MailData.GetMailInfoByUid(uid)
  for i, v in pairs(MailData.mails) do
    if v.mailUid == uid then
      return v
    end
  end
end

function MailData.DeleteMail(uid)
  for i, v in pairs(MailData.mails) do
    if v.mailUid == uid then
      table.remove(MailData.mails, i)
      return
    end
  end
end

function MailData.ClearData()
  MailData.mails = {}
  MailData.deleteTempId = nil
end
