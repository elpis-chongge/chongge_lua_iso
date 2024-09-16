CardMgr = {ctrIndex = 0}

function CardMgr.InitData(cardId)
  CardMgr.cardId = cardId
  CardMgr.cardConfigData = TableData.GetConfig(cardId, "BaseCard")
  CardMgr.cardInfoData = CardData.GetCardDataById(cardId)
  local gradeId = cardId * 1000 + CardMgr.cardInfoData.grade
  CardMgr.CardGradeUpData = TableData.GetConfig(gradeId, "BaseCardGradeUp")
  local lvId = CardMgr.cardConfigData.grow_cost_model_id * 1000 + CardMgr.cardInfoData.level
  local qualityUpId = cardId * 1000 + CardMgr.cardInfoData.quality
  CardMgr.cardLevelUpCostData = TableData.GetConfig(lvId, "BaseCardLevelUpCost")
  local upId = CardMgr.cardConfigData.grow_model_id * 1000 + CardMgr.cardInfoData.level
  CardMgr.cardLevelUpData = TableData.GetConfig(upId, "BaseCardLevelUp")
  CardMgr.cardQualityUpData = TableData.GetConfig(qualityUpId, "BaseCardQualityUp")
end

function CardMgr.UpdateMsgData(msg)
  local info = msg.updateInfo
  ActorData.SetCardSyncKey(info.syncKey)
  if CardMgr.cardInfoData and CardMgr.cardInfoData.cardId == info.cardId then
    if info.gradeUpSkills and table.getLen(info.gradeUpSkills) > 0 then
      CardMgr.cardInfoData.gradeUpSkills = info.gradeUpSkills
    end
    if info.attributes then
      for i, v in pairs(info.attributes) do
        CardMgr.cardInfoData.attributes[i] = v
      end
    end
    if info.basic then
      if info.basic[1] then
        CardMgr.cardInfoData.level = info.basic[1]
      end
      if info.basic[2] then
        CardMgr.cardInfoData.quality = info.basic[2]
      end
      if info.basic[3] then
        CardMgr.cardInfoData.weaponLevel = info.basic[3]
      end
      if info.basic[4] then
        CardMgr.cardInfoData.weaponQuality = info.basic[4]
      end
      if info.basic[5] then
        CardMgr.cardInfoData.grade = info.basic[5]
      end
      if info.basic[6] then
        CardMgr.cardInfoData.power = info.basic[6]
      end
      if info.basic[7] then
        CardMgr.cardInfoData.exp = info.basic[7]
      end
      if info.basic[8] then
        CardMgr.cardInfoData.fashionId = info.basic[8]
      end
    end
    if info.skill2Level then
      for i, v in pairs(info.skill2Level) do
        CardMgr.cardInfoData.skill2Level[i] = v
        if -1 == CardMgr.cardInfoData.skill2Level[i] then
          CardMgr.cardInfoData.skill2Level[i] = nil
        end
      end
    end
    if info.ownFashionIds then
      CardMgr.cardInfoData.ownFashionIds = info.ownFashionIds
    end
    if info.skillUpFinishStamp then
      CardMgr.cardInfoData.skillUpFinishStamp = info.skillUpFinishStamp
    end
    ActorData.AddCard(CardMgr.cardInfoData)
  end
end

function CardMgr.GetSkillISUnlock(skillId)
  local skills = CardMgr.cardInfoData.skill2Level
  for i, v in pairs(skills) do
    if i == skillId then
      return true
    end
  end
  return false
end

function CardMgr.IsMaxLevel()
  local data = TableData.GetConfig(CardMgr.cardId * 1000 + CardMgr.cardConfigData.quality_max, "BaseCardQualityUp")
  return CardMgr.cardInfoData.level == data.card_level_max
end

function CardMgr.StarIsMax()
  return CardMgr.cardInfoData.quality == CardMgr.cardConfigData.quality_max
end

function CardMgr.SaveFashionId(msg)
  CardMgr.fashionIds = msg.fashionIds
end

function CardMgr.GetCardAllFashionId(cardId)
  local data
  local tb = {}
  local cardConfigData = TableData.GetConfig(cardId, "BaseCard")
  if cardConfigData then
    for i, v in pairs(cardConfigData.fashion_ids) do
      table.insert(tb, v)
    end
  end
  local cardInfoData = CardData.GetCardDataById(cardId)
  if cardInfoData and cardInfoData.ownFashionIds then
    for i, v in pairs(cardInfoData.ownFashionIds) do
      if table.contain(tb, i) == false then
        table.insert(tb, i)
      end
    end
  end
  if CardMgr.fashionIds and cardId then
    for i, v in pairs(CardMgr.fashionIds) do
      data = TableData.GetConfig(v, "BaseFashion")
      if data.card_id == cardId and table.contain(tb, v) == false then
        table.insert(tb, v)
      end
    end
    table.sort(tb)
  end
  return tb
end

function CardMgr.GetCardAllFashionIdForChooseHead(cardId)
  local cardConfigData = TableData.GetConfig(cardId, "BaseCard")
  local tb = {
    {
      fashionId = cardConfigData.fashion_id,
      unlock = true
    }
  }
  local configFashionIds = cardConfigData.fashion_ids
  local cardData = CardData.GetCardDataById(cardId)
  local quality = cardData.quality
  for i = 0, 3 do
    local qualityUpConfig = TableData.GetConfig(cardId * 1000 + i, "BaseCardQualityUp")
    if qualityUpConfig and qualityUpConfig.unlock_fashion_id > 0 then
      if i <= quality then
        table.insert(tb, {
          fashionId = qualityUpConfig.unlock_fashion_id,
          unlock = true
        })
      else
        table.insert(tb, {
          fashionId = qualityUpConfig.unlock_fashion_id,
          unlock = false,
          needQuality = i
        })
      end
    end
  end
  if cardData and cardData.ownFashionIds then
    for i, v in pairs(cardData.ownFashionIds) do
      if false == table.contain(configFashionIds, i) then
        table.insert(tb, {fashionId = i, unlock = true})
      end
    end
  end
  table.sort(tb, function(a, b)
    return a.fashionId < b.fashionId
  end)
  return tb
end

function CardMgr.InitCtrIndex()
  CardMgr.ctrIndex = 0
end

function CardMgr.CardLvIsUp(cardId, lv, exp)
  local info = CardData.GetCardDataById(cardId)
  if info and (lv <= info.level or nil == lv) and (nil == exp or exp <= info.exp) then
    return true
  end
  return false
end

function CardMgr.CardLvIsEqual(cardId, lv)
  local info = CardData.GetCardDataById(cardId)
  if info then
    return info.level == lv
  end
  return false
end

function CardMgr.GetItemIdByStarLv(starLv)
  local items = TableData.GetTable("BaseItem")
  local id = {}
  for i, v in pairs(items) do
    if v.type == ProtoEnum.ITEM_TYPE.UNIVERSAL_CARD then
      table.insert(id, v)
    end
  end
  for _, v in pairs(id) do
    if not string.isEmptyOrNil(v.effect_value) then
      local arr = Split(v.effect_value, "|")
      for i = 1, #arr do
        if tonumber(arr[i]) == starLv then
          return v.id
        end
      end
    end
  end
end

function CardMgr.ShowSkillTypeInfo(skillData, item, color)
  if item and skillData then
    if skillData.type == SKILL_TYPE_ENUM.SMALL then
      ChangeUIController(item, "c1", 1)
      UIUtil.SetText(item:GetChild("SkillDetailsTag"), CardData.GetSkillTypeName(skillData.type, color), "WordTxt")
    elseif skillData.type == SKILL_TYPE_ENUM.BURST_CARD then
      ChangeUIController(item, "c1", 2)
      if skillData.cd then
        UIUtil.SetText(item:GetChild("SkillDetailsCD"), T(1140, skillData.cd), "TimeTxt")
      end
      UIUtil.SetText(item:GetChild("SkillDetailsTag"), CardData.GetSkillTypeName(skillData.type), "WordTxt")
    elseif skillData.type == SKILL_TYPE_ENUM.LEADER then
      ChangeUIController(item, "c1", 3)
      UIUtil.SetText(item:GetChild("SkillDetailsTag"), CardData.GetSkillTypeName(skillData.type), "WordTxt")
    elseif skillData.type == SKILL_TYPE_ENUM.NORMAL then
      ChangeUIController(item, "c1", 4)
      UIUtil.SetText(item:GetChild("SkillDetailsTag"), CardData.GetSkillTypeName(skillData.type), "WordTxt")
    end
  end
end

function CardMgr.GetCurSkillLv(skillId)
  local lv = CardMgr.cardInfoData.skill2Level[skillId] or 0
  local addLv = CardMgr.cardInfoData.gradeUpSkills[skillId] or 0
  return lv + addLv
end

function CardMgr.GetPowerRank(cardList, cardId)
  if cardList then
    for rank, v in ipairs(cardList) do
      if v.cardId == cardId then
        return rank
      end
    end
  end
end

function CardMgr.SaveClickedId(info)
  CardMgr.clickedStoryEventId = info
end

function CardMgr.UpdateOneClickedEventId(cardId, id)
  if CardMgr.clickedStoryEventId then
    local bol = true
    for i, v in pairs(CardMgr.clickedStoryEventId) do
      if v.cardId == cardId then
        bol = false
        if not table.contain(v.eventIds, id) then
          table.insert(CardMgr.clickedStoryEventId[i].eventIds, id)
        end
        return
      end
    end
    if bol then
      table.insert(CardMgr.clickedStoryEventId, {
        cardId = cardId,
        eventIds = {id}
      })
    end
  end
end

function CardMgr.SaveEventNewReq(cardId, ids, notUpdate)
  local info = {}
  for i, v in pairs(cardId) do
    local new = {}
    for _, vv in pairs(ids) do
      if not CardMgr.CheckClicked(cardId, vv) then
        table.insert(new, vv)
      end
    end
    if #new > 0 then
      table.insert(info, {cardId = v, eventIds = new})
    end
  end
  if #info > 0 then
    CardService.ClickCardStoryEventReportReq(info, function()
      for _, v in pairs(info) do
        for i, vv in pairs(v.eventIds) do
          CardMgr.UpdateOneClickedEventId(v.cardId, vv)
        end
      end
      if notUpdate then
        return
      end
      RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.CARD)
    end)
  end
end

function CardMgr.CheckClicked(cardId, id)
  if CardMgr.clickedStoryEventId then
    for i, v in pairs(CardMgr.clickedStoryEventId) do
      if v.cardId == cardId then
        return table.contain(v.eventIds, id)
      end
    end
  end
end

function CardMgr.CheckCardClicked(cardId)
  if CardMgr.clickedStoryEventId then
    for i, v in pairs(CardMgr.clickedStoryEventId) do
      if v.cardId == cardId then
        return true
      end
    end
  end
end

function CardMgr.OnClose()
  CardMgr.cardId = nil
  CardMgr.cardLevelUpData = nil
  CardMgr.cardConfigData = nil
  CardMgr.cardLevelUpCostData = nil
  CardMgr.cardQualityUpData = nil
  CardMgr.CardGradeUpData = nil
  CardMgr.cardInfoData = nil
end
