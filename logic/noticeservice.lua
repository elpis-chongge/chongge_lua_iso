NoticeService = {}

function NoticeService.Init()
end

function NoticeService.GetAllNoticesReq(showTips, jump, notOpenWindow)
  local url = LoginData.GetClientServiceUrl() .. "/all_notices?channel=" .. LuaUtil.GetChannel()
  CS.HttpManager.Singleton:GetWebRequest(url, function()
    FunctionQueueUtil.SetFunEnd("Notice")
  end, function(str)
    local result_table = Json.decode(str)
    if result_table.code == ProtoEnum.RET_CODE.RC_OK then
      NoticeService.GetAllMailsRsp(result_table.data, showTips, jump, notOpenWindow)
    else
      FunctionQueueUtil.SetFunEnd("Notice")
    end
  end)
end

function NoticeService.GetAllMailsRsp(msg, showTips, jump, notOpenWindow)
  if msg.normals then
    NoticeData.notice = msg.normals
    if #NoticeData.notice > 1 then
      table.sort(NoticeData.notice, function(a, b)
        if a.sortValue and b.sortValue then
          return a.sortValue < b.sortValue
        end
        return false
      end)
    end
    if #NoticeData.notice < 1 then
      if showTips then
        FloatTipsUtil.ShowWarnTips(T(734))
      end
      FunctionQueueUtil.SetFunEnd("Notice")
      return
    end
    RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.NOTICE)
    if notOpenWindow then
      FunctionQueueUtil.SetFunEnd("Notice")
      return
    end
    if UIMgr:IsWindowOpen(WinResConfig.NoticeWindow.name) then
      UIMgr:SendWindowMessage(WinResConfig.NoticeWindow.name, WindowMsgEnum.NoticeWindow.REFRESH_NOTICE)
      return
    end
    if jump then
      JumpToWindow(WinResConfig.NoticeWindow.name)
    else
      OpenWindow(WinResConfig.NoticeWindow.name)
    end
  else
    if showTips then
      FloatTipsUtil.ShowWarnTips(T(734))
    end
    FunctionQueueUtil.SetFunEnd("Notice")
  end
end

NoticeService.Init()
