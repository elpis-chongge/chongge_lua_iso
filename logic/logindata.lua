LoginData = {}

function LoginData.Init()
  LoginData.selectAuthInfo = {address = "", name = ""}
  LoginData.lastAccount = nil
  LoginData.lastPassword = nil
end

function LoginData.ClearData()
  LoginData.token = nil
  LoginData.openId = nil
  LoginData.addresses = {}
  LoginData.serverTime = 0
  LoginData.serverTimeStart = 0
  LoginData.tempServerTimeTest = 0
  LoginData.tempServerTimeTestStart = 0
  LoginData.nextRefreshDaySec = 0
  LoginData.resVersion = nil
  LoginData.tempNewResVersion = nil
  LoginData.needGetVersionJson = false
  LoginData.delayClearTempNewResVersionCount = nil
  LoginData.serverVersion = nil
  LoginData.loginDays = 0
  LoginData.gameTimescale = 1
end

function LoginData.SetTimeScale(timescale)
  if LoginData.gameTimescale ~= timescale then
    Time.timeScale = timescale
    LoginData.gameTimescale = timescale
  end
end

function LoginData.SaveLoginData(data)
  if data then
    LoginData.openId = data.openId
    LoginData.token = data.token
  end
end

function LoginData.SaveLoginAddress(addresses)
  if addresses then
    for i, v in ipairs(addresses) do
      local address = Split(v, ":")
      table.insert(LoginData.addresses, {
        ip = address[1],
        port = address[2]
      })
    end
  end
end

function LoginData.SaveTimezoneOffset(timezoneOffset)
  LoginData.timezoneOffset = timezoneOffset or 0
end

function LoginData.GetConnectIpAndPort()
  if LoginData.addresses and #LoginData.addresses > 0 then
    local address = LoginData.addresses[1]
    return address.ip, address.port
  end
end

function LoginData.GetAccount()
  if LoginData.lastAccount == nil then
    return PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.TEMP_ACCOUNT)
  end
  return LoginData.lastAccount
end

function LoginData.GetPassword()
  if LoginData.lastPassword == nil then
    return PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.TEMP_PASSWORD)
  end
  return LoginData.lastPassword
end

function LoginData.SetAccount(account, password)
  if account and password then
    LoginData.lastAccount = account
    LoginData.lastPassword = password
    PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.TEMP_ACCOUNT, account)
    PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.TEMP_PASSWORD, password)
  end
end

function LoginData.GetAuthUrl()
  local authUrl = BaseConfig.AuthServerUrl
  return authUrl
end

function LoginData.GetSDKServerId()
  return BaseConfig.ServerId or "1"
end

function LoginData.GetClientServiceUrl()
  local url = BaseConfig.ClientServiceUrl
  if LoginData.selectAuthInfo.address ~= "" then
    local ip = LoginData.GetConnectIpAndPort()
    if ip then
      if LoginData.selectAuthInfo.name == "邓贝" then
        return "http://" .. ip .. ":11002/v1/op"
      end
      return "http://" .. ip .. ":8200/v1/cli"
    end
  end
  return url
end

function LoginData.GetSelectAuthInfo()
  if LoginData.selectAuthInfo.address ~= "" then
    return LoginData.selectAuthInfo.address
  end
  return LoginData.GetAuthUrl()
end

function LoginData.SetSelectAuthInfo(address, name)
  LoginData.selectAuthInfo.address = address
  LoginData.selectAuthInfo.name = name
end

function LoginData.SetSeverVersion(serverVersion)
  if serverVersion then
    LoginData.serverVersion = serverVersion
  end
end

function LoginData.GetServerVersion()
  return LoginData.serverVersion
end

function LoginData.GetPlatform()
  if Application.platform == RuntimePlatform.IPhonePlayer then
    return ProtoEnum.PLATFORM_TYPE.PFT_IOS
  elseif Application.platform == RuntimePlatform.Android then
    return ProtoEnum.PLATFORM_TYPE.PFT_ANDROID
  else
    return ProtoEnum.PLATFORM_TYPE.PFT_ANDROID
  end
end

function LoginData.SetSeverTime(serverTime)
  if serverTime then
    LoginData.serverTime = serverTime
    LoginData.serverTimeStart = Time.realtimeSinceStartup
    UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_SERVER_TIME_CHANGE)
  end
end

function LoginData.SetRefreshDaySec(serverTime)
  if serverTime then
    LoginData.nextRefreshDaySec = serverTime
  end
end

function LoginData.GetRefreshDaySecTime()
  return LoginData.nextRefreshDaySec
end

function LoginData.SetLoginDays(loginDays)
  if loginDays then
    if LoginData.loginDays > 0 and loginDays > LoginData.loginDays then
      UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_CROSS_DAY)
    end
    LoginData.loginDays = loginDays
  end
end

function LoginData.SetResVersion(resVersion)
  if resVersion then
    if LoginData.resVersion and resVersion ~= LoginData.resVersion then
      LoginData.needGetVersionJson = true
      LoginData.tempNewResVersion = resVersion
      if LoginData.delayClearTempNewResVersionCount == nil then
        LoginData.delayClearTempNewResVersionCount = 10
      end
      CheckUpdateInGameManager.Singleton:StartCheck(function(forceUpdateApp)
        LoginMgr.StopGame()
        local content
        if forceUpdateApp then
          content = T(11612)
        else
          content = T(11613)
        end
        MessageBox.Show(content, {
          titleText = T(11614),
          touchCallback = function()
            LuaUtil.RestartGame()
          end
        }, nil, {touchable = false}, nil, UILayer.NetCheck)
      end, function()
        print("更新测试，不更新")
      end)
      if LoginData.delayClearTempNewResVersionCount then
        LoginData.delayClearTempNewResVersionCount = LoginData.delayClearTempNewResVersionCount - 1
      end
      print("更新测试，剩余检测次数：", LoginData.delayClearTempNewResVersionCount)
      if LoginData.delayClearTempNewResVersionCount <= 0 then
        LoginData.needGetVersionJson = false
        LoginData.UpdateResVersion()
        LoginData.delayClearTempNewResVersionCount = nil
        print("更新测试，清理标记")
      end
    else
      LoginData.resVersion = resVersion
    end
  end
end

function LoginData.UpdateResVersion()
  if LoginData.tempNewResVersion then
    LoginData.resVersion = LoginData.tempNewResVersion
    LoginData.tempNewResVersion = nil
  end
end

function LoginData.GetCurServerTime()
  return LoginData.serverTime
end

function LoginData.ClearLastAccount(keepAccount)
  if true ~= keepAccount then
    PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.TEMP_ACCOUNT, "")
  end
  PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.TEMP_PASSWORD, "")
end

LoginData.Init()
