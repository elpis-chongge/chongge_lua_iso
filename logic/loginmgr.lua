LoginMgr = {
  maxResId = nil,
  bilibili_uid = nil,
  bilibili_username = nil
}
local HEART_BEAT_INTERVAL = 25
local GET_ACTOR_INFO_INTERVAL = 300
local UPDATE_BATTERY_INTERVAL = 300
local SOCKET_CHECK_INTERVAL = 3
local sendTime = 0
local socketCheckTime = 0
local updateActorTime = 0
local updateBatteryTime = 0
local MsgWaiterObj = require("MsgWaiter")

function LoginMgr.InitLoginStatus()
  ActorMgr.necessaryInfoSuccess = false
end

function LoginMgr.ConnectSDKAuth(account, password, autoCreate)
  MsgWaiterObj.ShowWaitingWindow()
  if LoginMgr.canTouch == false then
    return
  end
  LoginData.ClearData()
  local url = LoginData.GetSelectAuthInfo() .. "/auth"
  local formData = {}
  formData.accountId = account or LoginData.GetAccount()
  formData.password = password or LoginData.GetPassword()
  formData.imei = Application.deviceUniqueIdentifier
  formData.osVersion = SystemInfo.operatingSystem
  formData.platform = LoginData.GetPlatform()
  if autoCreate then
    formData.autoCreate = autoCreate
  end
  print("连接认证请求：", url, PrintTable(formData))
  LoginMgr.canTouch = false
  CS.HttpManager.Singleton:PostWebRequestJson(url, Json.encode(formData), function()
    LoginMgr.canTouch = true
    FloatTipsUtil.ShowWarnTips(T(10636))
    MsgWaiterObj.HideWaitingWindow()
  end, function(str)
    MsgWaiterObj.HideWaitingWindow()
    if string.find(string.lower(str), "<html") ~= nil or nil ~= string.find(string.lower(str), "html>") then
      FloatTipsUtil.ShowWarnTips(T(10637))
      LoginMgr.canTouch = true
      return
    end
    local result_table = Json.decode(str)
    if result_table.retCode == ProtoEnum.RET_CODE.RC_OK then
      LoginData.SetAccount(account, password)
      LoginData.SaveLoginData(result_table.data)
      LoginMgr.ConnectLoginServer()
    else
      local errorConfig = TableData.GetConfig(tonumber(result_table.retCode), "BaseErrorCode")
      FloatTipsUtil.ShowWarnTips(errorConfig and errorConfig.text() or T(10638, result_table.retCode))
      LoginMgr.canTouch = true
    end
  end)
end

function LoginMgr.DealSDKCallback(jsonStr)
  local result_table = Json.decode(jsonStr)
  local action = result_table.action
  local data = result_table.data
  print("PnSDK lua收到sdk返回，action", action, "内容", data)
  if "PnSDKPassportNotification" == action then
    data = Json.decode(data)
    local uid = data.uid
    local access_token = data.access_token
    local age = data.age
    local idmd5 = data.idmd5
    local aaStatus = data.aaStatus
    local guest = data.guest
    print("PnSDK lua收到登录内容", "uid", uid, "access_token", access_token, "age", age, "idmd5", idmd5, "aaStatus", aaStatus, "guest", guest)
    LoginData.SaveLoginData({openId = uid, token = access_token})
  elseif "PnSDKPaymentNotification" == action then
    ld("Shop")
    data = Json.decode(data)
    local productId = data.productid
    if string.isEmptyOrNil(productId) == true then
      ShopService.CancelPayOrderReq(data.nonce)
    else
    end
  elseif "PnSDKRequestPaymentNotification" == action then
    ld("Shop")
    data = Json.decode(data)
    local productId = data.productid
    SDKManager:PaySDK(productId, LoginData.GetSDKServerId(), ActorData.GetUin(), ActorData.GetLevel(), "")
  end
end

function LoginMgr.Register(account, password)
  if LoginMgr.canTouch == false then
    return
  end
  LoginData.ClearData()
  local url = LoginData.GetSelectAuthInfo() .. "/create_account"
  local formData = {}
  formData.accountId = account
  formData.password = password
  formData.osVersion = SystemInfo.operatingSystem
  formData.imei = Application.deviceUniqueIdentifier
  formData.platform = LoginData.GetPlatform()
  print("注册账号：", url, formData)
  LoginMgr.canTouch = false
  CS.HttpManager.Singleton:PostWebRequestJson(url, Json.encode(formData), function()
    LoginMgr.canTouch = true
    FloatTipsUtil.ShowWarnTips(T(10639))
  end, function(str)
    if string.find(string.lower(str), "<html") ~= nil or nil ~= string.find(string.lower(str), "html>") then
      FloatTipsUtil.ShowWarnTips(T(10640))
      LoginMgr.canTouch = true
      return
    end
    local result_table = Json.decode(str)
    if result_table.retCode == ProtoEnum.RET_CODE.RC_OK then
      LoginData.SetAccount(account, password)
      LoginData.SaveLoginData(result_table.data)
      LoginMgr.ConnectLoginServer()
    else
      local errorConfig = TableData.GetConfig(tonumber(result_table.retCode), "BaseErrorCode")
      FloatTipsUtil.ShowWarnTips(errorConfig and errorConfig.text() or T(10638, result_table.retCode))
      LoginMgr.canTouch = true
    end
  end)
end

function LoginMgr.ConnectLoginServer()
  MsgWaiterObj.ShowWaitingWindow()
  local url = LoginData.GetSelectAuthInfo() .. "/login"
  local formData = {}
  formData.openId = LoginData.openId
  formData.token = LoginData.token
  formData.platform = LoginData.GetPlatform()
  formData.channel = LuaUtil.GetChannel()
  formData.buildVersion = ""
  formData.authRemote = SDKManager.UseSDK
  LoginMgr.canTouch = false
  CS.HttpManager.Singleton:PostWebRequestJson(url, Json.encode(formData), function()
    LoginMgr.canTouch = true
    FloatTipsUtil.ShowWarnTips(T(10641))
    MsgWaiterObj.HideWaitingWindow()
  end, function(str)
    MsgWaiterObj.HideWaitingWindow()
    if string.find(string.lower(str), "<html") ~= nil or nil ~= string.find(string.lower(str), "html>") then
      FloatTipsUtil.ShowWarnTips(T(10642))
      LoginMgr.canTouch = true
      return
    end
    local result_table = Json.decode(str)
    if result_table.retCode == ProtoEnum.RET_CODE.RC_OK then
      local data = result_table.data
      if 1 == data.maintainState then
        UIMgr:SendWindowMessage(WinResConfig.LoginWindow.name, WindowMsgEnum.LoginWindow.UPDATE_UI_SERVER_CLOSE, data.maintainNotice)
        LoginMgr.canTouch = true
      else
        LoginData.SaveLoginAddress(data.addresses)
        LoginData.SaveTimezoneOffset(data.timezoneOffset)
        LoginMgr.ConnectSocket()
      end
    else
      local errorConfig = TableData.GetConfig(tonumber(result_table.retCode), "BaseErrorCode")
      FloatTipsUtil.ShowWarnTips(errorConfig and errorConfig.text() or T(10638, result_table.retCode))
      LoginMgr.canTouch = true
    end
  end)
end

function LoginMgr.ConnectSocket()
  local ip, port = LoginData.GetConnectIpAndPort()
  if ip and port then
    Net.Connect(ip, port)
  end
end

function LoginMgr.InitHeartBeatCheck()
  sendTime = Time.realtimeSinceStartup
  updateActorTime = Time.realtimeSinceStartup
  updateBatteryTime = Time.realtimeSinceStartup
  UpdateManager.RemoveUpdateHandler(LoginMgr.HeartBeatCheckLoop)
  UpdateManager.AddUpdateHandler(LoginMgr.HeartBeatCheckLoop)
  if SDKManager.UseSDK == true then
    local sdk = SDKManager:GetSDKChannel()
    if "Bilibili" == sdk then
      SDKManager:StartHeart()
    end
  end
end

function LoginMgr.CorrectTimeScale()
  if math.abs(LoginData.gameTimescale - Time.timeScale) > 0.1 and Application.platform ~= RuntimePlatform.WindowsEditor and Application.platform ~= RuntimePlatform.OSXEditor then
    local str = "速度异常  当前速度：" .. Time.timeScale .. "，正确速度：" .. LoginData.gameTimescale
    printError(str)
    ActorService.ClientAbnormalReportReq(str)
    LeanTween.delayedCall(0.2, function()
      LoginMgr.StopGame(true)
      if SDKManager.UseSDK == true then
        local sdk = SDKManager:GetSDKChannel()
        if "PnSDK_CN" == sdk then
          MessageBox.Show(T(11609), {
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
          MessageBox.Show(T(11610), {
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
        MessageBox.Show(T(11610), {
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
    end)
    return true
  end
  return false
end

function LoginMgr.HeartBeatCheckLoop()
  local stop = LoginMgr.CorrectTimeScale()
  if true == stop then
    UpdateManager.RemoveUpdateHandler(LoginMgr.HeartBeatCheckLoop)
    return
  end
  local curTime = Time.realtimeSinceStartup
  if curTime - sendTime >= HEART_BEAT_INTERVAL then
    sendTime = curTime
    LoginService.HeartBeatReq()
  end
  if curTime - socketCheckTime >= SOCKET_CHECK_INTERVAL then
    socketCheckTime = curTime
    if Net.reconnectEnable and Net.IsConnect() == false then
      MsgWaiterObj.Reconnect()
    end
  end
  if Net.resendEnable then
    MsgWaiterObj.TryResendMsg()
  end
  if Net.IsConnect() and curTime - updateActorTime >= GET_ACTOR_INFO_INTERVAL then
    updateActorTime = curTime
    ActorService.GetActorInfoReq()
  end
  if curTime - updateBatteryTime >= UPDATE_BATTERY_INTERVAL then
    updateBatteryTime = curTime
    UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_UPDATE_BATTERY)
  end
  if LoginData.serverTime > 0 then
    LoginData.serverTime = LoginData.serverTime + (Time.realtimeSinceStartup - LoginData.serverTimeStart)
    LoginData.serverTimeStart = Time.realtimeSinceStartup
  end
  if GuideMgr.ListenCompleteFunc then
    if true == GuideMgr.ListenCompleteFunc() then
      GuideMgr.ListenCompleteFunc = nil
      UIMgr:SendWindowMessage(WinResConfig.GuideWindow.name, WindowMsgEnum.GuideWindow.PUT_BACK)
      GuideMgr.Next()
    else
      local step = GuideMgr.GetStepData()
      if step and step.window_name and false == UIMgr:IsWindowOpen(step.window_name) then
        GuideMgr.HideWindow()
      end
    end
  end
  FunctionQueueUtil.Update()
end

function LoginMgr.ReturnToLogin(dontAutoLogin)
  LoginMgr.StopGame()
  UIMgr:CloseAllWindow()
  OpenWindow(WinResConfig.LoginWindow.name, nil, true, dontAutoLogin)
  UIMgr:ReloadPackages({
    "ItemIcon",
    "SkillIcon",
    "SkillStarIcon",
    "UIBackGround",
    "CardHeadSquare",
    "CardHeadBanner",
    "CardHeadRect",
    "PlayerHeadFrame"
  })
end

function LoginMgr.StopGame(keepActor)
  if true ~= keepActor then
    ActorData.ClearData()
  end
  ActorMgr.ShowUin()
  GuideMgr.ClearData()
  ShopData.ClearData()
  ActivityDungeonData.ClearData()
  MailData.ClearData()
  EnterClampUtil.Clear()
  AdventureData.ClearData()
  ld("Chat")
  ChatData.InitChatData()
  if UIMgr:IsWindowOpen(WinResConfig.BattleUIWindow.name) then
    BattleMgr.CloseBattle(true, true)
  end
  if AbyssExploreMgr and AbyssExploreMgr.Exists() then
    AbyssExploreMgr.Release()
  end
  ld("RedDot")
  RedDotData.Clear()
  MsgWaiterObj.Destroy()
  UpdateManager.RemoveUpdateHandler(LoginMgr.HeartBeatCheckLoop)
  if true == SDKManager.UseSDK then
    local sdk = SDKManager:GetSDKChannel()
    if "Bilibili" == sdk then
      SDKManager:StopHeart()
    end
  end
  Net.Close()
end

function LoginMgr.GetLandNotice()
  local url = LoginData.GetClientServiceUrl() .. "/login_notice?channel=" .. LuaUtil.GetChannel()
  print("登录界面请求公告地址：", url)
  CS.HttpManager.Singleton:GetWebRequest(url, function()
  end, function(str)
    local result_table = Json.decode(str)
    if result_table.code == ProtoEnum.RET_CODE.RC_OK and result_table.data.uid ~= nil then
      UIMgr:SendWindowMessage(WinResConfig.LoginWindow.name, WindowMsgEnum.LoginWindow.UPDATE_NOTICE, result_table.data)
    end
  end)
end

function LoginMgr.Logout(keepAccount, dontAutoLogin)
  LoginData.ClearData()
  if SDKManager.UseSDK then
    SDKManager:SignOutSDK()
  else
    LoginData.ClearLastAccount(keepAccount)
  end
  if UIMgr:IsWindowOpen(WinResConfig.LoginWindow.name) == true then
    UIMgr:SendWindowMessage(WinResConfig.LoginWindow.name, WindowMsgEnum.LoginWindow.UPDATE_UI_LOGOUT)
  else
    LoginMgr.ReturnToLogin(dontAutoLogin)
  end
end

function LoginMgr.ChangeAccount(keepAccount)
  if SDKManager.UseSDK then
    SDKManager:SignChangeSDK()
  else
    LoginData.ClearLastAccount(keepAccount)
  end
  if UIMgr:IsWindowOpen(WinResConfig.LoginWindow.name) == true then
    UIMgr:SendWindowMessage(WinResConfig.LoginWindow.name, WindowMsgEnum.LoginWindow.UPDATE_UI_DEFAULT)
  else
    LoginMgr.ReturnToLogin()
  end
end

function LoginMgr.OpenBugReport()
  local clientVersion = Assets.GetFullVersion()
  local actorId = ActorData.GetUin()
  if SDKManager.UseSDK == true then
    local sdk = SDKManager:GetSDKChannel()
    if "PnSDK_CN" == sdk then
      if actorId then
        SDKManager:OpenBugReportOnlineSDK(LoginData.GetSDKServerId(), ActorData.GetName(), clientVersion, actorId, ActorData.GetLevel())
      else
        SDKManager:OpenBugReportOfflineSDK(clientVersion)
      end
    else
      MessageBox.Show(T(10254), {
        touchCallback = function()
        end
      })
    end
  else
    MessageBox.Show(T(10254), {
      touchCallback = function()
      end
    })
  end
end

function LoginMgr.OpenUserCenter()
  local actorId = ActorData.GetUin()
  if actorId then
    SDKManager:OpenUserCenterSDK(LoginData.GetSDKServerId(), ActorData.GetName(), Assets.GetFullVersion(), actorId, ActorData.GetLevel())
  end
end

local SUCCESS_CODE = 1

function LoginMgr.LoginCallback(data)
  local result_table = Json.decode(data)
  if result_table.code == SUCCESS_CODE then
    local detail = Json.decode(result_table.data)
    LoginMgr.bilibili_uid = detail.uid
    LoginMgr.bilibili_username = detail.username
    LoginData.SaveLoginData({
      openId = detail.uid,
      token = detail.access_token
    })
  else
    LoginMgr.canTouch = true
  end
end

function LoginMgr.LogoutCallback(data)
  local result_table = Json.decode(data)
  if result_table.code == SUCCESS_CODE then
  end
end

function LoginMgr.PayCallback(data)
  local result_table = Json.decode(data)
  ld("Shop")
  local detail = Json.decode(result_table.data)
  if result_table.code == SUCCESS_CODE then
  else
    ShopService.CancelPayOrderReq(detail.nonce)
  end
end

function LoginMgr.ExitCallback(data)
  Application.Quit()
end

function LoginMgr.GetDeviceIdCallback(id)
end

function LoginMgr.GetChannelIdCallback(id)
end

function LoginMgr.CloseAccountCallback(data)
  local result_table = Json.decode(data)
  if result_table and result_table.enabled == true then
    LoginMgr.Logout(false, true)
  else
  end
end
