require("Chat_ComplaintWindowByName")
local ComplaintWindow = {}
local uis, contentPane, actorInfo, msg
local selectReason = {}

function ComplaintWindow.ReInitData()
end

function ComplaintWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ComplaintWindow.package, WinResConfig.ComplaintWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    actorInfo = bridgeObj.argTable[1]
    msg = bridgeObj.argTable[2]
    uis = GetChat_ComplaintWindowUis(contentPane)
    ComplaintWindow.UpdateInfo()
    ComplaintWindow.InitBtn()
  end)
end

function ComplaintWindow.UpdateInfo()
  uis.Main.Complaint1.WordTxt.text = T(10096, actorInfo.name)
  uis.Main.Complaint1.Content.WordTxt.text = msg.content
  local list = uis.Main.Complaint1.OptionList
  local btnTable = {
    {
      name = T(10097),
      reason = ProtoEnum.E_REPORT_REASON.ERR_PORN
    },
    {
      name = T(10098),
      reason = ProtoEnum.E_REPORT_REASON.ERR_POLITICS
    },
    {
      name = T(10099),
      reason = ProtoEnum.E_REPORT_REASON.ERR_ADS_FRAUD
    },
    {
      name = T(10100),
      reason = ProtoEnum.E_REPORT_REASON.ERR_ABUSE
    },
    {
      name = T(10101),
      reason = ProtoEnum.E_REPORT_REASON.ERR_OTHER
    }
  }
  for i, v in ipairs(btnTable) do
    local hand = list:AddItemFromPool()
    UIUtil.SetBtnText(hand, v.name, v.subName)
    hand.onClick:Set(function()
      if hand.selected then
        hand.selected = false
        for i, reason in ipairs(selectReason) do
          if reason == v.reason then
            table.remove(selectReason, i)
            return
          end
        end
      else
        if #selectReason >= 2 then
          FloatTipsUtil.ShowWarnTips(T(10102))
          return
        end
        table.insert(selectReason, v.reason)
        hand.selected = true
      end
    end)
  end
end

function ComplaintWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Add(ComplaintWindow.ClickCloseBtn)
  UIUtil.SetPopupBtnGroup(uis.Main.Popup_B.BtnGroup.root, {
    touchCallback = ComplaintWindow.ClickSureBtn
  }, {
    touchCallback = ComplaintWindow.ClickCloseBtn
  })
end

function ComplaintWindow.ClickSureBtn()
  if #selectReason <= 0 then
    FloatTipsUtil.ShowWarnTips(T(10103))
    return
  end
  ChatService.ReportUserReq(actorInfo, msg, selectReason)
end

function ComplaintWindow.ClickCloseBtn()
  UIMgr:CloseWindow(WinResConfig.ComplaintWindow.name)
end

function ComplaintWindow.OnShown()
end

function ComplaintWindow.OnHide()
end

function ComplaintWindow.OnClose()
  selectReason = {}
  msg = nil
  actorInfo = nil
  uis = nil
  contentPane = nil
end

function ComplaintWindow.HandleMessage(msgId, para)
end

return ComplaintWindow
