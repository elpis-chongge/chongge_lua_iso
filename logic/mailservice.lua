MailService = {}

function MailService.Init()
  Net.AddListener(Proto.MsgName.GetAllMailsRsp, MailService.GetAllMailsRsp)
  Net.AddListener(Proto.MsgName.DeleteMailRsp, MailService.DeleteMailRsp)
  Net.AddListener(Proto.MsgName.MarkMailReadRsp, MailService.MarkMailReadRsp)
  Net.AddListener(Proto.MsgName.FetchMailAttachmentRsp, MailService.FetchMailAttachmentRsp)
end

function MailService.GetAllMailsReq(mailSeq, rspCallback)
  local msg = {}
  msg.mailSeq = mailSeq
  Net.Send(Proto.MsgName.GetAllMailsReq, msg, rspCallback)
end

function MailService.GetAllMailsRsp(msg)
  MailData.mails = msg.mails
  MailData.FormatMail()
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.MAIL)
end

function MailService.DeleteMailReq(mailUid)
  local msg = {}
  msg.mailUid = mailUid
  Net.Send(Proto.MsgName.DeleteMailReq, msg)
end

function MailService.DeleteMailRsp(msg)
  if MailData.deleteTempId then
    MailData.DeleteMail(MailData.deleteTempId)
  end
  UIMgr:SendWindowMessage(WinResConfig.MailWindow.name, WindowMsgEnum.Mail.DELETE, nil)
end

function MailService.MarkMailReadReq(mailUid)
  local msg = {}
  msg.mailUid = mailUid
  Net.Send(Proto.MsgName.MarkMailReadReq, msg)
end

function MailService.MarkMailReadRsp(msg)
end

function MailService.FetchMailAttachmentReq(mailUid)
  local msg = {}
  msg.mailUid = mailUid
  Net.Send(Proto.MsgName.FetchMailAttachmentReq, msg)
end

function MailService.FetchMailAttachmentRsp(msg)
  GetItemTips.Show(msg.items, true)
  if msg.fetchedUidLst then
    for i, v in pairs(msg.fetchedUidLst) do
      local info = MailData.GetMailInfoByUid(v)
      info.fetched = true
      if info.attachment ~= "" then
        info.read = true
      end
    end
    UIMgr:SendWindowMessage(WinResConfig.MailWindow.name, WindowMsgEnum.Mail.REFRESH_LIST, msg.fetchedUidLst)
  end
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.MAIL)
end

MailService.Init()
