GuideData = {}
GUIDE_STEP_TYPE_ENUM = {
  HIDE_GUIDE_WINDOW = 0,
  NORMAL = 1,
  SHOW_TIPS = 2,
  SKILL_HINT = 3,
  GIRD = 4,
  NOT_CHANGE_LAYER = 5,
  LV_BACK = 6,
  PLOT_STAGE = 7,
  PLOT_GUIDE = 8,
  LISTEN_COMPLETE = 9
}

function GuideData.GuideIsEnd(guideId, stepKey)
  local info = ActorData.GetGuideInfo()
  for i, v in pairs(info) do
    if v.guideId == guideId then
      local listen_complete_func
      local stepData = TableData.GetConfig(stepKey, "BaseGuideStep")
      if stepData then
        listen_complete_func = stepData.listen_complete_func
      end
      if table.contain(v.steps, stepKey) or listen_complete_func and true == listen_complete_func() then
        return true
      end
    end
  end
  return false
end

function GuideData.GuideIsTrigger(guideId)
  local info = ActorData.GetGuideInfo()
  for i, v in pairs(info) do
    if v.guideId == guideId then
      return true
    end
  end
  return false
end

function GuideData.GetLastKey(guideProcessData)
  local key = 0
  for i = 1, 10 do
    if guideProcessData["key" .. i] then
      key = guideProcessData["key" .. i]
    else
      break
    end
  end
  return key
end

function GuideData.GetGuideIdByWindowId()
  local tb = {}
  local config = TableData.GetTable("BaseGuideProcess")
  for i, v in pairs(config) do
    if not GuideData.GuideIsEnd(v.id, GuideData.GetLastKey(v)) then
      table.insert(tb, v)
    end
  end
  return tb
end

local captionOpen = {}

function GuideData.InitCaptionOpenData()
  local str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.GUIDE_CAPTION_OPEN)
  if "" ~= str then
    captionOpen = Json.decode(str)
  end
end

function GuideData.SaveCaptionOpen(featureId)
  if not table.contain(captionOpen, featureId) then
    table.insert(captionOpen, featureId)
    local str = Json.encode(captionOpen)
    PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.GUIDE_CAPTION_OPEN, str)
  end
end

function GuideData.CanShowCaption(featureId)
  return not table.contain(captionOpen, featureId)
end

function GuideData.ClearData()
  captionOpen = {}
end
