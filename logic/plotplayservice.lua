PlotPlayService = {}

function PlotPlayService.Init()
  Net.AddListener(Proto.MsgName.FinishPlotRsp, PlotPlayService.FinishPlotRsp)
  Net.AddListener(Proto.MsgName.GetAllFinishedPlotsRsp, PlotPlayService.GetAllFinishedPlotsRsp)
  Net.AddListener(Proto.MsgName.StoryOperateReportRsp, PlotPlayService.StoryOperateReportRsp)
end

function PlotPlayService.GetAllFinishedPlotsReq()
  local m = {}
  Net.Send(Proto.MsgName.GetAllFinishedPlotsReq, m)
end

function PlotPlayService.GetAllFinishedPlotsRsp(msg)
  PlotPlayData.UpdateFinishedPlot(msg.plotIdLst)
end

function PlotPlayService.FinishPlotReq(plotId, dialogIds, skip)
  if PlotPlayMgr.forcePlay == true then
    return
  end
  if PlotPlayData.IsPlotFinished(plotId) then
    if skip then
      PlotPlayMgr.PlayPlotEnd(true)
    end
    return
  end
  local m = {}
  m.plotId = plotId
  m.stepIds = dialogIds
  m.skip = skip
  Net.Send(Proto.MsgName.FinishPlotReq, m)
end

function PlotPlayService.FinishPlotRsp(msg)
  if msg.plotId then
    PlotPlayData.InsertFinishedPlot(msg.plotId)
  end
  if msg.skip ~= true then
    if #msg.rewards > 0 then
      OpenWindow(WinResConfig.PlotItemGetWindow.name, UILayer.HUD1, msg.rewards)
    else
    end
  else
    PlotPlayMgr.PlayPlotEnd(true)
  end
end

function PlotPlayService.StoryOperateReportReq(storyType, storyId, dialogId, jump)
  if ActorData.GetUin() == nil then
    return
  end
  local m = {}
  m.storyType = storyType
  m.storyId = storyId
  m.dialogId = dialogId
  m.jump = jump
  Net.Send(Proto.MsgName.StoryOperateReportReq, m)
end

function PlotPlayService.StoryOperateReportRsp(msg)
end

PlotPlayService.Init()
