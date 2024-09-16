require("Message_RenameWindowByName")
local RenameWindow = {}
local uis, contentPane, params
local costEnough = true

function RenameWindow.ReInitData()
end

function RenameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RenameWindow.package, WinResConfig.RenameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    params = bridgeObj.argTable[1]
    uis = GetMessage_RenameWindowUis(contentPane)
    RenameWindow.UpdateInfo()
    RenameWindow.UpdateCost()
    RenameWindow.InitBtn()
  end)
end

function RenameWindow.UpdateInfo()
  uis.Main.Rename1.NameTxt.text = params.actorRemark
  local btn = uis.Main.Rename1.SureBtn
  UIUtil.SetBtnText(btn, T(302), T(303))
  uis.Main.Rename1.NameTxt.promptText = params.promptText
  if params.maxLength then
    uis.Main.Rename1.NameTxt.maxLength = params.maxLength
  end
end

function RenameWindow.UpdateCost()
  if params.free then
    ChangeController(uis.Main.Rename1.c1Ctr, 1)
    uis.Main.Rename1.WordTxt.text = T(1265)
  else
    ChangeController(uis.Main.Rename1.c1Ctr, 0)
    if params.cost then
      uis.Main.Rename1.Spend.root.visible = true
      local config = TableData.GetConfigByType(params.cost.type, params.cost.id)
      uis.Main.Rename1.Spend.IconLoader.url = UIUtil.GetResUrl(config.icon)
      local have = ActorData.GetItemCount(params.cost.id)
      local need = params.cost.value
      if have < need then
        costEnough = false
        uis.Main.Rename1.Spend.SpendTxt.text = T(73, need)
      else
        costEnough = true
        uis.Main.Rename1.Spend.SpendTxt.text = need
      end
      UIUtil.InitAssetsTips(uis.Main.Rename1.AssetsTipsList, {
        params.cost.id
      })
    else
      uis.Main.Rename1.Spend.root.visible = false
    end
  end
end

function RenameWindow.ClickClose()
  UIMgr:CloseWindow(WinResConfig.RenameWindow.name)
end

function RenameWindow.ClickSureBtn()
  local text = uis.Main.Rename1.NameTxt.text
  if SensitiveWordsUtil.IsContainBlockedWord(text) == true then
    FloatTipsUtil.ShowWarnTips(T(11160))
    return
  end
  local sureFunc = params.sureFunc
  if sureFunc then
    local flag = sureFunc(text, costEnough)
    if flag then
      RenameWindow.ClickClose()
    end
  end
end

function RenameWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(RenameWindow.ClickClose)
  UIUtil.SetPopupBtnGroup(uis.Main.Popup_B.BtnGroup.root, {
    touchCallback = RenameWindow.ClickSureBtn
  }, {
    touchCallback = RenameWindow.ClickClose
  })
end

function RenameWindow.OnShown()
end

function RenameWindow.OnHide()
end

function RenameWindow.OnClose()
  params = nil
  uis = nil
  contentPane = nil
  costEnough = true
end

function RenameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    RenameWindow.UpdateCost()
  elseif msgId == WindowMsgEnum.RenameWindow.CLOSE_WINDOW then
    RenameWindow.ClickClose()
  end
end

return RenameWindow
