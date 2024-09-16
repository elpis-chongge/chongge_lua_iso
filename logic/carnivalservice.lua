CarnivalService = {}

function CarnivalService.Init()
  Net.AddListener(Proto.MsgName.GetCarnivalInfoRsp, CarnivalService.GetCarnivalInfoRsp)
  Net.AddListener(Proto.MsgName.CarnivalGetRewardRsp, CarnivalService.CarnivalGetRewardRsp)
  Net.AddListener(Proto.MsgName.GetTaskRefreshStampRsp, CarnivalService.GetTaskRefreshStampRsp)
end

function CarnivalService.GetTaskRefreshStampReq(rspCallBack)
  local msg = {}
  Net.Send(Proto.MsgName.GetTaskRefreshStampReq, msg, rspCallBack)
end

function CarnivalService.GetTaskRefreshStampRsp(msg)
  local stamp = msg.refreshStamp
  if stamp then
    if stamp[ProtoEnum.TASK_BELONG_TYPE.TBT_CARNIVAL] and stamp[ProtoEnum.TASK_BELONG_TYPE.TBT_CARNIVAL] > CarnivalData.GetRefreshStamp() and EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_CARNIVAL, false) then
      ld("Carnival", function()
        CarnivalService.GetCarnivalInfoReq(function()
          UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_DAILY_TASK_UPDATE)
        end)
      end)
    end
    if stamp[ProtoEnum.TASK_BELONG_TYPE.TBT_PLANT] and stamp[ProtoEnum.TASK_BELONG_TYPE.TBT_PLANT] > BiographyData.GetRefreshStamp() and EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BIOGRAPHY, false) then
      ld("Biography", function()
        BiographyService.GetPlantInfoReq(function()
          UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_DAILY_TASK_UPDATE)
        end)
      end)
    end
    if stamp[ProtoEnum.TASK_BELONG_TYPE.TBT_COMMON] and stamp[ProtoEnum.TASK_BELONG_TYPE.TBT_COMMON] > BiographyData.GetRefreshStamp() and EnterClampUtil.WhetherToEnter(FEATURE_ENUM.DAILY_TASK, false) then
      ld("DailyTask", function()
        DailyTaskService.GetCommonTaskInfoReq()
      end)
    end
  end
end

function CarnivalService.GetCarnivalInfoReq(rspCallBack)
  local msg = {}
  msg.refreshStamp = CarnivalData.GetRefreshStamp()
  Net.Send(Proto.MsgName.GetCarnivalInfoReq, {}, rspCallBack)
end

function CarnivalService.GetCarnivalInfoRsp(msg)
  CarnivalData.info = msg
  if #msg.stageList > 1 then
    table.sort(CarnivalData.info.stageList, function(a, b)
      return a.stageId < b.stageId
    end)
  end
  CarnivalData.RefreshRefreshStamp(msg.refreshStamp)
end

function CarnivalService.CarnivalGetRewardReq(rewardId, taskUid, rspCallBack)
  local msg = {}
  msg.rewardId = rewardId
  msg.taskUid = taskUid
  Net.Send(Proto.MsgName.CarnivalGetRewardReq, msg, rspCallBack)
end

function CarnivalService.CarnivalGetRewardRsp(msg)
  if msg.goods then
    if #msg.goods > 0 then
      if #msg.rewardTragets > 0 then
        CarnivalData.info.rewardTragets = msg.rewardTragets
      end
      GetItemTips.Show(msg.goods, true, function()
        if #msg.stageList > 0 then
          CarnivalData.info.stageList = msg.stageList
          if #msg.stageList > 1 then
            table.sort(CarnivalData.info.stageList, function(a, b)
              return a.stageId < b.stageId
            end)
          end
          UIMgr:SendWindowMessage(WinResConfig.CarnivalWindow.name, WindowMsgEnum.CarnivalWindow.GET_TASK)
        end
        if #msg.rewardTragets > 0 then
          UIMgr:SendWindowMessage(WinResConfig.CarnivalRewardWindow.name, WindowMsgEnum.CarnivalWindow.GET_GOODS)
        end
        RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.TASK)
      end)
    else
      FloatTipsUtil.ShowWarnTips(T(378))
    end
  end
end

CarnivalService.Init()
