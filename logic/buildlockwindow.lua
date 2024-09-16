require("Arena_BuildLockWindowByName")
local BuildLockWindow = {}
local uis, contentPane, buildingListData, mapListData

function BuildLockWindow.ReInitData()
end

function BuildLockWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BuildLockWindow.package, WinResConfig.BuildLockWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetArena_BuildLockWindowUis(contentPane)
    buildingListData = bridgeObj.argTable[1]
    mapListData = bridgeObj.argTable[2]
    local showBol = bridgeObj.argTable[3]
    BuildLockWindow.UpdateInfo()
    BuildLockWindow.InitBtn()
    BuildLockWindow.UpdateMap()
    if showBol[1] and showBol[2] then
      ChangeController(uis.Main.BuildLockTips.c2Ctr, 0)
    elseif showBol[1] and not showBol[2] then
      ChangeController(uis.Main.BuildLockTips.c2Ctr, 1)
    end
    if showBol[3] then
      ChangeController(uis.Main.BuildLockTips.c1Ctr, showBol[3])
    end
  end)
end

local GetUnLock = function(data)
  if data.use_rank then
    if ArenaData.Info.historyHighRank <= 0 then
      return false
    end
    return ArenaData.Info.historyHighRank <= data.use_rank
  end
  return true
end

function BuildLockWindow.UpdateInfo()
  local list = uis.Main.BuildLockTips.BuildLockTips.BuildList
  if buildingListData then
    local aLock, bLock
    table.sort(buildingListData, function(a, b)
      aLock = GetUnLock(a)
      bLock = GetUnLock(b)
      if aLock and bLock then
        return a.id < b.id
      elseif aLock and false == bLock then
        return true
      elseif false == aLock and bLock then
        return false
      elseif false == aLock and false == bLock then
        return a.id < b.id
      end
    end)
  end
  local page, maxPage
  
  function list.itemRenderer(i, item)
    local buildData = buildingListData[i + 1]
    local lock = GetUnLock(buildData)
    if lock then
      ChangeUIController(item, "c1", 0)
      UIUtil.SetText(item:GetChild("OpenState"), T(1334), "WordTxt")
    else
      if nil == page then
        page = i
      end
      ChangeUIController(item, "c1", 1)
      UIUtil.SetText(item:GetChild("LockState"), T(1333, buildData.use_rank), "WordTxt")
    end
    UIUtil.SetText(item, buildData.name(), "NameTxt")
    item:GetChild("BuildIconBg"):GetChild("PicLoader").url = UIUtil.GetResUrl(buildData.head_icon_square)
    local gesture = LongPressGesture.GetLongPressGesture(item)
    gesture.once = true
    gesture.holdRangeRadius = 1
    gesture.trigger = 1
    gesture.onAction:Set(function(data)
      Stage.inst:CancelClick(data.inputEvent.touchId)
      item.onClick:Call()
    end)
    item.onClick:Add(function()
      ld("Formation")
      OpenWindow(WinResConfig.FormationBuildTipsWindow.name, nil, buildData.id, nil, {
        arenaDefense = true,
        sceneType = ProtoEnum.SCENE_TYPE.ARENA
      })
    end)
    maxPage = i
  end
  
  list.numItems = #buildingListData
  if page then
    page = math.min(maxPage, page + 1)
    list:ScrollToView(page)
  end
end

function BuildLockWindow.UpdateMap()
  local list = uis.Main.BuildLockTips.MapLockTips.MapList
  if mapListData then
    local aLock, bLock
    table.sort(mapListData, function(a, b)
      aLock = GetUnLock(a)
      bLock = GetUnLock(b)
      if aLock and bLock then
        return a.id < b.id
      elseif aLock and false == bLock then
        return true
      elseif false == aLock and bLock then
        return false
      elseif false == aLock and false == bLock then
        return a.id < b.id
      end
    end)
  end
  local page, maxPage
  
  function list.itemRenderer(i, item)
    local mapData = mapListData[i + 1]
    local lock = GetUnLock(mapData)
    if lock then
      ChangeUIController(item, "c1", 0)
      UIUtil.SetText(item:GetChild("OpenState"), T(1334), "WordTxt")
    else
      if nil == page then
        page = i
      end
      ChangeUIController(item, "c1", 1)
      UIUtil.SetText(item:GetChild("LockState"), T(1333, mapData.use_rank), "WordTxt")
    end
    UIUtil.SetText(item, mapData.name(), "NameTxt")
    item:GetChild("MapIconBg"):GetChild("PicLoader").url = UIUtil.GetResUrl(mapData.icon)
    local gesture = LongPressGesture.GetLongPressGesture(item)
    gesture.once = true
    gesture.holdRangeRadius = 1
    gesture.trigger = 1
    gesture.onAction:Set(function(data)
      Stage.inst:CancelClick(data.inputEvent.touchId)
      item.onClick:Call()
    end)
    item.onClick:Add(function()
      OpenWindow(WinResConfig.MapTipsWindow.name, nil, mapData.id)
    end)
    maxPage = i
  end
  
  list.numItems = #mapListData
  if page then
    page = math.min(maxPage, page + 1)
    list:ScrollToView(page)
  end
end

function BuildLockWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.BuildLockWindow.name)
  end)
end

function BuildLockWindow.OnClose()
  uis = nil
  contentPane = nil
end

return BuildLockWindow
