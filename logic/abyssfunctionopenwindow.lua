require("AbyssFunctionOpen_FunctionOpenWindowByName")
local AbyssFunctionOpenWindow = {}
local uis, contentPane, functionId, onCloseCallback, busy, endPosition
local duration = 1.2
local TweenOutAndClose = function()
  if busy then
    return
  end
  busy = true
  local elapse = 0
  local fading = false
  PlayUITrans(uis.Main.root, "out", function()
    local group = uis.Main.Pic.root
    group:TweenMove(endPosition, duration):OnUpdate(function()
      elapse = elapse + Time.deltaTime
      local normalizeTime = CS.FairyGUI.EaseManager.Evaluate(FairyGUI.EaseType.QuadIn, elapse, duration)
      group.scale = Vector2.Lerp(group.scale, Vector2.one * 0.3, normalizeTime)
      if not fading and elapse > 0.01 then
        group:TweenFade(0, duration):SetEase(FairyGUI.EaseType.Linear)
        fading = true
      end
    end):OnComplete(function()
      UIMgr:CloseWindow(WinResConfig.AbyssFunctionOpenWindow.name, true, false)
    end)
  end)
end

function AbyssFunctionOpenWindow.ReInitData()
end

function AbyssFunctionOpenWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.AbyssFunctionOpenWindow.package, WinResConfig.AbyssFunctionOpenWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyssFunctionOpen_FunctionOpenWindowUis(contentPane)
    functionId = bridgeObj.argTable[1]
    endPosition = bridgeObj.argTable[2]
    onCloseCallback = bridgeObj.argTable[3]
    AbyssFunctionOpenWindow.UpdateInfo()
    AbyssFunctionOpenWindow.InitBtn()
  end)
end

function AbyssFunctionOpenWindow.UpdateInfo()
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_explore_unlock")
  local conf = TableData.GetConfig(functionId, "BaseFeature")
  uis.Main.Pic.PicLoader.url = UIUtil.GetResUrl(conf.open_icon)
  local holder = uis.Main.Pic.Effect1Holder
  UIUtil.SetHolderCenter(holder)
  local eff = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_mapad_function_open.prefab")
  UIUtil.SetObjectToUI(eff, holder, 10000)
  LuaUtil.PlayEffect(eff)
  local panel = uis.Main.FunctionOpen1
  panel.NameTxt.text = conf and conf.name and conf.name() or "未配置功能名"
  panel.WordTxt.text = T(20252)
end

function AbyssFunctionOpenWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(TweenOutAndClose)
end

function AbyssFunctionOpenWindow.OnClose()
  uis = nil
  contentPane = nil
  if type(onCloseCallback) == "function" then
    onCloseCallback()
  end
  onCloseCallback = nil
  busy = nil
end

return AbyssFunctionOpenWindow
