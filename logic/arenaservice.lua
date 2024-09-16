ArenaService = {}

function ArenaService.Init()
  Net.AddListener(Proto.MsgName.ArenaGetAllRsp, ArenaService.ArenaGetAllRsp)
  Net.AddListener(Proto.MsgName.ArenaGetMatchRsp, ArenaService.ArenaGetMatchRsp)
  Net.AddListener(Proto.MsgName.ArenaResetFightNumRsp, ArenaService.ArenaResetFightNumRsp)
  Net.AddListener(Proto.MsgName.ArenaGetTopRankRsp, ArenaService.ArenaGetTopRankRsp)
  Net.AddListener(Proto.MsgName.ArenaRefreshFightCDRsp, ArenaService.ArenaRefreshFightCDRsp)
  Net.AddListener(Proto.MsgName.ArenaGetRankRewardRsp, ArenaService.ArenaGetRankRewardRsp)
  Net.AddListener(Proto.MsgName.ArenaGetAllDefenseRsp, ArenaService.ArenaGetAllDefenseRsp)
  Net.AddListener(Proto.MsgName.ArenaGetOpponentFormationRsp, ArenaService.ArenaGetOpponentFormationRsp)
  Net.AddListener(Proto.MsgName.ArenaGetRecordRsp, ArenaService.ArenaGetRecordRsp)
end

function ArenaService.ArenaGetAllReq(rspCallBack)
  Net.Send(Proto.MsgName.ArenaGetAllReq, {}, rspCallBack)
end

function ArenaService.ArenaGetAllRsp(msg)
  ArenaData.Info = msg
  local down = math.floor(ArenaData.Info.seasonEndTime - LoginData.GetCurServerTime())
  printWarning("ArenaGetAllRsp uin:", ActorData.GetUin(), ">>>剩余时间:", down, "赛季结束时间:", ArenaData.Info.seasonEndTime, "当前时间:", LoginData.GetCurServerTime())
  UIMgr:SendWindowMessage(WinResConfig.AdventureWindow.name, WindowMsgEnum.Adventure.REFRESH_MAP, ProtoEnum.SCENE_TYPE.ARENA)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ADVENTURE)
end

function ArenaService.ArenaGetMatchReq()
  local msg = {}
  msg.isRefresh = true
  Net.Send(Proto.MsgName.ArenaGetMatchReq, msg)
end

function ArenaService.ArenaGetMatchRsp(msg)
  ArenaData.Info.matchInfo = msg.matchInfo
  UIMgr:SendWindowMessage(WinResConfig.ArenaWindow.name, WindowMsgEnum.Arena.GET_MATCH)
end

function ArenaService.ArenaResetFightNumReq()
  Net.Send(Proto.MsgName.ArenaResetFightNumReq, {})
end

function ArenaService.ArenaResetFightNumRsp(msg)
  ArenaData.Info.fightNum = msg.fightNum
  ArenaData.Info.buyNum = msg.buyNum
  UIMgr:CloseWindow(WinResConfig.BattleNumberWindow.comName)
  UIMgr:SendWindowMessage(WinResConfig.ArenaWindow.name, WindowMsgEnum.Arena.BUY)
end

function ArenaService.ArenaGetTopRankReq()
  Net.Send(Proto.MsgName.ArenaGetTopRankReq, {})
end

function ArenaService.ArenaGetTopRankRsp(msg)
  if msg then
    ArenaData.Rank = msg
    OpenWindow(WinResConfig.ArenaRankWindow.name, nil)
  end
end

function ArenaService.ArenaRefreshFightCDReq()
  Net.Send(Proto.MsgName.ArenaRefreshFightCDReq, {})
end

function ArenaService.ArenaRefreshFightCDRsp(msg)
  ArenaData.Info.nextFightTime = msg.nextFightTime
  UIMgr:SendWindowMessage(WinResConfig.ArenaWindow.name, WindowMsgEnum.Arena.CLEAR_CD)
end

function ArenaService.ArenaGetRankRewardReq(rewardId, rewardType)
  local msg = {}
  msg.rewardId = rewardId
  msg.rewardType = rewardType
  Net.Send(Proto.MsgName.ArenaGetRankRewardReq, msg)
end

function ArenaService.ArenaGetRankRewardRsp(msg)
  if msg.goods then
    if #msg.goods > 0 then
      GetItemTips.Show(msg.goods)
      ArenaData.Info.rewardList = msg.rewardList
    else
      FloatTipsUtil.ShowWarnTips(T(378))
    end
    RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ADVENTURE)
    UIMgr:SendWindowMessage(WinResConfig.ArenaRewardWindow.name, WindowMsgEnum.Arena.GET_GOODS)
  end
end

function ArenaService.ArenaGetAllDefenseReq(rspCallBack)
  local msg = {}
  Net.Send(Proto.MsgName.ArenaGetAllDefenseReq, msg, rspCallBack)
end

function ArenaService.ArenaGetAllDefenseRsp(msg)
  ArenaData.SaveAllDefenseFormation(msg)
  ld("Formation", function()
    FormationMgr.OpenFormationWindow({
      sceneType = ProtoEnum.SCENE_TYPE.ARENA,
      arenaDefense = true
    })
  end)
end

function ArenaService.ArenaSetDefenseReq(defenseFormation)
  if defenseFormation.burstOrderSetting then
    local curCard2Pos = defenseFormation.cardUid2Pos
    local burstOrderSetting = defenseFormation.burstOrderSetting
    for _, v in ipairs(burstOrderSetting) do
      local cardList = v.cardList
      if cardList and #cardList > 0 then
        for index = #cardList, 1, -1 do
          if nil == curCard2Pos[cardList[index]] then
            table.remove(v.cardList, index)
          end
        end
      end
    end
    table.sort(burstOrderSetting, function(a, b)
      return a.job < b.job
    end)
  end
  local msg = {}
  msg.defenseFormation = SimpleCopy(defenseFormation)
  ld("Formation", function()
    ArenaData.ModifyDefensePos(msg.defenseFormation)
  end)
  Net.Send(Proto.MsgName.ArenaSetDefenseReq, msg)
end

function ArenaService.ArenaSetDefenseRsp(msg)
end

function ArenaService.ArenaGetOpponentFormationReq(opponentRank)
  local msg = {}
  msg.opponentRank = opponentRank
  Net.Send(Proto.MsgName.ArenaGetOpponentFormationReq, msg, nil, function(retCode)
    if retCode == ProtoEnum.RET_CODE.RC_ARENA_TARGET_CANT_FIGHT then
      FloatTipsUtil.ShowWarnTips(T(10875))
      ArenaService.ArenaGetAllReq(function()
        UIMgr:SendWindowMessage(WinResConfig.ArenaWindow.name, WindowMsgEnum.Arena.GET_MATCH)
      end)
    end
  end)
end

function ArenaService.ArenaGetOpponentFormationRsp(msg)
  if msg.isChange then
    ArenaData.Info.matchInfo = msg.matchInfo
    UIMgr:SendWindowMessage(WinResConfig.ArenaWindow.name, WindowMsgEnum.Arena.GET_MATCH)
    FloatTipsUtil.ShowWarnTips(T(10122))
    return
  end
  ld("Formation", function()
    FormationMgr.TryOpenFormationWindow({
      sceneType = ProtoEnum.SCENE_TYPE.ARENA,
      arenaRankId = msg.opponentRank,
      enemyFormation = msg.formation,
      opponentUin = msg.fightUin
    })
  end)
end

function ArenaService.ArenaGetRecordReq()
  Net.Send(Proto.MsgName.ArenaGetRecordReq, {})
end

function ArenaService.ArenaGetRecordRsp(msg)
  ArenaData.records = msg.records
  ArenaData.ClearBattleRecord()
  if #ArenaData.records > 0 then
    OpenWindow(WinResConfig.ArenaRecordWindow.name)
  else
    FloatTipsUtil.ShowWarnTips(T(472))
  end
end

ArenaService.Init()
