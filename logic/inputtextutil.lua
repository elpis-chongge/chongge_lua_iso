local InputTextUtil = {}

function InputTextUtil.SetPasswordTextSetting(inputTextField)
  inputTextField.keyboardType = TouchScreenKeyboardType.NumberPad
  inputTextField.restrict = REGEX_TYPE_ENUM["A_Z&0_9"]
end

function InputTextUtil.IsPasswordLegal(password1, password2, showFloatTips)
  if nil == showFloatTips then
    showFloatTips = true
  end
  if "" == password1 or "" == password2 then
    if showFloatTips then
      FloatTipsUtil.ShowWarnTips(T(10626))
    end
    return false
  end
  if password2 and password1 ~= password2 then
    if showFloatTips then
      FloatTipsUtil.ShowWarnTips(T(10623))
    end
    return false
  end
  return true
end

function InputTextUtil.SetAccountTextSetting(inputTextField)
  inputTextField.keyboardType = TouchScreenKeyboardType.ASCIICapable
  inputTextField.restrict = REGEX_TYPE_ENUM["A_Z&0_9"]
end

return InputTextUtil
