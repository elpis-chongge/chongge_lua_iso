require("FunctionOpen_FunctionWindowByName")
local FunctionWindow = {}
local uis, contentPane, closeCallBack, lockedId, index

function FunctionWindow.ReInitData()
end

function FunctionWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.FunctionWindow.package, WinResConfig.FunctionWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    lockedId = bridgeObj.argTable[1]
    closeCallBack = bridgeObj.argTable[2]
    uis = GetFunctionOpen_FunctionWindowUis(contentPane)
    index = 1
    FunctionWindow.UpdateInfo()
    FunctionWindow.InitBtn()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.FUNCTION_OPEN)
  end)
end

function FunctionWindow.UpdateInfo()
  local featureData = TableData.GetConfig(lockedId[index], "BaseFeature")
  if featureData then
    UIUtil.SetHolderCenter(uis.Main.EffectHolder)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Function_activated/FX_ui_function_activated.prefab", uis.Main.EffectHolder)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Function_activated/FX_ui_function_activated_end.prefab", uis.Main.EffectHolder2)
    uis.Main.PicLoader.url = UIUtil.GetResUrl(featureData.unlock_icon)
    uis.Main.NameTxt.text = featureData.name()
    uis.Main.LockWord.WordTxt.text = T(803)
  end
end

function FunctionWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    index = index + 1
    if lockedId[index] then
      uis.Main.TouchScreenBtn.touchable = false
      PlayUITrans(uis.Main.root, "in", function()
        uis.Main.TouchScreenBtn.touchable = true
      end)
      FunctionWindow.UpdateInfo()
    else
      UIMgr:CloseWindow(WinResConfig.FunctionWindow.name)
      if closeCallBack then
        closeCallBack()
      end
    end
  end)
end

function FunctionWindow.OnClose()
  uis = nil
  contentPane = nil
end

return FunctionWindow
