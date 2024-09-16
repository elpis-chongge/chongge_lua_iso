FormationMgr = {
  cacheFormationParams = nil,
  cachedLastFormationParams = nil,
  cachedLastFormationOpenWindowAfterRsp = nil
}

function FormationMgr.ReopenFormationWindow()
  FormationMgr.TryOpenFormationWindow(FormationMgr.cachedLastFormationParams, FormationMgr.cachedLastFormationOpenWindowAfterRsp)
end

function FormationMgr.ClearCache()
  FormationMgr.cachedLastFormationParams = nil
  FormationMgr.cachedLastFormationOpenWindowAfterRsp = nil
end

function FormationMgr.TryOpenFormationWindow(params, openWindowAfterRsp)
  FormationMgr.cachedLastFormationParams = params
  FormationMgr.cachedLastFormationOpenWindowAfterRsp = openWindowAfterRsp
  if nil == openWindowAfterRsp then
    openWindowAfterRsp = true
  end
  if params.sceneType ~= ProtoEnum.SCENE_TYPE.ARENA and params.sceneType ~= ProtoEnum.SCENE_TYPE.ROGUE and params.stageId then
    local stageConfig = TableData.GetConfig(params.stageId, "BaseStage")
    if stageConfig then
      params.sceneType = stageConfig.chapter_type
    end
  end
  if params.arenaDefense then
    OpenWindow(WinResConfig.FormationWindow.name, nil, params)
  else
    if true == openWindowAfterRsp then
      FormationMgr.cacheFormationParams = params
    else
      FormationMgr.cacheFormationParams = nil
    end
    local callback = function(msg)
      local info = msg.info
      if msg.quickBattle == true and info then
        local prepareBattleParams = {}
        prepareBattleParams.sceneType = info.sceneType
        prepareBattleParams.stageId = info.stageId
        prepareBattleParams.cardUid2Pos = info.cardUid2Pos
        prepareBattleParams.buildUid2Pos = info.buildUid2Pos
        prepareBattleParams.leaderCardId = info.leaderCardId
        prepareBattleParams.burstOrderSetting = info.burstOrderSetting
        prepareBattleParams.extData = params.extData
        prepareBattleParams.quickBattle = msg.quickBattle
        ld("Battle")
        BattleService.PrepareBattleReq(prepareBattleParams)
      else
        local cachedParams = FormationMgr.cacheFormationParams
        if info then
          if cachedParams then
            local stageId = cachedParams.stageId
            if cachedParams.sceneType == info.sceneType and (cachedParams.sceneType == ProtoEnum.SCENE_TYPE.ARENA or stageId == info.stageId) then
              FormationMgr.OpenFormationWindow(cachedParams)
            end
          end
        else
          FormationMgr.OpenFormationWindow(cachedParams)
        end
      end
    end
    if params.sceneType == ProtoEnum.SCENE_TYPE.ARENA then
      FormationService.GetStagePrepareInfoReq(params.sceneType, params.arenaRankId, callback)
    else
      FormationService.GetStagePrepareInfoReq(params.sceneType, params.stageId, callback, params)
    end
  end
end

function FormationMgr.OpenFormationWindow(params)
  OpenWindow(WinResConfig.FormationWindow.name, nil, params)
  FormationMgr.cacheFormationParams = nil
end

function FormationMgr.SendBattleReq(sceneType, stageId, card2Pos, build2Pos, extData, specialArray, leaderCardId)
  local params = {
    sceneType = sceneType,
    stageId = stageId,
    cardUid2Pos = card2Pos,
    buildUid2Pos = build2Pos,
    extData = extData,
    specialArray = specialArray,
    leaderCardId = leaderCardId
  }
  BattleService.PrepareBattleReq(params)
end

function FormationMgr.ShowMapChoiceInfo(arenaMapConfig, contentList)
  contentList:RemoveChildrenToPool()
  local content = contentList:AddItemFromPool()
  content:GetChild("NameTxt").text = arenaMapConfig.name()
  content:GetChild("WordTxt").text = arenaMapConfig.des()
  content:GetChild("TitleTxt").text = T(10064)
  local buff_list = arenaMapConfig.buff_list
  if buff_list then
    ChangeUIController(content, "c1", 0)
    local list = content:GetChild("ContentList")
    list:RemoveChildrenToPool()
    
    function list.itemRenderer(index, item)
      local preBuffId = buff_list[index + 1]
      local preConfig = TableData.GetConfig(tonumber(preBuffId), "BaseSkillBuffPre")
      if nil == preConfig then
        return
      end
      item:GetChild("NameTxt").text = preConfig.name()
      item:GetChild("WordTxt").text = preConfig.des()
    end
    
    list.numItems = #buff_list
  else
    ChangeUIController(content, "c1", 1)
    content:GetChild("NoBuffTxt").text = T(10067)
  end
end

function FormationMgr.ShowTargetLine()
end

function FormationMgr.GetPrepareSceneType(sceneType)
  local prepareSceneType
  if sceneType ~= ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE and sceneType ~= ProtoEnum.SCENE_TYPE.ARENA and sceneType ~= ProtoEnum.SCENE_TYPE.ROGUE and sceneType ~= ProtoEnum.SCENE_TYPE.GUILD_WAR then
    prepareSceneType = ProtoEnum.SCENE_TYPE.PREPARE_STORE_COMMON
  else
    prepareSceneType = sceneType
  end
  return prepareSceneType
end
