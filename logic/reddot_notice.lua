RedDot_Notice = {}

function RedDot_Notice.ShowHome()
  return RedDot_Notice.Unread()
end

function RedDot_Notice.UnreadByType(notice)
  if notice then
    for i, v in pairs(notice) do
      if NoticeData.NewIsShow(v.uid) then
        return true
      end
    end
  end
  return false
end

function RedDot_Notice.Unread()
  if NoticeData and NoticeData.notice then
    for i, v in pairs(NoticeData.notice) do
      if NoticeData.NewIsShow(v.uid) then
        return true
      end
    end
  end
  return false
end
