SweepService = {}

function SweepService.Init()
  Net.AddListener(Proto.MsgName.SweepStageRsp, SweepService.SweepStageRsp)
end

function SweepService.SweepStageReq(stageId, rspCallBack)
  local msg = {}
  msg.stageId = stageId
  Net.Send(Proto.MsgName.SweepStageReq, msg, rspCallBack)
end

function SweepService.SweepStageRsp(msg)
  UIMgr:SendWindowMessage(WinResConfig.SweepWindow.name, WindowMsgEnum.SweepWindow.SWEEP_RESULT, msg)
end

SweepService.Init()
