local ShakeAnimPlay = {}
local Animator = CS.UnityEngine.Animator
local data, callback
local time = 0

function ShakeAnimPlay.Init(...)
end

function ShakeAnimPlay.CheckData(...)
end

function ShakeAnimPlay.OnStart(...)
end

function ShakeAnimPlay.OnPlaying(...)
end

function ShakeAnimPlay.EndPlay(...)
end

function ShakeAnimPlay.PlayShake(animName, camera)
  if animName and "" ~= animName then
    local anim = camera:GetComponent(typeof(Animator))
    if anim then
      local stateId = Animator.StringToHash(animName)
      local hasState = anim:HasState(0, stateId)
      if not hasState then
        print("PlayShake, do not has anim state " .. animName)
      end
      anim:Play(animName, 0, 0)
    end
  end
end

function ShakeAnimPlay.EnableShake(camera, enable)
  if camera then
    local anim = camera:GetComponent(typeof(Animator))
    if anim then
      anim.enabled = enable
    end
  end
end

return ShakeAnimPlay
