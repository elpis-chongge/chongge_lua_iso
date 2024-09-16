BattleMgr = {
  showLeftDamageCount = false,
  showLeftHpCountTest = false,
  showCardUidTest = false,
  showPathTest = false,
  isTestBalance = false,
  isBattleServer = IsBattleServer or false,
  isPlotBattle = false,
  battleVersion = nil,
  localVarInited = false,
  isBattleStart = false,
  isPlayback = false,
  beforeBattleCallback = nil,
  skillSpEnoughCallback = nil
}
if BattleMgr.isBattleServer == true then
  function print_battle()
  end
  
  print_server = print
else
  print_battle = print
  
  function print_server()
  end
end
local isBattleServer

function BattleMgr.InitLocalVar()
  if BattleMgr.localVarInited == false then
    BattleAction.InitLocalVar()
    BattleActionDisplay.InitLocalVar()
    BattleBuff.InitLocalVar()
    BattleBurst.InitLocalVar()
    BattleBuffEffect.InitLocalVar()
    BattleBuffMgr.InitLocalVar()
    BattleBullet.InitLocalVar()
    BattleChoose.InitLocalVar()
    BattleControl.InitLocalVar()
    BattleDataCount.InitLocalVar()
    BattleOperation.InitLocalVar()
    BattleScene.InitLocalVar()
    BattleBurstSkill.InitLocalVar()
    BattleSkillWait.InitLocalVar()
    BattleUnit.InitLocalVar()
    isBattleServer = BattleMgr.isBattleServer
    BattleMgr.localVarInited = true
  end
end

function BattleMgr.SaveCompleteData(data)
  BattleData.SavedCompleteData = data
end

function BattleMgr.InitBattle(msg, delayClearScene, isPlayback)
  BattleMgr.InitLocalVar()
  if msg then
    BattleData.InitBattleData = msg
  end
  BattleMgr.isPlayback = isPlayback or false
  if true ~= isBattleServer then
    collectgarbage()
    local config
    if msg and msg.initData.sceneType == ProtoEnum.SCENE_TYPE.ARENA then
      config = TableData.GetConfig(70010204, "BaseFixed")
    else
      config = TableData.GetConfig(70010203, "BaseFixed")
    end
    if config then
      BattleData.speedList = {}
      local strs = Split(config.array_value, "|")
      for i, v in ipairs(strs) do
        table.insert(BattleData.speedList, tonumber(v))
      end
    else
      BattleData.speedList = BATTLE_SPEED_ENUM
    end
    BattleCamera.enabled = true
    local battleCameraObject = BattleCameraObject
    local ShakeAnimPlay = require("ShakeAnimPlay")
    ShakeAnimPlay.EnableShake(battleCameraObject, false)
    local position = BATTLE_CONFIG_ENUM.CAMERA_POSITION
    LuaUtil.SetLocalPositionAndRotation(battleCameraObject, position[1], position[2], position[3], BATTLE_CONFIG_ENUM.CAMERA_ROTATION_X, 0, 0)
    CameraUtil.SetCameraActive(battleCameraObject, true)
    if BattleData.battleCameraScale == nil then
      local cameraDisScale = math.abs(math.sqrt(position[2] ^ 2 + position[3] ^ 2) / UICameraObject.transform.position.z)
      BattleData.battleCameraScale = Stage.inst.scaleX * UIContentScaler.scaleFactor * cameraDisScale / Const.DefaultUIScale
    end
    CameraUtil.SetCameraFOV(battleCameraObject, BATTLE_CONFIG_ENUM.CAMERA_FOV)
    CameraUtil.SetCameraCullingMask(battleCameraObject, BATTLE_CONFIG_ENUM.CAMERA_CULLING_MASK)
  end
  local rad = math.rad(BATTLE_CONFIG_ENUM.CAMERA_ROTATION_X)
  BattleMgr.rotationTan = math.tan(rad)
  BattleMgr.rotationCos = math.cos(rad)
  BattleMgr.rotationSin = math.sin(rad)
  BattleRecord.Init()
  BattleDataCount.Init()
  BattleData.InitData()
  BattleControl.Init()
  BattleScene.Init()
  BattleBuffMgr.Init(true)
  if true == isBattleServer then
    BattleMgr.StartBattle(delayClearScene)
  else
    BattleActionDisplay.Init()
    SettingUtil.UpdateFPS()
  end
end

function BattleMgr.StartBattle(delayClearScene)
  BattleMgr.isBattleStart = true
  BattleControl.Start(delayClearScene)
end

function BattleMgr.CloseBattle(isManual, forceClose, closeWindowParam)
  BattleControl.Stop(isManual, forceClose)
  if false == isBattleServer then
    LoginData.SetTimeScale(1)
    if true ~= isManual then
      if closeWindowParam then
        UIMgr:CloseWindow(WinResConfig.BattleUIWindow.name, closeWindowParam.notReopen, closeWindowParam.force)
      else
        UIMgr:CloseWindow(WinResConfig.BattleUIWindow.name)
      end
    end
    BattleActionDisplay.ClearAction()
    SettingUtil.UpdateFPS()
    collectgarbage()
  else
    BattleScene.Clear()
  end
  BattleMgr.isPlotBattle = false
  BattleMgr.isBattleStart = false
  BattleMgr.beforeBattleCallback = nil
  BattleMgr.skillSpEnoughCallback = nil
  BattleMgr.showLeftDamageCount = false
end

function BattleMgr.SendBattleOverMsg(data, rspCallback)
  if BattleData.simulate then
    BattleMgr.OpenFinishWindow(data)
    return
  end
  BattleService.ChallengeStageReq(data, rspCallback, function()
    MessageBox.Show(T(10320), {
      touchCallback = function()
        BattleMgr.CloseBattle()
        BattleData.Clear()
      end
    }, nil, {
      touchCallback = function()
        BattleMgr.CloseBattle()
        BattleData.Clear()
      end
    })
  end)
end

function BattleMgr.OpenFinishWindow(data)
  if data.win or data.sceneType == ProtoEnum.SCENE_TYPE.ARENA then
    OpenWindow(WinResConfig.BattleFinishWindow.name, nil, data)
  elseif BattleData.IsBattleNoFail(data.sceneType) then
    OpenWindow(WinResConfig.BattleFinishWindow.name, nil, data)
  else
    OpenWindow(WinResConfig.BattleFinishFailWindow.name, nil, data)
  end
end

function BattleMgr.GetWaveName(waveIndex)
  if 1 == waveIndex then
    return T(10325)
  elseif 2 == waveIndex then
    return T(10326)
  end
end
