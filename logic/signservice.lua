SignService = {}

function SignService.Init()
  Net.AddListener(Proto.MsgName.GetActivityAllRsp, SignService.GetActivityAllRsp)
  Net.AddListener(Proto.MsgName.ActivitySignInRsp, SignService.ActivitySignInRsp)
  Net.AddListener(Proto.MsgName.ActivitySearchRsp, SignService.ActivitySearchRsp)
  Net.AddListener(Proto.MsgName.GetAllBannerRsp, SignService.GetAllBannerRsp)
  Net.AddListener(Proto.MsgName.ActivityReturnSignInRsp, SignService.ActivityReturnSignInRsp)
end

function SignService.GetActivityAllReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.GetActivityAllReq, msg, rspCallback)
end

function SignService.GetActivityAllRsp(msg)
  SignData.SaveActivityData(msg)
  SignData.signInAct = msg.signInAct
  SignData.searchAct = msg.searchAct
  UIMgr:SendWindowMessage(WinResConfig.HomeWindow.name, WindowMsgEnum.Common.E_MSG_DAILY_TASK_UPDATE)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SIGN)
end

function SignService.GetAllBannerReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.GetAllBannerReq, msg, rspCallback)
end

function SignService.GetAllBannerRsp(msg)
  SignData.showAct = msg.idList
end

function SignService.ActivitySignInReq(activityId, rspCallback)
  local msg = {}
  msg.activityId = activityId
  Net.Send(Proto.MsgName.ActivitySignInReq, msg, rspCallback)
end

function SignService.ActivitySignInRsp(msg)
  for i, v in pairs(SignData.signInAct) do
    if v.baseInfo.activityId == msg.signInAct.baseInfo.activityId then
      SignData.signInAct[i] = msg.signInAct
      break
    end
  end
  if SignData.activityData[msg.signInAct.baseInfo.activityId] then
    SignData.activityData[msg.signInAct.baseInfo.activityId] = msg.signInAct
  end
  UIMgr:SendWindowMessage(WinResConfig.SignWindow.name, WindowMsgEnum.SignWindow.GET_REWARD, msg.signInAct)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.TASK)
end

function SignService.ActivitySearchReq(activityId, pos)
  local msg = {}
  msg.activityId = activityId
  msg.choosePos = pos
  Net.Send(Proto.MsgName.ActivitySearchReq, msg)
end

function SignService.ActivitySearchRsp(msg)
  UIMgr:SendWindowMessage(WinResConfig.ExploreSignWindow.name, WindowMsgEnum.SignWindow.GET_REWARD, msg)
end

function SignService.ActivityReturnSignInReq(signDay, rspCallback)
  local msg = {}
  msg.signDay = signDay
  Net.Send(Proto.MsgName.ActivityReturnSignInReq, msg, rspCallback)
end

function SignService.ActivityReturnSignInRsp(msg)
  SignData.UpdateOneActivityData(msg.returnAct)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SIGN)
end

SignService.Init()
