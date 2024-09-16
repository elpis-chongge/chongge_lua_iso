local INVALID_STORY_ID = -1
local StoryCoroutine = function(storyId)
  local story_id = tonumber(storyId or INVALID_STORY_ID)
  while type(story_id) == "number" and story_id > 0 do
    local storyData = TableData.GetConfig(story_id, "BaseStorySimple") or nil
    story_id = coroutine.yield(storyData)
  end
end
local PlayChildrenTransition = function(list, transition, specialIndex, callback, delay, reverse)
  delay = type(delay) == "number" and delay or 0
  local numItems = list.numItems
  for i = 0, numItems - 1 do
    local child = list:GetChildAt(i)
    if type(specialIndex) == "number" then
      if specialIndex == i then
        PlayUITrans(child, transition, callback, delay, 1, nil, nil, nil, reverse)
      end
    else
      PlayUITrans(child, transition, callback, delay, 1, nil, nil, nil, reverse)
    end
  end
end
local PlayChildrenTransitionExcept = function(list, transition, except, callback, delay, reverse)
  delay = type(delay) == "number" and delay or 0
  local numItems = list.numItems
  for i = 0, numItems - 1 do
    local child = list:GetChildAt(i)
    if type(except) == "number" and except ~= i then
      PlayUITrans(child, transition, callback, delay, 1, nil, nil, nil, reverse)
    end
  end
end
local OptionsRenderer = function(story_item, gcmp, story_reader, record_index, records, play_transition, trigger_event)
  local config = story_item.config
  local optionlist = gcmp:GetChild("OptionList")
end
local DialogueRenderer = function(story_item, gcmp, story_reader, record_index, records, play_transition, trigger_event)
  local config = story_item.config
  local container = gcmp:GetChild("Word")
  local wordTxt = container:GetChild("WordTxt")
  local content
  if trigger_event and type(config.special_remark) == "function" then
    content = config.special_remark()
  else
    content = "function" == type(config.remark) and config.remark() or nil
  end
  wordTxt.text = content
end
local itemProvider = {
  [RogueGameStoryItemType.BATTLE_TEXT] = "ui://RogueBuild01/PlotEvent_Word",
  [RogueGameStoryItemType.DIALOGUE] = "ui://RogueBuild01/PlotEvent_Word",
  [RogueGameStoryItemType.OPTION] = "ui://RogueBuild01/PlotEvent_OptionAni",
  [RogueGameStoryItemType.VOICEOVER] = "ui://RogueBuild01/PlotEvent_Word"
}
local itemRenderer = {
  [RogueGameStoryItemType.BATTLE_TEXT] = DialogueRenderer,
  [RogueGameStoryItemType.DIALOGUE] = DialogueRenderer,
  [RogueGameStoryItemType.VOICEOVER] = DialogueRenderer
}
local CreateStoryReader = function(storyId, oncontinue, oncomplete, records, uiType)
  local story_items = {}
  local index, progress_cnt, records_len = 1, 0, records and #records or 0
  local story_id, trigger_option, trigger_battle, wait, play_enter_anim = storyId, false, false, 0, true
  local early_complete = true
  local early_trigger_option = false
  local combine_dialogue = false
  local external_options = true
  local _coroutine = coroutine.create(StoryCoroutine)
  local story_reader, onyield
  
  function onyield(storyConf)
    local id = storyConf.id
    local type = storyConf.type
    local story_item = {
      id = id,
      type = type,
      config = storyConf
    }
    local flag = true
    if combine_dialogue then
      local last_index = #story_items
      if last_index > 0 then
        local last_item = story_items[last_index]
        if last_item.type == RogueGameStoryItemType.DIALOGUE and type == RogueGameStoryItemType.DIALOGUE then
          local config = last_item.config or last_item.sub_items[1].config
          local last_name = config.role_name()
          local cur_name = storyConf.role_name()
          if last_name == cur_name then
            flag = false
            local item = story_items[#story_items]
            table.insert(item.sub_items, story_item)
            progress_cnt = progress_cnt + 1
          end
        end
      end
      if flag and type == RogueGameStoryItemType.DIALOGUE then
        flag = false
        table.insert(story_items, {
          id = id,
          type = type,
          left_right_flag = storyConf.dialogue_site,
          sub_items = {
            [1] = story_item
          }
        })
        progress_cnt = progress_cnt + 1
      end
    end
    if flag then
      if type == RogueGameStoryItemType.DIALOGUE then
        story_item.left_right_flag = storyConf.dialogue_site
      end
      progress_cnt = progress_cnt + 1
      if external_options then
        if story_item.type ~= RogueGameStoryItemType.OPTION then
          table.insert(story_items, story_item)
        end
      else
        table.insert(story_items, story_item)
      end
    end
    index = index + 1
    local review = index <= records_len
    if review then
      story_id = records[index]
    else
      trigger_option = type == RogueGameStoryItemType.OPTION and story_item
      trigger_battle = type == RogueGameStoryItemType.BATTLE
      if trigger_battle and records and table.contain(records, id) then
        trigger_battle = false
      end
      if not trigger_option and not trigger_battle then
        story_id = tonumber(storyConf.next or INVALID_STORY_ID)
      end
    end
  end
  
  story_reader = {
    continue = function(next_id)
      if not _coroutine then
        return
      end
      if wait > 0 then
        return
      end
      if trigger_option then
        if type(next_id) ~= "number" then
          return
        end
        story_id = next_id
        trigger_option = false
      elseif trigger_battle then
        if type(next_id) ~= "number" then
          return
        end
        story_id = next_id
        trigger_battle = false
      end
      local current_story_id = story_id
      local status, result = coroutine.resume(_coroutine, story_id)
      if status then
        local is_complete = false
        if result then
          onyield(result)
          if early_complete and not result.next and not result.option_next then
            is_complete = true
          elseif early_trigger_option and not trigger_option and result.next then
            local nextConf = TableData.GetConfig(result.next, "BaseStorySimple")
            if nextConf and nextConf.option_next then
              local selected = false
              if records then
                for _, option_id in pairs(nextConf.option_next) do
                  if table.contain(records, tonumber(option_id)) then
                    selected = true
                    break
                  end
                end
              end
              if not selected then
                story_reader.continue(result.next)
              end
            end
          end
        else
          is_complete = true
        end
        if is_complete then
          _coroutine = nil
          if not itemRenderer[RogueGameStoryItemType.END_BTN] and oncomplete then
            oncomplete()
            return
          end
        end
        if oncontinue then
          oncontinue(current_story_id, progress_cnt, story_items, trigger_option, is_complete)
        end
      else
        _coroutine = nil
        printError(result)
      end
    end,
    provider = function(i)
      local item = story_items[i + 1]
      if item then
        local provider = itemProvider
        if item.type == RogueGameStoryItemType.BATTLE then
          local config = item.config
          local left_right_flag = config.dialogue_site
          if type(left_right_flag) == "number" then
            return provider[RogueGameStoryItemType.DIALOGUE][left_right_flag]
          end
        end
        if item.left_right_flag then
          return provider[item.type][item.left_right_flag]
        end
        return provider[item.type]
      end
    end,
    renderer = function(i, item, trigger_event)
      local story_index = i + 1
      local story_item = story_items[story_index]
      local record_index = 0
      for j = 1, story_index do
        local o = story_items[j]
        if o.sub_items then
          record_index = record_index + #o.sub_items
        elseif o.type ~= RogueGameStoryItemType.SPLITTERS then
          record_index = record_index + 1
        end
      end
      local review = record_index <= records_len
      local item_type = story_item.type
      local renderer = itemRenderer[item_type]
      if type(renderer) == "function" then
        local is_last_item = #story_items == story_index
        if story_item.sub_items then
          is_last_item = is_last_item and false
        end
        local play_transition = play_enter_anim and not review and is_last_item
        renderer(story_item, item, story_reader, record_index, records, play_transition, trigger_event)
      end
      return story_item, item
    end,
    numItems = function()
      return #story_items
    end,
    getItem = function(i)
      return story_items[i]
    end,
    wait = function(val)
      if val then
        wait = wait + 1
      else
        wait = wait - 1
      end
    end,
    setplayanim = function(play)
      play_enter_anim = play
    end,
    release = function()
      _coroutine = nil
      story_items = nil
    end,
    iscomplete = function()
      return not _coroutine
    end,
    endcallback = oncomplete
  }
  return story_reader
end
local OptionIsSelectable = function(conf)
  local selectable = true
  if type(conf.option_condition) == "string" then
    local splits = Split(conf.option_condition, "|")
    local optionType = tonumber(splits[1])
    if optionType == RogueGameStoryOptionType.ANY_HP_REDUCE_PERC_N then
      local val = tonumber(splits[2])
      selectable = false
      local cardInfoList = RogueGameData.GetCardInfoList()
      for _, v in pairs(cardInfoList) do
        local info = v.info
        local attrMap = info.attributes
        local hp = attrMap[CardAttribute.GetIdByName(ATTR_ENUM.hp)]
        local max_hp = attrMap[CardAttribute.GetIdByName(ATTR_ENUM.max_hp)]
        if hp / max_hp >= math.abs(val / 10000) then
          selectable = true
          break
        end
      end
    elseif optionType == RogueGameStoryOptionType.ALL_HP_REDUCE_PERC_N then
      local val = tonumber(splits[2])
      selectable = true
      local cardInfoList = RogueGameData.GetCardInfoList()
      for _, v in pairs(cardInfoList) do
        local info = v.info
        local attrMap = info.attributes
        local hp = attrMap[CardAttribute.GetIdByName(ATTR_ENUM.hp)]
        local max_hp = attrMap[CardAttribute.GetIdByName(ATTR_ENUM.max_hp)]
        if hp > 0 and hp / max_hp < math.abs(val / 10000) then
          selectable = false
          break
        end
      end
    elseif optionType == RogueGameStoryOptionType.CONSUME_ITEM then
      selectable = true
      for k = 2, #splits do
        local subsplits = Split(splits[k], ":")
        local itemId, count = tonumber(subsplits[2]), tonumber(subsplits[3])
        local ownedCount = ActorData.GetItemCount(itemId)
        if count > ownedCount then
          selectable = false
          break
        end
      end
    end
  end
  return selectable
end
local SetExternalOptions = function(story_item, optionList, story_reader, play_transition, item_url, enter_trans_name, selected_index)
  local config = story_item.config
  local itemURL = item_url or "ui://Abyss/TalkChoiceBtnAni"
  local numOptions = #config.option_next
  local option_des_func = function(j)
    local des
    if type(story_reader.getOptionDes) == "function" then
      des = story_reader.getOptionDes(config, j)
    else
      des = config.option_des and config.option_des[j + 1] or 0
    end
    return des
  end
  local option_title_func = function(j)
    local title
    if type(story_reader.getOptionDes) == "function" then
      title = story_reader.getOptionTitle(config, j)
    else
      title = config.option_title and config.option_title[j + 1] or 0
    end
    return title
  end
  local option_next_func = function(j)
    local next
    if type(story_reader.getOptionNext) == "function" then
      next = story_reader.getOptionNext(config, j)
    else
      next = config.option_next[j + 1]
    end
    return next
  end
  optionList.defaultItem = itemURL
  
  function optionList.itemRenderer(j, gcmp)
    local title, des, next = option_title_func(j), option_des_func(j), option_next_func(j)
    local option_gcmp = gcmp:GetChild("Option")
    local next_id = tonumber(next)
    local next_conf = TableData.GetConfig(next_id, "BaseStorySimple")
    local selectable = OptionIsSelectable(next_conf)
    UIUtil.SetText(option_gcmp, T(tonumber(title)), "TitleTxt")
    local show_treasure_id = next_conf.show_treasure_id
    local TOKENS_SIGN, POINT_SIGN = "$tokens$", "$point$"
    local map
    if next_conf.reward_option then
      for _, v in ipairs(next_conf.reward_option) do
        local splits = Split(v, ":")
        local rewardConf = TableData.GetConfig(tonumber(splits[1]), "BaseRogueNodeReward")
        if rewardConf then
          local rwd_type = rewardConf.type
          if 2 == rwd_type then
            map = map or {}
            map[TOKENS_SIGN] = tonumber(rewardConf.parameter)
          elseif 3 == rwd_type then
            map = map or {}
            map[POINT_SIGN] = tonumber(rewardConf.parameter)
          end
        end
      end
    elseif next_conf.reward then
      local themeInfo = RogueGameData.GetThemeInfo()
      local themeConf = TableData.GetConfig(themeInfo.themeId, "BaseRogueTheme")
      for i, v in ipairs(next_conf.reward) do
        local splits = Split(v, ":")
        local itemId = tonumber(splits[2])
        if itemId == themeConf.tokens_item then
          map = map or {}
          map[TOKENS_SIGN] = tonumber(splits[3])
        elseif itemId == themeConf.point_item then
          map = map or {}
          map[POINT_SIGN] = tonumber(splits[3])
        end
      end
    end
    if 0 == des then
      UIUtil.SetText(option_gcmp, "", "WordTxt")
    else
      local content = T(tonumber(des))
      local rogueNode = RogueGameData.GetChapterInfo().curNode
      if map and map[TOKENS_SIGN] then
        local percent = rogueNode.tokenAddPercent / 10000
        local val = math.floor(map[TOKENS_SIGN] * (1 + percent))
        content = string.gsub(content, "%$tokens%$", tostring(val))
      end
      if map and map[POINT_SIGN] then
        local percent = rogueNode.attribPointAddPercent / 10000
        local val = math.floor(map[POINT_SIGN] * (1 + percent))
        content = string.gsub(content, "%$point%$", tostring(val))
      end
      UIUtil.SetText(option_gcmp, content, "WordTxt")
    end
    if type(show_treasure_id) == "number" then
      ChangeUIController(option_gcmp, "c1", 2)
      local lookBtn = option_gcmp:GetChild("LookBtn")
      lookBtn.onClick:Set(function(context)
        context:StopPropagation()
        OpenWindow(WinResConfig.RogueGameItemTipsWindow.name, nil, show_treasure_id, nil, true)
      end)
    else
      ChangeUIController(option_gcmp, "c1", 0)
    end
    enter_trans_name = enter_trans_name or "up"
    local ensureBtn = option_gcmp:GetChild("ChoiceBtn")
    local ensureBtnText = T(20464)
    ChangeUIController(gcmp, "choice", 0)
    UIUtil.SetText(ensureBtn, ensureBtnText, "WordTxt")
    ChangeUIController(option_gcmp, "c2", not selectable and 1 or 0)
    ensureBtn.onClick:Set(function(context)
      if not selectable then
        return
      end
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_right_tab_in")
      story_reader.continue(next_id)
      context:StopPropagation()
    end)
    option_gcmp.onClick:Set(function()
      if not selectable then
        return
      end
      if type(selected_index) == "number" and selected_index - 1 ~= j then
        return
      end
      if IsUITransPlaying(gcmp, enter_trans_name) then
        return
      end
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_right_tab_select")
      optionList.selectedIndex = j
      local numItems = optionList.numItems
      for i = 1, numItems do
        local index = i - 1
        local child = optionList:GetChildAt(index)
        ChangeUIController(child, "choice", index == j and 1 or 0)
      end
    end)
  end
  
  optionList.numItems = numOptions
  if play_transition then
    for i = 1, optionList.numItems do
      local child = optionList:GetChildAt(i - 1)
      local option = child:GetChild("Option")
      local delay = (i - 1) * 0.08
      TimerUtil.setTimeout(delay, function()
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_right_tab_show")
      end)
      option.alpha = 0
      if type(selected_index) == "number" then
        if selected_index == i then
          LeanTween.delayedCall(delay, function()
            if option and not option.isDisposed then
              option.alpha = 1
            end
            if optionList and not optionList.isDisposed then
              optionList.selectedIndex = selected_index - 1
            end
            if child and not child.isDisposed then
              ChangeUIController(child, "choice", 1)
            end
          end)
        else
          PlayUITrans(child, enter_trans_name, nil, delay)
          ChangeUIController(child, "choice", 0)
        end
        ChangeUIController(option, "c2", i ~= selected_index and 1 or 0)
      else
        PlayUITrans(child, enter_trans_name, nil, delay)
      end
    end
  end
end
return {CreateStoryReader = CreateStoryReader, SetExternalOptions = SetExternalOptions}
