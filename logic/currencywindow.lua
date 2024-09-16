require("Message_CurrencyWindowByName")
local CurrencyWindow = {}
local uis, contentPane, msg

function CurrencyWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.CurrencyWindow.package, WinResConfig.CurrencyWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_CurrencyWindowUis(contentPane)
    if bridgeObj.argTable[1] then
      msg = bridgeObj.argTable[1]
    end
    CurrencyWindow.InitBtn()
    CurrencyWindow.UpdateTextDisplay()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_SHOW)
  end)
end

function CurrencyWindow.UpdateTextDisplay()
  UIUtil.SetBtnText(uis.Main.Currency1.SureBtn, T(302), T(303))
  if msg and msg.text then
    uis.Main.Currency1.WordTxt.htmlObjAutolayout = true
    uis.Main.Currency1.WordTxt.text = msg.text
  end
end

function CurrencyWindow.InitBtn()
  if msg then
    local sureBtnParam = msg.sureBtnParam
    if sureBtnParam then
      local callback = sureBtnParam.touchCallback
      
      function sureBtnParam.touchCallback()
        CurrencyWindow.CloseWindow()
        if callback then
          callback()
        end
      end
    end
    local cancelBtnParam = msg.cancelBtnParam
    if cancelBtnParam then
      local callback = cancelBtnParam.touchCallback
      
      function cancelBtnParam.touchCallback()
        CurrencyWindow.CloseWindow()
        if callback then
          callback()
        end
      end
    end
    UIUtil.SetPopupBtnGroup(uis.Main.Popup_B.BtnGroup.root, sureBtnParam, cancelBtnParam)
  end
  if msg.touchScreenBtnParam == nil then
    uis.Main.TouchScreenBtn.onClick:Add(CurrencyWindow.CloseWindow)
  elseif msg.touchScreenBtnParam.touchable == false then
    uis.Main.TouchScreenBtn.touchable = false
  else
    uis.Main.TouchScreenBtn.touchable = true
    uis.Main.TouchScreenBtn.onClick:Set(function()
      local callback = msg.touchScreenBtnParam.touchCallback
      CurrencyWindow.CloseWindow()
      if callback then
        callback()
      end
    end)
  end
  if nil == msg.returnBtnParam then
    uis.Main.Currency1.c1Ctr.selectedIndex = 0
  else
    uis.Main.Currency1.c1Ctr.selectedIndex = 1
    uis.Main.Currency1.ReturnBtn.onClick:Set(function()
      local callback = msg.returnBtnParam.touchCallback
      CurrencyWindow.CloseWindow()
      if callback then
        callback()
      end
    end)
  end
end

function CurrencyWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.CurrencyWindow.name)
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_CLOSE)
end

function CurrencyWindow.OnClose()
  uis = nil
  contentPane = nil
  msg = nil
end

function CurrencyWindow.HandleMessage(msgId, para)
end

return CurrencyWindow
