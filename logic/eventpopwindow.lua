require("Abyss_EventPopWindowByName")
local EventPopWindow = {}
local uis, contentPane, argsTbl, eventGoCache, eventInfo, ensureCallback

function EventPopWindow.ReInitData()
end

function EventPopWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.EventPopWindow.package, WinResConfig.EventPopWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    argsTbl = bridgeObj.argTable
    eventInfo = argsTbl[1]
    ensureCallback = argsTbl[2]
    uis = GetAbyss_EventPopWindowUis(contentPane)
    EventPopWindow.UpdateInfo()
    EventPopWindow.InitBtn()
  end)
end

function EventPopWindow.UpdateInfo()
  ChangeUIController(uis.Main.EventTips.root, "c2", type(ensureCallback) == "function" and 0 or 1)
  local eventId = eventInfo.eventId
  local config = TableData.GetConfig(eventId, "BaseManorEvent")
  if "function" == type(config.name) then
    uis.Main.EventTips.NameTxt.text = config.name()
  else
    uis.Main.EventTips.NameTxt.text = "未配置" .. tostring(eventId)
  end
  if "function" == type(config.des) then
    uis.Main.EventTips.WordTxtTxt.text = config.des()
  else
    uis.Main.EventTips.WordTxtTxt.text = "未配置" .. tostring(eventId)
  end
  local eventSpend = uis.Main.EventTips.EventSpend
  if config.cost and _G.next(config.cost) then
    eventSpend.root.visible = true
    local desTxt = eventSpend.root:GetChild("n7")
    local str = ""
    for _, v in ipairs(config.cost) do
      local splits = Split(v, ":")
      local ownValue = ActorData.GetItemCount(tonumber(splits[2]))
      local costValue = splits[3]
      local threshold = TableData.GetConfig(70010802, "BaseFixed").int_value
      str = str .. string.format("%s[color=#ff6678](-%s)[/color]/%s", ownValue, costValue, threshold)
    end
    local n6 = eventSpend.root:GetChild("n6")
    n6.url = "ui://rsupm7zxw8nv47"
    desTxt.text = str
  else
    eventSpend.root.visible = false
  end
  local assetpath = config.spd
  if (eventInfo.type == AbyssExploreEventID.POSITIVE or eventInfo.type == AbyssExploreEventID.DAILY_RANDOM) and eventInfo.subtype == AbyssExploreSubEventID.BATTLE then
    assetpath = eventInfo.assetpath
  end
  if config.icon then
    uis.Main.EventTips.EventPic.PicLoader.url = UIUtil.GetResUrl(config.icon)
  elseif assetpath then
    if eventGoCache and not eventGoCache:IsNull() then
      ResourceManager.DestroyGameObject(eventGoCache)
      eventGoCache = nil
    end
    eventGoCache = ResourceManager.Instantiate(assetpath)
    local holder = uis.Main.EventTips.EventPic.PicShowHolder
    local isSpine = string.find(assetpath, "spine")
    if isSpine then
      SkeletonAnimationUtil.SetShaderEffectEnable(eventGoCache, false, true)
      SkeletonAnimationUtil.SetAnimation(eventGoCache, 0, SPINE_STATE_ENUM.IDLE, true)
    end
    if isSpine then
      local val = TableData.GetConfig(70010813, "BaseFixed").int_value
      local unitsPerPixel = StageCamera.main:GetComponent(typeof(CS.FairyGUI.StageCamera)).unitsPerPixel
      local world2Screen = unitsPerPixel * 100 * UIContentScaler.scaleFactor
      local scale = val * (eventInfo.scale or 1) * world2Screen
      local wrapper = UIUtil.SetObjectToUI(eventGoCache, holder, scale)
      local position = wrapper.position
      local bounds = SkeletonAnimationUtil.GetBounds(eventGoCache)
      local height = bounds.size.y / unitsPerPixel
      eventGoCache.transform.localPosition = Vector3(holder.width / 2, -((holder.height - height) / 2 + height), position.z)
    else
      local x, y, scaleRatio
      if eventInfo.type == AbyssExploreEventID.DAILY_RANDOM then
        scaleRatio = 16000
        x = holder.width / 2
        y = -holder.height
      else
        scaleRatio = 20000
        x = holder.width / 2
        y = -holder.height / 2
      end
      local wrapper = UIUtil.SetObjectToUI(eventGoCache, holder, scaleRatio)
      local z = wrapper.position.z
      eventGoCache.transform.localPosition = Vector3(x, y, z)
    end
  end
end

function EventPopWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.EventPopWindow.name)
  end)
  local subtype = eventInfo.subtype
  if type(ensureCallback) == "function" then
    local sureBtnTxt = uis.Main.EventTips.SureBtn:GetChild("NameTxt")
    local sureContent = ""
    if subtype == AbyssExploreSubEventID.TREASURE then
      sureContent = T(20001)
    elseif subtype == AbyssExploreSubEventID.BATTLE then
      sureContent = T(20002)
    elseif subtype == AbyssExploreSubEventID.DIALOGUE then
      sureContent = T(20007)
    end
    sureBtnTxt.text = sureContent
    uis.Main.EventTips.SureBtn.onClick:Set(function()
      local actionable = true
      local config = TableData.GetConfig(tonumber(eventInfo.eventId), "BaseManorEvent")
      if config.cost and _G.next(config.cost) then
        for _, v in ipairs(config.cost) do
          local splits = Split(v, ":")
          local ownValue = ActorData.GetItemCount(tonumber(splits[2]))
          local costValue = splits[3]
          if ownValue < tonumber(costValue) then
            actionable = false
            break
          end
        end
      end
      if actionable then
        UIMgr:CloseWindow(WinResConfig.EventPopWindow.name)
        TimerUtil.setTimeout(0.1, ensureCallback)
      else
        FloatTipsUtil.ShowWarnTips(T(20034))
      end
    end)
  end
end

function EventPopWindow.OnHide()
  AbyssExploreMapCtrl.EnableSearchPath(true)
end

function EventPopWindow.OnClose()
  uis = nil
  contentPane = nil
  if eventGoCache and not eventGoCache:IsNull() then
    ResourceManager.DestroyGameObject(eventGoCache)
    eventGoCache = nil
  end
end

function EventPopWindow.HandleMessage(msgId, para)
end

return EventPopWindow
