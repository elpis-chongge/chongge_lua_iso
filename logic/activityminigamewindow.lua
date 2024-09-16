require("ActivityDungeon1_MiniGameStartWindowByName")
local ActivityMiniGameWindow = {}
local uis, contentPane, submitlist
local controller = Activity1_MiniGameController
local pause, skeletonAnimations, effects
local FLOWER_URL_LOOKUP = {
  [1] = "Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame001/MiniGame001_flower_001.prefab",
  [2] = "Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame001/MiniGame001_flower_003.prefab",
  [3] = "Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame001/MiniGame001_flower_002.prefab"
}
local OpenSubmitWindow = function()
  OpenWindow(WinResConfig.ActivityMiniGameSubmitWindow.name, nil, submitlist)
end
local OnCreateFlower = function(index, type)
  local dot = uis.Main.FlowerMap[string.format("Dot%dBtn", index)]
  local holder = dot:GetChild("FlowerHolder")
  local go = ResourceManager.Instantiate(FLOWER_URL_LOOKUP[type])
  UIUtil.SetObjectToUI(go, holder)
  local effectHolder = dot:GetChild("EffectHolder")
  if not effectHolder then
    effectHolder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
    effectHolder.name = "EffectHolder"
    dot:AddChild(effectHolder)
    effectHolder:SetXY(holder.x, holder.y)
  end
  local effect
  effect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame001/FX_ui_miinigame001_flower_in.prefab", effectHolder)
  effects = effects or {}
  table.insert(effects, effect)
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_shouyi_flw_show")
  SkeletonAnimationUtil.SetAnimation(go, 0, "in", false, function()
    SkeletonAnimationUtil.SetAnimation(go, 0, "idle", true)
  end, true, "0")
  skeletonAnimations = skeletonAnimations or {}
  local cmp = SkeletonAnimationUtil.GetSkeletonAnimation(go)
  table.insert(skeletonAnimations, cmp)
end
local OnDeleteFlower = function(index, callback)
  local dot = uis.Main.FlowerMap[string.format("Dot%dBtn", index)]
  local holder = dot:GetChild("FlowerHolder")
  local go = holder.displayObject.wrapTarget
  local effectHolder = dot:GetChild("EffectHolder")
  if effectHolder then
    local effect
    effect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame001/FX_ui_minigame001_flower_out.prefab", effectHolder)
    effects = effects or {}
    table.insert(effects, effect)
  end
  local cmp = SkeletonAnimationUtil.GetSkeletonAnimation(go)
  local k = table.keyof(skeletonAnimations, cmp)
  if k then
    table.remove(skeletonAnimations, k)
  end
  SkeletonAnimationUtil.SetAnimation(go, 0, "out", false, function()
    holder:SetNativeObject(nil)
    if type(callback) == "function" then
      callback()
    end
  end)
end
local RefreshRemainTime = function(val)
  local integer, frac = math.modf(val)
  local richText
  if val <= 5 then
    richText = "[color=#F06363]%02d\"%02d[/color]"
  else
    richText = "[color=#DAFF5B]%02d\"%02d[/color]"
  end
  uis.Main.Integral.TimeTxt.text = string.format(richText, math.max(0, integer), math.max(0, math.floor(frac * 100)))
end
local OnElapse = function(elapse)
  local remainTime = 30 - elapse
  RefreshRemainTime(remainTime)
  if effects then
    local cnt = #effects
    for i = cnt, 1, -1 do
      local effect = effects[i]
      if not effect or effect:IsNull() then
        table.remove(effects, i)
      elseif not LuaUtil.IsPlaying(effect) then
        table.remove(effects, i)
        ResourceManager.DestroyGameObject(effect)
      end
    end
  end
end
local OnEnd = function()
  for i = 1, 9 do
    controller.DeleteFlower(i)
  end
  OpenWindow(WinResConfig.ActivityMiniGameEndTipsWindow.name, nil, OpenSubmitWindow)
end
local CalcScores = function()
  local point = 0
  local conf = ActivityDungeonData.GetActivityData()
  for _, v in ipairs(submitlist) do
    local val = conf.game_config[v.type]
    point = point + val * v.count
  end
  return point
end
local RefreshScores = function()
  local scoreText = T(20488, CalcScores())
  uis.Main.Integral.NumberTxt.text = scoreText
end
local PopupScoreTips = function(dot, f_type, duration)
  PlayUITransAdaptDuration(dot, "up", duration)
  local obj = dot:GetChild("GetIntegral")
  local conf = ActivityDungeonData.GetActivityData()
  local val = conf.game_config[f_type]
  UIUtil.SetText(obj, string.format("+%s", val or 0), "NumberTxt")
end
local Pause = function(val, displayTips)
  pause = val and pause + 1 or pause - 1
  local isPause = pause > 0
  controller.Pause(isPause)
  if displayTips then
    uis.Main.c1Ctr.selectedIndex = isPause and 1 or 0
  end
  if effects then
    local fun = isPause and LuaUtil.PauseEffect or LuaUtil.PlayEffect
    for _, effect in ipairs(effects) do
      if effect and not effect:IsNull() then
        fun(effect)
      end
    end
  end
  if skeletonAnimations then
    local timescale = isPause and 0 or 1
    for _, skeletonAnimation in ipairs(skeletonAnimations) do
      skeletonAnimation.timeScale = timescale
    end
  end
  UIMgr:SendWindowMessage(WinResConfig.ActivityMiniGameCountdownWindow.name, WindowMsgEnum.Activity1_MiniGame.PAUSE, isPause)
end

function ActivityMiniGameWindow.ReInitData()
end

function ActivityMiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.ActivityMiniGameWindow.package, WinResConfig.ActivityMiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1_MiniGameStartWindowUis(contentPane)
    ActivityMiniGameWindow.UpdateInfo()
    ActivityMiniGameWindow.InitBtn()
  end)
end

local FadeDuration = 0.8

function ActivityMiniGameWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1/MiniGame_1002"
  uis.Main.Integral.NumberTxt.text = T(20488, 0)
  RefreshRemainTime(30)
  submitlist = submitlist or {}
  table.clear(submitlist)
  pause = 0
  for i = 1, 9 do
    local dot = uis.Main.FlowerMap[string.format("Dot%dBtn", i)]
    local obj = dot:GetChild("GetIntegral")
    obj.touchable = false
    dot.onClick:Set(function()
      local result, f_type = controller.DeleteFlower(i)
      if result then
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_shouyi_gather")
        PopupScoreTips(dot, f_type, FadeDuration)
        local k = table.keyof(submitlist, f_type, "type")
        if k then
          submitlist[k].count = submitlist[k].count + 1
        else
          table.insert(submitlist, {type = f_type, count = 1})
        end
        RefreshScores()
      end
    end)
  end
end

function ActivityMiniGameWindow.InitBtn()
  uis.Main.PauseBtn.onClick:Set(function()
    local pause = not controller.IsPaused()
    Pause(pause, true)
  end)
  local cancelBtnParam = {
    touchCallback = function()
      Pause(false)
    end
  }
  uis.Main.CloseBtn.onClick:Set(function()
    Pause(true)
    MessageBox.Show(T(20515), {
      touchCallback = function()
        controller.Exit()
        UIMgr:CloseWindow(WinResConfig.ActivityMiniGameCountdownWindow.name)
        UIMgr:CloseWindow(WinResConfig.ActivityMiniGameWindow.name)
      end
    }, cancelBtnParam, cancelBtnParam)
  end)
  uis.Main.PauseTips.TouchScreenBtn.onClick:Set(function()
    Pause(false, true)
  end)
end

function ActivityMiniGameWindow.OnClose()
  uis = nil
  contentPane = nil
  if effects then
    table.clear(effects)
  end
  if skeletonAnimations then
    table.clear(skeletonAnimations)
  end
end

function ActivityMiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity1_MiniGame.START_GAME then
    controller.Start(OnCreateFlower, OnDeleteFlower, OnElapse, OnEnd)
  elseif msgId == WindowMsgEnum.Activity1_MiniGame.RESET then
    table.clear(submitlist)
    RefreshScores()
    RefreshRemainTime(30)
  end
end

return ActivityMiniGameWindow
