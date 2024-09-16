BattleSummonWait = {}
local summonWaitList = {}

function BattleSummonWait.Init()
  summonWaitList = {}
end

function BattleSummonWait.AddSummon(param, delayFrame)
  if delayFrame > 0 then
    table.insert(summonWaitList, 1, {summonData = param, delayFrame = delayFrame})
  end
end

function BattleSummonWait.DealSummonWaitList()
  local summon
  for i = #summonWaitList, 1, -1 do
    summon = summonWaitList[i]
    if summon.delayFrame <= 1 then
      BattleAction.DealSummon(summon.summonData)
      table.remove(summonWaitList, i)
    else
      summon.delayFrame = summon.delayFrame - 1
    end
  end
end

function BattleSummonWait.Clear()
  summonWaitList = {}
end
