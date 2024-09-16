local ModelUtil = {}

function ModelUtil.GetFullPath(path, prefix)
  if path then
    prefix = prefix or RES_PATH_PREFIX.BATTLE_SPINE
    return prefix .. path
  end
end

function ModelUtil.SetLive2dExpression(gameObject, expression, pose)
  if gameObject then
    local expCtrl = gameObject.transform:GetComponentInChildren(typeof(CS.Live2D.Cubism.Framework.Expression.CubismExpressionController))
    if expCtrl then
      if expression then
        expCtrl.CurrentExpressionIndex = expression
      end
      if pose then
        expCtrl.CurrentPoseExpressionIndex = pose
      end
    end
  end
end

return ModelUtil
