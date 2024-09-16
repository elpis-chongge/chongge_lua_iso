local EffectUtil = {}

function EffectUtil.GetFullPath(path, prefix)
  if path then
    prefix = prefix or RES_PATH_PREFIX.EFFECT
    return prefix .. path
  end
end

function EffectUtil.GetEffectDuration(gameObject)
  local time = LuaUtil.GetParticleLength(gameObject)
  if time <= 0 then
    local animator = gameObject:GetComponentInChildren(typeof(CS.UnityEngine.Animator), true)
    if animator then
      time = animator:GetCurrentAnimatorStateInfo(0).length
    end
  end
  return time
end

function EffectUtil.SetAutoDestroyCallback(gameObject, fun, time, ignoreTimeScale)
  time = time or 0
  ignoreTimeScale = ignoreTimeScale or false
  LuaUtil.SetEffectSetting(gameObject, fun, time, ignoreTimeScale)
end

function EffectUtil.SetEffectSpeed(gameObject, speed)
  LuaUtil.SetEffectSpeed(gameObject, speed)
end

function EffectUtil.PlayTimeLine(obj)
  local mDirector = obj:GetComponent(typeof(CS.UnityEngine.Playables.PlayableDirector))
  if mDirector then
    mDirector:Play()
    return mDirector.duration
  end
end

function EffectUtil.PlayTimeLineByName(obj, name)
  local mDirectors = ListToTable(obj:GetComponentsInChildren(typeof(CS.UnityEngine.Playables.PlayableDirector)))
  for i, v in ipairs(mDirectors) do
    if v.name == name then
      v:Play()
      return v.duration
    end
  end
end

function EffectUtil.StopTimeLine(obj)
  local mDirector = obj:GetComponent(typeof(CS.UnityEngine.Playables.PlayableDirector))
  if mDirector then
    mDirector:Stop()
  end
end

function EffectUtil.Overturn(obj, isFlip)
  if obj then
    LuaUtil.OverturnEffect(obj, isFlip)
  end
end

return EffectUtil
