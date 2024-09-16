require("ActorInfo_AccountTipsWindowByName")
local AccountTipsWindow = {}
local uis, contentPane, oprType

function AccountTipsWindow.ReInitData()
end

function AccountTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.AccountTipsWindow.package, WinResConfig.AccountTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    oprType = bridgeObj.argTable[1]
    uis = GetActorInfo_AccountTipsWindowUis(contentPane)
    AccountTipsWindow.UpdateInfo()
    AccountTipsWindow.InitBtn()
  end)
end

function AccountTipsWindow.UpdateInfo()
  uis.AccountTips.c1Ctr.selectedIndex = oprType
  if oprType == SETTING_ACCOUNT_TYPE.PASSWORD then
    AccountTipsWindow.ResetPassword()
  elseif oprType == SETTING_ACCOUNT_TYPE.RETURN_LOGIN then
    AccountTipsWindow.ReturnToLogin()
  elseif oprType == SETTING_ACCOUNT_TYPE.PROTOCOL then
    AccountTipsWindow.ReviewProtocol()
  end
end

function AccountTipsWindow.ResetPassword()
  local com = uis.AccountTips.PasswordModification
  com.NameTxt.text = T(10249, LoginData.GetAccount())
  local list = com.PasswordList
  list:RemoveChildrenToPool()
  local prePassword = list:AddItemFromPool():GetChild("NameTxt")
  prePassword.promptText = T(10250)
  local newPassword = list:AddItemFromPool():GetChild("NameTxt")
  newPassword.promptText = T(10251)
  InputTextUtil.SetPasswordTextSetting(newPassword)
  local newPasswordConfirm = list:AddItemFromPool():GetChild("NameTxt")
  newPasswordConfirm.promptText = T(10252)
  InputTextUtil.SetPasswordTextSetting(newPasswordConfirm)
  UIUtil.SetBtnText(com.SureBtn, T(10296), T(10297))
  com.SureBtn.onClick:Set(function()
    if InputTextUtil.IsPasswordLegal(prePassword.text) == false then
      return
    end
    if InputTextUtil.IsPasswordLegal(newPassword.text, newPasswordConfirm.text) == false then
      return
    end
    if prePassword.text == newPassword.text then
      FloatTipsUtil.ShowWarnTips(T(10627))
      return
    end
    ActorService.ChangePasswordReq(LoginData.GetAccount(), prePassword.text, newPassword.text, function()
      MessageBox.Show(T(10628), {
        touchCallback = function()
          UIMgr:SetOnShownComplete(WinResConfig.LoginWindow.name, function()
            UIMgr:SendWindowMessage(WinResConfig.LoginWindow.name, WindowMsgEnum.LoginWindow.UPDATE_UI_LOGIN, LoginData.GetAccount())
          end)
          LoginMgr.Logout(true)
        end
      }, nil, {
        touchCallback = function()
          UIMgr:SetOnShownComplete(WinResConfig.LoginWindow.name, function()
            UIMgr:SendWindowMessage(WinResConfig.LoginWindow.name, WindowMsgEnum.LoginWindow.UPDATE_UI_LOGIN, LoginData.GetAccount())
          end)
          LoginMgr.Logout(true)
        end
      })
    end)
  end)
  UIUtil.SetBtnText(com.CloseBtn, T(10298), T(10299))
  com.CloseBtn.onClick:Set(AccountTipsWindow.Close)
end

function AccountTipsWindow.ReturnToLogin()
  local com = uis.AccountTips.ReturnLogin
  com.WordTxt.text = T(10246)
  UIUtil.SetBtnText(com.SureBtn, T(10244), T(10245))
  com.SureBtn.onClick:Set(function()
    LoginMgr.ReturnToLogin()
  end)
  UIUtil.SetBtnText(com.CloseBtn, T(10247), T(10248))
  com.CloseBtn.onClick:Set(AccountTipsWindow.Close)
end

function AccountTipsWindow.ReviewProtocol()
  local com = uis.AccountTips.Conceal
  com.NameTxt.text = T(10243)
  com.WordList:RemoveChildrenToPool()
  local text = com.WordList:AddItemFromPool()
  text:GetChild("WordTxt").text = T(10253)
  UIUtil.SetBtnText(com.SureBtn, T(10244), T(10245))
  com.SureBtn.onClick:Set(AccountTipsWindow.Close)
end

function AccountTipsWindow.InitBtn()
  uis.TouchScreenBtn.onClick:Set(AccountTipsWindow.Close)
end

function AccountTipsWindow.Close()
  UIMgr:CloseWindow(WinResConfig.AccountTipsWindow.name)
end

function AccountTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  oprType = nil
end

return AccountTipsWindow
