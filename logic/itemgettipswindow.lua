require("Message_ItemGetTipsWindowByName")
local ItemGetTipsWindow = {}
local uis, contentPane, itemConfig, wayData, itemId, itemNeedCount, fromCardId, isJump, jumpData, notShowWay

function ItemGetTipsWindow.ReInitData()
end

function ItemGetTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ItemGetTipsWindow.package, WinResConfig.ItemGetTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_ItemGetTipsWindowUis(contentPane)
    local msg = bridgeObj.argTable[1]
    itemId = msg.id
    notShowWay = msg.notShowWay
    if msg.jump then
      isJump = true
    else
      isJump = false
    end
    itemNeedCount = msg.needCount
    fromCardId = msg.fromCardId
    itemConfig = TableData.GetConfig(itemId, "BaseItem") or TableData.GetConfig(itemId, "BaseSound") or TableData.GetConfig(itemId, "BaseGuildHeadIcon")
    local isBadge
    if nil == itemConfig then
      itemConfig = TableData.GetConfig(itemId, "BaseBadge")
      isBadge = true
    end
    if itemConfig then
      ItemGetTipsWindow.UpdateInfo(isBadge)
    end
    ItemGetTipsWindow.InitBtn()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.GET_ITEM_IN)
  end)
end

function ItemGetTipsWindow.UpdateInfo(isBadge)
  uis.Main.NameTxt.text = itemConfig.name()
  if isBadge then
    uis.Main.ItemGetTipsNumber.NumberTxt.text = T(935, ActorData.GetBadgeCount(itemConfig.id))
    
    function uis.Main.WordList.itemRenderer(i, item)
      if itemConfig.des then
        UIUtil.SetText(item, itemConfig.des(), "WordTxt")
      end
    end
    
    uis.Main.WordList.numItems = 1
  else
    uis.Main.ItemGetTipsNumber.NumberTxt.text = T(935, ActorData.GetItemCount(itemConfig.id))
    
    function uis.Main.WordList.itemRenderer(i, item)
      UIUtil.SetText(item, itemConfig.remark and itemConfig.remark() or "", "WordTxt")
      if itemConfig.event_des then
        UIUtil.SetText(item, itemConfig.event_des and itemConfig.event_des() or "")
      elseif itemConfig.des then
        UIUtil.SetText(item, itemConfig.des and itemConfig.des() or "")
      end
    end
    
    uis.Main.WordList.numItems = 1
    if itemConfig.limitTime and itemConfig.limitTime ~= "" then
      local newStr = string.gsub(itemConfig.limitTime, "D", T(1551))
      uis.Main.ItemGetTime.TimeTxt.text = newStr
      ChangeController(uis.Main.c3Ctr, 1)
    else
      ChangeController(uis.Main.c3Ctr, 0)
    end
  end
  ChangeUIController(uis.Main.root, "c2", itemConfig.own_show and 1 == itemConfig.own_show and 1 or 0)
  uis.Main.PicLoaderr.url = UIUtil.GetResUrl(itemConfig.icon)
  uis.Main.Way.NameTxt.text = T(841)
  if true == notShowWay or 1 == itemConfig.go_to_type then
    uis.Main.c1Ctr.selectedIndex = 1
  else
    if itemConfig.go_to_id then
      ItemGetTipsWindow.GetGoToData()
    else
      uis.Main.Way.WordTxt.text = T(711)
      uis.Main.Way.SubtitleTxt.text = T(842)
      uis.Main.Way.c1Ctr.selectedIndex = 1
    end
    uis.Main.c1Ctr.selectedIndex = 0
  end
end

local SortFun = function(a, b)
  return a.sort > b.sort
end
local SortClientGoTo = function()
  if #wayData > 1 then
    table.sort(wayData, SortFun)
  end
end

function ItemGetTipsWindow.GetGoToData()
  local tb = {}
  for i, v in pairs(itemConfig.go_to_id) do
    local data = TableData.GetConfig(v, "BaseClientGoTo")
    if data then
      table.insert(tb, data)
    end
  end
  ItemGetTipsWindow.StageIsUnlock(tb)
end

function ItemGetTipsWindow.StageIsUnlock(goToData)
  jumpData = goToData
  local stageIds = {}
  local lockIds = {}
  wayData = {}
  for i, v in pairs(goToData) do
    if v.go_to_stage then
      if AdventureData.GetPassedStageInfo(v.go_to_stage) then
        table.insert(wayData, v)
      else
        lockIds[v.go_to_stage] = v
        table.insert(stageIds, v.go_to_stage)
      end
    elseif v.go_to_feature and EnterClampUtil.WhetherToEnter(v.go_to_feature, false) then
      table.insert(wayData, v)
    end
  end
  if #stageIds > 0 then
    ld("Adventure", function()
      AdventureService.GetOpenStagesReq(stageIds, function(param)
        local ids = param.openStageIds
        if ids then
          for i, v in pairs(ids) do
            table.insert(wayData, lockIds[v])
          end
        end
        if 2 == itemConfig.go_to_type then
          ItemGetTipsWindow.ShowAllGoTo()
        else
          SortClientGoTo()
          ItemGetTipsWindow.ShowGoTo()
        end
      end)
    end)
  elseif 2 == itemConfig.go_to_type then
    ItemGetTipsWindow.ShowAllGoTo()
  else
    SortClientGoTo()
    ItemGetTipsWindow.ShowGoTo()
  end
end

function ItemGetTipsWindow.ShowAllGoTo()
  local IsUnlock = function(id)
    for i, v in pairs(wayData) do
      if v.id == id then
        return true
      end
    end
  end
  local GetDataByType = function()
    local newTb = {}
    local shopTb = {}
    for i = 1, #jumpData do
      if 0 == jumpData[i].type then
        table.insert(newTb, jumpData[i])
      elseif 1 == jumpData[i].type then
        table.insert(shopTb, jumpData[i])
      end
    end
    return newTb, shopTb
  end
  local GetJumpList = function(listData)
    if #listData > 2 then
      local newTb = {}
      local tempIndex
      for i = 1, #listData do
        if IsUnlock(listData[i].id) then
          tempIndex = i
        elseif tempIndex then
          table.insert(newTb, listData[tempIndex])
          table.insert(newTb, listData[i])
          return newTb
        end
      end
      if tempIndex then
        table.insert(newTb, listData[#listData - 1])
        table.insert(newTb, listData[#listData])
        return newTb
      else
        table.insert(newTb, listData[1])
        table.insert(newTb, listData[2])
        return newTb
      end
    else
      return listData
    end
  end
  local GetShopData = function(listData)
    if 0 == #listData then
      return nil
    end
    if #listData > 1 then
      local newTb = {}
      local tempIndex
      for i = 1, #listData do
        if IsUnlock(listData[i].id) then
          tempIndex = i
        elseif tempIndex then
          return listData[i]
        end
      end
      if tempIndex then
        return listData[#listData]
      end
    else
      return listData[1]
    end
  end
  local itemJumpData, shopJumpData = GetDataByType()
  jumpData = GetJumpList(itemJumpData)
  local shopJump = GetShopData(shopJumpData)
  if shopJump then
    table.insert(jumpData, 1, shopJump)
  end
  local proShow = {
    T(704),
    T(703),
    T(848)
  }
  
  function uis.Main.Way.GetStripList.itemRenderer(i, item)
    UIUtil.SetText(item, jumpData[i + 1].name(), "NameTxt")
    if jumpData[i + 1].pro_show then
      ChangeUIController(item, "c1", 1)
      UIUtil.SetText(item:GetChild("ItemLabelWord"), proShow[jumpData[i + 1].pro_show], "NameTxt")
    elseif type(jumpData[i + 1].remark) == "function" then
      ChangeUIController(item, "c1", 2)
      UIUtil.SetText(item, jumpData[i + 1].remark(), "WordTxt")
    else
      ChangeUIController(item, "c1", 0)
    end
    if jumpData[i + 1].type then
      ChangeUIController(item, "c2", jumpData[i + 1].type)
    end
    if IsUnlock(jumpData[i + 1].id) and EnterClampUtil.WhetherToEnter(jumpData[i + 1].go_to_feature, false) then
      ChangeUIController(item, "lock", 0)
    else
      local lvLock, lockLv = ItemGetTipsWindow.GetCanLvLock(jumpData[i + 1].go_to_stage)
      if lvLock then
        UIUtil.SetText(item:GetChild("GetStripLock"), T(954), "WordTxt")
      elseif lockLv then
        UIUtil.SetText(item:GetChild("GetStripLock"), T(1303, lockLv), "WordTxt")
      end
      ChangeUIController(item, "lock", 1)
    end
    local featureData = TableData.GetConfig(jumpData[i + 1].go_to_feature, "BaseFeature")
    local closeFun = function()
      ItemGetTipsWindow.CloseWindow()
    end
    if featureData and jumpData[i + 1] then
      CurrencyReturnWindow.SetJumpFun(item, featureData, jumpData[i + 1], isJump, closeFun, {
        itemId = itemId,
        itemNeedCount = itemNeedCount,
        fromCardId = fromCardId
      })
    end
  end
  
  uis.Main.Way.GetStripList.numItems = #jumpData > 3 and 3 or #jumpData
end

function ItemGetTipsWindow.GetCanLvLock(go_to_stage)
  local tempStageData = TableData.GetConfig(go_to_stage, "BaseStage")
  if tempStageData and tempStageData.open_condition then
    local arr = Split(tempStageData.open_condition, "|")
    for i = 1, #arr do
      local condition = Split(arr[i], ":")
      if 2 == #condition then
        local id = tonumber(condition[1])
        if CONDITION_ENUM.LV == id then
          local lv = tonumber(condition[2])
          if lv > ActorData.GetLevel() then
            return false, lv
          end
        end
      end
    end
  end
  return true
end

function ItemGetTipsWindow.ShowGoTo()
  local proShow = {
    T(704),
    T(703),
    T(848)
  }
  
  function uis.Main.Way.GetStripList.itemRenderer(i, item)
    UIUtil.SetText(item, wayData[i + 1].name(), "NameTxt")
    if wayData[i + 1].pro_show then
      ChangeUIController(item, "c1", 1)
      UIUtil.SetText(item:GetChild("ItemLabelWord"), proShow[wayData[i + 1].pro_show], "NameTxt")
    else
      ChangeUIController(item, "c1", 0)
    end
    if wayData[i + 1].type then
      ChangeUIController(item, "c2", wayData[i + 1].type)
    end
    local featureData = TableData.GetConfig(wayData[i + 1].go_to_feature, "BaseFeature")
    local closeFun = function()
      ItemGetTipsWindow.CloseWindow()
    end
    if featureData and jumpData[i + 1] then
      CurrencyReturnWindow.SetJumpFun(item, featureData, jumpData[i + 1], isJump, closeFun, {
        itemId = itemId,
        itemNeedCount = itemNeedCount,
        fromCardId = fromCardId
      })
    end
  end
  
  uis.Main.Way.GetStripList.numItems = #wayData > 3 and 3 or #wayData
  uis.Main.c1Ctr.selectedIndex = #wayData > 0 and 0 or 1
end

function ItemGetTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(ItemGetTipsWindow.CloseWindow)
end

function ItemGetTipsWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.ItemGetTipsWindow.name)
end

function ItemGetTipsWindow.OnShown()
end

function ItemGetTipsWindow.OnHide()
end

function ItemGetTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  itemConfig = nil
  wayData = nil
  isJump = nil
  jumpData = nil
  notShowWay = nil
  itemId = nil
  itemNeedCount = nil
end

function ItemGetTipsWindow.HandleMessage(msgId, para)
end

return ItemGetTipsWindow
