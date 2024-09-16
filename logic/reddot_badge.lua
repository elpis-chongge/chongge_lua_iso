RedDotBadge = {}

function RedDotBadge.CanShowHome()
  if not EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BADGE, false) then
    return false
  end
  local allCard = ActorData.GetCardList()
  for i, v in pairs(allCard) do
    if RedDotBadge.CanCardRanRankWear(v.cardId) then
      return true
    end
  end
end

function RedDotBadge.CanCardRanRankWear(cardId)
  if not EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BADGE, false) then
    return false
  end
  local cardList = CardData.GetSortCardList()
  if LevelIsWithTheRange(70011108) and PowerRankIsWithTheRange(70011107, cardId, cardList) then
    return RedDotBadge.CanCardWear(cardId)
  end
end

function RedDotBadge.CanCardWear(cardId)
  if not EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BADGE, false) then
    return false
  end
  local cardInfo = CardData.GetCardDataById(cardId)
  if cardInfo then
    if 3 == #cardInfo.wearBadgeUids then
      return false
    end
    local findType = {}
    local teamBadge
    for i, v in ipairs(cardInfo.wearBadgeUids) do
      local info = ActorData.GetBadgeInfoByUid(v)
      if info then
        teamBadge = TableData.GetConfig(info.badgeId, "BaseBadge")
        if teamBadge then
          findType[teamBadge.type] = true
        end
      end
    end
    local all = ActorData.GetAllBadge()
    for i, v in pairs(all) do
      if 0 == v.wearCardId then
        teamBadge = TableData.GetConfig(v.badgeId, "BaseBadge")
        if teamBadge and not findType[teamBadge.type] then
          return true
        end
      end
    end
  end
end
