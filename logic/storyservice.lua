StoryService = {}

function StoryService.Init()
  Net.AddListener(Proto.MsgName.GetStoryMonsterListRsp, StoryService.GetStoryMonsterListRsp)
  Net.AddListener(Proto.MsgName.ClickStoryEventReportRsp, StoryService.ClickStoryEventReportRsp)
end

function StoryService.GetStoryMonsterListReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.GetStoryMonsterListReq, msg, rspCallback)
end

function StoryService.GetStoryMonsterListRsp(msg)
  StoryMgr.SaveMonsterId(msg.storyMonsterIds)
  StoryMgr.SaveStoryId(msg.clickedStoryEventId)
end

function StoryService.ClickStoryEventReportReq(eventId, rspCallback)
  local msg = {}
  msg.eventIds = eventId
  Net.Send(Proto.MsgName.ClickStoryEventReportReq, msg, rspCallback)
end

function StoryService.ClickStoryEventReportRsp(msg)
end

StoryService.Init()
