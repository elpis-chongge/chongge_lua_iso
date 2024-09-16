FormationService = {}

function FormationService.Init()
  Net.AddListener(Proto.MsgName.GetStagePrepareInfoRsp, FormationService.DealGetStagePrepareInfoRsp)
  Net.AddListener(Proto.MsgName.GetOtherCardInfoRsp, FormationService.DealGetOtherCardInfoRsp)
end

function FormationService.GetStagePrepareInfoReq(sceneType, stageId, callback, params)
  local msg = {}
  msg.sceneType = sceneType
  msg.stageId = stageId
  if sceneType == ProtoEnum.SCENE_TYPE.MANOR then
    msg.quickBattle = params and params.quickBattle
  else
    msg.quickBattle = false
    if sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
      msg.guildWarCompensateUid = params and params.guildWarCompensateUid
    end
  end
  msg.prepareStoreSceneType = FormationMgr.GetPrepareSceneType(sceneType)
  Net.Send(Proto.MsgName.GetStagePrepareInfoReq, msg, callback, params and params.errorCallback)
end

function FormationService.DealGetStagePrepareInfoRsp(msg)
  FormationData.SaveBattleTeamState(msg)
  FormationData.SaveStagePrepareInfo(msg.info)
end

function FormationService.GetOtherCardInfoReq(cardUid, targetUin, callback)
  local msg = {}
  msg.cardUid = cardUid
  msg.targetUin = targetUin
  Net.Send(Proto.MsgName.GetOtherCardInfoReq, msg, callback)
end

function FormationService.DealGetOtherCardInfoRsp(msg)
end

FormationService.Init()
