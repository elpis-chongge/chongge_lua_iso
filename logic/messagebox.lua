local MessageBox = {}

function MessageBox.Show(content, sureBtnParam, cancelBtnParam, touchScreenBtnParam, returnBtnParam, layer)
  local tb = {}
  tb.text = content
  tb.sureBtnParam = sureBtnParam
  tb.cancelBtnParam = cancelBtnParam
  tb.touchScreenBtnParam = touchScreenBtnParam
  tb.returnBtnParam = returnBtnParam
  OpenWindow(WinResConfig.CurrencyWindow.name, layer, tb)
end

return MessageBox
