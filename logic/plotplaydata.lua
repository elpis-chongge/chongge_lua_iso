PlotPlayData = {
  finishedPlotList = {},
  isAutoPlay = false,
  autoPlayWaitTime = 0.5
}
local curPartId, curSectionId, curDialogId
local isAuto = false
local partEndCallback = false
local curPartState, fixedPartIds
PLOT_PLAY_STATE = {
  NONE = 0,
  PLAYING = 1,
  END = 2
}
PLOT_PLAY_TYPE = {
  NONE = 0,
  MAIN_LINE = 1,
  GUIDE = 2,
  ACTIVE = 3
}

function PlotPlayData.InitData()
  curPartId = nil
  curSectionId = nil
  curDialogId = nil
  isAuto = false
  partEndCallback = nil
  curPartState = nil
  fixedPartIds = nil
end

PLOT_BG_IN_EFFECT = {
  NONE = {
    "直接出现",
    "0"
  },
  MASK = {
    "黑屏出现",
    "1"
  },
  MASK_LEFT = {
    "黑屏出现左->右",
    "2"
  },
  MASK_RIGHT = {
    "黑屏出现右->左",
    "3"
  }
}
PLOT_BG_OUT_EFFECT = {
  NONE = {
    "直接消失",
    "0"
  },
  MASK = {
    "黑屏消失",
    "1"
  },
  FADE = {
    "透明消失",
    "2"
  },
  MASK_LEFT = {
    "黑屏消失左->右",
    "3"
  },
  MASK_RIGHT = {
    "黑屏消失右->左",
    "4"
  }
}
PLOT_EFFECT_IN_ENUM = {
  NONE = {"无", "0"},
  FADE = {"淡入", "1"},
  FROM_LEFT = {
    "从左侧进入",
    "2"
  },
  FROM_RIGHT = {
    "从右侧进入",
    "3"
  }
}
PLOT_EFFECT_OUT_ENUM = {
  NONE = {"无", "0"},
  FADE = {"淡出", "1"},
  OUT_LEFT = {
    "从左侧移出",
    "2"
  },
  OUT_RIGHT = {
    "从右侧移出",
    "3"
  },
  IMMEDIATELY = {
    "直接消失",
    "4"
  }
}
PLOT_CAMERA_MOVE_ENUM = {
  NONE = {"无", "0"},
  FROM_LEFT = {"左->右", "1"},
  FROM_RIGHT = {"右->左", "2"}
}
PLOT_CAMERA_SCALE_ENUM = {
  NONE = {"无", "0"},
  TO_NEAR = {"远->近", "1"},
  TO_FAR = {"近->远", "2"}
}
PLOT_CAMERA_SHAKE_ENUM = {
  NONE = {"无", "0"},
  INTENSITY1 = {"强度1", "1"},
  INTENSITY2 = {"强度2", "2"},
  INTENSITY3 = {"强度3", "3"},
  INTENSITY4 = {"强度4", "4"},
  INTENSITY5 = {"强度5", "5"}
}
PLOT_ROLE_SHAKE_ENUM = {
  NONE = {"无", "0"},
  INTENSITY1 = {"强度1", "1"},
  INTENSITY2 = {"强度2", "2"},
  INTENSITY3 = {"强度3", "3"},
  INTENSITY4 = {"强度4", "4"},
  INTENSITY5 = {"强度5", "5"}
}
PLOT_ROLE_EFFECT_ENUM = {
  NONE = {"无", "0"}
}
PLOT_CARD_LIGHT_ENUM = {YES = "1", NO = "0"}
PLOT_SPEAK_ROLE_ENUM = {YES = "1", NO = "0"}
PLOT_IS_MASTER_ENUM = {YES = "1", NO = "0"}
PLOT_IS_OS_ENUM = {YES = "1", NO = "0"}

function PlotPlayData.SetCurPartId(partId)
  curPartId = partId
end

function PlotPlayData.GetCurPartId()
  return curPartId
end

function PlotPlayData.SetCurSectionId(sectionId)
  curSectionId = sectionId
end

function PlotPlayData.GetCurSectionId()
  return curSectionId
end

function PlotPlayData.SetCurDialogId(dialogId)
  curDialogId = dialogId
end

function PlotPlayData.GetCurDialogId()
  return curDialogId
end

function PlotPlayData.SetIsAuto(isAuto)
end

function PlotPlayData.GetIsAuto()
  return isAuto
end

function PlotPlayData.SetPartEndCallback(callback)
  partEndCallback = callback
end

function PlotPlayData.GetPartEndCallback()
  return partEndCallback
end

function PlotPlayData.SetCurPartState(state)
  curPartState = state
end

function PlotPlayData.GetCurPartState()
  return curPartState
end

function PlotPlayData.SetFixedPartIds(ids)
  fixedPartIds = ids
end

function PlotPlayData.GetFixedPartIds()
  return fixedPartIds
end

function PlotPlayData.GetNextDialogId()
  if curDialogId then
    local dialogConfig = TableData.GetConfig(curDialogId, "BasePlotDialog")
    if dialogConfig then
      return dialogConfig.next_dialog
    end
  elseif curSectionId then
    return PlotPlayData.GetFirstDialogInSection(curSectionId)
  elseif curPartId then
    return PlotPlayData.GetFirstDialogInPart(curPartId)
  end
end

function PlotPlayData.GetNextSectionId()
  local partConfig = TableData.GetConfig(curPartId, "BasePlotPart")
  if curSectionId then
    local sectionIds = partConfig.section_ids
    local findCurSection = false
    for i, v in ipairs(sectionIds) do
      if v == curSectionId then
        findCurSection = true
      elseif findCurSection then
        return v
      end
    end
    return nil
  else
    return partConfig.section_ids[1]
  end
end

function PlotPlayData.GetDialogs(fromPart, toSection, toDialog, list)
  local partConfig = TableData.GetConfig(fromPart, "BasePlotPart")
  local sectionIds = partConfig.section_ids
  if sectionIds then
    local maxIndex
    for i, v in ipairs(sectionIds) do
      if v == toSection then
        maxIndex = i
        break
      end
    end
    if maxIndex then
      for i = 1, maxIndex do
        local sectionId = sectionIds[i]
        PlotPlayData.GetDialogsInSection(sectionId, toDialog, list)
      end
    end
  end
end

function PlotPlayData.GetDialogsInSection(fromSection, toDialog, list)
  local sectionConfig = TableData.GetConfig(fromSection, "BasePlotSection")
  local dialogIds = sectionConfig.dialog_ids
  for _, dialogId in ipairs(dialogIds) do
    local lastDialog = list[#list]
    local curDialogConfig = TableData.GetConfig(dialogId, "BasePlotDialog")
    if 1 == curDialogConfig.is_master then
      if lastDialog and 1 == lastDialog.is_master then
        table.insert(lastDialog.dialogConfigs, curDialogConfig)
      else
        table.insert(list, {
          dialogConfigs = {curDialogConfig},
          isMaster = 1,
          url = "ui://PlotPlay/OwnReviewWordTalk"
        })
      end
    else
      local roleIds = curDialogConfig.role_ids
      local speakRoles = curDialogConfig.speak_role
      local speakRoleIds = {}
      if roleIds then
        for index, roleId in ipairs(roleIds) do
          if 1 == speakRoles[index] then
            table.insert(speakRoleIds, roleId)
          end
        end
      end
      if #speakRoleIds > 0 then
        if 1 == #speakRoleIds then
          if lastDialog and lastDialog.speakRoleId == speakRoleIds[1] then
            table.insert(lastDialog.dialogConfigs, curDialogConfig)
          else
            table.insert(list, {
              dialogConfigs = {curDialogConfig},
              speakRoleId = speakRoleIds[1],
              url = "ui://PlotPlay/ReviewTalk"
            })
          end
        else
          table.insert(list, {
            dialogConfigs = {curDialogConfig},
            speakRoleIds = speakRoleIds,
            url = "ui://PlotPlay/ReviewTalk"
          })
        end
      else
        local isVoiceOut = true
        if curDialogConfig.speak_head then
          local headActions = curDialogConfig.speak_head_actions
          if headActions and table.contain(headActions, "talk") then
            isVoiceOut = false
            if lastDialog and lastDialog.speakHeadId == curDialogConfig.speak_head then
              table.insert(lastDialog.dialogConfigs, curDialogConfig)
            else
              table.insert(list, {
                dialogConfigs = {curDialogConfig},
                speakHeadId = curDialogConfig.speak_head,
                url = "ui://PlotPlay/ReviewTalk"
              })
            end
          end
        end
        if true == isVoiceOut then
          if curDialogConfig.speak_name and curDialogConfig.review_head then
            if lastDialog and lastDialog.reviewHead == curDialogConfig.review_head then
              table.insert(lastDialog.dialogConfigs, curDialogConfig)
            else
              table.insert(list, {
                dialogConfigs = {curDialogConfig},
                reviewHead = curDialogConfig.review_head,
                url = "ui://PlotPlay/ReviewTalk"
              })
            end
          elseif lastDialog and 1 == lastDialog.isNarrator then
            table.insert(lastDialog.dialogConfigs, curDialogConfig)
          else
            table.insert(list, {
              dialogConfigs = {curDialogConfig},
              isNarrator = 1,
              url = "ui://PlotPlay/NarratorWordTalk"
            })
          end
        end
      end
    end
    if dialogId == toDialog then
      return
    end
  end
end

function PlotPlayData.GetFirstDialogInPart(partId)
  if nil == partId then
    return
  end
  local partConfig = TableData.GetConfig(partId, "BasePlotPart")
  if partConfig.section_ids then
    return PlotPlayData.GetFirstDialogInSection(partConfig.section_ids[1])
  end
end

function PlotPlayData.GetFirstDialogInSection(sectionId)
  if nil == sectionId then
    return
  end
  local sectionConfig = TableData.GetConfig(sectionId, "BasePlotSection")
  return sectionConfig.dialog_ids and sectionConfig.dialog_ids[1]
end

function PlotPlayData.GetStartPosition(targetPosition, enterEffect, enterEffectParam)
  local startPosition
  if enterEffect == PLOT_EFFECT_IN_ENUM.FADE[2] then
    startPosition = targetPosition
  elseif enterEffect == PLOT_EFFECT_IN_ENUM.FROM_LEFT[2] then
    startPosition = Vector3(targetPosition.x - tonumber(enterEffectParam), targetPosition.y, 0)
  elseif enterEffect == PLOT_EFFECT_IN_ENUM.FROM_RIGHT[2] then
    startPosition = Vector3(targetPosition.x + tonumber(enterEffectParam), targetPosition.y, 0)
  else
    startPosition = targetPosition
  end
  return startPosition
end

function PlotPlayData.GetEndPosition(basePosition, outEffect, outEffectParam)
  local endPosition
  if outEffect == PLOT_EFFECT_OUT_ENUM.FADE[2] then
    endPosition = basePosition
  elseif outEffect == PLOT_EFFECT_OUT_ENUM.OUT_LEFT[2] then
    endPosition = Vector3(basePosition.x - tonumber(outEffectParam), basePosition.y, 0)
  elseif outEffect == PLOT_EFFECT_OUT_ENUM.OUT_RIGHT[2] then
    endPosition = Vector3(basePosition.x + tonumber(outEffectParam), basePosition.y, 0)
  else
    endPosition = basePosition
  end
  return endPosition
end

function PlotPlayData.ClearData()
  PlotPlayData.InitData()
end

function PlotPlayData.IsPlotFinished(partId)
  if nil == partId then
    return false
  end
  local len = #PlotPlayData.finishedPlotList
  if 0 == len then
    return false
  end
  local finishedPlotList = PlotPlayData.finishedPlotList
  for i = 1, len do
    if finishedPlotList[i] == partId then
      return true
    end
  end
  return false
end

function PlotPlayData.UpdateFinishedPlot(finishedPlotList)
  PlotPlayData.finishedPlotList = finishedPlotList
end

function PlotPlayData.InsertFinishedPlot(plotId)
  if plotId > 0 then
    table.insert(PlotPlayData.finishedPlotList, plotId)
  end
end

function PlotPlayData.GetCurPartRewardDialogs(skipToSectionId)
  local dialogs = {}
  if curPartId and curDialogId then
    local partConfig = TableData.GetConfig(curPartId, "BasePlotPart")
    local sectionIds = partConfig.section_ids
    if sectionIds then
      local findDialog = false
      for i, sectionId in ipairs(sectionIds) do
        if sectionId == skipToSectionId then
          break
        end
        local sectionConfig = TableData.GetConfig(sectionId, "BasePlotSection")
        local dialog_ids = sectionConfig.dialog_ids
        if dialog_ids then
          for _, dialog_id in ipairs(dialog_ids) do
            if dialog_id == curDialogId then
              findDialog = true
            end
            if findDialog then
              local config = TableData.GetConfig(dialog_id, "BasePlotReward")
              if config then
                table.insert(dialogs, dialog_id)
              end
            end
          end
        end
      end
    end
  end
  return dialogs
end

function PlotPlayData.GetSoundPath(soundName, subPath)
  local _, p_first = string.find(soundName, "_")
  local _, p_last = string.find(soundName, ".*_")
  if nil == p_first or nil == p_last then
    return
  end
  local roleName = string.sub(soundName, 1, p_first - 1)
  local eventPath = string.format("event:/voice_%s/%s/%s/%s", Language.curLanguage, roleName, subPath or "sty", soundName)
  local bankPath = string.format("voice_%s/%s/%s", Language.curLanguage, subPath or "sty", roleName)
  return eventPath, bankPath
end
