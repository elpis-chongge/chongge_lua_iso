require("Formation_FormationWindowByName")
local FormationWindow = {}
local LABEL_TYPE_ENUM = {
  CARD = 1,
  BUILDING = 2,
  USED_CARD = 3,
  UNUSED_CARD = 4,
  CAN_USE = 5,
  FORBIDDEN = 6,
  AVAILABLE_UNUSED = 7,
  UNAVAILABLE_USED = 8,
  ROGUE_LIVING = 9,
  ROGUE_DEAD = 10,
  RECOMMEND_CARD = 11,
  GUILD_ASSIST = 12
}
local OPR_TIPS_TYPE = {MAP = 1}
local GRID_STATE = {ENABLE = 0, UNABLE = 1}
local FORMATION_TEAM_INDEX = {ONE = 1, TWO = 2}
local curTeamIndex, uis, contentPane, curMapGridScale, formationParam, stageConfig, monsterGroupConfig, sceneType, curSelectLabelType, lastSelectLabelType, curShowTipsCardId, tempArenaDefenseFormation, curOrLastDragCardUid, curOrLastDragBuildingUid, curCard2Pos, curBuild2Pos, curCard2PosList, curArenaMapId, curMapId, curMapIdList, curGuildWarSkills, curBurstOrderSetting, curBurstOrderSettingList, curCaptainCardId, curCaptainCardIdList, curSelectMapId, swipeCache, gridLineContainer, gridLineContainerList, dragTargetGridEffect, dragTargetGridEffectHolder, bottomGridContainer, bottomGridContainerList, tempGridCoverInfo, tempGridCoverInfoList, bottomGridMap, bottomGridMapList, gridPosListByType, bottomRangeEnableRect, bottomRangeEnableRectList, rangeEffect, rangeEffectList, rangeEffectOriginScale, rangeEffectOriginScaleList, coverGridContainer, coverGridContainerList, coverObject2Index, coverObject2IndexList, dragGridContainer, dragGridContainerList, dragGridMap, dragGridMapList, objectContainer, objectContainerList, effectContainer, effectContainerList, curDrag, curLineEffect, curTargetLine, dragIcon, curGuideLineEffect, curGuideTargetLine, curDragCardInfo, curDragBuildingInfo
local canDrop = false
local cannotDropTips, cardOrBuildingInfo
local dragOffX, dragOffY = 0, 0
local selfSizeX, selfSizeY, needGridX, needGridY, curSelectTeamInfo, selectCardTypeMap, selectElementTypeMap, selectCdTypeMap, listData, cardTips, cardUsedLimit, cardUsedLimitList, remoteNumLimit, meleeNumLimit, curTypingEffect, curSoundEventIns
local LineRendererHelper = CS.LineRendererHelper
local jumpTb, playAnim, updateWhenDrag, scaleV2
local waveTransitionHolderX = 600
local team2MapOffX, needClearMap, needClearBuilding, usedSkillTeamId, selectSkillTeamId, selectSkill

function FormationWindow.Init()
  DragDropManager.inst.dragAgent.onDragEnd:Add(FormationWindow.OnDragEnd)
  DragDropManager.inst.dragAgent.onDragMove:Add(FormationWindow.OnDragMove)
  local list = uis.Main.Choice.CardList
  list:SetVirtual()
  list.itemRenderer = FormationWindow.RefreshItem
  if curTeamIndex then
    team2MapOffX = uis.root.width / 2 + uis.Main.root.width / 2 + waveTransitionHolderX * 2
    uis.Main.BackGround2.root.visible = true
    uis.Main.BackGround2.root.x = uis.Main.BackGround2.root.x + team2MapOffX
    uis.Main.FormationGrid2.root.visible = true
    uis.Main.FormationGrid2.root.x = uis.Main.FormationGrid2.root.x + team2MapOffX
    uis.Main.WaveTransitionHolder.x = uis.root.width / 2 + uis.Main.root.width / 2 + waveTransitionHolderX
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/battle/FX_battle_mapchange_fix.prefab", uis.Main.WaveTransitionHolder)
  end
end

function FormationWindow.InitLocalData()
  remoteNumLimit = nil
  meleeNumLimit = nil
  formationParam = nil
  sceneType = nil
  listData = {}
  tempGridCoverInfo = {}
  tempGridCoverInfoList = {}
  cardOrBuildingInfo = {}
  coverObject2Index = {}
  coverObject2IndexList = {}
  bottomRangeEnableRect = nil
  bottomRangeEnableRectList = {}
  rangeEffect = nil
  rangeEffectList = {}
  rangeEffectOriginScale = nil
  rangeEffectOriginScaleList = {}
  bottomGridContainer, coverGridContainer, dragGridContainer, objectContainer, effectContainer = nil, nil, nil, nil, nil
  bottomGridContainerList, coverGridContainerList, dragGridContainerList, objectContainerList, effectContainerList = {}, {}, {}, {}, {}
  gridLineContainer = nil
  gridLineContainerList = {}
  stageConfig = nil
  monsterGroupConfig = nil
  curSelectLabelType = nil
  lastSelectLabelType = nil
  curShowTipsCardId = nil
  tempArenaDefenseFormation = nil
  curTeamIndex = nil
  curCard2Pos = {}
  curBuild2Pos = {}
  curCard2PosList = {}
  curGuildWarSkills = {}
  curArenaMapId = nil
  curMapId = nil
  curMapIdList = {}
  swipeCache = {}
  bottomGridMap = {}
  bottomGridMapList = {}
  gridPosListByType = {}
  dragGridMap = {}
  dragGridMapList = {}
  needGridX, needGridY = nil, nil
  selfSizeX, selfSizeY = nil, nil
  cardTips = nil
  dragTargetGridEffectHolder = nil
  curSelectMapId = nil
  curGuideTargetLine = nil
  curGuideLineEffect = nil
  cardUsedLimit = nil
  cardUsedLimitList = {}
  curOrLastDragCardUid = nil
  curOrLastDragBuildingUid = nil
  curCaptainCardId = nil
  curCaptainCardIdList = {}
  curBurstOrderSetting = {}
  curBurstOrderSettingList = {}
  curSelectTeamInfo = nil
  selectCardTypeMap = {}
  selectElementTypeMap = {}
  selectCdTypeMap = {}
end

function FormationWindow.Destroy()
  FormationWindow.ClearDrag()
  remoteNumLimit = nil
  meleeNumLimit = nil
  formationParam = nil
  sceneType = nil
  listData = nil
  tempGridCoverInfo = nil
  tempGridCoverInfoList = nil
  cardOrBuildingInfo = nil
  coverObject2Index = nil
  coverObject2IndexList = nil
  bottomRangeEnableRect = nil
  bottomRangeEnableRectList = nil
  rangeEffect = nil
  rangeEffectList = nil
  rangeEffectOriginScale = nil
  rangeEffectOriginScaleList = nil
  bottomGridContainer, coverGridContainer, dragGridContainer, objectContainer, effectContainer = nil, nil, nil, nil, nil
  bottomGridContainerList, coverGridContainerList, dragGridContainerList, objectContainerList, effectContainerList = nil, nil, nil, nil, nil
  gridLineContainer = nil
  gridLineContainerList = nil
  stageConfig = nil
  monsterGroupConfig = nil
  curSelectLabelType = nil
  lastSelectLabelType = nil
  curShowTipsCardId = nil
  tempArenaDefenseFormation = nil
  curTeamIndex = nil
  curCard2Pos = nil
  curBuild2Pos = nil
  curCard2PosList = nil
  curGuildWarSkills = nil
  curArenaMapId = nil
  curMapId = nil
  curMapIdList = nil
  swipeCache = nil
  bottomGridMap = nil
  bottomGridMapList = nil
  gridPosListByType = nil
  dragGridMap = nil
  dragGridMapList = nil
  needGridX, needGridY = nil, nil
  selfSizeX, selfSizeY = nil, nil
  cardTips = nil
  dragTargetGridEffectHolder = nil
  curSelectMapId = nil
  curGuideTargetLine = nil
  curGuideLineEffect = nil
  cardUsedLimit = nil
  cardUsedLimitList = nil
  curOrLastDragCardUid = nil
  curOrLastDragBuildingUid = nil
  curCaptainCardId = nil
  curCaptainCardIdList = nil
  curBurstOrderSetting = nil
  curBurstOrderSettingList = nil
  curSelectTeamInfo = nil
  selectCardTypeMap = nil
  selectElementTypeMap = nil
  selectCdTypeMap = nil
  usedSkillTeamId = nil
  selectSkillTeamId = nil
  selectSkill = nil
end

function FormationWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.FormationWindow.package, WinResConfig.FormationWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    FormationWindow.InitLocalData()
    ld("Battle")
    formationParam = bridgeObj.argTable[1]
    if formationParam.stageId then
      stageConfig = TableData.GetConfig(formationParam.stageId, "BaseStage")
    end
    GuideMgr.SaveStageID(formationParam.stageId)
    sceneType = formationParam.sceneType
    uis = GetFormation_FormationWindowUis(contentPane)
    if formationParam.arenaDefense == true then
      uis.Main.c1Ctr.selectedIndex = 1
      tempArenaDefenseFormation = SimpleCopy(ArenaData.GetDefenseFormation())
    else
      uis.Main.c1Ctr.selectedIndex = 0
      if sceneType == ProtoEnum.SCENE_TYPE.ARENA then
        curArenaMapId = formationParam.enemyFormation.mapId
      elseif sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
        uis.Main.c2Ctr.selectedIndex = 2
        uis.Main.GuildBossHPRegion.root.visible = false
      elseif sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
        uis.Main.c2Ctr.selectedIndex = 1
        curTeamIndex = FORMATION_TEAM_INDEX.ONE
      end
    end
    FormationData.Init()
    FormationWindow.Init()
    FormationWindow.InitBtn()
    FormationWindow.InitText()
    FormationWindow.InitScreenTips()
    if sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
      FormationWindow.InitExpeditionCardList()
      FormationWindow.UpdateExpeditionInfo()
    end
    FormationWindow.UpdateMap()
    FormationWindow.UpdateMapBuffList()
    FormationWindow.UpdateBurst()
    FormationWindow.UpdateInfo()
    FormationWindow.UpdateCardQuickOperation()
    if sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
      FormationWindow.UpdateGuildWarSkill()
    end
    if GuideMgr.curGuideIsPlay and false == AdventureData.IsStagePassed(50110104) then
      uis.Main.BurstStrip.root.visible = false
    end
    FormationWindow.InitRedDot()
  end)
end

function FormationWindow.InitRedDot()
  if formationParam.arenaDefense then
    RedDotMgr.AddNode({
      windowName = WinResConfig.FormationWindow.name,
      com = uis.Main.OwnMapBtn,
      newFlagName = "new",
      newFlagVisibleFunc = function()
        return RedDotArena.ArenaDefenseMapNew()
      end,
      onlyNew = true,
      dataType = RED_DOT_DATA_TYPE.ARENA_DEFENSE_MAP_NEW
    })
  end
end

function FormationWindow.InitExpeditionCardList()
  local prepareInfo = FormationData.GetStagePrepareInfo(sceneType, formationParam.stageId)
  local specialArray = prepareInfo and prepareInfo.specialArray
  for _, index in pairs(FORMATION_TEAM_INDEX) do
    curCard2PosList[index] = {}
    tempGridCoverInfoList[index] = {}
    curBurstOrderSettingList[index] = {}
  end
  curCaptainCardIdList = {}
  if specialArray then
    local index
    for _, v in pairs(specialArray) do
      index = v.index
      curCard2PosList[index] = SimpleCopy(v.cardUid2Pos)
      curCaptainCardIdList[index] = v.leaderCardId
      curBurstOrderSettingList[index] = SimpleCopy(v.burstOrderSetting)
    end
  end
  curCaptainCardId = curCaptainCardIdList[curTeamIndex]
end

function FormationWindow.UpdateDefenseFormationLeaderCard(captainCardId)
  if formationParam.arenaDefense ~= true then
    return
  end
  local curFormation = tempArenaDefenseFormation
  if curFormation then
    curFormation.leaderCardId = captainCardId
    ArenaService.ArenaSetDefenseReq(curFormation)
  end
end

function FormationWindow.UpdateDefenseFormationBurstOrderSetting(burstOrderSetting)
  if formationParam.arenaDefense ~= true then
    return
  end
  local curFormation = tempArenaDefenseFormation
  if curFormation then
    curFormation.burstOrderSetting = burstOrderSetting
    ArenaService.ArenaSetDefenseReq(curFormation)
  end
end

function FormationWindow.UpdateDefenseFormationCard(cardUid, pos, sendReq)
  if formationParam.arenaDefense ~= true then
    return
  end
  local curFormation = tempArenaDefenseFormation
  if curCaptainCardId then
    local cardInfo = CardData.GetCardDataById(curCaptainCardId)
    if cardInfo and cardInfo.cardUid == cardUid and nil == pos then
      curCaptainCardId = nil
    end
  end
  if curFormation and cardUid and curFormation.cardUid2Pos[cardUid] ~= pos then
    curFormation.cardUid2Pos[cardUid] = pos
    curFormation.leaderCardId = curCaptainCardId
    if sendReq then
      ArenaService.ArenaSetDefenseReq(curFormation)
    end
  end
end

function FormationWindow.UpdateDefenseFormationBuilding(buildingUid, pos)
  if formationParam.arenaDefense ~= true then
    return
  end
  local curFormation = tempArenaDefenseFormation
  if curFormation and buildingUid and curFormation.buildUid2Pos[buildingUid] ~= pos then
    curFormation.buildUid2Pos[buildingUid] = pos
    ArenaService.ArenaSetDefenseReq(curFormation)
  end
end

function FormationWindow.UpdateDefenseFormationMap(arenaMapId)
  if formationParam.arenaDefense ~= true then
    return
  end
  local curFormation = tempArenaDefenseFormation
  if curFormation and arenaMapId and curFormation.arenaMapId ~= arenaMapId then
    curFormation.arenaMapId = arenaMapId
    ArenaService.ArenaSetDefenseReq(curFormation)
    return true
  end
end

function FormationWindow.InitText()
  local battleBtn = uis.Main.BattleBtn
  UIUtil.SetText(battleBtn, T(10058), "NameTxt")
  UIUtil.SetText(battleBtn, T(10059), "WordTxt")
  UIUtil.SetBtnText(uis.Main.ScreenChoice.OprTips.MapBtn, T(10846), T(10847))
  UIUtil.SetBtnText(uis.Main.BuffTipsMainBtn, T(10859))
  if sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
    UIUtil.SetBtnText(uis.Main.StarConditionBtn, T(10860))
    UIUtil.SetText(uis.Main.ExpeditionWave.Wave1Btn, "1", "NumberTxt")
    UIUtil.SetText(uis.Main.ExpeditionWave.Wave2Btn, "2", "NumberTxt")
  end
end

function FormationWindow.InitScreenTips()
  local screenTips = uis.Main.ScreenChoice.ScreenTips
  local queueChoice = screenTips.QueueChoice
  local occupationChoice = screenTips.OccupationChoice
  local elementChoice = screenTips.ElementChoice
  local cdChoice = screenTips.SkillCDChoice
  queueChoice.NameTxt.text = T(10822)
  queueChoice.SubtitleTxt.text = T(10825)
  occupationChoice.NameTxt.text = T(10823)
  occupationChoice.SubtitleTxt.text = T(10826)
  elementChoice.NameTxt.text = T(10824)
  elementChoice.SubtitleTxt.text = T(10827)
  cdChoice.NameTxt.text = T(1181)
  cdChoice.SubtitleTxt.text = T(1182)
  local elementTypeList = {
    {
      type = BATTLE_UNIT_ELEMENT_TYPE.WATER,
      btn = elementChoice.ShuiBtn,
      text = T(611)
    },
    {
      type = BATTLE_UNIT_ELEMENT_TYPE.FIRE,
      btn = elementChoice.HuoBtn,
      text = T(612)
    },
    {
      type = BATTLE_UNIT_ELEMENT_TYPE.WOOD,
      btn = elementChoice.MuBtn,
      text = T(613)
    },
    {
      type = BATTLE_UNIT_ELEMENT_TYPE.DARK,
      btn = elementChoice.AnBtn,
      text = T(614)
    },
    {
      type = BATTLE_UNIT_ELEMENT_TYPE.LIGHT,
      btn = elementChoice.GuangBtn,
      text = T(615)
    }
  }
  for i, v in ipairs(elementTypeList) do
    local btn = v.btn
    btn.changeStateOnClick = false
    UIUtil.SetText(btn, v.text, "WordTxt")
    btn.selected = 1 == selectElementTypeMap[v.type]
    btn.onClick:Set(function()
      btn.selected = not btn.selected
      if btn.selected then
        selectElementTypeMap[v.type] = 1
      else
        selectElementTypeMap[v.type] = nil
      end
      FormationWindow.UpdateCardList()
    end)
  end
  local cardTypeList = {
    {
      type = BATTLE_UNIT_TYPE.DEFENSE,
      btn = occupationChoice.FangYuBtn,
      text = T(616)
    },
    {
      type = BATTLE_UNIT_TYPE.MELEE_ATTACK,
      btn = occupationChoice.JinZhanBtn,
      text = T(617)
    },
    {
      type = BATTLE_UNIT_TYPE.SUPPORT,
      btn = occupationChoice.FaShiBtn,
      text = T(619)
    },
    {
      type = BATTLE_UNIT_TYPE.RANGED_ATTACK,
      btn = occupationChoice.GongJianBtn,
      text = T(620)
    }
  }
  for i, v in ipairs(cardTypeList) do
    local btn = v.btn
    UIUtil.SetText(btn, v.text, "WordTxt")
    btn.changeStateOnClick = false
    btn.selected = 1 == selectCardTypeMap[v.type]
    btn.onClick:Set(function()
      btn.selected = not btn.selected
      if btn.selected then
        selectCardTypeMap[v.type] = 1
      else
        selectCardTypeMap[v.type] = nil
      end
      FormationWindow.UpdateCardList()
    end)
  end
  local str = TableData.GetConfig(70010027, "BaseFixed").array_value
  local arr = Split(str, "|")
  local cardSkillCdList = {
    {
      type = tonumber(arr[1]),
      btn = cdChoice.Time20Btn,
      index = 1,
      text = T(1183, arr[1])
    },
    {
      type = tonumber(arr[2]),
      btn = cdChoice.Time45Btn,
      index = 2,
      text = T(1183, arr[2])
    },
    {
      type = tonumber(arr[3]),
      btn = cdChoice.Time70Btn,
      index = 3,
      text = T(1183, arr[3])
    }
  }
  for i, v in ipairs(cardSkillCdList) do
    local btn = v.btn
    btn.changeStateOnClick = false
    UIUtil.SetText(btn, v.text, "WordTxt")
    btn.selected = 1 == selectCdTypeMap[v.type]
    btn.onClick:Set(function()
      btn.selected = not btn.selected
      if btn.selected then
        selectCdTypeMap[v.type] = 1
      else
        selectCdTypeMap[v.type] = nil
      end
      FormationWindow.UpdateCardList()
    end)
  end
  local teamList = queueChoice.TeamList
  local handAll = teamList:AddItemFromPool()
  ChangeUIController(handAll, "c1", 1)
  handAll.onClick:Add(function()
    if handAll.selected == true then
      curSelectTeamInfo = nil
      FormationWindow.UpdateCardList()
    end
  end)
  UIUtil.SetText(handAll, T(10040))
  handAll.selected = true
  curSelectTeamInfo = nil
  if sceneType ~= ProtoEnum.SCENE_TYPE.ROGUE then
    local allTeam = ActorData.GetAllTeam()
    table.sort(allTeam, function(a, b)
      return a.teamId < b.teamId
    end)
    for i, v in ipairs(allTeam) do
      if #v.cardIds > 0 then
        local hand = teamList:AddItemFromPool()
        ChangeUIController(hand, "c1", 0)
        hand.onClick:Add(function()
          if hand.selected == true then
            curSelectTeamInfo = v
            FormationWindow.UpdateCardList()
          end
        end)
        UIUtil.SetText(hand, v.name)
      end
    end
  end
end

function FormationWindow.UpdateInfo()
  FormationWindow.UpdateLabel()
end

local openTipsUrl = UIUtil.GetResUrl("Formation:OpenTips")
local numberInfoUrl = UIUtil.GetResUrl("Formation:NumberInfo")

function FormationWindow.UpdateTips()
  local list = uis.Main.Choice.TipsList
  list:RemoveChildrenToPool()
  list.touchable = false
  if false == EnterClampUtil.WhetherToEnter(FEATURE_ENUM.FORMATION_TIPS, false) then
    return
  end
  if sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
    if 0 ~= FormationData.guildWarCompensateUid then
      uis.Main.Choice.GuildBossCtr.selectedIndex = 1
      uis.Main.Choice.root.touchable = false
      uis.Main.Choice.ExtendLock1.WordTxt.text = T(11708)
    else
      uis.Main.Choice.GuildBossCtr.selectedIndex = 0
    end
  end
  local count = FormationWindow.GetEmbattledCardCount()
  local max, nextId, nextMax = FormationWindow.GetEmbattledCardMaxCount()
  if sceneType ~= ProtoEnum.SCENE_TYPE.EXPEDITION then
    local value = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.FORMATION_CARD_COUNT, PLAYER_PREF_DEFAULT_VALUE.FORMATION_CARD_COUNT)
    if value == PLAYER_PREF_DEFAULT_VALUE.FORMATION_CARD_COUNT then
      PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.FORMATION_CARD_COUNT, max)
    elseif max > value then
      LeanTween.delayedCall(0.3, function()
        OpenWindow(WinResConfig.BattlePlayerNumberWindow.name, nil, value, max)
      end)
      PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.FORMATION_CARD_COUNT, max)
    end
  end
  if nextId then
    local tips = list:AddItemFromPool(openTipsUrl)
    tips:GetChild("NumberTipsTxt").text = T(10042, nextId, nextMax)
  end
  if formationParam.arenaDefense == true then
    local maxCost, nextLevel, nextMaxCost = FormationData.GetEmbattledLimitBuildingNum()
    if nextLevel then
      local tips = list:AddItemFromPool(openTipsUrl)
      tips:GetChild("NumberTipsTxt").text = T(10872, nextLevel, nextMaxCost - maxCost)
    end
    local tips = list:AddItemFromPool(numberInfoUrl)
    ChangeUIController(tips, "c1", 1)
    tips:GetChild("WordTxt").text = T(10820)
    tips:GetChild("Number1Txt").text = FormationWindow.GetEmbattledBuildingCost()
    tips:GetChild("Number2Txt").text = maxCost
  end
  if sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
    local tips = list:AddItemFromPool(numberInfoUrl)
    ChangeUIController(tips, "c1", 3)
    tips:GetChild("WordTxt").text = T(11715)
    tips:GetChild("Number1Txt").text = FormationWindow.GetEmbattledAssistCount()
    local assistMax = FormationWindow.GetEmbattledAssistMaxCount()
    tips:GetChild("Number2Txt").text = assistMax
  end
  local tips = list:AddItemFromPool(numberInfoUrl)
  ChangeUIController(tips, "c1", 0)
  tips:GetChild("WordTxt").text = T(10046)
  tips:GetChild("Number1Txt").text = count
  tips:GetChild("Number2Txt").text = max
end

function FormationWindow.UpdateCardQuickOperation()
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.FORMATION_CARD_DOWN, false) and curSelectLabelType ~= LABEL_TYPE_ENUM.BUILDING then
    local count = FormationWindow.GetEmbattledCardCount()
    local max = FormationWindow.GetEmbattledCardMaxCount()
    uis.Main.Choice.c4Ctr.selectedIndex = 1
    if count > 0 then
      if formationParam.arenaDefense and count <= 1 then
        uis.Main.Choice.c2Ctr.selectedIndex = 1
      else
        uis.Main.Choice.c2Ctr.selectedIndex = 0
      end
      local enableList = FormationWindow.GetCardEnableList()
      if count >= max then
        uis.Main.Choice.c3Ctr.selectedIndex = 1
      elseif 0 == #enableList then
        uis.Main.Choice.c3Ctr.selectedIndex = 1
      else
        uis.Main.Choice.c3Ctr.selectedIndex = 0
      end
    else
      uis.Main.Choice.c2Ctr.selectedIndex = 1
      local enableList = FormationWindow.GetCardEnableList()
      if #enableList > 0 then
        uis.Main.Choice.c3Ctr.selectedIndex = 0
      else
        uis.Main.Choice.c3Ctr.selectedIndex = 1
      end
    end
  else
    uis.Main.Choice.c4Ctr.selectedIndex = 0
  end
end

function FormationWindow.UpdateGuildWarSkill()
  local playerInfo = GuildWarData.GetGuildPlayerInfo()
  if playerInfo then
    local usedSkillTeam
    for i, v in ipairs(playerInfo.skillTeams) do
      if v.used then
        usedSkillTeam = v
        break
      end
    end
    if nil == usedSkillTeam then
      usedSkillTeam = GuildWarData.GetSkillTeamByTeamId(1) or {}
    end
    local tacticSkillGoBtn = uis.Main.TacticSkillGoBtn
    tacticSkillGoBtn.onClick:Set(function()
      uis.Main.c3Ctr.selectedIndex = 1
      uis.Main.ScreenChoice.c1Ctr.selectedIndex = 2
      FormationWindow.UpdateGuildWarSkillChoose()
      PlayUITrans(uis.Main.ScreenChoice.root, "in", function()
        if uis then
          uis.Main.ScreenChoice.TouchScreenBtn.touchable = true
        end
      end)
    end)
    local skillIds = usedSkillTeam.skillIds or {}
    local skill2Level = playerInfo.skill2Level
    local skillList = tacticSkillGoBtn:GetChild("SkillList")
    
    function skillList.itemRenderer(index, item)
      local skillId = skillIds[index + 1]
      if nil == skillId then
        ChangeUIController(item, "c1", 0)
      else
        ChangeUIController(item, "c1", 1)
        local skillConfig = TableData.GetConfig(skillId, "BaseSkill")
        if skillConfig then
          item:GetChild("PicLoader").url = UIUtil.GetResUrl(skillConfig.icon)
          item:GetChild("NumberTxt").text = T(11741, skill2Level[skillId] or "")
        end
      end
    end
    
    skillList.numItems = 3
    curGuildWarSkills = {}
    for i, v in ipairs(skillIds) do
      table.insert(curGuildWarSkills, {
        skillId = v,
        level = skill2Level[v]
      })
    end
  end
end

function FormationWindow.GetDefaultTeamId(skillTeams)
  local teamId
  for i, v in ipairs(skillTeams) do
    if v.used then
      teamId = v.teamId
      break
    end
  end
  teamId = teamId or 1
  return teamId
end

function FormationWindow.UpdateGuildWarSkillChoose()
  local playerInfo = GuildWarData.GetGuildPlayerInfo()
  if nil == playerInfo then
    return
  end
  local skillTeams = playerInfo.skillTeams or {}
  local skill2Level = playerInfo.skill2Level
  local tacticSkill = uis.Main.ScreenChoice.TacticSkill
  local teamList = tacticSkill.ProgrammeList
  usedSkillTeamId = FormationWindow.GetDefaultTeamId(skillTeams)
  
  function teamList.itemRenderer(index, teamItem)
    UIUtil.SetText(teamItem, T(1596, index + 1))
    local curSkillTeam = GuildWarData.GetSkillTeamByTeamId(index + 1)
    teamItem.onClick:Set(function()
      if teamList.selectedIndex ~= index then
        selectSkillTeamId = index + 1
        FormationWindow.UpdateGuildWarSkillRegion()
        FormationWindow.UpdateAllSkill()
        FormationWindow.UpdateSkillInfo()
        teamList.selectedIndex = index
      end
    end)
    if curSkillTeam and curSkillTeam.used then
      ChangeUIController(teamItem, "c1", 1)
    else
      ChangeUIController(teamItem, "c1", 0)
    end
    if usedSkillTeamId == index + 1 then
      teamItem:FireClick(false, true)
    end
  end
  
  teamList.numItems = 4
end

function FormationWindow.UpdateGuildWarSkillRegion()
  local curSkillTeam = GuildWarData.GetSkillTeamByTeamId(selectSkillTeamId) or {}
  local skillIds = curSkillTeam.skillIds or {}
  local playerInfo = GuildWarData.GetGuildPlayerInfo()
  local skillLevel = playerInfo.skill2Level
  local skillRegion = uis.Main.ScreenChoice.TacticSkill.SkillRegion
  local list = skillRegion.SkillList
  
  function list.itemRenderer(i, skill)
    if skillIds[i + 1] then
      local skillId = skillIds[i + 1]
      local skillData = TableData.GetConfig(skillId, "BaseSkill")
      if skill and skillData then
        skill:GetChild("PicLoader").url = UIUtil.GetResUrl(skillData.icon)
        ChangeUIController(skill, "c1", 1)
        UIUtil.SetText(skill, T(11741, skillLevel[skillData.id] or ""), "NumberTxt")
        skill.touchable = true
        skill.onClick:Set(function()
          local wear = table.contain(skillIds, skillId)
          if wear then
            for i = #skillIds, 1, -1 do
              if skillIds[i] == skillId then
                table.remove(skillIds, i)
                break
              end
            end
            GuildWarService.SetGuildWarSkillTeamReq(selectSkillTeamId, skillIds, selectSkillTeamId == usedSkillTeamId, function()
              FormationWindow.UpdateGuildWarSkillRegion()
              FormationWindow.UpdateAllSkill()
              FormationWindow.UpdateGuildWarSkill()
              FormationWindow.UpdateSkillInfo()
            end)
          end
        end)
        if selectSkill == skillId then
          ChangeUIController(skill, "c2", 1)
        else
          ChangeUIController(skill, "c2", 0)
        end
      end
    else
      ChangeUIController(skill, "c1", 0)
      skill.touchable = false
    end
  end
  
  list.numItems = 3
  if selectSkillTeamId == usedSkillTeamId then
    skillRegion.c1Ctr.selectedIndex = 1
    skillRegion.UseState.WordTxt.text = T(11713)
  else
    skillRegion.c1Ctr.selectedIndex = 0
    UIUtil.SetBtnText(skillRegion.UseBtn, T(11714))
    skillRegion.UseBtn.onClick:Set(function()
      GuildWarService.SetGuildWarSkillTeamReq(selectSkillTeamId, skillIds, true, function()
        FormationWindow.UpdateGuildWarSkillChoose()
        FormationWindow.UpdateGuildWarSkillRegion()
        FormationWindow.UpdateAllSkill()
        FormationWindow.UpdateGuildWarSkill()
      end)
    end)
  end
end

function FormationWindow.UpdateAllSkill()
  local curSkillTeam = GuildWarData.GetSkillTeamByTeamId(selectSkillTeamId) or {}
  local skillIds = curSkillTeam.skillIds or {}
  local playerInfo = GuildWarData.GetGuildPlayerInfo()
  local skill2Level = playerInfo.skill2Level
  local data = GuildWarData.GetGuildWarConfig()
  local choiceList = uis.Main.ScreenChoice.TacticSkill.ChoiceList
  local allSkillIds = data.skill_id
  
  function choiceList.itemRenderer(index, skillItem)
    local skillId = allSkillIds[index + 1]
    local skillConfig = TableData.GetConfig(skillId, "BaseSkill")
    skillItem:GetChild("PicLoader").url = UIUtil.GetResUrl(skillConfig.icon)
    UIUtil.SetText(skillItem:GetChild("Wear"), T(1594))
    ChangeUIController(skillItem, "lock", skill2Level[skillId] and 0 or 1)
    skillItem:GetChild("NumberTxt").text = T(11741, skill2Level[skillId] or "")
    if table.contain(skillIds, skillId) then
      ChangeUIController(skillItem, "wear", 1)
    else
      ChangeUIController(skillItem, "wear", 0)
    end
    skillItem.changeStateOnClick = false
    skillItem.onClick:Set(function()
      selectSkill = skillId
      FormationWindow.UpdateGuildWarSkillRegion()
      FormationWindow.UpdateAllSkill()
      FormationWindow.UpdateSkillInfo()
    end)
    if nil == selectSkill then
      skillItem:FireClick(false, true)
    end
    if selectSkill == skillId then
      ChangeUIController(skillItem, "button", 1)
    else
      ChangeUIController(skillItem, "button", 0)
    end
  end
  
  choiceList.numItems = #allSkillIds
end

function FormationWindow.UpdateSkillInfo()
  if nil == selectSkill then
    return
  end
  local curSkillTeam = GuildWarData.GetSkillTeamByTeamId(selectSkillTeamId) or {}
  local skillIds = curSkillTeam.skillIds or {}
  local playerInfo = GuildWarData.GetGuildPlayerInfo()
  local skill2Level = playerInfo.skill2Level
  local skillConfig = TableData.GetConfig(selectSkill, "BaseSkill")
  local tacticSkill = uis.Main.ScreenChoice.TacticSkill
  local skillLevel = skill2Level[selectSkill] or 1
  tacticSkill.NameTxt.text = skillConfig.name()
  tacticSkill.Level.WordTxt.text = T(1303, skillLevel)
  tacticSkill.Level.NumberTxt.text = T(1599)
  if skill2Level[selectSkill] then
    tacticSkill.lcokCtr.selectedIndex = 0
  else
    tacticSkill.lcokCtr.selectedIndex = 1
  end
  tacticSkill.maxCtr.selectedIndex = skillLevel >= skillConfig.max_level and 1 or 0
  local id = selectSkill * 1000 + skillLevel
  local skillLevelUpConfig = TableData.GetConfig(id, "BaseSkillLevelUp")
  local skillInfoList = {
    {
      c1Index = 0,
      wordTxt = T(1598),
      numberTxt = skillLevelUpConfig.trigger_max
    },
    {
      c1Index = 1,
      wordTxt = T(11723),
      numberTxt = T(11724, skillConfig.cd)
    }
  }
  if skillConfig.element_type then
    skillInfoList[#skillInfoList + 1] = {
      c1Index = 2,
      wordTxt = T(11722),
      isElement = true
    }
  end
  if skillConfig.skill_atk then
    skillInfoList[#skillInfoList + 1] = {
      c1Index = 3,
      wordTxt = T(1600),
      numberTxt = skillConfig.skill_atk
    }
  end
  local numberList = tacticSkill.NumberList
  
  function numberList.itemRenderer(index, item)
    local info = skillInfoList[index + 1]
    item:GetChild("WordTxt").text = info.wordTxt
    if info.isElement then
      if 1 == #skillConfig.element_type and 0 == skillConfig.element_type[1] then
        ChangeUIController(item, "c2", 0)
        item:GetChild("NumberTxt").text = T(11725)
      else
        ChangeUIController(item, "c2", 1)
        local elementList = item:GetChild("ElementList")
        
        function elementList.itemRenderer(i, _item)
          ChangeUIController(_item, nil, skillConfig.element_type[i + 1])
        end
        
        elementList.numItems = #skillConfig.element_type
      end
    else
      ChangeUIController(item, "c2", 0)
      item:GetChild("NumberTxt").text = info.numberTxt
    end
    ChangeUIController(item, "c1", info.c1Index)
  end
  
  numberList.numItems = #skillInfoList
  numberList:ResizeToFit()
  
  function tacticSkill.WordList.itemRenderer(i, txtItem)
    UIUtil.SetText(txtItem, skillLevelUpConfig.des())
  end
  
  tacticSkill.WordList.numItems = 1
  if table.contain(skillIds, selectSkill) then
    UIUtil.SetText(tacticSkill.WearBtn, T(1613))
  else
    UIUtil.SetText(tacticSkill.WearBtn, T(1602))
  end
  tacticSkill.WearBtn.onClick:Set(function()
    local wear = table.contain(skillIds, selectSkill)
    if wear then
      for i = #skillIds, 1, -1 do
        if skillIds[i] == selectSkill then
          table.remove(skillIds, i)
          break
        end
      end
      GuildWarService.SetGuildWarSkillTeamReq(selectSkillTeamId, skillIds, selectSkillTeamId == usedSkillTeamId, function()
        FormationWindow.UpdateGuildWarSkillRegion()
        FormationWindow.UpdateAllSkill()
        FormationWindow.UpdateGuildWarSkill()
        FormationWindow.UpdateSkillInfo()
      end)
    else
      if #skillIds >= 3 then
        table.remove(skillIds, 1)
      end
      table.insert(skillIds, selectSkill)
      GuildWarService.SetGuildWarSkillTeamReq(selectSkillTeamId, skillIds, selectSkillTeamId == usedSkillTeamId, function()
        FormationWindow.UpdateGuildWarSkillRegion()
        FormationWindow.UpdateAllSkill()
        FormationWindow.UpdateGuildWarSkill()
        FormationWindow.UpdateSkillInfo()
      end)
    end
  end)
  local nextLvData = TableData.GetConfig(id + 1, "BaseSkillLevelUp")
  if nextLvData and nextLvData.cost then
    local arr = GetConfigItemList(nextLvData.cost, true)
    if arr[1] then
      local needCount = arr[1].value
      UIUtil.SetIconById(tacticSkill.UpBtn:GetChild("PicLoader"), arr[1].id)
      local count = ActorData.GetItemCount(arr[1].id)
      if needCount <= count then
        ChangeUIController(tacticSkill.UpBtn, "c1", 0)
        UIUtil.SetText(tacticSkill.UpBtn, T(868, count, arr[1].value), "NumberTxt")
      else
        ChangeUIController(tacticSkill.UpBtn, "c1", 1)
        UIUtil.SetText(tacticSkill.UpBtn, T(1635, count, arr[1].value), "NumberTxt")
      end
      UIUtil.SetText(tacticSkill.UpBtn, T(1603))
      tacticSkill.UpBtn.onClick:Set(function()
        if count >= needCount then
          GuildWarService.LevelupGuildWarSkillReq(selectSkill, function(msg)
            FormationWindow.UpdateGuildWarSkillRegion()
            FormationWindow.UpdateAllSkill()
            FormationWindow.UpdateSkillInfo()
          end)
        end
      end)
    end
  end
  local lookBtn = tacticSkill.LookBtn
  UIUtil.SetText(lookBtn, T(1597))
  lookBtn.onClick:Set(function()
    if 1 == tacticSkill.c1Ctr.selectedIndex then
      UIUtil.SetText(lookBtn, T(1597))
      ChangeController(tacticSkill.c1Ctr, 0)
    else
      UIUtil.SetText(lookBtn, T(1632))
      ChangeController(tacticSkill.c1Ctr, 1)
    end
  end)
  local effectList = tacticSkill.EffectRegion.EffectList
  local skillDes = FormationWindow.GetAllSkillEffect(skillConfig)
  
  function effectList.itemRenderer(i, item)
    UIUtil.SetText(item, skillDes[i + 1].des, "WordTxt")
    UIUtil.SetText(item, T(1303, skillDes[i + 1].lv), "LevelTxt")
    if skillDes[i + 1].lv == skillLevel then
      UIUtil.SetText(item:GetChild("Sign"), T(1604), "WordTxt")
      ChangeUIController(item, "c1", 1)
    else
      ChangeUIController(item, "c1", 0)
    end
  end
  
  effectList.numItems = #skillDes
end

function FormationWindow.GetAllSkillEffect(skillData)
  local des = {}
  for skillLevel = 1, skillData.max_level do
    local id = skillData.id * 1000 + skillLevel
    local skillLvData = TableData.GetConfig(id, "BaseSkillLevelUp")
    if skillLvData and skillLvData.des then
      table.insert(des, {
        lv = skillLevel,
        des = skillLvData.des()
      })
    end
  end
  return des
end

function FormationWindow.GetCardListByType(list, cardType)
  local newList = {}
  for i, v in ipairs(list) do
    local cardConfig = CardData.GetBaseConfig(v.cardId)
    if cardConfig.type == cardType then
      table.insert(newList, v)
    end
  end
  return newList
end

function FormationWindow.IsCardEnableInGuildWar(cardInfo)
  local playerInfo = GuildWarData.GetGuildPlayerInfo()
  local usedSelfCardIds = playerInfo.usedSelfCardIds
  local usedAssistCardIds = playerInfo.usedAssistCardIds
  if cardInfo.uin == ActorData.GetUin() then
    if table.contain(usedSelfCardIds, cardInfo.cardId) then
      return false
    elseif FormationWindow.EmbattleSameCard(cardInfo.cardId) then
      return false
    end
  elseif table.contain(usedAssistCardIds, cardInfo.cardId) then
    return false
  elseif FormationWindow.EmbattleSameCard(cardInfo.cardId) then
    return false
  end
  return true
end

function FormationWindow.GetCardEnableList()
  local enableList = {}
  for i, v in ipairs(listData) do
    if curCard2Pos[v.cardUid] == nil then
      local cardState = FormationWindow.GetBattleState(BATTLE_CAMP_FLAG.LEFT, v.cardUid)
      if nil == cardState or cardState and cardState.hp > 0 then
        table.insert(enableList, v)
      end
    end
  end
  if sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR and #enableList > 0 then
    local cardInfo
    for i = #enableList, 1, -1 do
      cardInfo = enableList[i]
      if FormationWindow.IsCardEnableInGuildWar(cardInfo) == false then
        table.remove(enableList, i)
      end
    end
  end
  if #enableList > 0 and remoteNumLimit then
    local count = FormationWindow.GetEmbattledCardCountByType({
      BATTLE_UNIT_TYPE.SUPPORT,
      BATTLE_UNIT_TYPE.RANGED_ATTACK
    })
    if count >= remoteNumLimit then
      for i = #enableList, 1, -1 do
        local cardConfig = CardData.GetBaseConfig(enableList[i])
        if cardConfig.type == BATTLE_UNIT_TYPE.SUPPORT or cardConfig.type == BATTLE_UNIT_TYPE.RANGED_ATTACK then
          table.remove(enableList, i)
        end
      end
    end
  end
  if #enableList > 0 and meleeNumLimit then
    local count = FormationWindow.GetEmbattledCardCountByType({
      BATTLE_UNIT_TYPE.DEFENSE,
      BATTLE_UNIT_TYPE.MELEE_ATTACK
    })
    if count >= meleeNumLimit then
      for i = #enableList, 1, -1 do
        local cardConfig = CardData.GetBaseConfig(enableList[i])
        if cardConfig.type == BATTLE_UNIT_TYPE.DEFENSE or cardConfig.type == BATTLE_UNIT_TYPE.MELEE_ATTACK then
          table.remove(enableList, i)
        end
      end
    end
  end
  return enableList
end

function FormationWindow.GetEmbattledCardCount(card2Pos)
  local count = 0
  local list = card2Pos or curCard2Pos
  for i, v in pairs(list) do
    if i and v then
      count = count + 1
    end
  end
  return count
end

function FormationWindow.GetEmbattledCardMaxCount()
  local max, nextId, nextMax
  if sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
    max = cardUsedLimit
  else
    max, nextId, nextMax = FormationData.GetEmbattledLimitCardNum(curArenaMapId)
  end
  return max, nextId, nextMax
end

function FormationWindow.GetEmbattledCardCountByType(typeList, card2Pos)
  local count = 0
  local list = card2Pos or curCard2Pos
  for i, v in pairs(list) do
    if i and v then
      local card = FormationData.GetCardDataByUid(i, sceneType)
      if card then
        local cardConfig = CardData.GetBaseConfig(card.cardId)
        local type = cardConfig.type
        for _, tempType in ipairs(typeList) do
          if type == tempType then
            count = count + 1
            break
          end
        end
      end
    end
  end
  return count
end

function FormationWindow.GetEmbattledCardCountSplitByType()
  local countByTypeList = {}
  for cardUid, pos in pairs(curCard2Pos) do
    if cardUid and pos then
      local cardData = FormationData.GetCardDataByUid(cardUid, sceneType)
      if cardData then
        local cardConfig = CardData.GetBaseConfig(cardData.cardId)
        local type = cardConfig.type
        if nil == countByTypeList[type] then
          countByTypeList[type] = 0
        end
        countByTypeList[type] = countByTypeList[type] + 1
      end
    end
  end
  return countByTypeList
end

function FormationWindow.IsAssistCard(cardUid)
  local card = CardData.GetCardDataByUid(cardUid)
  if nil == card then
    return true
  end
  return false
end

function FormationWindow.GetEmbattledAssistCount()
  local count = 0
  for cardUid, v in pairs(curCard2Pos) do
    local card = CardData.GetCardDataByUid(cardUid)
    if nil == card then
      count = count + 1
    end
  end
  return count
end

function FormationWindow.GetEmbattledAssistMaxCount()
  return TableData.GetConfig(70011410, "BaseFixed").int_value
end

function FormationWindow.GetEmbattledBuildingCost()
  local count = 0
  for i, v in pairs(curBuild2Pos) do
    local building = FormationData.GetBuildingByUid(i)
    if building then
      local config = TableData.GetConfig(building.id, "BaseBuilding")
      if config then
        count = count + config.cost
      end
    end
  end
  return count
end

function FormationWindow.GetBuildingCostMax()
  local config = TableData.GetConfig(curArenaMapId, "BaseArenaMap")
  return config.cost_max
end

function FormationWindow.UpdateExpeditionInfo()
  if curTeamIndex == FORMATION_TEAM_INDEX.ONE then
    uis.Main.ExpeditionWave.WordTxt.text = T(10866, 1)
    UIUtil.SetBtnText(uis.Main.SwitchBtn, T(10867, 2))
    uis.Main.ExpeditionWave.Wave1Btn.selected = true
    uis.Main.ExpeditionWave.Wave2Btn.selected = false
    uis.Main.c1Ctr.selectedIndex = 1
    local list = curCard2PosList[FORMATION_TEAM_INDEX.TWO]
    if table.getLen(list) > 0 then
      uis.Main.ExpeditionWave.c1Ctr.selectedIndex = 1
      uis.Main.ExpeditionWave.c2Ctr.selectedIndex = FORMATION_TEAM_INDEX.TWO - 1
      FormationWindow.UpdateExpeditionOtherTeamInfo(list)
    else
      uis.Main.ExpeditionWave.c1Ctr.selectedIndex = 0
    end
    uis.Main.SwitchBtn.selected = false
  elseif curTeamIndex == FORMATION_TEAM_INDEX.TWO then
    uis.Main.ExpeditionWave.WordTxt.text = T(10866, 2)
    UIUtil.SetBtnText(uis.Main.SwitchBtn, T(10867, 1))
    uis.Main.ExpeditionWave.Wave1Btn.selected = false
    uis.Main.ExpeditionWave.Wave2Btn.selected = true
    uis.Main.c1Ctr.selectedIndex = 0
    local list = curCard2PosList[FORMATION_TEAM_INDEX.ONE]
    if table.getLen(list) > 0 then
      uis.Main.ExpeditionWave.c1Ctr.selectedIndex = 1
      uis.Main.ExpeditionWave.c2Ctr.selectedIndex = FORMATION_TEAM_INDEX.ONE - 1
      FormationWindow.UpdateExpeditionOtherTeamInfo(list)
    else
      uis.Main.ExpeditionWave.c1Ctr.selectedIndex = 0
    end
    uis.Main.SwitchBtn.selected = true
  end
end

function FormationWindow.UpdateExpeditionOtherTeamInfo(card2posList)
  local cardList = uis.Main.ExpeditionWave.CardList.CardList
  UIUtil.SetExpeditionCardList(cardList, card2posList, nil, stageConfig, curTeamIndex == FORMATION_TEAM_INDEX.ONE and FORMATION_TEAM_INDEX.TWO or FORMATION_TEAM_INDEX.ONE)
end

function FormationWindow.UpdateMap(onlyRefreshMap)
  local mapId
  local changeMap = true
  if curTeamIndex then
    mapId = curMapIdList[curTeamIndex]
    cardUsedLimit = cardUsedLimitList[curTeamIndex]
  end
  if curTeamIndex then
    bottomGridContainer = bottomGridContainerList[curTeamIndex]
    coverGridContainer = coverGridContainerList[curTeamIndex]
    dragGridContainer = dragGridContainerList[curTeamIndex]
    objectContainer = objectContainerList[curTeamIndex]
    effectContainer = effectContainerList[curTeamIndex]
    gridLineContainer = gridLineContainerList[curTeamIndex]
    bottomGridMap = bottomGridMapList[curTeamIndex]
    bottomRangeEnableRect = bottomRangeEnableRectList[curTeamIndex]
    rangeEffect = rangeEffectList[curTeamIndex]
    rangeEffectOriginScale = rangeEffectOriginScaleList[curTeamIndex]
    tempGridCoverInfo = tempGridCoverInfoList[curTeamIndex]
    if bottomGridContainer and coverGridContainer and dragGridContainer and objectContainer and effectContainer then
      curCard2Pos = SimpleCopy(curCard2PosList[curTeamIndex])
      curBurstOrderSetting = SimpleCopy(curBurstOrderSettingList[curTeamIndex])
      FormationWindow.UpdateTips()
      return
    end
  end
  if stageConfig then
    if sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
      if nil == mapId then
        local mapList = stageConfig.expedition_map_list
        local config = TableData.GetConfig(mapList[curTeamIndex], "BaseExpeditionMap")
        mapId = config.map_id
        curMapIdList[curTeamIndex] = mapId
        cardUsedLimit = config.role_num
        cardUsedLimitList[curTeamIndex] = cardUsedLimit
      else
        changeMap = false
      end
    else
      mapId = stageConfig.map_id
    end
  elseif formationParam.arenaDefense then
    local curFormation = tempArenaDefenseFormation
    curArenaMapId = curFormation.arenaMapId
    local arenaMapConfig = TableData.GetConfig(curFormation.arenaMapId, "BaseArenaMap")
    mapId = arenaMapConfig.map_id
  elseif sceneType == ProtoEnum.SCENE_TYPE.ARENA and formationParam.enemyFormation then
    local arenaMap = TableData.GetConfig(curArenaMapId, "BaseArenaMap")
    mapId = arenaMap.map_id
  else
    mapId = 1
  end
  if nil == mapId then
    return
  end
  curMapId = mapId
  local mapConfig = TableData.GetConfig(mapId, "BaseMap")
  remoteNumLimit = mapConfig.remote_num
  meleeNumLimit = mapConfig.melee_num
  if changeMap then
    local holder
    if curTeamIndex == FORMATION_TEAM_INDEX.TWO then
      holder = uis.Main.BackGround2.BackGroundHolder
    else
      holder = uis.Main.BackGround.BackGroundHolder
    end
    holder.displayObject:Dispose()
    ResourceManager.InstantiateAsync(ModelUtil.GetFullPath(mapConfig.background_path, RES_PATH_PREFIX.MAP_BACKGROUND), function(model)
      UIUtil.SetObjectToUI(model, holder)
      local mapScale = Const.mapScale
      LuaUtil.SetScale(model, mapScale, mapScale, mapScale, true)
      LuaUtil.SetLocalPositionAndRotation(model, holder.width / 2, -holder.height / 2, 0, FormationData.rotation, 0, 0)
    end)
    if mapConfig.background_up_path then
      ResourceManager.InstantiateAsync(ModelUtil.GetFullPath(mapConfig.background_up_path, RES_PATH_PREFIX.MAP_BACKGROUND), function(model)
        local holderUp = uis.Main.BackGroundUp.BackGroundHolder
        UIUtil.SetObjectToUI(model, holderUp)
        local mapScale = Const.mapScale
        LuaUtil.SetScale(model, mapScale, mapScale, mapScale, true)
        LuaUtil.SetLocalPositionAndRotation(model, holderUp.width / 2, -holderUp.height / 2, 0, FormationData.rotation, 0, 0)
      end)
    end
  end
  FormationWindow.UpdateMapInfo()
  if onlyRefreshMap then
    return
  end
  local sizeX = mapConfig.size[1]
  local sizeY = mapConfig.size[2]
  selfSizeX = mapConfig.size_own[1]
  selfSizeY = mapConfig.size_own[2]
  local halfSizeX = math.ceil(sizeX / 2)
  local halfSizeY = math.ceil(sizeX / 2)
  local mapArray = {}
  for i = 1 - halfSizeX, sizeX + halfSizeX do
    mapArray[i] = {}
    for j = 1 - halfSizeY, selfSizeY + halfSizeY do
      mapArray[i][j] = {}
    end
  end
  local girdRoot
  if curTeamIndex == FORMATION_TEAM_INDEX.TWO then
    girdRoot = uis.Main.FormationGrid2.root
  else
    girdRoot = uis.Main.FormationGrid.root
  end
  curMapGridScale = Const.gridScaleTable[sizeY]
  girdRoot:SetScale(curMapGridScale, curMapGridScale)
  if nil == gridLineContainer then
    gridLineContainer = UIMgr:CreateObject("Formation", "FormationGridLine")
    girdRoot:AddChild(gridLineContainer)
    if curTeamIndex then
      gridLineContainerList[curTeamIndex] = gridLineContainer
    end
  end
  if nil == bottomGridContainer then
    bottomGridContainer = FairyGUI.GComponent()
    if curTeamIndex then
      bottomGridContainerList[curTeamIndex] = bottomGridContainer
    end
    girdRoot:AddChild(bottomGridContainer)
    bottomGridContainer.gameObjectName = "BottomGridContainer"
    bottomGridContainer.size = girdRoot.size
    bottomGridContainer.pivotAsAnchor = girdRoot.pivotAsAnchor
    bottomGridContainer.pivot = girdRoot.pivot
  end
  if nil == coverGridContainer then
    coverGridContainer = FairyGUI.GComponent()
    if curTeamIndex then
      coverGridContainerList[curTeamIndex] = coverGridContainer
    end
    girdRoot:AddChild(coverGridContainer)
    coverGridContainer.gameObjectName = "CoverGridContainer"
    coverGridContainer.size = girdRoot.size
    coverGridContainer.pivotAsAnchor = girdRoot.pivotAsAnchor
    coverGridContainer.pivot = girdRoot.pivot
  end
  if nil == dragGridContainer then
    dragGridContainer = FairyGUI.GComponent()
    if curTeamIndex then
      dragGridContainerList[curTeamIndex] = dragGridContainer
    end
    girdRoot:AddChild(dragGridContainer)
    dragGridContainer.gameObjectName = "DragGridContainer"
    dragGridContainer.size = girdRoot.size
    dragGridContainer.pivotAsAnchor = girdRoot.pivotAsAnchor
    dragGridContainer.pivot = girdRoot.pivot
  end
  if nil == objectContainer then
    objectContainer = FairyGUI.GComponent()
    if curTeamIndex then
      objectContainerList[curTeamIndex] = objectContainer
    end
    girdRoot:AddChild(objectContainer)
    objectContainer.gameObjectName = "ObjectContainer"
    objectContainer.size = girdRoot.size
    objectContainer.pivotAsAnchor = girdRoot.pivotAsAnchor
    objectContainer.pivot = girdRoot.pivot
  end
  if nil == effectContainer then
    effectContainer = FairyGUI.GComponent()
    if curTeamIndex then
      effectContainerList[curTeamIndex] = effectContainer
    end
    girdRoot:AddChild(effectContainer)
    effectContainer.gameObjectName = "EffectContainer"
    effectContainer.size = girdRoot.size
    effectContainer.pivotAsAnchor = girdRoot.pivotAsAnchor
    effectContainer.pivot = girdRoot.pivot
  end
  if nil == bottomGridMap then
    bottomGridMap = {}
    if curTeamIndex then
      bottomGridMapList[curTeamIndex] = bottomGridMap
    end
  end
  girdRoot.displayObject.rotationX = FormationData.rotation + 90
  local space = FormationData.bottomGridWidth
  local gridScale = FormationData.bottomGridScale
  local gridInitX = (girdRoot.width - sizeX * space) / 2
  local gridInitY = (girdRoot.height - sizeY * space) / 2
  gridLineContainer.width = space * (sizeX + 1) * gridScale
  gridLineContainer.height = space * (sizeY + 1) * gridScale
  gridLineContainer:Center()
  local isArenaDefense = formationParam.arenaDefense
  for x, xArray in pairs(mapArray) do
    for y, _ in pairs(xArray) do
      local index = x * 100 + y
      if isArenaDefense then
        bottomGridMap[index] = {
          index = index,
          x = (x - 1) * space + gridInitX,
          y = (y - 1) * space + gridInitY,
          needGridObject = true
        }
      elseif x > 0 and x <= selfSizeX and y > 0 and y <= selfSizeY then
        bottomGridMap[index] = {
          index = index,
          x = (x - 1) * space + gridInitX,
          y = (y - 1) * space + gridInitY,
          needGridObject = true
        }
      else
        bottomGridMap[index] = {
          index = index,
          x = (x - 1) * space + gridInitX,
          y = (y - 1) * space + gridInitY
        }
      end
    end
  end
  gridPosListByType = {}
  local role_site = mapConfig.role_site
  local role_site_type = mapConfig.role_site_type
  local effectFormationCardTypeList = {}
  if sceneType == ProtoEnum.SCENE_TYPE.ROGUE then
    effectFormationCardTypeList = FormationData.GetRogueEffectFormation()
  end
  for i, roleIndex in ipairs(role_site) do
    bottomGridMap[roleIndex].cardEnable = true
    local _, t = Decimal2Binary(role_site_type[i])
    local count = #t
    local tempI = 1
    for index = count, 1, -1 do
      if 1 == tonumber(t[index]) or 1 == effectFormationCardTypeList[tempI] then
        bottomGridMap[roleIndex]["roleType" .. tempI] = true
        if nil == gridPosListByType[tempI] then
          gridPosListByType[tempI] = {}
        end
        table.insert(gridPosListByType[tempI], roleIndex)
      end
      tempI = tempI + 1
    end
  end
  local building_site = mapConfig.building_site or {}
  for _, buildingIndex in ipairs(building_site) do
    bottomGridMap[buildingIndex].buildingEnable = true
  end
  for index, gridInfo in pairs(bottomGridMap) do
    if nil == scaleV2 then
      scaleV2 = Vector2.one * gridScale
    end
    gridInfo.grid = {
      x = gridInfo.x,
      y = gridInfo.y,
      scale = scaleV2,
      width = 80,
      height = 80
    }
    if gridInfo.needGridObject then
      if 304 == index or 101 == index or 202 == index or 104 == index then
        local gridObject = UIMgr:CreateObject("Formation", "BattleLattice")
        bottomGridContainer:AddChild(gridObject)
        if gridInfo.cardEnable then
          ChangeUIController(gridObject, "c1", 0)
        elseif gridInfo.buildingEnable then
          ChangeUIController(gridObject, "c1", 1)
        else
          ChangeUIController(gridObject, "c1", 2)
        end
        gridObject:SetXY(gridInfo.x, gridInfo.y)
        gridObject:SetScale(gridScale, gridScale)
        gridObject.gameObjectName = index
        gridObject.name = "grid_"
        gridInfo.gridObject = gridObject
      else
        UIMgr:CreateObjectAsync("Formation", "BattleLattice", function(gridObject)
          if uis then
            bottomGridContainer:AddChild(gridObject)
            if gridInfo.cardEnable then
              ChangeUIController(gridObject, "c1", 0)
            elseif gridInfo.buildingEnable then
              ChangeUIController(gridObject, "c1", 1)
            else
              ChangeUIController(gridObject, "c1", 2)
            end
            gridObject:SetXY(gridInfo.x, gridInfo.y)
            gridObject:SetScale(gridScale, gridScale)
            gridObject.gameObjectName = index
            gridObject.name = "grid_"
            gridInfo.gridObject = gridObject
          end
        end)
      end
    end
  end
  if nil == bottomRangeEnableRect then
    bottomRangeEnableRect = UIMgr:CreateObject("Formation", "RangeLattice")
    local holder = bottomRangeEnableRect:GetChild("RangeHolder")
    ResourceManager.InstantiateAsync("Assets/Art/Effects/Prefab/UI_prefab/Embattle/FX_embattle_green_choose.prefab", function(effect)
      UIUtil.SetObjectToUI(effect, holder)
      LuaUtil.SetLocalEuler(effect, -90, 0, 0)
      rangeEffect = effect
      rangeEffectOriginScale = rangeEffect.transform.localScale.x * Const.mapScale
      if curTeamIndex then
        rangeEffectOriginScaleList[curTeamIndex] = rangeEffectOriginScale
        rangeEffectList[curTeamIndex] = rangeEffect
      end
    end)
    bottomGridContainer:AddChild(bottomRangeEnableRect)
    FormationWindow.SetRangeRectVisible(false)
    bottomRangeEnableRect.touchable = false
    if curTeamIndex then
      bottomRangeEnableRectList[curTeamIndex] = bottomRangeEnableRect
    end
  end
  FormationWindow.ShowLeft()
  FormationWindow.ShowOther()
  FormationWindow.UpdateTips()
  FormationWindow.UpdateSort()
  FormationWindow.UpdateMapEffect()
end

function FormationWindow.UpdateMapEffect()
  if effectContainer and stageConfig and stageConfig.effect_path then
    ResourceManager.InstantiateAsync(stageConfig.effect_path, function(effect)
      if nil == effectContainer then
        ResourceManager.DestroyGameObject(effect)
        return
      end
      local holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
      effectContainer:AddChildAt(holder, 0)
      UIUtil.SetObjectToUI(effect, holder)
      holder:Center()
      local mapScale = Const.mapScale
      LuaUtil.SetScale(effect, mapScale, mapScale, mapScale, true)
      LuaUtil.SetLocalPositionAndRotation(effect, 0, 0, 0, 90, 0, 0)
    end)
  end
end

function FormationWindow.UpdateMapInfo()
  local mapBtn = uis.Main.OwnMapBtn
  if mapBtn then
    if formationParam.arenaDefense == true then
      mapBtn.visible = true
      mapBtn.onClick:Set(function()
        PlayUITrans(uis.Main.ScreenChoice.root, "in", function()
          if uis then
            uis.Main.ScreenChoice.TouchScreenBtn.touchable = true
          end
        end)
        FormationWindow.ShowChoiceOprTips(OPR_TIPS_TYPE.MAP)
        needClearMap = true
      end)
      ChangeUIController(mapBtn, "c1", 1)
      local mapPic = mapBtn:GetChild("MapPic")
      local picLoader = mapPic:GetChild("PicLoader")
      local arenaMapConfig = TableData.GetConfig(curArenaMapId, "BaseArenaMap")
      picLoader.url = UIUtil.GetResUrl(arenaMapConfig.icon)
      mapBtn:GetChild("WordTxt").text = arenaMapConfig.name()
    else
      mapBtn.visible = false
    end
  end
end

function FormationWindow.UpdateMapBuffList()
  if sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
    return
  end
  local buff_list
  if sceneType == ProtoEnum.SCENE_TYPE.ARENA and curArenaMapId then
    local arenaMapConfig = TableData.GetConfig(curArenaMapId, "BaseArenaMap")
    buff_list = arenaMapConfig.buff_list
  end
  if stageConfig and stageConfig.buff_list then
    buff_list = buff_list or {}
    for i, v in ipairs(stageConfig.buff_list) do
      table.insert(buff_list, v)
    end
  end
  if stageConfig and stageConfig.buff_add then
    buff_list = buff_list or {}
    table.insert(buff_list, stageConfig.buff_add)
  end
  local preBuffIds = {}
  if buff_list then
    for i = #buff_list, 1, -1 do
      local config = TableData.GetConfig(buff_list[i], "BaseSkillBuffPre")
      if nil == config or nil == config.icon then
        table.remove(buff_list, i)
      end
    end
  end
  if buff_list and #buff_list > 0 then
    uis.Main.c4Ctr.selectedIndex = 1
    local buffTipsMainBtn = uis.Main.BuffTipsMainBtn
    if #buff_list > 0 then
      buffTipsMainBtn.onClick:Set(function()
        InfoTipsUtil.ShowBuffTipsWindow(buff_list)
      end)
    end
  else
    uis.Main.c4Ctr.selectedIndex = 0
  end
end

function FormationWindow.UpdateBurst()
  local burst = uis.Main.BurstStrip
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.BURST_SKILL, false) == false then
    burst.root.visible = false
    return
  end
  local list = burst.OccupationList
  list:RemoveChildrenToPool()
  local countByTypeList = FormationWindow.GetEmbattledCardCountSplitByType()
  local showCardTypeList = {
    {
      type = BATTLE_UNIT_TYPE.RANGED_ATTACK,
      c1Index = 4
    },
    {
      type = BATTLE_UNIT_TYPE.SUPPORT,
      c1Index = 3
    },
    {
      type = BATTLE_UNIT_TYPE.MELEE_ATTACK,
      c1Index = 1
    },
    {
      type = BATTLE_UNIT_TYPE.DEFENSE,
      c1Index = 0
    }
  }
  local activeCount = 0
  for i, v in ipairs(showCardTypeList) do
    local hand = list:AddItemFromPool()
    ChangeUIController(hand, "c1", v.c1Index)
    local count = countByTypeList[v.type]
    if count and count > 0 then
      ChangeUIController(hand, "c2", 1)
      activeCount = activeCount + 1
      hand:GetChild("NumberTxt").text = count
    else
      ChangeUIController(hand, "c2", 0)
    end
  end
  if activeCount >= #showCardTypeList then
    burst.c1Ctr.selectedIndex = 1
  else
    burst.c1Ctr.selectedIndex = 0
  end
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.BURST_SKILL_TIPS, false) then
    burst.root.touchable = true
    burst.root.onClick:Set(function()
      local cardUidList = {}
      local cards = {}
      for uid, pos in pairs(curCard2Pos) do
        local card = FormationData.GetCardDataByUid(uid, sceneType)
        local cardId = card.cardId
        local baseConfig = TableData.GetConfig(cardId, "BaseCard")
        table.insert(cards, {
          cardUid = uid,
          cardId = cardId,
          type = baseConfig.type,
          positionIndexX = math.floor(pos / 100),
          positionIndexY = pos % 100
        })
      end
      table.sort(cards, function(a, b)
        if a.type ~= b.type then
          return a.type < b.type
        elseif a.positionIndexX == b.positionIndexX then
          return a.positionIndexY < b.positionIndexY
        else
          return a.positionIndexX > b.positionIndexX
        end
      end)
      for i, v in ipairs(cards) do
        table.insert(cardUidList, v.cardUid)
      end
      OpenWindow(WinResConfig.BurstTipsWindow.name, nil, curCaptainCardId, cardUidList, curCard2Pos, curBurstOrderSetting, sceneType)
    end)
  else
    burst.root.touchable = false
  end
  if true == EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CAPTAIN_SKILL, false) then
    burst.c3Ctr.selectedIndex = 0
    local cardInfo
    if curCaptainCardId then
      cardInfo = FormationWindow.GetEmbattleCardById(curCaptainCardId)
      if cardInfo then
      else
        curCaptainCardId = nil
        if curTeamIndex then
          curCaptainCardIdList[curTeamIndex] = nil
        end
        FormationWindow.UpdateDefenseFormationLeaderCard(curCaptainCardId)
      end
    end
    if curCaptainCardId then
      burst.c2Ctr.selectedIndex = 0
      burst.LeaderHead.c1Ctr.selectedIndex = 0
      UIUtil.SetHeadByFaceId(cardInfo.fashionId, burst.LeaderHead.LeaderHeadBg.HeadLoader, HEAD_ICON_TYPE_ENUM.RECT)
    else
      burst.c2Ctr.selectedIndex = 1
      burst.LeaderHead.c1Ctr.selectedIndex = 1
      burst.BurstStripTips.WordTxt.text = T(10331)
    end
  else
    burst.c2Ctr.selectedIndex = 1
    burst.c3Ctr.selectedIndex = 1
  end
end

function FormationWindow.GetEmbattleCardById(cardId)
  for uid, pos in pairs(curCard2Pos) do
    local cardData = FormationData.GetCardDataByUid(uid, sceneType)
    if cardData.cardId == cardId then
      return cardData
    end
  end
end

function FormationWindow.ShowChoiceOprTips(oprTipsType)
  uis.Main.c3Ctr.selectedIndex = 1
  local screenChoice = uis.Main.ScreenChoice
  screenChoice.c1Ctr.selectedIndex = 1
  if oprTipsType == OPR_TIPS_TYPE.MAP then
    curSelectMapId = curArenaMapId
    FormationWindow.ShowMapChoice()
  end
end

function FormationWindow.ShowMapChoice()
  local oprTipsMap = uis.Main.ScreenChoice.OprTips.OprTipsMap
  local ownMaps = FormationData.GetArenaMap()
  table.sort(ownMaps, function(a, b)
    return a.id < b.id
  end)
  local mapList = oprTipsMap.MapList
  mapList:RemoveChildrenToPool()
  for i, v in ipairs(ownMaps) do
    local item = mapList:AddItemFromPool()
    FormationWindow.RenderOneMap(item, v, mapList, i)
  end
end

function FormationWindow.RenderOneMap(item, mapConfig, mapList, index)
  item:GetChild("MapIconPic"):GetChild("IconLoader").url = UIUtil.GetResUrl(mapConfig.icon)
  item:GetChild("UseTips"):GetChild("WordTxt").text = T(10850)
  local unlockRank = mapConfig.use_rank
  local isUnlock = true
  if unlockRank then
    local highestRank = ArenaData.Info.historyHighRank
    if highestRank <= 0 or unlockRank < highestRank then
      isUnlock = false
    end
  end
  item.onClick:Set(function()
    if mapList.selectedIndex ~= index - 1 then
      mapList.selectedIndex = index - 1
      curSelectMapId = mapConfig.id
      FormationWindow.UpdateCurMapDetail(mapConfig, isUnlock)
      if RedDotArena.ArenaOneMapNew(nil, mapConfig) then
        FormationWindow.ClearOneMapNew(mapConfig.id)
      end
    end
  end)
  if mapConfig.id == curArenaMapId then
    ChangeUIController(item, "c1", 1)
    item.onClick:Call()
  else
    ChangeUIController(item, "c1", 0)
  end
  if isUnlock then
    ChangeUIController(item, "lock", 0)
  else
    ChangeUIController(item, "lock", 1)
  end
  RedDotMgr.AddNode({
    windowName = WinResConfig.FormationWindow.name,
    com = item,
    newFlagName = "new",
    newFlagVisibleFunc = function()
      return RedDotArena.ArenaOneMapNew(nil, mapConfig)
    end,
    onlyNew = true,
    dataType = RED_DOT_DATA_TYPE.ARENA_DEFENSE_MAP_NEW
  })
end

function FormationWindow.UpdateCurMapDetail(mapConfig, isUnlock)
  local parent = uis.Main.ScreenChoice.OprTips.OprTipsMap.root
  if mapConfig.id == curArenaMapId then
    ChangeUIController(parent, "c1", 0)
  elseif false == isUnlock then
    ChangeUIController(parent, "c1", 2)
    uis.Main.ScreenChoice.OprTips.OprTipsMap.LockTips.LockTxt.text = T(10873, mapConfig.use_rank)
  else
    ChangeUIController(parent, "c1", 1)
    local useBtn = uis.Main.ScreenChoice.OprTips.OprTipsMap.UseBtn
    UIUtil.SetBtnText(useBtn, T(10844), T(10845))
    useBtn.onClick:Set(function()
      UIMgr:SendWindowMessage(WinResConfig.FormationWindow.name, WindowMsgEnum.FormationWindow.CHANGE_MAP, mapConfig.id)
      FormationWindow.ShowMapChoice()
    end)
  end
  local contentList = uis.Main.ScreenChoice.OprTips.OprTipsMap.ContentList
  FormationMgr.ShowMapChoiceInfo(mapConfig, contentList)
end

function FormationWindow.UpdateBottomList(labelInfo)
  labelInfo.func()
end

function FormationWindow.IsCardSelect(cardInfo)
  if tempArenaDefenseFormation then
    local curFormation = tempArenaDefenseFormation
    if curFormation.cardUid2Pos[cardInfo.cardUid] then
      return true, curFormation.cardUid2Pos[cardInfo.cardUid]
    end
  elseif sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
    for index, card2pos in pairs(curCard2PosList) do
      for uid, pos in pairs(card2pos) do
        if uid == cardInfo.cardUid then
          return true, pos, index
        end
      end
    end
  else
    for uid, pos in pairs(curCard2Pos) do
      if uid == cardInfo.cardUid then
        return true, pos
      end
    end
  end
  return false
end

function FormationWindow.IsBuildingSelect(buildUid)
  if tempArenaDefenseFormation then
    if tempArenaDefenseFormation.buildUid2Pos[buildUid] then
      return true
    end
  else
    for uid, pos in pairs(curBuild2Pos) do
      if uid == buildUid then
        return true
      end
    end
  end
  return false
end

function FormationWindow.IsBuildingBeyondCost(buildUid)
  local curCost = FormationWindow.GetEmbattledBuildingCost()
  local maxCost = FormationData.GetEmbattledLimitBuildingNum()
  if curCost >= maxCost then
    return true
  end
  local building = FormationData.GetBuildingByUid(buildUid)
  local id = building.id
  local config = TableData.GetConfig(id, "BaseBuilding")
  if config.cost > maxCost - curCost then
    return true
  end
  return false
end

function FormationWindow.IsMapSelect(arenaMapId)
  return tempArenaDefenseFormation.arenaMapId == arenaMapId
end

function FormationWindow.RefreshItem(index, hand)
  if playAnim then
    hand.alpha = 0
  end
  if curSelectLabelType == LABEL_TYPE_ENUM.BUILDING then
    local buildingInfo = listData[index + 1]
    if curOrLastDragBuildingUid == buildingInfo.uid then
      ChangeUIController(hand, "c2", 1)
    else
      ChangeUIController(hand, "c2", 0)
    end
    if updateWhenDrag then
      return
    end
    ChangeUIController(hand, "c1", 2)
    local configData = TableData.GetConfig(buildingInfo.id, "BaseBuilding")
    local buildingFrame = hand:GetChild("BuildFrame_R")
    if buildingFrame then
      local isUnlock = buildingInfo.isUnlock
      if false == isUnlock then
        buildingFrame:GetChild("LockTxt").text = T(10873, buildingInfo.unlockRank)
      end
      RedDotMgr.AddNode({
        windowName = WinResConfig.FormationWindow.name,
        com = buildingFrame,
        newFlagName = "new",
        newFlagVisibleFunc = function()
          return RedDotArena.ArenaOneBuildingNew(nil, configData)
        end,
        onlyNew = true,
        dataType = RED_DOT_DATA_TYPE.ARENA_DEFENSE_BUILDING_NEW
      })
      ChangeUIController(buildingFrame, "c3", isUnlock and 0 or 1)
      buildingFrame:GetChild("BuildTxt").text = configData.cost
      local monsterId = configData.monster_id
      if monsterId then
        local monsterConfig = TableData.GetConfig(monsterId, "BaseMonster")
        local elementList = buildingFrame:GetChild("ElementList")
        UIUtil.ShowElementList(elementList, monsterConfig)
      end
      local loader = buildingFrame:GetChild("BuildPic"):GetChild("PicLoader")
      loader.url = UIUtil.GetResUrl(configData.head_icon_square)
      if FormationWindow.IsBuildingSelect(buildingInfo.uid) then
        ChangeUIController(buildingFrame, "c2", 1)
        ChangeUIController(buildingFrame:GetChild("State"), "c1", 0)
        FormationWindow.SetSwipeGestureEnable(buildingFrame, false)
      else
        if isUnlock then
          FormationWindow.InitSwipeGesture(buildingFrame, nil, buildingInfo)
        else
          FormationWindow.SetSwipeGestureEnable(buildingFrame, false)
        end
        ChangeUIController(buildingFrame, "c2", 0)
      end
      local _needGridX = math.ceil(configData.range[1] / FormationData.bottomGridUIWidth)
      local _needGridY = math.ceil(configData.range[2] / FormationData.bottomGridUIWidth)
      buildingFrame:GetChild("SizeTxt").text = T(10854, _needGridX, _needGridY)
      hand.onClick:Add(FormationWindow.TouchItem)
    end
  else
    local cardInfo = listData[index + 1]
    if curOrLastDragCardUid == cardInfo.cardUid then
      ChangeUIController(hand, "c2", 1)
    else
      ChangeUIController(hand, "c2", 0)
    end
    if updateWhenDrag then
      return
    end
    ChangeUIController(hand, "c1", 0)
    local configData = CardData.GetBaseConfig(cardInfo.cardId)
    hand.gameObjectName = cardInfo.cardId
    hand.name = cardInfo.cardId
    local headFrame = hand:GetChild("HeadFrame_R")
    if headFrame then
      local levelTxt = headFrame:GetChild("LevelTxt")
      local lvId = configData.grow_model_id * 1000 + cardInfo.level
      local lvData = TableData.GetConfig(lvId, "BaseCardLevelUp")
      levelTxt.text = T(10041, lvData.level_show)
      local fashionConfig = TableData.GetConfig(cardInfo.fashionId, "BaseFashion")
      local loader = headFrame:GetChild("PicMask"):GetChild("PicLoader")
      loader.url = UIUtil.GetResUrl(fashionConfig.head_icon_rect)
      local cardConfig = TableData.GetConfig(cardInfo.cardId, "BaseCard")
      ChangeUIController(headFrame, "c1", cardConfig.star - 1)
      if sceneType == ProtoEnum.SCENE_TYPE.ROGUE then
        ChangeUIController(headFrame, "c3", 1)
        local cardState = FormationWindow.GetBattleState(BATTLE_CAMP_FLAG.LEFT, cardInfo.cardUid)
        if cardState then
          headFrame:GetChild("HpProgressBar").value = 100 * cardState.hp / cardState.maxHp
        else
          headFrame:GetChild("HpProgressBar").value = 100
        end
      else
        ChangeUIController(headFrame, "c3", 0)
      end
      if sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
        local isSelected = FormationWindow.IsCardSelect(cardInfo)
        if isSelected then
          ChangeUIController(hand, "GuildBoss", 0)
          ChangeUIController(headFrame, "c2", 1)
          ChangeUIController(headFrame:GetChild("State"), "c1", 0)
          FormationWindow.SetSwipeGestureEnable(headFrame, false)
        else
          local playerInfo = GuildWarData.GetGuildPlayerInfo()
          local usedSelfCardIds = playerInfo.usedSelfCardIds
          local usedAssistCardIds = playerInfo.usedAssistCardIds
          local alreadyUse = false
          local embattleSame = false
          if cardInfo.uin == ActorData.GetUin() then
            if table.contain(usedSelfCardIds, cardInfo.cardId) then
              alreadyUse = true
            elseif FormationWindow.EmbattleSameCard(cardInfo.cardId) then
              embattleSame = true
            end
          elseif table.contain(usedAssistCardIds, cardInfo.cardId) then
            alreadyUse = true
          elseif FormationWindow.EmbattleSameCard(cardInfo.cardId) then
            embattleSame = true
          end
          if false == alreadyUse and false == embattleSame then
            ChangeUIController(hand, "GuildBoss", 0)
            ChangeUIController(headFrame, "c2", 0)
            FormationWindow.InitSwipeGesture(headFrame, cardInfo)
          else
            ChangeUIController(hand, "GuildBoss", 1)
            ChangeUIController(headFrame, "c2", 3)
            if alreadyUse then
              hand:GetChild("GuildBossCardSign"):GetChild("WordTxt").text = T(11705)
            elseif embattleSame then
              hand:GetChild("GuildBossCardSign"):GetChild("WordTxt").text = T(11706)
            end
            FormationWindow.SetSwipeGestureEnable(headFrame, false)
          end
        end
      else
        ChangeUIController(headFrame, "c4", 0)
        if curSelectLabelType == LABEL_TYPE_ENUM.FORBIDDEN then
          ChangeUIController(headFrame, "c2", 3)
          FormationWindow.SetSwipeGestureEnable(headFrame, false)
        elseif curSelectLabelType == LABEL_TYPE_ENUM.ROGUE_DEAD then
          ChangeUIController(headFrame, "c2", 2)
          ChangeUIController(headFrame:GetChild("State"), "c1", 1)
          FormationWindow.SetSwipeGestureEnable(headFrame, false)
        elseif curSelectLabelType == LABEL_TYPE_ENUM.UNAVAILABLE_USED then
          ChangeUIController(headFrame, "c2", 3)
          FormationWindow.SetSwipeGestureEnable(headFrame, false)
        elseif curSelectLabelType == LABEL_TYPE_ENUM.ROGUE_DEAD then
          ChangeUIController(headFrame, "c2", 3)
          FormationWindow.SetSwipeGestureEnable(headFrame, false)
        else
          local isSelected, pos, teamIndex = FormationWindow.IsCardSelect(cardInfo)
          if isSelected then
            ChangeUIController(headFrame, "c2", 1)
            ChangeUIController(headFrame:GetChild("State"), "c1", 0)
            FormationWindow.SetSwipeGestureEnable(headFrame, false)
            if sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
              ChangeUIController(headFrame, "c4", 1)
              headFrame:GetChild("Wave"):GetChild("WaveTxt").text = T(10868, teamIndex)
            end
          else
            ChangeUIController(headFrame, "c2", 0)
            FormationWindow.InitSwipeGesture(headFrame, cardInfo)
          end
        end
      end
      hand.onClick:Add(FormationWindow.TouchItem)
      hand.soundFmod = SOUND_EVENT_ENUM.CARD_SELECT
      local gesture = LongPressGesture.GetLongPressGesture(hand)
      gesture.once = true
      gesture.holdRangeRadius = 1
      gesture.trigger = 1
      gesture.onAction:Set(function()
        hand:FireClick(false, true)
      end)
      local occupation = headFrame:GetChild("Occupation")
      ChangeUIController(occupation, "c1", cardConfig.type - 1)
      ChangeUIController(occupation, "c2", 1)
      local elementList = headFrame:GetChild("ElementList")
      UIUtil.ShowElementList(elementList, cardConfig)
      local breach = headFrame:GetChild("CardBreach")
      ChangeUIController(breach, "c1", cardInfo.quality)
      local starList = headFrame:GetChild("StarList")
      UIUtil.ShowStarList(starList, cardInfo, cardConfig)
      if curShowTipsCardId == cardInfo.cardId then
        hand.onClick:Call()
      end
    end
  end
end

function FormationWindow.EmbattleSameCard(cardId)
  for cardUid, pos in pairs(curCard2Pos) do
    local card = FormationData.GetCardDataByUid(cardUid, sceneType)
    if card.cardId == cardId then
      return true
    end
  end
  return false
end

function FormationWindow.TouchItem(eventContext)
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.FORMATION_TIPS, false) == false then
    return
  end
  local list = uis.Main.Choice.CardList
  local item = eventContext.sender
  local childIndex = list:GetChildIndex(item)
  local itemIndex = list:ChildIndexToItemIndex(childIndex)
  if curSelectLabelType == LABEL_TYPE_ENUM.BUILDING then
    local buildingInfo = listData[itemIndex + 1]
    InfoTipsUtil.ShowBuildingTipsWindow(buildingInfo.id, function()
      list.selectedIndex = -1
    end, {
      arenaDefense = formationParam.arenaDefense,
      sceneType = sceneType
    })
    if RedDotArena.ArenaOneBuildingNew(nil, buildingInfo) then
      FormationWindow.ClearOneBuildingNew(buildingInfo.id)
    end
  else
    local cardInfo = listData[itemIndex + 1]
    curShowTipsCardId = cardInfo.cardId
    InfoTipsUtil.ShowCardTipsWindow(cardInfo, function()
      curShowTipsCardId = nil
    end, nil, sceneType, formationParam.stageId)
  end
end

function FormationWindow.UpdateListWhenDrag()
  local list = uis.Main.Choice.CardList
  playAnim = false
  updateWhenDrag = true
  list.numItems = #listData
  updateWhenDrag = false
end

function FormationWindow.UpdateCardList(dontPlayAnim)
  if true ~= dontPlayAnim then
    FormationWindow.ClearDragCardRecord()
    FormationWindow.ClearDragBuildingRecord()
    if formationParam.arenaDefense and lastSelectLabelType == LABEL_TYPE_ENUM.BUILDING then
      FormationWindow.ClearBuildingNew()
    end
  end
  FormationWindow.UpdateBurst()
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.FORMATION_TIPS, false) then
    uis.Main.Choice.ScreenBtn.visible = true
  end
  local list = uis.Main.Choice.CardList
  local filterFunc
  if curSelectLabelType == LABEL_TYPE_ENUM.USED_CARD then
    function filterFunc(cardInfo)
      if FormationWindow.GetBattleState(BATTLE_CAMP_FLAG.LEFT, cardInfo.cardUid) == nil then
        return false
      end
      return true
    end
  elseif curSelectLabelType == LABEL_TYPE_ENUM.RECOMMEND_CARD then
    function filterFunc(cardInfo)
      if FormationWindow.IsRecommendCard(cardInfo.cardId) == true then
        return true
      end
      return false
    end
  elseif curSelectLabelType == LABEL_TYPE_ENUM.UNUSED_CARD then
    function filterFunc(cardInfo)
      if FormationWindow.GetBattleState(BATTLE_CAMP_FLAG.LEFT, cardInfo.cardUid) == nil then
        return true
      end
      return false
    end
  elseif curSelectLabelType == LABEL_TYPE_ENUM.CAN_USE then
    function filterFunc(cardInfo)
      if FormationData.IsLimitCardType(cardInfo.cardId, curMapId) == true then
        return true
      end
      return false
    end
  elseif curSelectLabelType == LABEL_TYPE_ENUM.FORBIDDEN then
    function filterFunc(cardInfo)
      if FormationData.IsLimitCardType(cardInfo.cardId, curMapId) == true then
        return false
      end
      return true
    end
  elseif curSelectLabelType == LABEL_TYPE_ENUM.AVAILABLE_UNUSED then
    function filterFunc(cardInfo)
      return not RaidBossMgr.IsCardUsed(cardInfo.cardId)
    end
  elseif curSelectLabelType == LABEL_TYPE_ENUM.UNAVAILABLE_USED then
    function filterFunc(cardInfo)
      return RaidBossMgr.IsCardUsed(cardInfo.cardId)
    end
  elseif curSelectLabelType == LABEL_TYPE_ENUM.ROGUE_LIVING then
    function filterFunc(cardInfo)
      return RogueGameMgr.IsLiving(cardInfo.cardId)
    end
  elseif curSelectLabelType == LABEL_TYPE_ENUM.ROGUE_DEAD then
    function filterFunc(cardInfo)
      local battleCardId = cardInfo.cardId
      
      local rogueCardInfo = RogueGameData.GetCardInfo(battleCardId)
      if rogueCardInfo then
        return not RogueGameMgr.IsLiving(battleCardId)
      else
        return false
      end
    end
  end
  FormationWindow.UpdateTips()
  if curSelectLabelType == LABEL_TYPE_ENUM.BUILDING then
    return
  end
  local cardList
  if curSelectLabelType == LABEL_TYPE_ENUM.GUILD_ASSIST then
    cardList = FormationData.guildWarAssistCardInfos or {}
  end
  listData = FormationData.GetQualifiedCard(curSelectTeamInfo, selectCardTypeMap, selectElementTypeMap, selectCdTypeMap, filterFunc, sceneType, cardList)
  if sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
    listData = FormationWindow.SortCardListForGuildWar(listData)
  end
  playAnim = true ~= dontPlayAnim
  list.numItems = #listData
  if playAnim then
    LeanTween.delayedCall(0, function()
      local childCount = list.numChildren
      for i = 0, childCount - 1 do
        local child = list:GetChildAt(i)
        if child then
          child.alpha = 0
          PlayUITrans(child, "up", nil, Const.gridSpeed * i)
        end
      end
    end)
  end
  playAnim = false
  FormationWindow.UpdateTips()
  FormationWindow.UpdateCardQuickOperation()
  if nil == curSelectTeamInfo and 0 == table.getLen(selectCardTypeMap) and 0 == table.getLen(selectElementTypeMap) and 0 == table.getLen(selectCdTypeMap) then
    uis.Main.Choice.ScreenBtn:GetChild("WordTxt").text = ""
  else
    uis.Main.Choice.ScreenBtn:GetChild("WordTxt").text = T(10871)
  end
end

function FormationWindow.SortCardListForGuildWar(filterList)
  local playerInfo = GuildWarData.GetGuildPlayerInfo()
  local usedSelfCardIds = playerInfo.usedSelfCardIds
  local usedAssistCardIds = playerInfo.usedAssistCardIds
  table.sort(filterList, function(a, b)
    local isSelected_a = FormationWindow.IsCardSelect(a)
    local isSelected_b = FormationWindow.IsCardSelect(b)
    local cannotUse_a = 0
    local cannotUse_b = 0
    if curSelectLabelType == LABEL_TYPE_ENUM.GUILD_ASSIST then
      if false == isSelected_a and (table.contain(usedAssistCardIds, a.cardId) or FormationWindow.EmbattleSameCard(a.cardId)) then
        cannotUse_a = 1
      end
      if false == isSelected_b and (table.contain(usedAssistCardIds, b.cardId) or FormationWindow.EmbattleSameCard(b.cardId)) then
        cannotUse_b = 1
      end
    else
      if false == isSelected_a and (table.contain(usedSelfCardIds, a.cardId) or FormationWindow.EmbattleSameCard(a.cardId)) then
        cannotUse_a = 1
      end
      if false == isSelected_b and (table.contain(usedSelfCardIds, b.cardId) or FormationWindow.EmbattleSameCard(b.cardId)) then
        cannotUse_b = 1
      end
    end
    if cannotUse_a == cannotUse_b then
      return CardData.DefaultSort(a, b)
    else
      return cannotUse_a < cannotUse_b
    end
  end)
  return filterList
end

function FormationWindow.UpdateBuildingList(dontPlayAnim)
  FormationWindow.UpdateTips()
  FormationWindow.UpdateCardQuickOperation()
  if curSelectLabelType ~= LABEL_TYPE_ENUM.BUILDING then
    return
  end
  if true ~= dontPlayAnim then
    FormationWindow.ClearDragCardRecord()
    FormationWindow.ClearDragBuildingRecord()
  end
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.FORMATION_TIPS, false) then
    uis.Main.Choice.ScreenBtn.visible = false
  end
  needClearBuilding = true
  local list = uis.Main.Choice.CardList
  listData = FormationData.GetOwnBuilding()
  table.sort(listData, function(a, b)
    local uidA = a.uid
    local uidB = b.uid
    local unlockStateA = a.isUnlock and 1 or 0
    local unlockStateB = b.isUnlock and 1 or 0
    local selectStateA = FormationWindow.IsBuildingSelect(uidA)
    local selectStateB = FormationWindow.IsBuildingSelect(uidB)
    if selectStateA == selectStateB then
      if unlockStateA ~= unlockStateB then
        return unlockStateA > unlockStateB
      elseif 1 == unlockStateA then
        return a.id < b.id
      else
        return a.unlockRank > b.unlockRank
      end
    elseif true == selectStateA then
      return true
    elseif true == selectStateB then
      return false
    end
  end)
  playAnim = true ~= dontPlayAnim
  list.numItems = #listData
  if playAnim then
    LeanTween.delayedCall(0, function()
      local childCount = list.numChildren
      for i = 0, childCount - 1 do
        local child = list:GetChildAt(i)
        if child then
          child.alpha = 0
          PlayUITrans(child, "up", nil, Const.gridSpeed * i)
        end
      end
    end)
  end
  playAnim = false
end

function FormationWindow.ClearOneMapNew(mapId)
  local oprType = PLAYER_OPERATION_ENUM.ARENA_MAP_NEW
  local mapIdList = {mapId}
  local cachedList = OprRecordUtil.GetRecord(oprType)
  for _, id in ipairs(cachedList) do
    table.insert(mapIdList, id)
  end
  OprRecordUtil.SaveRecord(oprType, mapIdList)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ARENA_DEFENSE_MAP_NEW)
end

function FormationWindow.ClearMapNew()
  local mapIdList = {}
  local oprType = PLAYER_OPERATION_ENUM.ARENA_MAP_NEW
  local mapList = FormationData.GetArenaMap()
  for i, mapConfig in ipairs(mapList) do
    if RedDotArena.ArenaOneMapNew(nil, mapConfig) then
      table.insert(mapIdList, mapConfig.id)
    end
  end
  if #mapIdList > 0 then
    local cachedList = OprRecordUtil.GetRecord(oprType)
    for _, id in ipairs(cachedList) do
      table.insert(mapIdList, id)
    end
    OprRecordUtil.SaveRecord(oprType, mapIdList)
    RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ARENA_DEFENSE_MAP_NEW)
  end
  needClearMap = nil
end

function FormationWindow.ClearOneBuildingNew(buildId)
  local buildIdList = {buildId}
  local oprType = PLAYER_OPERATION_ENUM.ARENA_BUILDING_NEW
  local cachedList = OprRecordUtil.GetRecord(oprType)
  for _, id in ipairs(cachedList) do
    table.insert(buildIdList, id)
  end
  OprRecordUtil.SaveRecord(oprType, buildIdList)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ARENA_DEFENSE_BUILDING_NEW)
end

function FormationWindow.ClearBuildingNew()
  local buildIdList = {}
  local oprType = PLAYER_OPERATION_ENUM.ARENA_BUILDING_NEW
  for i, v in ipairs(listData) do
    if v.isUnlock and OprRecordUtil.IsAlreadyRecord(oprType, v.id) == false then
      table.insert(buildIdList, v.id)
    end
  end
  if #buildIdList > 0 then
    local cachedList = OprRecordUtil.GetRecord(oprType)
    for _, id in ipairs(cachedList) do
      table.insert(buildIdList, id)
    end
    OprRecordUtil.SaveRecord(oprType, buildIdList)
    RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ARENA_DEFENSE_BUILDING_NEW)
  end
  needClearBuilding = nil
end

function FormationWindow.IsRecommendCard(cardId)
  if stageConfig and stageConfig.recommend_card then
    return table.contain(stageConfig.recommend_card, cardId)
  end
  return false
end

function FormationWindow.GetBattleState(camp, uid, id, position)
  if camp == BATTLE_CAMP_FLAG.LEFT then
    if FormationData.cachedTeamStateLeft == nil then
      return
    end
    local cardStates = FormationData.cachedTeamStateLeft.cardStates
    for _, v in ipairs(cardStates) do
      if v.uid == uid then
        return v
      end
    end
  end
  if camp == BATTLE_CAMP_FLAG.RIGHT then
    if nil == FormationData.cachedTeamStateRight then
      return
    end
    local cardStates = FormationData.cachedTeamStateRight.cardStates
    for _, v in ipairs(cardStates) do
      if v.id == id and position == v.position then
        return v
      end
    end
  end
end

function FormationWindow.UpdateLabel(refresh)
  local labelInfoTable
  if FormationWindow.BuildingTabVisible() then
    labelInfoTable = {
      {
        btn = uis.Main.Choice.LabeRegion.LabelTopBtn,
        text = T(10840),
        subText = T(10841),
        type = LABEL_TYPE_ENUM.CARD,
        func = FormationWindow.UpdateCardList,
        choiceC1 = 0
      },
      {
        btn = uis.Main.Choice.LabeRegion.LabelDownBtn,
        text = T(10842),
        subText = T(10843),
        type = LABEL_TYPE_ENUM.BUILDING,
        func = FormationWindow.UpdateBuildingList,
        choiceC1 = 1
      }
    }
    uis.Main.Choice.c1Ctr.selectedIndex = 1
  elseif FormationWindow.LimitCardType() then
    labelInfoTable = {
      {
        btn = uis.Main.Choice.LabeRegion.LabelTopBtn,
        text = T(10855),
        subText = T(10856),
        type = LABEL_TYPE_ENUM.CAN_USE,
        func = FormationWindow.UpdateCardList,
        choiceC1 = 0
      },
      {
        btn = uis.Main.Choice.LabeRegion.LabelDownBtn,
        text = T(10857),
        subText = T(10858),
        type = LABEL_TYPE_ENUM.FORBIDDEN,
        func = FormationWindow.UpdateCardList,
        choiceC1 = 1
      }
    }
    uis.Main.Choice.c1Ctr.selectedIndex = 1
  elseif FormationWindow.LimitUsedCard() then
    labelInfoTable = {
      {
        btn = uis.Main.Choice.LabeRegion.LabelTopBtn,
        text = T(10838),
        subText = T(10839),
        type = LABEL_TYPE_ENUM.AVAILABLE_UNUSED,
        func = FormationWindow.UpdateCardList,
        choiceC1 = 0
      },
      {
        btn = uis.Main.Choice.LabeRegion.LabelDownBtn,
        text = T(10836),
        subText = T(10837),
        type = LABEL_TYPE_ENUM.UNAVAILABLE_USED,
        func = FormationWindow.UpdateCardList,
        choiceC1 = 1
      }
    }
    uis.Main.Choice.c1Ctr.selectedIndex = 1
  elseif FormationWindow.IsRogueGame() then
    labelInfoTable = {
      {
        btn = uis.Main.Choice.LabeRegion.LabelTopBtn,
        text = T(20417),
        subText = T(20418),
        type = LABEL_TYPE_ENUM.ROGUE_LIVING,
        func = FormationWindow.UpdateCardList,
        choiceC1 = 0
      },
      {
        btn = uis.Main.Choice.LabeRegion.LabelDownBtn,
        text = T(20419),
        subText = T(20420),
        type = LABEL_TYPE_ENUM.ROGUE_DEAD,
        func = FormationWindow.UpdateCardList,
        choiceC1 = 1
      }
    }
    uis.Main.Choice.c1Ctr.selectedIndex = 1
  elseif FormationWindow.HaveRecommendCard() then
    labelInfoTable = {
      {
        btn = uis.Main.Choice.LabeRegion.LabelTopBtn,
        text = T(10876),
        type = LABEL_TYPE_ENUM.CARD,
        func = FormationWindow.UpdateCardList,
        choiceC1 = 0
      },
      {
        btn = uis.Main.Choice.LabeRegion.LabelDownBtn,
        text = T(10877),
        type = LABEL_TYPE_ENUM.RECOMMEND_CARD,
        func = FormationWindow.UpdateCardList,
        choiceC1 = 1
      }
    }
    uis.Main.Choice.c1Ctr.selectedIndex = 1
  elseif FormationWindow.HaveGuildAssist() then
    labelInfoTable = {
      {
        btn = uis.Main.Choice.LabeRegion.LabelTopBtn,
        text = T(10840),
        type = LABEL_TYPE_ENUM.CARD,
        func = FormationWindow.UpdateCardList,
        choiceC1 = 0
      },
      {
        btn = uis.Main.Choice.LabeRegion.LabelDownBtn,
        text = T(10878),
        type = LABEL_TYPE_ENUM.GUILD_ASSIST,
        func = FormationWindow.UpdateCardList,
        choiceC1 = 1
      }
    }
    uis.Main.Choice.c1Ctr.selectedIndex = 1
  else
    uis.Main.Choice.c1Ctr.selectedIndex = 0
    curSelectLabelType = LABEL_TYPE_ENUM.CARD
    FormationWindow.UpdateCardList()
    return
  end
  if refresh then
    for i, v in ipairs(labelInfoTable) do
      if v.type == curSelectLabelType then
        v.func()
      end
    end
    return
  end
  curSelectLabelType = curSelectLabelType or labelInfoTable[1].type
  for i, v in ipairs(labelInfoTable) do
    FormationWindow.CreateOneLabel(v)
  end
  if formationParam.arenaDefense then
    RedDotMgr.AddNode({
      windowName = WinResConfig.FormationWindow.name,
      com = uis.Main.Choice.LabeRegion.root,
      newFlagName = "new",
      newFlagVisibleFunc = function()
        return RedDotArena.ArenaDefenseBuildingNew()
      end,
      onlyNew = true,
      dataType = RED_DOT_DATA_TYPE.ARENA_DEFENSE_BUILDING_NEW
    })
  end
end

function FormationWindow.CreateOneLabel(labelInfo)
  local btn = labelInfo.btn
  UIUtil.SetBtnText(btn, labelInfo.text, labelInfo.subText)
  btn.onClick:Set(function()
    lastSelectLabelType = curSelectLabelType
    curSelectLabelType = labelInfo.type
    if curSelectLabelType ~= LABEL_TYPE_ENUM.CARD and curSelectLabelType ~= LABEL_TYPE_ENUM.USED_CARD and curSelectLabelType ~= LABEL_TYPE_ENUM.UNUSED_CARD and curSelectLabelType ~= LABEL_TYPE_ENUM.CAN_USE and curSelectLabelType ~= LABEL_TYPE_ENUM.FORBIDDEN and curSelectLabelType ~= LABEL_TYPE_ENUM.AVAILABLE_UNUSED and curSelectLabelType ~= LABEL_TYPE_ENUM.UNAVAILABLE_USED then
      curShowTipsCardId = nil
    end
    FormationWindow.UpdateBottomList(labelInfo)
    uis.Main.Choice.CardList:ScrollToView(0)
  end)
  if curSelectLabelType == labelInfo.type then
    btn.onClick:Call()
    uis.Main.Choice.LabeRegion.c1Ctr.selectedIndex = labelInfo.choiceC1
  end
end

function FormationWindow.MapTabVisible()
  return sceneType == ProtoEnum.SCENE_TYPE.ARENA and formationParam.arenaDefense or false
end

function FormationWindow.BuildingTabVisible()
  return sceneType == ProtoEnum.SCENE_TYPE.ARENA and formationParam.arenaDefense or false
end

function FormationWindow.LimitCardType()
  local mapConfig = TableData.GetConfig(curMapId, "BaseMap")
  local limit = mapConfig.limit_card_type
  return nil ~= limit and #limit > 0, limit
end

function FormationWindow.LimitUsedCard()
  if sceneType == ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE then
    return RaidBossMgr.GetCurLevelRounds() > 1
  end
  return false
end

function FormationWindow.IsRogueGame()
  return sceneType == ProtoEnum.SCENE_TYPE.ROGUE
end

function FormationWindow.HaveRecommendCard()
  if stageConfig then
    return stageConfig.recommend_card ~= nil
  end
  return false
end

function FormationWindow.HaveGuildAssist()
  return sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR
end

function FormationWindow.InitBtn()
  local unlock = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.FORMATION_TIPS, false)
  uis.Main.BattleBtn.onClick:Set(FormationWindow.ClickBattle)
  if false == unlock then
    uis.Main.ConquersBtn.visible = false
    uis.Main.Choice.ScreenBtn.visible = false
    uis.Main.CurrencyReturn.root.visible = false
  else
    if sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
      jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.FormationWindow.name, uis.Main.CurrencyReturn, nil, formationParam.backFunc, nil, nil, false, false)
    else
      local featureId
      if sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
        featureId = FEATURE_ENUM.GUILD_WAR_FORMATION
      end
      jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.FormationWindow.name, uis.Main.CurrencyReturn, featureId, formationParam.backFunc)
    end
    uis.Main.ConquersBtn.onClick:Add(InfoTipsUtil.ShowRestraintTipsWindow)
    uis.Main.Choice.ScreenBtn.onClick:Set(function()
      uis.Main.c3Ctr.selectedIndex = 1
      uis.Main.ScreenChoice.c1Ctr.selectedIndex = 0
      PlayUITrans(uis.Main.ScreenChoice.root, "in", function()
        if uis then
          uis.Main.ScreenChoice.TouchScreenBtn.touchable = true
        end
      end)
    end)
  end
  if sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
    uis.Main.ExpeditionWave.Wave1Btn.touchable = false
    uis.Main.ExpeditionWave.Wave2Btn.touchable = false
    local btn = uis.Main.SwitchBtn
    btn.changeStateOnClick = false
    btn.onClick:Set(function()
      local lastIndex = curTeamIndex
      if curTeamIndex == FORMATION_TEAM_INDEX.ONE then
        local count = FormationWindow.GetEmbattledCardCount()
        if 0 == count then
          FloatTipsUtil.ShowWarnTips(T(10060))
          return
        end
        if count < cardUsedLimit then
          MessageBox.Show(T(10061), {
            touchCallback = function()
              FormationWindow.ChangeTeamIndex(FORMATION_TEAM_INDEX.TWO)
            end
          }, {})
        else
          FormationWindow.ChangeTeamIndex(FORMATION_TEAM_INDEX.TWO)
        end
      else
        FormationWindow.ChangeTeamIndex(FORMATION_TEAM_INDEX.ONE)
      end
      FormationWindow.ClearDragCardRecord()
      FormationWindow.UpdateCardList(true)
    end)
    uis.Main.c4Ctr.selectedIndex = 1
    uis.Main.BuffTipsMainBtn.onClick:Set(function()
      InfoTipsUtil.ShowExpeditionBuffTipsWindow(formationParam.buffId)
    end)
    uis.Main.StarConditionBtn.onClick:Set(function()
      OpenWindow(WinResConfig.StarConditionTipsWindow.name, nil, formationParam.stageId)
    end)
  end
  uis.Main.ScreenChoice.OprTips.MapBtn.onClick:Add(FormationWindow.ShowMapChoice)
  uis.Main.ScreenChoice.TouchScreenBtn.onClick:Set(function()
    uis.Main.ScreenChoice.TouchScreenBtn.touchable = false
    PlayUITrans(uis.Main.ScreenChoice.root, "out", function()
      uis.Main.c3Ctr.selectedIndex = 0
    end)
    FormationWindow.ClearMapNew()
  end)
  local downBtn = uis.Main.Choice.CardDownBtn
  downBtn.onClick:Set(FormationWindow.TouchCardDown)
  UIUtil.SetBtnText(downBtn, T(10068))
  local upBtn = uis.Main.Choice.CardUpBtn
  upBtn.soundFmod = SOUND_EVENT_ENUM.FORMATION_ALL_UP
  upBtn.onClick:Set(FormationWindow.TouchCardUp)
  UIUtil.SetBtnText(upBtn, T(10069))
end

function FormationWindow.AutoChooseOneCard()
  local countByTypeList = FormationWindow.GetEmbattledCardCountSplitByType()
  local sortList = {
    {
      type = BATTLE_UNIT_TYPE.RANGED_ATTACK
    },
    {
      type = BATTLE_UNIT_TYPE.SUPPORT
    },
    {
      type = BATTLE_UNIT_TYPE.MELEE_ATTACK
    },
    {
      type = BATTLE_UNIT_TYPE.DEFENSE
    }
  }
  for _, v in ipairs(sortList) do
    v.count = countByTypeList[v.type] or 0
  end
  table.sort(sortList, function(a, b)
    if a.count == b.count then
      return a.type > b.type
    else
      return a.count < b.count
    end
  end)
  local enableList = FormationWindow.GetCardEnableList()
  for _, v in ipairs(sortList) do
    local list = FormationWindow.GetCardListByType(enableList, v.type)
    if #list > 0 then
      if #list > 1 then
        table.sort(list, CardData.DefaultSort)
      end
      local gridList = gridPosListByType[v.type]
      local randomList = table.randomSort(SimpleCopy(gridList))
      for _, gridIndex in ipairs(randomList) do
        if nil == tempGridCoverInfo[gridIndex] then
          local state = FormationWindow.GetPlaceGridState(gridIndex, list[1])
          if state == GRID_STATE.ENABLE then
            local uid = list[1].cardUid
            curCard2Pos[uid] = gridIndex
            if curTeamIndex then
              curCard2PosList[curTeamIndex][uid] = gridIndex
            end
            FormationWindow.UpdateDefenseFormationCard(uid, gridIndex, true)
            FormationWindow.UpdateCardList(true)
            FormationWindow.ShowCardOrBuildingInMap(bottomGridMap[gridIndex], list[1], nil, nil, true)
            return
          end
        end
      end
    end
  end
end

function FormationWindow.TouchCardUp()
  local max = FormationWindow.GetEmbattledCardMaxCount()
  local enableList = FormationWindow.GetCardEnableList()
  local needChooseCardCount = math.min(max - FormationWindow.GetEmbattledCardCount(), #enableList)
  for i = 1, needChooseCardCount do
    FormationWindow.AutoChooseOneCard()
  end
  FormationWindow.UpdateSort()
end

function FormationWindow.TouchCardDown()
  if GuideMgr.guideBol == true then
    local stepData = GuideMgr.GetStepData()
    if stepData and stepData.window_name == WinResConfig.FormationWindow.name then
      return
    end
  end
  for uid, index in pairs(curCard2Pos) do
    if formationParam.arenaDefense and 1 == table.getLen(curCard2Pos) then
      FloatTipsUtil.ShowWarnTips(T(10334))
      break
    end
    if cardOrBuildingInfo[uid] then
      FormationWindow.ClearByUid(uid)
      curCard2Pos[uid] = nil
      if curTeamIndex then
        curCard2PosList[curTeamIndex][uid] = nil
      end
      FormationWindow.UpdateDefenseFormationCard(uid, nil)
    end
  end
  FormationWindow.ClearDragCardRecord()
  FormationWindow.UpdateCardList(true)
  if formationParam.arenaDefense then
    ArenaService.ArenaSetDefenseReq(tempArenaDefenseFormation)
  end
end

function FormationWindow.ChangeTeamIndex(targetIndex)
  curTeamIndex = targetIndex
  if nil == dragGridMapList[curTeamIndex] then
    dragGridMapList[curTeamIndex] = {}
  end
  dragGridMap = dragGridMapList[curTeamIndex]
  if nil == coverObject2IndexList[curTeamIndex] then
    coverObject2IndexList[curTeamIndex] = {}
  end
  coverObject2Index = coverObject2IndexList[curTeamIndex]
  curCaptainCardId = curCaptainCardIdList[curTeamIndex]
  local interval = 0.3
  uis.Main.SwitchBtn.touchable = false
  if curTeamIndex == FORMATION_TEAM_INDEX.TWO then
    uis.Main.BackGround.root:TweenMoveX(uis.Main.BackGround.root.x - team2MapOffX, interval)
    uis.Main.BackGround2.root:TweenMoveX(uis.Main.BackGround2.root.x - team2MapOffX, interval)
    uis.Main.FormationGrid.root:TweenMoveX(uis.Main.FormationGrid.root.x - team2MapOffX, interval)
    uis.Main.FormationGrid2.root:TweenMoveX(uis.Main.FormationGrid2.root.x - team2MapOffX, interval)
    uis.Main.WaveTransitionHolder:TweenMoveX(uis.Main.WaveTransitionHolder.x - team2MapOffX, interval):OnComplete(function()
      uis.Main.SwitchBtn.touchable = true
    end)
  elseif curTeamIndex == FORMATION_TEAM_INDEX.ONE then
    uis.Main.BackGround.root:TweenMoveX(uis.Main.BackGround.root.x + team2MapOffX, interval)
    uis.Main.BackGround2.root:TweenMoveX(uis.Main.BackGround2.root.x + team2MapOffX, interval)
    uis.Main.FormationGrid.root:TweenMoveX(uis.Main.FormationGrid.root.x + team2MapOffX, interval)
    uis.Main.FormationGrid2.root:TweenMoveX(uis.Main.FormationGrid2.root.x + team2MapOffX, interval)
    uis.Main.WaveTransitionHolder:TweenMoveX(uis.Main.WaveTransitionHolder.x + team2MapOffX, interval):OnComplete(function()
      uis.Main.SwitchBtn.touchable = true
    end)
  end
  FormationWindow.UpdateExpeditionInfo()
  FormationWindow.UpdateMap()
  FormationWindow.UpdateBurst()
  FormationWindow.UpdateCardQuickOperation()
end

function FormationWindow.OnShowAnimationEnd()
  LightManager:SetCameraBloom(UICamera, true, 1, 255, 255, 255, 1.1, 0, "UI")
end

function FormationWindow.OnPreClose()
  LightManager:SetCameraBloom(UICamera, false)
end

function FormationWindow.ClickBattle()
  local count = FormationWindow.GetEmbattledCardCount()
  if 0 == count then
    FloatTipsUtil.ShowWarnTips(T(10060))
    return
  end
  local max = FormationWindow.GetEmbattledCardMaxCount()
  local specialArray = {}
  for i, v in pairs(curCard2PosList) do
    table.insert(specialArray, {
      index = i,
      cardUid2Pos = v,
      leaderCardId = curCaptainCardIdList[i]
    })
  end
  local callback = function()
    local params = {}
    if sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
      params.sceneType = sceneType
      params.stageId = stageConfig.id
      params.extData = formationParam.extData
      params.specialArray = specialArray
    else
      params.sceneType = sceneType
      params.stageId = stageConfig and stageConfig.id or formationParam.arenaRankId
      params.cardUid2Pos = curCard2Pos
      params.buildUid2Pos = curBuild2Pos
      params.extData = formationParam.extData
      params.leaderCardId = curCaptainCardId
      if sceneType == ProtoEnum.SCENE_TYPE.ARENA then
        params.arenaOpponentUin = formationParam.opponentUin
        params.arenaForceRank = false
      end
      if curBurstOrderSetting then
        for _, v in ipairs(curBurstOrderSetting) do
          local cardList = v.cardList
          if cardList and #cardList > 0 then
            for index = #cardList, 1, -1 do
              if nil == curCard2Pos[cardList[index]] then
                table.remove(v.cardList, index)
              end
            end
          end
        end
        table.sort(curBurstOrderSetting, function(a, b)
          return a.job < b.job
        end)
      end
      params.burstOrderSetting = curBurstOrderSetting
    end
    if sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
      local uid = FormationData.guildWarCompensateUid
      if 0 ~= uid then
        params.guildWarData = {
          guildWarSkills = curGuildWarSkills,
          compensateUid = FormationData.guildWarCompensateUid
        }
      else
        local assistCardInfos = {}
        local card
        local selfUin = ActorData.GetUin()
        for cardUid, pos in pairs(curCard2Pos) do
          card = FormationData.GetCardDataByUid(cardUid, sceneType)
          if card.uin ~= selfUin then
            table.insert(assistCardInfos, {
              cardUid = cardUid,
              uin = card.uin,
              cardId = card.cardId
            })
          end
        end
        params.guildWarData = {
          guildWarSkills = curGuildWarSkills,
          compensateUid = FormationData.guildWarCompensateUid,
          assistCardInfos = assistCardInfos
        }
      end
    end
    if formationParam.simulate then
      params.simulate = true
    end
    BattleService.PrepareBattleReq(params)
  end
  local ownedCardCnt = #ActorData.GetCardList()
  if sceneType == ProtoEnum.SCENE_TYPE.ROGUE then
    ownedCardCnt = #RogueGameData.GetBattleCardInfoList()
  end
  local cardCountTips = true
  if sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR and 0 ~= FormationData.guildWarCompensateUid then
    cardCountTips = false
  end
  if cardCountTips and count < max and count < ownedCardCnt then
    MessageBox.Show(T(10061), {touchCallback = callback}, {})
  else
    callback()
  end
end

function FormationWindow.OnShown()
  if curSelectLabelType then
    if curSelectLabelType ~= LABEL_TYPE_ENUM.BUILDING then
      LightManager:SetCameraBloom(UICamera, true, 1, 255, 255, 255, 1.1, 0, "UI")
      FormationWindow.ShowLeft(true)
      FormationWindow.UpdateSort()
      FormationWindow.UpdateCardList(true)
    else
      FormationWindow.UpdateBurst()
    end
  end
  if UIMgr:IsShowFromHide(WinResConfig.FormationWindow.name) == true and 1 == uis.Main.c3Ctr.selectedIndex then
    local screenChoice = uis.Main.ScreenChoice
    if 0 == screenChoice.c1Ctr.selectedIndex then
    elseif 1 == screenChoice.c1Ctr.selectedIndex then
      FormationWindow.ShowMapChoice()
    end
  end
end

function FormationWindow.OnHide()
  LightManager:SetCameraBloom(UICamera, false)
end

function FormationWindow.StopTalk()
  if curTypingEffect then
    curTypingEffect:Cancel()
    curTypingEffect = nil
  end
  if curSoundEventIns then
    SoundUtil.StopSoundEvent(curSoundEventIns)
    curSoundEventIns = nil
  end
end

function FormationWindow.OnClose()
  if needClearMap then
    FormationWindow.ClearMapNew()
  end
  if needClearBuilding then
    FormationWindow.ClearBuildingNew()
  end
  RedDotMgr.RemoveNode(WinResConfig.FormationWindow.name)
  scaleV2 = nil
  FormationWindow.StopTalk()
  FormationData.ClearCacheData()
  DragDropManager.inst.dragAgent.onDragEnd:Remove(FormationWindow.OnDragEnd)
  DragDropManager.inst.dragAgent.onDragMove:Remove(FormationWindow.OnDragMove)
  FormationWindow.Destroy()
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  GuideMgr.SaveStageID(nil)
end

function FormationWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_REFRESH_GUIDE then
    FormationWindow.RefreshGuide()
  elseif msgId == WindowMsgEnum.FormationWindow.CHANGE_MAP then
    local change = FormationWindow.UpdateDefenseFormationMap(para)
    if change then
      FormationWindow.UpdateMap(true)
      FormationWindow.UpdateMapBuffList()
    end
  elseif msgId == WindowMsgEnum.FormationWindow.CHANGE_CAPTAIN_CARD then
    if curTeamIndex then
      curCaptainCardIdList[curTeamIndex] = para
      curCaptainCardId = para
    else
      curCaptainCardId = para
      FormationWindow.UpdateDefenseFormationLeaderCard(curCaptainCardId)
    end
  elseif msgId == WindowMsgEnum.FormationWindow.CHANGE_BURST_ORDER_SETTING then
    if curTeamIndex then
      curBurstOrderSettingList[curTeamIndex] = para
      curBurstOrderSetting = para
    else
      curBurstOrderSetting = para
      FormationWindow.UpdateDefenseFormationBurstOrderSetting(curBurstOrderSetting)
    end
  end
end

function FormationWindow.InitSwipeGesture(headFrame, cardInfo, buildingInfo)
  local swipeGes = FormationWindow.GetSwipeGesture(headFrame)
  swipeGes.actionDistance = 100
  local isSwipe = true
  local isCreate = false
  swipeGes.onBegin:Set(function()
    isSwipe = true
    isCreate = false
    if swipeGes.position.y > 0 or math.abs(swipeGes.position.y) * 3 < math.abs(swipeGes.position.x) then
      isSwipe = false
    end
    if isSwipe and buildingInfo and FormationWindow.IsBuildingBeyondCost(buildingInfo.uid) then
      isSwipe = false
      FloatTipsUtil.ShowWarnTips(T(10258))
    end
    if buildingInfo and RedDotArena.ArenaOneBuildingNew(nil, buildingInfo) then
      FormationWindow.ClearOneBuildingNew(buildingInfo.id)
    end
  end)
  swipeGes.onMove:Set(function(context)
    if not isSwipe or isCreate then
      return
    end
    isCreate = true
    headFrame.draggable = true
    FormationWindow.OnDragStart(context, cardInfo, buildingInfo, context.data.touchId)
  end)
  swipeGes.onEnd:Set(function()
    headFrame.draggable = false
  end)
end

function FormationWindow.UpdateTargetHolderVisible(uid, showGreen, showWhite)
  if uid then
    local info = cardOrBuildingInfo[uid]
    if info then
      if info.holderGreen then
        info.holderGreen.visible = showGreen
      end
      if info.holderWhite then
        info.holderWhite.visible = showWhite
      end
    end
  end
end

function FormationWindow.ShowDragCardRecord(uid)
  if curOrLastDragCardUid then
    FormationWindow.UpdateTargetHolderVisible(curOrLastDragCardUid, true, false)
  end
  curOrLastDragCardUid = uid
  FormationWindow.UpdateListWhenDrag()
end

function FormationWindow.ClearDragCardRecord()
  FormationWindow.UpdateTargetHolderVisible(curOrLastDragCardUid, true, false)
  curOrLastDragCardUid = nil
end

function FormationWindow.ShowDragBuildingRecord(uid)
  if curOrLastDragBuildingUid then
    FormationWindow.UpdateTargetHolderVisible(curOrLastDragBuildingUid, true, false)
  end
  curOrLastDragBuildingUid = uid
  FormationWindow.UpdateListWhenDrag()
end

function FormationWindow.ClearDragBuildingRecord()
  FormationWindow.UpdateTargetHolderVisible(curOrLastDragBuildingUid, true, false)
  curOrLastDragBuildingUid = nil
end

function FormationWindow.OnDragStart(context, cardInfo, buildingInfo, touchId)
  FormationWindow.ClearDrag()
  context:PreventDefault()
  DragDropManager.inst:StartDrag(nil, nil, 1, Vector2.zero, touchId)
  curDrag = UIMgr:CreateObject("Formation", "DragInfo")
  curDrag.touchable = false
  curDrag:SetScale(curMapGridScale, curMapGridScale)
  dragIcon = DragDropManager.inst.dragAgent.displayObject
  if cardInfo then
    FormationWindow.ShowDragCardRecord(cardInfo.cardUid)
    local fashionConfig = TableData.GetConfig(cardInfo.fashionId, "BaseFashion")
    needGridX = math.ceil(fashionConfig.range / FormationData.bottomGridUIWidth)
    needGridY = needGridX
    UIUtil.SetCardBattleSpine(ModelUtil.GetFullPath(fashionConfig.spd), curDrag:GetChild("DragHolder"), SPINE_STATE_ENUM.CATCH, true, Const.cardScale * fashionConfig.spd_scale / 10000, false, function(spineModel)
      SkeletonAnimationUtil.SetFlip(spineModel, false, false)
      SkeletonAnimationUtil.SetShaderEffectEnable(spineModel, false, false)
    end)
    local root = uis.Main.root.parent
    root:AddChild(curDrag)
    curDragCardInfo = cardInfo
    local gridRealWidth = FormationData.bottomGridWidth
    if 0 == needGridX % 2 then
      dragOffX = gridRealWidth / 2
    else
      dragOffX = 0
    end
    if 0 == needGridY % 2 then
      dragOffY = -gridRealWidth / 2
    else
      dragOffY = 0
    end
    if formationParam.arenaDefense ~= true then
      curTargetLine = UIMgr:CreateObject("Formation", "TargetLineInfo")
      curLineEffect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Embattle/FX_ui_embattle_line.prefab", curTargetLine:GetChild("TargetLineHolder"))
      LineRendererHelper.SetLineColor(curLineEffect, 0.7490196078431373, 0.7490196078431373, 0.7490196078431373, 1, 0.6169246)
      objectContainer:AddChild(curTargetLine)
      curTargetLine.visible = false
    end
  elseif buildingInfo then
    FormationWindow.ShowDragBuildingRecord(buildingInfo.uid)
    local config = TableData.GetConfig(buildingInfo.id, "BaseBuilding")
    needGridX = math.ceil(config.range[1] / FormationData.bottomGridUIWidth)
    needGridY = math.ceil(config.range[2] / FormationData.bottomGridUIWidth)
    curDragBuildingInfo = buildingInfo
  end
  FormationWindow.SetRangeRectVisible(true)
  FormationWindow.SetTouchableWhenDrag(false)
end

function FormationWindow.OnDragMove(context)
  FormationWindow.HideDragGuide()
  local obj = GRoot.inst.touchTarget
  if nil == obj then
    FormationWindow.ClearDrag()
    context:PreventDefault()
    DragDropManager.inst:Cancel()
    return
  end
  local touchGridIndex, savedGridInfo = FormationWindow.GetGridInfo(obj)
  if touchGridIndex and savedGridInfo then
    FormationWindow.ShowTouchState(savedGridInfo)
  else
    if curTargetLine and curTargetLine.visible == true then
      curTargetLine.visible = false
    end
    FormationWindow.ShowTouchState()
  end
  if curDrag then
    curDrag:SetXY(dragIcon.x + dragOffX, dragIcon.y + dragOffY)
  end
end

function FormationWindow.GetGridInfo(touchObj)
  if touchObj then
    local name = touchObj.name
    if "grid_" == name then
      local touchGridIndex = tonumber(touchObj.gameObjectName)
      local savedGridInfo = bottomGridMap[touchGridIndex]
      return touchGridIndex, savedGridInfo
    end
  end
end

function FormationWindow.ShowTouchState(gridInfo)
  local needGrid = needGridX * needGridY
  if needGrid > #dragGridMap then
    for i = #dragGridMap, needGrid do
      local placeGrid = UIMgr:CreateObject("Formation", "PlaceLattice")
      placeGrid.touchable = false
      dragGridContainer:AddChild(placeGrid)
      table.insert(dragGridMap, placeGrid)
      local scale = Const.mapScale
      local enableHolder = placeGrid:GetChild("PlaceEnableHolder")
      ResourceManager.InstantiateAsync("Assets/Art/Effects/Prefab/UI_prefab/Embattle/FX_embattle_single_c_choose_yellow.prefab", function(effect)
        UIUtil.SetObjectToUI(effect, enableHolder)
        LuaUtil.SetLocalEuler(effect, -90, 0, 0)
        LuaUtil.SetScale(effect, scale, scale, scale, true)
      end)
      local unableHolder = placeGrid:GetChild("PlaceUnableHolder")
      ResourceManager.InstantiateAsync("Assets/Art/Effects/Prefab/UI_prefab/Embattle/FX_embattle_single_c_choose_red.prefab", function(effect)
        UIUtil.SetObjectToUI(effect, unableHolder)
        LuaUtil.SetLocalEuler(effect, -90, 0, 0)
        LuaUtil.SetScale(effect, scale, scale, scale, true)
      end)
    end
  end
  FormationWindow.SetDragGridMapVisible(false)
  if gridInfo then
    local coverGridList = FormationWindow.GetCoverGridShowList(gridInfo)
    local placeGrid, grid
    canDrop = true
    cannotDropTips = nil
    local startX, startY, width, height
    for i, v in ipairs(coverGridList) do
      placeGrid = dragGridMap[i]
      grid = v.gridInfo.grid
      placeGrid:SetXY(grid.x, grid.y)
      placeGrid.scale = grid.scale
      if 1 == i then
        startX, startY = placeGrid.x, placeGrid.y
      end
      if i == #coverGridList then
        width, height = placeGrid.x + grid.width - startX, grid.y + grid.height - startY
      end
      local state, unableTips = FormationWindow.GetPlaceGridState(v.gridInfo.index)
      if state == GRID_STATE.ENABLE then
        ChangeUIController(placeGrid, "c1", 0)
      else
        canDrop = false
        cannotDropTips = unableTips
        ChangeUIController(placeGrid, "c1", 1)
      end
    end
    if curTargetLine then
      if canDrop then
        if false == curTargetLine.visible then
          curTargetLine.visible = true
        end
        local cardId = curDragCardInfo.cardId
        local cardType = CardData.GetBaseConfig(cardId).type
        local target = FormationUnit.GetCurTarget({
          x = startX + width / 2,
          y = startY + height / 2
        }, {
          x = width / 2,
          y = height / 2
        }, cardType)
        if target then
          curTargetLine:SetXY(startX + width / 2, startY + height / 2)
          LineRendererHelper.RenderLineUI(curLineEffect, startX + width / 2, startY + height / 2, target.position.x, target.position.y)
        else
          curTargetLine.visible = false
        end
      elseif false == canDrop and curTargetLine.visible == true then
        curTargetLine.visible = false
      end
    end
  end
end

function FormationWindow.GetCoverGridShowList(gridInfo, radiusX, radiusY)
  local centerGridIndex = gridInfo.index
  local centerX, centerY = math.floor(centerGridIndex / 100), centerGridIndex % 100
  local index
  local coverGridList = {}
  local _needGridX, _needGridY = needGridX, needGridY
  if radiusX and radiusY then
    _needGridX = math.ceil(radiusX / FormationData.bottomGridUIWidth)
    _needGridY = math.ceil(radiusY / FormationData.bottomGridUIWidth)
  end
  local minX, maxX, minY, maxY
  local halfX = math.floor(_needGridX / 2)
  local halfY = math.floor(_needGridY / 2)
  if 0 == _needGridX % 2 then
    minX = centerX - halfX + 1
    maxX = centerX + halfX
  else
    minX = centerX - halfX
    maxX = centerX + halfX
  end
  if 0 == _needGridY % 2 then
    minY = centerY - halfY
    maxY = centerY + halfY - 1
  else
    minY = centerY - halfY
    maxY = centerY + halfY
  end
  for x = minX, maxX do
    for y = minY, maxY do
      index = x * 100 + y
      local grid = bottomGridMap[index]
      if grid then
        table.insert(coverGridList, {gridInfo = grid})
      end
    end
  end
  return coverGridList, maxX - minX + 1, maxY - minY + 1
end

function FormationWindow.GetPlaceGridStateSimple(gridIndex)
  local bottomGrid = bottomGridMap[gridIndex]
  if bottomGrid then
    if curDragCardInfo then
      if bottomGrid.cardEnable then
        local cardId = curDragCardInfo.cardId
        local cardType = CardData.GetBaseConfig(cardId).type
        if bottomGrid["roleType" .. cardType] then
          return GRID_STATE.ENABLE
        end
      end
    elseif curDragBuildingInfo and bottomGrid.buildingEnable then
      return GRID_STATE.ENABLE
    end
  end
  return GRID_STATE.UNABLE
end

function FormationWindow.GetPlaceGridState(gridIndex, cardInfo)
  cardInfo = cardInfo or curDragCardInfo
  local bottomGrid = bottomGridMap[gridIndex]
  if bottomGrid then
    local tempCover = tempGridCoverInfo[gridIndex]
    if cardInfo then
      if bottomGrid.cardEnable then
        local embattled, embattledPos = FormationWindow.IsCardSelect(cardInfo)
        local cardId = cardInfo.cardId
        local cardType = CardData.GetBaseConfig(cardId).type
        if remoteNumLimit and (cardType == BATTLE_UNIT_TYPE.SUPPORT or cardType == BATTLE_UNIT_TYPE.RANGED_ATTACK) then
          local count = FormationWindow.GetEmbattledCardCountByType({
            BATTLE_UNIT_TYPE.SUPPORT,
            BATTLE_UNIT_TYPE.RANGED_ATTACK
          })
          if nil == tempCover and false == embattled then
            if count >= remoteNumLimit then
              if bottomGrid["roleType" .. cardType] then
                return GRID_STATE.UNABLE, T(10862)
              else
                return GRID_STATE.UNABLE
              end
            end
          elseif false == embattled and tempCover and tempCover.isCard then
            local id = tempCover.id
            local config = CardData.GetBaseConfig(id)
            if config.type ~= BATTLE_UNIT_TYPE.SUPPORT and config.type ~= BATTLE_UNIT_TYPE.RANGED_ATTACK and count >= remoteNumLimit then
              if bottomGrid["roleType" .. cardType] then
                return GRID_STATE.UNABLE, T(10862)
              else
                return GRID_STATE.UNABLE
              end
            end
          end
        end
        if meleeNumLimit and (cardType == BATTLE_UNIT_TYPE.DEFENSE or cardType == BATTLE_UNIT_TYPE.MELEE_ATTACK) then
          local count = FormationWindow.GetEmbattledCardCountByType({
            BATTLE_UNIT_TYPE.DEFENSE,
            BATTLE_UNIT_TYPE.MELEE_ATTACK
          })
          if nil == tempCover and false == embattled then
            if count >= meleeNumLimit then
              if bottomGrid["roleType" .. cardType] then
                return GRID_STATE.UNABLE, T(10863)
              else
                return GRID_STATE.UNABLE
              end
            end
          elseif false == embattled and tempCover and tempCover.isCard then
            local id = tempCover.id
            local config = CardData.GetBaseConfig(id)
            if config.type ~= BATTLE_UNIT_TYPE.DEFENSE and config.type ~= BATTLE_UNIT_TYPE.MELEE_ATTACK and count >= meleeNumLimit then
              if bottomGrid["roleType" .. cardType] then
                return GRID_STATE.UNABLE, T(10863)
              else
                return GRID_STATE.UNABLE
              end
            end
          end
        end
        if sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR and FormationWindow.IsAssistCard(cardInfo.cardUid) then
          local assistMax = FormationWindow.GetEmbattledAssistMaxCount()
          local assistCount = FormationWindow.GetEmbattledAssistCount()
          if assistMax <= assistCount then
            if nil == tempCover and false == embattled and bottomGrid["roleType" .. cardType] then
              return GRID_STATE.UNABLE, T(11716)
            end
            if false == embattled and tempCover and false == FormationWindow.IsAssistCard(tempCover.uid) then
              return GRID_STATE.UNABLE, T(11716)
            else
            end
          end
        end
        local max = FormationWindow.GetEmbattledCardMaxCount()
        if max <= FormationWindow.GetEmbattledCardCount() then
          if nil == tempCover and true == embattled or tempCover and tempCover.isCard == true then
            if tempCover and true == embattled then
              local preGrid = bottomGridMap[embattledPos]
              if true ~= preGrid["roleType" .. tempCover.cardType] then
                return GRID_STATE.UNABLE
              end
            end
            if bottomGrid["roleType" .. cardType] then
              return GRID_STATE.ENABLE
            end
          elseif nil == tempCover and false == embattled and bottomGrid["roleType" .. cardType] then
            return GRID_STATE.UNABLE, T(10861)
          end
        elseif nil == tempCover or tempCover.isCard == true then
          if tempCover and true == embattled then
            local preGrid = bottomGridMap[embattledPos]
            if true ~= preGrid["roleType" .. tempCover.cardType] then
              return GRID_STATE.UNABLE
            end
          end
          if bottomGrid["roleType" .. cardType] then
            return GRID_STATE.ENABLE
          end
        end
      end
    elseif curDragBuildingInfo and bottomGrid.buildingEnable then
      if tempCover and tempCover.uid ~= curDragBuildingInfo.uid then
        return GRID_STATE.UNABLE
      end
      return GRID_STATE.ENABLE
    end
  end
  return GRID_STATE.UNABLE
end

function FormationWindow.OnDragEnd(context)
  local obj = GRoot.inst.touchTarget
  local touchGridIndex, savedGridInfo = FormationWindow.GetGridInfo(obj)
  if touchGridIndex and savedGridInfo then
    FormationWindow.ShowTouchState(savedGridInfo)
    if true == canDrop then
      local uid
      if curDragCardInfo then
        uid = curDragCardInfo.cardUid
        if cardOrBuildingInfo[uid] and touchGridIndex == cardOrBuildingInfo[uid].index then
          FormationWindow.ClearDrag()
          FormationWindow.UpdateTargetHolderVisible(uid, false, true)
          return
        end
        local tempInfo = tempGridCoverInfo[touchGridIndex]
        if tempInfo and tempInfo.isCard then
          local dragCardPosIndex = curCard2Pos[uid]
          local tempUid = tempInfo.uid
          local tempCardInfo = cardOrBuildingInfo[tempUid].cardInfo
          FormationWindow.ClearByUid(tempUid)
          if dragCardPosIndex then
            curCard2Pos[tempUid] = dragCardPosIndex
            if curTeamIndex then
              curCard2PosList[curTeamIndex][tempUid] = dragCardPosIndex
            end
            FormationWindow.UpdateDefenseFormationCard(tempUid, dragCardPosIndex)
            FormationWindow.ShowCardOrBuildingInMap(bottomGridMap[dragCardPosIndex], tempCardInfo, nil, nil, true)
          else
            curCard2Pos[tempUid] = nil
            if curTeamIndex then
              curCard2PosList[curTeamIndex][tempUid] = nil
            end
            FormationWindow.UpdateDefenseFormationCard(tempUid, nil)
          end
        end
        curCard2Pos[curDragCardInfo.cardUid] = touchGridIndex
        if curTeamIndex then
          curCard2PosList[curTeamIndex][curDragCardInfo.cardUid] = touchGridIndex
        end
        FormationWindow.UpdateDefenseFormationCard(curDragCardInfo.cardUid, touchGridIndex, true)
        FormationWindow.UpdateCardList(true)
        FormationWindow.StopTalk()
        curTypingEffect, curSoundEventIns = UIUtil.ShowTalkWord(curDragCardInfo.fashionId, BUBBLE_TYPE_ENUM.EMBATTLE, nil, true)
        FormationWindow.UpdateTargetHolderVisible(uid, false, true)
      elseif curDragBuildingInfo then
        uid = curDragBuildingInfo.uid
        if cardOrBuildingInfo[uid] and touchGridIndex == cardOrBuildingInfo[uid].index then
          FormationWindow.ClearDrag()
          FormationWindow.UpdateTargetHolderVisible(uid, false, true)
          return
        end
        curBuild2Pos[curDragBuildingInfo.uid] = touchGridIndex
        FormationWindow.UpdateDefenseFormationBuilding(curDragBuildingInfo.uid, touchGridIndex)
        FormationWindow.UpdateBuildingList(true)
      end
      if cardOrBuildingInfo[uid] then
        cardOrBuildingInfo[uid].object:Dispose()
        cardOrBuildingInfo[uid].coverObject:Dispose()
      end
      FormationWindow.ShowCardOrBuildingInMap(savedGridInfo, curDragCardInfo, curDragBuildingInfo, nil, true)
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.FORMATION_SET_OK)
      FormationWindow.UpdateTargetHolderVisible(uid, false, true)
    else
      if curDragCardInfo then
        FormationWindow.ClearDragCardRecord()
      elseif curDragBuildingInfo then
        FormationWindow.ClearDragBuildingRecord()
      end
      FormationWindow.UpdateListWhenDrag()
      if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.FORMATION_DRAG, false) then
        FormationWindow.DragOutFormation()
        if cannotDropTips then
          FloatTipsUtil.ShowWarnTips(cannotDropTips)
          cannotDropTips = nil
        end
      end
    end
  else
    FormationWindow.ShowTouchState()
    if curDragCardInfo then
      FormationWindow.ClearDragCardRecord()
    elseif curDragBuildingInfo then
      FormationWindow.ClearDragBuildingRecord()
    end
    FormationWindow.UpdateListWhenDrag()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.FORMATION_DRAG, false) then
      FormationWindow.DragOutFormation()
    end
  end
  FormationWindow.UpdateSort()
  FormationWindow.ClearDrag()
  if FormationWindow.CheckGuideComplete() then
    FormationWindow.HideDragGuide(true)
  else
    FormationWindow.ShowDragGuide()
  end
end

function FormationWindow.DragOutFormation()
  if GuideMgr.guideBol == true then
    local stepData = GuideMgr.GetStepData()
    if stepData and stepData.window_name == WinResConfig.FormationWindow.name then
      return
    end
  end
  if sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR and 0 ~= FormationData.guildWarCompensateUid then
    FloatTipsUtil.ShowWarnTips(T(11709))
    return
  end
  local uid
  if curDragCardInfo then
    uid = curDragCardInfo.cardUid
  elseif curDragBuildingInfo then
    uid = curDragBuildingInfo.uid
  end
  if cardOrBuildingInfo[uid] then
    if true == formationParam.arenaDefense and curDragCardInfo and table.getLen(curCard2Pos) <= 1 then
      FloatTipsUtil.ShowWarnTips(T(10259))
      FormationWindow.ClearDrag()
      return
    end
    FormationWindow.ClearByUid(uid)
    if curDragCardInfo then
      curCard2Pos[uid] = nil
      if curTeamIndex then
        curCard2PosList[curTeamIndex][uid] = nil
      end
      FormationWindow.ClearDragCardRecord()
      FormationWindow.UpdateDefenseFormationCard(uid, nil, true)
      FormationWindow.UpdateCardList(true)
    end
    if curDragBuildingInfo then
      curBuild2Pos[uid] = nil
      FormationWindow.ClearDragBuildingRecord()
      FormationWindow.UpdateDefenseFormationBuilding(uid, nil)
      FormationWindow.UpdateBuildingList(true)
    end
  end
end

function FormationWindow.SetRangeRectVisible(visible)
  if bottomRangeEnableRect then
    if visible and bottomRangeEnableRect.visible == false then
      local list = FormationWindow.GetAllEnableGrid()
      if #list > 0 then
        local startGrid = list[1]
        local startGridIndex = startGrid.index
        local endGridIndex = list[#list].index
        local gridCoverXCount = math.floor(endGridIndex / 100) - math.floor(startGridIndex / 100)
        local gridCoverYCount = endGridIndex % 100 - startGridIndex % 100
        bottomRangeEnableRect.x = startGrid.x
        bottomRangeEnableRect.y = startGrid.y
        bottomRangeEnableRect:SetSize((gridCoverXCount + 1) * FormationData.bottomGridWidth, (gridCoverYCount + 1) * FormationData.bottomGridWidth)
        bottomRangeEnableRect.visible = visible
        if rangeEffect then
          LuaUtil.SetScale(rangeEffect, (gridCoverXCount + 1) / 5 * rangeEffectOriginScale, rangeEffectOriginScale, (gridCoverYCount + 1) / 5 * rangeEffectOriginScale)
        end
      end
    else
      bottomRangeEnableRect.visible = visible
    end
  end
end

function FormationWindow.GetAllEnableGrid()
  local gridList = {}
  for index, gridInfo in pairs(bottomGridMap) do
    if FormationWindow.GetPlaceGridStateSimple(index) == GRID_STATE.ENABLE then
      table.insert(gridList, gridInfo)
    end
  end
  table.sort(gridList, function(a, b)
    return a.index < b.index
  end)
  return gridList
end

function FormationWindow.ClearByUid(uid)
  if cardOrBuildingInfo[uid] then
    cardOrBuildingInfo[uid].object:Dispose()
    cardOrBuildingInfo[uid].coverObject:Dispose()
    for i, v in pairs(tempGridCoverInfo) do
      if v.uid == uid then
        tempGridCoverInfo[i] = nil
      end
    end
    cardOrBuildingInfo[uid] = nil
  end
end

function FormationWindow.GetSwipeGesture(item)
  if nil == swipeCache[item] then
    swipeCache[item] = FairyGUI.SwipeGesture(item)
  end
  FormationWindow.SetSwipeGestureEnable(item, true)
  return swipeCache[item]
end

function FormationWindow.SetSwipeGestureEnable(item, enable)
  if swipeCache[item] then
    swipeCache[item]:Enable(enable)
  end
end

function FormationWindow.SetDragGridMapVisible(visible)
  if dragGridMap and false == visible then
    for i, v in ipairs(dragGridMap) do
      v:SetXY(10000, 10000)
    end
  end
end

function FormationWindow.ClearDrag()
  FormationWindow.SetRangeRectVisible(false)
  FormationWindow.SetTouchableWhenDrag(true)
  FormationWindow.SetDragGridMapVisible(false)
  if curTargetLine then
    curTargetLine:Dispose()
    curTargetLine = nil
  end
  curLineEffect = nil
  if curDrag then
    curDrag:Dispose()
    curDrag = nil
  end
  dragIcon = nil
  curDragCardInfo = nil
  curDragBuildingInfo = nil
end

function FormationWindow.SetTouchableWhenDrag(touchable)
  if coverGridContainer then
    coverGridContainer.touchable = touchable
  end
  if objectContainer then
    objectContainer.touchable = touchable
  end
  uis.Main.Choice.root.touchable = touchable
  uis.Main.CurrencyReturn.root.touchable = touchable
  uis.Main.BattleBtn.touchable = touchable
  uis.Main.ConquersBtn.touchable = touchable
end

function FormationWindow.ShowCardOrBuildingInMap(gridInfo, cardInfo, buildingInfo, camp, isDragEnd)
  if gridInfo then
    camp = camp or BATTLE_CAMP_FLAG.LEFT
    local grid = gridInfo.grid
    local fashionConfig, buildingConfig, buildingMonsterConfig, cardConfig, preBattleState, rangeX, rangeY
    if cardInfo then
      fashionConfig = TableData.GetConfig(cardInfo.fashionId or cardInfo.fashion_id, "BaseFashion")
      rangeX = fashionConfig.range
      rangeY = rangeX
      if cardInfo.cardUid then
        preBattleState = FormationWindow.GetBattleState(camp, cardInfo.cardUid)
      else
        preBattleState = FormationWindow.GetBattleState(camp, nil, cardInfo.id, gridInfo.index)
      end
    elseif buildingInfo then
      buildingConfig = TableData.GetConfig(buildingInfo.id, "BaseBuilding")
      rangeX = buildingConfig.range[1]
      rangeY = buildingConfig.range[2]
      if buildingConfig.fashion_id then
        fashionConfig = TableData.GetConfig(buildingConfig.fashion_id, "BaseFashion")
      elseif buildingConfig.monster_id then
        fashionConfig, buildingMonsterConfig = CardData.GetMonsterFashionConfig(buildingConfig.monster_id)
      end
      if buildingInfo.uid then
        preBattleState = FormationWindow.GetBattleState(camp, buildingInfo.uid)
      else
        preBattleState = FormationWindow.GetBattleState(camp, nil, buildingInfo.id, gridInfo.index)
      end
    else
      return false
    end
    if preBattleState and preBattleState.hp and preBattleState.hp <= 0 then
      return false
    end
    local coverGridList, countX, countY = FormationWindow.GetCoverGridShowList(gridInfo, rangeX, rangeY)
    local x, y
    if 0 == countX % 2 then
      x = grid.x + FormationData.bottomGridWidth
    else
      x = grid.x + FormationData.bottomGridWidth / 2
    end
    if 0 == countY % 2 then
      y = grid.y
    else
      y = grid.y + FormationData.bottomGridWidth / 2
    end
    local coverObject, uid, object
    if camp == BATTLE_CAMP_FLAG.LEFT then
      object = UIMgr:CreateObject("Formation", "CardInfoLeft")
    else
      object = UIMgr:CreateObject("Formation", "CardInfoRight")
    end
    objectContainer:AddChild(object)
    coverObject2Index[object.id] = gridInfo.index
    object:SetXY(x, y)
    object.rotationX = -(FormationData.rotation + 90)
    object.touchable = false
    object.gameObjectName = gridInfo.index
    local cardType, buildingType
    if cardInfo then
      ChangeUIController(object, "c1", 0)
      if isDragEnd then
        UIUtil.SetCardBattleSpine(ModelUtil.GetFullPath(fashionConfig.spd), object:GetChild("CardHolder"), SPINE_STATE_ENUM.IN, false, Const.cardScale * fashionConfig.spd_scale / 10000, true, function(spineModel)
          SkeletonAnimationUtil.SetFlip(spineModel, camp == BATTLE_CAMP_FLAG.RIGHT, false)
          SkeletonAnimationUtil.SetShaderEffectEnable(spineModel, false, true)
        end, function(spineModel)
          SkeletonAnimationUtil.SetAnimation(spineModel, 0, SPINE_STATE_ENUM.IDLE, true)
        end)
      else
        UIUtil.SetCardBattleSpine(ModelUtil.GetFullPath(fashionConfig.spd), object:GetChild("CardHolder"), SPINE_STATE_ENUM.IDLE, true, Const.cardScale * fashionConfig.spd_scale / 10000, true, function(spineModel)
          SkeletonAnimationUtil.SetFlip(spineModel, camp == BATTLE_CAMP_FLAG.RIGHT, false)
          if SkeletonAnimationUtil.GetSkeletonAnimation(spineModel) then
            SkeletonAnimationUtil.SetShaderEffectEnable(spineModel, false, true)
          else
            SkeletonAnimationUtil.SetShaderEffectEnable(spineModel, false, false)
          end
        end)
      end
      uid = cardInfo.cardUid
      cardConfig = CardData.GetBaseConfig(cardInfo.cardId or cardInfo.id)
      local occupation = object:GetChild("Occupation")
      cardType = cardConfig.type
      ChangeUIController(occupation, "c1", cardConfig.type - 1)
      local elementList = object:GetChild("ElementList")
      UIUtil.ShowElementList(elementList, cardConfig)
      local playerHp = object:GetChild("PlayerHP")
      if camp == BATTLE_CAMP_FLAG.LEFT and sceneType == ProtoEnum.SCENE_TYPE.ROGUE then
        playerHp.visible = true
        ChangeUIController(playerHp, "c1", 0)
        ChangeUIController(playerHp, "c2", 0)
        local curProgressBar = playerHp:GetChild("HpProgressBar")
        if curProgressBar then
          ChangeUIController(curProgressBar, "delay", 1)
          if preBattleState then
            curProgressBar.value = 100 * preBattleState.hp / preBattleState.maxHp
          else
            curProgressBar.value = 100
          end
        end
      elseif camp == BATTLE_CAMP_FLAG.RIGHT and sceneType == ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE then
        playerHp.visible = true
        ChangeUIController(playerHp, "c1", 1)
        ChangeUIController(playerHp, "c2", 1)
        local monsterRank = cardConfig.rank
        ChangeUIController(playerHp, "monster", cardConfig.rank)
        local curProgressBar
        if monsterRank == BATTLE_MONSTER_RANK.NORMAL or monsterRank == BATTLE_MONSTER_RANK.ELITE then
          curProgressBar = playerHp:GetChild("HpMonsterProgressBar")
        elseif monsterRank == BATTLE_MONSTER_RANK.BOSS then
          curProgressBar = playerHp:GetChild("HpEliteProgressBar")
        elseif monsterRank == BATTLE_MONSTER_RANK.LORD or monsterRank == BATTLE_MONSTER_RANK.DISASTER then
          curProgressBar = playerHp:GetChild("HpBossProgressBar")
        end
        if curProgressBar then
          ChangeUIController(curProgressBar, "delay", 1)
          if preBattleState then
            if RaidBossMgr.IsHardestLevel(formationParam.stageId) then
              curProgressBar.value = 100
            else
              curProgressBar.value = 100 * preBattleState.hp / preBattleState.maxHp
            end
          else
            curProgressBar.value = 100
          end
        end
      elseif camp == BATTLE_CAMP_FLAG.RIGHT and sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
        if stageConfig.next == nil then
          playerHp.visible = false
          if 1 == cardConfig.boss_show then
            FormationWindow.ShowGuildBossHp(cardConfig, preBattleState)
          end
        else
          playerHp.visible = true
          ChangeUIController(playerHp, "c1", 1)
          ChangeUIController(playerHp, "c2", 1)
          local monsterRank = cardConfig.rank
          ChangeUIController(playerHp, "monster", cardConfig.rank)
          local curProgressBar
          if monsterRank == BATTLE_MONSTER_RANK.NORMAL or monsterRank == BATTLE_MONSTER_RANK.ELITE then
            curProgressBar = playerHp:GetChild("HpMonsterProgressBar")
          elseif monsterRank == BATTLE_MONSTER_RANK.BOSS then
            curProgressBar = playerHp:GetChild("HpEliteProgressBar")
          elseif monsterRank == BATTLE_MONSTER_RANK.LORD or monsterRank == BATTLE_MONSTER_RANK.DISASTER then
            curProgressBar = playerHp:GetChild("HpBossProgressBar")
          end
          if curProgressBar then
            ChangeUIController(curProgressBar, "delay", 1)
            if preBattleState then
              curProgressBar.value = 100 * preBattleState.hp / preBattleState.maxHp
            else
              curProgressBar.value = 100
            end
          end
        end
      else
        playerHp.visible = false
      end
    elseif buildingInfo then
      ChangeUIController(object, "c1", 1)
      local effectPath = buildingConfig.effect
      local singleEffectPath = buildingConfig.single_effect
      if effectPath or singleEffectPath then
        if effectPath then
          if countY > 0 then
            object.rotationX = 0
          end
          for i = 1, countX do
            for j = 1, countY do
              ResourceManager.InstantiateAsync(EffectUtil.GetFullPath(buildingConfig.effect), function(effect)
                if object then
                  local holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
                  UIUtil.SetObjectToUI(effect, holder)
                  object:AddChildAt(holder, 0)
                  local gridWidth = FormationData.bottomGridWidth
                  holder.x = (i - 1) * gridWidth
                  holder.y = (j - 1) * gridWidth
                  local scale = Const.cardScale
                  LuaUtil.SetScale(effect, scale, scale, scale, true)
                  if countY > 0 then
                    LuaUtil.SetLocalPositionAndRotation(effect, gridWidth / 2, -gridWidth / 2, 0, -90, 0, 0)
                  else
                    LuaUtil.SetLocalPositionAndRotation(effect, gridWidth / 2, -gridWidth / 2, 0, FormationData.rotation, 0, 0)
                  end
                end
              end)
            end
          end
        elseif singleEffectPath then
          ResourceManager.InstantiateAsync(singleEffectPath, function(effect)
            if object then
              local holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
              UIUtil.SetObjectToUI(effect, holder)
              object:AddChildAt(holder, 0)
              local gridWidth = FormationData.bottomGridWidth
              holder.x = (countX - 1) * gridWidth / 2
              holder.y = (countY - 1) * gridWidth / 2
              local scale = Const.cardScale
              LuaUtil.SetScale(effect, scale, scale, scale, true)
              LuaUtil.SetLocalPositionAndRotation(effect, gridWidth / 2, -gridWidth / 2, 0, FormationData.rotation, 0, 0)
            end
          end)
        end
      elseif fashionConfig then
        UIUtil.SetCardBattleSpine(ModelUtil.GetFullPath(fashionConfig.spd), object:GetChild("BuildingHolder"), SPINE_STATE_ENUM.IDLE, true, Const.cardScale * fashionConfig.spd_scale / 10000, true, function(spineModel)
          SkeletonAnimationUtil.SetFlip(spineModel, camp == BATTLE_CAMP_FLAG.RIGHT, false)
          SkeletonAnimationUtil.SetShaderEffectEnable(spineModel, false, true)
        end)
      end
      uid = buildingInfo.uid
      local occupation = object:GetChild("Occupation")
      if buildingMonsterConfig then
        occupation.visible = true
        cardType = buildingMonsterConfig.type
        ChangeUIController(occupation, "c1", buildingMonsterConfig.type - 1)
      else
        occupation.visible = false
      end
      local elementList = object:GetChild("ElementList")
      UIUtil.ShowElementList(elementList, buildingMonsterConfig)
      local buildCost = object:GetChild("BuildCost")
      if sceneType == ProtoEnum.SCENE_TYPE.ARENA then
        buildCost.visible = true
        buildCost:GetChild("BuildTxt").text = buildingConfig.cost
      else
        buildCost.visible = false
      end
      if countY > 0 then
        local rotationX = -(FormationData.rotation + 90)
        occupation.rotationX = rotationX
        elementList.rotationX = rotationX
        buildCost.rotationX = rotationX
      end
      buildingType = buildingConfig.type
    end
    if camp == BATTLE_CAMP_FLAG.RIGHT then
      FormationData.UpdateEnemyCache({
        x = object.x,
        y = object.y
      }, {
        x = rangeX / 2,
        y = rangeY / 2
      }, cardType, buildingType)
    end
    coverObject = UIMgr:CreateObject("Formation", "TargetLattice")
    coverObject.gameObjectName = gridInfo.index
    coverGridContainer:AddChild(coverObject)
    coverObject.width = grid.width * countX
    coverObject.height = grid.height * countY
    coverObject.scale = grid.scale
    coverObject.xy = object.xy
    object.width = coverObject.width
    object.height = coverObject.height
    local holder = coverObject:GetChild("TargetHolder")
    if camp == BATTLE_CAMP_FLAG.LEFT then
      local holderWhite = coverObject:GetChild("WhiteTargetHolder")
      local path = "Assets/Art/Effects/Prefab/UI_prefab/Embattle/FX_embattle_single_choose_green.prefab"
      local pathWhite = "Assets/Art/Effects/Prefab/UI_prefab/Embattle/FX_embattle_single_choose_white.prefab"
      ResourceManager.InstantiateAsync(path, function(effect)
        UIUtil.SetObjectToUI(effect, holder)
        LuaUtil.SetLocalEuler(effect, -90, 0, 0)
        local scale = Const.mapScale
        LuaUtil.SetScale(effect, countX * scale, scale, countY * scale, true)
      end)
      ResourceManager.InstantiateAsync(pathWhite, function(effect)
        UIUtil.SetObjectToUI(effect, holderWhite)
        LuaUtil.SetLocalEuler(effect, -90, 0, 0)
        local scale = Const.mapScale
        LuaUtil.SetScale(effect, countX * scale, scale, countY * scale, true)
      end)
      holder.visible = true
      holderWhite.visible = false
      if buildingInfo and false == buildingInfo.draggable then
      else
        coverObject.draggable = true
        coverObject.onDragStart:Set(function(context)
          curDragCardInfo = cardInfo
          curDragBuildingInfo = buildingInfo
          FormationWindow.OnDragStart(context, cardInfo, buildingInfo, context.data)
        end)
      end
      coverObject.onClick:Set(function()
        if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.FORMATION_TIPS, false) == false then
          return
        end
        if cardInfo then
          InfoTipsUtil.ShowCardTipsWindow(cardInfo, nil, nil, sceneType, formationParam.stageId)
        elseif buildingInfo then
          InfoTipsUtil.ShowBuildingTipsWindow(buildingInfo.id, nil, {
            arenaDefense = formationParam.arenaDefense,
            sceneType = sceneType
          })
        end
      end)
      cardOrBuildingInfo[uid] = {
        index = gridInfo.index,
        object = object,
        coverObject = coverObject,
        holderGreen = holder,
        holderWhite = holderWhite,
        cardInfo = cardInfo
      }
      for tempIndex, tempInfo in pairs(tempGridCoverInfo) do
        if tempInfo and tempInfo.uid == uid then
          tempGridCoverInfo[tempIndex] = nil
        end
      end
      for _, v in ipairs(coverGridList) do
        local index = v.gridInfo.index
        tempGridCoverInfo[index] = {
          uid = uid,
          isCard = nil ~= cardInfo,
          id = cardInfo and cardInfo.cardId,
          cardType = cardType
        }
      end
    elseif camp == BATTLE_CAMP_FLAG.NEUTRAL then
    elseif camp == BATTLE_CAMP_FLAG.RIGHT then
      if buildingConfig and 1 == buildingConfig.hide_area_in_formation then
      elseif cardConfig and 1 == cardConfig.hide_area_in_formation then
      else
        ResourceManager.InstantiateAsync("Assets/Art/Effects/Prefab/UI_prefab/Embattle/FX_embattle_single_choose_red.prefab", function(effect)
          UIUtil.SetObjectToUI(effect, holder)
          LuaUtil.SetLocalEuler(effect, -90, 0, 0)
          local scale = Const.mapScale
          LuaUtil.SetScale(effect, countX * scale, scale, countY * scale, true)
        end)
        holder.visible = true
      end
      coverObject.onClick:Set(function()
        if BattleData.IsGuildTrain(sceneType) then
          return
        end
        if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.FORMATION_TIPS, false) == false then
          return
        end
        if cardInfo then
          InfoTipsUtil.ShowCardTipsWindow(cardInfo, nil, nil, sceneType, formationParam.stageId)
        elseif buildingInfo then
          InfoTipsUtil.ShowBuildingTipsWindow(buildingInfo.id, nil, {
            arenaDefense = formationParam.arenaDefense,
            sceneType = sceneType
          })
        end
      end)
    end
  end
  return true
end

function FormationWindow.GetAvailablePos(cardUid, prePos, usedPos, newCardUid2Pos)
  local card = FormationData.GetCardDataByUid(cardUid, sceneType)
  local cardId = card.cardId
  local cardConfig = CardData.GetBaseConfig(cardId)
  local cardType = cardConfig.type
  local limit = FormationWindow.GetEmbattledCardMaxCount()
  local curCount = FormationWindow.GetEmbattledCardCount(newCardUid2Pos)
  if limit <= curCount then
    return
  end
  if remoteNumLimit and (cardType == BATTLE_UNIT_TYPE.SUPPORT or cardType == BATTLE_UNIT_TYPE.RANGED_ATTACK) then
    local count = FormationWindow.GetEmbattledCardCountByType({
      BATTLE_UNIT_TYPE.SUPPORT,
      BATTLE_UNIT_TYPE.RANGED_ATTACK
    }, newCardUid2Pos)
    if count >= remoteNumLimit then
      return
    end
  end
  if meleeNumLimit and (cardType == BATTLE_UNIT_TYPE.DEFENSE or cardType == BATTLE_UNIT_TYPE.MELEE_ATTACK) then
    local count = FormationWindow.GetEmbattledCardCountByType({
      BATTLE_UNIT_TYPE.DEFENSE,
      BATTLE_UNIT_TYPE.MELEE_ATTACK
    }, newCardUid2Pos)
    if count >= meleeNumLimit then
      return
    end
  end
  local grid = bottomGridMap[prePos]
  if nil == grid then
    return
  end
  if nil == usedPos[prePos] and grid.cardEnable and grid["roleType" .. cardType] then
    usedPos[prePos] = cardUid
    return prePos
  end
  local startX = math.floor(prePos / 100)
  local y = prePos % 100
  for x = 1, selfSizeX do
    if x ~= startX then
      local pos = x * 100 + y
      local tempGrid = bottomGridMap[pos]
      if nil == usedPos[pos] and tempGrid.cardEnable and tempGrid["roleType" .. cardType] then
        usedPos[pos] = cardUid
        return pos
      end
    end
  end
end

function FormationWindow.ShowLeft(refresh)
  if refresh then
    for uid, v in pairs(curCard2Pos) do
      FormationWindow.ClearByUid(uid)
    end
    for uid, v in pairs(curBuild2Pos) do
      FormationWindow.ClearByUid(uid)
    end
    local gridInfo
    if curCard2Pos then
      for cardUid, pos in pairs(curCard2Pos) do
        gridInfo = bottomGridMap[pos]
        local cardInfo = FormationData.GetCardDataByUid(cardUid, sceneType)
        FormationWindow.ShowCardOrBuildingInMap(gridInfo, cardInfo, nil, BATTLE_CAMP_FLAG.LEFT)
      end
    end
    if curBuild2Pos then
      for buildingUid, pos in pairs(curBuild2Pos) do
        gridInfo = bottomGridMap[pos]
        local buildingData = FormationData.GetBuildingByUid(buildingUid)
        local buildingInfo = {
          id = buildingData.id,
          uid = buildingUid
        }
        FormationWindow.ShowCardOrBuildingInMap(gridInfo, nil, buildingInfo, BATTLE_CAMP_FLAG.LEFT)
      end
    end
    return
  end
  curCard2Pos = {}
  curBuild2Pos = {}
  local curFormation
  if formationParam.arenaDefense == true then
    curFormation = tempArenaDefenseFormation
    local buildUid2Pos = curFormation.buildUid2Pos
    for uid, pos in pairs(buildUid2Pos) do
      local buildInfo = FormationData.GetBuildingByUid(uid)
      if buildInfo.isUnlock == false then
        buildUid2Pos[uid] = nil
      end
    end
    if curFormation.leaderCardId and curFormation.leaderCardId > 0 then
      curCaptainCardId = curFormation.leaderCardId
    end
    curBurstOrderSetting = curFormation.burstOrderSetting
  elseif sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
    curFormation = {
      cardUid2Pos = curCard2PosList[curTeamIndex]
    }
  elseif formationParam.guildWarRecommendFormation then
    local formation = formationParam.guildWarRecommendFormation
    local cardInfos = formation.cardInfos
    local cardUid2Pos = {}
    for i, v in ipairs(cardInfos) do
      local state = GuildWarData.GetCardState(v.cardId)
      if state == GUILD_WAR_CARD_STATE.NORMAL then
        local selfCard = CardData.GetCardDataById(v.cardId)
        if selfCard then
          cardUid2Pos[selfCard.cardUid] = v.position
        end
      end
    end
    curFormation = {cardUid2Pos = cardUid2Pos}
  else
    curFormation = FormationData.GetStagePrepareInfo(sceneType, formationParam.stageId)
    if curFormation then
      local usedPos = {}
      local cardUid2Pos = curFormation.cardUid2Pos
      local newCardUid2Pos = {}
      local sortList = {}
      for uid, pos in pairs(cardUid2Pos) do
        if FormationData.GetCardDataByUid(uid, sceneType) then
          table.insert(sortList, {pos = pos, uid = uid})
        end
      end
      table.sort(sortList, function(a, b)
        return a.pos < b.pos
      end)
      for i, v in ipairs(sortList) do
        local pos = FormationWindow.GetAvailablePos(v.uid, v.pos, usedPos, newCardUid2Pos)
        if pos then
          cardUid2Pos[v.uid] = pos
          newCardUid2Pos[v.uid] = pos
        else
          cardUid2Pos[v.uid] = nil
        end
      end
      if curFormation.leaderCardId and curFormation.leaderCardId > 0 then
        curCaptainCardId = curFormation.leaderCardId
      end
      curBurstOrderSetting = curFormation.burstOrderSetting
    elseif sceneType == ProtoEnum.SCENE_TYPE.MAIN_LINE then
      local config = TableData.GetConfig(70010022, "BaseFixed").array_value
      local data = ParseConfigStr(config, "|", ":")
      curFormation = {
        cardUid2Pos = {}
      }
      for i, v in ipairs(data) do
        local card = CardData.GetCardDataById(tonumber(v[1]))
        if card then
          curFormation.cardUid2Pos[card.cardUid] = tonumber(v[2])
        end
      end
    end
  end
  if curFormation then
    local cardUid2Pos = curFormation.cardUid2Pos
    local buildUid2Pos = curFormation.buildUid2Pos
    local gridInfo, cardInfo
    if cardUid2Pos then
      for cardUid, pos in pairs(cardUid2Pos) do
        local available = true
        if sceneType == ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE then
          local card = CardData.GetCardDataByUid(cardUid)
          if card then
            available = not RaidBossMgr.IsCardUsed(card.cardId)
          end
        elseif sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
          if 0 == FormationData.guildWarCompensateUid then
            local card = FormationData.GetCardDataByUid(cardUid, sceneType)
            if card then
              local playerInfo = GuildWarData.GetGuildPlayerInfo()
              local usedSelfCardIds = playerInfo.usedSelfCardIds
              local usedAssistCardIds = playerInfo.usedAssistCardIds
              if card.uin == ActorData.GetUin() then
                available = not table.contain(usedSelfCardIds, card.cardId)
              else
                available = not table.contain(usedAssistCardIds, card.cardId)
              end
            else
              available = false
            end
          end
        elseif sceneType == ProtoEnum.SCENE_TYPE.ROGUE then
          local card = CardData.GetCardDataByUid(cardUid)
          available = card and RogueGameData.GetCardInfo(card.cardId) and RogueGameMgr.IsLiving(card.cardId)
        end
        if available then
          gridInfo = bottomGridMap[pos]
          if true == gridInfo.cardEnable then
            cardInfo = FormationData.GetCardDataByUid(cardUid, sceneType)
            curCard2Pos[cardUid] = pos
            if curTeamIndex then
              curCard2PosList[curTeamIndex][cardUid] = pos
            end
            local showOk = FormationWindow.ShowCardOrBuildingInMap(gridInfo, cardInfo, nil, BATTLE_CAMP_FLAG.LEFT)
            if false == showOk then
              curCard2Pos[cardUid] = nil
              if curTeamIndex then
                curCard2PosList[curTeamIndex][cardUid] = nil
              end
            end
          end
        end
      end
    end
    if buildUid2Pos then
      for buildingUid, pos in pairs(buildUid2Pos) do
        gridInfo = bottomGridMap[pos]
        if true == gridInfo.buildingEnable then
          local buildingData = FormationData.GetBuildingByUid(buildingUid)
          curBuild2Pos[buildingUid] = pos
          local buildingInfo = {
            id = buildingData.id,
            uid = buildingUid
          }
          local showOk = FormationWindow.ShowCardOrBuildingInMap(gridInfo, nil, buildingInfo, BATTLE_CAMP_FLAG.LEFT)
          if false == showOk then
            curBuild2Pos[buildingUid] = nil
          end
        end
      end
    end
  end
end

function FormationWindow.ShowOther()
  FormationData.ClearEnemyCache()
  local monsterGroup
  if sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
    monsterGroup = stageConfig and stageConfig.monster_group_list[curTeamIndex]
  elseif sceneType == ProtoEnum.SCENE_TYPE.ARENA then
    FormationWindow.ShowEnemyFormation(formationParam.enemyFormation)
    return
  else
    monsterGroup = stageConfig and stageConfig.monster_group_list[1]
  end
  if monsterGroup then
    monsterGroupConfig = TableData.GetConfig(monsterGroup, "BaseMonsterGroup")
    local pos, gridInfo, monsterInfo
    local monsterList = monsterGroupConfig.monster_list
    if monsterList then
      local usedPos = {}
      for i, monsterId in ipairs(monsterGroupConfig.monster_list) do
        pos = monsterGroupConfig.monster_site[i]
        if nil ~= usedPos[pos] then
          LuaUtil.ShowConfigErrorTips(string.format("阵型重复 monsterGroupId：%d，重复位置：%d", monsterGroup, pos))
          return
        end
        usedPos[pos] = 1
        monsterInfo = CardData.CreateClientUnit(monsterId)
        gridInfo = bottomGridMap[pos]
        FormationWindow.ShowCardOrBuildingInMap(gridInfo, monsterInfo, nil, BATTLE_CAMP_FLAG.RIGHT)
      end
    end
    local buildingList = monsterGroupConfig.building_list
    local buildingSite = monsterGroupConfig.building_site
    local buildingCamp = monsterGroupConfig.building_camp
    if buildingList then
      for i, buildingId in ipairs(buildingList) do
        gridInfo = bottomGridMap[buildingSite[i]]
        FormationWindow.ShowCardOrBuildingInMap(gridInfo, nil, {
          id = buildingId,
          uid = buildingId .. gridInfo.index,
          draggable = false
        }, buildingCamp[i])
      end
    end
  end
end

function FormationWindow.ShowGuildBossHp(cardConfig, preBattleState)
  local hpRegion = uis.Main.GuildBossHPRegion
  hpRegion.root.visible = true
  hpRegion.NameTxt.text = cardConfig.name()
  hpRegion.Occupation.c1Ctr.selectedIndex = cardConfig.type - 1
  UIUtil.ShowElementList(hpRegion.ElementList, cardConfig)
  UIUtil.SetHeadByFaceId(cardConfig.fashion_id, hpRegion.Head.Pic.PicLoader)
  if preBattleState then
    hpRegion.HPProgressBar.value = 100 * preBattleState.hp / preBattleState.maxHp
  else
    hpRegion.HPProgressBar.value = 100
  end
end

function FormationWindow.ShowEnemyFormation(enemyFormation)
  if enemyFormation then
    local cardList = enemyFormation.cardList
    local gridInfo
    for i, v in ipairs(cardList) do
      gridInfo = bottomGridMap[v.pos]
      FormationWindow.ShowCardOrBuildingInMap(gridInfo, v, nil, BATTLE_CAMP_FLAG.RIGHT)
    end
    local buildingList = enemyFormation.buildingList
    for i, v in ipairs(buildingList) do
      gridInfo = bottomGridMap[v.pos]
      FormationWindow.ShowCardOrBuildingInMap(gridInfo, nil, v, BATTLE_CAMP_FLAG.RIGHT)
    end
  end
end

function FormationWindow.UpdateSort()
  if objectContainer then
    local container = objectContainer.container
    local numberChildren = container.numChildren
    local tempList = {}
    for index = 0, numberChildren - 1 do
      local child = objectContainer:GetChildAt(index)
      if coverObject2Index[child.id] then
        table.insert(tempList, {
          object = child,
          index = coverObject2Index[child.id]
        })
      end
    end
    if sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
      table.sort(tempList, function(a, b)
        local indexA = a.index
        local indexB = b.index
        if indexA / 100 ~= indexB / 100 then
          return indexA / 100 < indexB / 100
        else
          return indexA % 100 < indexB % 100
        end
      end)
    else
      table.sort(tempList, function(a, b)
        local indexA = a.index
        local indexB = b.index
        if indexA % 100 ~= indexB % 100 then
          return indexA % 100 < indexB % 100
        else
          return indexA < indexB
        end
      end)
    end
    for i, v in ipairs(tempList) do
      objectContainer:SetChildIndex(v.object, i - 1)
    end
  end
end

function FormationWindow.CheckGuideComplete()
  local stepData = GuideMgr.GetStepData()
  if GuideMgr.curGuideIsPlay and stepData then
    if stepData.drag_card then
      local dragInfo = Split(stepData.drag_card, ":")
      local cardId = tonumber(dragInfo[1])
      local targetGridIndex = tonumber(dragInfo[2])
      local cardData = CardData.GetCardDataById(cardId)
      local isSelect, pos = FormationWindow.IsCardSelect(cardData)
      if pos == targetGridIndex then
        ld("Battle")
        local stepId = stepData.id
        local triggerId = GuideMgr.curTriggerId
        BattleService.SaveStagePrepareInfoReq(sceneType, curCard2Pos, curBuild2Pos, curCaptainCardId, curBurstOrderSetting, function()
          GuideMgr.SaveGuideProgress(triggerId, stepId)
        end)
        return true
      end
    end
    return false
  end
end

function FormationWindow.GetGuideTargetDragPos()
  local stepData = GuideMgr.GetStepData()
  if GuideMgr.curGuideIsPlay and stepData and stepData.drag_card then
    local dragInfo = Split(stepData.drag_card, ":")
    local targetGridIndex = tonumber(dragInfo[2])
    return targetGridIndex
  end
  return nil
end

function FormationWindow.UpdateGuideDraggable(cardUid, gridIndex)
  for i, v in pairs(cardOrBuildingInfo) do
    if v.cardInfo.cardUid == cardUid then
      v.coverObject.draggable = true
    else
      v.coverObject.draggable = false
    end
  end
  for i, v in pairs(bottomGridMap) do
    if i == gridIndex then
      v.cardEnable = true
    else
      v.cardEnable = false
    end
  end
end

function FormationWindow.CreateGuideLine()
  if nil == curGuideTargetLine then
    curGuideTargetLine = UIMgr:CreateObject("Formation", "TargetLineInfo")
    curGuideLineEffect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/NewGuyFinger/FX_ui_newguide_linerender.prefab", curGuideTargetLine:GetChild("TargetLineHolder"))
    uis.Main.root:AddChild(curGuideTargetLine)
    curGuideTargetLine.visible = false
  end
end

function FormationWindow.ShowMoveEffect()
  local stepData = GuideMgr.GetStepData()
  if GuideMgr.curGuideIsPlay and stepData and 1 == stepData.ctrl_move then
    local clickCtr = uis.Main.root:GetChild(stepData.ctrl_id)
    if clickCtr then
      clickCtr.visible = false
    end
  end
end

function FormationWindow.DragTargetGridEffect(gridIndex, visible)
  local targetObject = bottomGridMap[gridIndex].gridObject
  if false == visible then
  else
    if nil == dragTargetGridEffectHolder then
      dragTargetGridEffectHolder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
      coverGridContainer:AddChildAt(dragTargetGridEffectHolder, 0)
      ResourceManager.InstantiateAsync("Assets/Art/Effects/Prefab/UI_prefab/Embattle/FX_embattle_newguid.prefab", function(effect)
        UIUtil.SetObjectToUI(effect, dragTargetGridEffectHolder)
        LuaUtil.SetLocalEuler(effect, -90, 0, 0)
        local scale = Const.mapScale
        LuaUtil.SetScale(effect, scale, scale, scale, true)
      end)
    end
    dragTargetGridEffectHolder.displayObject.visible = true
    dragTargetGridEffectHolder:SetXY(targetObject.x + targetObject.width / 2, targetObject.y + targetObject.height / 2)
  end
end

function FormationWindow.ShowDragGuide()
  local stepData = GuideMgr.GetStepData()
  if GuideMgr.curGuideIsPlay and stepData then
    if stepData.drag_card then
      FormationWindow.CreateGuideLine()
      UIMgr:SendWindowMessage(WinResConfig.GuideWindow.name, WindowMsgEnum.GuideWindow.SHOW)
      local dragInfo = Split(stepData.drag_card, ":")
      local cardId = tonumber(dragInfo[1])
      local targetGridIndex = tonumber(dragInfo[2])
      local cardData = CardData.GetCardDataById(cardId)
      FormationWindow.UpdateGuideDraggable(cardData.cardUid, targetGridIndex)
      local isSelect, pos = FormationWindow.IsCardSelect(cardData)
      if pos == targetGridIndex then
        FormationWindow.DragTargetGridEffect(targetGridIndex, false)
        GuideMgr.Next()
        return
      end
      local startPosition
      local targetObject = bottomGridMap[targetGridIndex].gridObject
      FormationWindow.DragTargetGridEffect(targetGridIndex, true)
      local targetPosition = targetObject.displayObject:LocalToWorld(Vector3(targetObject.width / 2, targetObject.height / 2, 0))
      if isSelect then
        local object = cardOrBuildingInfo[cardData.cardUid].coverObject
        startPosition = object.displayObject:LocalToWorld(Vector3(object.width / 2, object.height / 2, 0))
      else
        local index
        for i, v in ipairs(listData) do
          if v.cardUid == cardData.cardUid then
            index = i
            break
          end
        end
        local list = uis.Main.Choice.CardList
        list.scrollPane.touchEffect = false
        local i = list:ChildIndexToItemIndex(index - 1)
        local child = list:GetChildAt(i)
        list:ScrollToView(i)
        startPosition = child.displayObject:LocalToWorld(Vector3(child.width / 2, child.height / 2, 0))
      end
      uis.Main.BattleBtn.touchable = false
      if curGuideTargetLine then
        curGuideTargetLine.visible = true
        local targetV2 = uis.Main.root:WorldToLocal(targetPosition)
        curGuideTargetLine:SetXY(targetV2.x, targetV2.y)
        LineRendererHelper.RenderLineUI3D(curGuideLineEffect, startPosition.x, startPosition.y, startPosition.z, targetPosition.x, targetPosition.y, targetPosition.z, 100, stepData.ratioX or 0, stepData.ratioY or 0)
      end
    elseif stepData.skip_condition then
      local dragInfo = Split(stepData.skip_condition, ":")
      local cardId = tonumber(dragInfo[1])
      local targetGridIndex = tonumber(dragInfo[2])
      local cardData = CardData.GetCardDataById(cardId)
      local isSelect, pos = FormationWindow.IsCardSelect(cardData)
      if pos == targetGridIndex then
        GuideMgr.Next()
        return
      end
    end
  end
end

function FormationWindow.HideDragGuide(changeToNext)
  if GuideMgr.curGuideIsPlay then
    if curGuideTargetLine then
      curGuideTargetLine.visible = false
    end
    if dragTargetGridEffectHolder then
      dragTargetGridEffectHolder.displayObject.visible = false
    end
    local stepData = GuideMgr.GetStepData()
    if stepData and stepData.drag_card then
      if changeToNext then
        UIMgr:SendWindowMessage(WinResConfig.GuideWindow.name, WindowMsgEnum.GuideWindow.SHOW)
        FormationWindow.UpdateGuideDraggable(0, 0)
        GuideMgr.Next()
      else
        UIMgr:SendWindowMessage(WinResConfig.GuideWindow.name, WindowMsgEnum.GuideWindow.HIDE)
      end
    end
  end
end

function FormationWindow.RefreshGuide()
  FormationWindow.ShowDragGuide()
  FormationWindow.ShowMoveEffect()
end

return FormationWindow
