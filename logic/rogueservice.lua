RogueService = {}

function RogueService.Init()
  Net.AddListener(Proto.MsgName.GetRogueInfoRsp, RogueService.GetRogueInfoRsp)
  Net.AddListener(Proto.MsgName.ActivateRogueTalentRsp, RogueService.ActivateRogueTalentRsp)
  Net.AddListener(Proto.MsgName.FetchRogueThemeLevelRewardRsp, RogueService.FetchRogueThemeLevelRewardRsp)
  Net.AddListener(Proto.MsgName.GetRogueTopScoreRecordRsp, RogueService.GetRogueTopScoreRecordRsp)
  Net.AddListener(Proto.MsgName.GetRogueAllPicRsp, RogueService.GetRogueAllPicRsp)
  Net.AddListener(Proto.MsgName.FetchRogueTrendTaskRewardRsp, RogueService.FetchRogueTrendTaskRewardRsp)
  Net.AddListener(Proto.MsgName.GetRoguePicNewStateRsp, RogueService.GetRoguePicNewStateRsp)
  Net.AddListener(Proto.MsgName.ClearRoguePicNewStateRsp, RogueService.ClearRoguePicNewStateRsp)
  Net.AddListener(Proto.MsgName.QuitRogueGameRsp, RogueService.QuitRogueGameRsp)
  Net.AddListener(Proto.MsgName.GetCycleTaskInfoRsp, RogueService.GetCycleTaskInfoRsp)
  Net.AddListener(Proto.MsgName.CycleTaskRewardRsp, RogueService.CycleTaskRewardRsp)
  Net.AddListener(Proto.MsgName.GetRogueTrendsRsp, RogueService.GetRogueTrendsRsp)
  Net.AddListener(Proto.MsgName.SweepRogueRsp, RogueService.SweepRsp)
end

function RogueService.GetRogueInfoReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.GetRogueInfoReq, msg, rspCallback)
end

function RogueService.GetRogueInfoRsp(msg)
  RogueData.SaveRogueInfo(msg)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ROGUE)
end

function RogueService.ActivateRogueTalentReq(talendId, rspCallback)
  local msg = {}
  msg.talendId = talendId
  Net.Send(Proto.MsgName.ActivateRogueTalentReq, msg, rspCallback)
end

function RogueService.ActivateRogueTalentRsp(msg)
  RogueData.UpdateThemeInfo(msg.themeInfo)
end

function RogueService.FetchRogueThemeLevelRewardReq(rewardLevel, rspCallback)
  local msg = {}
  msg.rewardLevel = rewardLevel
  Net.Send(Proto.MsgName.FetchRogueThemeLevelRewardReq, msg, rspCallback)
end

function RogueService.FetchRogueThemeLevelRewardRsp(msg)
  RogueData.UpdateThemeInfo(msg.themeInfo)
  GetItemTips.Show(msg.rewards)
  UIMgr:SendWindowMessage(WinResConfig.RogueScoreRewardWindow.name, WindowMsgEnum.Rogue.REFRESH_LEVEL_REWARD)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ROGUE)
end

function RogueService.GetRogueTopScoreRecordReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.GetRogueTopScoreRecordReq, msg, rspCallback)
end

function RogueService.GetRogueTopScoreRecordRsp(msg)
  RogueData.record = msg.record
end

function RogueService.FetchRogueTrendTaskRewardReq(trendId, taskId, rspCallback)
  local msg = {}
  msg.trendId = trendId
  msg.taskId = taskId
  Net.Send(Proto.MsgName.FetchRogueTrendTaskRewardReq, msg, rspCallback)
end

function RogueService.FetchRogueTrendTaskRewardRsp(msg)
  RogueData.UpdateOneTrendInfos(msg.trendInfo)
  GetItemTips.Show(msg.rewards)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ROGUE)
end

function RogueService.GetRogueTrendsReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.GetRogueTrendsReq, msg, rspCallback)
end

function RogueService.GetRogueTrendsRsp(msg)
  RogueData.UpdateTrendInfos(msg.trendInfos)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ROGUE)
end

function RogueService.GetRogueAllPicReq(type, rspCallback)
  local msg = {}
  msg.roguePicType = type
  Net.Send(Proto.MsgName.GetRogueAllPicReq, msg, rspCallback)
end

function RogueService.GetRogueAllPicRsp(msg)
  RogueData.SavePicInfo(msg.picInfo)
end

function RogueService.GetRoguePicNewStateReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.GetRoguePicNewStateReq, msg, rspCallback)
end

function RogueService.GetRoguePicNewStateRsp(msg)
  RogueData.SavePicNewId(msg)
end

function RogueService.ClearRoguePicNewStateReq(roguePicType, rspCallback)
  local msg = {}
  msg.roguePicType = roguePicType
  Net.Send(Proto.MsgName.ClearRoguePicNewStateReq, msg, rspCallback)
end

function RogueService.ClearRoguePicNewStateRsp(msg)
end

function RogueService.QuitRogueGameReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.QuitRogueGameReq, msg, rspCallback)
end

function RogueService.QuitRogueGameRsp(msg)
  RogueData.UpdateThemeInfo(msg.settleInfo.themeInfo)
  UIMgr:SendWindowMessage(WinResConfig.RogueWindow.name, WindowMsgEnum.Rogue.QUIT_ROGUE_GAME)
end

function RogueService.GetCycleTaskInfoReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.GetCycleTaskInfoReq, msg, rspCallback)
end

function RogueService.GetCycleTaskInfoRsp(msg)
  RogueData.SaveWeekTask(msg.taskList)
  RogueData.SaveWeekReward(msg.weeklyRewards)
  RogueData.taskRefreshStamp = msg.refreshStamp
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ROGUE)
end

function RogueService.CycleTaskRewardReq(rewardId, rewardType, rspCallback)
  local msg = {}
  msg.rewardId = rewardId
  msg.rewardType = rewardType
  Net.Send(Proto.MsgName.CycleTaskRewardReq, msg, rspCallback)
end

function RogueService.CycleTaskRewardRsp(msg)
  RogueData.SaveWeekReward(msg.weeklyRewards)
  GetItemTips.Show(msg.goods)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ROGUE)
end

function RogueService.SweepReq(themeId, rspCallback)
  Net.Send(Proto.MsgName.SweepRogueReq, {themeId = themeId}, rspCallback)
end

function RogueService.SweepRsp(msg)
  RogueData.UpdateThemeInfo(msg.themeInfo)
  OpenWindow(WinResConfig.RogueSweepWindow.name, nil, msg)
end

RogueService.Init()
