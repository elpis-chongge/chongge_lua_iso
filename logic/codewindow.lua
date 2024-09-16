require("Message_CodeWindowByName")
local CodeWindow = {}
local uis, contentPane

function CodeWindow.ReInitData()
end

function CodeWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.CodeWindow.package, WinResConfig.CodeWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_CodeWindowUis(contentPane)
    CodeWindow.UpdateInfo()
    CodeWindow.InitBtn()
  end)
end

function CodeWindow.UpdateInfo()
end

function CodeWindow.InitBtn()
  local inputText = uis.Main.Code1.NameInTxt
  inputText.text = ""
  inputText.maxBytesLength = 40
  inputText.promptText = T(11500)
  inputText.onChanged:Add(CodeWindow.FormatText)
  UIUtil.SetPopupBtnGroup(uis.Main.Popup_B.BtnGroup.root, {
    touchCallback = function()
      local text = inputText.text
      if string.isEmptyOrNil(text) or string.trim(text) == "" then
        FloatTipsUtil.ShowWarnTips(T(11501))
        return
      end
      ActorService.UseExchangeCodeReq(text)
    end
  }, {
    touchCallback = CodeWindow.TouchClose
  })
  uis.Main.TouchScreenBtn.onClick:Add(CodeWindow.TouchClose)
end

function CodeWindow.FormatText()
  local inputText = uis.Main.Code1.NameInTxt
  inputText.text = string.upper(inputText.text)
end

function CodeWindow.TouchClose()
  UIMgr:CloseWindow(WinResConfig.CodeWindow.name)
end

function CodeWindow.OnClose()
  uis = nil
  contentPane = nil
end

return CodeWindow
