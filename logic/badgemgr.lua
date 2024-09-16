BadgeMgr = {}
BadgeMgr.mainAttributeCtr = {
  [1] = 0,
  [2] = 1,
  [3] = 2,
  [7] = 3,
  [8] = 4,
  [9] = 5,
  [11] = 6,
  [12] = 7,
  [13] = 8,
  [14] = 9
}
BadgeMgr.viceAttributeCtr = {
  [1] = 0,
  [4] = 1,
  [2] = 2,
  [5] = 3,
  [3] = 4,
  [6] = 5,
  [7] = 6,
  [8] = 7,
  [9] = 8,
  [10] = 9,
  [11] = 10,
  [12] = 11,
  [13] = 12
}
BadgeMgr.curCardId = 0
BadgeMgr.newTag = {}
local CheckSuit = function(wearBadgeUids, suitData, badgeData)
  local bol = table.contain(suitData.badge_ids, badgeData.id)
  local equip = {}
  equip[badgeData.type] = bol
  for i, v in pairs(wearBadgeUids) do
    local info = ActorData.GetBadgeInfoByUid(v)
    if info then
      local wearBadgeData = TableData.GetConfig(info.badgeId, "BaseBadge")
      if wearBadgeData and badgeData.type ~= wearBadgeData.type then
        equip[wearBadgeData.type] = table.contain(suitData.badge_ids, info.badgeId)
      end
    end
  end
  local num = 0
  for i, v in pairs(equip) do
    if v then
      num = num + 1
    end
  end
  return num >= suitData.equip_num
end

function BadgeMgr.ShowBadgeTextInfo(info, badgeData, badgeInfo, showNewTag)
  local info1 = info.DetailsInfo1
  if badgeData then
    info1.NameTxt.text = badgeData.name()
    info1.PartsTxt.text = BadgeData.GetBadgePartName(badgeData.type)
    BadgeMgr.ShowLevel(info1.LevelTxt, badgeInfo.level)
    ChangeController(info1.Lock.c1Ctr, badgeInfo.locked and 1 or 0)
    info1.Lock.root.onClick:Set(function()
      BadgeService.SetBadgeLockStateReq(not badgeInfo.locked, badgeInfo.badgeUid, function(msg)
        badgeInfo.locked = msg.locked
        ChangeController(info1.Lock.c1Ctr, badgeInfo.locked and 1 or 0)
      end)
    end)
  end
  if info.c3Ctr then
    if badgeInfo.level >= badgeData.level_max then
      ChangeController(info.c3Ctr, 1)
    else
      ChangeController(info.c3Ctr, 0)
    end
  end
  local info2 = info.DetailsInfo2
  local mainData = TableData.GetConfig(badgeInfo.mainAttribute, "BaseBadgeAttribute")
  if mainData then
    ChangeController(info2.DetailsInfo2_1.c1Ctr, BadgeMgr.mainAttributeCtr[mainData.type])
    info2.DetailsInfo2_1.NameTxt.text = BadgeData.GetAttributeNameByInfo(mainData.type)
    info2.DetailsInfo2_1.NumberTxt.text = BadgeData.GetAttribute(badgeInfo.attributeLevels[badgeInfo.mainAttribute], badgeInfo.mainAttribute, false)
  end
  local sort = BadgeMgr.viceAttributeCtr
  local newViceAttribute = {}
  for i, v in pairs(badgeInfo.viceAttributes) do
    local data = TableData.GetConfig(v, "BaseBadgeAttribute")
    if data then
      table.insert(newViceAttribute, data)
    end
  end
  if #newViceAttribute > 1 then
    table.sort(newViceAttribute, function(a, b)
      if sort[a.type] and sort[b.type] then
        return sort[a.type] < sort[b.type]
      end
      return false
    end)
  end
  
  function info2.AttributeList.itemRenderer(i, item)
    local data = newViceAttribute[i + 1]
    ChangeUIController(item, "c1", sort[data.type])
    UIUtil.SetText(item, BadgeData.GetAttributeNameByInfo(data.type), "NameTxt")
    UIUtil.SetText(item, BadgeData.GetAttribute(badgeInfo.attributeLevels[data.id], data.id, false), "NumberTxt")
    if showNewTag and BadgeMgr.newTag[badgeInfo.badgeUid] and table.contain(BadgeMgr.newTag[badgeInfo.badgeUid], data.id) then
      ChangeUIController(item, "c3", 1)
    else
      ChangeUIController(item, "c3", 0)
    end
  end
  
  info2.AttributeList.numItems = #newViceAttribute
  if showNewTag and BadgeMgr.newTag[badgeInfo.badgeUid] then
    BadgeMgr.newTag[badgeInfo.badgeUid] = nil
  end
  local wearBadgeUids
  if BadgeMgr.curCardId and 0 ~= BadgeMgr.curCardId then
    local cardInfo = CardData.GetCardDataById(BadgeMgr.curCardId)
    if cardInfo then
      wearBadgeUids = cardInfo.wearBadgeUids
    end
  end
  local ShowSuitText = function(list)
    if list then
      function list.itemRenderer(ii, item)
        local suitGroupData = TableData.GetConfig(badgeData.suit_group_id, "BaseBadgeSuitGroup")
        
        if suitGroupData then
          UIUtil.SetText(item, suitGroupData.name(), "NameTxt")
          local suitList = item:GetChild("SuitList")
          
          function suitList.itemRenderer(i, suit)
            local suitData = TableData.GetConfig(suitGroupData.suit_id[i + 1], "BaseBadgeSuit")
            if suitData then
              UIUtil.SetText(suit, suitData.des(), "WordTxt")
              if wearBadgeUids and CheckSuit(wearBadgeUids, suitData, badgeData) then
                ChangeUIController(suit, "c1", 1)
              else
                ChangeUIController(suit, "c1", 0)
              end
            else
              ChangeUIController(suit, "c1", 0)
            end
          end
          
          suitList.numItems = #suitGroupData.suit_id
          suitList:ResizeToFit()
        end
      end
      
      list.numItems = 1
      list:ResizeToFit()
    end
  end
  local info3 = info.DetailsInfo3
  
  function info3.InfoList.itemRenderer(i, item)
    UIUtil.SetText(item, T(1185), "TitleTxt")
    ShowSuitText(item:GetChild("AllSuitList"))
  end
  
  info3.InfoList.numItems = 1
end

function BadgeMgr.ShowBadgeItem(icon, data, info, showLv)
  ChangeUIController(icon, "c1", data.star - 1)
  ChangeUIController(icon, "new", info.isNew and 1 or 0)
  if showLv or info.level > 0 then
    BadgeMgr.ShowLevel(icon:GetChild("LevelTxt"), info.level)
  else
    UIUtil.SetText(icon, "", "LevelTxt")
  end
  icon:GetChild("IconLoader").url = UIUtil.GetResUrl(data.icon)
  BadgeMgr.ShowStar(icon:GetChild("StarList"), data.star)
  ChangeUIController(icon, "c3", info.locked and 1 or 0)
  if info.wearCardId > 0 then
    BadgeMgr.ShowHead(icon:GetChild("HeadShow"), info.wearCardId)
    ChangeUIController(icon, "c2", 1)
  else
    ChangeUIController(icon, "c2", 0)
  end
end

function BadgeMgr.ShowPartInfo(partsInfo, star, lv)
  if partsInfo then
    BadgeMgr.ShowStar(partsInfo.StarList, star)
    BadgeMgr.ShowLevel(partsInfo.LevelTxt, lv)
  end
end

function BadgeMgr.ShowStar(list, star)
  list:RemoveChildrenToPool()
  for index = 1, star do
    list:AddChild(list:AddItemFromPool())
  end
end

function BadgeMgr.ShowLevel(levelTxt, level)
  if level and levelTxt then
    levelTxt.text = T(1249, level)
  end
end

function BadgeMgr.ShowHead(headShow, cardId)
  if headShow then
    local cardInfo = CardData.GetCardDataById(cardId)
    local loader = headShow:GetChild("HeadShowBg"):GetChild("PicLoader")
    if cardInfo then
      UIUtil.SetHeadByFaceId(cardInfo.fashionId, loader, HEAD_ICON_TYPE_ENUM.RECT)
    end
  end
end

function BadgeMgr.OpenBadgeDecompose(backUpdate)
  BadgeMgr.Init()
  OpenWindow(WinResConfig.BadgeDecomposeWindow.name, nil, backUpdate)
end

function BadgeMgr.Init()
  BadgeData.InitScreeningData()
  BadgeData.InitSortData()
  BadgeData.SortAttribute = {}
end
