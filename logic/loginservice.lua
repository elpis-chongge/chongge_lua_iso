LoginService = {}

function LoginService.Init()
  Net.AddListener(Proto.MsgName.EnterGameRsp, LoginService.DealEnterGameRsp)
  Net.AddListener(Proto.MsgName.HeartBeatRsp, LoginService.DealHeartBeatRsp)
  Net.AddListener(Proto.MsgName.KickOffNotify, LoginService.DealKickOffNotify)
end

function LoginService.EnterGameReq()
  local msg = {}
  msg.platform = LoginData.GetPlatform()
  msg.deviceId = LuaUtil.GetDeviceId()
  msg.channel = LuaUtil.GetChannel()
  msg.token = LoginData.token
  msg.authRemote = SDKManager.UseSDK
  msg.openId = tostring(LoginData.openId)
  msg.graphicsDeviceID = SystemInfo.graphicsDeviceID
  msg.graphicsDeviceVendorID = SystemInfo.graphicsDeviceVendorID
  Net.Send(Proto.MsgName.EnterGameReq, msg)
end

function LoginService.DealEnterGameRsp(msg)
  Net.resendEnable = true
  if Net.isReconnectOk == false and false == ActorMgr.necessaryInfoSuccess then
    ActorData.ClearData()
    ld("RedDot")
    RedDotData.Init()
  end
  LoginData.SetSeverTime(msg.sysStamp)
  LoginData.SetSeverVersion(msg.svrVersion)
  if false == msg.actorExist then
    UIUtil.ChangeLoginScreenEffectIn(function()
      require("LoadSensitiveWord")
      UIMgr:CloseWindow(WinResConfig.LoginWindow.name, true, true, false)
      ld("PlotPlay", function()
        PlotPlayMgr.PlayPrologue(function()
          ActorService.CreateActorReq(ActorMgr.EnterHome)
        end)
      end)
      UIUtil.ChangeLoginScreenEffectOut()
    end, true)
  elseif true == msg.actorExist then
    if Net.isReconnectOk then
      require("LoadSensitiveWord")
      UIMgr:CloseWindow(WinResConfig.LoginWindow.name, true, true, false)
      ActorData.SaveActorData(msg.actor)
      SettingUtil.ParseSetting(msg.settings)
      ActorMgr.EnterHome()
    else
      UIUtil.ChangeLoginScreenEffectIn(function()
        require("LoadSensitiveWord")
        UIMgr:CloseWindow(WinResConfig.LoginWindow.name, true, true, false)
        ActorData.SaveActorData(msg.actor)
        SettingUtil.ParseSetting(msg.settings)
        ActorMgr.EnterHome()
        if SDKManager.UseSDK == true then
          local sdk = SDKManager:GetSDKChannel()
          if "Bilibili" == sdk then
            SDKManager:NotifyZone(tostring(ActorData.GetUin()), ActorData.GetName())
          end
        end
      end)
    end
  end
  Net.isReconnectOk = false
end

function LoginService.HeartBeatReq()
  local msg = {}
  Net.Send(Proto.MsgName.HeartBeatReq, msg)
end

function LoginService.DealHeartBeatRsp(msg)
  if msg then
    LoginData.SetSeverTime(msg.sysStamp)
    LoginData.SetResVersion(msg.resVersion)
    LoginData.SetLoginDays(msg.loginDays)
    LoginData.SetRefreshDaySec(msg.nextRreshDaySec)
  end
  EnterClampUtil.CheckUnlockInfoFromServer()
end

function LoginService.DealKickOffNotify(msg)
  if msg.reason == ProtoEnum.E_KICKOFF_REASON.E_KR_SYSTEM then
    LoginMgr.StopGame(true)
    if SDKManager.UseSDK == true then
      local sdk = SDKManager:GetSDKChannel()
      if "PnSDK_CN" == sdk then
        MessageBox.Show(T(11602), {
          titleText = T(11608),
          touchCallback = function()
            LoginMgr.OpenBugReport()
            LoginMgr.ReturnToLogin()
          end
        }, {
          titleText = T(11603),
          touchCallback = function()
            LoginMgr.ReturnToLogin()
          end
        }, {
          touchCallback = function()
            LoginMgr.ReturnToLogin()
          end
        })
      else
        MessageBox.Show(T(11611), {
          titleText = T(11603),
          touchCallback = function()
            LoginMgr.ReturnToLogin()
          end
        }, nil, {
          touchCallback = function()
            LoginMgr.ReturnToLogin()
          end
        })
      end
    else
      MessageBox.Show(T(11611), {
        titleText = T(11603),
        touchCallback = function()
          LoginMgr.ReturnToLogin()
        end
      }, nil, {
        touchCallback = function()
          LoginMgr.ReturnToLogin()
        end
      })
    end
  else
    LoginMgr.StopGame()
    local content
    if msg.reason == ProtoEnum.E_KICKOFF_REASON.E_KR_OTHER_DEVICE then
      content = T(11601)
    elseif msg.reason == ProtoEnum.E_KICKOFF_REASON.E_KR_CLOSE_SERVER then
      content = T(11600)
    end
    MessageBox.Show(content, {
      titleText = T(11603),
      touchCallback = function()
        LoginMgr.ReturnToLogin()
      end
    }, nil, {
      touchCallback = function()
        LoginMgr.ReturnToLogin()
      end
    })
  end
end

LoginService.Init()
