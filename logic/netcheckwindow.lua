require("Loading_NetCheckByName")
local NetCheckWindow = {}
local uis, contentPane, waitTimer, rightNow, effect

function NetCheckWindow.ReInitData()
end

function NetCheckWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.NetCheckWindow.package, WinResConfig.NetCheckWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    contentPane.alpha = 0
    rightNow = bridgeObj.argTable[1]
    uis = GetLoading_NetCheckUis(contentPane)
    local loader = uis.PopupBg.BlurLoader
    loader:SetXY(contentPane.width, contentPane.height)
    loader:Center()
    NetCheckWindow.UpdateInfo()
    NetCheckWindow.InitBtn()
  end)
end

function NetCheckWindow.LaterShow()
  if contentPane then
    if effect then
      effect:SetActive(true)
    end
    UIMgr:ShowBlur(contentPane)
    contentPane.alpha = 1
  end
end

function NetCheckWindow.UpdateInfo()
  if uis and nil == effect then
    effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Loading/FX_ui_connecting.prefab")
    effect:IgnoreTimeScale(true)
    LuaUtil.SetLocalPos(effect, 10000, 0, 0)
    effect:SetActive(false)
  end
end

function NetCheckWindow.InitBtn()
end

function NetCheckWindow.OnShown()
  if nil == waitTimer then
    waitTimer = TimerUtil.setTimeout(2, NetCheckWindow.LaterShow, nil, nil, true)
  end
end

function NetCheckWindow.OnHide()
  if contentPane then
    contentPane.alpha = 0
  end
  if effect then
    effect:SetActive(false)
  end
  NetCheckWindow.ClearTimer()
end

function NetCheckWindow.ClearTimer()
  if waitTimer then
    waitTimer:stop()
    waitTimer = nil
  end
end

function NetCheckWindow.OnClose()
  if effect then
    ResourceManager.DestroyGameObject(effect)
    effect = nil
  end
  NetCheckWindow.ClearTimer()
  uis = nil
  contentPane = nil
end

function NetCheckWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.NetCheckWindow.E_MSG_FORCE_SHOW and waitTimer and waitTimer:IsRunIng() then
    waitTimer:Comp()
  end
end

return NetCheckWindow
