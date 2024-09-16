BattleVoice = {}
local curSoundEventInsList = {}

function BattleVoice.PlayVoice(unitUid, bubbleType)
  local soundEventIns = curSoundEventInsList[unitUid]
  if soundEventIns and SoundManager:IsPlaying(soundEventIns) then
    if bubbleType == BUBBLE_TYPE_ENUM.UNIQUE then
      BattleVoice.StopVoice(unitUid)
    else
      return
    end
  end
  local unit = BattleScene.GetUnitByUid(unitUid)
  if unit then
    local _, event = UIUtil.ShowTalkWord(unit.fashionId, bubbleType, nil, true, {
      gameObject = unit.model
    })
    curSoundEventInsList[unitUid] = event
  end
end

function BattleVoice.StopVoice(unitUid)
  local soundEventIns = curSoundEventInsList[unitUid]
  if soundEventIns then
    SoundUtil.StopSoundEvent(soundEventIns)
  end
end

function BattleVoice.StopAllVoice()
  for i, v in ipairs(curSoundEventInsList) do
    SoundUtil.StopSoundEvent(v)
  end
  curSoundEventInsList = {}
end
