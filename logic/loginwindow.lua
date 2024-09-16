require("Land_LandByName")
require("Land_LandTestByName")
local testLogin = true
local LoginWindow = {}
local uis, contentPane, landTestUis
VideoManager = CS.VideoManager.Singleton
SDKManager = CS.SDKManager.Instance

function LoginWindow.ReInitData()
end

local dontAutoLogin = false

function LoginWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.LoginWindow.package, WinResConfig.LoginWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetLand_LandUis(contentPane)
    LoginWindow.UpdateInfo()
    LoginWindow.InitBtn()
    LoginMgr.canTouch = false
    LoginWindow.UpdateDefault()
    local playVideo = bridgeObj.argTable[1]
    if playVideo then
      LightManager:SetCameraBloom(UICamera, true, 5, 255, 255, 255, 0, 0, "UI")
      VideoManager:PlayVideo("Assets/Art/Video/login_loop.mp4", BottomLayerEnum.MIDDLE, true, "Assets/Art/Effects/Prefab/UI_prefab/Loading/FX_ui_loading_eff.prefab")
    end
    dontAutoLogin = bridgeObj.argTable[2] or false
    SoundUtil.PlayMusic(1010)
  end)
end

function LoginWindow.OnShowAnimationEnd()
  LoginMgr.GetLandNotice()
  if SDKManager.UseSDK == true then
    local sdk = SDKManager:GetSDKChannel()
    if "Bilibili" == sdk then
      SDKManager:SetLoginCallback(LoginMgr.LoginCallback)
      SDKManager:SetLogoutCallback(LoginMgr.LogoutCallback)
      SDKManager:SetPayCallback(LoginMgr.PayCallback)
      SDKManager:SetExitCallback(LoginMgr.ExitCallback)
      SDKManager:SetGetDeviceIdCallback(LoginMgr.GetDeviceIdCallback)
      SDKManager:SetGetChannelIdCallback(LoginMgr.GetChannelIdCallback)
      SDKManager:SetCloseAccountCallback(LoginMgr.CloseAccountCallback)
    elseif "PnSDK_CN" == sdk then
      SDKManager.SDKLuaCallback = LoginMgr.DealSDKCallback
    end
    LoginData.ClearData()
    if false == dontAutoLogin then
      SDKManager:SignInSDK()
    end
  end
  LoginMgr.canTouch = true
end

function LoginWindow.UpdateInfo()
  LoginWindow.UpdateVersion()
  LoginWindow.UpdateID()
  LoginWindow.UpdateBackground()
end

function LoginWindow.UpdateVersion()
  uis.VerTxt.text = T(9, Assets.GetFullVersion())
end

function LoginWindow.UpdateID()
  uis.IDTxt.text = ""
end

function LoginWindow.UpdateBackground()
end

function LoginWindow.InitBtn()
  uis.SetBtn.onClick:Add(LoginWindow.UpdateSetting)
  uis.AgeBtn.onClick:Add(LoginWindow.OpenAge)
  uis.Popup.CloseBtn.onClick:Set(LoginWindow.UpdateDefault)
  uis.Popup.Agreement.CloseBtn.onClick:Set(LoginWindow.UpdateDefault)
  uis.Popup.popup.CloseBtn.onClick:Set(LoginWindow.UpdateDefault)
  uis.Popup.Repair.CloseBtn.onClick:Set(LoginWindow.UpdateDefault)
  uis.Popup.AgeTips.CloseBtn.onClick:Set(LoginWindow.UpdateDefault)
  uis.Popup.AgeTips.SurBtn.onClick:Set(LoginWindow.UpdateDefault)
  uis.TabRegionScreen.CloseBtn.onClick:Add(LoginWindow.UpdateDefault)
end

function LoginWindow.UpdateDefault(autoSignIn)
  VideoManager:ResumeCurVideo()
  LoginWindow.ShowAccountPanel()
  uis.c1Ctr.selectedIndex = 0
  uis.Account.c1Ctr.selectedIndex = 0
  uis.State.WordTxt.text = T(10600)
  uis.FilingsWord.WordTxt.text = T(10646)
  local lastAccount = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.TEMP_ACCOUNT, "")
  local lastPassword = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.TEMP_PASSWORD, "")
  if SDKManager.UseSDK == true then
    if "" == string.trim(uis.State.WordTxt.text) then
      uis.State.WordTxt.text = "点击登录"
    end
    uis.TouchStartBtn.onClick:Set(function()
      local MsgWaiterObj = require("MsgWaiter")
      MsgWaiterObj.ShowWaitingWindow()
      CheckUpdateInGameManager.Singleton:StartCheck(function(forceUpdateApp)
        MsgWaiterObj.HideWaitingWindow()
        LuaUtil.RestartGame()
      end, function()
        MsgWaiterObj.HideWaitingWindow()
        LoginMgr.InitLoginStatus()
        if LoginData.openId and LoginData.token then
          LoginMgr.ConnectLoginServer()
        else
          LoginData.ClearData()
          SDKManager:SignInSDK()
        end
      end)
    end)
    if true == autoSignIn then
      SDKManager:SignInSDK()
    end
  elseif "" ~= lastAccount and "" ~= lastPassword then
    uis.State.AccountDisplay.AccountTxt.text = lastAccount
    uis.State.c2Ctr.selectedIndex = 1
    uis.TouchStartBtn.onClick:Set(function()
      LoginWindow.ClickEnterGame()
    end)
  else
    uis.State.c2Ctr.selectedIndex = 0
    uis.TouchStartBtn.onClick:Set(function()
      LoginWindow.UpdateLogin()
    end)
  end
end

function LoginWindow.OpenAge()
  UIMgr:ShowBlur(uis.root, "PopupBgLand")
  uis.c1Ctr.selectedIndex = 3
  uis.Popup.c1Ctr.selectedIndex = 4
  uis.Popup.AgeTips.TitleTxt.text = T(10654)
  local list = uis.Popup.AgeTips.WordList
  if 0 == list.numChildren then
    local hand = list:AddItemFromPool()
    hand:GetChild("WordTxt").text = T(10655)
  end
  UIUtil.SetBtnText(uis.Popup.AgeTips.SurBtn, T(302))
end

function LoginWindow.UpdateSetting()
  uis.c1Ctr.selectedIndex = 2
  local settingBtnList
  if SDKManager.UseSDK == true then
    local sdk = SDKManager:GetSDKChannel()
    if "Bilibili" == sdk then
      settingBtnList = {
        {
          c1Index = 2,
          title = T(10603),
          subTitle = T(10604),
          func = LoginMgr.GetLandNotice
        },
        {
          c1Index = 0,
          title = T(10631),
          subTitle = T(10632),
          func = LoginWindow.ChangeAccount
        },
        {
          c1Index = 1,
          title = T(10633),
          subTitle = T(10634),
          func = LoginMgr.OpenBugReport
        },
        {
          c1Index = 4,
          title = T(10605),
          subTitle = T(10606),
          func = LoginWindow.OpenHaoplayAgreement
        },
        {
          c1Index = 5,
          title = T(10607),
          subTitle = T(10608),
          func = LoginWindow.OpenHaoplayPolicy
        },
        {
          c1Index = 3,
          title = T(10609),
          subTitle = T(10610),
          func = LoginWindow.UpdateRepair
        }
      }
    elseif "PnSDK_CN" == sdk then
      settingBtnList = {
        {
          c1Index = 2,
          title = T(10603),
          subTitle = T(10604),
          func = LoginMgr.GetLandNotice
        },
        {
          c1Index = 0,
          title = T(10631),
          subTitle = T(10632),
          func = LoginWindow.ChangeAccount
        },
        {
          c1Index = 1,
          title = T(10633),
          subTitle = T(10634),
          func = LoginMgr.OpenBugReport
        },
        {
          c1Index = 4,
          title = T(10605),
          subTitle = T(10606),
          func = LoginWindow.OpenHaoplayAgreement
        },
        {
          c1Index = 5,
          title = T(10607),
          subTitle = T(10608),
          func = LoginWindow.OpenHaoplayPolicy
        },
        {
          c1Index = 3,
          title = T(10609),
          subTitle = T(10610),
          func = LoginWindow.UpdateRepair
        }
      }
    end
  else
    settingBtnList = {
      {
        c1Index = 2,
        title = T(10603),
        subTitle = T(10604),
        func = LoginMgr.GetLandNotice
      },
      {
        c1Index = 0,
        title = T(10631),
        subTitle = T(10632),
        func = LoginWindow.ChangeAccount
      },
      {
        c1Index = 1,
        title = T(10633),
        subTitle = T(10634),
        func = LoginMgr.OpenBugReport
      },
      {
        c1Index = 3,
        title = T(10609),
        subTitle = T(10610),
        func = LoginWindow.UpdateRepair
      }
    }
  end
  local list = uis.TabRegionScreen.TabRegion.TabList
  list:RemoveChildrenToPool()
  for _, v in ipairs(settingBtnList) do
    local btn = list:AddItemFromPool()
    UIUtil.SetBtnText(btn, v.title, v.subTitle)
    btn.onClick:Set(v.func)
    if v.c1Index then
      ChangeUIController(btn, "c1", v.c1Index)
    end
  end
end

function LoginWindow.UpdateRegister()
  uis.c1Ctr.selectedIndex = 1
  uis.Account.c1Ctr.selectedIndex = 1
  local accountRegister = uis.Account.AccountRegister
  local accountInputTextField = accountRegister.Account.NameTxt.inputTextField
  accountInputTextField.promptText = T(10613)
  InputTextUtil.SetAccountTextSetting(accountInputTextField)
  local passwordInputTextField = accountRegister.Password1.NameTxt.inputTextField
  passwordInputTextField.promptText = T(10614)
  InputTextUtil.SetPasswordTextSetting(passwordInputTextField)
  UIUtil.SetBtnText(accountRegister.AccountBtn, T(10616), T(10617))
  UIUtil.SetBtnText(uis.Account.SwitchBtn, T(10618))
  uis.Account.SwitchBtn.onClick:Set(LoginWindow.UpdateRegister)
  local password2InputTextField = accountRegister.Password2.NameTxt.inputTextField
  password2InputTextField.promptText = T(10614)
  InputTextUtil.SetPasswordTextSetting(password2InputTextField)
  UIUtil.SetBtnText(accountRegister.AccountBtn, T(10619), T(10620))
  UIUtil.SetBtnText(uis.Account.SwitchBtn, T(10621))
  uis.Account.SwitchBtn.onClick:Set(function()
    LoginWindow.UpdateLogin()
  end)
  local checkBtn = accountRegister.AgreeCheckBtn
  local controller = checkBtn:GetController("c1")
  checkBtn.onClick:Set(function()
    if 0 == controller.selectedIndex then
      controller.selectedIndex = 1
    else
      controller.selectedIndex = 0
    end
  end)
  controller.selectedIndex = 1
  UIUtil.SetBtnText(checkBtn, T(10625))
  accountRegister.AccountBtn.onClick:Set(function()
    if accountInputTextField.text == "" then
      FloatTipsUtil.ShowWarnTips(T(10622))
      return
    end
    if 0 == controller.selectedIndex then
      FloatTipsUtil.ShowWarnTips(10624)
      return
    end
    if InputTextUtil.IsPasswordLegal(passwordInputTextField.text, password2InputTextField.text) == false then
      return
    end
    LoginMgr.Register(accountInputTextField.text, passwordInputTextField.text)
  end)
end

function LoginWindow.UpdateLogin(account)
  uis.c1Ctr.selectedIndex = 1
  uis.Account.c1Ctr.selectedIndex = 0
  local accountInput = uis.Account.AccountInput
  local accountInputTextField = accountInput.Account.NameTxt.inputTextField
  accountInputTextField.promptText = T(10613)
  InputTextUtil.SetAccountTextSetting(accountInputTextField)
  if account then
    accountInputTextField.text = account
  end
  local passwordInputTextField = accountInput.Password1.NameTxt.inputTextField
  passwordInputTextField.promptText = T(10614)
  InputTextUtil.SetPasswordTextSetting(passwordInputTextField)
  UIUtil.SetBtnText(accountInput.AccountBtn, T(10616), T(10617))
  UIUtil.SetBtnText(uis.Account.SwitchBtn, T(10618))
  uis.Account.SwitchBtn.onClick:Set(LoginWindow.UpdateRegister)
  accountInput.AccountBtn.onClick:Set(function()
    if accountInputTextField.text == "" then
      FloatTipsUtil.ShowWarnTips(T(10622))
      return
    end
    if passwordInputTextField.text == "" then
      FloatTipsUtil.ShowWarnTips(T(10626))
      return
    end
    LoginWindow.ClickEnterGame(accountInputTextField.text, passwordInputTextField.text)
  end)
end

function LoginWindow.UpdateServerClose(notice)
  if landTestUis then
    landTestUis.root.visible = false
  end
  uis.c1Ctr.selectedIndex = 3
  uis.Popup.c1Ctr.selectedIndex = 5
  local maintenance = uis.Popup.Maintenance
  local strList = Split(notice, "|")
  local contentStr, titleStr
  if 1 == #strList then
    titleStr = T(11605)
    contentStr = strList[1]
  elseif 2 == #strList then
    titleStr = strList[1]
    contentStr = strList[2]
  end
  maintenance.TitleTxt.text = titleStr
  local list = maintenance.WordList
  list:RemoveChildrenToPool()
  local word = list:AddItemFromPool()
  word:GetChild("WordTxt").text = contentStr
  maintenance.CloseBtn.onClick:Set(function()
    if landTestUis then
      landTestUis.root.visible = true
    end
    LoginWindow.UpdateDefault()
  end)
  local sureBtn = maintenance.SurBtn
  UIUtil.SetBtnText(sureBtn, T(11604))
  sureBtn.onClick:Set(function()
    LoginMgr.GetLandNotice()
  end)
end

function LoginWindow.UpdateBan()
  if landTestUis then
    landTestUis.root.visible = false
  end
  uis.c1Ctr.selectedIndex = 3
  uis.Popup.c1Ctr.selectedIndex = 5
  local maintenance = uis.Popup.Maintenance
  maintenance.TitleTxt.text = T(11606)
  local list = maintenance.WordList
  list:RemoveChildrenToPool()
  local word = list:AddItemFromPool()
  word:GetChild("WordTxt").text = T(11607)
  maintenance.CloseBtn.onClick:Set(function()
    if landTestUis then
      landTestUis.root.visible = true
    end
    LoginWindow.UpdateDefault()
  end)
  local sureBtn = maintenance.SurBtn
  UIUtil.SetBtnText(sureBtn, T(11608))
  sureBtn.onClick:Set(function()
    LoginMgr.OpenBugReport()
  end)
end

function LoginWindow.UpdatePolicy()
  UIMgr:ShowBlur(uis.root, "PopupBgLand")
  uis.c1Ctr.selectedIndex = 3
  uis.Popup.c1Ctr.selectedIndex = 0
end

function LoginWindow.UpdateAgreement()
  UIMgr:ShowBlur(uis.root, "PopupBgLand")
  uis.c1Ctr.selectedIndex = 3
  uis.Popup.c1Ctr.selectedIndex = 1
end

function LoginWindow.OpenBilibiliPolicy()
  SDKManager:ShowAgreementWithPrivacy()
end

function LoginWindow.OpenBilibiliAgreement()
  SDKManager:ShowAgreementWithLicence()
end

function LoginWindow.OpenHaoplayPolicy()
  Application.OpenURL("https://www.haoplay.com.cn/services/#terms")
end

function LoginWindow.OpenHaoplayAgreement()
  Application.OpenURL("https://www.haoplay.com.cn/services/user-agreement.html")
end

function LoginWindow.UpdateNotice(noticeData)
  LoginWindow.HideAccountPanel()
  UIMgr:ShowBlur(uis.root, "PopupBgLand")
  uis.c1Ctr.selectedIndex = 3
  uis.Popup.c1Ctr.selectedIndex = 2
  uis.Popup.popup.TitleTxt.text = noticeData.title
  local list = uis.Popup.popup.WordList
  list:RemoveChildrenToPool()
  local content
  if 1 == noticeData.modelType then
    content = UIMgr:CreateObject("Land", "NoticeWord")
    content:GetChild("WordTxt").text = StringUtil.dec(noticeData.content)
    content:GetChild("WordTxt").onClickLink:Add(LoginWindow.ClickLink)
    list:AddChild(content)
    list.scrollPane.touchEffect = true
  elseif 2 == noticeData.modelType then
    content = UIMgr:CreateObject("Land", "NoticePic")
    content:GetChild("PicBigLoader").url = noticeData.picUrl
    list:AddChild(content)
    list.touchEffect = false
  end
end

function LoginWindow.ClickLink(eventContext)
  Application.OpenURL(eventContext.data)
end

function LoginWindow.UpdateRepair()
  UIMgr:ShowBlur(uis.root, "PopupBgLand")
  uis.c1Ctr.selectedIndex = 3
  uis.Popup.c1Ctr.selectedIndex = 3
  uis.Popup.Repair.TitleTxt.text = T(10609)
  uis.Popup.Repair.WordTxt.text = T(10612)
  UIUtil.SetBtnText(uis.Popup.Repair.SurBtn, T(302), T(303))
  uis.Popup.Repair.SurBtn.onClick:Set(function()
    Assets.ClearDownload()
    GameController.ExitGame()
  end)
end

function LoginWindow.ChangeAccount()
  UIMgr:ShowBlur(uis.root, "PopupBgLand")
  uis.c1Ctr.selectedIndex = 3
  uis.Popup.c1Ctr.selectedIndex = 3
  uis.Popup.Repair.TitleTxt.text = T(10631)
  uis.Popup.Repair.WordTxt.text = T(10611)
  UIUtil.SetBtnText(uis.Popup.Repair.SurBtn, T(302), T(303))
  uis.Popup.Repair.SurBtn.onClick:Set(function()
    LoginMgr.Logout()
  end)
end

function LoginWindow.UpdateLogout()
  UIMgr:ShowBlur(uis.root, "PopupBgLand")
  uis.c1Ctr.selectedIndex = 3
  uis.Popup.c1Ctr.selectedIndex = 3
  uis.Popup.Repair.TitleTxt.text = T(10601)
  uis.Popup.Repair.WordTxt.text = T(10611)
  UIUtil.SetBtnText(uis.Popup.Repair.SurBtn, T(302), T(303))
  uis.Popup.Repair.SurBtn.onClick:Set(function()
    LoginMgr.Logout()
  end)
end

function LoginWindow.ShowAccountPanel()
  if Application.platform == RuntimePlatform.Android or Application.platform == RuntimePlatform.IPhonePlayer then
    return
  end
  if false == testLogin then
    return
  end
  if landTestUis then
    landTestUis.root.visible = true
    return
  end
  local landTest = UIMgr:CreateObject("Land", "LandTest")
  if landTest then
    contentPane:AddChild(landTest)
    landTest.width = contentPane.width
    landTest.size = contentPane.size
    landTestUis = GetLand_LandTestUis(landTest)
    landTestUis.Title1Txt.text = "账号输入"
    landTestUis.Title2Txt.text = "服务器选择"
    landTestUis.WordTxt.text = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.TEMP_ACCOUNT, "")
    LoginWindow.CreateServerList()
  end
end

function LoginWindow.HideAccountPanel()
  if landTestUis then
    landTestUis.root.visible = false
  end
end

function LoginWindow.CreateServerList()
  local serverList = ServerList:GetServerList()
  local list = landTestUis.OtherList
  list:RemoveChildrenToPool()
  for i, v in pairs(serverList) do
    local serverHand = list:AddItemFromPool()
    serverHand:GetChild("NameTxt").text = v.name
    serverHand.onClick:Set(function()
      LoginWindow.ClickEnterGame(v.address, v.name)
    end)
  end
end

function LoginWindow.ClickEnterGame(address, name, password)
  local MsgWaiterObj = require("MsgWaiter")
  MsgWaiterObj.ShowWaitingWindow()
  CheckUpdateInGameManager.Singleton:StartCheck(function(forceUpdateApp)
    MsgWaiterObj.HideWaitingWindow()
    LuaUtil.RestartGame()
  end, function()
    MsgWaiterObj.HideWaitingWindow()
    LoginMgr.InitLoginStatus()
    if landTestUis then
      LoginData.SetSelectAuthInfo(address, name)
      local account = landTestUis.WordTxt.text
      if string.gsub(account, " ", "") == "" then
        FloatTipsUtil.ShowWarnTips(T(10635))
        return
      end
      local pass = landTestUis.PasswordTxt.text
      if "" ~= pass then
        password = pass
      end
      LoginMgr.ConnectSDKAuth(account, password or "123456", true)
      return
    end
    LoginMgr.ConnectSDKAuth(address, name, password)
  end)
end

function LoginWindow.OnShown()
end

function LoginWindow.OnHide()
end

function LoginWindow.OnPreClose()
  LightManager:SetCameraBloom(UICamera, false)
end

function LoginWindow.OnClose()
  uis = nil
  contentPane = nil
  landTestUis = nil
  dontAutoLogin = false
  SoundUtil.PlaySfxByPath("event:/sfx/sfx_amb/login/stop_sfx_amb_login_wind", "bank:/sfx/sfx_login")
  VideoManager:StopVideoOnBottomLoader(BottomLayerEnum.MIDDLE)
end

function LoginWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.LoginWindow.UPDATE_NOTICE then
    LoginWindow.UpdateNotice(para)
  elseif msgId == WindowMsgEnum.LoginWindow.UPDATE_UI_DEFAULT then
    LoginWindow.UpdateDefault()
  elseif msgId == WindowMsgEnum.LoginWindow.UPDATE_UI_LOGIN then
    LoginWindow.UpdateLogin(para)
  elseif msgId == WindowMsgEnum.LoginWindow.UPDATE_UI_LOGOUT then
    LoginWindow.UpdateDefault(true)
  elseif msgId == WindowMsgEnum.LoginWindow.UPDATE_UI_SERVER_CLOSE then
    LoginWindow.UpdateServerClose(para)
  elseif msgId == WindowMsgEnum.LoginWindow.UPDATE_UI_BAN then
    LoginWindow.UpdateBan()
  end
end

return LoginWindow
