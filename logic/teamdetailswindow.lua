require("GuildTrain_TeamDetailsWindowByName")
local TeamDetailsWindow = {}
local uis, contentPane, jumpTb
local bottomGridMap = {}
local timeText, posCard, chooseEffect, stageData
local bottomGridWidth = 80
local rotation = 30

function TeamDetailsWindow.ReInitData()
end

function TeamDetailsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.TeamDetailsWindow.package, WinResConfig.TeamDetailsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildTrain_TeamDetailsWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.GUILD_TRAIN_DETAILS)
    local stageId = bridgeObj.argTable[1]
    local uin = bridgeObj.argTable[2]
    timeText = ""
    if stageId then
      GuildService.GetGuildPracticeRecordReq(stageId, uin)
      stageData = TableData.GetConfig(stageId, "BaseStage")
      if stageData and stageData.limit_frame then
        timeText = stageData.limit_frame == 5400 and T(1290) or T(1291)
      end
    end
    TeamDetailsWindow.InitMapPos()
    TeamDetailsWindow.InitBtn()
  end)
end

function TeamDetailsWindow.InitMapPos()
  local girdRoot = uis.Main.GirdRoot.root
  local mapConfig = TableData.GetConfig(stageData.map_id, "BaseMap")
  local sizeX = mapConfig.size_own[1]
  local sizeY = mapConfig.size_own[2]
  local curMapGridScale = Const.gridScaleTable[sizeY]
  girdRoot.width = bottomGridWidth * (sizeX + 1)
  girdRoot.height = bottomGridWidth * (sizeY + 1)
  girdRoot:SetScale(curMapGridScale, curMapGridScale)
  local gridInitX = (girdRoot.width - sizeX * bottomGridWidth) / 2
  local gridInitY = (girdRoot.height - sizeY * bottomGridWidth) / 2
  girdRoot.displayObject.rotationX = rotation
  bottomGridMap = {}
  for x = 1, sizeX do
    for y = 1, sizeY do
      local index = x * 100 + y
      bottomGridMap[index] = {
        index = index,
        x = (x - 1) * bottomGridWidth + gridInitX,
        y = (y - 1) * bottomGridWidth + gridInitY
      }
    end
  end
end

function TeamDetailsWindow.Show()
  local data = GuildData.GetDetailsData()
  if data then
    uis.Main.TotalDamage.WordTxt.text = T(1294)
    uis.Main.TotalDamage.NumberTxt.text = NumberByCommaStyle(data.totalDamage)
    uis.Main.TotalTime.WordTxt.text = T(1295)
    uis.Main.TotalTime.NumberTxt.text = timeText
    chooseEffect = nil
    posCard = {}
    local listData = TeamDetailsWindow.GetListData(data)
    if table.getLen(listData) > 0 then
      local maxAtk = listData[1].atk
      local lastItem, lastHolder
      
      function uis.Main.HeadList.itemRenderer(i, item)
        local infoData = listData[i + 1]
        if nil == infoData then
          ChangeUIController(item, "c2", 1)
          item.touchable = false
          return
        end
        item.touchable = true
        local cardConfig = TableData.GetConfig(infoData.info.cardId, "BaseCard")
        local bar = item:GetChild("DamageProgressBar")
        UIUtil.SetText(item, NumberByCommaStyle(infoData.atk), "NumberTxt")
        UIUtil.SetText(item, cardConfig.name(), "NameTxt")
        bar.min = 0
        bar.max = maxAtk
        bar.value = infoData.atk
        local CardHead = item:GetChild("CardHead")
        local occupation = CardHead:GetChild("Occupation")
        ChangeUIController(occupation, "c1", cardConfig.type - 1)
        local elementList = CardHead:GetChild("ElementList")
        UIUtil.ShowElementList(elementList, cardConfig)
        UIUtil.SetHeadByFaceId(infoData.info.fashionId, CardHead:GetChild("PicMask"):GetChild("PicLoader"), HEAD_ICON_TYPE_ENUM.SQUARE)
        local breach = CardHead:GetChild("CardBreach")
        if breach then
          ChangeUIController(breach, "c1", infoData.info.quality)
        end
        local starList = CardHead:GetChild("StarList")
        if starList then
          UIUtil.ShowStarList(starList, infoData.info, cardConfig)
        end
        local upId = cardConfig.grow_model_id * 1000 + infoData.info.level
        local cardLevelUpData = TableData.GetConfig(upId, "BaseCardLevelUp")
        if cardLevelUpData then
          UIUtil.SetText(CardHead, T(1296, cardLevelUpData.level_show), "LevelTxt")
        end
        ChangeUIController(CardHead, "c1", cardConfig.star - 1)
        item.onClick:Set(function()
          if lastItem == item then
            return
          end
          ChangeUIController(lastItem, "c1", 0)
          ChangeUIController(item, "c1", 1)
          lastItem = item
          if lastHolder then
            lastHolder.visible = false
          end
          if nil == chooseEffect then
            chooseEffect = UIMgr:CreateObject("GuildTrain", "TargetLattice")
            local girdRoot = uis.Main.GirdRoot.root
            girdRoot:AddChildAt(chooseEffect, 0)
            local gridInfo = bottomGridMap[infoData.pos]
            local offset = bottomGridWidth / 2
            chooseEffect:SetXY(gridInfo.x + offset, gridInfo.y + offset)
            chooseEffect.rotationX = -rotation
            ResourceManager.InstantiateAsync("Assets/Art/Effects/Prefab/UI_prefab/Embattle/FX_embattle_single_choose_green.prefab", function(effect)
              UIUtil.SetObjectToUI(effect, chooseEffect:GetChild("TargetHolder"))
              LuaUtil.SetLocalEuler(effect, -60, 0, 0)
              LuaUtil.SetScale(effect, Const.mapScale, Const.mapScale, Const.mapScale, true)
            end)
          else
            local gridInfo = bottomGridMap[infoData.pos]
            local offset = bottomGridWidth / 2
            chooseEffect:SetXY(gridInfo.x + offset, gridInfo.y + offset)
          end
        end)
      end
      
      uis.Main.HeadList.numItems = 8
    else
      uis.Main.HeadList.numItems = 0
    end
    TeamDetailsWindow.UpdateBurst(data)
    local newTb = {}
    for pos, cardInfo in pairs(data.pos2CardInfos) do
      table.insert(newTb, {
        pos = pos,
        cardInfo = cardInfo,
        sort = pos % 100
      })
    end
    table.sort(newTb, function(a, b)
      return a.sort < b.sort
    end)
    for i = 1, #newTb do
      TeamDetailsWindow.ShowCard(newTb[i].cardInfo, newTb[i].pos)
    end
  end
end

function TeamDetailsWindow.UpdateBurst(data)
  local burst = uis.Main.BurstStrip
  local list = burst.OccupationList
  list:RemoveChildrenToPool()
  local countByTypeList = TeamDetailsWindow.GetEmbattledCardCountSplitByType(data.pos2CardInfos)
  local showCardTypeList = {
    {
      type = BATTLE_UNIT_TYPE.RANGED_ATTACK,
      c1Index = 4
    },
    {
      type = BATTLE_UNIT_TYPE.SUPPORT,
      c1Index = 3
    },
    {
      type = BATTLE_UNIT_TYPE.MELEE_ATTACK,
      c1Index = 1
    },
    {
      type = BATTLE_UNIT_TYPE.DEFENSE,
      c1Index = 0
    }
  }
  local activeCount = 0
  for i, v in ipairs(showCardTypeList) do
    local hand = list:AddItemFromPool()
    ChangeUIController(hand, "c1", v.c1Index)
    local count = countByTypeList[v.type]
    if count and count > 0 then
      ChangeUIController(hand, "c2", 1)
      activeCount = activeCount + 1
      hand:GetChild("NumberTxt").text = count
    else
      ChangeUIController(hand, "c2", 0)
    end
  end
  if activeCount >= #showCardTypeList then
    burst.c1Ctr.selectedIndex = 1
  else
    burst.c1Ctr.selectedIndex = 0
  end
  if 0 ~= data.leaderCardId then
    local cardInfo = CardData.GetCardDataById(data.leaderCardId)
    burst.c2Ctr.selectedIndex = 0
    burst.LeaderHead.c1Ctr.selectedIndex = 0
    if cardInfo then
      UIUtil.SetHeadByFaceId(cardInfo.fashionId, burst.LeaderHead.LeaderHeadBg.HeadLoader, HEAD_ICON_TYPE_ENUM.RECT)
    end
  else
    burst.c2Ctr.selectedIndex = 1
    burst.LeaderHead.c1Ctr.selectedIndex = 1
    burst.BurstStripTips.WordTxt.text = T(10331)
  end
end

function TeamDetailsWindow.GetEmbattledCardCountSplitByType(curCard2Pos)
  local countByTypeList = {}
  for i, v in pairs(curCard2Pos) do
    if i and v then
      local cardConfig = CardData.GetBaseConfig(v.cardId)
      local type = cardConfig.type
      if nil == countByTypeList[type] then
        countByTypeList[type] = 0
      end
      countByTypeList[type] = countByTypeList[type] + 1
    end
  end
  return countByTypeList
end

function TeamDetailsWindow.GetListData(data)
  local GetInfoByUid = function(uid)
    for i, v in pairs(data.pos2CardInfos) do
      if v.cardUid == uid then
        return v, i
      end
    end
  end
  local new = {}
  for i, v in pairs(data.cardUid2Damages) do
    local info, pos = GetInfoByUid(i)
    table.insert(new, {
      uid = i,
      atk = v,
      info = info,
      pos = pos
    })
  end
  table.sort(new, function(a, b)
    return a.atk > b.atk
  end)
  return new
end

function TeamDetailsWindow.ShowCard(cardInfo, pos)
  local object = UIMgr:CreateObject("GuildTrain", "CardInfoLeft")
  local girdRoot = uis.Main.GirdRoot.root
  object.gameObjectName = pos
  girdRoot:AddChild(object)
  local gridInfo = bottomGridMap[pos]
  local offset = bottomGridWidth / 2
  object:SetXY(gridInfo.x + offset, gridInfo.y + offset)
  object.rotationX = -rotation
  local cardConfig = TableData.GetConfig(cardInfo.cardId, "BaseCard")
  local occupation = object:GetChild("Occupation")
  local cardType = cardConfig.type
  ChangeUIController(occupation, "c1", cardConfig.type - 1)
  local elementList = object:GetChild("ElementList")
  UIUtil.ShowElementList(elementList, cardConfig)
  local fashionConfig = TableData.GetConfig(cardInfo.fashionId, "BaseFashion")
  if fashionConfig then
    UIUtil.SetCardBattleSpine(ModelUtil.GetFullPath(fashionConfig.spd), object:GetChild("CardHolder"), SPINE_STATE_ENUM.IDLE, true, Const.cardScale * fashionConfig.spd_scale / 10000, true, function(spineModel)
      SkeletonAnimationUtil.SetFlip(spineModel, false, false)
      SkeletonAnimationUtil.SetShaderEffectEnable(spineModel, false, true)
    end)
  end
  posCard[pos] = object:GetChild("EffectHolder")
end

function TeamDetailsWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.TeamDetailsWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.GUILD_TRAIN_DETAILS)
end

function TeamDetailsWindow.OnClose()
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  bottomGridMap = nil
  timeText = nil
  posCard = nil
  chooseEffect = nil
  stageData = nil
end

function TeamDetailsWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.GuildWindow.GET_TRAIN_DETAILS then
    TeamDetailsWindow.Show()
  end
end

return TeamDetailsWindow
