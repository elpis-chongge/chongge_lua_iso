local shadowScale = Vector3(0.620000005, 0.317743778, 0.620000005)
local OnSpineLoaded = function(go)
  local goTrans = go.transform
  SkeletonAnimationUtil.SetShaderEffectEnable(go, false, true, false, true)
  LuaUtil.SetOutLineColor(go, 0, 79, 149, 179, 255)
  local helper = go:GetComponent(typeof(MaterialPropertyHelper))
  helper:ChangeFloatValue("_OcclusionAlpha", 1, -1)
  helper:ChangeFloatValue("_OcclusionColorBlend", 0.64, -1)
  helper:ChangeColorValue("_OcclusionColor", Color(0.37254901960784315, 0.6509803921568628, 0.6431372549019608, 1), -1)
  helper:ChangeFloatValue("_XTilt", 0, -1)
  helper:ChangeFloatValue("_Mirror", 0, -1)
  helper:ChangeFloatValue("_ShadowFalloff", 0.92, -1)
  helper:ChangeFloatValue("_ShadowFalloffSoftness", 5, -1)
  helper:ChangeFloatValue("_ShadowScaleX", 1, -1)
  helper:ChangeFloatValue("_ShadowScaleY", 0.75, -1)
  helper:ChangeFloatValue("_ShadowRotateZ", 0, -1)
  helper:ChangeColorValue("_ShadowColor", Color(0.17647058823529413, 0.17647058823529413, 0.17647058823529413, 0.49019607843137253), -1)
  helper:ChangeVectorValue("_ShadowOffset", Vector4(0, -1, 0, 0), -1)
  SkeletonAnimationUtil.SetAnimation(go, 0, SPINE_STATE_ENUM.IDLE, true, nil, true, "0")
  if not goTrans:Find("Shadow") then
    local shadow = ResourceManager.Instantiate("Assets/Art/Map/Prefab/Shadow.prefab")
    local shadowTrans = shadow.transform
    local unit = 0.4
    local bounds = SkeletonAnimationUtil.GetBounds(go, goTrans.position, goTrans.eulerAngles, goTrans.localScale)
    local x = bounds.extents.x
    local factor = math.min(x / unit, 1.8)
    shadowTrans.localScale = Vector3(factor * shadowScale.x, factor * shadowScale.y, shadowScale.z)
    shadowTrans:SetParent(goTrans)
    shadowTrans.localPosition = Vector3.zero
    shadow.name = "Shadow"
  end
end
return {OnSpineLoaded = OnSpineLoaded}
