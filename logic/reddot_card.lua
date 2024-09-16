RedDotCard = {}
local cardLevelUpItemList

function RedDotCard.InitItemList()
  if nil == cardLevelUpItemList then
    local fixedData = TableData.GetConfig(70010006, "BaseFixed")
    cardLevelUpItemList = Split(fixedData.array_value, "|")
    for i, v in ipairs(cardLevelUpItemList) do
      cardLevelUpItemList[i] = tonumber(v)
    end
  end
end

function RedDotCard.GetAllItemExp()
  local itemConfig
  local totalExp = 0
  for i, itemId in ipairs(cardLevelUpItemList) do
    itemConfig = TableData.GetConfig(itemId, "BaseItem")
    if itemConfig and itemConfig.effect_value then
      totalExp = totalExp + tonumber(itemConfig.effect_value) * ActorData.GetItemCount(itemId)
    end
  end
  return totalExp
end

function RedDotCard.CanAnyCardGrowUp()
  RedDotCard.InitItemList()
  local allCard = ActorData.GetCardList()
  for _, v in ipairs(allCard) do
    if RedDotCard.CanGrowUp(v.cardId) then
      return true
    end
  end
  return false
end

function RedDotCard.CanGrowUp(cardId)
  local cardList = CardData.GetSortCardList()
  return RedDotCard.CannCardListGrowUp(cardId, cardList) or RedDotCard.CanCardListStarUp(cardId, cardList)
end

function RedDotCard.CanCardListStarUp(cardId, cardList)
  if LevelIsWithTheRange(70011103) and PowerRankIsWithTheRange(70011104, cardId, cardList) and RedDotCard.CanStarUp(cardId) then
    return true
  end
end

function RedDotCard.CannCardListGrowUp(cardId, cardList)
  if LevelIsWithTheRange(70011101) and PowerRankIsWithTheRange(70011102, cardId, cardList) and RedDotCard.CanLevelUp(cardId) then
    return true
  end
  if LevelIsWithTheRange(70011112) and PowerRankIsWithTheRange(70011113, cardId, cardList) and RedDotCard.CanBreachUp(cardId) then
    return true
  end
  if LevelIsWithTheRange(70011105) and PowerRankIsWithTheRange(70011106, cardId, cardList) and RedDotCard.CanSkillUp(cardId) then
    return true
  end
  if LevelIsWithTheRange(70011110) and PowerRankIsWithTheRange(70011111, cardId, cardList) then
    return RedDotCard.CanClothes(cardId) or RedDotCard.CanPlot(cardId)
  end
end

function RedDotCard.CanCardNew(cardId)
  local cardConfig = TableData.GetConfig(cardId, "BaseCard")
  if cardConfig.initial_tag == nil and not CardMgr.CheckCardClicked(cardId) then
    return true
  end
end

function RedDotCard.CanCardUp(cardId)
  return RedDotCard.CanLevelUp(cardId) or RedDotCard.CanBreachUp(cardId)
end

function RedDotCard.CanLevelUp(cardId)
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CARD_LEVELUP, false) then
    local cardData = CardData.GetCardDataById(cardId)
    if cardData then
      local cardConfig = TableData.GetConfig(cardId, "BaseCard")
      if nil == cardConfig then
        return false
      end
      local cardQualityUpConfig = TableData.GetConfig(cardId * 1000 + cardData.quality, "BaseCardQualityUp")
      local levelMax = cardQualityUpConfig.card_level_max
      if levelMax <= cardData.level then
        return false
      else
        local id = cardConfig.grow_cost_model_id * 1000 + cardData.level
        local costConfig = TableData.GetConfig(id, "BaseCardLevelUpCost")
        local needExp = costConfig.next_exp - cardData.exp
        if needExp > 0 then
          local needGold = costConfig.cost_money * needExp
          if needGold > ActorData.GetItemCount(COMMON_ITEM_ID.GAME_COIN) then
            return false
          end
          if needExp > RedDotCard.GetAllItemExp() then
            return false
          end
          return true
        end
      end
    end
  end
  return false
end

function RedDotCard.CanBreachUp(cardId)
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CARD_STAR, false) then
    local cardData = CardData.GetCardDataById(cardId)
    if cardData then
      local cardConfig = TableData.GetConfig(cardId, "BaseCard")
      if nil == cardConfig then
        return false
      end
      local cardQualityUpConfig = TableData.GetConfig(cardId * 1000 + cardData.quality, "BaseCardQualityUp")
      if cardData.quality >= cardConfig.quality_max then
        return false
      end
      if cardData.level < cardQualityUpConfig.card_level_max then
        return false
      end
      local cost = cardQualityUpConfig.cost
      for _, v in ipairs(cost) do
        local strs = Split(v, ":")
        local count = ActorData.GetItemCount(tonumber(strs[2]))
        local needCount = tonumber(strs[3])
        if count < needCount then
          return false
        end
      end
      return true
    end
  end
  return false
end

function RedDotCard.CanStarUp(cardId)
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CARD_AWAKE, false) then
    local cardData = CardData.GetCardDataById(cardId)
    if cardData then
      local cardConfig = TableData.GetConfig(cardId, "BaseCard")
      if nil == cardConfig then
        return false
      end
      local cardGradUpConfig = TableData.GetConfig(cardId * 1000 + cardData.grade, "BaseCardGradeUp")
      if cardData.grade >= cardConfig.grade_max then
        return false
      end
      local cost = cardGradUpConfig.cost
      for _, v in ipairs(cost) do
        local strs = Split(v, ":")
        local count = ActorData.GetItemCount(tonumber(strs[2]))
        local needCount = tonumber(strs[3])
        if count < needCount then
          return false
        end
      end
      return true
    end
  end
  return false
end

function RedDotCard.CanSkillUp(cardId)
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CARD_SKILL_LEVELUP, false) then
    local cardData = CardData.GetCardDataById(cardId)
    if cardData then
      local cardConfig = TableData.GetConfig(cardId, "BaseCard")
      if nil == cardConfig then
        return false
      end
      local skillId = {
        cardConfig.normal_skill,
        cardConfig.special_skill,
        cardConfig.burst_skill
      }
      for i = 1, #cardConfig.grow_skill_ids do
        table.insert(skillId, cardConfig.grow_skill_ids[i])
      end
      local skillData
      for _, v in ipairs(skillId) do
        skillData = TableData.GetConfig(v, "BaseSkill")
        if nil == cardData.skill2Level[v] or cardData.skill2Level[v] < skillData.max_level then
          local curLv = cardData.skill2Level[v] or 0
          local nextSkillLvData = TableData.GetConfig(skillData.id * 1000 + curLv + 1, "BaseSkillLevelUp")
          if nextSkillLvData and nextSkillLvData.cost then
            local up = true
            local costItem = GetConfigItemList(nextSkillLvData.cost, true)
            local count
            for i = 1, #costItem do
              count = ActorData.GetItemCount(costItem[i].id)
              if count < costItem[i].value then
                up = false
              end
            end
            local lvBol = nil == nextSkillLvData.need_quality_level and true or cardData.quality >= nextSkillLvData.need_quality_level
            if up and lvBol then
              return true
            end
          end
        end
      end
    end
  end
end

function RedDotCard.CanClothes(cardId)
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CARD_CLOTHES, false) then
    local cardData = CardData.GetCardDataById(cardId)
    if cardData then
      local fashionId = CardMgr.GetCardAllFashionId(cardId)
      local cardConfig = TableData.GetConfig(cardId, "BaseCard")
      for i, v in pairs(fashionId) do
        if cardConfig.fashion_id ~= v and cardData.ownFashionIds[v] and not CardMgr.CheckClicked(cardId, v) then
          return true
        end
      end
    end
  end
end

function RedDotCard.CanPlot(cardId)
  return RedDotCard.CanStory(cardId) or RedDotCard.CanVoice(cardId)
end

function RedDotCard.CanStory(cardId)
  local ids = {
    85010001,
    85010002,
    85010003,
    85010004
  }
  local cardConfig = TableData.GetConfig(cardId, "BaseCard")
  local cardData = CardData.GetCardDataById(cardId)
  if cardConfig and cardData and cardConfig.story_ids then
    local arr, lockLv
    for i, v in pairs(cardConfig.story_ids) do
      arr = Split(v, ":")
      if arr and arr[2] then
        lockLv = tonumber(arr[2])
        if lockLv and 0 ~= lockLv and not CardMgr.CheckClicked(cardId, ids[i]) and lockLv <= cardData.quality then
          return true
        end
      end
    end
  end
end

function RedDotCard.CanVoice(cardId)
  local cardConfig = TableData.GetConfig(cardId, "BaseCard")
  local cardData = CardData.GetCardDataById(cardId)
  if cardConfig and cardData then
    for i, v in pairs(cardConfig.sound_ids) do
      local data = TableData.GetConfig(v, "BaseCardSound")
      if not CardMgr.CheckClicked(cardId, v) then
        if data.quality_level then
          return cardData.quality >= data.quality_level
        elseif data.grade_level then
          return cardData.grade >= data.grade_level
        end
      end
    end
  end
end
