UIMgr = CS.UIManager.Singleton
UILayer = CS.UILayer
BottomLayerEnum = CS.BottomLayerEnum
local LuaWins = {}
require("LuaWinRegister")

function CreateUIPage(cfg)
  return UIMgr:CreateUIPage(cfg.package, cfg.resName)
end

function NewLuaWindow(name)
  if nil ~= LuaWins[name] then
    if nil ~= LuaWins[name].ReInitData then
      LuaWins[name].ReInitData()
    end
    return LuaWins[name]
  else
    LuaWins[name] = require(name)
    if nil ~= LuaWins[name] then
      return LuaWins[name]
    else
      printError("没有找到lua窗口类:", name)
    end
  end
end

function OpenPopWindow(uiName, layer, ...)
  layer = layer or UILayer.HUD1
  OpenWindow(uiName, layer, ...)
end

function JumpToWindow(uiName, layer, keepWindowName, ...)
  keepWindowName = keepWindowName or {
    WinResConfig.HomeWindow.name
  }
  layer = layer or UILayer.HUD
  OpenWindowWithFullArg(uiName, layer, keepWindowName, 0, ...)
end

function OpenWindow(uiName, layer, ...)
  layer = layer or UILayer.HUD
  OpenWindowWithFullArg(uiName, layer, nil, 0, ...)
end

function OpenWindowWithFullArg(uiName, layer, keepWindowName, sortingOrder, ...)
  if UIMgr:IsWindowOpen(uiName) == false then
    local winConfig = WinResConfig[uiName]
    if nil == winConfig then
      return
    end
    UIMgr:RegisterLuaWindowType(winConfig.name, winConfig.package, winConfig.belowWindowOpr or "", winConfig.notReopen or false)
    local packageS = WindowLoadPackages[uiName]
    if packageS then
      UIMgr:SetNeedLoadPackage(uiName, packageS)
    end
    if keepWindowName then
      UIMgr:JumpToWindow(uiName, layer, keepWindowName, sortingOrder, {
        ...
      })
    else
      UIMgr:OpenWindow(uiName, layer, sortingOrder, {
        ...
      })
    end
    return true
  else
    if keepWindowName then
      UIMgr:JumpToWindow(uiName, layer, keepWindowName, sortingOrder, {
        ...
      })
    end
    return false
  end
end

function OpenWindowImmediately(uiName, layer, ...)
  layer = layer or UILayer.HUD
  OpenWindowWithFullArgImmediately(uiName, layer, nil, 0, ...)
end

function OpenWindowWithFullArgImmediately(uiName, layer, keepWindowName, sortingOrder, ...)
  if UIMgr:IsWindowOpen(uiName) == false then
    local winConfig = WinResConfig[uiName]
    if nil == winConfig then
      return
    end
    UIMgr:RegisterLuaWindowType(winConfig.name, winConfig.package, winConfig.belowWindowOpr or "", winConfig.notReopen or false)
    local packageS = WindowLoadPackages[uiName]
    if packageS then
      UIMgr:SetNeedLoadPackage(uiName, packageS)
    end
    if keepWindowName then
      UIMgr:JumpToWindow(uiName, layer, keepWindowName, sortingOrder, {
        ...
      })
    else
      UIMgr:OpenWindow(uiName, layer, sortingOrder, {
        ...
      }, true)
    end
    return true
  else
    if keepWindowName then
      UIMgr:JumpToWindow(uiName, layer, keepWindowName, sortingOrder, {
        ...
      })
    end
    return false
  end
end

function ClearLuaWins()
  for k, v in pairs(package.loaded) do
    if nil ~= LuaWins[k] then
      package.loaded[k] = nil
      LuaWins[k] = nil
    end
  end
end

function PlayUITransToComplete(com, transName)
  if com then
    local trans = com:GetTransition(transName)
    if trans then
      PlayUITrans(com, transName)
      trans:Stop(true, true)
    end
  end
end

function IsUITransPlaying(com, transName)
  if com then
    local trans = com:GetTransition(transName)
    if trans then
      return trans.playing
    end
  end
  return false
end

function PlayUITransAdaptDuration(com, transName, totalDuration, ignoreEngineTimeScale)
  if com then
    local trans = com:GetTransition(transName)
    if trans then
      local duration = trans.totalDuration
      trans.timeScale = duration / totalDuration
      if false == ignoreEngineTimeScale then
        trans.ignoreEngineTimeScale = false
      end
      trans:Play()
    end
  end
end

function PlayUITrans(com, transName, callBack, delayTime, times, startTime, endTime, ignoreEngineTimeScale, reverse, updateCallback)
  if com then
    local trans = com:GetTransition(transName)
    if trans then
      if false == ignoreEngineTimeScale then
        trans.ignoreEngineTimeScale = false
      end
      if startTime and endTime then
        trans:Play(times or 1, delayTime or 0, startTime, endTime, function()
          if callBack then
            callBack()
          end
        end, function()
          if updateCallback then
            updateCallback()
          end
        end)
      elseif reverse then
        trans:PlayReverse(times or 1, delayTime or 0, function()
          if callBack then
            callBack()
          end
        end, function()
          if updateCallback then
            updateCallback()
          end
        end)
      else
        trans:Play(times or 1, delayTime or 0, function()
          if callBack then
            callBack()
          end
        end, function()
          if updateCallback then
            updateCallback()
          end
        end)
      end
    end
    return trans
  end
end

function DisposeTrans(com, transName)
  if com then
    local trans = com:GetTransition(transName)
    if trans then
      trans:Dispose()
    end
  end
end

function GetTransitionDuration(com, transName)
  if com then
    local trans = com:GetTransition(transName)
    if trans then
      return trans.totalDuration
    end
  end
end

function SetControllerIgnoreTimeScale(com, controllerName, ignoreEngineTimeScale)
  if com then
    local controller = com:GetController(controllerName or "c1")
    if controller then
      controller.ignoreTimeScale = ignoreEngineTimeScale or false
    end
  end
end

function ChangeUIController(com, controllerName, selectIndex, ignoreEngineTimeScale)
  if com then
    local controller = com:GetController(controllerName or "c1")
    if controller then
      if ignoreEngineTimeScale then
        controller.ignoreTimeScale = ignoreEngineTimeScale
      end
      local targetSelectIndex = selectIndex or 0
      if controller.selectedIndex ~= targetSelectIndex then
        controller:SetSelectedIndex(targetSelectIndex)
        return true
      end
      controller:SetSelectedIndex(targetSelectIndex)
    end
  end
  return false
end

function ChangeController(controller, selectIndex, ignoreEngineTimeScale)
  if controller then
    if ignoreEngineTimeScale then
      controller.ignoreTimeScale = ignoreEngineTimeScale
    end
    controller:SetSelectedIndex(selectIndex or 0)
  end
end

function GetControllerIndex(com, controllerName)
  if com then
    local controller = com:GetController(controllerName)
    if controller then
      return controller.selectedIndex
    end
  end
end
