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
local Branch_Dialogue = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  local config = story_item.config or story_item.sub_items[1].config
  local parent = gcmp:GetChild("Talk")
  local nameTxt = parent:GetChild("NameTxt")
  local headLoader = parent:GetChild("Head"):GetChild("HeadBg"):GetChild("PicLoader")
  local sub_items = story_item.sub_items
  local mergedlist = parent:GetChild("WordList")
  mergedlist:RemoveChildrenToPool()
  mergedlist.defaultItem = 1 == config.dialogue_site and "ui://Abyss/TalkLeftWord" or "ui://Abyss/TalkRightWord"
  
  function mergedlist.itemRenderer(j, sub_gcmp)
    local sub_item = sub_items[j + 1]
    local wordTxt = sub_gcmp:GetChild("WordTxt")
    local maxWidth = math.floor(0.627 * gcmp.parent.width)
    wordTxt.maxWidth = maxWidth
    wordTxt.text = sub_item.config.remark()
  end
  
  local numItems = #sub_items
  mergedlist.numItems = numItems
  local height = 0
  local numChildren = mergedlist.numChildren
  for j = 0, numChildren - 1 do
    local child = mergedlist:GetChildAt(j)
    height = height + child.height
  end
  height = height + (numChildren - 1) * mergedlist.lineGap
  mergedlist.height = height
  parent.height = height + 50
  gcmp.height = height + 50
  local transName = "up"
  if play_transition then
    if 1 == numItems then
      PlayUITrans(gcmp, transName)
    end
  elseif not IsUITransPlaying(gcmp, transName) then
    PlayUITransToComplete(gcmp, transName)
  end
  headLoader.url = UIUtil.GetResUrl(config.role_head)
  if config.role_head then
    if string.find(config.role_head, "Monster") then
      headLoader:Center()
    else
      headLoader:SetXY(-94, -27)
    end
  end
  nameTxt.text = config.role_name()
end
local Branch_Options = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  local config = story_item.config
  local list = gcmp:GetChild("ChoiceList")
  local itemURL = "ui://Abyss/TalkChoiceBtnAni"
  local record = records and records[record_index + 1]
  local is_selected = type(record) == "number"
  local numOptions = config.option_num or #config.option_next
  local option_des_func = function(j)
    local des
    if type(story_reader.getOptionDes) == "function" then
      des = story_reader.getOptionDes(config, j)
    else
      des = config.option_des[j + 1]
    end
    return des
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
  list.defaultItem = itemURL
  
  function list.itemRenderer(j, option_gcmp)
    local des, next = option_des_func(j), option_next_func(j)
    local btn = option_gcmp:GetChild("TalkChoiceBtn")
    local next_id = tonumber(next)
    local next_conf = TableData.GetConfig(next_id, "BaseStorySimple")
    local next_is_battle = next_conf.type == AbyssExploreStoryItemType.BATTLE
    ChangeUIController(btn, "c1", next_is_battle and 0 or 1)
    if next_is_battle then
      local txt = btn:GetChild("TipsTxt")
      if txt then
        txt.text = T(20068)
      end
    end
    local txt = btn:GetChild("WordTxt")
    txt.text = T(tonumber(des))
    local transName = "up"
    if not is_selected then
      btn.touchable = true
      option_gcmp.touchable = true
      btn.onClick:Set(function()
        list.selectedIndex = j
        for i = 1, list.numItems do
          local child = list:GetChildAt(i - 1)
          local b = child:GetChild("TalkChoiceBtn")
          b.touchable = false
        end
        story_reader.continue(next_id)
      end)
    else
      btn.touchable = false
    end
    if play_transition then
      btn.alpha = 0
      PlayUITrans(option_gcmp, transName, nil, j * 0.08)
    else
      btn.alpha = 1
      if not IsUITransPlaying(option_gcmp, transName) then
        PlayUITransToComplete(option_gcmp, transName)
      end
    end
  end
  
  list.numItems = numOptions
  if is_selected then
    local optionIndex = 0
    for j = 0, numOptions - 1 do
      if tonumber(option_next_func(j)) == record then
        optionIndex = j
        break
      end
    end
    for k = 0, numOptions - 1 do
      local child = list:GetChildAt(k)
      local selected = k == optionIndex
      child.alpha = selected and 1 or 0.35
      child = child:GetChild("TalkChoiceBtn")
      child:GetChild("n6").alpha = selected and 0 or 1
      child:GetChild("n7").alpha = selected and 1 or 0
    end
  else
    for k = 0, numOptions - 1 do
      local child = list:GetChildAt(k)
      child.alpha = 1
      child = child:GetChild("TalkChoiceBtn")
      child:GetChild("n6").alpha = 1
      child:GetChild("n7").alpha = 0
      ChangeUIController(child, "button", 0)
    end
  end
end
local Branch_BattleText = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  local config = story_item.config
  if story_item.type == AbyssExploreStoryItemType.BATTLE and type(config.dialogue_site) == "number" then
    Branch_Dialogue(story_item, gcmp, story_reader, record_index, records, play_transition)
    return
  end
  local subItem = gcmp:GetChild("TalkWordBattle")
  local wordTxt = subItem:GetChild("WordTxt")
  local text
  if type(config.remark) == "function" then
    text = config.remark()
  else
    text = T(20069)
  end
  wordTxt.text = text
  local transName = "up"
  if play_transition then
    PlayUITrans(gcmp, transName)
  elseif not IsUITransPlaying(gcmp, transName) then
    PlayUITransToComplete(gcmp, transName)
  end
end
local Branch_Voiceover = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  local config = story_item.config
  local subItem = gcmp:GetChild("TalkWord")
  local wordTxt = subItem:GetChild("WordTxt")
  wordTxt.text = type(config.remark) == "function" and config.remark() or nil
  gcmp.height = wordTxt.height + 31
  local transName = "up"
  if play_transition then
    PlayUITrans(gcmp, transName)
  elseif not IsUITransPlaying(gcmp, transName) then
    PlayUITransToComplete(gcmp, transName)
  end
end
local Branch_Reward = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  local config = story_item.config
  local str = config.reward[1]
  local splits = Split(str, ":")
  local loader = gcmp:GetChild("PicLoader")
  local wordTxt = gcmp:GetChild("WordTxt")
  local numberTxt = gcmp:GetChild("NumberTxt")
  UIUtil.SetIconById(loader, tonumber(splits[2]))
  numberTxt.text = splits[3]
  wordTxt.text = T(20061)
  local transName = "up"
  if play_transition then
    PlayUITrans(gcmp, transName)
  elseif not IsUITransPlaying(gcmp, transName) then
    PlayUITransToComplete(gcmp, transName)
  end
end
local Branch_Cost = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  local config = story_item.config
  local child = gcmp:GetChild("TalkWord")
  local wordTxt = child:GetChild("WordTxt")
  local transName = "up"
  if play_transition then
    PlayUITrans(gcmp, transName)
  elseif not IsUITransPlaying(gcmp, transName) then
    PlayUITransToComplete(gcmp, transName)
  end
  local str = config.cost[1]
  local splits = Split(str, ":")
  local itemConf = TableData.GetConfig(tonumber(splits[2]), "BaseItem")
  local itemUrl = UIUtil.GetResUrl(itemConf.icon)
  wordTxt.text = string.format("[color=#6ab4ff]%s[/color]%d<img  src='%s'  width='25'  height='25'/>", config.remark(), tonumber(splits[3]), itemUrl)
end
local Branch_Weather = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  local config = story_item.config
  local timeTxt = gcmp:GetChild("TimeTxt")
  local placeTxt = gcmp:GetChild("PlaceTxt")
  local subtitleTxt = gcmp:GetChild("SubtitleTxt")
  if type(config.vibe_des) == "function" then
    timeTxt.text = config.vibe_des()
  else
    timeTxt.text = "未配置"
  end
  if "function" == type(config.vibe_address) then
    placeTxt.text = config.vibe_address()
  else
    placeTxt.text = "未配置"
  end
  subtitleTxt.text = T(20062)
  ChangeUIController(gcmp, "c1", config.weather)
end
local Branch_EndBtn = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  local btn = gcmp:GetChild("TalkEndChoiceBtn")
  btn:GetChild("NameTxt").text = T(20005)
  btn:GetChild("SubtitleTxt").text = T(20008)
  PlayUITrans(gcmp, "up", function()
    btn.onClick:Set(function()
      UIMgr:CloseWindow(WinResConfig.CardPlotTalkWindow.name)
      local callback = story_reader.endcallback
      if callback then
        callback()
      end
    end)
  end)
end
local Building_Dialogue = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  Branch_Dialogue(story_item, gcmp, story_reader, record_index, records, play_transition)
end
local Building_Options = function(story_item, gcmp, story_reader, record_index, records, play_transition)
end
local Building_BattleText = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  local config = story_item.config
  if story_item.type == AbyssExploreStoryItemType.BATTLE and type(config.dialogue_site) == "number" then
    Building_Dialogue(story_item, gcmp, story_reader, record_index, records, play_transition)
    return
  end
  local subItem = gcmp:GetChild("TalkWordBattle")
  local wordTxt = subItem:GetChild("WordTxt")
  local text
  if type(config.remark) == "function" then
    text = config.remark()
  else
    text = T(20069)
  end
  wordTxt.text = text
  local transName = "up"
  if play_transition then
    PlayUITrans(gcmp, transName)
  elseif not IsUITransPlaying(gcmp, transName) then
    PlayUITransToComplete(gcmp, transName)
  end
end
local Building_Voiceover = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  Branch_Voiceover(story_item, gcmp, story_reader, record_index, records, play_transition)
end
local Building_Reward = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  Branch_Reward(story_item, gcmp, story_reader, record_index, records, play_transition)
end
local Building_Cost = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  Branch_Cost(story_item, gcmp, story_reader, record_index, records, play_transition)
end
local Building_Weather = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  Branch_Weather(story_item, gcmp, story_reader, record_index, records, play_transition)
end
local Other_Dialogue = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  local config = story_item.config
  local nameTxt = gcmp:GetChild("NameTxt")
  local wordTxt = gcmp:GetChild("WordTxt")
  local head = gcmp:GetChild("Head")
  local headLoader
  if head then
    local bg = head:GetChild("RandomBHeadBg")
    headLoader = bg:GetChild("PicLoader")
  end
  if headLoader then
    headLoader.url = UIUtil.GetResUrl(config.role_head)
  end
  local name = config.role_name()
  nameTxt.text = 1 == config.dialogue_site and T(20221, name) or T(20222, name)
  wordTxt.text = type(config.remark) == "function" and config.remark() or nil
  local transName = "in"
  if play_transition then
    PlayUITrans(gcmp, transName)
  elseif not IsUITransPlaying(gcmp, transName) then
    PlayUITransToComplete(gcmp, transName)
  end
end
local Other_Options = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  local config = story_item.config
  local list = gcmp:GetChild("ChoiceList")
  local record = records and records[record_index + 1]
  local is_selected = type(record) == "number"
  local numOptions = config.option_num or #config.option_next
  local option_des_func = function(j)
    local des
    if type(story_reader.getOptionDes) == "function" then
      des = story_reader.getOptionDes(config, j)
    else
      des = config.option_des[j + 1]
    end
    return des
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
  list.defaultItem = "ui://Abyss/MoveChoiceAni"
  
  function list.itemRenderer(j, option_gcmp)
    local des, next = option_des_func(j), option_next_func(j)
    local btn = option_gcmp:GetChild("ChoiceBtn")
    local next_conf = TableData.GetConfig(tonumber(next), "BaseStorySimple")
    local is_cost_type = next_conf.type == AbyssExploreStoryItemType.COST
    local is_battle_type = next_conf.type == AbyssExploreStoryItemType.BATTLE
    local is_reward_type = next_conf.reward and _G.next(next_conf.reward)
    ChangeUIController(btn, "c1", is_battle_type and 1 or 0)
    ChangeUIController(btn, "c2", is_cost_type and 1 or 0)
    if is_cost_type then
      local splits = Split(next_conf.cost[1], ":")
      local decorateText = T(20224)
      local numTxt = T(20225, splits[3])
      UIUtil.SetText(btn, numTxt, "ItemTxt")
      UIUtil.SetText(btn, decorateText, "ItemWordTxt")
      local itemLoader = btn:GetChild("ItemLoader")
      UIUtil.SetIconById(itemLoader, tonumber(splits[2]))
    end
    if is_battle_type then
      local txt = btn:GetChild("BattleTxt")
      if txt then
        txt.text = T(20075)
      end
    end
    if not is_cost_type and not is_battle_type and is_reward_type then
      local splits = Split(next_conf.reward[1], ":")
      local decorateText = T(20223)
      local numTxt = T(20225, splits[3])
      UIUtil.SetText(btn, numTxt, "ItemTxt")
      UIUtil.SetText(btn, decorateText, "ItemWordTxt")
      local itemLoader = btn:GetChild("ItemLoader")
      UIUtil.SetIconById(itemLoader, tonumber(splits[2]))
    end
    local txt = btn:GetChild("WordTxt")
    txt.text = T(tonumber(des))
    local transName = "in"
    if not is_selected then
      btn.touchable = true
      option_gcmp.touchable = true
      btn.onClick:Set(function()
        if IsUITransPlaying(option_gcmp, transName) then
          return
        end
        if is_cost_type then
          for _, str in ipairs(next_conf.cost) do
            local splits = Split(str, ":")
            local itemId, itemCnt = tonumber(splits[2]), tonumber(splits[3])
            if itemCnt > ActorData.GetItemCount(itemId) then
              local itemConf = TableData.GetConfig(itemId, "BaseItem")
              FloatTipsUtil.ShowWarnTips(string.format("<img  src='%s'  width='25'  height='25'/>不足%d个无法选择该选项", UIUtil.GetResUrl(itemConf.icon), itemCnt))
              return
            end
          end
        end
        list.selectedIndex = j
        for k = 0, list.numItems - 1 do
          local child = list:GetChildAt(k)
          child.touchable = false
        end
        local next_id = tonumber(next or INVALID_STORY_ID)
        local numItems = list.numItems
        local eff = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_storytalkunder_press_2.prefab")
        local holder = option_gcmp:GetChild("EffectHolder")
        local duration = LuaUtil.GetParticleLength(eff)
        UIUtil.SetObjectToUI(eff, holder)
        LuaUtil.PlayEffect(eff)
        local progress = 0
        local transitionCallback = function()
          progress = progress + 1
          if progress == numItems then
            story_reader.continue(next_id)
          end
        end
        PlayChildrenTransition(list, "out", j, transitionCallback)
        PlayChildrenTransitionExcept(list, "in", j, transitionCallback, 0, true)
      end)
    else
      btn.touchable = false
    end
    if play_transition then
      btn.alpha = 0
      PlayUITrans(option_gcmp, transName, nil, j * 0.08)
    else
      btn.alpha = 1
      if not IsUITransPlaying(option_gcmp, transName) then
        PlayUITransToComplete(option_gcmp, transName)
      end
    end
  end
  
  list:RemoveChildren()
  list.numItems = numOptions
  for k = 0, numOptions - 1 do
    local child = list:GetChildAt(k)
    child = child:GetChild("ChoiceBtn")
    ChangeUIController(child, "button", 0)
  end
end
local Other_BattleText = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  local config = story_item.config
  if story_item.type == AbyssExploreStoryItemType.BATTLE and type(config.dialogue_site) == "number" then
    Other_Dialogue(story_item, gcmp, story_reader, record_index, records, play_transition)
    return
  end
  local wordTxt = gcmp:GetChild("WordTxt")
  if play_transition then
    PlayUITrans(gcmp, "in")
  end
  local text
  if type(config.remark) == "function" then
    text = config.remark()
  else
    text = T(20069)
  end
  wordTxt.text = text
  ChangeUIController(gcmp, "c1", 1)
end
local Other_Voiceover = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  local config = story_item.config
  local wordTxt = gcmp:GetChild("WordTxt")
  wordTxt.text = type(config.remark) == "function" and config.remark() or nil
  ChangeUIController(gcmp, "c1", 0)
  local transName = "in"
  if play_transition then
    PlayUITrans(gcmp, "in")
  elseif not IsUITransPlaying(gcmp, transName) then
    PlayUITransToComplete(gcmp, transName)
  end
end
local Other_Cost = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  local config = story_item.config
  local wordTxt = gcmp:GetChild("WordTxt")
  ChangeUIController(gcmp, "c1", 0)
  if play_transition then
    PlayUITrans(gcmp, "in")
  end
  local str = config.cost[1]
  local splits = Split(str, ":")
  local itemConf = TableData.GetConfig(tonumber(splits[2]), "BaseItem")
  local itemUrl = UIUtil.GetResUrl(itemConf.icon)
  wordTxt.text = string.format("[color=#6ab4ff]%s[/color]%d<img  src='%s'  width='25'  height='25'/>", config.remark(), tonumber(splits[3]), itemUrl)
end
local MovingRandom_Reward = function(story_item, gcmp, story_reader, record_index, records, play_transition)
  local config = story_item.config
  local list = gcmp:GetChild("RewardList")
  local reward = config.reward
  list.defaultItem = "ui://Abyss/MoveReward"
  
  function list.itemRenderer(j, sub_gcmp)
    local splits = Split(reward[j + 1], ":")
    local wordTxt = sub_gcmp:GetChild("WordTxt")
    if wordTxt then
      wordTxt.text = "获得物资"
    end
    local loaderName = "ItemLoader"
    local loader = sub_gcmp:GetChild(loaderName)
    local numberTxt = sub_gcmp:GetChild("NumberTxt")
    UIUtil.SetIconById(loader, tonumber(splits[2]))
    local num = tonumber(splits[3])
    numberTxt.text = num
    ChangeUIController(sub_gcmp, "c1", num > 1 and 1 or 0)
  end
  
  list.numItems = reward and #reward or 0
end
local BranchItemProvider = {
  [AbyssExploreStoryItemType.BATTLE] = "ui://Abyss/TalkWordBattleAni",
  [AbyssExploreStoryItemType.BATTLE_TEXT] = "ui://Abyss/TalkWordBattleAni",
  [AbyssExploreStoryItemType.DIALOGUE] = {
    [1] = "ui://Abyss/TalkLeftAni",
    [2] = "ui://Abyss/TalkRightAni"
  },
  [AbyssExploreStoryItemType.OPTION] = "ui://Abyss/TalkWordChoice",
  [AbyssExploreStoryItemType.VOICEOVER] = "ui://Abyss/TalkWordAni",
  [AbyssExploreStoryItemType.WEATHER] = "ui://Abyss/Weather",
  [AbyssExploreStoryItemType.GAIN] = "ui://Abyss/TalkWordReward",
  [AbyssExploreStoryItemType.SPLITTERS] = "ui://Abyss/TalkLine",
  [AbyssExploreStoryItemType.COST] = "ui://Abyss/TalkWordAni"
}
local MovingRandomItemProvider = {
  [AbyssExploreStoryItemType.BATTLE] = "ui://Abyss/MoveWord",
  [AbyssExploreStoryItemType.BATTLE_TEXT] = "ui://Abyss/MoveWord",
  [AbyssExploreStoryItemType.DIALOGUE] = {
    [1] = "ui://Abyss/MoveLeftWord",
    [2] = "ui://Abyss/MoveRightWord"
  },
  [AbyssExploreStoryItemType.OPTION] = "ui://Abyss/RandomChoiceBtnGroup",
  [AbyssExploreStoryItemType.VOICEOVER] = "ui://Abyss/MoveWord",
  [AbyssExploreStoryItemType.GAIN] = "ui://Abyss/MoveRewardGroup",
  [AbyssExploreStoryItemType.COST] = "ui://Abyss/MoveWord"
}
local BuildingRandomItemProvider = {
  [AbyssExploreStoryItemType.BATTLE] = "ui://Abyss/TalkWordBattleAni",
  [AbyssExploreStoryItemType.BATTLE_TEXT] = "ui://Abyss/TalkWordBattleAni",
  [AbyssExploreStoryItemType.DIALOGUE] = {
    [1] = "ui://Abyss/TalkLeftAni",
    [2] = "ui://Abyss/TalkRightAni"
  },
  [AbyssExploreStoryItemType.OPTION] = "ui://Abyss/TalkWordChoice",
  [AbyssExploreStoryItemType.VOICEOVER] = "ui://Abyss/TalkWordAni",
  [AbyssExploreStoryItemType.WEATHER] = "ui://Abyss/Weather",
  [AbyssExploreStoryItemType.GAIN] = "ui://Abyss/TalkWordReward",
  [AbyssExploreStoryItemType.SPLITTERS] = "ui://Abyss/TalkLine",
  [AbyssExploreStoryItemType.COST] = "ui://Abyss/TalkWordAni"
}
local itemProviders = {
  [AbyssExploreStoryType.Branch] = BranchItemProvider,
  [AbyssExploreStoryType.Random_Moving] = MovingRandomItemProvider,
  [AbyssExploreStoryType.Random_Building] = BuildingRandomItemProvider
}
local itemRenderers = {
  [AbyssExploreStoryType.Branch] = {
    [AbyssExploreStoryItemType.BATTLE_TEXT] = Branch_BattleText,
    [AbyssExploreStoryItemType.DIALOGUE] = Branch_Dialogue,
    [AbyssExploreStoryItemType.OPTION] = Branch_Options,
    [AbyssExploreStoryItemType.VOICEOVER] = Branch_Voiceover,
    [AbyssExploreStoryItemType.BATTLE] = Branch_BattleText,
    [AbyssExploreStoryItemType.WEATHER] = Branch_Weather,
    [AbyssExploreStoryItemType.GAIN] = Branch_Reward,
    [AbyssExploreStoryItemType.COST] = Branch_Cost
  },
  [AbyssExploreStoryType.Random_Moving] = {
    [AbyssExploreStoryItemType.BATTLE_TEXT] = Other_BattleText,
    [AbyssExploreStoryItemType.DIALOGUE] = Other_Dialogue,
    [AbyssExploreStoryItemType.OPTION] = Other_Options,
    [AbyssExploreStoryItemType.VOICEOVER] = Other_Voiceover,
    [AbyssExploreStoryItemType.BATTLE] = Other_BattleText,
    [AbyssExploreStoryItemType.GAIN] = MovingRandom_Reward,
    [AbyssExploreStoryItemType.COST] = Other_Cost
  },
  [AbyssExploreStoryType.Random_Building] = {
    [AbyssExploreStoryItemType.BATTLE_TEXT] = Building_BattleText,
    [AbyssExploreStoryItemType.DIALOGUE] = Building_Dialogue,
    [AbyssExploreStoryItemType.OPTION] = Building_Options,
    [AbyssExploreStoryItemType.VOICEOVER] = Building_Voiceover,
    [AbyssExploreStoryItemType.BATTLE] = Building_BattleText,
    [AbyssExploreStoryItemType.WEATHER] = Building_Weather,
    [AbyssExploreStoryItemType.GAIN] = Building_Reward,
    [AbyssExploreStoryItemType.COST] = Building_Cost
  }
}
local CreateStoryReader = function(storyId, oncontinue, oncomplete, records, uiType)
  local story_items = {}
  local index, progress_cnt, records_len = 1, 0, records and #records or 0
  local story_id, trigger_option, trigger_battle, wait, play_enter_anim = storyId, false, false, 0, true
  local early_complete = uiType == AbyssExploreStoryType.Branch or uiType == AbyssExploreStoryType.Random_Building or uiType == AbyssExploreStoryType.Random_Moving
  local early_trigger_option = uiType == AbyssExploreStoryType.Branch or uiType == AbyssExploreStoryType.Random_Building or uiType == AbyssExploreStoryType.Random_Moving
  local combine_dialogue = uiType == AbyssExploreStoryType.Branch or uiType == AbyssExploreStoryType.Random_Building
  local external_options = uiType == AbyssExploreStoryType.Branch or uiType == AbyssExploreStoryType.Random_Building or uiType == AbyssExploreStoryType.Random_Moving
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
        if last_item.type == AbyssExploreStoryItemType.DIALOGUE and type == AbyssExploreStoryItemType.DIALOGUE then
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
      if flag and type == AbyssExploreStoryItemType.DIALOGUE then
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
      if type == AbyssExploreStoryItemType.DIALOGUE then
        story_item.left_right_flag = storyConf.dialogue_site
      end
      progress_cnt = progress_cnt + 1
      if external_options then
        if story_item.type ~= AbyssExploreStoryItemType.OPTION then
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
      trigger_option = type == AbyssExploreStoryItemType.OPTION and story_item
      trigger_battle = type == AbyssExploreStoryItemType.BATTLE
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
          if oncontinue then
            oncontinue(current_story_id, progress_cnt, story_items, trigger_option, false)
          end
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
          if oncontinue then
            oncontinue(current_story_id, progress_cnt, story_items, trigger_option, true)
          end
          _coroutine = nil
          if not itemRenderers[uiType][AbyssExploreStoryItemType.END_BTN] and oncomplete then
            oncomplete()
            return
          end
        end
      else
        _coroutine = nil
        printError(result)
      end
    end,
    provider = function(i)
      local item = story_items[i + 1]
      if item then
        local provider = itemProviders[uiType]
        if item.type == AbyssExploreStoryItemType.BATTLE then
          local config = item.config
          local left_right_flag = config.dialogue_site
          if type(left_right_flag) == "number" then
            return provider[AbyssExploreStoryItemType.DIALOGUE][left_right_flag]
          end
        end
        if item.left_right_flag then
          return provider[item.type][item.left_right_flag]
        end
        return provider[item.type]
      end
    end,
    renderer = function(i, item)
      local story_index = i + 1
      local story_item = story_items[story_index]
      local record_index = 0
      for j = 1, story_index do
        local o = story_items[j]
        if o.sub_items then
          record_index = record_index + #o.sub_items
        elseif o.type ~= AbyssExploreStoryItemType.SPLITTERS then
          record_index = record_index + 1
        end
      end
      local review = record_index <= records_len
      local item_type = story_item.type
      local renderer = itemRenderers[uiType][item_type]
      if type(renderer) == "function" then
        local is_last_item = #story_items == story_index
        if story_item.sub_items then
          is_last_item = is_last_item and false
        end
        local play_transition = play_enter_anim and not review and is_last_item
        renderer(story_item, item, story_reader, record_index, records, play_transition)
      end
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
local SetExternalOptions = function(story_item, optionList, story_reader, play_transition, item_url, enter_trans_name, selected_trans_name, effect_scale)
  local config = story_item.config
  local itemURL = item_url or "ui://Abyss/TalkChoiceBtnAni"
  local numOptions = config.option_num or #config.option_next
  local option_des_func = function(j)
    local des
    if type(story_reader.getOptionDes) == "function" then
      des = story_reader.getOptionDes(config, j)
    else
      des = config.option_des[j + 1]
    end
    return des
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
  local default_item = string.isEmptyOrNil(item_url)
  optionList.defaultItem = itemURL
  
  function optionList.itemRenderer(j, option_gcmp)
    local des, next = option_des_func(j), option_next_func(j)
    local btn = option_gcmp:GetChild("TalkChoiceBtn") or option_gcmp:GetChild("ChoiceBtn")
    local next_id = tonumber(next)
    local next_conf = TableData.GetConfig(next_id, "BaseStorySimple")
    local is_cost_type = next_conf.type == AbyssExploreStoryItemType.COST
    local is_battle_type = next_conf.type == AbyssExploreStoryItemType.BATTLE
    local is_reward_type = next_conf.reward and _G.next(next_conf.reward)
    ChangeUIController(btn, "c1", is_battle_type and (default_item and 0 or 1) or default_item and 1 or 0)
    ChangeUIController(btn, "c2", is_cost_type and 1 or 0)
    if is_cost_type then
      local splits = Split(next_conf.cost[1], ":")
      local decorateText = T(20224)
      local numTxt = T(20225, splits[3])
      UIUtil.SetText(btn, numTxt, "ItemTxt")
      UIUtil.SetText(btn, decorateText, "ItemWordTxt")
      local itemLoader = btn:GetChild("ItemLoader")
      if itemLoader then
        UIUtil.SetIconById(itemLoader, tonumber(splits[2]))
      end
    end
    if is_battle_type then
      local txt = btn:GetChild("BattleTxt") or btn:GetChild("TipsTxt")
      if txt then
        txt.text = T(20075)
      end
    end
    if not is_cost_type and not is_battle_type and is_reward_type then
      local splits = Split(next_conf.reward[1], ":")
      local decorateText = T(20223)
      local numTxt = T(20225, splits[3])
      UIUtil.SetText(btn, numTxt, "ItemTxt")
      UIUtil.SetText(btn, decorateText, "ItemWordTxt")
      local itemLoader = btn:GetChild("ItemLoader")
      if itemLoader then
        UIUtil.SetIconById(itemLoader, tonumber(splits[2]))
      end
    end
    local txt = btn:GetChild("WordTxt")
    txt.text = T(tonumber(des))
    enter_trans_name = enter_trans_name or "up"
    btn.touchable = true
    option_gcmp.touchable = true
    btn.onClick:Set(function()
      optionList.selectedIndex = j
      local numItems = optionList.numItems
      for i = 1, numItems do
        local child = optionList:GetChildAt(i - 1)
        local b = child:GetChild("TalkChoiceBtn") or child:GetChild("ChoiceBtn")
        if b then
          b.touchable = false
        end
      end
      local holdername = "EffectHolder"
      local holder = option_gcmp:GetChild(holdername)
      if not holder then
        holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
        option_gcmp:AddChild(holder)
        holder.name = holdername
        holder:Center()
      end
      if holder then
        local delay, progress = 0, 0
        local transitionCallback = function()
          progress = progress + 1
          if progress == numItems then
            story_reader.continue(next_id)
          end
        end
        local eff = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_storytalkunder_press_2.prefab")
        local scaleRatio = type(effect_scale) == "number" and effect_scale * 10000 or 10000
        UIUtil.SetObjectToUI(eff, holder, scaleRatio)
        delay = LuaUtil.GetParticleLength(eff)
        LuaUtil.PlayEffect(eff)
        if not selected_trans_name then
          PlayChildrenTransition(optionList, enter_trans_name, j, transitionCallback, delay, true)
        else
          PlayChildrenTransition(optionList, selected_trans_name, j, transitionCallback)
        end
        PlayChildrenTransitionExcept(optionList, enter_trans_name, j, transitionCallback, 0, true)
      end
    end)
    if play_transition then
      btn.alpha = 0
      PlayUITrans(option_gcmp, enter_trans_name, nil, j * 0.08)
    else
      btn.alpha = 1
      if not IsUITransPlaying(option_gcmp, enter_trans_name) then
        PlayUITransToComplete(option_gcmp, enter_trans_name)
      end
    end
  end
  
  local use_filter = false
  for k = 0, optionList.numItems - 1 do
    local child = optionList:GetChildAt(k)
    local btn = child:GetChild("TalkChoiceBtn") or child:GetChild("ChoiceBtn")
    if btn.filter ~= nil then
      use_filter = true
      break
    end
  end
  if use_filter then
    optionList:RemoveChildren(0, -1, true)
    optionList.numItems = numOptions
  else
    optionList.numItems = numOptions
    for k = 0, numOptions - 1 do
      local child = optionList:GetChildAt(k)
      child.alpha = 1
      local btn = child:GetChild("TalkChoiceBtn") or child:GetChild("ChoiceBtn")
      local bg = btn:GetChild("n6")
      if bg then
        bg.alpha = 1
      end
      ChangeUIController(btn, "button", 0)
    end
  end
end
return {CreateStoryReader = CreateStoryReader, SetExternalOptions = SetExternalOptions}
