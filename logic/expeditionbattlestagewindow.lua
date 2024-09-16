require("Expedition_BattleStageWindowByName")
local ExpeditionBattleStageWindow = {}
local uis, contentPane
local maxBuffNum = 4
local trans_intvl = 0.04
local bgEffect, bgTimeline, bgTree_Go, bgTree_animator, tree_Objs, RefreshStagePanel, EnterStagePanel, ReverseTransition, RefreshPanelState, RefreshBuffEnsurePanel, RefreshBuffRecordPanel, RefreshBuffPagePanel, RefreshBuffChoicePanel, buffComponents, buffClickEffects, originPos, tweenTimer
local transitions = {
  [1] = "fang",
  [2] = "jin",
  [3] = "tu",
  [4] = "fa",
  [5] = "gong"
}
local perPageNumBuffs = 3

function RefreshBuffPagePanel(expedData, type, shortlist)
  local panel = uis.Main.BuffChoice.BuffChoice.BuffContent
  local effectRoot = panel.EffectHolder.displayObject.gameObject.transform
  buffComponents = buffComponents or {
    [1] = {
      skill = panel.Skill1,
      word = panel.Word1,
      eff = LuaUtil.FindChild(effectRoot, "buff_lianxian1", true).gameObject
    },
    [2] = {
      skill = panel.Skill2,
      word = panel.Word2,
      eff = LuaUtil.FindChild(effectRoot, "buff_lianxian3", true).gameObject
    },
    [3] = {
      skill = panel.Skill3,
      word = panel.Word3,
      eff = LuaUtil.FindChild(effectRoot, "buff_lianxian2", true).gameObject
    }
  }
  buffClickEffects = buffClickEffects or {}
  for i = 1, perPageNumBuffs do
    LeanTween.cancel(buffComponents[i].eff)
  end
  local busy = true
  for i = 1, perPageNumBuffs do
    buffComponents[i].word.root.visible = true
    buffComponents[i].skill.root.visible = true
    LuaUtil.SetAlpha(buffComponents[i].eff, 0, true)
  end
  local occup = panel.OccupationPic.root
  occup.scale = Vector2.one
  occup.position = originPos
  local duration = PlayUITrans(panel.root, "up", function()
    busy = false
  end).totalDuration
  for i = 1, perPageNumBuffs do
    LeanTween.alpha(buffComponents[i].eff, 1, 1.1 * duration)
  end
  local iconlist = uis.Main.BuffChoice.BuffChoice.OccupationProgressBtn:GetChild("OccupationList")
  for i = 1, perPageNumBuffs do
    local word = buffComponents[i].word
    local skill = buffComponents[i].skill
    local conf = TableData.GetConfig(shortlist[i], "BaseSkillBuffPre")
    word.WordTxt.text = conf.des()
    word.TitleTxt.text = conf.name()
    local loader = skill.PicLoader
    local holder = skill.PicHolder
    holder.pivot = Vector2(0.5, 0.5)
    loader.url = UIUtil.GetResUrl(conf.icon)
    local path = string.format("Assets/Art/Effects/Prefab/UI_prefab/Expedition/FX_ui_expedition_buff_icon%s.prefab", i)
    skill.root.onClick:Set(function()
      if busy then
        return
      end
      for i = 1, 3 do
        LeanTween.cancel(buffComponents[i].eff)
      end
      busy = true
      if not buffClickEffects[i] then
        local eff = ResourceManager.Instantiate(path)
        UIUtil.SetObjectToUI(eff, holder, 16000)
        eff.transform.localPosition = Vector3.zero
        buffClickEffects[i] = eff
      end
      duration = LuaUtil.GetParticleLength(buffClickEffects[i])
      LuaUtil.PlayEffect(buffClickEffects[i])
      local num = ExpeditionMgr.KeepBuff(type, shortlist[i])
      if num >= maxBuffNum then
        ExpeditionMgr.KeepSelectedBuffs()
      end
      local child = iconlist:GetChildAt(num - 1)
      for j = 1, perPageNumBuffs do
        if j ~= i then
          buffComponents[j].word.root.visible = false
          buffComponents[j].skill.root.visible = false
          LeanTween.alpha(buffComponents[j].eff, 0, 0)
        end
      end
      LeanTween.alpha(buffComponents[i].eff, 0, duration * 0.5)
      local endCallback = function()
        local eff = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Expedition/FX_ui_expetion_buff_choose.prefab")
        local tmpHolder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
        tmpHolder:SetSize(child.width, child.height)
        tmpHolder.pivot = Vector2(0.5, 0.5)
        child:AddChild(tmpHolder)
        tmpHolder:SetXY(0, 0)
        UIUtil.SetObjectToUI(eff, tmpHolder)
        local length = LuaUtil.GetParticleLength(eff) * 0.1
        LuaUtil.PlayEffect(eff)
        ChangeUIController(child, "c2", 1)
        local delay = num == maxBuffNum and 0.6 or 0.5
        tweenTimer = TimerUtil.setTimeout(length + delay, function()
          tweenTimer = nil
          local next = num + 1
          if next > maxBuffNum then
            local bufflist = ExpeditionData.GetCurBufflist()
            if #bufflist < maxBuffNum then
              RefreshPanelState()
              return
            end
            ChangeUIController(uis.Main.root, "c1", 2)
            RefreshBuffEnsurePanel(expedData, bufflist)
          else
            RefreshBuffChoicePanel(expedData, next)
          end
        end)
      end
      PlayUITrans(panel.root, transitions[type], function()
        local parent = uis.Main.BuffChoice.BuffChoice.BuffContent.root
        local targetPosition = child:TransformPoint(Vector2(child.width * 0.5, child.height * 0.5), parent)
        local wh = Vector2(occup.width * 0.5, occup.height * 0.5)
        targetPosition = targetPosition - wh
        local elapse, fading = 0, false
        buffComponents[i].word.root:TweenFade(0, 0.15)
        buffComponents[i].skill.root:TweenFade(0, 0.15)
        occup:TweenScale(Vector2.zero, 0.35):OnUpdate(function()
          elapse = elapse + Time.deltaTime
          local normalizeTime = CS.FairyGUI.EaseManager.Evaluate(FairyGUI.EaseType.QuadIn, elapse, 0.5)
          occup.xy = Vector2.Lerp(occup.xy, targetPosition, normalizeTime)
          if not fading and elapse > 0.18 then
            occup:TweenFade(0, 0.15):SetEase(FairyGUI.EaseType.Linear)
            fading = true
          end
        end):OnComplete(endCallback):SetEase(FairyGUI.EaseType.QuadIn)
      end, duration * 0.4, 1, 0, 0.35)
    end)
  end
end

function RefreshBuffChoicePanel(expedData, buffIndex)
  local buffPool = expedData.buffPool
  local choice = uis.Main.BuffChoice.BuffChoice
  local list = choice.OccupationProgressBtn:GetChild("OccupationList")
  list.defaultItem = "ui://Expedition/Occupation"
  
  function list.itemRenderer(i, gcmp)
    local index = i + 1
    local poolItem = buffPool[index]
    ChangeUIController(gcmp, "c1", poolItem.bType - 1)
    ChangeUIController(gcmp, "c2", index < buffIndex and 1 or 0)
  end
  
  list.numItems = #buffPool
  local poolItem = buffPool[buffIndex]
  ChangeUIController(choice.BuffContent.OccupationPic.root, "c1", poolItem.bType - 1)
  RefreshBuffPagePanel(expedData, poolItem.bType, poolItem.buffs)
end

local playing = false
local stageEntrance_eff_boss = "Assets/Art/Effects/Prefab/UI_prefab/Expedition/FX_ui_expedition_icon_boss.prefab"
local stageEntrance_eff_normal = "Assets/Art/Effects/Prefab/UI_prefab/Expedition/FX_ui_expedition_icon_normal.prefab"
local stageEntrance_eff_complete = "Assets/Art/Effects/Prefab/UI_prefab/Expedition/FX_ui_expedition_icon_end.prefab"
local lastChapterIndex
local UpdateRefreshTimeInfo = function(refreshTimestamp)
  local dateTxt = TimeUtil.FormatDate("%Y/%m/%d %H:%M", refreshTimestamp)
  local diff = refreshTimestamp - LoginData.GetCurServerTime()
  local remainTxt = T(10218, TimeUtil.FormatTime(diff))
  local panel = uis.Main.Battle
  panel.BattleTitle.Time1Txt.text = dateTxt
  panel.BattleTitle.Time2Txt.text = remainTxt
end

function RefreshStagePanel(expedData, chapterIndex, play)
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.ExpeditionBattleStageWindow.name)
  local animator = bgTree_animator
  local panel = uis.Main.Battle
  bgTree_Go:SetActive(true)
  for i = 1, 5 do
    tree_Objs[i]:SetActive(i == chapterIndex)
  end
  local curChapterIndex = ExpeditionMgr.GetLatestChapterIndex()
  if type(lastChapterIndex) == "number" then
    play = play or false
  end
  lastChapterIndex = curChapterIndex
  local anim_len = 0
  if play then
    animator:SetTrigger("Display")
    anim_len = 0.667
    panel.BattleTitle.root:TweenFade(1, anim_len)
    panel.GiveUpBtn:TweenFade(1, anim_len)
    panel.RewardBtn:TweenFade(1, anim_len)
    panel.BuffLookBtn:TweenFade(1, anim_len)
    panel.Storey.root:TweenFade(1, anim_len)
  else
    animator:Play("FX_ui_expedition_tree_show", 0, 1)
    panel.BattleTitle.root.alpha = 1
    panel.GiveUpBtn.alpha = 1
    panel.RewardBtn.alpha = 1
    panel.BuffLookBtn.alpha = 1
    panel.Storey.root.alpha = 1
  end
  local curStage = expedData.curStage
  local chapters = expedData.chapters
  local stageIndex = -1
  local chapter = chapters[chapterIndex].chapterId
  local conf = TableData.GetConfig(chapter, "BaseChapter")
  local contains, index = table.contain(conf.stages, curStage)
  if contains then
    stageIndex = index
  end
  local nameTitle = conf.name()
  panel.BattleTitle.NameTxt.text = nameTitle
  UpdateRefreshTimeInfo(expedData.nextRefreshStamp)
  local maplist = panel.MapList
  maplist:RemoveChildrenToPool()
  local defaultItem = "ui://Expedition/Map" .. tostring(chapterIndex)
  maplist.defaultItem = defaultItem
  local chapterIsCleared = chapterIndex < curChapterIndex
  
  function maplist.itemRenderer(i, gcmp)
    local stages = conf.stages
    local numStages = #stages
    local cnt = 0
    for j = 1, numStages do
      local stageId = stages[j]
      local unlock = chapterIsCleared or stageIndex > 0 and j <= stageIndex
      local available = chapterIndex == curChapterIndex and j == stageIndex
      local stageEntrance = gcmp:GetChild("Tips" .. tostring(j))
      local subItem = stageEntrance:GetChild("MapTipsBtn")
      local loader = subItem:GetChild("PicLoader")
      local holder = subItem:GetChild("PicHolder")
      local path = not (not unlock or available) and stageEntrance_eff_complete or j == numStages and stageEntrance_eff_boss or stageEntrance_eff_normal
      local eff = ResourceManager.Instantiate(path)
      holder.pivot = Vector2(0.5, 0.5)
      UIUtil.SetObjectToUI(eff, holder)
      eff.transform.localPosition = Vector3.zero
      if play then
        LuaUtil.PlayEffect(eff)
      else
        LuaUtil.PlayEffectAtTime(eff, 3)
      end
      ChangeUIController(subItem, "c1", j - 1)
      if not unlock then
        ChangeUIController(subItem, "c3", 0)
      else
        ChangeUIController(subItem, "c3", ExpeditionMgr.IsNewStage(stageId) and 1 or 2)
      end
      if play then
        subItem.alpha = 0
        PlayUITrans(stageEntrance, "in", function()
          cnt = cnt + 1
          if cnt >= numStages then
            playing = false
          end
        end, anim_len + (j - 1) * 0.08)
      end
      subItem.onClick:Set(function()
        if unlock then
          if available then
            ExpeditionMgr.KeepStage(stageId)
            ExpeditionMgr.PrepareEnterBattle(stageId)
          else
            FloatTipsUtil.ShowWarnTips(T(10219))
          end
        else
          FloatTipsUtil.ShowWarnTips(T(10220))
        end
      end)
    end
  end
  
  maplist.numItems = 1
  local play_switch_anim = function(callback)
    local child = maplist:GetChildAt(0)
    for i = 0, 3 do
      local item = child:GetChildAt(i)
      PlayUITrans(item, "Switch", callback, nil, 1, 0, 0.75)
    end
  end
  local dotlist = panel.Storey.DotList
  dotlist.defaultItem = "ui://Expedition/StoreyDot"
  
  function dotlist.itemRenderer(i, gcmp)
    local cnt = 0
    local selectIndex = i + 1 < curChapterIndex and 0 or i + 1 > curChapterIndex and 2 or 1
    ChangeUIController(gcmp, "c1", selectIndex)
    gcmp:GetChild("NumberTxt").text = string.format("0[size=22]%d[/size]", i + 1)
    gcmp.onClick:Set(function()
      if playing then
        return
      end
      if i + 1 == chapterIndex then
        return
      end
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.SLIDE_NUMBER_CHANGE)
      playing = true
      animator:SetTrigger("Dissolve")
      panel.BattleTitle.root:TweenFade(0, anim_len)
      panel.GiveUpBtn:TweenFade(0, anim_len)
      panel.RewardBtn:TweenFade(0, anim_len)
      panel.BuffLookBtn:TweenFade(0, anim_len)
      panel.Storey.root:TweenFade(0, anim_len)
      play_switch_anim(function()
        cnt = cnt + 1
        if cnt >= maplist.numItems then
          RefreshStagePanel(expedData, i + 1, true)
        end
      end)
    end)
  end
  
  dotlist.numItems = #chapters
end

function EnterStagePanel(expedData, chapterIndex, play)
  local duration = bgTimeline.duration
  local panel = uis.Main.Battle
  panel.BattleTitle.root.alpha = 0
  panel.GiveUpBtn.alpha = 0
  panel.RewardBtn.alpha = 0
  panel.BuffLookBtn.alpha = 0
  panel.Storey.root.alpha = 0
  if play then
    bgTimeline.time = 0
    bgTimeline:Play()
    TimerUtil.setTimeout(duration * 0.1, function()
      RefreshStagePanel(expedData, chapterIndex, true)
    end)
  else
    bgTimeline.time = duration
    bgTimeline:Evaluate()
    RefreshStagePanel(expedData, chapterIndex, false)
  end
end

function ReverseTransition(list, transition, callback)
  local numItems = list.numItems
  local completeCnt = 0
  for i = 0, numItems - 1 do
    local child = list:GetChildAt(i)
    PlayUITrans(child, transition, function()
      completeCnt = completeCnt + 1
      if completeCnt >= numItems and callback then
        callback()
      end
    end, (numItems - 1 - i) * trans_intvl, 1, nil, nil, false, true)
  end
end

function RefreshBuffEnsurePanel(expedData, bufflist)
  local list = uis.Main.BuffEndConfirm.SkillList
  list.defaultItem = "ui://Expedition/SkillTipsAni"
  
  function list.itemRenderer(i, gcmp)
    local subItem = gcmp:GetChild("SkillTips")
    subItem.alpha = 0
    PlayUITrans(gcmp, "up", nil, i * trans_intvl)
    local item = bufflist[i + 1]
    local buffId = item.id
    local conf = TableData.GetConfig(buffId, "BaseSkillBuffPre")
    local nameTxt = subItem:GetChild("NameTxt")
    local wordList = subItem:GetChild("WordList")
    
    function wordList.itemRenderer(_, _gcmp)
      local wordTxt = _gcmp:GetChild("WordTxt")
      wordTxt.text = conf.des()
    end
    
    wordList.numItems = 1
    nameTxt.text = conf.name()
    local loader = subItem:GetChild("PicLoader")
    loader.url = UIUtil.GetResUrl(conf.icon)
    local occup = subItem:GetChild("Occupation")
    ChangeUIController(occup, "c1", item.type - 1)
    ChangeUIController(subItem, "c1", 1)
  end
  
  list.numItems = bufflist and #bufflist or 0
  local busy = false
  uis.Main.BuffEndConfirm.SureBtn.onClick:Set(function()
    if busy then
      return
    end
    busy = true
    uis.Main.BuffEndConfirm.SureBtn:TweenFade(0, 0.2)
    ReverseTransition(list, "up", function()
      ChangeUIController(uis.Main.root, "c1", 3)
      EnterStagePanel(expedData, ExpeditionMgr.GetLatestChapterIndex(), true)
    end)
  end)
end

local enterStageAfterEnsure

function RefreshBuffRecordPanel(expedData, bufflist)
  local panel = uis.Main.BuffBeginConfirm
  local list = panel.SkillList
  list.defaultItem = "ui://Expedition/SkillTipsAni"
  
  function list.itemRenderer(i, gcmp)
    local subItem = gcmp:GetChild("SkillTips")
    subItem.alpha = 0
    PlayUITrans(gcmp, "up", nil, i * 0.04)
    local nameTxt = subItem:GetChild("NameTxt")
    local wordList = subItem:GetChild("WordList")
    local item = bufflist[i + 1]
    local buffId = item.id
    local conf = TableData.GetConfig(buffId, "BaseSkillBuffPre")
    
    function wordList.itemRenderer(_, _gcmp)
      local wordTxt = _gcmp:GetChild("WordTxt")
      wordTxt.text = conf.des()
    end
    
    wordList.numItems = 1
    nameTxt.text = conf.name()
    local loader = subItem:GetChild("PicLoader")
    loader.url = UIUtil.GetResUrl(conf.icon)
    ChangeUIController(subItem, "c1", 1)
    local occup = subItem:GetChild("Occupation")
    ChangeUIController(occup, "c1", item.type - 1)
  end
  
  list.numItems = #bufflist
  local busy = false
  panel.CancelBtn.onClick:Set(function()
    if busy then
      return
    end
    busy = true
    panel.SureBtn:TweenFade(0, 0.2)
    panel.CancelBtn:TweenFade(0, 0.2)
    ReverseTransition(list, "up", function()
      ChangeUIController(uis.Main.root, "c1", 1)
      RefreshBuffChoicePanel(expedData, 1)
    end)
  end)
  panel.SureBtn.onClick:Set(function()
    if busy then
      return
    end
    busy = true
    enterStageAfterEnsure = true
    panel.SureBtn:TweenFade(0, 0.2)
    panel.CancelBtn:TweenFade(0, 0.2)
    ReverseTransition(list, "up", function()
      ExpeditionMgr.ClearBuffRecords()
      for k, v in pairs(expedData.lastBuffs) do
        ExpeditionMgr.KeepBuff(k, v)
      end
      ExpeditionMgr.KeepSelectedBuffs()
    end)
  end)
end

function RefreshPanelState()
  local expedData = ExpeditionData.GetData()
  uis.Main.BuffBeginConfirm.root.visible = false
  ChangeUIController(uis.Main.root, "c1", 3)
  local play = true
  if ExpeditionMgr.restart_timeline_animator ~= nil then
    play = ExpeditionMgr.restart_timeline_animator
    ExpeditionMgr.restart_timeline_animator = true
  end
  EnterStagePanel(expedData, ExpeditionMgr.GetLatestChapterIndex(), play)
end

local InitRedDotData = function()
  RedDotMgr.AddNode({
    windowName = WinResConfig.ExpeditionBattleStageWindow.name,
    com = uis.Main.Battle.RewardBtn,
    visibleFunc = function()
      return RedDotExped.HasAnyRewards()
    end,
    dataType = RED_DOT_DATA_TYPE.EXPED
  })
end

function ExpeditionBattleStageWindow.ReInitData()
end

local refreshTimer
local StartCheckRefreshTimer = function()
  if refreshTimer then
    refreshTimer:stop()
  end
  local nextRefreshStamp = ExpeditionData.GetData().nextRefreshStamp
  local count = math.ceil(nextRefreshStamp - LoginData.GetCurServerTime())
  if count > 0 then
    refreshTimer = TimerUtil.new(1, count, function()
      if LoginData.GetCurServerTime() > nextRefreshStamp then
        ExpeditionService.GetExpeditionInfoReq()
        refreshTimer:stop()
        return
      end
      UpdateRefreshTimeInfo(nextRefreshStamp)
    end)
    refreshTimer:start()
  else
    ExpeditionService.GetExpeditionInfoReq()
  end
end
local jumpTb

function ExpeditionBattleStageWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExpeditionBattleStageWindow.package, WinResConfig.ExpeditionBattleStageWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExpedition_BattleStageWindowUis(contentPane)
    jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ExpeditionBattleStageWindow.name, uis.Main.Battle.CurrencyReturn)
    ExpeditionService.GetExpeditionInfoReq(function(msg)
      if ExpeditionMgr.data_refresh then
        return
      end
      local expedData = ExpeditionData.GetData()
      local isClearedThisTime = -1 == expedData.curStage
      if isClearedThisTime then
        local ownStates = expedData.ownStates
        local chapterIndex, stageIndex = ExpeditionMgr.GetClearedChapterIndex()
        local snapshot = {
          chapterIndex = chapterIndex,
          stageIndex = stageIndex,
          cardStates = ownStates
        }
        OpenWindow(WinResConfig.ExpeditionEndWindow.name, nil, snapshot)
        return
      else
        ExpeditionBattleStageWindow.UpdateInfo()
        ExpeditionBattleStageWindow.InitBtn()
      end
    end)
  end)
end

function ExpeditionBattleStageWindow.UpdateInfo()
  enterStageAfterEnsure = false
  InitRedDotData()
  bgEffect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Expedition/FX_ui_expedition.prefab")
  bgEffect.transform.position = Vector3(1000, 1000, 0)
  local effectRoot = bgEffect.transform
  bgTree_Go = LuaUtil.FindChild(effectRoot, "Tree", true).gameObject
  bgTree_animator = bgTree_Go:GetComponent(typeof(CS.UnityEngine.Animator))
  bgTree_Go:SetActive(false)
  tree_Objs = {}
  for i = 1, 5 do
    local child = LuaUtil.FindChild(effectRoot, string.format("expedition_tree%s", i), true)
    tree_Objs[i] = child.gameObject
  end
  local go = LuaUtil.FindChild(effectRoot, "timeline", true)
  local director = go:GetComponent(typeof(CS.UnityEngine.Playables.PlayableDirector))
  director.time = 0
  director:Evaluate()
  director:Stop()
  bgTimeline = director
  local eff = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Expedition/FX_ui_expedition_buff_eff.prefab")
  local effHolder = uis.Main.BuffChoice.BuffChoice.BuffContent.EffectHolder
  UIUtil.SetObjectToUI(eff, effHolder, 10000)
  local giveupBtnTitle = T(20039)
  local deadlineTips = T(20042)
  local commonTitle = T(20043)
  uis.Main.Battle.BattleTitle.TitleTxt.text = deadlineTips
  uis.Main.BuffChoice.BuffChoice.CommonTitle.WordTxt.text = commonTitle
  UIUtil.SetBtnText(uis.Main.BuffEndConfirm.SureBtn, T(20037), T(20038))
  UIUtil.SetBtnText(uis.Main.Battle.GiveUpBtn, giveupBtnTitle)
  local panel = uis.Main.BuffBeginConfirm
  local title = T(20057)
  local tipsTitle = T(20044)
  local cancelBtnTitle = T(10052)
  local cancelBtnSubtitle = T(10053)
  local sureBtnTitle = T(302)
  local sureBtnSubtitle = T(303)
  panel.TipsTxt.text = tipsTitle
  panel.CommonTitle.WordTxt.text = T(20053)
  UIUtil.SetBtnText(panel.CancelBtn, cancelBtnTitle, cancelBtnSubtitle)
  UIUtil.SetBtnText(panel.SureBtn, sureBtnTitle, sureBtnSubtitle)
  panel = uis.Main.BuffEndConfirm
  panel.CommonTitle.WordTxt.text = title
  local occup = uis.Main.BuffChoice.BuffChoice.BuffContent.OccupationPic.root
  originPos = occup.position
  RefreshPanelState()
  StartCheckRefreshTimer()
end

function ExpeditionBattleStageWindow.InitBtn()
  local choice = uis.Main.BuffChoice.BuffChoice
  choice.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ExpeditionBattleStageWindow.name)
  end)
  choice.OccupationProgressBtn.onClick:Set(function()
    OpenWindow(WinResConfig.ExpeditionBattleBuffLookWindow.name)
  end)
  local battle = uis.Main.Battle
  battle.GiveUpBtn.onClick:Set(function()
    ExpeditionMgr.ResetChallenge(true)
  end)
  battle.RewardBtn.onClick:Set(function()
    OpenWindow(WinResConfig.ExpeditionRewardWindow.name)
  end)
  battle.BuffLookBtn.onClick:Set(function()
    OpenWindow(WinResConfig.ExpeditionBattleBuffLookWindow.name)
  end)
end

function ExpeditionBattleStageWindow.OnShown()
  if uis then
    RedDotMgr.UpdateNodeByWindowName(WinResConfig.ExpeditionBattleStageWindow.name)
  end
end

function ExpeditionBattleStageWindow.OnClose()
  uis = nil
  contentPane = nil
  buffComponents = nil
  buffClickEffects = nil
  if bgEffect then
    ResourceManager.DestroyGameObject(bgEffect)
  end
  bgEffect = nil
  bgTimeline = nil
  bgTree_Go = nil
  bgTree_animator = nil
  tree_Objs = nil
  if tweenTimer then
    tweenTimer:stop()
    tweenTimer = nil
  end
  if refreshTimer then
    refreshTimer:stop()
  end
  refreshTimer = nil
  if jumpTb then
    jumpTb.Close()
  end
  jumpTb = nil
end

function ExpeditionBattleStageWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.ExpeditionBattleStageWindow.REFRESH_BUFF_LIST then
    local expedData = ExpeditionData.GetData()
    local bufflist = ExpeditionData.GetCurBufflist()
    local len = #bufflist
    if len < maxBuffNum then
      RefreshBuffChoicePanel(expedData, len + 1)
    elseif enterStageAfterEnsure then
      ChangeUIController(uis.Main.root, "c1", 3)
      EnterStagePanel(expedData, ExpeditionMgr.GetLatestChapterIndex(), true)
    end
  elseif msgId == WindowMsgEnum.ExpeditionBattleStageWindow.REFRESH_STAGE_LIST then
    RefreshStagePanel(ExpeditionData.GetData(), ExpeditionMgr.GetLatestChapterIndex(), para)
  end
end

return ExpeditionBattleStageWindow
