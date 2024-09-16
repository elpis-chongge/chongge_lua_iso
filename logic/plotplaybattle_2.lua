BattleData.InitBattleData = {
  id = 2,
  uid = 2,
  mapId = 10001,
  randomSeeds = {10000},
  actorLeft = {
    uid = 1,
    badge = {
      id = 21110100,
      level = 4,
      grade = 0
    },
    unitList = {
      {
        uid = "",
        uin = "",
        id = 31000201,
        pos = 204
      },
      {
        uid = "",
        uin = "",
        id = 31000202,
        pos = 202
      },
      {
        uid = "",
        uin = "",
        id = 31000203,
        pos = 403
      }
    }
  },
  actorRight = {
    uid = 2,
    badge = {},
    unitList = {
      {
        uid = "",
        uin = "",
        id = 31000204,
        pos = 1003
      },
      {
        uid = "",
        uin = "",
        id = 31000205,
        pos = 1102
      },
      {
        uid = "",
        uin = "",
        id = 31000206,
        pos = 1104
      },
      {
        uid = "",
        uin = "",
        id = 31000207,
        pos = 1203
      },
      {
        uid = "",
        uin = "",
        id = 31000208,
        pos = 1201
      }
    }
  },
  neutral = {
    unitList = {}
  }
}
local initialAttributes = function()
  local unitList = BattleData.InitBattleData.actorLeft.unitList
  for _, info in ipairs(unitList) do
    if info.attributes == nil then
      info.attributes = CardData.CalculatorCardAttr(info)
    end
  end
  unitList = BattleData.InitBattleData.actorRight.unitList
  for _, info in ipairs(unitList) do
    if info.attributes == nil then
      info.attributes = CardData.CalculatorCardAttr(info)
    end
  end
end
initialAttributes()
BattleMgr.InitBattle()
local PlotBattle = {
  endCallback = nil,
  isPaused = false,
  isClose = false
}

function PlotBattle.SpeakFunc(battleUnit, speakContent)
end

function PlotBattle.Start(endCallback)
  PlotBattle.isClose = false
  UpdateManager.AddFixedUpdateHandler(PlotBattle.PlotBattleUpdate)
  PlotBattle.endCallback = endCallback
end

function PlotBattle.Close()
  if PlotBattle.isClose == true then
    return
  end
  if PlotBattle.endCallback then
    PlotBattle.endCallback()
  end
  PlotBattle.endCallback = nil
  UpdateManager.RemoveFixedUpdateHandler(PlotBattle.PlotBattleUpdate)
  BattleMgr.CloseBattle()
  PlotBattle.isClose = true
end

function PlotBattle.PlotBattleUpdate()
  local curFixedFrame = BattleControl.curFixedFrame
  if curFixedFrame > 0 then
    local fixedFPS = BATTLE_CONFIG_ENUM.FIXED_FPS
    if curFixedFrame == 7 * fixedFPS and PlotBattle.isPaused == false then
      UIMgr:HideWindow(WinResConfig.PlotPlayWindow.name)
      BattleControl.Pause()
      PlotBattle.isPaused = true
    end
  end
end

return PlotBattle
