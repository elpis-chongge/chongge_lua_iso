require("Loading_LoginLoadingWindowByName")
local LoginLoadingWindow = {}
local uis, contentPane, onShowAnimationEndCallback, addCallbackIn

function LoginLoadingWindow.ReInitData()
end

local effect, dontShowEffect

function LoginLoadingWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.LoginLoadingWindow.package, WinResConfig.LoginLoadingWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetLoading_LoginLoadingWindowUis(contentPane)
    onShowAnimationEndCallback = bridgeObj.argTable[1]
    dontShowEffect = bridgeObj.argTable[2]
    uis.root:GetChild("PicImage").visible = dontShowEffect and true or false
    LoginLoadingWindow.UpdateInfo()
    LoginLoadingWindow.InitBtn()
    if effect then
      LuaUtil.SetAlpha(effect, 0)
    end
    PlayUITrans(uis.root, "in1", function()
      if effect then
        LuaUtil.ResetAlpha(effect)
      end
      if onShowAnimationEndCallback then
        onShowAnimationEndCallback()
        onShowAnimationEndCallback = nil
      end
      if addCallbackIn then
        addCallbackIn()
        addCallbackIn = nil
      end
      Resources.UnloadUnusedAssets()
    end, nil, nil, nil, nil, nil, nil, function()
      if uis and effect then
        local alpha = uis.EffectAni.root.alpha
        if alpha < 1 then
          LuaUtil.SetAlpha(effect, alpha)
        end
      end
    end)
  end)
end

function LoginLoadingWindow.UpdateInfo()
  if true ~= dontShowEffect and nil == effect then
    effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Loading/FX_ui_loading.prefab")
    LuaUtil.SetLocalPos(effect, 10000, 0, 0)
  end
end

function LoginLoadingWindow.ShowAnimOut(callback)
  if IsUITransPlaying(uis.root, "out1") then
    return
  end
  PlayUITrans(uis.root, "out1", function()
    UIMgr:CloseWindow(WinResConfig.LoginLoadingWindow.name, true, true, false)
    if callback then
      callback()
    end
  end, nil, nil, nil, nil, nil, nil, function()
    if uis and effect then
      local alpha = uis.EffectAni.root.alpha
      LuaUtil.SetAlpha(effect, alpha)
    end
  end)
end

function LoginLoadingWindow.InitBtn()
end

function LoginLoadingWindow.OnClose()
  uis = nil
  contentPane = nil
  if effect then
    ResourceManager.DestroyGameObject(effect)
    effect = nil
  end
  onShowAnimationEndCallback = nil
  addCallbackIn = nil
end

function LoginLoadingWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.LoginLoadingWindow.PLAY_ANIM_OUT then
    LoginLoadingWindow.ShowAnimOut(para)
  elseif msgId == WindowMsgEnum.LoginLoadingWindow.ADD_CALLBACK_IN then
    addCallbackIn = para
    if nil == onShowAnimationEndCallback then
      addCallbackIn()
      addCallbackIn = nil
    end
  end
end

return LoginLoadingWindow
