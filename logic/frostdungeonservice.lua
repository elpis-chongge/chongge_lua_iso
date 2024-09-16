local GetFrostDungeonInfoReq = function(rspCallback)
  Net.Send(Proto.MsgName.BuffStageGetInfoReq, nil, rspCallback)
end
local GetFrostDungeonInfoRsp = function(msg)
  FrostDungeonData.SetFrostDungeonInfo(msg)
  UIMgr:SendWindowMessage(WinResConfig.FrostDungeonWindow.name, WindowMsgEnum.FrostDungeonWindow.REFRESH_PANEL_INFO)
end
local get_reward_msg = {}
local GetFrostDungeonRewardReq = function(stageId, rewardId, rspCallback)
  get_reward_msg.rewardStage = stageId
  get_reward_msg.rewardId = rewardId
  Net.Send(Proto.MsgName.BuffStageRewardReq, get_reward_msg, rspCallback)
end
local GetFrostDungeonRewardRsp = function(msg)
  local info = FrostDungeonData.GetFrostDungeonInfo()
  info.chapterTarget = msg.chapterTarget
  if msg.stage then
    local i = table.keyof(info.stages, msg.stage.stageId, "stageId")
    if i then
      info.stages[i] = msg.stage
    end
  end
  FrostDungeonData.SetFrostDungeonInfo(info)
  GetItemTips.Show(msg.rewards, true)
  UIMgr:SendWindowMessage(WinResConfig.FrostDungeonRewardWindow.name, WindowMsgEnum.FrostDungeonRewardWindow.REFRESH_PANEL_INFO)
end
local Init = function()
  Net.AddListener(Proto.MsgName.BuffStageGetInfoRsp, GetFrostDungeonInfoRsp)
  Net.AddListener(Proto.MsgName.BuffStageRewardRsp, GetFrostDungeonRewardRsp)
end
Init()
return {GetFrostDungeonInfoReq = GetFrostDungeonInfoReq, GetFrostDungeonRewardReq = GetFrostDungeonRewardReq}
