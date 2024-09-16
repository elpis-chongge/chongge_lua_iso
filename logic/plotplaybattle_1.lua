BattleData.InitBattleData = {
  id = 1,
  uid = 1,
  mapId = 10001,
  randomSeeds = {10000},
  actorLeft = {
    uid = 1,
    badge = {},
    unitList = {
      {
        uid = "",
        uin = "",
        id = 31000101,
        pos = 301
      },
      {
        uid = "",
        uin = "",
        id = 31000102,
        pos = 202
      },
      {
        uid = "",
        uin = "",
        id = 31000103,
        pos = 403
      },
      {
        uid = "",
        uin = "",
        id = 31000108,
        pos = -603
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
        id = 31000104,
        pos = 1001
      },
      {
        uid = "",
        uin = "",
        id = 31000105,
        pos = 1003
      },
      {
        uid = "",
        uin = "",
        id = 31000106,
        pos = 1102
      },
      {
        uid = "",
        uin = "",
        id = 31000107,
        pos = 1104
      },
      {
        uid = "",
        uin = "",
        id = 11300011,
        pos = 1301
      },
      {
        uid = "",
        uin = "",
        id = 11300012,
        pos = 1303
      },
      {
        uid = "",
        uin = "",
        id = 11300013,
        pos = 1304
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
local PlotBattle = {endCallback = nil, isClose = false}

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
  PlotBattle.endCallback = nil
  UpdateManager.RemoveFixedUpdateHandler(PlotBattle.PlotBattleUpdate)
  PlotBattle.isClose = true
end

function PlotBattle.PlotBattleUpdate()
  local curFixedFrame = BattleControl.curFixedFrame
  if curFixedFrame > 0 then
    local fixedFPS = BATTLE_CONFIG_ENUM.FIXED_FPS
    if 1 == curFixedFrame then
      local unit_NILISHA = BattleScene.GetUnitById(31000108)
      unit_NILISHA:SetStun(true)
    end
    if curFixedFrame == 7 * fixedFPS then
      BattleHurtNum.ShowPopWord("蒂娜小姐，你的长剑是装饰品", BattleScene.GetUnitById(31000101))
    end
    if curFixedFrame == 10 * fixedFPS then
      BattleHurtNum.ShowPopWord("哼。。。", BattleScene.GetUnitById(31000103))
    end
    if curFixedFrame == 12 * fixedFPS then
      BattleHurtNum.ShowPopWord("老师，魔物越来越多", BattleScene.GetUnitById(31000102))
    end
    if curFixedFrame == 10 * fixedFPS then
      local unit_NILISHA = BattleScene.GetUnitById(31000108)
      unit_NILISHA:SetStun(false)
      local x, y, z = BattleScene.GetInitPosition(303)
      unit_NILISHA:SetMoveToPosition({
        x = x,
        y = y,
        z = z
      })
    end
    if curFixedFrame == 16 * fixedFPS then
      local unit_NILISHA = BattleScene.GetUnitById(31000108)
      unit_NILISHA.invalidUpdate = true
      unit_NILISHA:ChangeAnimation(SPINE_STATE_ENUM.ATTACK, false, function()
      end)
      local unit = BattleScene.GetUnitById(31000101)
      BattleHurtNum.ShowExpression(EXPRESSION_TYPE.SURPRISE, unit, 5)
      unit = BattleScene.GetUnitById(31000103)
      BattleHurtNum.ShowExpression(EXPRESSION_TYPE.SURPRISE, unit, 5)
      unit = BattleScene.GetUnitById(31000102)
      BattleHurtNum.ShowExpression(EXPRESSION_TYPE.SURPRISE, unit, 5)
      local config = TableData.GetConfig(42810002, "BaseSkillShowDisplay")
      local bullet = BattleBullet.NewBullet(config, unit_NILISHA, nil, nil, {
        x = 5,
        y = 0,
        z = 0
      }, nil, nil, config.bullet_speed, {hurtIndex = 1})
      BattleScene.AddBullet(bullet)
      bullet.model.name = "序章战斗炸弹"
    end
    if curFixedFrame == 17 * fixedFPS then
      local effect = ResourceManager.Instantiate(EffectUtil.GetFullPath("badge/FX_badge_10101.prefab"))
      BattleResourceManager:AddGameObject(effect, 5, 0, 0)
      LuaUtil.SetLocalEuler(effect, BATTLE_CONFIG_ENUM.BACKGROUND_ROTATION_X, 0, 0)
      EffectUtil.SetAutoDestroyCallback(effect, function()
        if effect then
          ResourceManager.DestroyGameObject(effect)
        end
      end)
      local leftUnits = BattleScene.GetUnitListByCamp(BATTLE_CAMP_FLAG.LEFT)
      for i, v in ipairs(leftUnits) do
        v.invalidUpdate = true
        v:ChangeAnimation(SPINE_STATE_ENUM.IDLE, true)
      end
      local rightUnits = BattleScene.GetUnitListByCamp(BATTLE_CAMP_FLAG.RIGHT)
      for i, v in ipairs(rightUnits) do
        v.invalidUpdate = true
        BattleHurtNum.ShowExpression(EXPRESSION_TYPE.ANGRY, v, 2)
        v:ChangeAnimation(SPINE_STATE_ENUM.IDLE, true)
      end
    end
    if curFixedFrame == 19 * fixedFPS then
      local unitNILISHA = BattleScene.GetUnitById(31000108)
      BattleHurtNum.ShowPopWord("喂！快呀！还愣着干嘛！赶紧溜！", unitNILISHA)
      local rightUnits = BattleScene.GetUnitListByCamp(BATTLE_CAMP_FLAG.RIGHT)
      for i, v in ipairs(rightUnits) do
        BattleBuffMgr.NewBuff(43100203, {
          unitUid = unitNILISHA.uid
        }, {
          unitUid = v.uid
        }, true)
        v.invalidUpdate = false
      end
    end
    if curFixedFrame == 23 * fixedFPS then
      if PlotBattle.endCallback then
        PlotBattle.endCallback()
      end
      PlotBattle.Close()
      BattleMgr.CloseBattle()
    end
  end
end

return PlotBattle
