math.randomseed(os.time())
if Debug and Application.platform ~= RuntimePlatform.WindowsEditor and Application.platform ~= RuntimePlatform.OSXEditor then
  if LogType then
    Debug.unityLogger.filterLogType = LogType.Error
  else
    Debug.unityLogger.logEnabled = false
  end
end

function LoadGlobalObject()
  UICamera = StageCamera.main
  UICameraObject = UICamera.gameObject
  BattleCameraObject = GameObject.Find("BattleCamera")
  BattleCameraParentObject = BattleCameraObject.transform.parent.gameObject
  BattleCamera = BattleCameraObject:GetComponent(typeof(Camera))
  BattleCamera.enabled = false
end

function OpenStartWindow()
  SoundManager:Reset()
  LoadGlobalObject()
  local scene = SceneManager.GetActiveScene()
  if scene then
    if scene.name == "剧情编辑" then
      OpenWindow(WinResConfig.PlotPlayEditorWindow.name)
    else
      UIMgr.updateFuncUnlockMsgId = WindowMsgEnum.Common.E_MSG_UPDATE_FUNC_ENTER
      ld("Card")
      ld("Actor")
      ld("Adventure")
      ld("Guide")
      ld("Login", function()
        SoundUtil.PlayMusic(1010)
        
        function UIMgr.OpenLoginAction()
          OpenWindow(WinResConfig.LoginWindow.name)
        end
      end)
    end
  end
  if Application.platform == RuntimePlatform.WindowsEditor or Application.platform == RuntimePlatform.OSXEditor or Application.platform == RuntimePlatform.WindowsPlayer then
    local OpenGM = function()
      if UIMgr:IsWindowOpen(WinResConfig.GMPopup.name) == false then
        OpenWindow(WinResConfig.GMPopup.name, UILayer.Popup)
      else
        UIMgr:CloseWindow(WinResConfig.GMPopup.name)
      end
    end
    KeyCode = CS.UnityEngine.KeyCode
    Input = CS.UnityEngine.Input
    local autoUpdatePosition = false
    local Update = function()
      if Input.GetKeyUp(KeyCode.F1) or Input.GetKeyUp(KeyCode.Escape) then
        if UIMgr:IsWindowOpen(WinResConfig.PlotPlayWindow.name) then
          PlotPlayData.ClearData()
          UIMgr:CloseWindow(WinResConfig.PlotPlayWindow.name)
        else
          OpenGM()
        end
      elseif Input.GetKeyUp(KeyCode.P) and UIMgr:IsWindowOpen(WinResConfig.HomeWindow.name) then
        autoUpdatePosition = not autoUpdatePosition
      end
      if autoUpdatePosition then
        UIMgr:SendWindowMessage(WinResConfig.HomeWindow.name, WindowMsgEnum.HomeWindow.UPDATE_CARD_POSITION)
      end
    end
    UpdateManager.AddUpdateHandler(Update)
  end
  SoundManager:InitSound()
end

OpenStartWindow()
local blockInTestPackage = false

function BlockInTestPackage(noTips)
  if true ~= noTips and blockInTestPackage then
    FloatTipsUtil.ShowWarnTips("暂未开放")
  end
  return blockInTestPackage
end
