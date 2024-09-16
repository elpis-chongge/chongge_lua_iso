require("BadgeRecommend_RecommendWindowByName")
local BadgeRecommendWindow = {}
local uis, contentPane, cardId

function BadgeRecommendWindow.ReInitData()
end

function BadgeRecommendWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BadgeRecommendWindow.package, WinResConfig.BadgeRecommendWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetBadgeRecommend_RecommendWindowUis(contentPane)
    cardId = bridgeObj.argTable[1]
    BadgeRecommendWindow.UpdateInfo()
    BadgeRecommendWindow.InitBtn()
  end)
end

local FindMaxLvPart = function(suitBadgeIds)
  local badges = ActorData.GetAllBadge()
  local config = TableData.GetTable("BaseBadge")
  local part = {
    [1] = nil,
    [2] = nil,
    [3] = nil
  }
  local partOldIndex = {}
  local partOldData = {}
  local data, oldIndex, oldData
  local SetPart = function(i)
    part[data.type] = badges[i].badgeUid
    partOldIndex[data.type] = i
    partOldData[data.type] = config[badges[i].badgeId]
  end
  local newBadgeIds = {}
  for i, v in pairs(suitBadgeIds) do
    newBadgeIds[v] = true
  end
  for i = 1, #badges do
    if newBadgeIds[badges[i].badgeId] then
      data = config[badges[i].badgeId]
      if data and (0 == badges[i].wearCardId or badges[i].wearCardId == cardId) then
        if nil == part[data.type] then
          SetPart(i)
        else
          oldIndex = partOldIndex[data.type]
          oldData = partOldData[data.type]
          if badges[i].level > badges[oldIndex].level then
            SetPart(i)
          elseif badges[i].level == badges[oldIndex].level then
            if data.star > oldData.star then
              SetPart(i)
            elseif data.star == oldData.star then
              if #badges[i].viceAttributes > #badges[oldIndex].viceAttributes then
                SetPart(i)
              elseif #badges[i].viceAttributes == #badges[oldIndex].viceAttributes and badges[i].badgeUid > badges[oldIndex].badgeUid then
                SetPart(i)
              end
            end
          end
        end
      end
    end
  end
  return part
end
local FindStarPart = function(suitBadgeIds)
  local config = TableData.GetTable("BaseBadge")
  local part = {
    [1] = nil,
    [2] = nil,
    [3] = nil
  }
  for i, v in pairs(suitBadgeIds) do
    local tempData = config[v]
    if tempData then
      if part[tempData.type] then
        if config[part[tempData.type]].star < tempData.star then
          part[tempData.type] = v
        end
      else
        part[tempData.type] = v
      end
    end
  end
  return part
end

function BadgeRecommendWindow.UpdateInfo()
  local cardInfo = CardData.GetCardDataById(cardId)
  local cardData = TableData.GetConfig(cardId, "BaseCard")
  if cardData and cardInfo then
    local tips = uis.Main.RecommendTips
    tips.Title.NameTxt.text = cardData.name()
    UIUtil.ShowStarList(tips.Title.StarList, cardInfo, cardData)
    local partNum = 0
    local teamBadge
    for i, v in ipairs(cardInfo.wearBadgeUids) do
      local info = ActorData.GetBadgeInfoByUid(v)
      if info then
        teamBadge = TableData.GetConfig(info.badgeId, "BaseBadge")
        if teamBadge then
          ChangeController(tips.Title.WearState["Mark" .. teamBadge.type].c1Ctr, 1)
          partNum = partNum + 1
        end
      end
    end
    local show = false
    if #cardInfo.badgeSuitIds > 0 then
      for i = 1, #cardInfo.badgeSuitIds do
        local data = TableData.GetConfig(cardInfo.badgeSuitIds[i], "BaseBadgeSuit")
        if data and 3 == data.equip_num then
          show = true
        end
      end
    end
    if show and teamBadge then
      local suitData = TableData.GetConfig(teamBadge.suit_group_id, "BaseBadgeSuitGroup")
      if suitData then
        tips.Title.WearState.PicLoader.url = UIUtil.GetResUrl(suitData.icon)
      end
    end
    if show then
      ChangeController(tips.Title.WearState.c1Ctr, partNum >= 3 and 1 or 0)
    else
      ChangeController(tips.Title.WearState.c1Ctr, 0)
    end
    if cardData.badge_suit_ids then
      local length = #cardData.badge_suit_ids
      local bannerIndex = 0
      
      function tips.BadgeShow.ShowList.itemRenderer(i, item)
        local groupData = TableData.GetConfig(cardData.badge_suit_ids[i + 1], "BaseBadgeSuitGroup")
        local suitIcon = item:GetChild("BadgeIcon")
        suitIcon:GetChild("PicLoader").url = UIUtil.GetResUrl(groupData.icon)
        UIUtil.SetText(suitIcon, groupData.name(), "WordTxt")
        UIUtil.SetText(item, T(1185), "TitleTxt")
        local wordList = item:GetChild("WordList")
        local wordSuitData
        local allSuitId = {}
        
        function wordList.itemRenderer(ind, word)
          wordSuitData = TableData.GetConfig(groupData.suit_id[ind + 1], "BaseBadgeSuit")
          if wordSuitData then
            UIUtil.SetText(word, wordSuitData.des(), "WordTxt")
          end
          for _, vvv in pairs(wordSuitData.badge_ids) do
            allSuitId[vvv] = 0
          end
        end
        
        wordList.numItems = #groupData.suit_id
        local part
        if wordSuitData then
          local allNum = BadgeRecommendWindow.GetBadgeCountByPart(allSuitId)
          part = FindMaxLvPart(wordSuitData.badge_ids)
          local starPart = FindStarPart(wordSuitData.badge_ids)
          local tempBadgeData
          for i = 1, 3 do
            local badgeItem = item:GetChild("BadgeIcon" .. i)
            if part[i] then
              local tempInfo = ActorData.GetBadgeInfoByUid(part[i])
              if tempInfo then
                tempBadgeData = TableData.GetConfig(tempInfo.badgeId, "BaseBadge")
                if tempBadgeData and badgeItem then
                  badgeItem:GetChild("PicLoader").url = UIUtil.GetResUrl(tempBadgeData.icon)
                  local count = allNum[tempBadgeData.type]
                  if count then
                    UIUtil.SetText(badgeItem, count > 0 and T(1395, count) or T(1394), "WordTxt")
                  end
                end
              end
            else
              tempBadgeData = TableData.GetConfig(starPart[i], "BaseBadge")
              if tempBadgeData and badgeItem then
                badgeItem:GetChild("PicLoader").url = UIUtil.GetResUrl(tempBadgeData.icon)
                UIUtil.SetText(badgeItem, T(1394), "WordTxt")
              end
            end
          end
        end
        local wearBtn = item:GetChild("AllWearBtn")
        UIUtil.SetText(wearBtn, T(1393), "WordTxt")
        wearBtn.onClick:Set(function()
          local newPart = {}
          for i, v in pairs(part) do
            if v then
              table.insert(newPart, v)
            end
          end
          if table.getLen(newPart) > 0 then
            BadgeService.WearBadgeReq(cardId, newPart, function()
              UIMgr:SendWindowMessage(WinResConfig.BadgeWindow.name, WindowMsgEnum.BadgeWindow.RECOMMEND_WEAR)
              BadgeRecommendWindow.CloseWindow()
            end)
          else
            FloatTipsUtil.ShowWarnTips(T(1256))
          end
        end)
      end
      
      tips.BadgeShow.ShowList.numItems = length
      tips.BadgeShow.ShowList.scrollPane.pageMode = true
      tips.BadgeShow.ShowList.scrollPane.onScrollEnd:Set(function()
        bannerIndex = tips.BadgeShow.ShowList.scrollPane.currentPageX % length + 1
        BadgeRecommendWindow.SetPageShow(bannerIndex)
      end)
      local pageList = tips.PageNumberList
      
      function pageList.itemRenderer()
      end
      
      pageList.numItems = length
      bannerIndex = tips.BadgeShow.ShowList.scrollPane.currentPageX % length + 1
      BadgeRecommendWindow.SetPageShow(bannerIndex)
    end
    tips.AttributeShow.Attribute1.TitleTxt.text = T(1390)
    
    function tips.AttributeShow.Attribute1.TypeList.itemRenderer(i, main)
      local ids = Split(cardData.badge_main_attribute[i + 1], ":")
      if ids then
        local wordList = main:GetChild("WordTxt")
        
        function wordList.itemRenderer(ind, word)
          local config = TableData.GetConfig(tonumber(ids[ind + 1]), "BaseAttribute")
          if config then
            UIUtil.SetText(word, config.display_name())
          end
        end
        
        wordList.numItems = #ids
        wordList:ResizeToFit()
      end
      ChangeUIController(main, "c1", i)
    end
    
    tips.AttributeShow.Attribute1.TypeList.numItems = #cardData.badge_main_attribute
    tips.AttributeShow.Attribute2.TitleTxt.text = T(1391)
    
    function tips.AttributeShow.Attribute2.TypeList.itemRenderer(i, vice)
      local config = TableData.GetConfig(cardData.badge_vice_attribute[i + 1], "BaseAttribute")
      if config then
        UIUtil.SetText(vice, config.display_name())
      end
    end
    
    tips.AttributeShow.Attribute2.TypeList.numItems = #cardData.badge_vice_attribute
  end
end

function BadgeRecommendWindow.SetPageShow(bannerIndex)
  local list = uis.Main.RecommendTips.PageNumberList
  local length = list.numItems
  for i = 1, length do
    local obj = list:GetChildAt(i - 1)
    if i == bannerIndex then
      ChangeUIController(obj, "c1", 1)
    else
      ChangeUIController(obj, "c1", 0)
    end
  end
  ChangeController(uis.Main.RecommendTips.c1Ctr, length > 1 and 1 or 0)
end

function BadgeRecommendWindow.GetBadgeCountByPart(suitId)
  local all = ActorData.GetAllBadge()
  local num = {
    [1] = 0,
    [2] = 0,
    [3] = 0
  }
  local tempData
  for i, v in pairs(all) do
    if suitId[v.badgeId] and 0 == v.wearCardId then
      tempData = TableData.GetConfig(v.badgeId, "BaseBadge")
      if tempData then
        num[tempData.type] = num[tempData.type] + 1
      end
    end
  end
  return num
end

function BadgeRecommendWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.BadgeRecommendWindow.name)
end

function BadgeRecommendWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(BadgeRecommendWindow.CloseWindow)
  uis.Main.CloseBtn.onClick:Set(BadgeRecommendWindow.CloseWindow)
end

function BadgeRecommendWindow.OnClose()
  uis = nil
  contentPane = nil
end

return BadgeRecommendWindow
