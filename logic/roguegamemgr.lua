local nodesBuffer, parentsBuffer, childrenBuffer, rogueNodes

local function buildTree(nodeConf, nodeArray, nodeLayer)
  local node
  local next = nodeConf.next
  local exists = table.keyof(nodeArray, nodeConf.id, "id")
  if not exists then
    node = {
      id = nodeConf.id,
      layer = nodeLayer,
      index = #nodeArray + 1,
      conf = nodeConf
    }
    table.insert(nodeArray, node)
  else
    node = nodeArray[exists]
  end
  if next then
    for i, v in ipairs(next) do
      local conf = TableData.GetConfig(v, "BaseRogueNode")
      node.children = node.children or {}
      local childNode = buildTree(conf, nodeArray, nodeLayer + 1)
      if not table.keyof(node.children, childNode.id, "id") then
        table.insert(node.children, childNode)
      end
      childNode.parents = childNode.parents or {}
      if not table.keyof(childNode.parents, node.id, "id") then
        table.insert(childNode.parents, node)
      end
    end
  end
  return node
end

local BuildNodes = function(rogueChapterId)
  local nodeTbl = TableData.GetTable("BaseRogueNode")
  rogueNodes = rogueNodes or {}
  table.clear(rogueNodes)
  local startNodes = {}
  for _, v in pairs(nodeTbl) do
    if v.chapter_id == rogueChapterId and not v.pre and v.next then
      table.insert(startNodes, v)
    end
  end
  for _, startNode in ipairs(startNodes) do
    buildTree(startNode, rogueNodes, 1)
  end
  nodesBuffer = nodesBuffer or {}
  parentsBuffer = parentsBuffer or {}
  childrenBuffer = childrenBuffer or {}
  table.clear(nodesBuffer)
  table.clear(parentsBuffer)
  table.clear(childrenBuffer)
  local maxLayer = -1
  for _, node in ipairs(rogueNodes) do
    maxLayer = math.max(maxLayer, node.layer)
  end
  for layer = 1, maxLayer do
    table.clear(nodesBuffer)
    for _, node in ipairs(rogueNodes) do
      if node.layer == layer then
        table.insert(nodesBuffer, node)
      end
    end
    local numNodes = #nodesBuffer
    for i = 1, numNodes do
      local node = nodesBuffer[i]
      local px = RogueGameDefine.PADDING_X + (layer - 1) * RogueGameDefine.NODE_GAP_X
      local py
      node.__x = px
      if node.parents and _G.next(node.parents) then
        local center = 0
        local cnt = #node.parents
        local H = 0
        table.clear(parentsBuffer)
        table.clear(childrenBuffer)
        for _, parent in ipairs(node.parents) do
          H = H + parent.__h
          center = center + parent.__y
          for _, child in ipairs(parent.children) do
            if not table.keyof(childrenBuffer, child.id, "id") then
              table.insert(childrenBuffer, child)
            end
          end
        end
        for _, n in ipairs(nodesBuffer) do
          if n.id ~= node.id then
            for _, parent in ipairs(n.parents) do
              if not table.keyof(node.parents, parent.id, "id") and not table.keyof(parentsBuffer, parent.id, "id") then
                H = H + parent.__h
                center = center + parent.__y
                cnt = cnt + 1
                table.insert(parentsBuffer, parent)
              end
            end
          end
        end
        local numChildren = numNodes
        local lineHeight = RogueGameDefine.NODE_GAP_Y
        local c = (numChildren - 1) * 0.5
        py = center / cnt + (i - 1 - c) * lineHeight
        node.__y = py
        node.__h = lineHeight * numChildren
      else
        local H = RogueGameDefine.MAX_HEIGHT - RogueGameDefine.BOTTOM_COMP_HEIGHT
        local lineHeight = RogueGameDefine.NODE_GAP_Y
        local c = (numNodes - 1) * 0.5
        py = RogueGameDefine.PADDING_Y + H * 0.5 + (i - 1 - c) * lineHeight
        node.__y = py
        node.__h = lineHeight
      end
    end
  end
  return rogueNodes
end
local params = {
  stageId = -1,
  sceneType = ProtoEnum.SCENE_TYPE.ROGUE,
  extData = nil,
  backFunc = function()
    UIMgr:CloseWindow(WinResConfig.FormationWindow.name)
  end
}
local HandleBattle = function(stageId, battleType)
  ld("Formation")
  params.stageId = stageId
  FormationMgr.TryOpenFormationWindow(params)
end
local HandleBattle_Normal = function(rogueNode)
  HandleBattle(rogueNode.stageId, RogueBattleType.NORMAL)
end
local HandleBattle_Encounter = function(rogueNode)
  HandleBattle(rogueNode.stageId, RogueBattleType.ENCOUNTER)
end
local HandleBattle_Boss = function(rogueNode)
  HandleBattle(rogueNode.stageId, RogueBattleType.BOSS)
end
local HandleShop = function(rogueNode)
  OpenWindow(WinResConfig.RogueGameShopWindow.name, nil, rogueNode)
end
local EVENT_ENTRANCE_DURATION = 1.2
local HandleEvent = function(rogueNode)
  local callback = function()
    UIMgr:HideWindow(WinResConfig.RogueGameMapWindow.name, false, false)
    OpenWindow(WinResConfig.RogueGameEventWindow.name, nil, rogueNode, function()
      RogueGameService.FinishRogueEventStoryReq(rogueNode.eventId, function(msg)
        rogueNode.jobDone = true
        if not RogueGameMgr.DisplayCurrentNodeRewardsIfNecessary() then
          RogueGameService.ExitRogueNodeReq(rogueNode.nodeId, function()
            UIMgr:CloseWindow(WinResConfig.RogueGameEventWindow.name)
          end)
        else
          UIMgr:CloseWindow(WinResConfig.RogueGameEventWindow.name)
        end
      end)
    end)
  end
  if 0 == rogueNode.eventStoryId then
    local duration = EVENT_ENTRANCE_DURATION * 0.5
    CS.StoryUtil.ScreenMaskMoveInFromRight(duration, callback)
    LeanTween.delayedCall(duration, function()
      CS.StoryUtil.ScreenMaskMoveOutToLeft(duration)
    end)
  else
    callback()
  end
end
local HandleSupply = function(rogueNode)
  OpenWindow(WinResConfig.RogueGameRewardsWindow.name, nil, rogueNode, true)
end
local HandleNode = function(rogueNode)
  if rogueNode then
    RogueGameMgr.__node_change_anim = false
    local nodeId = rogueNode.nodeId
    local conf = TableData.GetConfig(nodeId, "BaseRogueNode")
    local n_type = conf.type
    local E_NODE_TYPE = RogueGameNodeType
    if n_type == E_NODE_TYPE.BATTLE_NORMAL then
      HandleBattle_Normal(rogueNode)
    elseif n_type == E_NODE_TYPE.BATTLE_ENCOUNTER then
      HandleBattle_Encounter(rogueNode)
    elseif n_type == E_NODE_TYPE.BATTLE_BOSS then
      HandleBattle_Boss(rogueNode)
    elseif n_type == E_NODE_TYPE.SHOP then
      HandleShop(rogueNode)
    elseif n_type == E_NODE_TYPE.EVENT then
      HandleEvent(rogueNode)
    elseif n_type == E_NODE_TYPE.SUPPLY then
      HandleSupply(rogueNode)
    end
  else
    printError("[ROGUE GAME] error nil rogueNode", debug.traceback())
  end
end
local PrepareHandleNode = function(nodeId, succeedCallback, cancelCallback)
  local layer = RogueGameMgr.GetNodeLayer(nodeId)
  local latestLayer = RogueGameMgr.GetLatestNodeLayer()
  local chapterInfo = RogueGameData.GetChapterInfo()
  local rogueNode = chapterInfo.curNode
  if rogueNode and _G.next(rogueNode) then
    if not RogueGameMgr.IsCurrentNodeFinished() then
      local curNodeLayer = RogueGameMgr.GetNodeLayer(rogueNode.nodeId)
      if layer < curNodeLayer then
      elseif layer > curNodeLayer then
      elseif nodeId ~= rogueNode.nodeId then
      end
      if nodeId == rogueNode.nodeId then
        if type(succeedCallback) == "function" then
          succeedCallback()
        end
        OpenWindow(WinResConfig.RogueGameNodeHandleWindow.name, nil, nodeId, function()
          if not RogueGameMgr.DisplayCurrentNodeRewardsIfNecessary() then
            local info = RogueGameData.GetChapterInfo()
            RogueGameMgr.HandleNode(info.curNode)
          end
          UIMgr:CloseWindow(WinResConfig.RogueGameNodeHandleWindow.name)
        end, cancelCallback)
      end
    else
      if 1 == layer - latestLayer and RogueGameMgr.IsParentChildRelationship(nodeId, rogueNode.nodeId) then
        if type(succeedCallback) == "function" then
          succeedCallback()
        end
        OpenWindow(WinResConfig.RogueGameNodeHandleWindow.name, nil, nodeId, function()
          RogueGameService.EnterRogueNodeReq(nodeId, function()
            local info = RogueGameData.GetChapterInfo()
            RogueGameMgr.HandleNode(info.curNode)
            UIMgr:CloseWindow(WinResConfig.RogueGameNodeHandleWindow.name)
          end)
        end, cancelCallback)
      else
      end
    end
  elseif 1 == layer - latestLayer then
    if type(succeedCallback) == "function" then
      succeedCallback()
    end
    OpenWindow(WinResConfig.RogueGameNodeHandleWindow.name, nil, nodeId, function()
      RogueGameService.EnterRogueNodeReq(nodeId, function()
        local info = RogueGameData.GetChapterInfo()
        RogueGameMgr.HandleNode(info.curNode)
        UIMgr:CloseWindow(WinResConfig.RogueGameNodeHandleWindow.name)
      end)
    end, cancelCallback)
  end
end
local GetNodeInfo = function(nodeId)
  if rogueNodes then
    local k = table.keyof(rogueNodes, nodeId, "id")
    if k then
      return rogueNodes[k]
    end
  end
end
local GetNodeLayer = function(nodeId)
  local nodeInfo = GetNodeInfo(nodeId)
  if nodeInfo then
    return nodeInfo.layer
  end
end
local GetLatestNodeLayer = function()
  local layer = 0
  local chapterInfo = RogueGameData.GetChapterInfo()
  if chapterInfo then
    local finishedNodeIdList = chapterInfo.finishedNodeIds
    if finishedNodeIdList and _G.next(finishedNodeIdList) then
      for _, v in pairs(finishedNodeIdList) do
        layer = math.max(GetNodeLayer(v), layer)
      end
    end
  end
  return layer
end
local IsParentChildRelationship = function(childNodeId, parentNodeId)
  if rogueNodes then
    local c_key = table.keyof(rogueNodes, childNodeId, "id")
    local p_key = table.keyof(rogueNodes, parentNodeId, "id")
    if c_key and p_key then
      local child = rogueNodes[c_key]
      local parent = rogueNodes[p_key]
      if parent.children and table.keyof(parent.children, child) then
        return true
      end
    end
  end
  return false
end

local function IsReachable(startNode, endNode)
  if type(startNode) == "number" and type(endNode) == "number" then
    startNode = GetNodeInfo(startNode)
    endNode = GetNodeInfo(endNode)
  end
  if type(startNode) == "table" and type(endNode) == "table" then
    local children = startNode.children
    if children then
      if table.keyof(children, endNode.id, "id") then
        return true
      end
      for _, child in ipairs(children) do
        if IsReachable(child, endNode) then
          return true
        end
      end
    end
  end
  return false
end

local Settle = function(settlementInfo)
  local themeInfo = settlementInfo.themeInfo
  local endingId = settlementInfo.endingId
  RogueData.UpdateThemeInfo(themeInfo)
  if not themeInfo.cardIds or not _G.next(themeInfo.cardIds) then
    return
  end
  OpenWindow(WinResConfig.RogueGameEndWindow.name, nil, function()
    OpenWindow(WinResConfig.RogueGameSettlementWindow.name, nil, settlementInfo)
  end, endingId)
  UIMgr:CloseWindow(WinResConfig.RogueGameMapWindow.name)
end
local DisplayCurrentNodeRewardsIfNecessary = function()
  local chapterInfo = RogueGameData.GetChapterInfo()
  if chapterInfo then
    local rogueNode = chapterInfo.curNode
    if rogueNode and rogueNode.jobDone and not rogueNode.finished and rogueNode.rewardOptions and _G.next(rogueNode.rewardOptions) then
      OpenWindow(WinResConfig.RogueGameRewardsWindow.name, nil, rogueNode, false)
      return true
    end
  end
  return false
end
local Gain = function(rewardId)
  local conf = TableData.GetConfig(rewardId, "BaseRogueNodeReward")
  local r_type = conf.type
  if r_type == RogueGameRewardType.RECRUITING_TICKET then
    OpenWindow(WinResConfig.RogueGameStartChoiceCardListWindow.name, nil, nil, function(cardId, callback)
      RogueGameService.FetchRogueNodeRewardReq(rewardId, tostring(cardId), callback)
    end)
  elseif r_type == RogueGameRewardType.RANDOM_COIN then
    RogueGameService.FetchRogueNodeRewardReq(rewardId)
  elseif r_type == RogueGameRewardType.RANDOM_ATTR then
    RogueGameService.FetchRogueNodeRewardReq(rewardId)
  elseif r_type == RogueGameRewardType.RANDOM_TREASURE then
    RogueGameService.FetchRogueNodeRewardReq(rewardId)
  elseif r_type == RogueGameRewardType.TREAT then
    RogueGameService.FetchRogueNodeRewardReq(rewardId)
  elseif r_type == RogueGameRewardType.REVIVE then
    OpenWindow(WinResConfig.RogueGameCardUpWindow.name, nil, function(cardId)
      RogueGameService.FetchRogueNodeRewardReq(rewardId, tostring(cardId), function()
        UIMgr:SendWindowMessage(WinResConfig.RogueGameCardUpWindow.name, WindowMsgEnum.RogueGame.REFRESH_CARD_ATTRIBUTE)
      end)
    end, rewardId)
  elseif r_type == RogueGameRewardType.SPECIAL_TREASURE then
    RogueGameService.FetchRogueNodeRewardReq(rewardId)
  end
end
local Start = function(difficultyLevel)
  RogueGameService.GetRogueStateInfoReq(function(_)
    RogueGameMgr.__display_battle_node_rewards = nil
    local themeInfo = RogueGameData.GetThemeInfo()
    if not themeInfo.running then
      RogueGameService.StartRogueGameReq(difficultyLevel or 0, function()
        RogueService.GetRogueInfoReq(function(msg)
          RogueGameMgr.__node_change_anim = true
          OpenWindow(WinResConfig.RogueGameStartChoiceWindow.name)
        end)
      end)
    else
      local cardInfoList = RogueGameData.GetCardInfoList()
      local treasureIdList = RogueGameData.GetTreasureIdList()
      local hasAnyCard = cardInfoList and _G.next(cardInfoList)
      local hasAnyTreasure = treasureIdList and _G.next(treasureIdList)
      RogueGameMgr.__node_change_anim = true
      if not hasAnyTreasure then
        OpenWindow(WinResConfig.RogueGameStartChoiceWindow.name)
      elseif not hasAnyCard then
        OpenWindow(WinResConfig.RogueGameStartChoiceWindow.name, nil, 1)
      else
        OpenWindow(WinResConfig.RogueGameMapWindow.name)
      end
    end
  end)
end
local GetCurrentThemeTokensCount = function()
  local themeInfo = RogueGameData.GetThemeInfo()
  local themeConf = TableData.GetConfig(themeInfo.themeId, "BaseRogueTheme")
  local itemId = themeConf.tokens_item
  return ActorData.GetItemCount(itemId), itemId
end
local GetCurrentThemeAttrPointCount = function()
  local themeInfo = RogueGameData.GetThemeInfo()
  local themeConf = TableData.GetConfig(themeInfo.themeId, "BaseRogueTheme")
  return ActorData.GetItemCount(themeConf.point_item)
end
local GetAttributeEnhanceInfo = function(attributeId, cardStar, enhanceLevel)
  local themeInfo = RogueGameData.GetThemeInfo()
  local themeConf = TableData.GetConfig(themeInfo.themeId, "BaseRogueTheme")
  local tbl = TableData.GetTable("BaseRogueCardAttribEnhance")
  for _, v in pairs(tbl) do
    if themeConf.group_id == v.group_id and v.attrib_id == attributeId and v.star == cardStar and v.level == enhanceLevel then
      return v
    end
  end
end
local GetRecruitableCards = function(cardsBuffer)
  local buffer = cardsBuffer
  local cards = RogueGameData.GetRecruitableCards()
  if cards and _G.next(cards) then
    for i, v in pairs(cards) do
      local cardId = v.cardId
      local duplicate = RogueGameData.GetCardInfo(cardId) ~= nil
      if not duplicate then
        buffer = buffer or {}
        table.insert(buffer, v)
      end
    end
  end
  return buffer
end
local notifyCollector, rogueCardsBuffer
local OnFetchNodeReward = function(msg)
  rogueCardsBuffer = rogueCardsBuffer or {}
  table.clear(rogueCardsBuffer)
  notifyCollector = notifyCollector or {}
  local prevThemeInfo = RogueGameData.GetThemeInfo()
  local prevChapterInfo = RogueGameData.GetChapterInfo()
  local prevCardInfoList = RogueGameData.GetCardInfoList()
  local rewards = msg.rewards
  local newThemeInfo = msg.themeInfo
  local newChapterInfo = msg.chapterInfo
  local newCardInfoList = msg.cardInfos
  local treasureId = msg.gainTreasureId
  local unlokedHalidoms = msg.unlockHolyIds
  local rewardId = msg.rewardId
  local rewardType, rewardConf, gotTreasure = -1
  if rewardId and rewardId > 0 then
    rewardConf = TableData.GetConfig(rewardId, "BaseRogueNodeReward")
    rewardType = rewardConf.type
  end
  local recruitCards, revivalCards, recoverCards
  if newCardInfoList and _G.next(newCardInfoList) then
    local hp_key = CardAttribute.GetIdByName(ATTR_ENUM.hp)
    for i, v in ipairs(prevCardInfoList) do
      local map = v.info.attributes
      if map and type(map[hp_key]) == "number" and 0 == map[hp_key] then
        table.insert(rogueCardsBuffer, v)
      end
    end
    for i, v in ipairs(newCardInfoList) do
      local map = v.info.attributes
      local curHp = map[hp_key]
      if map and type(curHp) == "number" and curHp > 0 then
        if rewardType == RogueGameRewardType.REVIVE then
          if table.keyof(rogueCardsBuffer, v.cardId, "cardId") then
            revivalCards = revivalCards or {}
            table.insert(revivalCards, v)
          end
        elseif rewardType == RogueGameRewardType.TREAT then
          local k = table.keyof(prevCardInfoList, v.cardId, "cardId")
          if k then
            local prevCardInfo = prevCardInfoList[k]
            local prevMap = prevCardInfo.info.attributes
            local prevHp = prevMap[hp_key]
            if prevHp and curHp >= prevHp then
              recoverCards = recoverCards or {}
              table.insert(recoverCards, {
                cardId = v.cardId,
                prev = prevHp,
                cur = curHp,
                max = map[CardAttribute.GetIdByName(ATTR_ENUM.max_hp)]
              })
            end
          end
        end
      end
      if not table.keyof(prevCardInfoList, v.cardId, "cardId") then
        recruitCards = recruitCards or {}
        table.insert(recruitCards, v)
      end
    end
  end
  if unlokedHalidoms and _G.next(unlokedHalidoms) then
    local notifyItem = {
      type = RogueGameNotifyType.HALIDOM_GOT,
      items = {}
    }
    for i, v in ipairs(unlokedHalidoms) do
      table.insert(notifyItem.items, v)
    end
    table.insert(notifyCollector, notifyItem)
  end
  if type(treasureId) == "number" and treasureId > 0 then
    gotTreasure = true
    local notifyItem = {
      type = RogueGameNotifyType.TREASURE_GOT,
      items = {treasureId}
    }
    OpenWindow(WinResConfig.RogueGameItemTipsWindow.name, nil, treasureId, unlokedHalidoms)
    table.insert(notifyCollector, notifyItem)
  elseif "table" == type(treasureId) and _G.next(treasureId) then
    gotTreasure = true
    local notifyItem = {
      type = RogueGameNotifyType.TREASURE_GOT,
      items = {}
    }
    for i, v in ipairs(treasureId) do
      table.insert(notifyItem.items, v)
    end
    OpenWindow(WinResConfig.RogueGameItemTipsWindow.name, nil, treasureId, unlokedHalidoms)
    table.insert(notifyCollector, notifyItem)
  end
  if recruitCards then
    local notifyItem = {
      type = RogueGameNotifyType.RECRUIT_NEW_CARD,
      items = {}
    }
    for i, v in ipairs(recruitCards) do
      table.insert(notifyItem.items, v)
    end
    table.insert(notifyCollector, notifyItem)
    OpenWindow(WinResConfig.RogueGameRecruitTipsWindow.name, nil, recruitCards)
  end
  if revivalCards then
    local notifyItem = {
      type = RogueGameNotifyType.REVIVE_CARD,
      items = {}
    }
    for i, v in ipairs(revivalCards) do
      table.insert(notifyItem.items, v)
    end
    table.insert(notifyCollector, notifyItem)
    OpenWindow(WinResConfig.RogueGameRebirthTipsWindow.name, nil, revivalCards)
  end
  if rewards and _G.next(rewards) then
    local attributes, tokens, attributesNotify, tokensNotify
    local conf = TableData.GetConfig(prevThemeInfo.themeId, "BaseRogueTheme")
    for i, v in ipairs(rewards) do
      if v.itemId == conf.tokens_item then
        tokensNotify = tokensNotify or {
          type = RogueGameNotifyType.TOKEN_GOT,
          items = {}
        }
        tokens = tokens or {}
        table.insert(tokens, v)
        table.insert(tokensNotify.items, v)
      elseif v.itemId == conf.point_item then
        attributesNotify = attributesNotify or {
          type = RogueGameNotifyType.ATTRIBUTE_GOT,
          items = {}
        }
        attributes = attributes or {}
        table.insert(attributes, v)
        table.insert(attributesNotify.items, v)
      end
    end
    if tokens then
      table.insert(notifyCollector, tokensNotify)
    end
    if attributes then
      table.insert(notifyCollector, attributesNotify)
    end
    if not gotTreasure then
      RogueGameMgr.DisplayItemNotifyIfNecessary()
    end
  end
  if rewardType == RogueGameRewardType.TREAT then
    local notifyItem = {
      type = RogueGameNotifyType.TREAT,
      items = {rewardId}
    }
    table.insert(notifyCollector, notifyItem)
    OpenWindow(WinResConfig.RogueGameRecoveryTipsWindow.name, nil, rewardId, recoverCards)
  end
  if newChapterInfo and newChapterInfo.curNode and _G.next(newChapterInfo.curNode) then
    UIMgr:SendWindowMessage(WinResConfig.RogueGameRewardsWindow.name, WindowMsgEnum.RogueGame.REFRESH_REWARD_LIST, newChapterInfo.curNode)
  end
end
local OnExitRogueNode = function(msg)
  local prevChapterInfo = RogueGameData.GetChapterInfo()
  local curChapterInfo = msg.chapterInfo
  if curChapterInfo.chapterId ~= prevChapterInfo.chapterId then
    OpenWindow(WinResConfig.RogueGameTransitionWindow.name, nil, curChapterInfo.chapterId)
  end
  RogueGameMgr.__node_change_anim = true
end
local OnBattleComplete = function(rogueBattleResult)
  if rogueBattleResult then
    printWarning("RogueBattleResult:", PrintTable(rogueBattleResult))
    if rogueBattleResult.gameSettle then
      Settle(rogueBattleResult.settleInfo)
    else
      if rogueBattleResult.chapterInfo then
        RogueGameData.SetChapterInfo(rogueBattleResult.chapterInfo)
      end
      if rogueBattleResult.cardInfos then
        for i, v in ipairs(rogueBattleResult.cardInfos) do
          RogueGameData.AddOrOverrideCardInfo(v)
        end
      end
      RogueGameMgr.__display_battle_node_rewards = true
    end
  end
end
local DisplayItemNotifyIfNecessary = function()
  if notifyCollector and _G.next(notifyCollector) then
    if UIMgr:IsWindowOpen(WinResConfig.RogueGameInfoTipsWindow.name) then
      UIMgr:SendWindowMessage(WinResConfig.RogueGameInfoTipsWindow.name, WindowMsgEnum.RogueGame.NOTIFY_ITEM_GOT, notifyCollector)
    else
      OpenWindow(WinResConfig.RogueGameInfoTipsWindow.name, nil, notifyCollector)
    end
  end
end
local treasureIdBuffer
local TreasureID_Filter = function(v, treasureId)
  return treasureId == v
end
local TreasureType_Level_Filter = function(v, t_type, t_level)
  local conf = TableData.GetConfig(v, "BaseRogueTreasure")
  return conf and conf.type == t_type and conf.level == t_level
end
local HasTreasure = function(treasureId)
  treasureIdBuffer = treasureIdBuffer or {}
  table.clear(treasureIdBuffer)
  RogueGameData.GetTreasureIdListByFilter(TreasureID_Filter, treasureIdBuffer, treasureId)
  return #treasureIdBuffer > 0
end
local GetTreasureByType_Level = function(t_type, t_level)
  treasureIdBuffer = treasureIdBuffer or {}
  table.clear(treasureIdBuffer)
  RogueGameData.GetTreasureIdListByFilter(TreasureType_Level_Filter, treasureIdBuffer, t_type, t_level)
  return treasureIdBuffer
end
local IsHalidomActivated = function(id)
  local list = RogueGameData.GetHalidomIdList()
  if list then
    return table.keyof(list, id)
  end
end
local IsCurrentNodeFinished = function()
  local result = false
  local chapterInfo = RogueGameData.GetChapterInfo()
  if chapterInfo and chapterInfo.curNode and _G.next(chapterInfo.curNode) then
    local node = chapterInfo.curNode
    local nodeId = node.nodeId
    local conf = TableData.GetConfig(nodeId, "BaseRogueNode")
    result = node.finished
  end
  return result
end
local IsTriggerHalidom = function(treasureId, onlySpecialTreasureId)
  local halidomTbl = TableData.GetTable("BaseRogueHoly")
  local treasureConf = TableData.GetConfig(treasureId, "BaseRogueTreasure")
  local t_type, t_level = treasureConf.type, treasureConf.level
  for _, v in pairs(halidomTbl) do
    local unlock_condition = v.unlock_condition
    if unlock_condition and _G.next(unlock_condition) then
      for _, str in pairs(unlock_condition) do
        local splits = Split(str, ":")
        local c_type = tonumber(splits[1])
        if not onlySpecialTreasureId and 1 == c_type then
          local t = tonumber(splits[2])
          local l = tonumber(splits[3])
          if t == t_type and l == t_level then
            return true, v
          end
        elseif 2 == c_type and tonumber(splits[2]) == treasureId then
          return true, v
        end
      end
    end
  end
end
local IsLiving = function(battleCardId)
  local rogueCardInfo = RogueGameData.GetCardInfo(battleCardId)
  if rogueCardInfo then
    local map = rogueCardInfo.info.attributes
    local hp_key = CardAttribute.GetIdByName(ATTR_ENUM.hp)
    if map[hp_key] and 0 == map[hp_key] then
      return false
    end
    return true
  end
end
local TREASURE_MAX_DISPLAY_NUM = 5
local UI_BottomTreasureItemRenderer = function(i, gcmp)
  local treasureIdList = RogueGameData.GetTreasureIdList()
  local cnt = #treasureIdList
  local treasureId = treasureIdList[cnt - i]
  local conf = TableData.GetConfig(treasureId, "BaseRogueTreasure")
  gcmp:GetChild("PicLoader").url = UIUtil.GetResUrl(conf.icon)
  ChangeUIController(gcmp, "c1", conf.level - 1)
end
local UI_SetCommonBottomInfo = function(bottomRoot, dont_display_treasures, dont_display_difficulty)
  local difficultyText = T(1361)
  local treasureText = T(1399)
  local memberText = T(20368)
  local themeInfo = RogueGameData.GetThemeInfo()
  local diffLv = themeInfo.curDifficultyLevel
  local treasures = RogueGameData.GetTreasureIdList()
  local cardInfos = RogueGameData.GetCardInfoList()
  local btn = bottomRoot:GetChild("DifficultyBtn")
  UIUtil.SetText(btn, difficultyText, "WordTxt")
  UIUtil.SetText(btn, diffLv, "NumberTxt")
  ChangeUIController(bottomRoot, "c1", not dont_display_difficulty and diffLv >= 0 and 0 or 1)
  btn.onClick:Set(function()
    OpenWindow(WinResConfig.RogueGameDifficultyInfoWindow.name)
  end)
  local numTreasures = treasures and #treasures or 0
  btn = bottomRoot:GetChild("ItemBtn")
  UIUtil.SetText(btn, treasureText, "WordTxt")
  UIUtil.SetText(btn, numTreasures, "NumberTxt")
  ChangeUIController(bottomRoot, "c2", not dont_display_treasures and numTreasures > 0 and 0 or 1)
  ChangeUIController(btn, "c1", not dont_display_treasures and numTreasures > 0 and 1 or 0)
  btn.onClick:Set(function()
    if not dont_display_treasures then
      OpenWindow(WinResConfig.RogueGameBackpackWindow.name)
    end
  end)
  local itemlist = btn:GetChild("ItemList")
  itemlist.itemRenderer = UI_BottomTreasureItemRenderer
  itemlist.numItems = math.min(TREASURE_MAX_DISPLAY_NUM, numTreasures)
  local numCards = cardInfos and #cardInfos or 0
  btn = bottomRoot:GetChild("CardBtn")
  UIUtil.SetText(btn, memberText, "WordTxt")
  UIUtil.SetText(btn, numCards, "NumberTxt")
  ChangeUIController(bottomRoot, "c3", numCards > 0 and 0 or 1)
  btn.onClick:Set(function()
    OpenWindow(WinResConfig.RogueGameCardUpWindow.name)
  end)
end
local UI_ATTR_CONTROLLER_LOOKUP = {
  CardAttribute.GetIdByName(ATTR_ENUM.max_hp),
  CardAttribute.GetIdByName(ATTR_ENUM.atk),
  CardAttribute.GetIdByName(ATTR_ENUM.def),
  CardAttribute.GetIdByName(ATTR_ENUM.crt),
  CardAttribute.GetIdByName(ATTR_ENUM.blk),
  CardAttribute.GetIdByName(ATTR_ENUM.eva),
  CardAttribute.GetIdByName(ATTR_ENUM.crt_int),
  CardAttribute.GetIdByName(ATTR_ENUM.blk_int),
  CardAttribute.GetIdByName(ATTR_ENUM.spd_move),
  CardAttribute.GetIdByName(ATTR_ENUM.spd_atk),
  CardAttribute.GetIdByName(ATTR_ENUM.range_atk),
  CardAttribute.GetIdByName(ATTR_ENUM.rage),
  CardAttribute.GetIdByName(ATTR_ENUM.be_treat_add)
}
local UI_STRENGTHENABLE_ATTR = {
  CardAttribute.GetIdByName(ATTR_ENUM.atk),
  CardAttribute.GetIdByName(ATTR_ENUM.def),
  CardAttribute.GetIdByName(ATTR_ENUM.max_hp)
}
local UI_SetCardAttributeList = function(attributelist, attributesMap, attrIdList, finalAttributeMap)
  function attributelist.itemRenderer(j, gcmp)
    local attrId = attrIdList[j + 1]
    
    local conf = TableData.GetConfig(attrId, "BaseAttribute")
    UIUtil.SetText(gcmp, conf.display_name(), "NameTxt")
    local val = attributesMap[attrId]
    if finalAttributeMap and finalAttributeMap[attrId] then
      local finalVal = finalAttributeMap[attrId]
      if val < finalVal then
        UIUtil.SetText(gcmp, string.format("%s [color=#33FF33](+%s)[/color]", val, finalVal - val), "NumberTxt")
      else
        UIUtil.SetText(gcmp, val, "NumberTxt")
      end
    else
      UIUtil.SetText(gcmp, val, "NumberTxt")
    end
    ChangeUIController(gcmp, "c1", table.keyof(UI_ATTR_CONTROLLER_LOOKUP, attrId) - 1)
  end
  
  attributelist.numItems = #attrIdList
end
local UI_SetCardDetailsPanel = function(cardId, panelRoot, cardFinalAttributes)
  local detailsPanel = panelRoot
  if cardId then
    detailsPanel.c1Ctr.selectedIndex = 0
    local rogueCardInfo = RogueGameData.GetCardInfo(cardId)
    local cardInfo = rogueCardInfo and rogueCardInfo.info or CardData.GetCardDataById(cardId)
    local conf = TableData.GetConfig(cardId, "BaseCard")
    local starList = detailsPanel.Info1.StarList
    UIUtil.ShowStarList(starList, cardInfo, conf)
    local elementList = detailsPanel.Info1.ElementList
    UIUtil.ShowElementList(elementList, conf)
    local breach = detailsPanel.Info1.CardBreach.root
    if conf.grow_model_id then
      local lvId = conf.grow_model_id * 1000 + cardInfo.level
      local lvData = TableData.GetConfig(lvId, "BaseCardLevelUp")
      detailsPanel.Info1.LevelTxt.text = T(10062, lvData.level_show)
    end
    detailsPanel.Info1.NameTxt.text = conf.name()
    detailsPanel.Info1.Occupation.c1Ctr.selectedIndex = conf.type - 1
    ChangeUIController(breach, "c1", cardInfo.quality)
    ChangeUIController(detailsPanel.Info1.root, "c1", conf.star - 1)
    ChangeUIController(breach, "c2", 0)
    local attributeText = T(31)
    local skillTitleText = T(32)
    detailsPanel.Info2.Title.NameTxt.text = attributeText
    local basicAttributes = CardData.CalculatorCardAttr(cardInfo)
    UI_SetCardAttributeList(detailsPanel.Info2.AttributeList, basicAttributes, UI_STRENGTHENABLE_ATTR, cardFinalAttributes)
    detailsPanel.Info3.Title.NameTxt.text = skillTitleText
    local skilllist = detailsPanel.Info3.SkillList
    local skillIdList = {
      conf.normal_skill,
      conf.special_skill,
      conf.burst_skill
    }
    
    function skilllist.itemRenderer(j, gcmp)
      local skillId = skillIdList[j + 1]
      local skillConf = TableData.GetConfig(skillId, "BaseSkill")
      local tag = gcmp:GetChild("SkillDetailsTag")
      local cd = gcmp:GetChild("SkillCD")
      local skill = gcmp:GetChild("Skill")
      UIUtil.SetText(tag, skillConf.name(), "WordTxt")
      local lv = cardInfo.skill2Level[skillId] or 1
      local addLv = cardInfo.gradeUpSkills[skillId] or 0
      local skillLevel = lv + addLv
      local id = skillConf.id * 1000 + skillLevel
      local skillLvData = TableData.GetConfig(id, "BaseSkillLevelUp")
      if skillLvData and skillLvData.des then
        UIUtil.SetText(gcmp, skillLvData.des and skillLvData.des(), "WordTxt")
      end
      UIUtil.SetText(gcmp, T(244, skillLevel), "LevelTxt")
      skill:GetChild("IconLoader").url = UIUtil.GetResUrl(skillConf.icon)
      if skillConf.type == SKILL_TYPE_ENUM.NORMAL then
        ChangeUIController(skill, "c1", 0)
        UIUtil.SetText(tag, CardData.GetSkillTypeName(skillConf.type), "WordTxt")
        ChangeUIController(gcmp, "c1", 0)
        ChangeUIController(tag, "c1", 4)
      elseif skillConf.type == SKILL_TYPE_ENUM.SMALL then
        ChangeUIController(skill, "c1", 0)
        UIUtil.SetText(tag, CardData.GetSkillTypeName(skillConf.type), "WordTxt")
        ChangeUIController(gcmp, "c1", 0)
        ChangeUIController(tag, "c1", 1)
      elseif skillConf.type == SKILL_TYPE_ENUM.BURST_CARD then
        ChangeUIController(skill, "c1", 1)
        if skillConf.cd then
          ChangeUIController(gcmp, "c1", 1)
          UIUtil.SetText(cd, T(1140, skillConf.cd), "TimeTxt")
        else
          ChangeUIController(gcmp, "c1", 0)
        end
        UIUtil.SetText(tag, CardData.GetSkillTypeName(skillConf.type), "WordTxt")
        ChangeUIController(tag, "c1", 2)
      end
    end
    
    skilllist.numItems = #skillIdList
  else
    detailsPanel.c1Ctr.selectedIndex = 1
    local nonSelectCardTipsText = T(20376)
    detailsPanel.Info4.WordTxt.text = nonSelectCardTipsText
  end
end
local UI_SetAssetList = function(assetlist)
  local themeInfo = RogueGameData.GetThemeInfo()
  local conf = TableData.GetConfig(themeInfo.themeId, "BaseRogueTheme")
  local tokensId = conf.tokens_item
  local pointId = conf.point_item
  
  function assetlist.itemRenderer(i, gcmp)
    local itemId
    if 0 == i then
      itemId = pointId
    else
      itemId = tokensId
    end
    local cnt = ActorData.GetItemCount(itemId) or 0
    ChangeUIController(gcmp, "c1", i)
    UIUtil.SetText(gcmp, cnt, "NumberTxt")
  end
  
  assetlist.numItems = 2
end
local UI_SetFunctionDetailsBtn = function(featureId, detailBtn, root, manual_open_caption)
  local data = TableData.GetConfig(featureId, "BaseFeature")
  if data and data.caption_id then
    detailBtn.onClick:Set(function()
      WindowLoadPackages[WinResConfig.GuidePicLookWindow.name] = {
        "Guide_" .. Language.curLanguage
      }
      OpenWindow(WinResConfig.GuidePicLookWindow.name, nil, data.caption_id, nil, true)
    end)
    detailBtn.visible = true
    if not manual_open_caption and data.auto_open_caption and GuideData.CanShowCaption(data.id) then
      root.touchable = false
      LeanTween.delayedCall(0.25, function()
        detailBtn.onClick:Call()
        root.touchable = true
      end)
      GuideData.SaveCaptionOpen(data.id)
    end
  else
    detailBtn.visible = false
  end
end
return {
  BuildNodes = BuildNodes,
  HandleNode = HandleNode,
  PrepareHandleNode = PrepareHandleNode,
  GetNodeInfo = GetNodeInfo,
  GetNodeLayer = GetNodeLayer,
  GetLatestNodeLayer = GetLatestNodeLayer,
  IsParentChildRelationship = IsParentChildRelationship,
  IsReachable = IsReachable,
  Settle = Settle,
  Gain = Gain,
  Start = Start,
  GetCurrentThemeTokensCount = GetCurrentThemeTokensCount,
  GetCurrentThemeAttrPointCount = GetCurrentThemeAttrPointCount,
  GetAttributeEnhanceInfo = GetAttributeEnhanceInfo,
  GetRecruitableCards = GetRecruitableCards,
  DisplayCurrentNodeRewardsIfNecessary = DisplayCurrentNodeRewardsIfNecessary,
  OnBattleComplete = OnBattleComplete,
  OnFetchNodeReward = OnFetchNodeReward,
  OnExitRogueNode = OnExitRogueNode,
  DisplayItemNotifyIfNecessary = DisplayItemNotifyIfNecessary,
  HasTreasure = HasTreasure,
  GetTreasureByType_Level = GetTreasureByType_Level,
  IsHalidomActivated = IsHalidomActivated,
  IsCurrentNodeFinished = IsCurrentNodeFinished,
  IsTriggerHalidom = IsTriggerHalidom,
  IsLiving = IsLiving,
  UI_SetCommonBottomInfo = UI_SetCommonBottomInfo,
  UI_SetCardDetailsPanel = UI_SetCardDetailsPanel,
  UI_SetCardAttributeList = UI_SetCardAttributeList,
  UI_SetAssetList = UI_SetAssetList,
  UI_SetFunctionDetailsBtn = UI_SetFunctionDetailsBtn
}
