ActorData = {}
local _info = {}
local _itemInfo = {}
local _cardList = {}
local _badgeList = {}
local _cardTeamList = {}
local _badgeSyncKey = 0
local _itemSyncKey = 0
local _cardSyncKey = 0
local _storyList = {}
local _guideInfo = {}
local _openFeature = {}
local _cachedBubbleInfo = {}
local _headItemNew = {}

function ActorData.ClearData()
  _info = {}
  _itemInfo = {}
  _cardList = {}
  _badgeList = {}
  _cardTeamList = {}
  _storyList = {}
  _openFeature = {}
  _guideInfo = {}
  _itemSyncKey = 0
  _cardSyncKey = 0
  _badgeSyncKey = 0
  _cachedBubbleInfo = {}
  _headItemNew = {}
  OprRecordUtil.Clear()
end

function ActorData.SaveActorData(data)
  if data then
    _info = data
    ActorMgr.ShowUin()
  end
end

function ActorData.UpdateActorInfo(data)
  if data.level > ActorData.GetLevel() then
    ActorData.SaveActorData(data)
    EnterClampUtil.CheckNewFeature()
    UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_UPDATE_FUNC_ENTER)
  else
    ActorData.SaveActorData(data)
  end
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_ACTOR_INFO_CHANGE)
end

function ActorData.SaveFaceId(faceId)
  if faceId then
    _info.faceId = faceId
    UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_ACTOR_INFO_CHANGE)
  end
end

function ActorData.SaveActorHead(actorHead)
  if actorHead then
    _info.actorHead = actorHead
    UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_ACTOR_INFO_CHANGE)
  end
end

function ActorData.SaveItemData(data)
  _itemInfo = data.items
  _itemSyncKey = data.syncKey
end

function ActorData.SaveCardData(data)
  _cardSyncKey = data.syncKey
  local cardList = data.cardList
  for _, v in ipairs(cardList) do
    ActorData.AddCard(v)
  end
end

function ActorData.SetCardSyncKey(syncKey)
  _cardSyncKey = syncKey
end

function ActorData.SetBadgeSyncKey(syncKey)
  _badgeSyncKey = syncKey
end

function ActorData.SaveAllTeamData(data)
  _cardTeamList = data.teams
end

function ActorData.SaveStoryUnlockData(data)
  for i, v in pairs(data.storyList) do
    _storyList[v] = 0
  end
end

function ActorData.SaveGuideProgress(data)
  if data.finishedGuides then
    _guideInfo = data.finishedGuides
    print("从服务器获取引导步骤：", data.guideId, data.step)
  end
end

function ActorData.UpdateGuideProgress(data)
  if data.guideId and data.step then
    local isFind = false
    for i, v in ipairs(_guideInfo) do
      if v.guideId == data.guideId then
        if v.steps and not table.contain(v.steps, data.step) then
          table.insert(_guideInfo[i].steps, data.step)
        end
        return
      end
    end
    if false == isFind then
      local newInfo = {
        uin = ActorData.GetUin(),
        guideId = data.guideId,
        steps = {
          data.step
        },
        stamp = LoginData.GetCurServerTime()
      }
      table.insert(_guideInfo, newInfo)
    end
  end
  print("从服务器获取引导步骤：", data.guideId, data.step)
end

function ActorData.SaveOpenFeature(msg)
  if msg then
    local featureIds = msg.featureIds
    if #featureIds > 0 then
      local openFeatureIds = msg.openFeatureIds
      for _, v in ipairs(featureIds) do
        for _, openId in ipairs(openFeatureIds) do
          if v == openId then
            _openFeature[v] = true
            EnterClampUtil.RemoveNeedGetInfoList(v)
            break
          end
        end
        if true ~= _openFeature[v] then
          _openFeature[v] = false
        end
      end
    end
  end
end

function ActorData.UpdateOpenFeature(addOpenId)
  if addOpenId then
    for i, v in pairs(addOpenId) do
      if nil == _openFeature[v] or false == _openFeature[v] then
        _openFeature[v] = true
      end
    end
  end
end

function ActorData.UpdateItem(data)
  if data.cliReq ~= true and data.lastSyncKey ~= _itemSyncKey then
    for _, v in ipairs(data.items) do
      ActorData.UpdateOneItem(v)
    end
    for _, itemUid in ipairs(data.delItemUidLst) do
      ActorData.DeleteOneItem(itemUid)
    end
    _itemSyncKey = 0
    ActorService.SyncItemsReq()
    return false
  else
    local updateBol = false
    for _, v in ipairs(data.items) do
      ActorData.UpdateOneItem(v)
      updateBol = true
    end
    for _, itemUid in ipairs(data.delItemUidLst) do
      ActorData.DeleteOneItem(itemUid)
      updateBol = true
    end
    _itemSyncKey = data.syncKey
    if updateBol then
      return true
    end
  end
end

function ActorData.UpdateCard(data)
  local addCardList = data.addCardList
  if addCardList then
    for _, v in ipairs(addCardList) do
      ActorData.AddCard(v)
    end
  end
  local delCardUidList = data.delCardUidList
  if delCardUidList then
    for _, uid in ipairs(delCardUidList) do
      ActorData.DeleteCard(uid)
    end
  end
  ActorData.SetCardSyncKey(data.syncKey)
end

function ActorData.AddCard(card)
  local config = TableData.GetConfig(card.cardId, "BaseCard")
  if nil == config then
    return
  end
  local isFind = false
  for i, v in ipairs(_cardList) do
    if v.cardUid == card.cardUid then
      isFind = true
      _cardList[i] = card
      break
    end
  end
  if false == isFind then
    table.insert(_cardList, card)
  end
end

function ActorData.DeleteCard(uid)
  for i, v in ipairs(_cardList) do
    if v.cardUid == uid then
      table.remove(_cardList, i)
      return
    end
  end
end

function ActorData.UpdateOneItem(itemInfo)
  local isFind = false
  for i, v in ipairs(_itemInfo) do
    if v.itemUid == itemInfo.itemUid then
      _itemInfo[i] = itemInfo
      return
    end
  end
  if false == isFind then
    table.insert(_itemInfo, itemInfo)
  end
end

function ActorData.DeleteOneItem(itemUid)
  for i, v in ipairs(_itemInfo) do
    if v.itemUid == itemUid then
      table.remove(_itemInfo, i)
      return
    end
  end
end

function ActorData.GetItemInfoById(itemId)
  for _, v in ipairs(_itemInfo) do
    if v.itemId == itemId then
      return v
    end
  end
end

function ActorData.GetItemInfoByUid(Uid)
  for _, v in ipairs(_itemInfo) do
    if v.itemUid == Uid then
      return v
    end
  end
end

function ActorData.GetItemCount(itemId)
  local count = 0
  for _, v in ipairs(_itemInfo) do
    if v.itemId == itemId then
      count = count + v.count
    end
  end
  return count
end

function ActorData.GetItemCountByUid(itemUid)
  local count = 0
  for _, v in ipairs(_itemInfo) do
    if v.itemUid == itemUid then
      count = count + v.count
    end
  end
  return count
end

function ActorData.GetItemCountByExpire(itemId)
  local count = 0
  local time, uid
  for _, v in ipairs(_itemInfo) do
    if v.itemId == itemId and v.count > 0 then
      if nil == time then
        count = v.count
        time = v.expireStamp
        uid = v.itemUid
      elseif time > v.expireStamp then
        count = v.count
        time = v.expireStamp
        uid = v.itemUid
      end
    end
  end
  return count, uid
end

function ActorData.GetItemUid(itemId)
  for _, v in ipairs(_itemInfo) do
    if v.itemId == itemId then
      return v.itemUid
    end
  end
end

function ActorData.GetItemListByType(itemType)
  local list = {}
  local itemConfig
  for _, v in ipairs(_itemInfo) do
    if v.count > 0 then
      itemConfig = TableData.GetConfig(v.itemId, "BaseItem")
      if itemConfig and itemConfig.type == itemType then
        table.insert(list, {itemData = v, itemConfig = itemConfig})
      end
    end
  end
  table.sort(list, function(a, b)
    return a.itemConfig.sort < b.itemConfig.sort
  end)
  return list
end

function ActorData.InitHeadNew()
  local all = ActorData.GetItemListByType(ProtoEnum.ITEM_TYPE.HEAD_RECT_ITEM)
  for i = 1, #all do
    if all[i].itemData and all[i].itemData.itemId then
      _headItemNew[all[i].itemData.itemId] = true
    end
  end
  local itemConfig
  for _, v in ipairs(_itemInfo) do
    if v.count > 0 then
      itemConfig = TableData.GetConfig(v.itemId, "BaseItem")
      if itemConfig and itemConfig.type == ProtoEnum.ITEM_TYPE.EMOJI then
        _headItemNew[v.itemId] = true
      end
    end
  end
end

function ActorData.CanHeadIsNew(itemId)
  return _headItemNew[itemId]
end

function ActorData.SaveHeadNew(itemId)
  _headItemNew[itemId] = true
end

function ActorData.SaveBadgeData(data)
  _badgeList = data.badges
  _badgeSyncKey = data.syncKey
end

function ActorData.UpdateOneBadgeData(data)
  if data and data.badgeUid then
    local isFind = false
    for i, v in ipairs(_badgeList) do
      if v.badgeUid == data.badgeUid then
        _badgeList[i] = data
        return
      end
    end
    if false == isFind then
      table.insert(_badgeList, data)
    end
  end
end

function ActorData.UpdateBadgeNew(data)
  local new = {}
  for i, v in pairs(data) do
    new[v] = true
  end
  local isFind = false
  for i, v in ipairs(_badgeList) do
    if new[v.badgeUid] then
      _badgeList[i].isNew = false
    end
  end
end

function ActorData.GetAllBadge()
  return _badgeList
end

function ActorData.GetBadgeInfoByUid(badgeUid)
  for i, v in pairs(_badgeList) do
    if v.badgeUid == badgeUid then
      return v
    end
  end
end

function ActorData.GetBadgeCount(badgeId)
  local count = 0
  for _, v in ipairs(_badgeList) do
    if v.badgeId == badgeId then
      count = count + 1
    end
  end
  return count
end

function ActorData.DeleteOneBadgeData(badgeUid)
  for i, v in ipairs(_badgeList) do
    if v.badgeUid == badgeUid then
      table.remove(_badgeList, i)
      return
    end
  end
end

function ActorData.GetItemSyncKey()
  return _itemSyncKey
end

function ActorData.GetCardSyncKey()
  return _cardSyncKey
end

function ActorData.GetBadgeSyncKey()
  return _badgeSyncKey
end

function ActorData.GetActorInfo()
  return _info
end

function ActorData.GetOpenId()
  return _info.openId
end

function ActorData.GetUin()
  return _info.uin
end

function ActorData.GetLevel()
  return _info.level
end

function ActorData.GetExp()
  return _info.exp
end

function ActorData.GetPower()
  return _info.power
end

function ActorData.GetName()
  return _info.name
end

function ActorData.GetFaceId()
  return _info.faceId
end

function ActorData.GetHeadInfo()
  return _info.actorHead
end

function ActorData.GetCreateStamp()
  return _info.createStamp
end

function ActorData.GetChangNameCount()
  return _info.changeNameCount
end

function ActorData.GetExpMax(level)
  level = level or _info.level
  local config = TableData.GetConfig(level, "BasePlayerLevelUp")
  return config.next_exp
end

function ActorData.GetGuideInfo()
  return _guideInfo
end

function ActorData.GetCardList()
  return _cardList
end

function ActorData.GetItems()
  return _itemInfo
end

function ActorData.GetAllTeam()
  return _cardTeamList
end

function ActorData.GetEnergyMax()
  local level = _info.level
  local config = TableData.GetConfig(level, "BasePlayerLevelUp")
  return config.max_energy
end

function ActorData.GetLoginDays()
  return _info.loginDays
end

function ActorData.GetStoryList()
  return _storyList
end

function ActorData.GetFeatureIsUnlock(featureId)
  return _openFeature[featureId]
end

function ActorData.GetRandomBubbleSoundId(fashionId, bubbleType, configIds)
  if bubbleType ~= BUBBLE_TYPE_ENUM.STANDBY then
    return configIds[math.random(1, #configIds)]
  end
  if 1 == #configIds then
    return configIds[1]
  end
  local cachedBubble = _cachedBubbleInfo[bubbleType]
  if nil == cachedBubble or cachedBubble.fashionId ~= fashionId then
    cachedBubble = {
      fashionId = fashionId,
      configIds = configIds,
      disruptedIds = table.randomSort(SimpleCopy(configIds))
    }
  end
  local ids = cachedBubble.disruptedIds
  local id = ids[#ids]
  table.remove(ids, #ids)
  if #ids <= 0 then
    ids = table.randomSort(SimpleCopy(configIds))
    local len = #ids
    if ids[len] == id then
      table.swapByIndex(ids, len - 1, len)
    end
  end
  cachedBubble.disruptedIds = ids
  _cachedBubbleInfo[bubbleType] = cachedBubble
  return id
end

function ActorData.GetRandomName()
  local config = TableData.GetTable("BaseNamePlayer")
  local nameList = {}
  for _, v in pairs(config) do
    table.insert(nameList, v)
  end
  table.sort(nameList, function(a, b)
    return a.id < b.id
  end)
  local randomNameIndex = math.random(1, #nameList)
  local randomName = nameList[randomNameIndex]
  randomName = randomName.name()
  if SensitiveWordsUtil.IsContainBlockedWord(randomName) == true then
    randomName = nameList[1].name()
  end
  return randomName
end
