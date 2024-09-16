local InfoTipsUtil = {}

function InfoTipsUtil.ShowCardTipsWindow(cardInfo, closeCallback, params, sceneType, stageId)
  local id = cardInfo.id or cardInfo.cardId
  local config, isMonster = CardData.GetBaseConfig(id)
  if isMonster then
    if config.transform then
      local transform = Split(config.transform[1], ":")
      local monsterIdList = {
        id,
        tonumber(transform[3])
      }
      OpenWindow(WinResConfig.RageSkillWindow.name, nil, monsterIdList)
    else
      if sceneType == ProtoEnum.SCENE_TYPE.ROGUE then
        params = params or {}
        local themeInfo = RogueData.GetRogueInfo().themeInfo
        local themeConfig = TableData.GetConfig(themeInfo.themeId, "BaseRogueTheme")
        local difficultyConfig = RogueMgr.GetDifficultyData(themeConfig.group_id, themeInfo.curDifficultyLevel)
        params = {
          rogueData = {
            difficultyId = difficultyConfig.id,
            chapterId = themeInfo.chapterId
          },
          stageId = stageId
        }
      end
      OpenWindow(WinResConfig.FormationMonsterTipsWindow.name, nil, cardInfo, closeCallback, params)
    end
  else
    if sceneType == ProtoEnum.SCENE_TYPE.ROGUE then
      params = params or {}
      local rogueCardInfo = RogueGameData.GetCardInfo(cardInfo.cardId)
      local themeInfo = RogueGameData.GetThemeInfo()
      params = {
        rogueAttributes = rogueCardInfo.rogueAttributes,
        rogueData = {
          rogueTalentIds = themeInfo.talentIds
        }
      }
    end
    OpenWindow(WinResConfig.FormationCardTipsWindow.name, nil, cardInfo, closeCallback, params, nil, sceneType)
  end
end

function InfoTipsUtil.ShowBuildingTipsWindow(buildingId, closeCallback, params)
  OpenWindow(WinResConfig.FormationBuildTipsWindow.name, nil, buildingId, closeCallback, params)
end

function InfoTipsUtil.ShowBuffTipsWindow(preBuffIds)
  OpenWindow(WinResConfig.FormationBuffTipsWindow.name, nil, preBuffIds)
end

function InfoTipsUtil.ShowExpeditionBuffTipsWindow(buffId)
  OpenWindow(WinResConfig.FormationExpeditionBuffTipsWindow.name, nil, buffId)
end

function InfoTipsUtil.ShowRestraintTipsWindow()
  OpenWindow(WinResConfig.FormationRestraintTipsWindow.name)
end

function InfoTipsUtil.CloseTips(hand)
  if hand then
    hand:Dispose()
  end
end

return InfoTipsUtil
