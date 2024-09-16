require("Chat_ChoiceLineWindowByName")
local ChoiceLineWindow = {}
local uis, contentPane

function ChoiceLineWindow.ReInitData()
end

local perPageCount = 20
local allLineList
local formatString = ""

function ChoiceLineWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ChoiceLineWindow.package, WinResConfig.ChoiceLineWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetChat_ChoiceLineWindowUis(contentPane)
    ChoiceLineWindow.UpdateInfo()
    ChoiceLineWindow.InitBtn()
  end)
end

function ChoiceLineWindow.UpdateInfo()
  allLineList = ChatData.GetAllWorldLineList()
  if #allLineList <= 0 then
    return
  end
  ChoiceLineWindow.UpdateTab()
end

function ChoiceLineWindow.UpdateTab()
  local pages = math.ceil(#allLineList / perPageCount)
  local list = uis.Main.ChoiceLine1.LineTab.LineList
  for i = 1, pages do
    local tab = list:AddItemFromPool()
    UIUtil.SetBtnText(tab, T(10077, ChatMgr.GetLineName(1 + (i - 1) * perPageCount), ChatMgr.GetLineName(i * perPageCount)), T(10078))
    tab.onClick:Set(function()
      if tab.selected == false then
        list.selectedIndex = i - 1
        ChoiceLineWindow.UpdateLineList(i)
      end
    end)
  end
  list.selectedIndex = 0
  ChoiceLineWindow.UpdateLineList(1)
end

function ChoiceLineWindow.UpdateLineList(pageIndex)
  local list = uis.Main.ChoiceLine1.LineList
  list:RemoveChildrenToPool()
  for i = 1, perPageCount do
    local lineId = (pageIndex - 1) * perPageCount + i
    local lineInfo = ChatData.GetWorldLineInfo(lineId)
    if lineInfo then
      local lineHand = list:AddItemFromPool()
      UIUtil.SetBtnText(lineHand, ChatMgr.GetLineName(lineId))
      ChatMgr.UpdateLineProgress(lineInfo, lineHand)
      lineHand.onClick:Set(function()
        if lineInfo.sessionId ~= ChatData.GetSessionId() then
          ChatService.SwitchWorldGroupReq(lineInfo.sessionId)
          ChoiceLineWindow.ClickCloseBtn()
        end
      end)
    end
  end
end

function ChoiceLineWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Add(ChoiceLineWindow.ClickCloseBtn)
  UIUtil.SetPopupBtnGroup(uis.Main.Popup_B.BtnGroup.root, {
    touchCallback = ChoiceLineWindow.ClickCloseBtn
  })
end

function ChoiceLineWindow.ClickCloseBtn()
  UIMgr:CloseWindow(WinResConfig.ChoiceLineWindow.name)
end

function ChoiceLineWindow.OnShown()
end

function ChoiceLineWindow.OnHide()
end

function ChoiceLineWindow.OnClose()
  allLineList = nil
  uis = nil
  contentPane = nil
end

function ChoiceLineWindow.HandleMessage(msgId, para)
end

return ChoiceLineWindow
