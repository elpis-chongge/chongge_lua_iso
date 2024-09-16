local OnClick = function(skeletonAnimation, animationName, gesture)
  local go = skeletonAnimation.gameObject
  local track = 1
  local current = skeletonAnimation.state:GetCurrent(track)
  if nil == current or current.IsComplete then
    SkeletonAnimationUtil.SetAnimation(go, track, animationName, false)
  end
end
return {OnClick = OnClick}
