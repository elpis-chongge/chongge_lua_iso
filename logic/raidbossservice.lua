local GetRaidBossInfoReq = function(rspCallback)
  Net.Send(Proto.MsgName.GetBossInfoReq, nil, rspCallback)
end
local GetRaidBossInfoRsp = function(msg)
  RaidBossData.SetRaidBossData(msg)
  UIMgr:SendWindowMessage(WinResConfig.AdventureWindow.name, WindowMsgEnum.Adventure.REFRESH_BOSS_MAP)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ADVENTURE)
  UIMgr:SendWindowMessage(WinResConfig.RaidBossWindow.name, WindowMsgEnum.RaidBossWindow.REFRESH_PANEL_INFO)
end
local player_rank_info_msg = {}
local GetPlayerRankInfoReq = function(index, rspCallback)
  player_rank_info_msg.index = index
  Net.Send(Proto.MsgName.GetBossTopRankReq, player_rank_info_msg, rspCallback)
end
local GetPlayerRankInfoRsp = function(msg)
  RaidBossData.SetPlayersRankData(msg)
  UIMgr:SendWindowMessage(WinResConfig.RaidBossPlayerRankWindow.name, WindowMsgEnum.RaidBossPlayerRankWindow.REFRESH_RANK_LIST, msg)
end
local single_player_info_msg = {}
local cachedPlayerInfoStageId
local GetSinglePlayerInfoReq = function(uin, stageId, rspCallback)
  single_player_info_msg.uin = uin
  cachedPlayerInfoStageId = stageId
  Net.Send(Proto.MsgName.GetBossRankActorRecordReq, single_player_info_msg, rspCallback)
end
local GetSinglePlayerInfoRsp = function(msg)
  OpenWindow(WinResConfig.RaidBossActionRecordWindow.name, nil, msg.uin, msg.challenges, cachedPlayerInfoStageId)
end
local giveup_msg = {}
local GiveUpReq = function(stageId, rspCallback)
  giveup_msg.stage = stageId
  Net.Send(Proto.MsgName.GiveupBossChallengeReq, giveup_msg, rspCallback)
end
local GiveUpRsp = function()
  UIMgr:SendWindowMessage(WinResConfig.RaidBossWindow.name, WindowMsgEnum.RaidBossWindow.GIVE_UP_CHALLENGE)
  GetRaidBossInfoReq()
end
local sweep_msg = {}
local SweepReq = function(stageId, count)
  sweep_msg.stage = stageId
  sweep_msg.count = count
  Net.Send(Proto.MsgName.QuickBossChallengeReq, sweep_msg)
end
local SweepRsp = function(msg)
  OpenWindow(WinResConfig.RaidBossQuickRewardWindow.name, nil, msg.rewards)
  GetRaidBossInfoReq()
end
local StartBossChallengeReq = function(rspCallback)
  Net.Send(Proto.MsgName.StartBossChallengeReq, nil, rspCallback)
end
local StartBossChallengeRsp = function()
  local data = RaidBossData.GetRaidBossData()
  data.isStart = true
end
local GetRewardReq = function(stageId, rspCallback)
  Net.Send(Proto.MsgName.RewardBossChallengeReq, {stage = stageId}, rspCallback)
end
local GetRewardRsp = function(msg)
  GetItemTips.Show(msg.rewards)
  local data = RaidBossData.GetRaidBossData()
  data.rewardStages = msg.rewardStages
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ADVENTURE)
  UIMgr:SendWindowMessage(WinResConfig.RaidBossRewardShowWindow.name, WindowMsgEnum.RaidBossRewardShowWindow.REFRESH_REWARD_LIST)
end
local RankUpNotify = function(msg)
  RaidBossData.SetRankUpdateInfo(msg)
end
local Init = function()
  Net.AddListener(Proto.MsgName.GetBossInfoRsp, GetRaidBossInfoRsp)
  Net.AddListener(Proto.MsgName.GetBossTopRankRsp, GetPlayerRankInfoRsp)
  Net.AddListener(Proto.MsgName.GetBossRankActorRecordRsp, GetSinglePlayerInfoRsp)
  Net.AddListener(Proto.MsgName.GiveupBossChallengeRsp, GiveUpRsp)
  Net.AddListener(Proto.MsgName.QuickBossChallengeRsp, SweepRsp)
  Net.AddListener(Proto.MsgName.StartBossChallengeRsp, StartBossChallengeRsp)
  Net.AddListener(Proto.MsgName.RewardBossChallengeRsp, GetRewardRsp)
  Net.AddListener(Proto.MsgName.BossChallengeHighScoreNotify, RankUpNotify)
end
Init()
return {
  GetRaidBossInfoReq = GetRaidBossInfoReq,
  GetPlayerRankInfoReq = GetPlayerRankInfoReq,
  GetSinglePlayerInfoReq = GetSinglePlayerInfoReq,
  GiveUpReq = GiveUpReq,
  SweepReq = SweepReq,
  StartBossChallengeReq = StartBossChallengeReq,
  GetRewardReq = GetRewardReq
}
