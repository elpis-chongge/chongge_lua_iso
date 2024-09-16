local EnterClampUtil = {
  needGetFromServer = {}
}
local lastLv = 0

function EnterClampUtil.WhetherToEnter(id, floatTips, level)
  if nil == level and ActorData.GetFeatureIsUnlock(id) then
    return true
  end
  local data = TableData.GetConfig(id, "BaseFeature")
  if data then
    local lv = data.level or -1
    if nil == level then
      level = ActorData.GetLevel()
    end
    if level then
      if lv <= level then
        if data.stageId then
          local isPass = AdventureData.IsStagePassed(data.stageId)
          if false == isPass then
            if nil == floatTips or true == floatTips then
              FloatTipsUtil.ShowWarnTips(data.unlock_des())
            end
            return false
          end
        end
        if data.quality then
          local open = CardData.CanOpenBadge(data.quality)
          if false == open then
            if nil == floatTips or true == floatTips then
              FloatTipsUtil.ShowWarnTips(data.unlock_des())
            end
            return false
          end
        end
        return true
      elseif nil == floatTips or true == floatTips then
        FloatTipsUtil.ShowWarnTips(data.unlock_des())
      end
    end
  else
    print("功能ID " .. id .. " 未配置")
  end
  return false
end

function EnterClampUtil.Init()
  local tempServer = {}
  local tempLocal = {}
  local open = {}
  local data = TableData.GetTable("BaseFeature")
  local lv = ActorData.GetLevel()
  lastLv = lv
  for i, v in pairs(data) do
    if v.stageId ~= nil then
      table.insert(tempServer, v.id)
    elseif nil ~= v.level then
      table.insert(tempLocal, v.id)
      if v.level and lv >= v.level then
        table.insert(open, v.id)
      end
    end
  end
  EnterClampUtil.needGetFromServer = tempServer
  ActorData.SaveOpenFeature({featureIds = tempLocal, openFeatureIds = open})
  if #tempServer > 0 then
    EnterClampUtil.CheckUnlockInfoFromServer()
    return true
  end
end

function EnterClampUtil.CheckUnlockInfoFromServer()
  local temp = EnterClampUtil.needGetFromServer
  if temp and #temp > 0 then
    ActorService.CheckFeatureOpenReq(temp)
  end
end

function EnterClampUtil.RemoveNeedGetInfoList(id)
  local temp = EnterClampUtil.needGetFromServer
  for i, v in ipairs(temp) do
    if v == id then
      table.remove(temp, i)
      return
    end
  end
end

function EnterClampUtil.CheckBackHome(stageId)
  EnterClampUtil.CheckNewFeature(stageId)
  local level = ActorData.GetLevel()
  local data = TableData.GetTable("BaseGuideProcess")
  for i, v in pairs(data) do
    if GuideData.GuideIsTrigger(v.id) and v.level and v.level == level and v.stage and ActorData.GetFeatureIsUnlock(v.stage) then
      return true
    end
  end
  return false
end

function EnterClampUtil.CheckNewFeature(stageId)
  local featureId, level
  local data = TableData.GetTable("BaseFeature")
  local lv = ActorData.GetLevel()
  for i, v in pairs(data) do
    if not ActorData.GetFeatureIsUnlock(v.id) and v.level and lv >= v.level then
      if v.stageId ~= nil then
        if stageId and stageId == v.stageId then
          featureId = v.id
          ActorData.UpdateOpenFeature({
            v.id
          })
        end
      else
        level = ActorData.GetLevel()
        ActorData.UpdateOpenFeature({
          v.id
        })
      end
    end
  end
  return featureId, level
end

function EnterClampUtil.UpdateEntranceState(id, callback)
  local enable = EnterClampUtil.WhetherToEnter(id, false)
  if callback then
    callback(enable)
  end
end

function EnterClampUtil.TestBadgeCondition(level, stageId)
  local selfLevel = ActorData.GetLevel()
  if level and level > selfLevel then
    return false
  end
  if stageId then
    ld("Adventure", function()
      local sceneData = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
      local newestChapter = sceneData.currentChapter
      local stageConfig = TableData.GetConfig(stageId, "BaseStage")
      if newestChapter < stageConfig.chapter_id then
        return false
      elseif newestChapter == stageConfig.chapter_id and 0 ~= sceneData.currentStage and sceneData.currentStage <= stageId then
        return false
      end
    end)
  end
  return true
end

function EnterClampUtil.Clear()
  EnterClampUtil.needGetFromServer = {}
end

return EnterClampUtil
