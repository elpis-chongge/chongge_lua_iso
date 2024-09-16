require("ActivityDungeon1001_MiniGameStartWindowByName")
local FRUIT_LEVEL_ASSET_LOOKUP = {
  [1] = "ui://ActivityDungeon1001/Vegetable_1001",
  [2] = "ui://ActivityDungeon1001/Vegetable_1002",
  [3] = "ui://ActivityDungeon1001/Vegetable_1003",
  [4] = "ui://ActivityDungeon1001/Vegetable_1004",
  [5] = "ui://ActivityDungeon1001/Vegetable_1005",
  [6] = "ui://ActivityDungeon1001/Vegetable_1006",
  [7] = "ui://ActivityDungeon1001/Vegetable_1007",
  [8] = "ui://ActivityDungeon1001/Vegetable_1008",
  [9] = "ui://ActivityDungeon1001/Vegetable_1009",
  [10] = "ui://ActivityDungeon1001/Vegetable_1010",
  [11] = "ui://ActivityDungeon1001/Vegetable_1011"
}
local Activity2MiniGameWindow = {}
local uis, contentPane, controller, goLoaderLookup, aimingline, submitlist, lastPos, winklist
local WINK_INTERVAL = 0.3
local CreateFruit = function(level, ready)
  local gcmp = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Component)
  local loader = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Loader)
  loader.url = FRUIT_LEVEL_ASSET_LOOKUP[level]
  local settings = controller.GetSettings(level)
  loader.size = Vector2(settings.radius * 2, settings.radius * 2)
  loader:SetPivot(0.5, 0.5)
  loader.pivotAsAnchor = true
  local parent = uis.Main.MidRegion.root
  gcmp:AddChild(loader)
  loader:SetXY(0, 0)
  parent:AddChild(gcmp)
  if ready then
    local region1 = parent:GetChild("Region1Image")
    if not lastPos then
      lastPos = region1:TransformPoint(Vector2(region1.width * 0.5, region1.height * 0.5), parent)
    end
    local min = region1:TransformPoint(Vector2.zero, parent)
    local max = region1:TransformPoint(Vector2(region1.width, region1.height), parent)
    lastPos.x = math.min(math.max(lastPos.x, min.x + settings.radius), max.x - settings.radius)
    gcmp:SetXY(lastPos.x, lastPos.y)
    if not aimingline then
      aimingline = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Loader)
      aimingline.url = "ui://u38qpl0fxr2ad3"
      parent:AddChild(aimingline)
    end
    parent:SetChildIndex(aimingline, parent.numChildren)
    aimingline:SetXY(lastPos.x - 4, lastPos.y)
  end
  local go = gcmp.displayObject.gameObject
  goLoaderLookup = goLoaderLookup or {}
  goLoaderLookup[go] = gcmp
  return go, gcmp.displayObject.cachedTransform
end
local DestroyFruit = function(go)
  if goLoaderLookup and goLoaderLookup[go] then
    local gcmp = goLoaderLookup[go]
    local loader = gcmp:GetChildAt(0)
    goLoaderLookup[go] = nil
    if loader and winklist then
      local k = table.keyof(winklist, loader, "loader")
      table.remove(winklist, k)
    end
    gcmp:Dispose()
  end
end
local CalcScores = function()
  local result = 0
  if submitlist then
    local conf = ActivityDungeonData.GetActivityData()
    local cnt = #conf.game_config
    for i, v in ipairs(submitlist) do
      local level = v.level
      local count = v.count
      local index = math.max(math.min(cnt, level), 1)
      result = result + tonumber(conf.game_config[index]) * count
    end
  end
  return result
end
local RefreshScores = function()
  local scores = CalcScores()
  local panel = uis.Main.LeftRegion.Integral
  panel.NumberTxt.text = scores
  local info = Activity2_MiniGameData.GetMiniGameInfo()
  panel.Number1Txt.text = info and (info.miniHighScore or 0) or 0
end
local OnGameOver = function(elapse)
  local score = CalcScores()
  OpenWindow(WinResConfig.Activity2MiniGameSubmitWindow.name, nil, score, elapse)
end
local OnNextFruit = function(nextLevel)
  uis.Main.RightRegion.Next.PicLoader.url = FRUIT_LEVEL_ASSET_LOOKUP[nextLevel]
  PlayUITrans(uis.Main.RightRegion.Next.root, "up")
end
local Screen2WorldPosition = function(global)
  local sc = StageCamera.main
  local position = sc:ScreenToWorldPoint(Vector3(global.x, Screen.height - global.y, -sc.transform.position.z))
  return position
end
local World2ScreenPosition = function(position)
  local sc = StageCamera.main
  local sp = sc:WorldToScreenPoint(position)
  return Vector2(sp.x, Screen.height - sp.y)
end
local combinedEffect, textEffect, combinedTransform, combinedRadius
local OnCombine = function(point, transform, level)
  combinedTransform = transform
  local settings = controller.GetSettings(level)
  combinedRadius = settings.size and settings.size or settings.radius
  if submitlist then
    local k = table.keyof(submitlist, level, "level")
    if k then
      submitlist[k].count = submitlist[k].count + 1
    else
      table.insert(submitlist, {level = level, count = 1})
    end
  end
  RefreshScores()
  local panel = uis.Main.LeftRegion.Integral
  local textEffectHolderName = "TEXT_EFFECT_HOLDER"
  local textEffectHolder = panel.root:GetChild(textEffectHolderName)
  if not textEffectHolder then
    textEffectHolder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
    textEffectHolder.name = textEffectHolderName
    panel.root:AddChild(textEffectHolder)
    local pos = uis.Main.LeftRegion.Integral.NumberTxt.position
    textEffectHolder:SetXY(pos.x, pos.y)
  end
  if not textEffect then
    textEffect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame002/FX_ui_minigame002_pointflash.prefab")
    UIUtil.SetObjectToUI(textEffect, textEffectHolder)
    textEffect.transform.localPosition = Vector3.zero
  end
  LuaUtil.PlayEffectAtTime(textEffect, 0)
  local sp = World2ScreenPosition(Vector3(point.x, point.y, 0))
  local parent = uis.Main.MidRegion.root
  local pos = parent:GlobalToLocal(sp)
  local name = "COMBINED_EFFECT_HOLDER"
  local holder = parent:GetChild(name)
  if not holder then
    holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
    holder.name = name
    parent:AddChild(holder)
  end
  local scale = (1 + (level - 2) * 0.1) / Const.DefaultUIScale
  parent:SetChildIndex(holder, parent.numChildren)
  holder:SetXY(pos.x, pos.y)
  if not combinedEffect then
    combinedEffect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame002/FX_ui_minigame002_Synthetic.prefab")
    UIUtil.SetObjectToUI(combinedEffect, holder)
  end
  LuaUtil.PlayEffectAtTime(combinedEffect, 0)
  if scale then
    LuaUtil.SetScale(combinedEffect, scale, scale, scale)
  end
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_nangua")
end
local OnStayGameOverline = function(fruit, elapse)
  if elapse > 0.5 then
    local go = fruit.go
    local gcmp = goLoaderLookup[go]
    local loader = gcmp:GetChildAt(0)
    if loader then
      winklist = winklist or {}
      if not table.keyof(winklist, loader, "loader") then
        table.insert(winklist, {loader = loader})
      end
    end
  end
end
local OnExitGameOverline = function(fruit)
  local go = fruit.go
  if winklist and goLoaderLookup then
    local gcmp = goLoaderLookup[go]
    local loader = gcmp:GetChildAt(0)
    if loader then
      local k = table.keyof(winklist, loader, "loader")
      if k then
        loader.color = Color.white
        table.remove(winklist, k)
      end
    end
  end
end
local MoveReadyFruit = function(deltaX)
  local position, _ = controller.MoveReadyFruit(deltaX)
  if position then
    local global = World2ScreenPosition(position)
    local parent = uis.Main.MidRegion.root
    lastPos = parent:GlobalToLocal(global)
    aimingline:SetXY(lastPos.x - 4, lastPos.y)
  end
end
local OnUpdate = function()
  if combinedTransform and not combinedTransform:IsNull() and combinedEffect then
    local point
    if type(combinedRadius) == "userdata" then
      point = combinedTransform.position
    else
      point = combinedTransform.position
    end
    local sp = World2ScreenPosition(Vector3(point.x, point.y, 0))
    local parent = uis.Main.MidRegion.root
    local pos = parent:GlobalToLocal(sp)
    local holder = parent:GetChild("COMBINED_EFFECT_HOLDER")
    if holder then
      holder:SetXY(pos.x, pos.y)
    end
  end
  if winklist then
    for _, v in ipairs(winklist) do
      if not v.duration or v.duration <= 0 then
        local red = v.red
        v.red = not red
        v.loader.color = red and Color.white or Color.red
        v.duration = WINK_INTERVAL
      end
      v.duration = v.duration - Time.deltaTime
    end
  end
  if Application.platform ~= RuntimePlatform.WindowsEditor and Application.platform ~= RuntimePlatform.OSXEditor then
    return
  end
  local horizontal = CS.UnityEngine.Input.GetAxis("Horizontal")
  if math.abs(horizontal) > 0 then
    MoveReadyFruit(horizontal > 0 and 1 or -1)
  end
  local vertical = Input.GetAxis("Vertical")
  if vertical < 0 then
    controller.DropReadyFruit()
  end
end
local StartGame = function()
  lastPos = nil
  combinedTransform = nil
  if winklist then
    table.clear(winklist)
  end
  submitlist = submitlist or {}
  table.clear(submitlist)
  RefreshScores()
  local root = uis.Main.MidRegion.root
  local region1 = root:GetChild("Region1Image")
  local region2 = root:GetChild("Region2Image")
  local localPosition = Vector3(region1.x + region1.width * 0.5, (region1.height + region2.height) * 0.5 + region1.y, 0)
  local linePosition = Vector3(region1.x + region1.width * 0.5, region1.y + region1.height, 0)
  local min = Screen2WorldPosition(region2:LocalToGlobal(Vector2(0, region2.height)))
  local max = Screen2WorldPosition(region1:LocalToGlobal(Vector2(region1.width, region1.height)))
  controller.SetMinMax(min, max)
  controller.Start(root, localPosition, linePosition, CreateFruit, DestroyFruit, OnGameOver, OnNextFruit, OnCombine, OnStayGameOverline, OnExitGameOverline)
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  UpdateManager.AddUpdateHandler(OnUpdate)
end

function Activity2MiniGameWindow.ReInitData()
end

function Activity2MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity2MiniGameWindow.package, WinResConfig.Activity2MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1001_MiniGameStartWindowUis(contentPane)
    Activity2MiniGameWindow.UpdateInfo()
    Activity2MiniGameWindow.InitBtn()
  end)
end

function Activity2MiniGameWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1001/MiniGame_1001"
  submitlist = submitlist or {}
  table.clear(submitlist)
  local leftRegion = uis.Main.LeftRegion
  local rightRegion = uis.Main.RightRegion
  local descText = T(20525)
  local curScoreText = T(20526)
  local highestScoreText = T(20527)
  local nextText = T(20528)
  local vibeText = T(20529)
  UIUtil.SetText(leftRegion.root, descText, "WordTxt")
  UIUtil.SetText(rightRegion.root, vibeText, "WordTxt")
  UIUtil.SetText(rightRegion.Next.root, nextText, "WordTxt")
  UIUtil.SetText(leftRegion.Integral.root, curScoreText, "NumberWordTxt")
  UIUtil.SetText(leftRegion.Integral.root, "", "NumberTxt")
  UIUtil.SetText(leftRegion.Integral.root, highestScoreText, "NumberWord1Txt")
  UIUtil.SetText(leftRegion.Integral.root, "", "Number1Txt")
  controller = require("Activity2_MiniGameController")
  StartGame()
end

local cancelBtnParam = {
  touchCallback = function()
    controller.Pause(false)
  end
}

function Activity2MiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    controller.Pause(true)
    MessageBox.Show(T(20533), {
      touchCallback = function()
        local score = CalcScores()
        local consumeSeconds = math.ceil(controller.GetElapse())
        Activity2_MiniGameService.MiniGameSubmitReq({}, score, consumeSeconds, function()
          UIMgr:CloseToWindow(WinResConfig.Activity2MiniGameMainWindow.name)
        end)
      end
    }, cancelBtnParam, cancelBtnParam)
  end)
  local left_gesture = LongPressGesture.GetLongPressGesture(uis.Main.LeftRegion.LeftMoveBtn)
  left_gesture.trigger = 0
  left_gesture.interval = 0
  left_gesture.onAction:Set(function()
    MoveReadyFruit(-1)
  end)
  local right_gesture = LongPressGesture.GetLongPressGesture(uis.Main.LeftRegion.RightMoveBtn)
  right_gesture.trigger = 0
  right_gesture.interval = 0
  right_gesture.onAction:Set(function()
    MoveReadyFruit(1)
  end)
  uis.Main.RightRegion.PutBtn.onClick:Set(controller.DropReadyFruit)
  local put_gesture = LongPressGesture.GetLongPressGesture(uis.Main.RightRegion.PutBtn)
  put_gesture.trigger = 0
  put_gesture.interval = 0
  put_gesture.onAction:Set(controller.DropReadyFruit)
end

function Activity2MiniGameWindow.OnClose()
  uis = nil
  contentPane = nil
  aimingline = nil
  goLoaderLookup = nil
  textEffect = nil
  combinedEffect = nil
  combinedTransform = nil
  winklist = nil
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  if controller then
    controller.Release()
  end
  controller = nil
end

function Activity2MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity2_MiniGame.RESET then
    controller.Release()
    StartGame()
  elseif msgId == WindowMsgEnum.Activity2_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshScores()
  end
end

return Activity2MiniGameWindow
