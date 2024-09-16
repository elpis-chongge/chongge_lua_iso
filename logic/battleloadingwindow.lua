require("Loading_BattleLoadingWindowByName")
local BattleLoadingWindow = {}
local uis, contentPane, effect, onShowAnimationEndCallback, addCallbackIn

function BattleLoadingWindow.ReInitData()
end

function BattleLoadingWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.BattleLoadingWindow.package, WinResConfig.BattleLoadingWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetLoading_BattleLoadingWindowUis(contentPane)
    BattleLoadingWindow.UpdateInfo()
    BattleLoadingWindow.InitBtn()
    onShowAnimationEndCallback = bridgeObj.argTable[1]
    LuaUtil.SetAlpha(effect, 0)
    PlayUITrans(uis.root, "in1", function()
      LuaUtil.ResetAlpha(effect)
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

function BattleLoadingWindow.UpdateInfo()
  if nil == effect then
    effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Loading/FX_ui_loading.prefab")
    LuaUtil.SetLocalPos(effect, 10000, 0, 0)
  end
end

function BattleLoadingWindow.ShowAnimOut(callback)
  if IsUITransPlaying(uis.root, "out1") then
    return
  end
  PlayUITrans(uis.root, "out1", function()
    UIMgr:CloseWindow(WinResConfig.BattleLoadingWindow.name, true, true, false)
    callback()
  end, nil, nil, nil, nil, nil, nil, function()
    if uis and effect then
      local alpha = uis.EffectAni.root.alpha
      LuaUtil.SetAlpha(effect, alpha)
    end
  end)
end

function BattleLoadingWindow.InitBtn()
end

function BattleLoadingWindow.OnShown()
end

function BattleLoadingWindow.OnHide()
end

function BattleLoadingWindow.OnClose()
  uis = nil
  contentPane = nil
  if effect then
    ResourceManager.DestroyGameObject(effect)
    effect = nil
  end
  onShowAnimationEndCallback = nil
  addCallbackIn = nil
end

function BattleLoadingWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.BattleLoadingWindow.PLAY_ANIM_OUT then
    BattleLoadingWindow.ShowAnimOut(para)
  elseif msgId == WindowMsgEnum.BattleLoadingWindow.ADD_CALLBACK_IN then
    addCallbackIn = para
    if nil == onShowAnimationEndCallback then
      addCallbackIn()
      addCallbackIn = nil
    end
  end
end

return BattleLoadingWindow
