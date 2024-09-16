require("Formation_BurstTipsWindowByName")
local BurstTipsWindow = {}
local uis, contentPane

function BurstTipsWindow.ReInitData()
end

local cardUidList, curCaptainCardId, curCaptainCard, curCard2Pos, curBurstOrderSetting, sceneType, skillChoose_uis

function BurstTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BurstTipsWindow.package, WinResConfig.BurstTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetFormation_BurstTipsWindowUis(contentPane)
    curCaptainCardId = bridgeObj.argTable[1]
    cardUidList = bridgeObj.argTable[2]
    curCard2Pos = bridgeObj.argTable[3]
    curBurstOrderSetting = bridgeObj.argTable[4]
    sceneType = bridgeObj.argTable[5]
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_SKILL_IN)
    if curBurstOrderSetting then
      for _, v in ipairs(curBurstOrderSetting) do
        local cardList = v.cardList
        if cardList and #cardList > 0 then
          for index = #cardList, 1, -1 do
            if nil == curCard2Pos[cardList[index]] then
              table.remove(v.cardList, index)
            end
          end
        end
      end
    end
    BurstTipsWindow.UpdateInfo()
    BurstTipsWindow.InitBtn()
  end)
end

function BurstTipsWindow.UpdateBurstOperationInfo()
  local tips = uis.Main.BurstTips.BurstTips3
  tips.TitleTxt.text = T(10336)
  local headList = tips.HeadList
  headList:RemoveChildrenToPool()
  local embattledCardList = {}
  if curCard2Pos then
    for uid, pos in pairs(curCard2Pos) do
      local cardInfo = FormationData.GetCardDataByUid(uid, sceneType)
      local cardConfig = TableData.GetConfig(cardInfo.cardId, "BaseCard")
      table.insert(embattledCardList, {
        cardInfo = cardInfo,
        cardConfig = cardConfig,
        pos = pos,
        posX = math.floor(pos / 100),
        posY = pos % 100
      })
    end
  end
  table.sort(embattledCardList, function(a, b)
    if a.cardConfig.type == b.cardConfig.type then
      if a.posX == b.posX then
        return a.posY < b.posY
      else
        return a.posX > b.posX
      end
    else
      return a.cardConfig.type < b.cardConfig.type
    end
  end)
  
  function headList.itemRenderer(index, item)
    local cardInfo = embattledCardList[index + 1] and embattledCardList[index + 1].cardInfo
    if cardInfo then
      item.touchable = true
      local isInOrder = BurstTipsWindow.IsInOrder(cardInfo.cardUid)
      if isInOrder then
        ChangeUIController(item, "c1", 1)
        item:GetChild("SetSelected"):GetChild("WordTxt").text = T(10340)
      else
        ChangeUIController(item, "c1", 0)
      end
      ChangeUIController(item, "c2", 0)
      local headFrame = item:GetChild("CardHead")
      local fashionConfig = TableData.GetConfig(cardInfo.fashionId, "BaseFashion")
      local loader = headFrame:GetChild("PicMask"):GetChild("PicLoader")
      loader.url = UIUtil.GetResUrl(fashionConfig.head_icon_square)
      local cardConfig = TableData.GetConfig(cardInfo.cardId, "BaseCard")
      ChangeUIController(headFrame, "c1", cardConfig.star - 1)
      local occupation = headFrame:GetChild("Occupation")
      ChangeUIController(occupation, "c1", cardConfig.type - 1)
      ChangeUIController(occupation, "c2", 1)
      local elementList = headFrame:GetChild("ElementList")
      UIUtil.ShowElementList(elementList, cardConfig)
      local burstSkillConfig = TableData.GetConfig(cardConfig.burst_skill, "BaseSkill")
      headFrame:GetChild("TimeTxt").text = T(10653, burstSkillConfig.cd)
      item.onClick:Set(function()
        if isInOrder then
          BurstTipsWindow.RemoveFromOrderList(cardInfo.cardUid)
        else
          BurstTipsWindow.AddIntoOrderList(cardInfo.cardUid, cardConfig.type)
        end
      end)
    else
      ChangeUIController(item, "c2", 1)
      item.touchable = false
    end
  end
  
  headList.numItems = 8
  local setRoundRegion = tips.SetRoundRegion
  local switchBtn = setRoundRegion.SwitchBtn
  UIUtil.SetText(switchBtn, T(10337), "WordTxt")
  UIUtil.SetText(switchBtn, T(10338), "Word1Txt")
  local cardJobList = setRoundRegion.CardList
  cardJobList:RemoveChildrenToPool()
  local jobInfoList = {
    {
      type = BATTLE_UNIT_TYPE.DEFENSE
    },
    {
      type = BATTLE_UNIT_TYPE.MELEE_ATTACK
    },
    {
      type = BATTLE_UNIT_TYPE.SUPPORT
    },
    {
      type = BATTLE_UNIT_TYPE.RANGED_ATTACK
    }
  }
  
  function cardJobList.itemRenderer(index, item)
    local jobInfo = jobInfoList[index + 1]
    ChangeUIController(item:GetChild("RoundStripOcpTitle"), "c1", jobInfo.type - 1)
    local orderList = BurstTipsWindow.GetBurstOrderByType(jobInfo.type)
    local orderHeadList = item:GetChild("HeadList")
    
    function orderHeadList.itemRenderer(_index, headFrame)
      local uid = orderList[_index + 1]
      local cardInfo = FormationData.GetCardDataByUid(uid, sceneType)
      local fashionConfig = TableData.GetConfig(cardInfo.fashionId, "BaseFashion")
      local loader = headFrame:GetChild("HeadBg"):GetChild("PicLoader")
      loader.url = UIUtil.GetResUrl(fashionConfig.head_icon_rect)
      local cardConfig = TableData.GetConfig(cardInfo.cardId, "BaseCard")
      headFrame.onClick:Set(function()
        BurstTipsWindow.RemoveFromOrderList(cardInfo.cardUid)
      end)
      local occupation = headFrame:GetChild("Occupation")
      ChangeUIController(occupation, "c1", cardConfig.type - 1)
      ChangeUIController(occupation, "c2", 1)
      local elementList = headFrame:GetChild("ElementList")
      UIUtil.ShowElementList(elementList, cardConfig)
      local burstSkillConfig = TableData.GetConfig(cardConfig.burst_skill, "BaseSkill")
      headFrame:GetChild("TimeTxt").text = T(10653, burstSkillConfig.cd)
    end
    
    orderHeadList.numItems = orderList and #orderList or 0
    if orderHeadList.numItems > 0 then
      ChangeUIController(item, "c1", 1)
    else
      item:GetChild("TipsTxt").text = T(10339)
      ChangeUIController(item, "c1", 0)
    end
  end
  
  cardJobList.numItems = #jobInfoList
  local ruleList = setRoundRegion.WordList
  ruleList:RemoveChildrenToPool()
  local featureConfig = TableData.GetConfig(FEATURE_ENUM.BURST_OPERATION, "BaseFeature")
  local rule_des = featureConfig.rule_des_1
  if rule_des then
    for _, v in ipairs(rule_des) do
      local content = ruleList:AddItemFromPool()
      local contentList = Split(v, ":")
      local wordList = content:GetChild("WordList")
      wordList:RemoveChildrenToPool()
      for i, id in ipairs(contentList) do
        local hand = wordList:AddItemFromPool()
        hand:GetChild("WordTxt").text = T(tonumber(id))
      end
      wordList:ResizeToFit()
    end
  end
end

function BurstTipsWindow.AddIntoOrderList(uid, job)
  if nil == curBurstOrderSetting then
    curBurstOrderSetting = {}
  end
  if curBurstOrderSetting then
    for _, info in ipairs(curBurstOrderSetting) do
      if info.job == job then
        if nil == info.cardList then
          info.cardList = {}
        end
        table.insert(info.cardList, uid)
        BurstTipsWindow.UpdateBurstOperationInfo()
        return
      end
    end
  end
  table.insert(curBurstOrderSetting, {
    job = job,
    cardList = {uid}
  })
  BurstTipsWindow.UpdateBurstOperationInfo()
end

function BurstTipsWindow.RemoveFromOrderList(uid)
  if curBurstOrderSetting then
    for _, info in ipairs(curBurstOrderSetting) do
      if info.cardList then
        for index, cardUid in ipairs(info.cardList) do
          if cardUid == uid then
            table.remove(info.cardList, index)
            BurstTipsWindow.UpdateBurstOperationInfo()
            return
          end
        end
      end
    end
  end
end

function BurstTipsWindow.IsInOrder(uid)
  if curBurstOrderSetting then
    for _, info in ipairs(curBurstOrderSetting) do
      if info.cardList and table.contain(info.cardList, uid) then
        return true
      end
    end
  end
  return false
end

function BurstTipsWindow.GetBurstOrderByType(type)
  if curBurstOrderSetting then
    for _, info in ipairs(curBurstOrderSetting) do
      if info.job == type then
        return info.cardList
      end
    end
  end
end

function BurstTipsWindow.UpdateCaptainInfo()
  local tips = uis.Main.BurstTips.BurstTips2
  tips.TitleTxt.text = T(10327)
  local list = tips.ContentList
  list:RemoveChildrenToPool()
  local featureConfig = TableData.GetConfig(FEATURE_ENUM.CAPTAIN_SKILL, "BaseFeature")
  local rule_des = featureConfig.rule_des
  if rule_des then
    local ruleContent = UIMgr:CreateComponent("Formation", "BurstLeaderContent")
    list:AddChild(ruleContent)
    local wordList = ruleContent:GetChild("WordList")
    for _, v in ipairs(rule_des) do
      local content = wordList:AddItemFromPool()
      local titleTxt = content:GetChild("WordTxt")
      titleTxt.text = T(v)
    end
    wordList:ResizeToFit()
  end
  local skillChoose = UIMgr:CreateComponent("Formation", "BurstLeaderSkillRegion")
  list:AddChild(skillChoose)
  require("Formation_BurstLeaderSkillRegionByName")
  skillChoose_uis = GetFormation_BurstLeaderSkillRegionUis(skillChoose)
  skillChoose_uis.TitleTxt.text = T(10330)
  local cardList = skillChoose_uis.HeadList
  local canChoose = false
  if cardUidList and #cardUidList > 0 then
    for _, cardUid in ipairs(cardUidList) do
      local cardInfo = FormationData.GetCardDataByUid(cardUid, sceneType)
      if cardInfo then
        local skillId, skillLevel = FormationData.GetLeaderSkillInfo(cardInfo, sceneType)
        if skillId then
          canChoose = true
          local head = cardList:AddItemFromPool()
          UIUtil.SetHeadByFaceId(cardInfo.fashionId, head:GetChild("BurstLeaderBg"):GetChild("PicLoader"), HEAD_ICON_TYPE_ENUM.RECT)
          local skillConfig = TableData.GetConfig(skillId, "BaseSkill")
          head:GetChild("NameTxt").text = skillConfig.name()
          local skillLevelUpConfig = TableData.GetConfig(skillId * 1000 + skillLevel, "BaseSkillLevelUp")
          local skillWordList = head:GetChild("WordList")
          skillWordList:RemoveChildrenToPool()
          local skillWord = skillWordList:AddItemFromPool()
          skillWord:GetChild("WordTxt").text = skillLevelUpConfig.des()
          local cardId = cardInfo.cardId
          if cardId == curCaptainCardId then
            cardList.selectedIndex = cardList:GetChildIndex(head)
            curCaptainCard = cardInfo
          end
          head.onClick:Set(function()
            if cardId == curCaptainCardId then
              curCaptainCardId = nil
              curCaptainCard = nil
              cardList.selectedIndex = -1
            else
              curCaptainCardId = cardId
              curCaptainCard = cardInfo
              cardList.selectedIndex = cardList:GetChildIndex(head)
            end
            BurstTipsWindow.UpdateCurCaptainSkillInfo()
            UIMgr:SendWindowMessage(WinResConfig.FormationWindow.name, WindowMsgEnum.FormationWindow.CHANGE_CAPTAIN_CARD, curCaptainCardId)
          end)
        end
      end
    end
  end
  BurstTipsWindow.UpdateCurCaptainSkillInfo()
  if canChoose then
    skillChoose_uis.c1Ctr.selectedIndex = 0
  else
    skillChoose_uis.c1Ctr.selectedIndex = 1
    skillChoose_uis.TipsTxt.text = T(10332)
  end
  cardList:ResizeToFit()
end

function BurstTipsWindow.UpdateCurCaptainSkillInfo()
  if curCaptainCardId then
    skillChoose_uis.LeaderHead.c1Ctr.selectedIndex = 0
    skillChoose_uis.c2Ctr.selectedIndex = 1
    UIUtil.SetHeadByFaceId(curCaptainCard.fashionId, skillChoose_uis.LeaderHead.LeaderHeadBg.HeadLoader, HEAD_ICON_TYPE_ENUM.RECT)
    local skillId, skillLevel = CardData.GetLeaderSkillInfo(curCaptainCard)
    if skillId then
      local skillLevelUpConfig = TableData.GetConfig(skillId * 1000 + skillLevel, "BaseSkillLevelUp")
      skillChoose_uis.WordTxt.text = skillLevelUpConfig.des()
    end
  else
    skillChoose_uis.WordTxt.text = T(10331)
    skillChoose_uis.LeaderHead.c1Ctr.selectedIndex = 1
    skillChoose_uis.c2Ctr.selectedIndex = 0
  end
end

function BurstTipsWindow.UpdateRuleInfo()
  local tips = uis.Main.BurstTips.BurstTips1
  tips.TitleTxt.text = T(10321)
  local list = tips.ContentList
  list:RemoveChildrenToPool()
  local featureConfig = TableData.GetConfig(FEATURE_ENUM.BURST_SKILL_TIPS, "BaseFeature")
  local rule_des = featureConfig.rule_des_1
  if rule_des then
    for _, v in ipairs(rule_des) do
      local content = list:AddItemFromPool()
      local contentList = Split(v, ":")
      local wordList = content:GetChild("WordList")
      wordList:RemoveChildrenToPool()
      for i, id in ipairs(contentList) do
        if 1 == i then
          local titleTxt = content:GetChild("WordTxt")
          titleTxt.text = T(tonumber(id))
        else
          local hand = wordList:AddItemFromPool()
          hand:GetChild("WordTxt").text = T(tonumber(id))
        end
      end
      wordList:ResizeToFit()
    end
  end
end

function BurstTipsWindow.UpdateInfo()
  local captainUnlock = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CAPTAIN_SKILL, false)
  if captainUnlock then
    BurstTipsWindow.UpdateCaptainInfo()
  else
    uis.Main.BurstTips.c1Ctr.selectedIndex = 1
  end
  local burstOperationUnlock = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.BURST_OPERATION, false)
  if burstOperationUnlock then
    BurstTipsWindow.UpdateBurstOperationInfo()
  end
  BurstTipsWindow.UpdateRuleInfo()
end

function BurstTipsWindow.ChangeToBurstOperationInfo()
  local burstOperationUnlock = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.BURST_OPERATION)
  if false == burstOperationUnlock then
    return
  end
  if 2 ~= uis.Main.BurstTips.c1Ctr.selectedIndex then
    uis.Main.BurstTips.c1Ctr.selectedIndex = 2
  end
end

function BurstTipsWindow.ChangeToCaptainInfo()
  local captainUnlock = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CAPTAIN_SKILL)
  if false == captainUnlock then
    return
  end
  if 0 ~= uis.Main.BurstTips.c1Ctr.selectedIndex then
    uis.Main.BurstTips.c1Ctr.selectedIndex = 0
  end
end

function BurstTipsWindow.ChangeToRuleInfo()
  if 1 ~= uis.Main.BurstTips.c1Ctr.selectedIndex then
    uis.Main.BurstTips.c1Ctr.selectedIndex = 1
  end
end

function BurstTipsWindow.Close()
  uis.Main.TouchScreenBtn.touchable = false
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_SKILL_OUT)
  UIMgr:CloseWindow(WinResConfig.BurstTipsWindow.name)
  if curBurstOrderSetting then
    table.sort(curBurstOrderSetting, function(a, b)
      return a.job < b.job
    end)
  end
  UIMgr:SendWindowMessage(WinResConfig.FormationWindow.name, WindowMsgEnum.FormationWindow.CHANGE_BURST_ORDER_SETTING, curBurstOrderSetting)
end

function BurstTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(BurstTipsWindow.Close)
  local btn = uis.Main.BurstTips.BurstTab1Btn
  UIUtil.SetBtnText(btn, T(10328))
  local captainUnlock = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CAPTAIN_SKILL, false)
  if false == captainUnlock then
    ChangeUIController(btn, "c1", 1)
    btn.changeStateOnClick = false
  else
    ChangeUIController(btn, "c1", 0)
  end
  btn.onClick:Add(BurstTipsWindow.ChangeToCaptainInfo)
  btn = uis.Main.BurstTips.BurstTab3Btn
  UIUtil.SetBtnText(btn, T(10335))
  local burstUnlock = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.BURST_OPERATION, false)
  if false == burstUnlock then
    ChangeUIController(btn, "c1", 1)
    btn.changeStateOnClick = false
  else
    ChangeUIController(btn, "c1", 0)
  end
  btn.onClick:Add(BurstTipsWindow.ChangeToBurstOperationInfo)
  btn = uis.Main.BurstTips.BurstTab2Btn
  UIUtil.SetBtnText(btn, T(10329))
  btn.onClick:Add(BurstTipsWindow.ChangeToRuleInfo)
end

function BurstTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  cardUidList = nil
  curCaptainCardId = nil
  curCaptainCard = nil
  curCard2Pos = nil
  curBurstOrderSetting = nil
  skillChoose_uis = nil
  sceneType = nil
end

return BurstTipsWindow
