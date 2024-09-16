require("Mail_MailWindowByName")
local MailWindow = {}
local uis, contentPane, curMailData, lastBtn, downTime
local speed = 0.088
local isInitPlayAnim, isAllGetMail, isAllGetShow, selectMailIndex, jumpTb, enterShow

function MailWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.MailWindow.package, WinResConfig.MailWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMail_MailWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.HOME_MAIL)
    isInitPlayAnim = true
    MailWindow.UpdateTextDisplay()
    MailWindow.InitBtn()
    enterShow = true
    uis.Main.ChoiceList.numItems = 0
    uis.Main.ChoiceList.itemRenderer = MailWindow.RefreshItem
    uis.Main.ChoiceList.defaultItem = UIUtil.GetResUrl("Mail:DetailedBtnAin")
    MailWindow.InitList()
    downTime = TimerUtil.new(30, -1, function(timer, tickTime)
      uis.Main.ChoiceList.numItems = #MailData.mails
    end)
    downTime:start()
  end)
end

function MailWindow.UpdateTextDisplay()
  UIUtil.SetBtnText(uis.Main.AllGetBtn, T(334), T(335))
  UIUtil.SetBtnText(uis.Main.GetBtn, T(332), T(333))
  if #MailData.mails < 1 then
    uis.Main.Tips.WordTxt.text = T(331)
  else
    uis.Main.Tips.WordTxt.text = T(330)
  end
  uis.Main.Number.WordTxt.text = T(336)
  uis.Main.GetTips.NameTxt.text = T(944)
  uis.Main.GetTips.SubtitleTxt.text = T(945)
end

function MailWindow.InitList()
  isAllGetShow = false
  MailWindow.SortMail()
  local num = #MailData.mails
  selectMailIndex = {}
  uis.Main.ChoiceList.numItems = num
  if num >= 100 then
    uis.Main.Number.NumberTxt.text = T(348, num)
  else
    uis.Main.Number.NumberTxt.text = T(337, num)
  end
  isInitPlayAnim = nil
  uis.Main.AllGetBtn.visible = isAllGetShow
end

function MailWindow.SortMail()
  local read = {}
  local notRead = {}
  for i, v in pairs(MailData.mails) do
    if -1 ~= v.expireStamp then
      if v.read then
        table.insert(notRead, v)
      else
        table.insert(read, v)
      end
    end
  end
  local sortFun = function(a, b)
    if a.fetched == false and a.attachment ~= "" then
      if b.fetched == false and b.attachment ~= "" then
        return a.sendStamp > b.sendStamp
      else
        return true
      end
    elseif b.fetched == false and b.attachment ~= "" then
      return false
    else
      return a.sendStamp > b.sendStamp
    end
  end
  table.sort(read, sortFun)
  table.sort(notRead, sortFun)
  local newTb = {}
  for i, v in ipairs(read) do
    table.insert(newTb, v)
  end
  for i, v in ipairs(notRead) do
    table.insert(newTb, v)
  end
  MailData.mails = newTb
end

function MailWindow.RefreshItem(index, item)
  local data = MailData.mails[index + 1]
  local btn = item:GetChild("DetailedBtn")
  if btn and data then
    btn:GetChild("TitleTxt").text = data.title
    btn:GetChild("SenderTxt").text = data.senderName
    if data.attachment ~= "" then
      if not data.fetched then
        isAllGetShow = true
        ChangeUIController(btn, "c2", 1)
      else
        ChangeUIController(btn, "c2", 0)
      end
    else
      ChangeUIController(btn, "c2", 0)
    end
    if data.read then
      if curMailData and curMailData.mailUid == data.mailUid then
        ChangeUIController(btn, "c1", 2)
      else
        ChangeUIController(btn, "c1", 1)
      end
    else
      ChangeUIController(btn, "c1", 0)
    end
    selectMailIndex[data.mailUid] = index
    btn.onClick:Set(function()
      MailWindow.MailOnClick(data, btn)
    end)
    local TimeTxt = btn:GetChild("Time"):GetChild("TimeTxt")
    if 0 == data.expireStamp then
      TimeTxt.text = T(347)
    else
      local t = data.expireStamp - LoginData.GetCurServerTime()
      if t > 0 then
        TimeTxt.text = MailWindow.FormatTime(t)
      else
        TimeTxt.text = T(344)
      end
    end
    if isInitPlayAnim and index < 8 then
      btn.alpha = 0
      PlayUITrans(item, "up", nil, index * speed)
    end
    if enterShow then
      btn.selected = true
      btn.onClick:Call()
      enterShow = nil
    end
  end
end

function MailWindow.FormatTime(time)
  time = math.floor(time)
  local hours, minutes, seconds
  hours = math.floor(time / 3600)
  time = time % 3600
  minutes = math.floor(time / 60)
  seconds = time % 60
  if hours > 0 then
    local day = math.floor(hours / 24)
    hours = hours % 24
    if 0 == day then
      return T(346, hours)
    else
      return T(345, day)
    end
  else
    return T(124, math.max(minutes, 1))
  end
end

function MailWindow.InitAttachment(attachment)
  local addAttr = Split(attachment, "|")
  local tb = GetConfigItemList(addAttr, true)
  for i, v in ipairs(tb) do
    local item = UIMgr:CreateObject("CommonResource", "ItemFrame")
    UIUtil.ShowItemFrame(v.id, item, v.value, nil, function()
      UIUtil.CommonItemClickCallback(v.id, v.type)
    end)
    uis.Main.Item.ItemList:AddChild(item)
  end
end

function MailWindow.MailOnClick(data, btn)
  local info = MailData.GetMailInfoByUid(data.mailUid)
  if info and -1 == info.expireStamp then
    FloatTipsUtil.ShowWarnTips(T(341))
    MailWindow.InitList()
    return
  end
  if lastBtn then
    if btn == lastBtn then
      return
    end
    lastBtn.selected = false
    ChangeUIController(lastBtn, "c1", 1)
  end
  if false == data.read then
    MailService.MarkMailReadReq(data.mailUid)
    data.read = true
  end
  ChangeUIController(btn, "c1", 2)
  if data.attachment == "" then
    uis.Main.c1Ctr.selectedIndex = 1
    uis.Main.c2Ctr.selectedIndex = 0
  else
    MailWindow.ClearListChild(uis.Main.Item.ItemList)
    MailWindow.InitAttachment(data.attachment)
    uis.Main.c1Ctr.selectedIndex = 2
    if data.fetched then
      uis.Main.c2Ctr.selectedIndex = 1
      uis.Main.GetBtn.enabled = false
    else
      uis.Main.c2Ctr.selectedIndex = 0
      uis.Main.GetBtn.enabled = true
    end
  end
  uis.Main.Title.TitleTxt.text = data.title
  uis.Main.Title.TimeTxt.text = TimeUtil.FormatDate("%Y/%m/%d", data.sendStamp)
  local str = data.content
  if string.find(str, "{uid}") then
    str = string.gsub(str, "{uid}", ActorData.GetUin())
  end
  if uis.Main.WordList.numItems > 0 then
    local textCom = uis.Main.WordList:GetChildAt(0)
    textCom:GetChild("WordTxt").text = str
    textCom:GetChild("WordTxt").onClickLink:Add(MailWindow.ClickLink)
  else
    local textCom = UIMgr:CreateObject("Mail", "WordTxt")
    textCom:GetChild("WordTxt").text = str
    textCom:GetChild("WordTxt").onClickLink:Add(MailWindow.ClickLink)
    uis.Main.WordList:AddChild(textCom)
  end
  uis.Main.DeleteBtn.visible = data.canDelete
  lastBtn = btn
  curMailData = data
end

function MailWindow.ClickLink(eventContext)
  Application.OpenURL(eventContext.data)
end

function MailWindow.ClearListChild(list)
  if list then
    for i = 1, list.numItems do
      list:RemoveChildAt(0, true)
    end
  end
end

function MailWindow.StopTime()
  if downTime then
    downTime:stop()
  end
end

function MailWindow.DeleteMail()
  if curMailData then
    curMailData = MailData.GetMailInfoByUid(curMailData.mailUid)
    if curMailData.fetched == false and curMailData.attachment ~= "" then
      MessageBox.Show(T(343), {
        touchCallback = function()
          MailData.deleteTempId = curMailData.mailUid
          MailService.DeleteMailReq(curMailData.mailUid)
        end
      }, {})
    else
      MailData.deleteTempId = curMailData.mailUid
      MailService.DeleteMailReq(curMailData.mailUid)
    end
  end
end

function MailWindow.AllGetMail()
  isAllGetMail = true
  MailService.FetchMailAttachmentReq(0)
end

function MailWindow.GetMail()
  isAllGetMail = nil
  if curMailData then
    MailService.FetchMailAttachmentReq(curMailData.mailUid)
  end
end

function MailWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.MailWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_MAIL)
  uis.Main.AllGetBtn.onClick:Set(function()
    MailWindow.AllGetMail()
  end)
  uis.Main.DeleteBtn.onClick:Set(function()
    MailWindow.DeleteMail()
  end)
  uis.Main.GetBtn.onClick:Set(function()
    MailWindow.GetMail()
  end)
end

function MailWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Mail.REFRESH_LIST then
    if para and not isAllGetMail then
      if lastBtn then
        ChangeUIController(lastBtn, "c2", 0)
      end
      uis.Main.GetBtn.enabled = false
    else
      lastBtn = nil
      MailWindow.InitList()
    end
    if para then
      if isAllGetMail or not RedDot_Mail.CanGetItem() then
        uis.Main.AllGetBtn.visible = false
      else
        uis.Main.AllGetBtn.visible = true
      end
    end
    if 2 == uis.Main.c1Ctr.selectedIndex then
      uis.Main.c2Ctr.selectedIndex = 1
    end
  elseif msgId == WindowMsgEnum.Mail.DELETE then
    if selectMailIndex[MailData.deleteTempId] then
      uis.Main.ChoiceList:RemoveChildAt(selectMailIndex[MailData.deleteTempId], true)
    end
    MailWindow.InitList()
    lastBtn = nil
    uis.Main.c1Ctr.selectedIndex = 0
  end
end

function MailWindow.OnClose()
  MailWindow.StopTime()
  uis = nil
  contentPane = nil
  lastBtn = nil
  curMailData = nil
  isAllGetMail = nil
  isAllGetShow = nil
  selectMailIndex = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return MailWindow
