NoticeData = {
  notice = {}
}
local readUid = {}

function NoticeData.Init()
  local str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.NOTICE_NEW)
  if "0" ~= str then
    readUid = Json.decode(str)
  end
end

function NoticeData.SaveRedDot(uid, allNoticeUid)
  if allNoticeUid then
    for i = #readUid, 1, -1 do
      if not allNoticeUid[readUid[i]] then
        table.remove(readUid, i)
      end
    end
  end
  table.insert(readUid, uid)
  local str = Json.encode(readUid)
  PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.NOTICE_NEW, str)
end

function NoticeData.NewIsShow(uid)
  return not table.contain(readUid, uid)
end

NoticeData.Init()
