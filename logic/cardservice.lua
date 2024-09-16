CardService = {}

function CardService.Init()
  Net.AddListener(Proto.MsgName.LevelupCardRsp, CardService.LevelupCardRsp)
  Net.AddListener(Proto.MsgName.QualityUpCardRsp, CardService.QualityUpCardRsp)
  Net.AddListener(Proto.MsgName.GradeUpCardRsp, CardService.GradeUpCardRsp)
  Net.AddListener(Proto.MsgName.LevelupCardSkillRsp, CardService.LevelupCardSkillRsp)
  Net.AddListener(Proto.MsgName.ChangeCardFashionRsp, CardService.ChangeCardFashionRsp)
  Net.AddListener(Proto.MsgName.GetAllShowFashionRsp, CardService.GetAllShowFashionRsp)
  Net.AddListener(Proto.MsgName.GetAllCardFashionRsp, CardService.GetAllCardFashionRsp)
  Net.AddListener(Proto.MsgName.GetCardClickedStoryEventsRsp, CardService.GetCardClickedStoryEventsRsp)
  Net.AddListener(Proto.MsgName.ClickCardStoryEventReportRsp, CardService.ClickCardStoryEventReportRsp)
end

function CardService.GetCardClickedStoryEventsReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.GetCardClickedStoryEventsReq, msg, rspCallback)
end

function CardService.GetCardClickedStoryEventsRsp(msg)
  CardMgr.SaveClickedId(msg.infos)
end

function CardService.ClickCardStoryEventReportReq(infos, rspCallback)
  local msg = {}
  msg.infos = infos
  Net.Send(Proto.MsgName.ClickCardStoryEventReportReq, msg, rspCallback)
end

function CardService.ClickCardStoryEventReportRsp(msg)
end

function CardService.LevelupCardReq(cardId, spendItemData, errorCallback)
  local msg = {}
  msg.cardId = cardId
  msg.itemUid2Count = spendItemData
  Net.Send(Proto.MsgName.LevelupCardReq, msg, nil, errorCallback)
end

function CardService.QualityUpCardReq(cardId)
  local msg = {}
  msg.cardId = cardId
  Net.Send(Proto.MsgName.QualityUpCardReq, msg)
end

function CardService.LevelupCardRsp(msg)
  local info = msg.updateInfo
  if info and info.basic then
    CardMgr.UpdateMsgData(msg)
    CardMgr.InitData(CardMgr.cardId)
    CardLevelUpWindow.RefreshLvUp()
  end
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_CARD_CHANGE)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.CARD)
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_UPDATE_FUNC_ENTER)
end

function CardService.QualityUpCardRsp(msg)
  local info = msg.updateInfo
  if info then
    CardMgr.UpdateMsgData(msg)
    if info.basic and info.basic[2] then
      OpenWindow(WinResConfig.BreachUpTipsWindow.name, nil, info.basic[2])
    end
    CardMgr.InitData(CardMgr.cardId)
    local cardData = CardData.GetCardDataById(info.cardId)
    UIMgr:SendWindowMessage(WinResConfig.CardDetailsWindow.name, WindowMsgEnum.CardWindow.PLAY_GROW_UP_VOICE, {
      fashionId = cardData.fashionId,
      bubbleType = BUBBLE_TYPE_ENUM.QUALITY,
      level = cardData.quality,
      delayTime = 3.5
    })
  end
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_CARD_CHANGE)
  LeanTween.delayedCall(0.3, function()
    UIMgr:SendWindowMessage(WinResConfig.CardDetailsWindow.name, WindowMsgEnum.CardWindow.BREACH_UP)
  end)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.CARD)
end

function CardService.StarUpCardReq(cardId)
  local msg = {}
  msg.cardId = cardId
  Net.Send(Proto.MsgName.GradeUpCardReq, msg)
end

function CardService.GradeUpCardRsp(msg)
  local info = msg.updateInfo
  if info.basic and info.basic[5] then
    CardMgr.UpdateMsgData(msg)
    OpenWindow(WinResConfig.StarUpTipsWindow.name, nil, {
      skillId = CardMgr.cardConfigData.unlock_skill_ids[info.basic[5]],
      curStar = info.basic[5],
      totalStar = CardMgr.cardConfigData.grade_max
    })
    CardMgr.InitData(CardMgr.cardId)
    CardStarUpWindow.ShowCheckEffect(false)
    local cardData = CardData.GetCardDataById(info.cardId)
    UIMgr:SendWindowMessage(WinResConfig.CardDetailsWindow.name, WindowMsgEnum.CardWindow.PLAY_GROW_UP_VOICE, {
      fashionId = cardData.fashionId,
      bubbleType = BUBBLE_TYPE_ENUM.GRADE,
      level = cardData.grade,
      delayTime = 2
    })
  end
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_CARD_CHANGE)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.CARD)
end

function CardService.LevelupCardSkillReq(cardId, skillId, rspCallback)
  local msg = {}
  msg.cardId = cardId
  msg.skillId = skillId
  CardData.tempSkillLv = CardMgr.cardInfoData.skill2Level[skillId]
  Net.Send(Proto.MsgName.LevelupCardSkillReq, msg, rspCallback)
end

function CardService.LevelupCardSkillRsp(msg)
  local info = msg.updateInfo
  if info then
    CardMgr.UpdateMsgData(msg)
    UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_CARD_SKILL_UP)
  end
end

function CardService.ChangeCardFashionReq(cardId, fashionId, rspCallback)
  local msg = {}
  msg.cardId = cardId
  msg.fashionId = fashionId
  Net.Send(Proto.MsgName.ChangeCardFashionReq, msg, rspCallback)
end

function CardService.ChangeCardFashionRsp(msg)
  CardMgr.UpdateMsgData(msg)
  local cardInfo = CardData.GetCardDataById(msg.updateInfo.cardId)
  if msg.updateInfo.basic[8] then
    cardInfo.fashionId = msg.updateInfo.basic[8]
  end
  ActorData.AddCard(cardInfo)
  UIMgr:SendWindowMessage(WinResConfig.CardDetailsWindow.name, WindowMsgEnum.CardWindow.CHANGE_CLOTHES)
  UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_CARD_CHANGE)
end

function CardService.GetAllShowFashionReq(rspCallBack)
  local msg = {}
  Net.Send(Proto.MsgName.GetAllShowFashionReq, msg, rspCallBack)
end

function CardService.GetAllShowFashionRsp(msg)
  CardMgr.SaveFashionId(msg)
end

function CardService.GetAllCardFashionReq(rspCallBack)
  local msg = {}
  Net.Send(Proto.MsgName.GetAllCardFashionReq, msg, rspCallBack)
end

function CardService.GetAllCardFashionRsp(msg)
  CardData.SaveFashion(msg)
end

CardService.Init()
