require("Notice_NoticeWindowByName")
local NoticeWindow = {}
local uis, contentPane, allNoticeUid, lastItem, noticeData

function NoticeWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.NoticeWindow.package, WinResConfig.NoticeWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetNotice_NoticeWindowUis(contentPane)
    NoticeWindow.InitBtn()
    allNoticeUid = {}
    NoticeWindow.LoadTopTabRegion()
  end)
end

function NoticeWindow.GetData()
  local tb = {}
  for i = 1, 2 do
    tb[i] = {}
  end
  for i, v in pairs(NoticeData.notice) do
    allNoticeUid[v.uid] = true
    table.insert(tb[v.shelfArea], v)
  end
  for i = #tb, 1, -1 do
    if #tb[i] < 1 then
      table.remove(tb, i)
    end
  end
  return tb
end

function NoticeWindow.CheckNoticeTime()
  local time = LoginData.GetCurServerTime()
  for i, v in pairs(NoticeData.notice) do
    if -1 ~= v.endStamp and time > v.endStamp then
      return true
    end
  end
end

function NoticeWindow.LoadTopTabRegion()
  local word = {
    {
      txt = T(910),
      subTitle = T(911)
    },
    {
      txt = T(912),
      subTitle = T(913)
    }
  }
  noticeData = NoticeWindow.GetData()
  local list = uis.Main.NoticeUI.TopTabRegion.TopTabList
  list.selectedIndex = -1
  
  function list.itemRenderer(i, item)
    UIUtil.SetBtnText(item, word[i + 1].txt, word[i + 1].subTitle)
    item.soundFmod = SOUND_EVENT_ENUM.TAB_TAG2
    item.onClick:Set(function()
      if list.selectedIndex ~= i then
        list.selectedIndex = i
        NoticeWindow.InitTab(noticeData[i + 1])
      end
    end)
    if 0 == i then
      item.onClick:Call()
    end
    local data = noticeData[i + 1]
    RedDotMgr.AddNode({
      windowName = WinResConfig.NoticeWindow.name,
      com = item,
      visibleFunc = function()
        return RedDot_Notice.UnreadByType(data)
      end,
      dataType = RED_DOT_DATA_TYPE.NOTICE
    })
  end
  
  list.numItems = #noticeData
end

function NoticeWindow.ClearListChild(list)
  for i = 1, list.numItems do
    list:RemoveChildAt(0, true)
  end
end

function NoticeWindow.InitTab(data)
  lastItem = nil
  local list = uis.Main.NoticeUI.LeftTabRegion.LeftTabList
  list.selectedIndex = -1
  
  function list.itemRenderer(i, obj)
    local index = i + 1
    local item = obj:GetChild("LeftTabBtn")
    item:GetChild("NameTxt").text = data[index].title
    item:GetChild("SubtitleTxt").text = data[index].subTitle
    item:GetChild("Red").visible = NoticeData.NewIsShow(data[index].uid)
    ChangeUIController(item, "button", 0)
    item.soundFmod = SOUND_EVENT_ENUM.TAB_TAG1
    item.onClick:Set(function()
      if list.selectedIndex ~= i then
        list.selectedIndex = i
        if lastItem then
          ChangeUIController(lastItem, "button", 0)
        end
        if NoticeData.NewIsShow(data[index].uid) then
          NoticeData.SaveRedDot(data[index].uid, allNoticeUid)
          RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.NOTICE)
        end
        ChangeUIController(item, "button", 1)
        item:GetChild("Red").visible = false
        xpcall(NoticeWindow.LoadContent, function(errorMsg)
          printError(errorMsg)
        end, data[index])
        lastItem = item
      end
    end)
    if 0 == i then
      item.onClick:Call()
    end
    item.alpha = 0
    PlayUITrans(obj, "up", nil, index * 0.1)
  end
  
  list.numItems = #data
end

function NoticeWindow.ClickLink(eventContext)
  Application.OpenURL(eventContext.data)
end

function NoticeWindow.StringSub(content)
  if string.isEmptyOrNil(content) then
    return ""
  end
  local newStr = string.gsub(content, "&divide;", "÷")
  newStr = string.gsub(newStr, "&ge;", "≥")
  newStr = string.gsub(newStr, "&le;", "≤")
  newStr = string.gsub(newStr, "&ldquo;", "“")
  newStr = string.gsub(newStr, "&rdquo;", "”")
  newStr = string.gsub(newStr, "&times;", "x")
  newStr = string.gsub(newStr, "&hellip;", "…")
  newStr = string.gsub(newStr, "&middot;", "·")
  newStr = string.gsub(newStr, "&mdash;", "—")
  newStr = string.gsub(newStr, "&lsquo;", "‘")
  newStr = string.gsub(newStr, "&rsquo;", "’")
  return newStr
end

function NoticeWindow.LoadContent(OpNotice)
  local content
  if 1 == OpNotice.modelType then
    NoticeWindow.ClearListChild(uis.Main.NoticeUI.ContentList)
    content = UIMgr:CreateObject("Notice", "ContentWord")
    content:GetChild("WordTxt").text = NoticeWindow.StringSub(StringUtil.dec(OpNotice.content))
    content:GetChild("WordTxt").onClickLink:Add(NoticeWindow.ClickLink)
    uis.Main.NoticeUI.ContentList:AddChild(content)
    uis.Main.NoticeUI.ContentList.scrollPane:ScrollTop()
    uis.Main.NoticeUI.c1Ctr.selectedIndex = 0
  elseif 2 == OpNotice.modelType then
    NoticeWindow.ClearListChild(uis.Main.NoticeUI.PicContentList)
    content = UIMgr:CreateObject("Notice", "ContentPic")
    content:GetChild("PicBigLoader").url = OpNotice.picUrl
    uis.Main.NoticeUI.PicContentList:AddChild(content)
    uis.Main.NoticeUI.ContentList.scrollPane:ScrollTop()
    uis.Main.NoticeUI.c1Ctr.selectedIndex = 1
  end
  if OpNotice.jumpTarget and content then
    content.onClick:Set(function()
    end)
  end
end

function NoticeWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.NoticeWindow.name)
  FunctionQueueUtil.SetFunEnd("Notice")
end

function NoticeWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(NoticeWindow.CloseWindow)
  uis.Main.NoticeUI.CloseBtn.onClick:Set(NoticeWindow.CloseWindow)
end

function NoticeWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_SERVER_TIME_CHANGE then
    if NoticeWindow.CheckNoticeTime() then
      NoticeService.GetAllNoticesReq(false)
    end
  elseif msgId == WindowMsgEnum.NoticeWindow.REFRESH_NOTICE then
    NoticeWindow.LoadTopTabRegion()
  end
end

function NoticeWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.NoticeWindow.name)
  uis = nil
  contentPane = nil
  allNoticeUid = nil
  lastItem = nil
  noticeData = nil
end

return NoticeWindow
