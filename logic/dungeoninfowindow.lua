require("DungeonInfo_DungeonInfoWindowByName")
local DungeonInfoWindow = {}
local uis, stageData, paramInfo, contentPane, collection, lastBtn, isInitMonster, itemDrops, numBol, closeFunc

function DungeonInfoWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.DungeonInfoWindow.package, WinResConfig.DungeonInfoWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetDungeonInfo_DungeonInfoWindowUis(contentPane)
    collection = uis.Main.DungeonInfoTips.CollectionRegion
    paramInfo = bridgeObj.argTable[1]
    closeFunc = bridgeObj.argTable[2]
    DungeonInfoWindow.InitShow()
  end)
end

function DungeonInfoWindow.InitShow()
  stageData = TableData.GetConfig(paramInfo.stageId, "BaseStage")
  if paramInfo.stageId == nil or nil == stageData then
    DungeonInfoWindow.CloseWindow()
    return
  end
  isInitMonster = false
  DungeonInfoWindow.UpdateTextDisplay()
  numBol = nil
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_SKILL_IN)
  DungeonInfoWindow.InitBtn()
  DungeonInfoWindow.InitUiInfo()
  DungeonInfoWindow.UpdateSweep()
end

function DungeonInfoWindow.UpdateTextDisplay()
  UIUtil.SetBtnText(uis.Main.DungeonInfoTips.BattleBtnRegion.AiBattleBtn, T(664), T(665))
  UIUtil.SetBtnText(uis.Main.DungeonInfoTips.BattleBtnRegion.Battle_S_Btn, T(319), T(320))
  UIUtil.SetBtnText(uis.Main.DungeonInfoTips.BattleBtnRegion.Battle_B_Btn, T(319), T(320))
  collection.RewardShow.WordTxt.text = T(670)
end

function DungeonInfoWindow.InitUiInfo()
  local title = uis.Main.DungeonInfoTips.Title
  if stageData.name_english then
    title.SubtitleTxt.text = stageData.name_english()
  end
  title.Word1Txt.text = T(663)
  if stageData.recommend_lv then
    title.Word2Txt.text = stageData.recommend_lv()
  end
  title.c1Ctr.selectedIndex = 0
  if stageData.type_show then
    title.c2Ctr.selectedIndex = stageData.type_show[1]
    title.c3Ctr.selectedIndex = stageData.type_show[2]
  end
  DungeonInfoWindow.InitStageCost()
  local type = stageData.chapter_type
  local sceneType = ProtoEnum.SCENE_TYPE
  if type == sceneType.CLIMB_TOWER then
    title.NameTxt.text = stageData.name_Headline and stageData.name_Headline() or ""
  else
    title.NameTxt.text = stageData.name_detail and stageData.name_detail() or ""
  end
  if type == sceneType.MAIN_LINE then
    title.OrderTxt.text = T(965, stageData.name())
  elseif type == sceneType.ACTIVITY_NORAML then
    title.OrderTxt.text = ""
  else
    title.OrderTxt.text = stageData.name_subtitle and stageData.name_subtitle() or ""
  end
  if sceneType.CLIMB_TOWER == type then
    collection.c1Ctr.selectedIndex = 2
    DungeonInfoWindow.ShowBuffList()
  elseif type == sceneType.EXPEDITION then
    collection.c1Ctr.selectedIndex = 3
    DungeonInfoWindow.ShowBuffList()
  else
    collection.c1Ctr.selectedIndex = 0
    if stageData.des then
      function collection.WordExplainList.itemRenderer(i, item)
        UIUtil.SetText(item, stageData.des(), "WordTxt")
      end
      
      collection.WordExplainList.numItems = 1
    end
  end
  local itemHand
  itemDrops = GetStageRewardShow(stageData.reward_show, true)
  local tipsWord = {
    T(676),
    T(703),
    T(704)
  }
  for i = #itemDrops, 1, -1 do
    if 1 == itemDrops[i].type and AdventureData.GetPassedStageInfo(stageData.id) then
      table.remove(itemDrops, i)
    end
  end
  if collection.RewardShow.RewardList.numChildren > 0 then
    collection.RewardShow.RewardList:RemoveChildrenToPool()
  end
  for i, v in ipairs(itemDrops) do
    itemHand = collection.RewardShow.RewardList:AddItemFromPool()
    if v.tipsType then
      UIUtil.SetText(itemHand, tipsWord[v.tipsType], "WordTxt")
      ChangeUIController(itemHand, "c2", 0)
    else
      ChangeUIController(itemHand, "c2", 1)
    end
    if 1 == v.type then
      UIUtil.ShowItemFrame(v.id, itemHand, nil, nil, function()
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
        UIUtil.OpenPreviewTips(v.id, v.itemType)
      end)
      ChangeUIController(itemHand, "c3", 1)
      UIUtil.SetText(itemHand:GetChild("ItemLabel"), T(656), "LabelWordTxt")
    else
      UIUtil.ShowItemFrame(v.id, itemHand, nil, nil, function()
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
        UIUtil.OpenPreviewTips(v.id, v.itemType)
      end)
      ChangeUIController(itemHand, "c3", 0)
    end
  end
end

function DungeonInfoWindow.ShowBuffList()
  local buffList = stageData.buff_list
  if buffList then
    local buff, buffData
    for i, v in pairs(buffList) do
      buff = UIMgr:CreateObject("DungeonInfo", "ExpeditionSkill")
      buffData = TableData.GetConfig(v, "BaseSkillBuffPre")
      if buffData then
        UIUtil.SetText(buff, buffData.name(), "NameTxt")
        UIUtil.SetText(buff, buffData.des(), "WordTxt")
      end
      collection.ExpeditionRegion.SkillList:AddChild(buff)
    end
  end
end

function DungeonInfoWindow.InitStageCost()
  local NumberLabelList = uis.Main.DungeonInfoTips.NumberLabelList
  for i = 1, NumberLabelList.numItems do
    NumberLabelList:RemoveChildAt(0, true)
  end
  if -1 ~= stageData.challenge_num and paramInfo.challengeNum and stageData.challenge_num > paramInfo.challengeNum then
    local title = UIMgr:CreateObject("DungeonInfo", "NumberLabel2")
    UIUtil.SetText(title, T(677, stageData.challenge_num - paramInfo.challengeNum, stageData.challenge_num), "NumberTxt")
    NumberLabelList:AddChild(title)
  end
  local energy = ActorData.GetItemCount(COMMON_ITEM_ID.ENERGY)
  local maxEnergy = ActorData.GetEnergyMax()
  local title = UIMgr:CreateObject("DungeonInfo", "NumberLabel1")
  UIUtil.SetText(title, T(677, energy, maxEnergy), "NumberTxt")
  NumberLabelList:AddChild(title)
  uis.Main.DungeonInfoTips.NumberLabelList.onClick:Set(function()
    ld("Energy", function()
      EnergyService.GetEnergyRecoverInfoReq()
    end)
  end)
  if stageData.cost then
    local arr = GetConfigItemList(stageData.cost)
    arr = arr[COMMON_ITEM_ID.ENERGY]
    if arr then
      uis.Main.DungeonInfoTips.BattleBtnRegion.EnergyLabel.WordTxt.text = T(678, arr.value)
    end
    uis.Main.DungeonInfoTips.BattleBtnRegion.EnergyLabel.root.visible = true
  else
    uis.Main.DungeonInfoTips.BattleBtnRegion.EnergyLabel.root.visible = false
  end
end

function DungeonInfoWindow.GetMonsterId()
  local list = stageData.monster_group_list
  local tb = {}
  local group, fashionId, config
  for i, v in pairs(list) do
    group = TableData.GetConfig(v, "BaseMonsterGroup")
    if group and group.monster_list then
      for k, vv in pairs(group.monster_list) do
        config = TableData.GetConfig(vv, "BaseMonster")
        fashionId = config.fashion_id
        if fashionId then
          tb[fashionId] = {
            fashionId = vv,
            rank = config.rank
          }
        end
      end
    end
    if group and group.ex_monster_show then
      for k, vv in pairs(group.ex_monster_show) do
        config = TableData.GetConfig(vv, "BaseMonster")
        fashionId = config.fashion_id
        if fashionId then
          tb[fashionId] = {
            fashionId = vv,
            rank = config.rank
          }
        end
      end
    end
  end
  local newTb = {}
  for i, v in pairs(tb) do
    table.insert(newTb, v)
  end
  tb = nil
  if #newTb > 1 then
    table.sort(newTb, function(a, b)
      return a.rank > b.rank
    end)
  end
  return newTb
end

function DungeonInfoWindow.GetConfig(id)
  local config, isMonster = nil, true
  config = TableData.GetConfig(id, "BaseMonster")
  if nil == config then
    config = TableData.GetConfig(id, "BaseCard")
    isMonster = false
  end
  return config, isMonster
end

function DungeonInfoWindow.InitMonster()
  lastBtn = nil
  local tb = DungeonInfoWindow.GetMonsterId()
  local str = {672, 673}
  
  function collection.MonsterRegion.MonsterList.itemRenderer(i, item)
    local index = i + 1
    local data, isMonster = DungeonInfoWindow.GetConfig(tb[index].fashionId)
    if data then
      if str[data.rank] then
        local monsterType = item:GetChild("MonsterType")
        monsterType.visible = true
        UIUtil.SetText(monsterType, T(str[data.rank]), "LabelWordTxt")
      end
      local btn = item:GetChild("HeadBtn")
      local touchCallback = function()
        if lastBtn then
          ChangeUIController(lastBtn, "c3", 0)
        end
        ChangeUIController(btn, "c3", 1)
        DungeonInfoWindow.MonsterHeadOnClick(data)
        lastBtn = btn
      end
      UIUtil.ShowHeadBtn(data.id, btn, nil, touchCallback)
      if 0 == i then
        touchCallback()
      end
    end
  end
  
  collection.MonsterRegion.MonsterList.numItems = #tb
end

function DungeonInfoWindow.MonsterHeadOnClick(data)
  for i = 1, collection.MonsterRegion.SkillList.numItems do
    collection.MonsterRegion.SkillList:RemoveChildAt(0, true)
  end
  local title, word
  title = UIMgr:CreateObject("DungeonInfo", "MonsterTitle")
  UIUtil.ShowElementList(title:GetChild("ElementList"), data)
  ChangeUIController(title:GetChild("Occupation"), nil, data.type - 1)
  UIUtil.SetText(title, data.name(), "NameTxt")
  collection.MonsterRegion.SkillList:AddChild(title)
  local skillId = DungeonInfoWindow.GetSkillId(data)
  for i, v in ipairs(skillId) do
    word = UIMgr:CreateObject("DungeonInfo", "MonsterSkillWord")
    local skillData = TableData.GetConfig(v * 1000 + 1, "BaseSkillLevelUp")
    if skillData then
      UIUtil.SetText(word, skillData.des(), "WordTxt")
    end
    skillData = TableData.GetConfig(v, "BaseSkill")
    if skillData then
      local typeCom = word:GetChild("MonsterSkillType")
      UIUtil.SetText(typeCom, CardData.GetSkillTypeName(skillData.type), "LabelWordTxt")
    end
    collection.MonsterRegion.SkillList:AddChild(word)
  end
end

function DungeonInfoWindow.GetSkillId(config)
  local skill2Level = {}
  local add = function(id)
    if not table.contain(skill2Level, id) then
      table.insert(skill2Level, id)
    end
  end
  if config.ex_skill then
    for _, skillId in ipairs(config.ex_skill) do
      add(skillId)
    end
  end
  if config.unique_skill then
    for _, skillId in ipairs(config.unique_skill) do
      add(skillId)
    end
  end
  if config.special_skill then
    for _, skillId in ipairs(config.special_skill) do
      add(skillId)
    end
  end
  if config.normal_skill then
    add(config.normal_skill)
  end
  return skill2Level
end

function DungeonInfoWindow.SufficientQuantity()
  if stageData.cost then
    local tb = GetConfigItemList(stageData.cost)
    local energy
    for i, v in pairs(tb) do
      energy = ActorData.GetItemCount(v.id)
      if energy < v.value then
        ld("Energy", function()
          EnergyService.GetEnergyRecoverInfoReq()
        end)
        return false
      end
    end
  end
  return true
end

function DungeonInfoWindow.EnterBattle()
  if paramInfo.BossInfo and paramInfo.BossInfo.lockedInStage1 == false and 1 == paramInfo.BossInfo.state then
    if paramInfo.lockId == nil then
      MessageBox.Show(T(597), {
        touchCallback = function()
          BossDungeonService.LockBossReq(stageData.chapter_id, stageData.chapter_type)
        end
      }, {})
    else
      local lockedData = TableData.GetConfig(paramInfo.lockId, "BaseChapter")
      if lockedData then
        FloatTipsUtil.ShowWarnTips(T(598, lockedData.name()))
      end
    end
    return
  end
  if numBol then
    FloatTipsUtil.ShowWarnTips(T(7001403))
    return
  end
  if DungeonInfoWindow.SufficientQuantity() then
    local params = {
      sceneType = stageData.chapter_type,
      stageId = stageData.id
    }
    if paramInfo.BossInfo then
      params.state = paramInfo.BossInfo.state
    end
    if paramInfo.opponentRank and paramInfo.formation then
      params.arenaRankId = paramInfo.opponentRank
      params.enemyFormation = paramInfo.formation
    end
    ld("Formation", function()
      FormationMgr.TryOpenFormationWindow(params)
    end)
  end
end

function DungeonInfoWindow.AiBattleOnClick()
  if stageData.chapter_type == ProtoEnum.SCENE_TYPE.ACTIVITY_CREAM then
    local info = ActivityDungeonData.GetActivityInfo()
    if info then
      local energy = info.creamCount
      if energy >= 1 then
        ld("Sweep")
        SweepService.SweepStageReq(stageData.id, function(msg)
          ActivityDungeonData.UpdateCreamCount()
          GetItemTips.Show(msg.rewards, true, function()
            if uis then
              info = ActivityDungeonData.GetActivityInfo()
              if info.creamCount < 1 then
                DungeonInfoWindow.CloseWindow()
                FloatTipsUtil.ShowWarnTips(T(1620))
              end
            end
          end)
        end)
      end
    end
  elseif DungeonInfoWindow.SufficientQuantity() then
    OpenWindow(WinResConfig.SweepWindow.name, nil, paramInfo.stageId)
  end
end

function DungeonInfoWindow.UpdateSweep()
  local canSweep
  if stageData.chapter_type == ProtoEnum.SCENE_TYPE.ACTIVITY_CREAM then
    local info = ActivityDungeonData.GetActivityInfo()
    if info and table.contain(info.finishStages, stageData.id) then
      canSweep = true
    end
  else
    canSweep = AdventureData.StageCanSweep(paramInfo.stageId)
  end
  if true == canSweep then
    ChangeUIController(uis.Main.DungeonInfoTips.BattleBtnRegion.root, "c1", 1)
  else
    ChangeUIController(uis.Main.DungeonInfoTips.BattleBtnRegion.root, "c1", 0)
  end
end

function DungeonInfoWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.DungeonInfoWindow.name)
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_SKILL_OUT)
end

function DungeonInfoWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    DungeonInfoWindow.CloseWindow()
    if closeFunc then
      closeFunc()
    end
  end)
  uis.Main.DungeonInfoTips.BattleBtnRegion.Battle_B_Btn.onClick:Set(DungeonInfoWindow.EnterBattle)
  uis.Main.DungeonInfoTips.BattleBtnRegion.Battle_S_Btn.onClick:Set(DungeonInfoWindow.EnterBattle)
  uis.Main.DungeonInfoTips.BattleBtnRegion.AiBattleBtn.onClick:Set(DungeonInfoWindow.AiBattleOnClick)
end

function DungeonInfoWindow.HandleMessage(msgId, para)
  if para and msgId == WindowMsgEnum.DungeonInfoWindow.UPDATE_WINDOW or msgId == WindowMsgEnum.Common.E_MSG_WINDOW_INFO_UPDATE then
    if para then
      paramInfo = para
      if paramInfo.stageId == nil then
        DungeonInfoWindow.CloseWindow()
        return
      end
      PlayUITrans(uis.Main.root, "out", function()
        DungeonInfoWindow.InitShow()
        PlayUITrans(uis.Main.root, "in")
      end)
    end
  elseif msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    DungeonInfoWindow.InitStageCost()
  end
end

function DungeonInfoWindow.OnShown()
  if uis then
    DungeonInfoWindow.InitStageCost()
  end
end

function DungeonInfoWindow.OnClose()
  if UIMgr:IsWindowInList(WinResConfig.DungeonInfoWindow.name) then
    return
  end
  uis = nil
  contentPane = nil
  collection = nil
  lastBtn = nil
  numBol = nil
  paramInfo = nil
  closeFunc = nil
end

return DungeonInfoWindow
