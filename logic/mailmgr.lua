MailMgr = {}

function MailMgr.OpenMailWindow(isJump)
  if #MailData.mails > 0 then
    ld("Mail", function()
      if isJump then
        JumpToWindow(WinResConfig.MailWindow.nam)
      else
        OpenWindow(WinResConfig.MailWindow.name)
      end
    end)
  else
    FloatTipsUtil.ShowWarnTips(T(340))
  end
end

function MailMgr.UpdateByHomeWindow()
  if not RedDot_Mail.CanGetItem() then
    MailService.GetAllMailsReq(0)
  end
end
