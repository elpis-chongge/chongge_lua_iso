BossDungeonMgr = {lastStageId = nil}

function BossDungeonMgr.OpenWindow(type, chapterId)
  AdventureService.GetChapterStageReq(chapterId, function()
    BossDungeonMgr.lastStageId = nil
    if type == ProtoEnum.SCENE_TYPE.BOSS_FIRE then
      OpenWindow(WinResConfig.BossDungeonFireWindow.name, nil, chapterId)
    elseif type == ProtoEnum.SCENE_TYPE.BOSS_WATER then
      OpenWindow(WinResConfig.BossDungeonWaterWindow.name, nil, chapterId)
    elseif type == ProtoEnum.SCENE_TYPE.BOSS_WOOD then
      OpenWindow(WinResConfig.BossDungeonWoodWindow.name, nil, chapterId)
    end
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ABYSS_GUIDE_BOSS_CHALLENGE, 1)
  end)
end

function BossDungeonMgr.OpenBossBattleWindow(chapterId)
  local chapterData = TableData.GetConfig(chapterId, "BaseChapter")
  BossDungeonMgr.lastStageId = nil
  local chapterInfo = AdventureData.GetSceneChapter(chapterId)
  BossDungeonMgr.stageOpenProgress = chapterInfo and chapterInfo.stageOpenProgress or 0
  if chapterData and chapterData.type then
    if chapterData.type == ProtoEnum.SCENE_TYPE.BOSS_FIRE then
      OpenWindow(WinResConfig.BossBattleFireWindow.name, nil, chapterId)
    elseif chapterData.type == ProtoEnum.SCENE_TYPE.BOSS_WATER then
      OpenWindow(WinResConfig.BossBattleWaterWindow.name, nil, chapterId)
    elseif chapterData.type == ProtoEnum.SCENE_TYPE.BOSS_WOOD then
      OpenWindow(WinResConfig.BossBattleWoodWindow.name, nil, chapterId)
    end
  end
end

function BossDungeonMgr.GetJumpChapterId(type, stageId)
  local stageDate = TableData.GetConfig(stageId, "BaseStage")
  if stageDate and stageDate.chapter_id then
    return stageDate.chapter_id
  end
end

function BossDungeonMgr.SufficientQuantity(stageCost)
  if stageCost then
    local tb = GetConfigItemList(stageCost, true)
    for i, v in pairs(tb) do
      if ActorData.GetItemCount(v.id) < v.value then
        if v.id == COMMON_ITEM_ID.ENERGY then
          ld("Energy", function()
            EnergyService.GetEnergyRecoverInfoReq()
          end)
          return false
        else
          local itemData = TableData.GetConfig(v.id, "BaseItem")
          if itemData then
            FloatTipsUtil.ShowWarnTips(T(230, itemData.name()))
          end
        end
        return false
      end
    end
  end
  return true
end

function BossDungeonMgr.GetBadgeIdByRewardShow(rewardShow)
  if rewardShow then
    local arr, badgeType
    for i = 1, #rewardShow do
      arr = Split(rewardShow[i], ":")
      if 4 == #arr then
        badgeType = tonumber(arr[2])
        if badgeType == ProtoEnum.TUPLE_TYPE.BADGE then
          return tonumber(arr[3])
        end
      end
    end
  end
end

function BossDungeonMgr.InitAssetsTips(list, tipsData)
  if list.numItems > 0 then
    for i = 1, list.numItems do
      list:RemoveChildAt(0, true)
    end
  end
  for i = 1, #tipsData do
    local item
    local count = ActorData.GetItemCount(tipsData[i])
    item = UIMgr:CreateComponent("CommonResource", "AssetsTips")
    item:GetChild("AssetsBtn").onClick:Set(function()
      UIUtil.ClickAssetItem(tipsData[i])
    end)
    if tipsData[i] == COMMON_ITEM_ID.ENERGY then
      local maxEnergy = ActorData.GetEnergyMax()
      UIUtil.SetText(item, T(1142, count, maxEnergy), "NumberTxt")
    else
      UIUtil.SetText(item, UIUtil.GetFormatCount(count), "NumberTxt")
    end
    UIUtil.SetIconById(item:GetChild("IconLoader"), tipsData[i])
    list:AddChild(item)
  end
end
