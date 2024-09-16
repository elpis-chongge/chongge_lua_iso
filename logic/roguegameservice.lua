local GetRogueInfoReq = function()
end
local GetRougeInfoRsp = function(msg)
end
local StartRogueGameReq = function(difficultyLevel, rspCallback)
  Net.Send(Proto.MsgName.StartRogueGameReq, {difficultyLevel = difficultyLevel}, rspCallback)
end
local StartRogueGameRsp = function(msg)
  RogueGameData.SetThemeInfo(msg.themeInfo)
  RogueGameData.SetChapterInfo(msg.chapterInfo)
  RogueGameData.SetCardInfoList(msg.cardInfos)
  RogueData.UpdateThemeInfo(msg.themeInfo)
end
local RecruitRogueInitialCardReq = function(cardIdList, rspCallback)
  Net.Send(Proto.MsgName.RecruitRogueInitialCardReq, {cardIds = cardIdList}, rspCallback)
end
local RecruitRogueInitialCardRsp = function(msg)
  RogueGameData.SetThemeInfo(msg.themeInfo)
  RogueGameData.SetChapterInfo(msg.chapterInfo)
  RogueGameData.SetCardInfoList(msg.cardInfos)
  RogueData.UpdateThemeInfo(msg.themeInfo)
end
local ChooseRogueInitialTreasureReq = function(treasureIdList, rspCallback)
  Net.Send(Proto.MsgName.ChooseRogueInitialTreasureReq, {treasureIds = treasureIdList}, rspCallback)
end
local ChooseRogueInitialTreasureRsp = function(msg)
  if msg.themeInfo and msg.themeInfo.treasureIds then
    msg.gainTreasureId = msg.themeInfo.treasureIds
  end
  RogueGameMgr.OnFetchNodeReward(msg)
  RogueGameData.SetThemeInfo(msg.themeInfo)
end
local GetRogueStateInfoReq = function(rspCallback)
  Net.Send(Proto.MsgName.GetRogueStateInfoReq, nil, rspCallback)
end
local GetRogueStateInfoRsp = function(msg)
  RogueGameData.SetThemeInfo(msg.themeInfo)
  RogueGameData.SetChapterInfo(msg.chapterInfo)
  RogueGameData.SetCardInfoList(msg.cardInfos)
  RogueData.UpdateThemeInfo(msg.themeInfo)
end
local EnterRogueNodeReq = function(nodeId, rspCallback)
  Net.Send(Proto.MsgName.EnterRogueNodeReq, {nodeId = nodeId}, rspCallback)
end
local EnterRogueNodeRsp = function(msg)
  RogueGameData.SetChapterInfo(msg.chapterInfo)
end
local EnhanceRogueCardAttribReq = function(cardId, attrId, rspCallback)
  Net.Send(Proto.MsgName.EnhanceRogueCardAttribReq, {cardId = cardId, attribId = attrId}, rspCallback)
end
local EnhanceRogueCardAttribRsp = function(msg)
  RogueGameData.SetThemeInfo(msg.themeInfo)
  RogueGameData.AddOrOverrideCardInfo(msg.cardInfo)
end
local BuyRogueNodeShopTreasureReq = function(itemId, rspCallback)
  Net.Send(Proto.MsgName.BuyRogueNodeShopTreasureReq, {itemId = itemId}, rspCallback)
end
local BuyRogueNodeShopTreasureRsp = function(msg)
  RogueGameMgr.OnFetchNodeReward(msg)
  RogueGameData.SetThemeInfo(msg.themeInfo)
  RogueGameData.SetChapterInfo(msg.chapterInfo)
  UIMgr:SendWindowMessage(WinResConfig.RogueGameShopWindow.name, WindowMsgEnum.RogueGame.REFRESH_SHOP_PANEL_INFO, RogueGameData.GetChapterInfo().curNode)
end
local RefreshRogueNodeShopReq = function(rspCallback)
  Net.Send(Proto.MsgName.RefreshRogueNodeShopReq, nil, rspCallback)
end
local RefreshRogueNodeShopRsp = function(msg)
  RogueGameData.SetChapterInfo(msg.chapterInfo)
  UIMgr:SendWindowMessage(WinResConfig.RogueGameShopWindow.name, WindowMsgEnum.RogueGame.REFRESH_SHOP_PANEL_INFO, RogueGameData.GetChapterInfo().curNode)
end
local ForceRefresh = function()
  local chapterInfo = RogueGameData.GetChapterInfo()
  if chapterInfo then
    local curNode = chapterInfo.curNode
    UIMgr:SendWindowMessage(WinResConfig.RogueGameRewardsWindow.name, WindowMsgEnum.RogueGame.REFRESH_REWARD_LIST, curNode)
  end
  UIMgr:SendWindowMessage(WinResConfig.RogueGameCardUpWindow.name, WindowMsgEnum.RogueGame.REFRESH_CARD_ATTRIBUTE)
end
local FetchRogueNodeRewardErrorCallback = function(errCode)
  if errCode == ProtoEnum.RET_CODE.RC_ROGUE_NODE_REWARD_FETCHED then
    GetRogueStateInfoReq(ForceRefresh)
  end
end
local FetchRogueNodeRewardReq = function(rewardId, param, rspCallback)
  Net.Send(Proto.MsgName.FetchRogueNodeRewardReq, {rewardId = rewardId, param = param}, rspCallback, FetchRogueNodeRewardErrorCallback)
end
local FetchRogueNodeRewardRsp = function(msg)
  RogueGameMgr.OnFetchNodeReward(msg)
  RogueGameData.SetThemeInfo(msg.themeInfo)
  RogueGameData.SetChapterInfo(msg.chapterInfo)
  if msg.cardInfos then
    for i, v in ipairs(msg.cardInfos) do
      RogueGameData.AddOrOverrideCardInfo(v)
    end
  end
  UIMgr:SendWindowMessage(WinResConfig.RogueGameCardUpWindow.name, WindowMsgEnum.RogueGame.REFRESH_CARD_LIST)
  UIMgr:SendWindowMessage(WinResConfig.RogueGameRewardsWindow.name, WindowMsgEnum.RogueGame.REFRESH_REWARD_LIST, msg.chapterInfo.curNode)
  UIMgr:SendWindowMessage(WinResConfig.RogueGameRewardsWindow.name, WindowMsgEnum.RogueGame.REFRESH_REWARD_PANEL_INFO)
end
local ExitRogueNodeReq = function(nodeId, rspCallback)
  Net.Send(Proto.MsgName.ExitRogueNodeReq, {nodeId = nodeId}, rspCallback)
end
local ExitRogueNodeRsp = function(msg)
  if msg.settleInfo and _G.next(msg.settleInfo) then
    RogueGameMgr.Settle(msg.settleInfo)
    return
  end
  msg.gainTreasureId = msg.extraGainTreasureId
  RogueGameMgr.OnFetchNodeReward(msg)
  RogueGameMgr.OnExitRogueNode(msg)
  RogueGameData.SetChapterInfo(msg.chapterInfo)
  RogueService.GetRogueInfoReq()
end
local QuitRogueGameReq = function()
  Net.Send(Proto.MsgName.QuitRogueGameReq)
end
local QuitRogueGameRsp = function(msg)
  RogueGameMgr.Settle(msg.settleInfo)
end
local FinishRogueEventStoryReq = function(eventId, rspCallback)
  Net.Send(Proto.MsgName.FinishRogueEventStoryReq, {eventId = eventId}, rspCallback)
end
local FinishRogueEventKeyStepReq = function(eventId, storyId, rspCallback)
  Net.Send(Proto.MsgName.FinishRogueEventKeyStoryReq, {eventId = eventId, storyId = storyId}, rspCallback)
end
local FinishRogueEventStoryRsp = function(msg)
end
local FinishRogueEventKeyStepStoryRsp = function(msg)
  RogueGameMgr.OnFetchNodeReward(msg)
  local themeInfo = msg.themeInfo
  if themeInfo and _G.next(themeInfo) then
    RogueGameData.SetThemeInfo(themeInfo)
  end
  local chapterInfo = msg.chapterInfo
  if chapterInfo and _G.next(chapterInfo) then
    RogueGameData.SetChapterInfo(chapterInfo)
  end
  local cardInfos = msg.cardInfos
  if cardInfos then
    for _, v in ipairs(cardInfos) do
      RogueGameData.AddOrOverrideCardInfo(v)
    end
  end
  UIMgr:SendWindowMessage(WinResConfig.RogueGameEventWindow.name, WindowMsgEnum.RogueGame.REFRESH_EVENT_PANEL_INFO)
end
local ChooseRogueEventBattleStoryReq = function(eventId, storyId, prevStoryId, rspCallback)
  Net.Send(Proto.MsgName.ChooseRogueEventBattleStoryReq, {
    eventId = eventId,
    storyId = storyId,
    preStoryId = prevStoryId
  }, rspCallback)
end
local ChooseRogueEventBattleStoryRsp = function(msg)
  if msg.chapterInfo and _G.next(msg.chapterInfo) then
    RogueGameData.SetChapterInfo(msg.chapterInfo)
  end
end
local RogueGameInfoUpdateNotify = function(msg)
  local cardInfos = msg.cardInfos
  if cardInfos then
    for _, v in ipairs(cardInfos) do
      RogueGameData.AddOrOverrideCardInfo(v)
    end
  end
end
local Init = function()
  Net.AddListener(Proto.MsgName.StartRogueGameRsp, StartRogueGameRsp)
  Net.AddListener(Proto.MsgName.GetRogueStateInfoRsp, GetRogueStateInfoRsp)
  Net.AddListener(Proto.MsgName.EnterRogueNodeRsp, EnterRogueNodeRsp)
  Net.AddListener(Proto.MsgName.EnhanceRogueCardAttribRsp, EnhanceRogueCardAttribRsp)
  Net.AddListener(Proto.MsgName.BuyRogueNodeShopTreasureRsp, BuyRogueNodeShopTreasureRsp)
  Net.AddListener(Proto.MsgName.RefreshRogueNodeShopRsp, RefreshRogueNodeShopRsp)
  Net.AddListener(Proto.MsgName.FetchRogueNodeRewardRsp, FetchRogueNodeRewardRsp)
  Net.AddListener(Proto.MsgName.ExitRogueNodeRsp, ExitRogueNodeRsp)
  Net.AddListener(Proto.MsgName.QuitRogueGameRsp, QuitRogueGameRsp)
  Net.AddListener(Proto.MsgName.FinishRogueEventStoryRsp, FinishRogueEventStoryRsp)
  Net.AddListener(Proto.MsgName.FinishRogueEventKeyStoryRsp, FinishRogueEventKeyStepStoryRsp)
  Net.AddListener(Proto.MsgName.RecruitRogueInitialCardRsp, RecruitRogueInitialCardRsp)
  Net.AddListener(Proto.MsgName.ChooseRogueInitialTreasureRsp, ChooseRogueInitialTreasureRsp)
  Net.AddListener(Proto.MsgName.ChooseRogueEventBattleStoryRsp, ChooseRogueEventBattleStoryRsp)
  Net.AddListener(Proto.MsgName.RogueCardUpdateNotify, RogueGameInfoUpdateNotify)
end
Init()
return {
  GetRogueInfoReq = GetRogueInfoReq,
  StartRogueGameReq = StartRogueGameReq,
  GetRogueStateInfoReq = GetRogueStateInfoReq,
  EnterRogueNodeReq = EnterRogueNodeReq,
  EnhanceRogueCardAttribReq = EnhanceRogueCardAttribReq,
  BuyRogueNodeShopTreasureReq = BuyRogueNodeShopTreasureReq,
  RefreshRogueNodeShopReq = RefreshRogueNodeShopReq,
  FetchRogueNodeRewardReq = FetchRogueNodeRewardReq,
  ExitRogueNodeReq = ExitRogueNodeReq,
  QuitRogueGameReq = QuitRogueGameReq,
  FinishRogueEventStoryReq = FinishRogueEventStoryReq,
  FinishRogueEventKeyStepReq = FinishRogueEventKeyStepReq,
  RecruitRogueInitialCardReq = RecruitRogueInitialCardReq,
  ChooseRogueInitialTreasureReq = ChooseRogueInitialTreasureReq,
  ChooseRogueEventBattleStoryReq = ChooseRogueEventBattleStoryReq
}
