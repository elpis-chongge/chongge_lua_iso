if Application.platform ~= RuntimePlatform.WindowsEditor and Application.platform ~= RuntimePlatform.OSXEditor then
  return
end
local CloseBattle_LocalTest = function(msg, rspCallback)
  local extData = msg.battleData.initData.extData
  if type(extData) == "table" then
    local storyId = extData.curStoryId
    local eventInfo = extData.eventInfo
    eventInfo.storyRecords = eventInfo.storyRecords or {}
    table.insert(eventInfo.storyRecords, storyId)
  end
  OpenWindow(WinResConfig.BattleFinishWindow.name, nil, msg)
end
if not BattleMgr then
  ld("Battle")
end
local sendBattleOverMsg = BattleMgr.SendBattleOverMsg

function BattleMgr.SendBattleOverMsg(...)
  local initBattleData = BattleData.InitBattleData
  if initBattleData.localtest then
    CloseBattle_LocalTest(...)
    return
  end
  sendBattleOverMsg(...)
end

local StartBattle_LocalTest = function(sceneType, stageId, card2Pos, _, badgeId, _, extData)
  local stageConf = TableData.GetConfig(stageId, "BaseStage")
  local initData = {
    stageId = stageId,
    sceneType = sceneType,
    mapId = stageConf.map_id,
    buffList = {},
    actorLeft = {
      unitList = {},
      badgeList = {},
      monsterGroupId = 0
    },
    actorRight = {
      unitList = {},
      badgeList = {},
      monsterGroupId = stageConf.monster_group_list[1]
    },
    randomSeeds = {
      [1] = math.random(1, 10000),
      [2] = math.random(1, 10000),
      [3] = math.random(1, 10000),
      [4] = math.random(1, 10000),
      [5] = math.random(1, 10000)
    },
    extData = extData
  }
  local badgeLevel, badgeGrade
  if badgeId then
    local badgeConf = ActorData.GetBadgeInfoById(badgeId)
    badgeLevel = badgeConf.level
    badgeGrade = badgeConf.grade
  end
  local actorLeft = initData.actorLeft
  local unitList = actorLeft.unitList
  local badgeList = actorLeft.badgeList
  table.insert(badgeList, {
    id = badgeId,
    level = badgeLevel,
    grade = badgeGrade,
    used = true
  })
  for k, pos in pairs(card2Pos) do
    local uid = k
    local cardData = CardData.GetCardDataByUid(uid)
    local uin = ActorData.GetUin()
    local id = cardData.cardId
    local lv = cardData.level
    local quality = cardData.quality
    local fashionId = cardData.fashionId
    local grade = cardData.grade
    local maxHp = cardData.attributes[ProtoEnum.ATTR_ID.MAX_HP]
    local skillLevels = {}
    local skill2Level = cardData.skill2Level
    for skillId, skillLevel in pairs(skill2Level) do
      table.insert(skillLevels, {skillId = skillId, level = skillLevel})
    end
    table.insert(unitList, {
      uid = uid,
      uin = uin,
      id = id,
      pos = pos,
      level = lv,
      grade = grade,
      quality = quality,
      fashionId = fashionId,
      skillLevels = skillLevels,
      hp = maxHp,
      maxHp = maxHp
    })
  end
  BattleMgr.InitBattle({initData = initData, localtest = true})
  AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.BATTLE_START)
  return
end
if not FormationMgr then
  ld("Formation")
end
local sendBattleReq = FormationMgr.SendBattleReq

function FormationMgr.SendBattleReq(sceneType, stageId, card2Pos, build2Pos, arenaRankId, extData, localtest)
  if localtest then
    StartBattle_LocalTest(sceneType, stageId, card2Pos, build2Pos, arenaRankId, extData)
    return
  end
  sendBattleReq(sceneType, stageId, card2Pos, build2Pos, arenaRankId, extData)
end

return {
  LocalTest = function(cmd_str)
    if type(cmd_str) == "table" then
      local prefix = cmd_str[1]
      if "abyssStory" == prefix then
        local testType = cmd_str[2]
        local number = tonumber(testType)
        if type(number) ~= "number" then
          local param = tonumber(cmd_str[3])
          local eventInfo = {
            localtest = true,
            storyRecords = {}
          }
          if "moving" == testType then
            local conf = TableData.GetConfig(param, "BaseStorySimple")
            if not conf then
              return
            end
            OpenWindow(WinResConfig.MoveEventTipsWindow.name, nil, param, eventInfo)
          elseif "building" == testType then
            local conf = TableData.GetConfig(param, "BaseStorySimple")
            if not conf then
              return
            end
            OpenWindow(WinResConfig.RandomTipsWindow.name, nil, param, eventInfo)
          elseif "branch" == testType then
            local conf = TableData.GetConfig(param, "BaseManorNode")
            if not conf then
              return
            end
            local storyId = tonumber(conf.parameter)
            eventInfo.nextPlotNodeId = param
            eventInfo.step = 0
            eventInfo.numNodes = 0
            OpenWindow(WinResConfig.CardPlotTalkWindow.name, nil, false, storyId, eventInfo)
          end
        else
          local conf = TableData.GetConfig(number, "BaseManorEvent")
          if not conf then
            return
          end
          local eventInfo = {
            eventId = number,
            localtest = true,
            storyRecords = {}
          }
          local param = conf.parameter
          local e_type, e_subtype = conf.type, conf.sub_type
          if (e_type == AbyssExploreEventID.POSITIVE or e_type == AbyssExploreEventID.DAILY_RANDOM or e_type == AbyssExploreEventID.DAILY_RANDOM_NEWBIE) and e_subtype == AbyssExploreSubEventID.DIALOGUE then
            OpenWindow(WinResConfig.MoveEventTipsWindow.name, nil, tonumber(param), eventInfo)
          elseif e_type == AbyssExploreEventID.BUILDING_RANDOM and e_subtype == AbyssExploreSubEventID.DIALOGUE then
            OpenWindow(WinResConfig.RandomTipsWindow.name, nil, tonumber(param), eventInfo)
          elseif e_type == AbyssExploreEventID.BRANCH or e_type == AbyssExploreEventID.BRANCH_ACTIVITY then
            local nodeId = tonumber(param)
            conf = TableData.GetConfig(nodeId, "BaseManorNode")
            if not conf then
              return
            end
            local storyId = tonumber(conf.parameter)
            eventInfo.nextPlotNodeId = nodeId
            eventInfo.step = 0
            eventInfo.numNodes = 0
            OpenWindow(WinResConfig.CardPlotTalkWindow.name, nil, false, storyId, eventInfo)
          end
        end
      elseif "abyssHandbook" == prefix then
        local param = cmd_str[2]
        local number = tonumber(param)
        if type(number) == "number" then
          local i_type = ProtoEnum.TUPLE_TYPE.STORY_MONSTER
          local conf = TableData.GetConfig(number, "BaseStoryMonster")
          if not conf then
            i_type = ProtoEnum.TUPLE_TYPE.BGM
            conf = TableData.GetConfig(number, "BaseSound")
          end
          if conf then
            AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.ILLUSTRATION_GET, i_type, number)
          end
        end
      end
    end
  end
}
