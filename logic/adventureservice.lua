AdventureService = {}

function AdventureService.Init()
  Net.AddListener(Proto.MsgName.GetSceneInfoRsp, AdventureService.GetSceneInfoRsp)
  Net.AddListener(Proto.MsgName.GetChapterStageRsp, AdventureService.GetChapterStageRsp)
  Net.AddListener(Proto.MsgName.FetchSceneChapterRewardRsp, AdventureService.FetchSceneChapterRewardRsp)
  Net.AddListener(Proto.MsgName.GetOpenStagesRsp, AdventureService.GetOpenStagesRsp)
end

function AdventureService.GetSceneInfoReq(type, rspCallBack)
  local msg = {}
  msg.sceneTypes = type
  Net.Send(Proto.MsgName.GetSceneInfoReq, msg, rspCallBack)
end

function AdventureService.GetSceneInfoRsp(msg)
  AdventureData.SaveSceneData(msg.sceneInfos)
  local sceneType = msg.sceneInfos[1] and msg.sceneInfos[1].sceneType or nil
  UIMgr:SendWindowMessage(WinResConfig.AdventureWindow.name, WindowMsgEnum.Adventure.REFRESH_MAP, sceneType)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ADVENTURE)
end

function AdventureService.GetChapterStageReq(id, rspCallBack)
  local msg = {}
  msg.chapterIds = id
  Net.Send(Proto.MsgName.GetChapterStageReq, msg, rspCallBack)
end

function AdventureService.GetChapterStageRsp(msg)
  AdventureData.UpdateChapterStageData(msg)
end

function AdventureService.FetchSceneChapterRewardReq(chapterId, sceneType, rspCallback)
  local msg = {}
  msg.chapterId = chapterId
  msg.sceneType = sceneType
  Net.Send(Proto.MsgName.FetchSceneChapterRewardReq, msg, rspCallback)
end

function AdventureService.FetchSceneChapterRewardRsp(msg)
  AdventureData.SaveRewardedChapter(msg.sceneType, msg.rewardedChapter)
  if msg.rewards then
    GetItemTips.Show(msg.rewards, true)
  end
end

function AdventureService.GetOpenStagesReq(stageIds, rspCallBack)
  local msg = {}
  msg.stageIds = stageIds
  Net.Send(Proto.MsgName.GetOpenStagesReq, msg, rspCallBack)
end

function AdventureService.GetOpenStagesRsp(msg)
end

AdventureService.Init()
