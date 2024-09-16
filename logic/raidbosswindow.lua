require("RaidBoss_RaidBossWindowByName")
local RaidBossWindow = {}
local uis, contentPane, selectedLevelIndex, selectedRoundIndex, loaded, gameObjects, spine_parts, backgroundEffect
local level_color_lookup = {
  [1] = {
    0,
    0,
    48,
    100
  },
  [2] = {
    143,
    65,
    100,
    100
  },
  [3] = {
    187,
    65,
    100,
    100
  },
  [4] = {
    291,
    65,
    100,
    100
  },
  [5] = {
    40,
    65,
    100,
    100
  },
  [6] = {
    2,
    83,
    100,
    100
  },
  [7] = {
    2,
    31,
    0,
    100
  },
  [8] = {
    2,
    31,
    0,
    100
  },
  [9] = {
    2,
    31,
    0,
    100
  }
}
local colorChangedParticleSystems, tweenId
local getfilename = function(path)
  return string.match(path, ".+/([^/]*%.%w+)$")
end
local stripeextension = function(filename)
  local idx = filename:match(".+()%.%w+$")
  if idx then
    return filename:sub(1, idx - 1)
  else
    return filename
  end
end
local LoadEffect = function(path, root, index)
  local filename = stripeextension(getfilename(path))
  local holderName = string.format("%s_holder", filename)
  local holder = root:GetChild(holderName)
  if not holder then
    holder = CS.FairyGUI.UIObjectFactory.NewObject(CS.FairyGUI.ObjectType.Graph)
    holder.name = holderName
    UIUtil.SetHolderCenter(holder)
    if type(index) == "number" then
      root:AddChildAt(holder, index)
    else
      root:AddChild(holder)
    end
  end
  local go = ResourceManager.Instantiate(path)
  local transform = go.transform
  transform.localScale = Vector3.one
  UIUtil.SetObjectToUI(go, holder, 10000)
  return holder, go
end
local LoadBossSpineAndEffects = function(paths, root)
  if loaded then
    return
  end
  loaded = true
  spine_parts = spine_parts or {}
  gameObjects = gameObjects or {}
  table.clear(spine_parts)
  table.clear(gameObjects)
  local childIndex = 1
  for _, v in ipairs(paths) do
    local path = v.path
    local offset = v.offset
    local offsetIndex = v.offsetIndex or 0
    local filename = stripeextension(getfilename(path))
    local holderName = string.format("%s_holder", filename)
    local holder = root:GetChild(holderName)
    if not holder then
      holder = CS.FairyGUI.UIObjectFactory.NewObject(CS.FairyGUI.ObjectType.Graph)
      root:AddChildAt(holder, childIndex + offsetIndex)
      holder.name = holderName
      UIUtil.SetHolderCenter(holder)
      childIndex = childIndex + offsetIndex + 1
    end
    local go = ResourceManager.Instantiate(path)
    local transform = go.transform
    transform.localScale = Vector3.one
    UIUtil.SetObjectToUI(go, holder, 10000)
    if offset then
      transform.localPosition = offset
    else
      transform.localPosition = Vector3.zero
    end
    local sa = SkeletonAnimationUtil.GetSkeletonAnimation(go)
    if sa and not sa:IsNull() then
      table.insert(spine_parts, go)
    end
    table.insert(gameObjects, go)
  end
end
local SetBossSpinesAndEffectsActive = function(active)
  if gameObjects then
    for _, v in ipairs(gameObjects) do
      v:SetActive(active)
    end
  end
end
local SetGameObjectsLayer = function(layerName)
  if gameObjects then
    for _, v in ipairs(gameObjects) do
      LuaUtil.ChangeLayer(v.transform, layerName, true)
    end
  end
end
local SetBossSpineAnimation = function(track, anim, loop, callback, fade)
  if not spine_parts then
    return
  end
  local progress = 0
  for _, part in ipairs(spine_parts) do
    if type(callback) == "function" then
      local oncomplete = function()
        progress = progress + 1
        if progress == #spine_parts then
          callback(part)
        end
      end
      if fade then
        SkeletonAnimationUtil.SetAnimation(part, track, anim, loop, oncomplete)
      else
        SkeletonAnimationUtil.SetAnimation(part, track, anim, loop, oncomplete, true, "0")
      end
    elseif fade then
      SkeletonAnimationUtil.SetAnimation(part, track, anim, loop, nil)
    else
      SkeletonAnimationUtil.SetAnimation(part, track, anim, loop, nil, true, "0")
    end
  end
end
local SelectLevel = function(index, playanim)
  local dotlist = uis.Main.BossMain.Difficulty.DotList
  local numItems = dotlist.numItems
  local parentPos = dotlist.container.position
  for i = 0, numItems - 1 do
    local child = dotlist:GetChildAt(i)
    local selected = i == index
    local childWidth = child.width
    local columnGap = dotlist.columnGap
    local posX = i * (childWidth + columnGap)
    if selected then
      local fadeWidth = 28
      local leftPosX = posX - columnGap - childWidth + parentPos.x
      local rightPosX = posX + parentPos.x + columnGap + childWidth * 2
      local containerWidth = dotlist.size.x
      local scrollpane = dotlist.scrollPane
      local scrollpaneX = scrollpane.posX
      if fadeWidth > leftPosX and i >= 0 then
        scrollpane:SetPosX(scrollpaneX + leftPosX, playanim)
      elseif rightPosX > containerWidth - fadeWidth then
        local delta = rightPosX - containerWidth
        scrollpane:SetPosX(scrollpaneX + delta, playanim)
      end
    end
    ChangeUIController(child, "c2", selected and 1 or 0)
  end
end
local RefreshPanelInfo
local LevelDotItemRenderer = function(i, gcmp)
  local levels = RaidBossData.GetLevelList()
  local id = levels[i + 1]
  local stageConf = TableData.GetConfig(id, "BaseStage")
  local isHardest = RaidBossMgr.IsHardestLevel(id)
  ChangeUIController(gcmp, "c1", isHardest and 1 or 0)
  local child = gcmp:GetChild(isHardest and "Dot1" or "Dot")
  UIUtil.SetText(child, stageConf.name_detail(), "NumberTxt")
  local isPassed = RaidBossMgr.IsPassed(id)
  ChangeUIController(child, "c1", isPassed and 0 or i == RaidBossMgr.GetLatestLevelIndex() and 1 or 2)
  gcmp.onClick:Set(function()
    if i <= RaidBossMgr.GetLatestLevelIndex() then
      SelectLevel(i, true)
      RefreshPanelInfo(false, i, nil, true)
    else
      FloatTipsUtil.ShowWarnTips(T(20293))
    end
  end)
  ChangeUIController(child, "c2", selectedLevelIndex == i and 1 or 0)
end
local RoundItemRenderer = function(i, gcmp)
  UIUtil.SetText(gcmp, i + 1, "WordTxt")
  local levels = RaidBossData.GetLevelList()
  local stageId = levels[selectedLevelIndex + 1]
  local conf = TableData.GetConfig(stageId, "BaseStage")
  local curRounds = conf.rounds or 3
  local latestRoundIndex = RaidBossMgr.GetLatestRoundIndex()
  if curRounds < i + 1 then
    ChangeUIController(gcmp, "c1", 3)
  else
    ChangeUIController(gcmp, "c1", i < latestRoundIndex and 0 or i > latestRoundIndex and 2 or 1)
  end
  gcmp.onClick:Set(function()
    if i + 1 <= curRounds then
      local latestRoundIndex = RaidBossMgr.GetLatestRoundIndex()
      if latestRoundIndex >= i and i ~= selectedRoundIndex then
        RefreshPanelInfo(true, selectedLevelIndex, i)
      elseif latestRoundIndex < i then
        FloatTipsUtil.ShowWarnTips(T(20328))
      end
    end
  end)
end
local card_Id_fashion_list
local CardHeadItemRenderer = function(i, gcmp)
  local item = card_Id_fashion_list[i + 1]
  local cardId = item.cardId
  local fashionId = item.fashionId
  local cardHeadBtn = gcmp:GetChild("CardHeadBtn")
  local loader = cardHeadBtn:GetChild("CardPic"):GetChild("CardPicLoader")
  local occupation = cardHeadBtn:GetChild("Occupation")
  local elementList = cardHeadBtn:GetChild("ElementList")
  local cardConf = TableData.GetConfig(cardId, "BaseCard")
  UIUtil.SetHeadByFaceId(fashionId, loader, HEAD_ICON_TYPE_ENUM.RECT)
  UIUtil.SetText(cardHeadBtn, cardConf.name(), "NameTxt")
  ChangeUIController(occupation, "c1", cardConf.type - 1)
  UIUtil.ShowElementList(elementList, cardConf)
end

function RefreshPanelInfo(challenging, levelIndex, roundIndex, play_enter_effect)
  if play_enter_effect and colorChangedParticleSystems then
    local group = LuaUtil.FindChild(backgroundEffect, "change_color_grp", true)
    local colorHSV = level_color_lookup[levelIndex + 1]
    local colorRgb = Color.HSVToRGB(colorHSV[1] / 360, colorHSV[2] / 100, colorHSV[3] / 100)
    for i = 1, colorChangedParticleSystems.Length do
      local particleSystem = colorChangedParticleSystems[i - 1]
      particleSystem.main.startColor = CS.UnityEngine.ParticleSystem.MinMaxGradient(colorRgb)
    end
    local groupTrans = group.transform
    local glow3 = groupTrans:GetChild(3).gameObject
    local glow4 = groupTrans:GetChild(4).gameObject
    if 6 == levelIndex then
      local color = Color.HSVToRGB(0.1638888888888889, 0.64, 1.0)
      local particleSystem = glow3:GetComponent(typeof(CS.UnityEngine.ParticleSystem))
      particleSystem.main.startColor = CS.UnityEngine.ParticleSystem.MinMaxGradient(color)
      particleSystem = glow4:GetComponent(typeof(CS.UnityEngine.ParticleSystem))
      particleSystem.main.startColor = CS.UnityEngine.ParticleSystem.MinMaxGradient(color)
    end
    LuaUtil.PlayEffect(group)
    local black_red_group = LuaUtil.FindChild(backgroundEffect, "black_red", true)
    local black_gold_group = LuaUtil.FindChild(backgroundEffect, "black_gold", true)
    local display = levelIndex >= 7
    if display then
      if levelIndex > 7 then
        black_red_group:SetActive(true)
        local transform = black_red_group.transform
        for i = 1, transform.childCount do
          transform:GetChild(i - 1).gameObject:SetActive(true)
        end
        black_gold_group:SetActive(false)
        LuaUtil.PlayEffect(black_red_group)
      else
        black_red_group:SetActive(false)
        black_gold_group:SetActive(true)
        local transform = black_gold_group.transform
        for i = 1, transform.childCount do
          transform:GetChild(i - 1).gameObject:SetActive(true)
        end
        LuaUtil.PlayEffect(black_gold_group)
      end
    else
      black_red_group:SetActive(false)
      black_gold_group:SetActive(false)
    end
  end
  local startChallengeText = T(20290)
  local sweepText = T(20291)
  local initialPanel = uis.Main.BossMain
  local challengingPanel = uis.Main.BattleStartMain
  local numLevels = RaidBossMgr.GetLevelsCount()
  local hp, maxHp = RaidBossData.GetBossHp(), RaidBossData.GetBossMaxHp()
  local levels = RaidBossData.GetLevelList()
  local stageId = levels[levelIndex + 1]
  local conf = TableData.GetConfig(stageId, "BaseStage")
  selectedLevelIndex = levelIndex
  local highestText = T(20259)
  local data = RaidBossData.GetRaidBossData()
  local passed = RaidBossMgr.IsPassed(conf.id)
  local inProgress = RaidBossMgr.IsInProgress()
  if challenging and inProgress then
    local raidBossConf = RaidBossMgr.GetCurrentRaidBossConfig()
    LoadBossSpineAndEffects(raidBossConf.presets_paths, uis.Main.root)
    SetBossSpinesAndEffectsActive(true)
    if play_enter_effect then
      SetGameObjectsLayer("Default")
      SetBossSpineAnimation(0, raidBossConf.entrance_anim, false, function(go)
        SetBossSpineAnimation(0, raidBossConf.idle_anim, true, nil, true)
      end)
      if raidBossConf.entrance_anim_effect_path then
        LoadEffect(raidBossConf.entrance_anim_effect_path, uis.Main.root)
      end
      LeanTween.delayedCall(0.01, function()
        if gameObjects then
          for _, v in ipairs(gameObjects) do
            LuaUtil.PlayEffect(v)
          end
        end
        SetGameObjectsLayer("UI")
      end)
    else
      if gameObjects then
        for _, v in ipairs(gameObjects) do
          LuaUtil.SimulateEffect(v, 1.5, true)
        end
      end
      SetBossSpineAnimation(0, raidBossConf.idle_anim, true, nil, true)
    end
    if RaidBossMgr.IsHardestLevel(stageId) then
      if raidBossConf.hardest_additive_anim then
        SetBossSpineAnimation(1, raidBossConf.hardest_additive_anim, true)
      end
    elseif spine_parts then
      for i, v in ipairs(spine_parts) do
        local sa = SkeletonAnimationUtil.GetSkeletonAnimation(v)
        if sa then
          sa.state:ClearTrack(1)
        end
      end
    end
    uis.Main.c1Ctr.selectedIndex = 1
    roundIndex = roundIndex or 0
    selectedRoundIndex = roundIndex
    local currentText = T(20258)
    local currentLevelText = T(20260, conf.name_detail())
    local roundText = T(20261)
    local simulateModeText = T(20262)
    local damageRecordText = T(20263)
    local remainHpText = string.format("%s/%s[color=#ffcc00](%s%%)[/color]", string.formatNum(hp, 3), string.formatNum(maxHp, 3), math.floor(100 * hp / maxHp))
    local hardestLevel = RaidBossMgr.IsHardestLevel(stageId)
    ChangeUIController(challengingPanel.BattleInfo1.root, "c1", hardestLevel and 1 or 0)
    if hardestLevel then
      local currentDmg = 0
      if data.challenge then
        for i, v in ipairs(data.challenge) do
          currentDmg = currentDmg + v.score
        end
      end
      local newNumber = challengingPanel.BattleInfo1.BattleNumberRegion.BattleNumberNew
      newNumber.NumberTxt.text = currentDmg > 0 and string.formatNum(currentDmg, 3) or T(20330)
      newNumber.WordTxt.text = currentText
      local position = newNumber.WordTxt.position
      local width = position.x + newNumber.WordTxt.width
      local x = newNumber.NumberTxt.position.x
      if width >= x then
        position.x = position.x - (width - x)
        newNumber.WordTxt.position = position
      end
      local recordNumber = challengingPanel.BattleInfo1.BattleNumberRegion.BattleNumberRecord
      recordNumber.NumberTxt.text = string.formatNum(data.highScore, 3)
      recordNumber.WordTxt.text = highestText
      position = recordNumber.WordTxt.position
      width = position.x + recordNumber.WordTxt.width
      x = recordNumber.NumberTxt.position.x
      if width >= x then
        position.x = position.x - (width - x)
        recordNumber.WordTxt.position = position
      end
      challengingPanel.BattleInfo1.BossHPInfo.HPProgressBar.asProgress.value = 100
      challengingPanel.BattleInfo1.BossHPInfo.WordTxt.text = currentLevelText
      challengingPanel.BattleInfo1.BossHPInfo.DifficultyDot.NumberTxt.text = conf.name_detail()
      UIUtil.SetText(challengingPanel.BattleInfo1.BossHPInfo.root:GetChild("Infinite"), T(20495), "WordTxt")
    else
      challengingPanel.BattleInfo1.BossHPInfo.WordTxt.text = currentLevelText
      challengingPanel.BattleInfo1.BossHPInfo.NumberTxt.text = remainHpText
      challengingPanel.BattleInfo1.BossHPInfo.HPProgressBar.asProgress.value = 100 * (hp / maxHp)
      challengingPanel.BattleInfo1.BossHPInfo.DifficultyDot.NumberTxt.text = conf.name_detail()
    end
    ChangeUIController(challengingPanel.BattleInfo1.BossHPInfo.DifficultyDot.root, "c1", passed and 0 or levelIndex == RaidBossMgr.GetLatestLevelIndex() and 1 or 2)
    ChangeUIController(challengingPanel.BattleInfo1.BossHPInfo.DifficultyDot.root, "c2", 1)
    UIUtil.SetBtnText(challengingPanel.BattleInfo.GoBattleBtn, T(20336))
    UIUtil.SetBtnText(challengingPanel.BattleInfo.TestBattleBtn, simulateModeText)
    challengingPanel.BattleInfo.BattleRound.WordTxt.text = roundText
    local roundlist = challengingPanel.BattleInfo.BattleRound.RoundList
    local rounds = type(conf.rounds) == "number" and conf.rounds or 0
    challengingPanel.BattleInfo.BattleRound.c1Ctr.selectedIndex = rounds > 0 and rounds - 1 or 0
    roundlist.numItems = 3
    roundlist.selectedIndex = roundIndex
    local challenged = roundIndex < RaidBossMgr.GetLatestRoundIndex()
    ChangeUIController(challengingPanel.BattleInfo.root, "c1", challenged and 1 or 0)
    if challenged then
      challengingPanel.BattleInfo.BattleNumber.WordTxt.text = damageRecordText
      local headlist = challengingPanel.BattleInfo.HeadList
      local records = RaidBossData.GetLevelRecords()
      local record = records[roundIndex + 1]
      local score = record.score
      local damage = string.formatNum(score, 3)
      local displayPercent = not RaidBossMgr.IsHardestLevel(stageId)
      local damageText = displayPercent and string.format("%s(%s%%)", damage, math.ceil(100 * score / maxHp)) or string.format("%s", damage)
      challengingPanel.BattleInfo.BattleNumber.NumberTxt.text = damageText
      local map = record.cardList
      card_Id_fashion_list = card_Id_fashion_list or {}
      table.clear(card_Id_fashion_list)
      for i, v in pairs(map) do
        table.insert(card_Id_fashion_list, {cardId = i, fashionId = v})
      end
      headlist.numItems = #card_Id_fashion_list
    else
    end
    challengingPanel.BattleInfo.GoBattleBtn.onClick:Set(function()
      if tweenId then
        return
      end
      local simulate = challengingPanel.BattleInfo.TestBattleBtn.selected
      SetBossSpineAnimation(0, raidBossConf.battle_anim, false, nil, true)
      if raidBossConf.battle_anim_effect_path then
        LoadEffect(raidBossConf.battle_anim_effect_path, uis.Main.root)
      end
      tweenId = LeanTween.delayedCall(raidBossConf.battle_anim_stop_time, function()
        RaidBossMgr.PrepareEnterBattle(stageId, simulate, function()
          tweenId = nil
        end)
        for i, v in pairs(spine_parts) do
          SkeletonAnimationUtil.StopAnimation(v, raidBossConf.battle_anim)
        end
      end).id
    end)
    challengingPanel.BattleOutBtn.onClick:Set(function()
      if tweenId then
        return
      end
      local giveup = function()
        RaidBossService.GiveUpReq(stageId)
      end
      local records = RaidBossData.GetLevelRecords()
      if records and _G.next(records) then
        OpenWindow(WinResConfig.RaidBossGiveUpWindow.name, nil, giveup)
      else
        giveup()
      end
    end)
  else
    SetBossSpinesAndEffectsActive(false)
    initialPanel.BattleBeforeInfo.GoBattleBtn.visible = not passed and inProgress
    ChangeUIController(initialPanel.BattleBeforeInfo.root, "c1", not (not passed and inProgress) and 1 or 0)
    initialPanel.BattleBeforeInfo.BattleClear.WordTxt.text = inProgress and T(20327) or T(20349)
    initialPanel.LeftArrowBtn.visible = levelIndex > 0
    initialPanel.RightArrowBtn.visible = levelIndex < RaidBossMgr.GetLatestLevelIndex()
    uis.Main.c1Ctr.selectedIndex = 0
    local bossNameText = conf.name()
    local hardest = levelIndex + 1 == RaidBossMgr.GetLevelsCount()
    local count = RaidBossData.GetRemainingChallenges(hardest)
    local numChallengeText = hardest and T(20294, count, 3) or T(20310, count, 3)
    initialPanel.BattleBeforeInfo.BossName.NameTxt.text = bossNameText
    initialPanel.BattleBeforeInfo.BattleNumber.NumberTxt.text = numChallengeText
    local number = initialPanel.BattleNumberRecord
    local highestScore = data.highScore
    local levelId = RaidBossData.GetLevelIdByDifficult(data.highScoreDiff)
    if levelId then
      local stageConf = TableData.GetConfig(levelId, "BaseStage")
      number.WordTxt.text = string.format("%s%s", T(20288), stageConf.name_detail())
    else
      number.WordTxt.text = highestText
    end
    initialPanel.c1Ctr.selectedIndex = highestScore > 0 and 1 or 0
    number.NumberTxt.text = string.formatNum(highestScore, 3)
    local dotlist = initialPanel.Difficulty.DotList
    dotlist.numItems = numLevels
    initialPanel.LeftArrowBtn.onClick:Set(function()
      SelectLevel(levelIndex - 1, true)
      RefreshPanelInfo(challenging, levelIndex - 1, nil, true)
    end)
    initialPanel.RightArrowBtn.onClick:Set(function()
      local targetLevelIndex = levelIndex + 1
      if targetLevelIndex <= RaidBossMgr.GetLatestLevelIndex() then
        SelectLevel(targetLevelIndex, true)
        RefreshPanelInfo(challenging, targetLevelIndex, nil, true)
      end
    end)
    UIUtil.SetBtnText(initialPanel.BattleBeforeInfo.GoBattleBtn, startChallengeText)
    initialPanel.BattleBeforeInfo.GoBattleBtn.onClick:Set(function()
      if RaidBossData.GetRemainingChallenges(RaidBossMgr.IsHardestLevel(stageId)) <= 0 then
        FloatTipsUtil.ShowWarnTips(T(20292))
        return
      end
      if levelIndex < RaidBossMgr.GetLatestLevelIndex() then
        OpenWindow(WinResConfig.RaidBossQuickBattleWindow.name, nil, stageId)
      else
        RaidBossService.StartBossChallengeReq(function()
          uis.Main.c1Ctr.selectedIndex = 1
          RefreshPanelInfo(true, levelIndex, nil, true)
        end)
      end
    end)
  end
  local rankUpInfo = RaidBossData.GetRankUpdateInfo()
  if rankUpInfo then
    OpenWindow(WinResConfig.RaidBossRankChangeWindow.name, nil, rankUpInfo)
    RaidBossData.SetRankUpdateInfo(nil)
  end
end

function RaidBossWindow.ReInitData()
end

function RaidBossWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RaidBossWindow.package, WinResConfig.RaidBossWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRaidBoss_RaidBossWindowUis(contentPane)
    RaidBossWindow.UpdateInfo()
    RaidBossWindow.InitBtn()
  end)
end

function RaidBossWindow.UpdateInfo()
  SoundUtil.PlayMusic(30008)
  local content = TimeUtil.FormatDate("%Y_%m_%d", LoginData.serverTime)
  PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.RAID_BOSS_HAS_CHALLENGE_COUNT, content)
  PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.RAID_BOSS_SEASON_RECORD, RaidBossData.GetSeason())
  if RedDotRaidBoss.IsNearlyDeadline() then
    local deadline = RaidBossData.GetDeadline()
    local concat = string.format("%s_%s", deadline, content)
    PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.RAID_BOSS_DEADLINE, concat)
  end
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.RaidBossWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.ADVENTURE_RAID)
  local conf = RaidBossMgr.GetCurrentRaidBossConfig()
  backgroundEffect = ResourceManager.Instantiate(conf.home_effect_path)
  local group = LuaUtil.FindChild(backgroundEffect, "change_color_grp", true)
  colorChangedParticleSystems = group:GetComponentsInChildren(typeof(CS.UnityEngine.ParticleSystem))
  local holder = uis.Main.BackGround.BackGroundHolder
  uis.Main.BossMain.Difficulty.DotList.itemRenderer = LevelDotItemRenderer
  uis.Main.BattleStartMain.BattleInfo.HeadList.itemRenderer = CardHeadItemRenderer
  uis.Main.BattleStartMain.BattleInfo.BattleRound.RoundList.itemRenderer = RoundItemRenderer
  UIUtil.SetHolderCenter(holder)
  UIUtil.SetObjectToUI(backgroundEffect, holder, 10000)
  LuaUtil.PlayEffect(backgroundEffect)
  local challenging = RaidBossMgr.IsChallenging()
  local latestLevelIndex = RaidBossMgr.GetLatestLevelIndex()
  local latestRoundIndex = RaidBossMgr.GetLatestRoundIndex()
  RefreshPanelInfo(challenging, latestLevelIndex, latestRoundIndex, true)
  if not challenging then
    SelectLevel(latestLevelIndex, true)
  end
  local recordBtnText = T(20264)
  local giveUpBtnText = T(20265)
  UIUtil.SetBtnText(uis.Main.BattleStartMain.BattleRecordBtn, recordBtnText)
  UIUtil.SetBtnText(uis.Main.BattleStartMain.BattleOutBtn, giveUpBtnText)
  RedDotMgr.AddNode({
    windowName = WinResConfig.RaidBossWindow.name,
    com = uis.Main.RewardBtn,
    visibleFunc = function()
      return RedDotRaidBoss.HasAnyRewards()
    end,
    dataType = RED_DOT_DATA_TYPE.ADVENTURE
  })
  local data = RaidBossData.GetRaidBossData()
  local outofdate = LoginData.GetCurServerTime() > data.nextStartStamp
  if outofdate then
    RaidBossService.GetRaidBossInfoReq()
  end
end

function RaidBossWindow.InitBtn()
  uis.Main.BattleStartMain.BattleRecordBtn.onClick:Set(function()
    if tweenId then
      return
    end
    local records = RaidBossData.GetLevelRecords()
    if not records or not _G.next(records) then
      FloatTipsUtil.ShowWarnTips(T(20329))
      return
    end
    OpenWindow(WinResConfig.RaidBossActionRecordWindow.name, nil, ActorData.GetUin(), records, RaidBossData.GetRaidBossData().curStage, true)
  end)
  uis.Main.RewardBtn.onClick:Set(function()
    if tweenId then
      return
    end
    OpenWindow(WinResConfig.RaidBossRewardShowWindow.name)
  end)
  uis.Main.RankBtn.onClick:Set(function()
    if tweenId then
      return
    end
    RaidBossService.GetRaidBossInfoReq(function()
      OpenWindow(WinResConfig.RaidBossPlayerRankWindow.name)
    end)
  end)
end

function RaidBossWindow.OnClose()
  uis = nil
  contentPane = nil
  loaded = false
  if spine_parts then
    table.clear(spine_parts)
  end
  if gameObjects then
    table.clear(gameObjects)
  end
  spine_parts = nil
  gameObjects = nil
  if tweenId then
    LeanTween.cancel(tweenId)
  end
  tweenId = nil
  backgroundEffect = nil
  colorChangedParticleSystems = nil
  card_Id_fashion_list = nil
  RedDotMgr.RemoveNode(WinResConfig.RaidBossWindow.name)
end

function RaidBossWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.RaidBossWindow.REFRESH_PANEL_INFO then
    local challenging = RaidBossMgr.IsChallenging()
    if challenging then
      RefreshPanelInfo(true, RaidBossMgr.GetLatestLevelIndex(), RaidBossMgr.GetLatestRoundIndex())
    else
      RefreshPanelInfo(false, selectedLevelIndex)
    end
  elseif msgId == WindowMsgEnum.RaidBossWindow.GIVE_UP_CHALLENGE then
    local index = RaidBossMgr.GetLatestLevelIndex()
    RefreshPanelInfo(false, index)
    SelectLevel(index)
  end
end

return RaidBossWindow
