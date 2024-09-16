require("Badge_BadgeDecomposeWindowByName")
local BadgeDecomposeWindow = {}
local uis, contentPane, jumpTb
local isPlayAnim = true
local curPartData, allSelect, selectItem, animTime, lastItemIndex, lastUid, backUpdate, reverseSort, itemExpSort, expPre
local ITEM_STATE_ENUM = {
  NONE = 0,
  SELECT_LOOK = 1,
  LOOK = 2,
  SELECT = 3
}

function BadgeDecomposeWindow.ReInitData()
end

function BadgeDecomposeWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BadgeDecomposeWindow.package, WinResConfig.BadgeDecomposeWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    backUpdate = bridgeObj.argTable[1]
    uis = GetBadge_BadgeDecomposeWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.HOME_BADGE)
    BadgeDecomposeWindow.InitDecomposeData()
    BadgeDecomposeWindow.InitBtn()
    BadgeDecomposeWindow.UpdateInfo()
    BadgeDecomposeWindow.InitText()
  end)
end

function BadgeDecomposeWindow.UpdateInfo()
  selectItem = {}
  local list = uis.Main.DecomposeList.ItemList
  list:SetVirtual()
  list.itemRenderer = BadgeDecomposeWindow.PartListItem
  local offsetWidth = list.width % list.defaultItemSize.x
  if offsetWidth >= 0 then
    uis.Main.DecomposeList.root:SetSize(uis.Main.DecomposeList.root.width - offsetWidth + 10, uis.Main.DecomposeList.root.height)
  end
  local lastIndex = 0
  for i = 1, 4 do
    local btn = uis.Main.DecomposeList.DecomposeTabRegion[string.format("Tab%dBtn", i)]
    if btn then
      if 1 == i then
        ChangeUIController(btn, "c1", 3)
      else
        ChangeUIController(btn, "c1", i - 2)
      end
      btn.onClick:Set(function()
        if i == lastIndex then
          return
        end
        lastIndex = i
        ChangeController(uis.Main.DecomposeInfo.c1Ctr, 0)
        BadgeDecomposeWindow.StopAnim()
        isPlayAnim = true
        uis.Main.DecomposeList.AllChoiceBtn.selected = false
        allSelect = false
        selectItem = {}
        if BadgeData.IsScreen() then
          curPartData = BadgeData.GetDefaultScreeningResult(i - 1, nil, reverseSort, true)
        else
          curPartData = BadgeData.GetBadgeByPart(i - 1, nil, reverseSort, true)
        end
        list.numItems = BadgeDecomposeWindow.GetListMinLen()
        isPlayAnim = nil
        BadgeDecomposeWindow.ShowNum()
        BadgeDecomposeWindow.GetClearNew(1 == i)
      end)
    end
    if 1 == i then
      btn.onClick:Call()
    end
  end
end

function BadgeDecomposeWindow.GetClearNew(all)
  local new = {}
  for i, v in pairs(curPartData) do
    if v.info and v.info.isNew then
      table.insert(new, v.info.badgeUid)
    end
  end
  if #new > 0 then
    BadgeService.ClearBadgeNewTagReq(new, all)
  end
end

function BadgeDecomposeWindow.GetListMinLen()
  local len = #curPartData
  if len > 0 then
    len = math.max(len, 12)
  end
  return len
end

function BadgeDecomposeWindow.PartListItem(i, item)
  if nil == curPartData[i + 1] then
    item.alpha = 0
    return
  end
  item.alpha = 1
  local data = curPartData[i + 1].data
  local info = curPartData[i + 1].info
  local icon = item:GetChild("Icon")
  selectItem[info.badgeUid] = selectItem[info.badgeUid] or 0
  ChangeUIController(icon, "c4", selectItem[info.badgeUid])
  BadgeMgr.ShowBadgeItem(icon, data, info)
  icon.onClick:Set(function()
    ChangeUIController(icon, "new", 0)
    if curPartData[i + 1].info then
      curPartData[i + 1].info.isNew = false
    end
    if lastItemIndex and lastUid and lastItemIndex ~= i then
      if selectItem[lastUid] == ITEM_STATE_ENUM.SELECT_LOOK then
        selectItem[lastUid] = ITEM_STATE_ENUM.SELECT
      elseif selectItem[lastUid] == ITEM_STATE_ENUM.LOOK then
        selectItem[lastUid] = ITEM_STATE_ENUM.NONE
      end
      uis.Main.DecomposeList.ItemList:RefreshVirtualList()
    end
    if selectItem[info.badgeUid] == ITEM_STATE_ENUM.SELECT_LOOK or selectItem[info.badgeUid] == ITEM_STATE_ENUM.SELECT then
      selectItem[info.badgeUid] = ITEM_STATE_ENUM.LOOK
    elseif info.locked then
      selectItem[info.badgeUid] = ITEM_STATE_ENUM.LOOK
      FloatTipsUtil.ShowWarnTips(T(1255))
    else
      selectItem[info.badgeUid] = ITEM_STATE_ENUM.SELECT_LOOK
    end
    lastItemIndex = i
    lastUid = info.badgeUid
    ChangeUIController(icon, "c4", selectItem[info.badgeUid])
    BadgeMgr.ShowBadgeTextInfo(uis.Main.DecomposeInfo, data, info)
    ChangeController(uis.Main.DecomposeInfo.c1Ctr, 1)
    BadgeDecomposeWindow.ShowNum()
  end)
  if isPlayAnim then
    icon.alpha = 0
    local childIndex = uis.Main.DecomposeList.ItemList:ItemIndexToChildIndex(i)
    animTime[item] = PlayUITrans(item, "up", function()
      animTime[item] = nil
      icon.alpha = 1
    end, childIndex * 0.01)
  else
    icon.alpha = 1
  end
end

function BadgeDecomposeWindow.InitDecomposeData()
  itemExpSort = {}
  local str = TableData.GetConfig(70010031, "BaseFixed").array_value
  if str then
    local arr = Split(str, "|")
    local itemData
    if arr then
      for i = 1, #arr do
        local id = tonumber(arr[i])
        itemData = TableData.GetConfig(id, "BaseItem")
        if itemData then
          itemExpSort[i] = {
            id = id,
            cost = tonumber(itemData.effect_value)
          }
        end
      end
    end
  end
  expPre = TableData.GetConfig(70010030, "BaseFixed").int_value
  expPre = expPre / 100
end

function BadgeDecomposeWindow.GetDecomposeItem(uid)
  local numTb = {}
  local info, badgeData, tempId
  local GetInitItem = function()
    if badgeData and badgeData.change_item then
      for i = 1, #badgeData.change_item do
        local arr = Split(badgeData.change_item[i], ":")
        if 3 == #arr then
          tempId = tonumber(arr[2])
          numTb[tempId] = tonumber(arr[3]) + (numTb[tempId] or 0)
        end
      end
    end
  end
  local tatalExp = 0
  local gold = 0
  for _, v in pairs(uid) do
    info = ActorData.GetBadgeInfoByUid(v)
    if info then
      badgeData = TableData.GetConfig(info.badgeId, "BaseBadge")
      GetInitItem()
      if info.level > 0 or info.exp > 0 then
        local upDataId = badgeData.grow_model_id * 1000 + info.level
        tatalExp = tatalExp + BadgeDecomposeWindow.GetBadgeExp(info, upDataId)
      end
    end
  end
  local fixedData = TableData.GetConfig(70010038, "BaseFixed")
  if fixedData and tatalExp > 0 and fixedData.int_value then
    gold = tatalExp * (fixedData.int_value / 100)
  end
  tatalExp = tatalExp * expPre
  for i = 1, #itemExpSort do
    if tatalExp >= itemExpSort[i].cost then
      tempId = itemExpSort[i].id
      local num = math.floor(tatalExp / itemExpSort[i].cost)
      numTb[tempId] = num + (numTb[tempId] or 0)
      tatalExp = tatalExp - num * itemExpSort[i].cost
    end
  end
  local new = {}
  for i, v in pairs(numTb) do
    table.insert(new, {id = i, num = v})
  end
  if gold >= 1 then
    table.insert(new, {
      id = COMMON_ITEM_ID.GAME_COIN,
      num = UIUtil.GetFormatCount(math.floor(gold))
    })
  end
  if #new > 1 then
    local tempSort = {}
    for i, v in pairs(new) do
      local config = TableData.GetConfig(v.id, "BaseItem")
      if config then
        tempSort[v.id] = config.sort or 0
      else
        tempSort[v.id] = 0
      end
    end
    table.sort(new, function(a, b)
      return tempSort[a.id] > tempSort[b.id]
    end)
  end
  return new
end

function BadgeDecomposeWindow.GetBadgeExp(info, upDataId)
  local configData = TableData.GetTable("BaseBadgeLevelUp")
  local tatalExp = 0
  if configData[upDataId] then
    tatalExp = info.exp
    local id = upDataId - 1
    while configData[id] and 0 ~= configData[id].next_exp do
      tatalExp = tatalExp + configData[id].next_exp
      id = id - 1
    end
  end
  return tatalExp
end

function BadgeDecomposeWindow.ShowNum()
  local new = BadgeDecomposeWindow.GetSelectUid()
  uis.Main.DecomposeList.ChoiceNumberTxt.text = T(1248, #new, #curPartData)
  if #new > 0 then
    local list = uis.Main.DecomposeList.DecomposeResult.root:GetChild("Item")
    local items = BadgeDecomposeWindow.GetDecomposeItem(new)
    if list then
      local width = 0
      
      function list.itemRenderer(i, item)
        width = width + item.width + list.columnGap
        UIUtil.ShowItemFrame(items[i + 1].id, item:GetChild("RewardItem"), items[i + 1].num)
      end
      
      list.numItems = #items
      list:SetSize(width - list.columnGap, list.height)
    end
    ChangeController(uis.Main.DecomposeList.c1Ctr, 1)
  else
    ChangeController(uis.Main.DecomposeList.c1Ctr, 0)
  end
  uis.Main.DecomposeList.AllChoiceBtn.selected = #new == #curPartData
end

function BadgeDecomposeWindow.StopAnim()
  if animTime then
    for i, v in pairs(animTime) do
      v:Stop(true, true)
    end
  end
  animTime = {}
end

function BadgeDecomposeWindow.InitText()
  uis.Main.DecomposeInfo.WordTxt.text = T(1184)
  uis.Main.DecomposeList.DecomposeResult.WordTxt.text = T(1198)
end

function BadgeDecomposeWindow.ShowSortBtnName()
  if BadgeData.sortType == BADGE_SORT_TYPE_ENUM.STAR then
    UIUtil.SetText(uis.Main.DecomposeList.ChoiceSort.ChoiceSortBtn, T(1217), "NameTxt")
  elseif BadgeData.sortType == BADGE_SORT_TYPE_ENUM.LEVEL then
    UIUtil.SetText(uis.Main.DecomposeList.ChoiceSort.ChoiceSortBtn, T(1230), "NameTxt")
  end
end

function BadgeDecomposeWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.BadgeDecomposeWindow.name, uis.Main.CurrencyReturn, nil, function()
    BadgeData.InitScreeningData()
    BadgeData.InitSortData()
    if backUpdate then
      backUpdate = nil
      UIMgr:SendWindowMessage(WinResConfig.BadgeWindow.name, WindowMsgEnum.BadgeWindow.CLOSE_DECOMPOSE)
    end
    UIMgr:CloseWindow(WinResConfig.BadgeDecomposeWindow.name)
  end)
  UIUtil.SetText(uis.Main.DecomposeList.ChoiceBtn, T(1193), "NameTxt")
  uis.Main.DecomposeList.ChoiceBtn.onClick:Set(function()
    OpenWindow(WinResConfig.BadgeScreenWindow.name)
  end)
  BadgeDecomposeWindow.ShowSortBtnName()
  uis.Main.DecomposeList.ChoiceSort.ChoiceSortBtn.onClick:Set(function()
    OpenWindow(WinResConfig.BadgeFilterSortWindow.name)
  end)
  UIUtil.SetText(uis.Main.DecomposeList.AllChoiceBtn, T(1196), "NameTxt")
  uis.Main.DecomposeList.AllChoiceBtn.onClick:Set(function()
    allSelect = uis.Main.DecomposeList.AllChoiceBtn.selected
    if allSelect then
      for i, v in pairs(curPartData) do
        if v.info and v.info.locked == false and (selectItem[v.info.badgeUid] == nil or selectItem[v.info.badgeUid] == ITEM_STATE_ENUM.NONE or selectItem[v.info.badgeUid] == ITEM_STATE_ENUM.LOOK) then
          selectItem[v.info.badgeUid] = ITEM_STATE_ENUM.SELECT
        end
      end
    else
      for i, v in pairs(selectItem) do
        if v == ITEM_STATE_ENUM.SELECT_LOOK or v == ITEM_STATE_ENUM.LOOK then
          selectItem[i] = ITEM_STATE_ENUM.LOOK
        else
          selectItem[i] = ITEM_STATE_ENUM.NONE
        end
      end
    end
    uis.Main.DecomposeList.ItemList:RefreshVirtualList()
    BadgeDecomposeWindow.ShowNum()
  end)
  uis.Main.DecomposeList.AllChoiceBtn.selected = allSelect
  UIUtil.SetText(uis.Main.DecomposeList.DecomposeSrueBtn, T(1197), "NameTxt")
  uis.Main.DecomposeList.DecomposeSrueBtn.onClick:Set(function()
    local allUid = BadgeDecomposeWindow.GetSelectUid()
    if #allUid > 0 then
      local sendAll = false
      if 0 == uis.Main.DecomposeList.DecomposeTabRegion.c1Ctr.selectedIndex and allSelect and not BadgeData.IsScreen() and #allUid == #curPartData then
        sendAll = true
      end
      if BadgeDecomposeWindow.IsSatrMax(allUid) then
        MessageBox.Show(T(1258), {
          touchCallback = function()
            BadgeService.DecomposeBadgeReq(sendAll, allUid, function()
              ChangeController(uis.Main.DecomposeInfo.c1Ctr, 0)
            end)
          end
        }, {})
      else
        BadgeService.DecomposeBadgeReq(sendAll, allUid, function()
          ChangeController(uis.Main.DecomposeInfo.c1Ctr, 0)
        end)
      end
    else
      FloatTipsUtil.ShowWarnTips(T(1257))
    end
  end)
  local sortBtn = uis.Main.DecomposeList.ChoiceSort.SortBtn
  reverseSort = sortBtn.selected
  sortBtn.onClick:Set(function()
    reverseSort = sortBtn.selected
    BadgeDecomposeWindow.StopAnim()
    curPartData = table.reverseTable(curPartData)
    uis.Main.DecomposeList.ItemList.numItems = BadgeDecomposeWindow.GetListMinLen()
  end)
end

function BadgeDecomposeWindow.IsSatrMax(uid)
  local data, info
  for i, v in pairs(uid) do
    info = ActorData.GetBadgeInfoByUid(v)
    if info then
      data = TableData.GetConfig(info.badgeId, "BaseBadge")
      if data and data.star >= 4 then
        return true
      end
    end
  end
end

function BadgeDecomposeWindow.GetSelectUid()
  local new = {}
  for i, v in pairs(selectItem) do
    if v == ITEM_STATE_ENUM.SELECT or v == ITEM_STATE_ENUM.SELECT_LOOK then
      table.insert(new, i)
    end
  end
  return new
end

function BadgeDecomposeWindow.UpdateItemList()
  for i, v in pairs(curPartData) do
    v.info = ActorData.GetBadgeInfoByUid(v.info.badgeUid)
    if v.info.locked and selectItem[v.info.badgeUid] == ITEM_STATE_ENUM.SELECT_LOOK then
      selectItem[v.info.badgeUid] = ITEM_STATE_ENUM.LOOK
    end
  end
  uis.Main.DecomposeList.ItemList:RefreshVirtualList()
  BadgeDecomposeWindow.ShowNum()
end

function BadgeDecomposeWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.BadgeWindow.DECOMPOSE_BADGE then
    uis.Main.DecomposeList.AllChoiceBtn.selected = false
    allSelect = false
    selectItem = {}
    for i = #curPartData, 1, -1 do
      curPartData[i].info = ActorData.GetBadgeInfoByUid(curPartData[i].info.badgeUid)
      if curPartData[i].info == nil then
        table.remove(curPartData, i)
      end
    end
    uis.Main.DecomposeList.ItemList.numItems = BadgeDecomposeWindow.GetListMinLen()
    BadgeDecomposeWindow.ShowNum()
  elseif msgId == WindowMsgEnum.BadgeWindow.SCREENING_SHOW then
    local c1Ctr = uis.Main.DecomposeList.DecomposeTabRegion.c1Ctr
    curPartData = BadgeData.GetDefaultScreeningResult(c1Ctr.selectedIndex, nil, reverseSort, true)
    if allSelect then
      selectItem = {}
      for i, v in pairs(curPartData) do
        if v.info and false == v.info.locked and (selectItem[v.info.badgeUid] == nil or selectItem[v.info.badgeUid] == ITEM_STATE_ENUM.NONE or selectItem[v.info.badgeUid] == ITEM_STATE_ENUM.LOOK) then
          selectItem[v.info.badgeUid] = ITEM_STATE_ENUM.SELECT
        end
      end
    end
    isPlayAnim = true
    uis.Main.DecomposeList.ItemList.selectedIndex = -1
    uis.Main.DecomposeList.ItemList.numItems = BadgeDecomposeWindow.GetListMinLen()
    BadgeDecomposeWindow.ShowNum()
    isPlayAnim = nil
    BadgeDecomposeWindow.ShowSortBtnName()
  elseif msgId == WindowMsgEnum.BadgeWindow.REFRESH_LIST then
    BadgeDecomposeWindow.UpdateItemList()
  end
end

function BadgeDecomposeWindow.OnClose()
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  isPlayAnim = true
  curPartData = nil
  allSelect = nil
  animTime = nil
  selectItem = nil
  lastItemIndex = nil
  reverseSort = nil
  itemExpSort = nil
  expPre = nil
end

return BadgeDecomposeWindow
