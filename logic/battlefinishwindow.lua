require("BattleData_BattleFinishWindowByName")
local BattleFinishWindow = {}
local uis, contentPane

function BattleFinishWindow.ReInitData()
end

local showLevelUp = false
local challengeResult, curTypingEffect, curSoundEventIns
local expChangeTime = 1

function BattleFinishWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BattleFinishWindow.package, WinResConfig.BattleFinishWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    challengeResult = bridgeObj.argTable[1]
    BattleMgr.CloseBattle()
    uis = GetBattleData_BattleFinishWindowUis(contentPane)
    if challengeResult.battleData and 0 == #challengeResult.battleData.unitDamage then
      uis.Main.TimeBtn.visible = false
      uis.Main.DataBtn.visible = false
    end
    BattleFinishWindow.UpdateInfo()
    BattleFinishWindow.InitBtn()
    BattleFinishWindow.InitText()
    BattleFinishWindow.UpdateCardShow()
    BattleFinishWindow.DelayedCall()
    contentPane.touchable = false
    TimerUtil.setTimeout(expChangeTime, function()
      if contentPane then
        contentPane.touchable = true
      end
    end)
  end)
end

function BattleFinishWindow.UpdateInfo()
  BattleFinishWindow.UpdateResult()
  BattleFinishWindow.UpdateSceneType()
  BattleFinishWindow.UpdateItem()
  BattleFinishWindow.UpdateExp()
  BattleFinishWindow.UpdateShowLevelUp()
  BattleFinishWindow.UpdateTarget()
end

function BattleFinishWindow.UpdateTarget()
  if challengeResult.sceneType ~= ProtoEnum.SCENE_TYPE.EXPEDITION then
    return
  end
  uis.Main.c4Ctr.selectedIndex = 1
  local extData = challengeResult.extData
  if string.isEmptyOrNil(extData) == false then
    local data = Net.DecodePb("ExpeditionStateRecord", extData)
    local challenged = data.challenged
    uis.Main.TargetTips.Title.NameTxt.text = T(20234)
    local stageConfig = TableData.GetConfig(challengeResult.stageId, "BaseStage")
    local totalChallenge = stageConfig.challenge_condition
    local tipsList = uis.Main.TargetTips.TipsList
    
    function tipsList.itemRenderer(i, gcmp)
      local challengeId = totalChallenge[i + 1]
      local config = TableData.GetConfig(challengeId, "BaseStageChallenge")
      UIUtil.SetText(gcmp, config.name(), "WordTxt")
      ChangeUIController(gcmp, "c1", table.contain(challenged, challengeId) and 1 or 0)
    end
    
    tipsList.numItems = #totalChallenge
  end
end

function BattleFinishWindow.UpdateExp()
  if challengeResult.sceneType == ProtoEnum.SCENE_TYPE.BUFF_STAGE or challengeResult.sceneType == ProtoEnum.SCENE_TYPE.ACTIVITY_NORAML or challengeResult.sceneType == ProtoEnum.SCENE_TYPE.ACTIVITY_CREAM or challengeResult.sceneType == ProtoEnum.SCENE_TYPE.ACTIVITY_BOSS then
    uis.Main.CardLevel.root.visible = false
  end
  if challengeResult.level == nil or nil == challengeResult.exp or 0 == challengeResult.level then
    return
  end
  if challengeResult.sceneType == ProtoEnum.SCENE_TYPE.ARENA or challengeResult.sceneType == ProtoEnum.SCENE_TYPE.ACTIVITY or challengeResult.sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION or challengeResult.sceneType == ProtoEnum.SCENE_TYPE.BUFF_STAGE then
    return
  end
  local preLevel = BattleData.tempLevel
  local preExp = BattleData.tempExp
  local preExpMax = ActorData.GetExpMax(preLevel)
  local nowLevel = ActorData.GetLevel()
  local nowExp = ActorData.GetExp()
  local nowExpMax = ActorData.GetExpMax()
  local expChange = 0
  if preLevel < nowLevel then
    expChange = nowExp + preExpMax - preExp
  else
    expChange = nowExp - preExp
  end
  if 0 == expChange then
    uis.Main.CardLevel.LevelTxt.text = T(10308, nowLevel)
    uis.Main.CardLevel.ExpProgressBar.value = 100 * nowExp / nowExpMax
    return
  end
  uis.Main.CardLevel.LevelTxt.text = T(10308, challengeResult.level)
  uis.Main.CardLevel.ExpProgressBar.value = 100 * preExp / preExpMax
  LeanTween.value(0, expChange, expChangeTime):setOnUpdate(function(value)
    local tempExp = preExp + value
    if uis then
      if tempExp <= preExpMax then
        uis.Main.CardLevel.ExpProgressBar.value = 100 * tempExp / preExpMax
      else
        uis.Main.CardLevel.LevelTxt.text = T(10308, nowLevel)
        uis.Main.CardLevel.ExpProgressBar.value = 100 * (tempExp - preExpMax) / nowExpMax
      end
    end
  end):setOnComplete(function()
    if uis then
      uis.Main.CardLevel.LevelTxt.text = T(10308, nowLevel)
      uis.Main.CardLevel.ExpProgressBar.value = 100 * nowExp / nowExpMax
    end
  end)
end

function BattleFinishWindow.UpdateShowLevelUp()
  if challengeResult.sceneType == ProtoEnum.SCENE_TYPE.ARENA or challengeResult.sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION or challengeResult.sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
    return
  end
  local nowLevel = ActorData.GetLevel()
  if BattleData.tempLevel and nowLevel > BattleData.tempLevel then
    showLevelUp = true
  end
end

function BattleFinishWindow.IsWin()
  if BattleData.IsGuildTrain(challengeResult.sceneType) then
    return true
  end
  if challengeResult.sceneType == ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE or challengeResult.sceneType == ProtoEnum.SCENE_TYPE.BUFF_STAGE then
    return true
  end
  if BattleData.isMirror then
    return not challengeResult.win
  else
    return challengeResult.win
  end
end

function BattleFinishWindow.IsOver()
  return BattleData.IsBattleNoFail(challengeResult.sceneType)
end

function BattleFinishWindow.ShowDamage()
  local allInfo = challengeResult.battleData.unitDamage
  local damage = 0
  for i, v in pairs(allInfo) do
    if v.camp == BATTLE_CAMP_FLAG.LEFT then
      damage = v.damage + damage
    end
  end
  LeanTween.value(0, damage, 1.5):setEaseInOutCirc():setOnUpdate(function(val)
    if uis then
      uis.Main.GuildTrainInfo.Word2Txt.text = NumberByCommaStyle(math.ceil(val))
    end
  end):setOnComplete(function()
    if uis then
      uis.Main.GuildTrainInfo.Word2Txt.text = NumberByCommaStyle(math.ceil(damage))
    end
  end)
  uis.Main.GuildTrainInfo.Word1Txt.text = T(1297)
end

function BattleFinishWindow.ShowDamageInGuildWar()
  local extData = challengeResult.extData
  local hpRegion = uis.Main.MonsterHPRegion
  if string.isEmptyOrNil(extData) == false then
    uis.Main.BallteGuildBoss_Time.root.visible = true
    local data = Net.DecodePb("GuildWarBattleResult", extData)
    local time = data.compensateTime
    local bossDeadBefore = data.bossDeadBefore
    if true == bossDeadBefore then
      local timeCtr = uis.Main.BallteGuildBoss_Time
      timeCtr.WordTxt.text = T(11726)
      timeCtr.TimeTxt.text = ""
      timeCtr.Word1Txt.text = T(11727)
    else
      local timeCtr = uis.Main.BallteGuildBoss_Time
      timeCtr.WordTxt.text = T(11728)
      timeCtr.TimeTxt.text = TimeUtil.GetTimeStr(time)
      timeCtr.Word1Txt.text = T(11729)
    end
    hpRegion.c1Ctr.selectedIndex = 0
    hpRegion.MonsterHP1.Word.Word1Txt.text = T(11730)
    hpRegion.MonsterHP1.Word.Word2Txt.text = ""
    hpRegion.MonsterHP1.Word.Word3Txt.text = ""
    hpRegion.MonsterHP1.MonsterHPProgressBar.value = 0
  else
    uis.Main.BallteGuildBoss_Time.root.visible = false
    local battleData = challengeResult.battleData
    local stageId = challengeResult.stageId
    local initUnitData = battleData.initData.actorRight.unitList
    local preHp = 0
    for _, v in ipairs(initUnitData) do
      local config, isMonster, isBuilding = CardData.GetBaseConfig(v.id)
      if isMonster then
        if 1 ~= config.no_statistics_hp then
          preHp = preHp + v.hp
        end
      else
        preHp = preHp + v.hp
      end
    end
    local cardStates = battleData.teamState2.cardStates
    local maxHp, hp = 0, 0
    for _, v in pairs(cardStates) do
      local config, isMonster, isBuilding = CardData.GetBaseConfig(v.id)
      if isMonster then
        if 1 ~= config.no_statistics_hp then
          hp = hp + v.hp
          maxHp = maxHp + v.maxHp
        end
      else
        hp = hp + v.hp
        maxHp = maxHp + v.maxHp
      end
    end
    if 0 == preHp then
      preHp = maxHp
    end
    local damage = preHp - hp
    if damage < 0 then
      damage = 0
    end
    local tweenDuration = 1.5
    hpRegion.c1Ctr.selectedIndex = 0
    hpRegion.MonsterHP1.MonsterHPProgressBar.value = 0
    local hpCmp = hpRegion.MonsterHP1
    local word1Txt = hpCmp.Word.Word1Txt
    local word2Txt = hpCmp.Word.Word2Txt
    local word3Txt = hpCmp.Word.Word3Txt
    local bar = hpCmp.MonsterHPProgressBar
    local hpPercent = math.floor(100 * (hp / maxHp))
    local dmgPercent = math.floor(100 * (damage / maxHp))
    word1Txt.text = T(20302)
    word2Txt.text = 0
    word3Txt.text = string.format("(%s%%)", 0)
    LeanTween.value(0, damage, tweenDuration):setOnUpdate(function(val)
      if word2Txt and not word2Txt.isDisposed then
        word2Txt.text = string.formatNum(math.ceil(val), 3)
      end
      if word3Txt and not word3Txt.isDisposed then
        local percent = math.floor(100 * (val / maxHp))
        word3Txt.text = string.format("(%s%%)", percent)
      end
    end):setOnComplete(function()
      if word2Txt and not word2Txt.isDisposed then
        word2Txt.text = string.formatNum(damage, 3)
      end
      if word3Txt and not word3Txt.isDisposed then
        local percent = math.floor(100 * (damage / maxHp))
        word3Txt.text = string.format("(%s%%)", percent)
      end
    end)
    LeanTween.value(dmgPercent + hpPercent, hpPercent, tweenDuration):setOnUpdate(function(val)
      if bar and not bar.isDisposed then
        bar.value = val
      end
    end):setOnComplete(function()
      if bar and not bar.isDisposed then
        bar.value = hpPercent
      end
    end)
  end
end

function BattleFinishWindow.ShowDamageInRaidBoss()
  local battleData = challengeResult.battleData
  local stageId = challengeResult.stageId
  local initUnitData = battleData.initData.actorRight.unitList
  local preHp = 0
  for _, v in ipairs(initUnitData) do
    local config, isMonster, isBuilding = CardData.GetBaseConfig(v.id)
    if isMonster then
      if 1 ~= config.no_statistics_hp then
        preHp = preHp + v.hp
      end
    else
      preHp = preHp + v.hp
    end
  end
  local cardStates = battleData.teamState2.cardStates
  local maxHp, hp = 0, 0
  for _, v in pairs(cardStates) do
    local config, isMonster, isBuilding = CardData.GetBaseConfig(v.id)
    if isMonster then
      if 1 ~= config.no_statistics_hp then
        hp = hp + v.hp
        maxHp = maxHp + v.maxHp
      end
    else
      hp = hp + v.hp
      maxHp = maxHp + v.maxHp
    end
  end
  if 0 == preHp then
    preHp = maxHp
  end
  local damage = preHp - hp
  if damage < 0 then
    damage = 0
  end
  local hpRegion = uis.Main.root:GetChild("MonsterHPRegion")
  local tweenDuration = 1.5
  if RaidBossMgr.IsHardestLevel(stageId) then
    ChangeUIController(hpRegion, "c1", 1)
    local hpCmp = hpRegion:GetChild("MonsterHP2")
    local word = hpCmp:GetChild("Word")
    local word1 = hpCmp:GetChild("Word1")
    UIUtil.SetText(word, T(20303), "Word1Txt")
    local totalDamage = maxHp - hp
    LeanTween.value(0, damage, tweenDuration):setOnUpdate(function(val)
      if word and not word.isDisposed then
        UIUtil.SetText(word, string.formatNum(math.ceil(val), 3), "Word2Txt")
      end
    end):setOnComplete(function()
      if word and not word.isDisposed then
        UIUtil.SetText(word, string.formatNum(math.ceil(damage), 3), "Word2Txt")
      end
    end)
    UIUtil.SetText(word, "", "Word3Txt")
    UIUtil.SetText(word1, T(20304), "Word1Txt")
    LeanTween.value(totalDamage - damage, totalDamage, tweenDuration):setOnUpdate(function(val)
      if word1 and not word1.isDisposed then
        UIUtil.SetText(word1, string.formatNum(math.ceil(val), 3), "Word2Txt")
      end
    end):setOnComplete(function()
      if word1 and not word1.isDisposed then
        UIUtil.SetText(word1, string.formatNum(math.ceil(totalDamage), 3), "Word2Txt")
      end
    end)
    UIUtil.SetText(word1, "", "Word3Txt")
  else
    ChangeUIController(hpRegion, "c1", 0)
    local hpCmp = hpRegion:GetChild("MonsterHP1")
    local word = hpCmp:GetChild("Word")
    local bar = hpCmp:GetChild("MonsterHPProgressBar")
    local hpPercent = math.floor(100 * (hp / maxHp))
    local dmgPercent = math.floor(100 * (damage / maxHp))
    UIUtil.SetText(word, T(20302), "Word1Txt")
    UIUtil.SetText(word, 0, "Word2Txt")
    UIUtil.SetText(word, string.format("(%s%%)", 0), "Word3Txt")
    LeanTween.value(0, damage, tweenDuration):setOnUpdate(function(val)
      if word and not word.isDisposed then
        UIUtil.SetText(word, string.formatNum(math.ceil(val), 3), "Word2Txt")
        local percent = math.floor(100 * (val / maxHp))
        UIUtil.SetText(word, string.format("(%s%%)", percent), "Word3Txt")
      end
    end):setOnComplete(function()
      if word and not word.isDisposed then
        UIUtil.SetText(word, string.formatNum(damage, 3), "Word2Txt")
        local percent = math.floor(100 * (damage / maxHp))
        UIUtil.SetText(word, string.format("(%s%%)", percent), "Word3Txt")
      end
    end)
    LeanTween.value(dmgPercent + hpPercent, hpPercent, tweenDuration):setOnUpdate(function(val)
      if bar and not bar.isDisposed then
        bar.value = val
      end
    end):setOnComplete(function()
      if bar and not bar.isDisposed then
        bar.value = hpPercent
      end
    end)
  end
end

function BattleFinishWindow.UpdateResult()
  local stageConfig = TableData.GetConfig(challengeResult.stageId, "BaseStage")
  if stageConfig then
    if challengeResult.sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION or challengeResult.sceneType == ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE or challengeResult.sceneType == ProtoEnum.SCENE_TYPE.BUFF_STAGE then
      uis.Main.TitleWord.NameTxt.text = stageConfig.name and stageConfig.name() or ""
    else
      uis.Main.TitleWord.NameTxt.text = stageConfig.name and T(889, stageConfig.name()) or ""
    end
  elseif challengeResult.sceneType == ProtoEnum.SCENE_TYPE.ARENA then
    uis.Main.TitleWord.NameTxt.text = TableData.GetConfig(10303, "BaseFeature").name()
  end
  local soundPathId = BattleFinishWindow.IsWin() and 40001 or 40002
  SoundUtil.PlaySfx(soundPathId)
  local loader = uis.Main.BackGround.BackGroundLoader
  local holder = uis.Main.EffectHolder
  UIUtil.SetHolderCenter(holder)
  if challengeResult.sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
    uis.Main.c1Ctr.selectedIndex = 0
    uis.Main.TitleWord.c1Ctr.selectedIndex = 0
    uis.Main.TitleWord.WordWinTxt.text = T(10317)
    loader.url = UIUtil.GetResUrl(TableData.GetConfig(20005, "BaseFeature").back_ground)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Battle_check/FX_ui_battle_check_win.prefab", holder)
  elseif BattleFinishWindow.IsWin() then
    uis.Main.c1Ctr.selectedIndex = 0
    uis.Main.TitleWord.c1Ctr.selectedIndex = 0
    local battleData = challengeResult.battleData
    if BattleData.IsGuildTrain(challengeResult.sceneType) then
      uis.Main.TitleWord.WordWinTxt.text = T(10317)
    elseif challengeResult.sceneType == ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE then
      local stageId = challengeResult.stageId
      if RaidBossMgr.IsHardestLevel(stageId) then
        uis.Main.TitleWord.WordWinTxt.text = T(20334)
      else
        local cardStates = battleData.teamState2.cardStates
        local hp = 0
        for _, v in pairs(cardStates) do
          hp = hp + v.hp
        end
        local bossKilled = hp <= 0
        uis.Main.TitleWord.WordWinTxt.text = bossKilled and T(20335) or T(20334)
      end
    elseif challengeResult.sceneType == ProtoEnum.SCENE_TYPE.BUFF_STAGE then
      local stageId = challengeResult.stageId
      if FrostDungeonMgr.IsHighestLevel(stageId) then
        local cardStates = battleData.teamState2.cardStates
        local hp = 0
        for _, v in pairs(cardStates) do
          hp = hp + v.hp
        end
        local bossKilled = hp <= 0
        uis.Main.TitleWord.WordWinTxt.text = bossKilled and T(20335) or T(20334)
      else
        local initData = battleData.initData
        local limitFrame = initData.limitFrame
        if not limitFrame or limitFrame <= 0 then
          limitFrame = stageConfig.limit_frame or 0
        end
        local totalFrame = battleData.totalFrame
        local timeout = limitFrame <= totalFrame
        uis.Main.TitleWord.WordWinTxt.text = timeout and T(20335) or T(20334)
      end
    else
      uis.Main.TitleWord.WordWinTxt.text = T(10313)
    end
    loader.url = UIUtil.GetResUrl(TableData.GetConfig(20005, "BaseFeature").back_ground)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Battle_check/FX_ui_battle_check_win.prefab", holder)
  elseif BattleFinishWindow.IsOver() then
    uis.Main.c1Ctr.selectedIndex = 1
    uis.Main.TitleWord.c1Ctr.selectedIndex = 1
    uis.Main.TitleWord.WordFailTxt.text = T(10317)
    loader.url = UIUtil.GetResUrl(TableData.GetConfig(20006, "BaseFeature").back_ground)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Battle_check/FX_ui_battle_check_lose.prefab", holder)
  else
    uis.Main.c1Ctr.selectedIndex = 1
    uis.Main.TitleWord.c1Ctr.selectedIndex = 1
    uis.Main.TitleWord.WordFailTxt.text = T(10315)
    loader.url = UIUtil.GetResUrl(TableData.GetConfig(20006, "BaseFeature").back_ground)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Battle_check/FX_ui_battle_check_lose.prefab", holder)
  end
end

function BattleFinishWindow.UpdateSceneType()
  local sceneType = challengeResult.sceneType
  if sceneType == ProtoEnum.SCENE_TYPE.MAIN_LINE then
    ChangeUIController(uis.Main.root, "c2", 0)
  elseif sceneType == ProtoEnum.SCENE_TYPE.DAILY_COIN or sceneType == ProtoEnum.SCENE_TYPE.DAILY_ROLE_EXP or sceneType == ProtoEnum.SCENE_TYPE.DAILY_SKILL_BOOK or sceneType == ProtoEnum.SCENE_TYPE.DAILY_QUALITY_UP or sceneType == ProtoEnum.SCENE_TYPE.DAILY_MATERIAL or sceneType == ProtoEnum.SCENE_TYPE.DAILY_BADGE_EXP then
    ChangeUIController(uis.Main.root, "c2", 1)
  elseif sceneType == ProtoEnum.SCENE_TYPE.ARENA then
    ChangeUIController(uis.Main.root, "c2", 2)
  elseif sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
    ChangeUIController(uis.Main.root, "c2", 3)
  elseif BattleData.IsGuildTrain(sceneType) then
    BattleFinishWindow.ShowDamage()
    ChangeUIController(uis.Main.root, "c2", 4)
  elseif sceneType == ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE then
    BattleFinishWindow.ShowDamageInRaidBoss()
    ChangeUIController(uis.Main.root, "c2", 5)
  elseif sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
    BattleFinishWindow.ShowDamageInGuildWar()
    ChangeUIController(uis.Main.root, "c2", 6)
  end
end

function BattleFinishWindow.UpdateItem()
  local list = uis.Main.ItemList
  list.opaque = false
  local sceneType = challengeResult.sceneType
  if sceneType == ProtoEnum.SCENE_TYPE.MANOR_FIR or sceneType == ProtoEnum.SCENE_TYPE.MANOR_WATER or sceneType == ProtoEnum.SCENE_TYPE.MANOR_WOOD or sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
    list.visible = false
    return
  end
  list.visible = true
  local num = 1
  local ShowItem = function(itemTuple, quality)
    local itemHand = list:AddItemFromPool()
    UIUtil.ShowItemFrame(itemTuple.itemId, itemHand, itemTuple.count, nil, function()
      UIUtil.CommonItemClickCallback(itemTuple.itemId, itemTuple.tupleType, itemTuple.uid, true)
    end, T(10027))
    if num < 9 then
      itemHand.alpha = 0
      itemHand.visible = false
      if quality then
        local effect = UIUtil.SetEffectToUI(string.format(RES_PATH_PREFIX.GET_ITEM_PATH, quality + 1), itemHand:GetChild("EffectHolder"), nil, true)
        LuaUtil.SetLocalPos(effect, 55, -45, 0)
      end
      LeanTween.delayedCall(num * 0.15, function()
        if uis and IsNil(itemHand) == false then
          itemHand.visible = true
          PlayUITrans(itemHand, "up")
          SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.GET_ITEM_SHOW)
        end
      end)
      num = num + 1
    end
  end
  if challengeResult.FirstItemDrops then
    table.sort(challengeResult.FirstItemDrops, BattleFinishWindow.Sort)
    for i, v in ipairs(challengeResult.FirstItemDrops) do
      local itemConfig = TableData.GetConfig(v.itemId, "BaseItem")
      if itemConfig and itemConfig.type ~= ProtoEnum.ITEM_TYPE.ROLE_EXP and 9 ~= itemConfig.type then
        ShowItem(v, itemConfig.quality + 1)
      elseif nil == itemConfig then
        local badgeConfig = TableData.GetConfig(v.itemId, "BaseBadge")
        if badgeConfig then
          ShowItem(v, badgeConfig.star)
        end
      end
    end
  end
  if challengeResult.itemDrops then
    table.sort(challengeResult.itemDrops, BattleFinishWindow.Sort)
    for i, v in ipairs(challengeResult.itemDrops) do
      local itemConfig = TableData.GetConfig(v.itemId, "BaseItem")
      if itemConfig and itemConfig.type ~= ProtoEnum.ITEM_TYPE.ROLE_EXP and 9 ~= itemConfig.type then
        ShowItem(v, itemConfig.quality + 1)
      elseif nil == itemConfig then
        local badgeConfig = TableData.GetConfig(v.itemId, "BaseBadge")
        if badgeConfig then
          ShowItem(v, badgeConfig.star)
        end
      end
    end
  end
end

function BattleFinishWindow.Sort(a, b)
  if a.tupleType == ProtoEnum.TUPLE_TYPE.BADGE and b.tupleType == ProtoEnum.TUPLE_TYPE.BADGE then
    local dataA = TableData.GetConfig(a.itemId, "BaseBadge")
    local dataB = TableData.GetConfig(b.itemId, "BaseBadge")
    if dataA and dataB then
      if dataB.star == dataA.star then
        return a.itemId > b.itemId
      else
        return dataA.star > dataB.star
      end
    end
  end
  return false
end

function BattleFinishWindow.UpdateCardShow()
  if challengeResult.battleData then
    local cardShow = uis.Main.CardShow
    local unitList
    if BattleData.isMirror then
      unitList = challengeResult.battleData.initData.actorRight.unitList
    else
      unitList = challengeResult.battleData.initData.actorLeft.unitList
    end
    local fashionList = {}
    for i, v in ipairs(unitList) do
      if v.fashionId and 0 ~= v.fashionId then
        local id = v.id
        local cardConfig = TableData.GetConfig(id, "BaseCard")
        if cardConfig then
          table.insert(fashionList, v.fashionId)
        end
      end
    end
    if #fashionList > 0 then
      local randomIndex = math.random(1, #fashionList)
      local fashionId = fashionList[randomIndex]
      UIUtil.SetCardShowSpineAutoAlpha(fashionId, cardShow.CardShowLoader, cardShow.CardShowHolder)
      local type
      if BattleFinishWindow.IsWin() then
        type = BUBBLE_TYPE_ENUM.WIN
      else
        type = BUBBLE_TYPE_ENUM.LOSE
      end
      PlayUITrans(uis.Main.TalkWord.root, "up"):SetHook("Sign", function()
        curTypingEffect, curSoundEventIns = UIUtil.ShowTalkWord(fashionId, type, {
          wordTxt = uis.Main.TalkWord.WordTxt,
          interval = 0.05
        }, true)
      end)
    end
  end
end

function BattleFinishWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(BattleFinishWindow.CloseWindow)
  uis.Main.DataBtn.onClick:Set(BattleFinishWindow.OpenDataWindow)
  uis.Main.TimeBtn.onClick:Set(BattleFinishWindow.OpenAxisWindow)
  UIUtil.SetText(uis.Main.TimeBtn, T(1167), "WordTxt")
  UIUtil.SetText(uis.Main.DataBtn, T(1168), "WordTxt")
end

function BattleFinishWindow.CloseWindow()
  local closeFun = function()
    SoundUtil.PlayLastMusic()
    local unlocked = false
    if challengeResult and challengeResult.firstPass then
      unlocked = EnterClampUtil.CheckBackHome(challengeResult.stageId)
    end
    if unlocked then
      UIMgr:CloseToWindow(WinResConfig.HomeWindow.name)
    elseif challengeResult and BattleData.IsGuildTrain(challengeResult.sceneType) and BattleData.tempAbort then
      ld("Formation", function()
        local params = {
          sceneType = challengeResult.sceneType,
          stageId = challengeResult.stageId
        }
        FormationMgr.TryOpenFormationWindow(params)
      end)
    else
      UIMgr:CloseWindow(WinResConfig.BattleFinishWindow.name)
    end
    challengeResult = nil
    showLevelUp = false
  end
  local startQuitFun = function()
    if showLevelUp then
      OpenWindow(WinResConfig.LevelUpWindow.name, nil, closeFun, BattleData.tempLevel)
    else
      closeFun()
    end
  end
  startQuitFun()
end

function BattleFinishWindow.OpenDataWindow()
  local param
  if challengeResult.sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
    param = {}
    local cachedRsp = BattleData.cachedChallengeStageRsp
    for i, v in ipairs(cachedRsp) do
      table.insert(param, v)
    end
    table.insert(param, challengeResult)
  else
    param = {challengeResult}
  end
  OpenWindow(WinResConfig.BattleDataWindow.name, nil, param)
end

function BattleFinishWindow.OpenAxisWindow()
  local param
  if challengeResult.sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
    param = {}
    local cachedRsp = BattleData.cachedChallengeStageRsp
    for i, v in ipairs(cachedRsp) do
      table.insert(param, v)
    end
    table.insert(param, challengeResult)
  else
    param = {challengeResult}
  end
  OpenWindow(WinResConfig.BattleAxisWindow.name, nil, param)
end

function BattleFinishWindow.InitText()
end

function BattleFinishWindow.CancelSave()
  if uis then
    uis.Main.SetAutoBtn.c1Ctr.selectedIndex = 0
    uis.Main.SetAutoBtn.root.touchable = false
    uis.Main.SetAutoBtn.Tips1.c1Ctr.selectedIndex = 1
    uis.Main.SetAutoBtn.Tips1.WordTxt.text = T(10306)
  end
end

function BattleFinishWindow.UpdateAutoBtnText()
end

function BattleFinishWindow.DelayedCall()
  LeanTween.delayedCall(1, function()
    if true == showLevelUp then
      BattleFinishWindow.CloseWindow()
    end
  end)
end

function BattleFinishWindow.OnShown()
end

function BattleFinishWindow.OnHide()
end

function BattleFinishWindow.StopTalk()
  if curTypingEffect then
    curTypingEffect:Cancel()
    curTypingEffect = nil
  end
  if curSoundEventIns then
    SoundUtil.StopSoundEvent(curSoundEventIns)
    curTypingEffect = nil
  end
end

function BattleFinishWindow.OnClose()
  BattleData.ClearCachedChallengeStageRsp()
  BattleData.Clear()
  BattleFinishWindow.StopTalk()
  uis = nil
  contentPane = nil
  BattleData.tempLevel = nil
  BattleData.tempAbort = nil
end

function BattleFinishWindow.HandleMessage(msgId, para)
end

return BattleFinishWindow
