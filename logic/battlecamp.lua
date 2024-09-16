BattleCamp = {}

function BattleCamp.NewCamp(camp)
  local campObject = {
    buffUidList = {},
    triggerTimePauseCount = 0,
    canChargeUnitUidList = {}
  }
  
  function campObject:AddCanChargeUnit(unit)
    if table.contain(self.canChargeUnitUidList, unit.uid) == false then
      table.insert(self.canChargeUnitUidList, unit.uid)
    end
  end
  
  function campObject:DealCharge(hurt)
    if hurt > 0 and #self.canChargeUnitUidList > 0 then
      for _, uid in ipairs(self.canChargeUnitUidList) do
        local unit = BattleScene.GetUnitByUid(uid)
        if unit then
          unit:SaveCharge(hurt)
        end
      end
    end
  end
  
  function campObject:AddTimePause()
    self.triggerTimePauseCount = self.triggerTimePauseCount + 1
    BattleBuffMgr.TriggerListener(BUFF_DEDUCE_TYPE.CAMP_TRIGGER_TIME_PAUSE_COUNT, {
      triggerTimePauseCount = self.triggerTimePauseCount,
      camp = self.camp
    })
  end
  
  function campObject:AddBuff(uid)
    self.buffUidList[uid] = 1
  end
  
  function campObject:RemoveBuff(uid)
    self.buffUidList[uid] = nil
  end
  
  function campObject:Init()
    self.buffUidList = {}
    self.camp = camp
    if camp == BATTLE_CAMP_FLAG.LEFT then
      self.enemyCamp = BATTLE_CAMP_FLAG.RIGHT
    else
      self.enemyCamp = BATTLE_CAMP_FLAG.LEFT
    end
  end
  
  function campObject:Destroy()
    self = {}
  end
  
  campObject:Init()
  return campObject
end

function BattleCamp.DealCampCharge(camp, hurt)
  local campObj = BattleScene.GetCampObject(camp)
  if campObj then
    campObj:DealCharge(hurt)
  end
end
