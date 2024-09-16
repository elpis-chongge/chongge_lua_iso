require("Battle_BattleUIWindowByName")
local BattleUIWindow = {}
local uis, contentPane, battleUIWindowObjectPool, skillIcon, skillDrag, skillDragIcon, curSkill, curLineEffectRed, curLineEffectBlue, curTargetLineRed, curTargetLineBlue, curTargetLine, lineStartX, lineStartY
local LineRendererHelper = CS.LineRendererHelper
local targetSpValue
local skillList = {}
local leftHpCountTestText, rightHpCountTestText
local cardList = {}
local cardChooseTweener, maskTexture, cardBuffTipsUnit, curTouchCardUid
local cachedCardBuffList = {}
local cardListIndexInParent, originCardListX, originCardListY, burstEffectBackHolder, burstEffectHolder, burstEffectDisableHolder, burstEffectPlayingHolder, burstProgressBarHolder, burstProgressBarDarkHolder, burstEnergyEffect, burstFullEffectGameObject, burstPlayingEffectGameObject, burstDisableEffectGameObject, burstCDProgressBarFlash, burstProgressBarEffect, burstProgressBarDarkEffect, chargeFullEffect, chargeFullEffectHolder, lastDotCount, curBurstState, tempBurstNeedJobList, tempCardForChoose
local btnList = {}
local playHint
local cardHeadRegionList = {}
local burstBtn, burstTime, burstTimeTxt

function BattleUIWindow.ReInitData()
end

function BattleUIWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.BattleUIWindow.package, WinResConfig.BattleUIWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    battleUIWindowObjectPool = battleUIWindowObjectPool or CS.FairyGUI.GObjectPool(CS.Launch.Singleton.transform)
    uis = GetBattle_BattleUIWindowUis(contentPane)
    if BattleData.curWaveIndex and BattleData.curWaveIndex > 1 then
      uis.Main.root.visible = false
    end
    BattleUIWindow.InitBtn()
    BattleUIWindow.UpdateInfo()
    BattleUIWindow.InitBurstEffect()
    BattleUIWindow.InitCardList()
    BattleUIWindow.UpdateSkillArea(true)
    BattleUIWindow.ShowKillEnemyCount()
    contentPane.touchable = false
    if BattleMgr.showLeftHpCountTest then
      if nil == leftHpCountTestText then
        leftHpCountTestText = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Text)
        leftHpCountTestText.stroke = 1
        leftHpCountTestText.color = Color.white
        contentPane:AddChild(leftHpCountTestText)
        leftHpCountTestText:SetXY(20, contentPane.height / 3)
        leftHpCountTestText.textFormat.size = 30
      end
      if nil == rightHpCountTestText then
        rightHpCountTestText = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Text)
        rightHpCountTestText.stroke = 1
        rightHpCountTestText.color = Color.white
        contentPane:AddChild(rightHpCountTestText)
        rightHpCountTestText:SetXY(contentPane.width - 100, contentPane.height / 3)
        rightHpCountTestText.textFormat.size = 30
      end
    end
    if BattleMgr.showLeftDamageCount then
      local integral = uis.Main.Integral
      integral.root.visible = true
      integral.c1Ctr.selectedIndex = 1
      integral.WordTxt.text = T(10763)
      integral.NumberTxt.text = 0
    end
    if BattleMgr.showPathTest then
      BattlePathFinding.CreateTestGrid(uis.Main.root)
    end
  end)
end

function BattleUIWindow.UpdateHangUpState(close)
  local hangUpRoot = uis.Main.HangUpWindow.root
  local hangUp = uis.Main.HangUpWindow.HangUp.root
  uis.Main.c1Ctr.selectedIndex = 0
  hangUp.touchable = false
  hangUpRoot.visible = false
  if close then
    LeanTween.delayedCall(0.3, function()
      if IsNil(hangUpRoot) == false then
        PlayUITrans(hangUpRoot, "out", function()
          if IsNil(hangUpRoot) == false then
            hangUpRoot.visible = false
          end
        end)
      end
    end):setIgnoreTimeScale(true)
    BattleUIWindow.UpdateBtn()
  end
end

function BattleUIWindow.UpdateSpeed()
  BattleControl.baseTimeScale = BattleData.speedList[BattleData.speedIndex]
  if 0 ~= LoginData.gameTimescale then
    LoginData.SetTimeScale(BattleControl.timescaleSlowRatio or BattleControl.baseTimeScale)
  end
  SoundUtil.SetSfxSpeedInBattle(BattleData.speedIndex)
end

function BattleUIWindow.UpdateInfo()
  BattleUIWindow.InitScoreInfo()
  BattleUIWindow.UpdateWave()
  BattleUIWindow.UpdateHangUpState()
  BattleUIWindow.UpdateBtn()
  BattleUIWindow.UpdateRemainTime()
  BattleUIWindow.UpdateAutoTips()
  BattleUIWindow.UpdateBurstInfo()
end

function BattleUIWindow.InitScoreInfo()
  if BattleData.scoreInfo then
    uis.Main.BuffAddCtr.selectedIndex = 1
    local buffId = BattleData.addBuffId
    local buffAddTag = uis.Main.BuffAddTag
    if buffId then
      buffAddTag.c1Ctr.selectedIndex = 0
      local buffTag = buffAddTag.Tag1
      buffTag.NameTxt.text = T(11042)
      buffTag.TipsTxt.text = T(11039)
      buffTag.TimeProgressBar.value = 100
    else
      buffAddTag.c1Ctr.selectedIndex = 1
    end
    local scoreTag = buffAddTag.Tag2
    scoreTag.NameTxt.text = T(11038)
    scoreTag.IntegralTxt.text = 0
    if BattleData.challengeTargetInfo then
      function scoreTag.StartList.itemRenderer(index, item)
        local totalScore = BattleData.totalDamageScore + BattleData.totalKillScore
        
        local targetInfo = BattleData.challengeTargetInfo[index + 1]
        if totalScore >= targetInfo.needScore then
          ChangeUIController(item, "c1", 1)
          if targetInfo.meet == false then
            targetInfo.meet = true
            UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Faradventure/FX_ui_faradventureploteff_star.prefab", item:GetChild("EffectHolder"), nil, true)
          end
          if index + 1 == #BattleData.challengeTargetInfo then
            BattleData.curNeedScore = targetInfo.needScore
          end
        else
          ChangeUIController(item, "c1", 0)
          if BattleData.curNeedScore == nil then
            BattleData.curNeedScore = targetInfo.needScore
          end
        end
      end
      
      scoreTag.StartList.numItems = #BattleData.challengeTargetInfo
      scoreTag.IntegralProgressTxt.text = T(11041, 0, NumberByCommaStyle(BattleData.curNeedScore))
    end
  else
    uis.Main.BuffAddCtr.selectedIndex = 0
  end
end

function BattleUIWindow.UpdateScoreInfo()
  local scoreInfo = BattleData.scoreInfo
  if scoreInfo then
    local curFixedTime = BattleControl.curFixedFrame
    local haveBuffAdd, remainFrame, maxFrame
    for i, v in ipairs(scoreInfo) do
      if curFixedTime < v.maxFrame and curFixedTime >= v.minFrame then
        maxFrame = v.maxFrame
        remainFrame = maxFrame - curFixedTime
        haveBuffAdd = v.haveBuffAdd
        break
      end
    end
    local buffId = BattleData.addBuffId
    if buffId then
      local tag = uis.Main.BuffAddTag.Tag1
      if true == haveBuffAdd then
        tag.c1Ctr.selectedIndex = 0
      else
        if 0 == tag.c1Ctr.selectedIndex then
          UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Faradventure/FX_ui_faradventureploteff.prefab", tag.EffectHolder, nil, true)
        end
        tag.c1Ctr.selectedIndex = 1
      end
      tag.NumberTxt.text = T(11040, BattleData.addBuffTotalCount)
      tag.TimeProgressBar.value = 100 * remainFrame / maxFrame
    end
    local scoreTag = uis.Main.BuffAddTag.Tag2
    local totalScore = BattleData.totalDamageScore + BattleData.totalKillScore
    local curScore = NumberByCommaStyle(totalScore)
    scoreTag.IntegralTxt.text = curScore
    if BattleData.challengeTargetInfo then
      BattleData.curNeedScore = nil
      scoreTag.StartList.numItems = #BattleData.challengeTargetInfo
      scoreTag.IntegralProgressTxt.text = T(11041, curScore, NumberByCommaStyle(BattleData.curNeedScore))
    end
  end
end

function BattleUIWindow.UpdateAutoTips()
  if BattleData.forceAuto == true then
    uis.Main.Auto.root.visible = true
    uis.Main.Auto.WordTxt.text = T(11026)
    uis.Main.Auto.DotTxt.text = T(11028)
  else
    uis.Main.Auto.root.visible = false
  end
end

function BattleUIWindow.UpdateDamageCount()
  if BattleMgr.showLeftDamageCount then
    if BattleData.stageType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
      uis.Main.Integral.NumberTxt.text = string.formatNum(BattleData.initRightTotalHP - BattleData.curRightTotalHP, 3)
    else
      uis.Main.Integral.NumberTxt.text = string.formatNum(BattleData.leftTotalDamage, 3)
    end
  end
end

local btnInfoList

function BattleUIWindow.InitBtn()
  btnInfoList = {
    {
      package = "Battle",
      res = "SystemBtn",
      clickFunc = BattleUIWindow.OnClickSettingBtn,
      showCondition = function()
        return GuideMgr.NeedShowBattleSettingBtn()
      end
    },
    {
      package = "Battle",
      res = "SpeedBtn",
      clickFunc = BattleUIWindow.OnClickSpeedBtn
    },
    {
      package = "Battle",
      res = "AutoBtn",
      clickFunc = BattleUIWindow.OnClickAutoBtn
    },
    {
      package = "Battle",
      res = "SkipBtn",
      clickFunc = BattleUIWindow.OnClickSkipBtn,
      showCondition = function()
        return BattleData.stageType == ProtoEnum.SCENE_TYPE.ARENA and BattleMgr.isPlayback == false
      end
    }
  }
  burstBtn = uis.Main.BurstRegion.BurstBtn
  burstTime = burstBtn:GetChild("BurstTime")
  burstTimeTxt = burstTime:GetChild("BurstNumTxt")
end

function BattleUIWindow.UpdateBtn()
  local list = uis.Main.TopLeft.FunctionList
  uis.Main.Stop.root.visible = false
  if BattleMgr.isPlotBattle == true then
    list.visible = false
    uis.Main.Time.root.visible = false
    return
  end
  list:RemoveChildrenToPool()
  btnList = {}
  for i, v in ipairs(btnInfoList) do
    if v.showCondition == nil or true == v.showCondition() then
      local url = UIMgr:GetItemUrl(v.package, v.res)
      local btn = list:AddItemFromPool(url)
      btnList[v.res] = btn
      btn:GetChild("LockTxt").text = T(10319)
      btn.onClick:Set(v.clickFunc)
    end
  end
  BattleUIWindow.UpdateAutoBtn()
  if false == BattleControl.isBurstPause then
    BattleUIWindow.UpdateSpeedBtn()
  end
end

function BattleUIWindow.UpdateRemainTime()
  local remainTimeTxt = uis.Main.Time.TimeNumTxt
  if remainTimeTxt then
    remainTimeTxt.text = TimeUtil.GetTimeStr(math.max((BattleData.totalFixedFrames - BattleControl.curFixedFrame) / BATTLE_CONFIG_ENUM.FIXED_FPS, 0))
  end
  if leftHpCountTestText and BattleControl.curFixedFrame >= 1 then
    local unitList = BattleScene.GetAllUnit()
    local totalHp, totalMaxHp = 0, 0
    for i, v in ipairs(unitList) do
      if v.camp == BATTLE_CAMP_FLAG.LEFT and v.isBuilding == false then
        totalHp = totalHp + v:GetHp()
        totalMaxHp = totalMaxHp + v:GetAttr(ATTR_ENUM.max_hp)
      end
    end
    leftHpCountTestText.text = string.format("%.1f", 100 * totalHp / totalMaxHp) .. "%"
  end
  if rightHpCountTestText and BattleControl.curFixedFrame >= 1 then
    local unitList = BattleScene.GetAllUnit()
    local totalHp, totalMaxHp = 0, 0
    for i, v in ipairs(unitList) do
      if v.camp == BATTLE_CAMP_FLAG.RIGHT and v.isBuilding == false then
        totalHp = totalHp + v:GetHp()
        totalMaxHp = totalMaxHp + v:GetAttr(ATTR_ENUM.max_hp)
      end
    end
    rightHpCountTestText.text = string.format("%.1f", 100 * totalHp / totalMaxHp) .. "%"
  end
end

function BattleUIWindow.UpdateWave()
  if BattleData.stageType == ProtoEnum.SCENE_TYPE.EXPEDITION then
    local wave = uis.Main.Wave
    wave.WaveTxt.text = BattleMgr.GetWaveName(BattleData.curWaveIndex)
    wave.root.visible = true
  end
end

function BattleUIWindow.ShowEnterAnim(callback)
  if uis then
    uis.Main.root.visible = true
    PlayUITrans(uis.Main.root, "up", callback)
    if uis.Main.HangUpWindow.HangUp.root.visible then
      PlayUITrans(uis.Main.HangUpWindow.root, "in1")
    end
  end
end

function BattleUIWindow.ChangeWaveUI()
  PlayUITrans(uis.Main.root, "up", nil, nil, nil, nil, nil, nil, true)
end

function BattleUIWindow.ShowPlayBattleStart()
  local startCom = UIMgr:CreateObject("Battle", "BattleStart")
  if startCom then
    contentPane:AddChild(startCom)
    if BattleData.stageType == ProtoEnum.SCENE_TYPE.EXPEDITION then
      ChangeUIController(startCom, "c1", 1)
      local wave = startCom:GetChild("BattleStartWave")
      wave:GetChild("WaveTxt").text = BattleMgr.GetWaveName(BattleData.curWaveIndex)
      PlayUITrans(wave, "in")
    end
    startCom.size = contentPane.size
    UIUtil.SetBtnText(startCom, T(10311), T(10312))
    startCom:Center()
    PlayUITrans(startCom, "in", function()
      contentPane:RemoveChild(startCom, true)
    end):SetHook("Sign", function()
      BattleUIWindow.ShowEnterAnim(function()
        UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_BATTLE_START)
      end)
    end)
  end
end

function BattleUIWindow.StopUpdateShow()
end

function BattleUIWindow.ShowPlayBattleOver()
  local startCom
  if BattleScene.IsBattleWin() then
    startCom = UIMgr:CreateObject("Battle", "Win")
    UIUtil.SetBtnText(startCom, T(10313), T(10314))
  elseif BattleData.IsBattleNoFail(BattleData.stageType) then
    startCom = UIMgr:CreateObject("Battle", "End")
    UIUtil.SetBtnText(startCom, T(10317), T(10318))
  else
    startCom = UIMgr:CreateObject("Battle", "Fail")
    UIUtil.SetBtnText(startCom, T(10315), T(10316))
  end
  SoundUtil.PlaySfx(100103)
  if startCom then
    contentPane:AddChild(startCom)
    startCom.size = contentPane.size
    startCom:Center()
    LoginData.SetTimeScale(1)
    PlayUITrans(startCom, "in", function()
      contentPane:RemoveChild(startCom, true)
      print_battle("客户端，战斗结束")
      BattleControl.Stop()
    end)
  end
end

function BattleUIWindow.ShowPlayWaveStart()
  BattleUIWindow.UpdateInfo()
  UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_BATTLE_START)
end

function BattleUIWindow.OnClickSkipBtn()
  if BattleScene.IsBattleOver() == true then
    return
  end
  if true == BattleControl.isPause then
    return
  end
  BattleControl.Pause()
  MessageBox.Show(T(10333), {
    touchCallback = function()
      BattleMgr.CloseBattle(true)
    end
  }, {
    touchCallback = function()
      BattleControl.Continue()
    end
  }, {
    touchCallback = function()
      BattleControl.Continue()
    end
  })
end

function BattleUIWindow.OnClickSettingBtn()
  if BattleScene.IsBattleOver() == true then
    return
  end
  local isPause = BattleControl.isPause
  if isPause and BattleControl.isBurstPause == false then
    return
  end
  if cardChooseTweener then
    cardChooseTweener:SetPaused(true)
  end
  BattleScene.SetCardBurstTimerUtilPause(true)
  BattleControl.Pause()
  uis.Main.Stop.WaveWordTxt.text = T(10309)
  uis.Main.Stop.root.visible = true
  PlayUITrans(uis.Main.Stop.root, "in", nil, nil, nil, nil, nil, true)
  local outputTips = uis.Main.Stop.OutTips
  if BattleData.stageType == ProtoEnum.SCENE_TYPE.ARENA and false == BattleMgr.isPlayback then
    outputTips.c1Ctr.selectedIndex = 1
  else
    outputTips.c1Ctr.selectedIndex = 0
  end
  local continueBtn = outputTips.OutTips1Btn
  continueBtn.onClick:Set(function()
    if BattleControl.isBurstPause == false then
      BattleControl.Continue()
    end
    if cardChooseTweener then
      cardChooseTweener:SetPaused(false)
    end
    BattleScene.SetCardBurstTimerUtilPause(false)
    uis.Main.Stop.WaveWordTxt.text = ""
    PlayUITrans(uis.Main.Stop.root, "out", function()
      uis.Main.Stop.root.visible = false
    end)
  end)
  local quitBtn = outputTips.OutTips2Btn
  quitBtn.onClick:Set(function()
    BattleMgr.CloseBattle(true)
  end)
  local settingBtn = outputTips.OutTips3Btn
  settingBtn.onClick:Set(function()
    OpenWindow(WinResConfig.BattleInfoWindow.name)
  end)
  UIUtil.SetBtnText(continueBtn, T(10303))
  UIUtil.SetBtnText(quitBtn, T(10304))
  UIUtil.SetBtnText(settingBtn, T(10300))
end

function BattleUIWindow.OnClickSpeedBtn()
  if BattleScene.IsBattleOver() == true then
    return
  end
  if true == BattleControl.isPause and BattleControl.isBurstPause == false then
    return
  end
  if false == EnterClampUtil.WhetherToEnter(FEATURE_ENUM.BATTLE_SPEED_UP) then
    return
  end
  local speedIndex = BattleData.speedIndex
  if BattleData.speedList[speedIndex + 1] then
    BattleData.speedIndex = speedIndex + 1
  else
    BattleData.speedIndex = 1
  end
  BattleUIWindow.UpdateSpeedBtn()
  if BattleData.stageType then
    ld("Formation")
    local curStageType = FormationMgr.GetPrepareSceneType(BattleData.stageType)
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.BATTLE_SPEED, BattleData.speedIndex, curStageType)
  end
end

function BattleUIWindow.UpdateSpeedBtn()
  local speedBtn = btnList.SpeedBtn
  if speedBtn then
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.BATTLE_SPEED_UP, false) == false then
      ChangeUIController(speedBtn, "lock", 1)
    else
      ChangeUIController(speedBtn, "lock", 0)
    end
    ChangeUIController(speedBtn, "c1", BattleData.speedIndex - 1)
    BattleUIWindow.UpdateSpeed()
  end
end

function BattleUIWindow.OnClickAutoBtn()
  if BattleData.forceAuto == true then
    return
  end
  if true == BattleControl.isPause then
    return
  end
  if true == BattleScene.IsBattleOver() then
    return
  end
  if BattleControl.isBurstPause then
    return
  end
  if BattleMgr.isPlayback then
    return
  end
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.BATTLE_AUTO) == false then
    return
  end
  if false == BattleData.isAuto then
    BattleData.isAuto = true
  else
    BattleData.isAuto = false
  end
  BattleUIWindow.UpdateAutoBtn()
  if BattleData.stageType then
    ld("Formation")
    local curStageType = FormationMgr.GetPrepareSceneType(BattleData.stageType)
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.BATTLE_AUTO_SKILL, BattleData.isAuto and 1 or 0, curStageType)
  end
end

function BattleUIWindow.UpdateAutoBtn()
  local autoBtn = btnList.AutoBtn
  if autoBtn then
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.BATTLE_AUTO, false) == false then
      ChangeUIController(autoBtn, "c1", 0)
      ChangeUIController(autoBtn, "lock", 1)
    else
      if BattleData.isAuto == true then
        ChangeUIController(autoBtn, "c1", 1)
      else
        ChangeUIController(autoBtn, "c1", 0)
      end
      ChangeUIController(autoBtn, "lock", 0)
    end
  end
end

function BattleUIWindow.OnClickStopBtn()
  if BattleScene.IsBattleOver() == true then
    return
  end
  if BattleControl.isBurstPause then
    return
  end
  if true == BattleControl.isPause then
    BattleControl.Continue()
    uis.Main.Stop.WaveWordTxt.text = ""
    PlayUITrans(uis.Main.Stop.root, "out", function()
      uis.Main.Stop.root.visible = false
    end)
  else
    BattleControl.Pause()
    uis.Main.Stop.WaveWordTxt.text = T(10309)
    uis.Main.Stop.root.visible = true
    PlayUITrans(uis.Main.Stop.root, "in")
  end
  BattleUIWindow.UpdateStopBtn()
end

function BattleUIWindow.UpdateStopBtn()
  local stopBtn = btnList.StopBtn
  if stopBtn then
    if BattleControl.isPause == true then
      ChangeUIController(stopBtn, "button", 1)
    else
      ChangeUIController(stopBtn, "button", 0)
    end
  end
end

function BattleUIWindow.UpdateSettingUI()
  BattleUIWindow.UpdateActionUI()
  local allCard = BattleData.GetAliveCards()
  for _, v in ipairs(allCard) do
    v:UpdateHeadInfoVisible()
  end
  BattleUIWindow.UpdateCardRageUI()
end

function BattleUIWindow.OnHide()
end

function BattleUIWindow.BattleStart()
  contentPane.touchable = true
  if true == BattleMgr.isBattleStart then
    return
  end
  BattleMgr.StartBattle()
end

function BattleUIWindow.BattleEnd()
end

function BattleUIWindow.InitCardList()
  if nil == maskTexture then
    maskTexture = ResourceManager.LoadTexture("Assets/Art/TextureSingle/UI/headsquare_mask.png")
  end
  cardList = {}
  cardHeadRegionList = {}
  local cardHeadList = uis.Main.BurstRegion.CardHeadList
  cardHeadList:RemoveChildrenToPool()
end

function BattleUIWindow.AddHeadToList(unit)
  local cardHeadList = uis.Main.BurstRegion.CardHeadList
  local hand = cardHeadRegionList[unit.battleUnitType]
  if nil == hand then
    hand = cardHeadList:AddItemFromPool(0)
    cardHeadRegionList[unit.battleUnitType] = hand
    local occupation = hand:GetChild("Occupation")
    ChangeUIController(occupation, "c1", unit.battleUnitType - 1)
    local textList = {
      T(616),
      T(617),
      T(618),
      T(619),
      T(620)
    }
    local occupationTxt = occupation:GetChild("OccupationTxt")
    occupationTxt.text = textList[unit.battleUnitType]
  end
  local headList = hand:GetChild("HeadList")
  local head = headList:AddItemFromPool(0)
  local loader = head:GetChild("CardHeadBg"):GetChild("HeadLoader")
  local hpProgressBar = head:GetChild("HpProgressBar")
  local angerProgressBar = head:GetChild("AngerProgressBar")
  local firmProgressBar = hpProgressBar:GetChild("FirmProgressBar")
  local soulProgressBar = hpProgressBar:GetChild("SoulProgressBar")
  local defenseProgressBar = head:GetChild("DefenseProgressBar")
  local buffList = head:GetChild("BuffList")
  local CDTimeText = head:GetChild("CDTime")
  local cdProgressBar = head:GetChild("BurstCDProgressBar")
  local cardSign = head:GetChild("CardSign")
  local c3 = head:GetController("c3")
  c3.ignoreTimeScale = true
  local fashionConfig = unit:GetFashionConfig()
  loader.url = UIUtil.GetResUrl(fashionConfig.head_icon_rect)
  if nil ~= maskTexture then
    loader:SetMaskTexture(maskTexture)
  end
  local uid = unit.uid
  cardList[uid] = {
    hand = head,
    loader = loader,
    hpProgressBar = hpProgressBar,
    angerProgressBar = angerProgressBar,
    firmProgressBar = firmProgressBar,
    soulProgressBar = soulProgressBar,
    defenseProgressBar = defenseProgressBar,
    buffList = buffList,
    CDTimeText = CDTimeText,
    cdProgressBar = cdProgressBar,
    cardSign = cardSign,
    c3 = c3
  }
  if unit.haveRage == false then
    angerProgressBar.visible = false
  else
    angerProgressBar.visible = true
  end
  head.onClick:Set(function()
    BattleUIWindow.ClickHead(uid)
  end)
  headList:ResizeToFit()
end

function BattleUIWindow.UpdateCard(unitUid, unit, barInfo)
  unitUid = unitUid or unit.uid
  local cardInfo = cardList[unitUid]
  if nil == cardInfo then
    return
  end
  if barInfo then
    if barInfo.hpPer then
      local hpProgressBar = cardInfo.hpProgressBar
      hpProgressBar.value = 100 * barInfo.hpPer
      local defenseValue = barInfo.defenseValue
      local defenseProgressBar = cardInfo.defenseProgressBar
      if defenseValue and defenseValue > 0 then
        defenseProgressBar.visible = true
        defenseProgressBar.x = math.floor(hpProgressBar.x + hpProgressBar.width * barInfo.hpPer)
        defenseProgressBar.value = defenseValue
      else
        defenseProgressBar.visible = false
      end
    end
    if barInfo.rageValue and unit.haveRage then
      local angerProgressBar = cardInfo.angerProgressBar
      if 100 == barInfo.rageValue or 0 == barInfo.rageValue then
        angerProgressBar:TweenValue(barInfo.rageValue, 0.3)
      else
        angerProgressBar:TweenValue(barInfo.rageValue, 0.5)
      end
    end
    local firmProgressBar = cardInfo.firmProgressBar
    if firmProgressBar and barInfo.tenacityPer then
      if barInfo.tenacityPer > 0 then
        firmProgressBar.value = 100 * barInfo.tenacityPer
        firmProgressBar.visible = true
      else
        firmProgressBar.visible = false
      end
    end
    local soulProgressBar = cardInfo.soulProgressBar
    if soulProgressBar and barInfo.shieldSpecialPer then
      if barInfo.shieldSpecialPer > 0 then
        soulProgressBar.value = 100 * barInfo.shieldSpecialPer
        soulProgressBar.visible = true
      else
        soulProgressBar.visible = false
      end
    end
    if barInfo.buffDataList then
      cachedCardBuffList[unitUid] = barInfo.buffDataList
      local buffList = cardInfo.buffList
      buffList:RemoveChildrenToPool()
      local item, buffLoader, buffProgressBar, numberTxt
      for i, data in ipairs(barInfo.buffDataList) do
        if i <= 3 then
          item = buffList:AddItemFromPool()
          buffLoader = item:GetChild("BuffLoader")
          buffProgressBar = item:GetChild("BuffIconProgressBar")
          numberTxt = item:GetChild("NumberTxt")
          if data.count > 1 then
            numberTxt.text = data.count
          else
            numberTxt.text = ""
          end
          buffLoader.url = UIUtil.GetResUrl(data.iconPath)
          if data.remainFrames and data.remainMaxFrames then
            buffProgressBar.visible = true
            buffProgressBar.value = 100 * (data.remainMaxFrames - data.remainFrames) / data.remainMaxFrames
          else
            buffProgressBar.visible = false
          end
        end
      end
    end
  end
  if unit then
    if unit.id == SPECIAL_CARD_OR_MONSTER.GUI_SHI then
      ChangeUIController(cardInfo.cardSign, "c1", 1)
      local com = cardInfo.cardSign:GetChild("Card10080")
      if com then
        local progressBar = com:GetChild("CardProgressBar")
        local max = unit.maxChargeValue or unit:GetChargeMax()
        if 0 == max then
          progressBar.value = 0
        else
          progressBar.value = 100 * unit.chargeValue / (unit.maxChargeValue or unit:GetChargeMax())
        end
        if progressBar.value >= 100 then
          if nil == chargeFullEffectHolder then
            chargeFullEffectHolder = progressBar:GetChild("EffectHolder")
          end
          if nil == chargeFullEffect then
            chargeFullEffect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/battle/FX_battle_ui_10080_skill_full.prefab", chargeFullEffectHolder)
          elseif chargeFullEffectHolder then
            chargeFullEffectHolder.visible = true
          end
        elseif chargeFullEffectHolder then
          chargeFullEffectHolder.visible = false
        end
        local dotList = com:GetChild("DotList")
        local count = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(unit, BUFF_EFFECT_ID.HP_RESTORE)
        
        function dotList.itemRenderer(index, item)
          if index < count then
            ChangeUIController(item, "c1", 1)
          else
            ChangeUIController(item, "c1", 0)
          end
          if lastDotCount then
            if count > lastDotCount and count == index + 1 then
              UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/battle/FX_baller_ui_10080_skill_point.prefab", item:GetChild("EffectHolder"), nil, true)
            elseif count < lastDotCount and lastDotCount == index + 1 then
              UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/battle/FX_baller_ui_10080_skill_point_dis.prefab", item:GetChild("EffectHolder"), nil, true)
            end
          end
        end
        
        dotList.numItems = 3
        lastDotCount = count
      end
    end
    if unit:IsDead() or unit:IsDestroy() then
      cardInfo.loader.image:SetGrayByShader(true)
      ChangeUIController(cardInfo.hand, "c1", 2)
      local angerProgressBar = cardInfo.angerProgressBar
      angerProgressBar.value = 0
      cardInfo.hand.touchable = false
      BattleUIWindow.RemoveCardChosenEffect(unitUid)
      BattleUIWindow.RemoveCardPlayBurstSkillEffect(unitUid)
    elseif false == unit:CanMove() then
      cardInfo.loader.image:SetGrayByShader(false)
      ChangeUIController(cardInfo.hand, "c1", 1)
      cardInfo.hand.touchable = true
    else
      cardInfo.loader.image:SetGrayByShader(false)
      ChangeUIController(cardInfo.hand, "c1", 0)
      cardInfo.hand.touchable = true
    end
  end
end

function BattleUIWindow.AddCardChosenEffect(unitUid)
  local cardInfo = cardList[unitUid]
  if nil == cardInfo then
    return
  end
  local hand = cardInfo.hand
  local effectPath = "Assets/Art/Effects/Prefab/UI_prefab/SkillSelection/FX_ui_SkillSelection_02.prefab"
  local effect, holder = UIUtil.AddEffectToUITop(effectPath, hand)
  effect:IgnoreTimeScale(true)
  cardInfo.chosenEffect = holder
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BURST_CARD_CHOOSE)
end

function BattleUIWindow.RemoveCardChosenEffect(unitUid)
  local cardInfo = cardList[unitUid]
  if nil == cardInfo then
    return
  end
  local holder = cardInfo.chosenEffect
  if holder then
    holder:Dispose()
  end
end

function BattleUIWindow.AddCardPlayBurstSkillEffect(unitUid)
  local cardInfo = cardList[unitUid]
  if nil == cardInfo then
    return
  end
  local hand = cardInfo.hand
  local effectPath = "Assets/Art/Effects/Prefab/UI_prefab/SkillSelection/FX_ui_SkillSelection_perform.prefab"
  local effect, holder = UIUtil.AddEffectToUITop(effectPath, hand)
  effect:IgnoreTimeScale(true)
  cardInfo.playBurstSkillEffect = holder
end

function BattleUIWindow.RemoveCardPlayBurstSkillEffect(unitUid)
  local cardInfo = cardList[unitUid]
  if nil == cardInfo then
    return
  end
  local holder = cardInfo.playBurstSkillEffect
  if holder then
    holder:Dispose()
  end
end

function BattleUIWindow.AddCardBurstCdEffect(unitUid)
  local cardInfo = cardList[unitUid]
  if nil == cardInfo then
    return
  end
  local hand = cardInfo.hand
  local effectPath = "Assets/Art/Effects/Prefab/UI_prefab/SkillSelection/FX_ui_CDRefresh.prefab"
  local effect, holder = UIUtil.AddEffectToUITop(effectPath, hand)
  effect:IgnoreTimeScale(true)
  LuaUtil.SetEffectSetting(effect, function()
    BattleUIWindow.RemoveCardBurstCdEffect(unitUid)
  end, 1, true)
  cardInfo.cdEffect = holder
end

function BattleUIWindow.RemoveCardBurstCdEffect(unitUid)
  local cardInfo = cardList[unitUid]
  if nil == cardInfo then
    return
  end
  local holder = cardInfo.cdEffect
  if holder then
    holder:Dispose()
  end
end

function BattleUIWindow.ClickHead(unitUid)
  if BattleControl.isBurstPause then
    return
  end
  if (nil == cardBuffTipsUnit or cardBuffTipsUnit.visible == false) and BattleControl.isPause == true then
    return
  end
  local unit = BattleScene.GetUnitByUid(unitUid)
  if unit and curTouchCardUid ~= unitUid then
    if nil == curTouchCardUid then
      BattleControl.Pause()
    end
    curTouchCardUid = unitUid
    OpenWindow(WinResConfig.BuffTipsWindow.name, nil, unitUid, function()
      curTouchCardUid = nil
      BattleUIWindow.UpdateCardSelectState()
      BattleControl.Continue()
    end, BATTLE_CAMP_FLAG.LEFT)
    BattleUIWindow.UpdateCardSelectState()
  end
end

function BattleUIWindow.UpdateCardSelectState()
  for uid, cardInfo in pairs(cardList) do
    if curTouchCardUid then
      if uid == curTouchCardUid then
        ChangeUIController(cardInfo.hand, "c2", 1)
      else
        ChangeUIController(cardInfo.hand, "c2", 2)
      end
    else
      ChangeUIController(cardInfo.hand, "c2", 0)
    end
  end
end

function BattleUIWindow.ShowBuffTips()
  local targetParent = UIMgr:GetLayerRoot(UILayer.HUD1)
  if nil == cardBuffTipsUnit then
    cardBuffTipsUnit = UIMgr:CreateComponent("Battle", "CardBuffTipsUnit")
    targetParent:AddChild(cardBuffTipsUnit)
    cardBuffTipsUnit:GetChild("TouchScreenBtn").onClick:Set(BattleUIWindow.CloseBuffTips)
  else
    cardBuffTipsUnit.visible = true
  end
  local list = cardBuffTipsUnit:GetChild("CardBuffTips"):GetChild("BuffList")
  list:RemoveChildrenToPool()
  local buffDataList = cachedCardBuffList[curTouchCardUid]
  for index, data in ipairs(buffDataList) do
    local item = list:AddItemFromPool()
    local playerBuff = item:GetChild("PlayerBuff")
    local buffLoader = playerBuff:GetChild("BuffLoader")
    local buffProgressBar = playerBuff:GetChild("BuffIconProgressBar")
    local numberTxt = playerBuff:GetChild("NumberTxt")
    if data.count > 1 then
      numberTxt.text = data.count
    else
      numberTxt.text = ""
    end
    buffLoader.url = UIUtil.GetResUrl(data.iconPath)
    if data.remainFrames and data.remainMaxFrames then
      buffProgressBar.visible = true
      buffProgressBar.value = 100 * (data.remainMaxFrames - data.remainFrames) / data.remainMaxFrames
    else
      buffProgressBar.visible = false
    end
    local timeTxt = item:GetChild("TimeTxt")
    if data.remainFrames then
      ChangeUIController(item, "c2", 1)
      local second = math.ceil(data.remainFrames / BATTLE_CONFIG_ENUM.FIXED_FPS)
      if second > 0 then
        timeTxt.text = T(11027, second)
      else
        timeTxt.text = ""
      end
    else
      ChangeUIController(item, "c2", 0)
    end
    local buffConfig = TableData.GetConfig(data.buffId, "BaseSkillBuff")
    if buffConfig.des then
      item:GetChild("WordTxt").text = buffConfig.des()
    end
    if index == #buffDataList then
      ChangeUIController(item, "c1", 1)
    else
      ChangeUIController(item, "c1", 0)
    end
  end
  list:ResizeToFit()
  local hand = cardList[curTouchCardUid].hand
  local position = hand:TransformPoint(Vector2(hand.width / 2, 0), targetParent)
  cardBuffTipsUnit:SetXY(position.x, position.y - 20)
  if cardBuffTipsUnit.x - cardBuffTipsUnit.width / 2 < uis.Main.root.x + 30 then
    cardBuffTipsUnit.x = uis.Main.root.x + 30 + cardBuffTipsUnit.width / 2
  end
  PlayUITrans(cardBuffTipsUnit, "in")
  if nil == cardListIndexInParent then
    local cardHeadList = uis.Main.BurstRegion.CardHeadList
    cardListIndexInParent = cardHeadList.parent:GetChildIndex(cardHeadList)
    originCardListX = cardHeadList.x
    originCardListY = cardHeadList.y
    local targetPosition = cardHeadList:TransformPoint(Vector2.zero, targetParent)
    cardHeadList:RemoveFromParent()
    targetParent:AddChild(cardHeadList)
    cardHeadList:SetXY(targetPosition.x, targetPosition.y)
  end
end

function BattleUIWindow.CloseBuffTips()
  if nil == cardBuffTipsUnit then
    return
  end
  if IsUITransPlaying(cardBuffTipsUnit, "in") then
    return
  end
  cardBuffTipsUnit.visible = false
  curTouchCardUid = nil
  BattleUIWindow.UpdateCardSelectState()
  BattleControl.Continue()
  if originCardListX and originCardListY then
    local cardHeadList = uis.Main.BurstRegion.CardHeadList
    if cardHeadList then
      cardHeadList:RemoveFromParent()
      uis.Main.BurstRegion.root:AddChildAt(cardHeadList, cardListIndexInParent)
      cardHeadList:SetXY(originCardListX, originCardListY)
    end
  end
  cardListIndexInParent = nil
  originCardListX = nil
  originCardListY = nil
end

function BattleUIWindow.UpdateSkillArea(isInit)
  local manuallySkills = BattleScene.GetAllManuallySkill()
  if nil == manuallySkills or #manuallySkills <= 0 then
    return
  end
  if isInit then
    skillList = {}
    DragDropManager.inst.dragAgent.onDragEnd:Add(BattleUIWindow.OnDragEnd)
    DragDropManager.inst.dragAgent.onDragMove:Add(BattleUIWindow.OnDragMove)
    local burstRegion = uis.Main.BurstRegion
    local autoBtn = burstRegion.TacticalSkillRegion.AutoBtn
    autoBtn.changeStateOnClick = false
    autoBtn.onClick:Set(BattleUIWindow.OnClickManuallySkillAutoBtn)
    BattleUIWindow.UpdateManuallySkillAutoBtn()
    UIUtil.SetBtnText(autoBtn, T(11731))
    if BattleData.stageType ~= ProtoEnum.SCENE_TYPE.GUILD_WAR then
      burstRegion.GuildBossCtr.selectedIndex = 0
      return
    end
    burstRegion.GuildBossCtr.selectedIndex = 1
  end
  for i, v in ipairs(manuallySkills) do
    local skillInfo = manuallySkills[i]
    BattleUIWindow.CreateOrUpdateOneSkill(skillInfo.skillId)
  end
end

function BattleUIWindow.OnClickManuallySkillAutoBtn()
  if BattleMgr.isPlayback then
    return
  end
  if BattleData.forceAuto == true then
    return
  end
  if true == BattleControl.isPause then
    return
  end
  if true == BattleScene.IsBattleOver() then
    return
  end
  if BattleControl.isBurstPause then
    return
  end
  if BattleData.isManuallySkillAuto == false then
    BattleData.isManuallySkillAuto = true
  else
    BattleData.isManuallySkillAuto = false
  end
  BattleUIWindow.UpdateManuallySkillAutoBtn()
  if BattleData.stageType then
    ld("Formation")
    local curStageType = FormationMgr.GetPrepareSceneType(BattleData.stageType)
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.BATTLE_AUTO_MANUALLY_SKILL, BattleData.isManuallySkillAuto and 1 or 0, curStageType)
  end
end

function BattleUIWindow.UpdateManuallySkillAutoBtn()
  local autoBtn = uis.Main.BurstRegion.TacticalSkillRegion.AutoBtn
  if autoBtn then
    if BattleData.isManuallySkillAuto == true then
      ChangeUIController(autoBtn, "c1", 1)
    else
      ChangeUIController(autoBtn, "c1", 0)
    end
  end
end

function BattleUIWindow.CreateOrUpdateOneSkill(skillId)
  local canTrigger = false
  local skillObj
  local skill = skillList[skillId]
  local skillConfig = TableData.GetConfig(skillId, "BaseSkill")
  if nil == skill then
    skillObj = uis.Main.BurstRegion.TacticalSkillRegion.SkillList:AddItemFromPool()
    skillObj.onDragStart:Set(function(context)
      if BattleMgr.isPlayback then
        context:PreventDefault()
        return
      end
      if BattleControl.isPause == true then
        context:PreventDefault()
        return
      end
      if BattleControl.isBurstPause then
        context:PreventDefault()
        return
      end
      if nil ~= curSkill and curSkill.skillId ~= skillId then
        context:PreventDefault()
        return
      end
      local skillInScene = BattleScene.GetManuallySkill(skillId, BATTLE_CAMP_FLAG.LEFT)
      if skillInScene.activeCount >= skillInScene.maxActiveCount then
        context:PreventDefault()
        return
      end
      BattleUIWindow.OnDragStart(context, skillId, skillObj)
    end)
    skillObj.onClick:Set(function()
      if BattleMgr.isPlayback then
        return
      end
      if BattleControl.isBurstPause then
        return
      end
      if BattleControl.isPause == true then
        return
      end
      local skillInScene = BattleScene.GetManuallySkill(skillId, BATTLE_CAMP_FLAG.LEFT)
      if skillInScene.activeCount >= skillInScene.maxActiveCount then
        return
      end
      local success = skillInScene:SetAutoPosition()
      if success then
        BattleOperation.AddManuallyOperation(skillInScene, BATTLE_CAMP_FLAG.LEFT)
      else
        print_battle("条件不足，无法点击释放战术技能", skillId)
      end
    end)
    require("Battle_TacticalSkillBtnByName")
    skill = GetBattle_TacticalSkillBtnUis(skillObj)
    skill.PicLoader.url = UIUtil.GetResUrl(skillConfig.icon)
    skillList[skillId] = skill
  end
  local skillInScene = BattleScene.GetManuallySkill(skillId, BATTLE_CAMP_FLAG.LEFT)
  local conditionOk = true
  if skillInScene.maxActiveCount <= skillInScene.activeCount then
    conditionOk = false
    skill.c1Ctr.selectedIndex = 1
    skill.c2Ctr.selectedIndex = 0
  elseif skillInScene.waitCDFrame then
    conditionOk = false
    skill.c1Ctr.selectedIndex = 0
    skill.c2Ctr.selectedIndex = 1
    skill.root.touchable = false
    skill.root.draggable = false
    local value = (skillInScene.skillConfig.cd - skillInScene.waitCDFrame) * 100 / skillInScene.skillConfig.cd
    local bar = skill.SkillCDProgressBar
    bar.value = value
    bar:GetChild("TimeTxt").text = math.ceil(skillInScene.waitCDFrame / BATTLE_CONFIG_ENUM.FIXED_FPS)
  else
    skill.c1Ctr.selectedIndex = 0
    skill.c2Ctr.selectedIndex = 0
    skill.root.touchable = true
    skill.root.draggable = true
    canTrigger = true
  end
  skill.NumberTxt.text = skillInScene.maxActiveCount - skillInScene.activeCount
  if curSkill and skillId == curSkill.skillId and false == conditionOk then
    BattleUIWindow.ClearSkillDrag()
  else
  end
  goto lbl_125
  goto lbl_125
  ::lbl_125::
  return skillObj, canTrigger
end

function BattleUIWindow.OnDragStart(context, skillId, skill)
  BattleUIWindow.ClearSkillDrag()
  local scale = 1
  context:PreventDefault()
  DragDropManager.inst:StartDrag(nil, UIUtil.GetResUrl("SkillStarIcon:GuildBossSkill_1001"), skillId, Vector2.zero, context.data)
  DragDropManager.inst.dragAgent.alpha = 0
  local manuallySkill = BattleScene.GetManuallySkill(skillId, BATTLE_CAMP_FLAG.LEFT)
  local rangeType, rangeX, rangeY = manuallySkill:GetRange()
  curTargetLine = nil
  local isEffective = manuallySkill:IsEffective()
  if isEffective then
    skillDrag = ResourceManager.Instantiate(BATTLE_RES_PATH.MANUALLY_SKILL_CHOOSE_GUIDE_GREEN)
    if nil == curTargetLineBlue then
      curTargetLineBlue = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
      contentPane:AddChild(curTargetLineBlue)
      curLineEffectBlue = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/battle/FX_battle_skill_line_blue.prefab", curTargetLineBlue)
    end
    curTargetLine = curTargetLineBlue
  else
    skillDrag = ResourceManager.Instantiate(BATTLE_RES_PATH.MANUALLY_SKILL_CHOOSE_GUIDE_RED)
    if nil == curTargetLineRed then
      curTargetLineRed = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
      contentPane:AddChild(curTargetLineRed)
      curLineEffectRed = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/battle/FX_battle_skill_line_red.prefab", curTargetLineRed)
    end
    curTargetLine = curTargetLineRed
  end
  if curTargetLine then
    local position = skill:TransformPoint(skill.size / 2, contentPane)
    lineStartX = position.x
    lineStartY = position.y
    curTargetLine:SetXY(lineStartX, lineStartY)
  end
  if 1 == rangeType then
    scale = rangeX / BattleScene.pixelsPerUnit
  end
  skillIcon = skill
  skillDragIcon = DragDropManager.inst.dragAgent.displayObject.gameObject
  BattleResourceManager:AddGameObject(skillDrag, 0, 0, 0, scale, scale, scale)
  SortingHelper.SetOrderInLayer(skillDrag, BATTLE_CONFIG_ENUM.SORTING_ORDER_MANUALLY_SKILL_CHOOSE)
  local pos = BattleUIWindow.UpdateDragPosition()
  manuallySkill:SetPosition(pos)
  curSkill = manuallySkill
  skillDrag:SetActive(false)
  if curTargetLine then
    curTargetLine.visible = false
  end
end

function BattleUIWindow.OnDragMove()
  if curSkill then
    local position = BattleUIWindow.UpdateDragPosition()
    curSkill:SetPosition(position)
    local lineEffect
    if curTargetLine == curTargetLineBlue then
      lineEffect = curLineEffectBlue
    elseif curTargetLine == curTargetLineRed then
      lineEffect = curLineEffectRed
    end
    if lineEffect then
      local target = DragDropManager.inst.dragAgent
      if IsNil(target) == false then
        LineRendererHelper.RenderLineUI(lineEffect, lineStartX, lineStartY, target.x, target.y, 100, -1)
      end
    end
    if skillIcon then
      local touchTarget = GRoot.inst.touchTarget
      if touchTarget then
        if GRoot.inst.touchTarget.id == skillIcon.id or skillIcon:IsAncestorOf(GRoot.inst.touchTarget) then
          if skillDrag.activeSelf == true then
            skillDrag:SetActive(false)
          end
          if curTargetLine then
            curTargetLine.visible = false
          end
        else
          if false == skillDrag.activeSelf then
            skillDrag:SetActive(true)
          end
          if curTargetLine then
            curTargetLine.visible = true
          end
        end
      else
        if skillDrag.activeSelf == true then
          skillDrag:SetActive(false)
        end
        if curTargetLine then
          curTargetLine.visible = false
        end
      end
    end
  end
end

function BattleUIWindow.OnDragEnd()
  if skillDragIcon and curSkill and skillDrag and skillDrag.activeSelf then
    local position = CameraUtil.TransparentPosition(skillDragIcon, UICamera, BattleCamera, 1 / BattleData.battleRootScale)
    curSkill:SetPosition(position)
    BattleOperation.AddManuallyOperation(curSkill, BATTLE_CAMP_FLAG.LEFT)
  end
  BattleUIWindow.ClearSkillDrag()
  if curTargetLine then
    curTargetLine.visible = false
    curTargetLine = nil
  end
end

function BattleUIWindow.UpdateDragPosition()
  local pos = CameraUtil.TransparentPosition(skillDragIcon, UICamera, BattleCamera, 1 / BattleData.battleRootScale)
  LuaUtil.SetLocalPos(skillDrag, pos.x, pos.y, pos.z)
  return pos
end

function BattleUIWindow.UpdateSkillList()
  local badgeSkillList = BattleScene.GetBadge(BATTLE_CAMP_FLAG.LEFT).skillList
  local skillConditionOk = false
  for _, skill in ipairs(badgeSkillList) do
    local _, canTrigger = BattleUIWindow.CreateOrUpdateOneSkill(skill.skillId)
    if true == canTrigger then
      skillConditionOk = true
    end
  end
  local callback = BattleMgr.skillSpEnoughCallback
  if callback then
    callback(skillConditionOk)
  end
  return #badgeSkillList
end

function BattleUIWindow.ClearSkillDrag()
  if skillDrag then
    ResourceManager.DestroyGameObject(skillDrag, true)
    skillDrag = nil
  end
  skillDragIcon = nil
  skillIcon = nil
  curSkill = nil
end

function BattleUIWindow.PlayBurstSkillGuide()
  if UIMgr:IsWindowOpen(WinResConfig.GuideWindow.name) == false then
    OpenWindow(WinResConfig.GuideWindow.name, UILayer.Guide)
    BattleControl.Pause(false, true)
  end
end

function BattleUIWindow.PlayBurstSkillChooseCardGuide()
  GuideMgr.SafeOpenGuideWindow()
  BattleControl.Pause(false, true)
  if cardChooseTweener then
    cardChooseTweener:SetPaused(true)
  end
end

function BattleUIWindow.PlayBurstSkillChooseCardGuide2()
  if UIMgr:IsWindowOpen(WinResConfig.GuideWindow.name) == false then
    OpenWindow(WinResConfig.GuideWindow.name, UILayer.Guide)
  end
  BattleControl.Pause(false, true)
  if cardChooseTweener then
    cardChooseTweener:SetPaused(true)
  end
end

function BattleUIWindow.PlayBurstSkillChooseCardGuide3()
  if UIMgr:IsWindowOpen(WinResConfig.GuideWindow.name) == false then
    OpenWindow(WinResConfig.GuideWindow.name, UILayer.Guide)
  end
end

function BattleUIWindow.PlayBurstCardSkillOverGuide()
  if UIMgr:IsWindowOpen(WinResConfig.GuideWindow.name) == false then
    OpenWindow(WinResConfig.GuideWindow.name, UILayer.Guide)
  end
  BattleControl.Pause(false, true)
end

function BattleUIWindow.InitBurstEffect()
  local isOpen = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.BURST_SKILL, false)
  if isOpen then
    local btn = uis.Main.BurstRegion.BurstBtn
    UIUtil.SetBtnText(btn, T(11034))
    burstEffectBackHolder = btn:GetChild("Effect1Holder")
    burstEffectHolder = btn:GetChild("Effect2Holder")
    burstEffectPlayingHolder = btn:GetChild("Effect3Holder")
    burstEffectDisableHolder = btn:GetChild("Effect4Holder")
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Rocktime/FX_ui_rocktimebutton_dark.prefab", burstEffectBackHolder)
    burstFullEffectGameObject = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Rocktime/FX_ui_rocktimebutton.prefab", burstEffectHolder)
    burstPlayingEffectGameObject = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Rocktime/FX_ui_rocktimebutton_excite.prefab", burstEffectPlayingHolder)
    burstDisableEffectGameObject = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Rocktime/FX_ui_rocktimebutton_unuse.prefab", burstEffectDisableHolder)
    burstPlayingEffectGameObject:IgnoreTimeScale(true)
    burstEffectHolder.visible = false
    burstEffectPlayingHolder.visible = false
    burstEffectDisableHolder.visible = false
    burstProgressBarHolder = btn:GetChild("ProgressBarHolder")
    burstProgressBarEffect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Rocktime/FX_ui_rocktimebutton_progressbar.prefab", burstProgressBarHolder)
    burstCDProgressBarFlash = LuaUtil.FindChild(burstProgressBarEffect, "flash")
    burstProgressBarEffect:IgnoreTimeScale(true)
    burstProgressBarDarkHolder = btn:GetChild("ProgressBarDarkHolder")
    burstProgressBarDarkEffect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Rocktime/FX_ui_rocktimebutton_progressbar_dark.prefab", burstProgressBarDarkHolder)
    if nil == burstEnergyEffect then
      burstEnergyEffect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/SkillSelection/FX_ui_countdown.prefab", uis.Main.Time.EffectHolder)
      burstEnergyEffect:IgnoreTimeScale(true)
    end
  end
end

function BattleUIWindow.UpdateBurstInfo()
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.BURST_SKILL, false) == false then
    uis.Main.BustCtr.selectedIndex = 1
    return
  end
  local leftBadge = BattleScene.GetBurst(BATTLE_CAMP_FLAG.LEFT)
  if nil == leftBadge then
    return
  end
  uis.Main.BustCtr.selectedIndex = 0
  local energySkill = leftBadge.energySkill
  local state = leftBadge:GetEnergySkillState()
  if state == BATTLE_BURST_STATE.NOT_ACTIVATED then
    ChangeUIController(uis.Main.BurstRegion.BurstBtn, "c1", 0)
  elseif state == BATTLE_BURST_STATE.TO_BE_ACTIVATED_DISABLE then
    ChangeUIController(uis.Main.BurstRegion.BurstBtn, "c1", 1)
  elseif state == BATTLE_BURST_STATE.TO_BE_ACTIVATED_ENABLE then
    ChangeUIController(uis.Main.BurstRegion.BurstBtn, "c1", 2)
    if burstProgressBarEffect then
      ChangeUVOffset.Change(burstProgressBarEffect, 1, 1)
    end
    if burstProgressBarDarkEffect then
      ChangeUVOffset.Change(burstProgressBarDarkEffect, 0, 0)
    end
    local stepData = GuideMgr.GetStepData()
    if stepData and stepData.type == GUIDE_STEP_TYPE_ENUM.SKILL_HINT and stepData.trigger_in_battle == "burst_sp_enough_hint" then
      BattleUIWindow.PlayBurstSkillGuide()
    end
  elseif state == BATTLE_BURST_STATE.ACTIVATED then
    local isChange = ChangeUIController(uis.Main.BurstRegion.BurstBtn, "c1", 3)
    if isChange then
      if burstProgressBarEffect then
        ChangeUVOffset.Change(burstProgressBarEffect, 1, 1)
      end
      if burstProgressBarDarkEffect then
        ChangeUVOffset.Change(burstProgressBarDarkEffect, 0, 0)
      end
    end
  end
  if state == BATTLE_BURST_STATE.ACTIVATED then
    burstEnergyEffect:SetActiveSafe(true)
    burstCDProgressBarFlash:SetActiveSafe(true)
    burstTimeTxt.text = string.format("%.2f", (leftBadge.energySkillRemainFrame + 1) / BATTLE_CONFIG_ENUM.FIXED_FPS)
    if burstProgressBarEffect then
      local per = (leftBadge.energySkillRemainFrame + 1) / leftBadge.energySkillLastFrame
      ChangeUVOffset.Change(burstProgressBarEffect, per, per)
    end
  else
    burstEnergyEffect:SetActiveSafe(false)
    burstCDProgressBarFlash:SetActiveSafe(false)
    if burstProgressBarDarkEffect then
      local value = leftBadge.curEnergy / leftBadge.maxEnergy
      ChangeUVOffset.Change(burstProgressBarDarkEffect, value, value)
      if leftBadge.curEnergy >= leftBadge.maxEnergy then
        if not playHint then
          playHint = true
          SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BURST_BATTLE_HINT)
        end
        if burstProgressBarEffect then
          ChangeUVOffset.Change(burstProgressBarEffect, 1, 1)
        end
      else
        playHint = nil
      end
    end
  end
  if state == BATTLE_BURST_STATE.TO_BE_ACTIVATED_ENABLE then
    burstBtn.onClick:Set(function()
      if BattleMgr.isPlayback then
        return
      end
      if BattleControl.isBurstPause then
        return
      end
      if BattleScene.IsBattleOver() then
        return
      end
      BattleOperation.AddBurstOperation(energySkill, leftBadge.camp)
      if GuideMgr.guideBol == true and BattleControl.isPause then
        BattleControl.Continue()
      end
    end)
  else
    burstBtn.onClick:Set(function()
      if BattleMgr.isPlayback then
        return
      end
      if BattleControl.isBurstPause then
        return
      end
      if BattleScene.IsBattleOver() then
        return
      end
      if state == BATTLE_BURST_STATE.ACTIVATED then
        FloatTipsUtil.ShowWarnTips(T(11032))
      elseif state == BATTLE_BURST_STATE.NOT_ACTIVATED then
        FloatTipsUtil.ShowWarnTips(T(11036))
      else
        FloatTipsUtil.ShowWarnTips(T(11031))
      end
    end)
  end
  for uid, cardInfo in pairs(cardList) do
    local unit = BattleScene.GetUnitByUid(uid)
    if unit.burstSkillWaitFrame > 0 then
      cardInfo.c3.selectedIndex = 1
      cardInfo.CDTimeText.text = T(10653, math.ceil(unit.burstSkillWaitFrame / BATTLE_CONFIG_ENUM.FIXED_FPS))
      cardInfo.cdProgressBar.value = 100 * unit.burstSkillWaitFrame / unit.burstSkillCD
      ld("Guide")
      local stepData = GuideMgr.GetStepData()
      if stepData and stepData.type == GUIDE_STEP_TYPE_ENUM.SKILL_HINT and stepData.trigger_in_battle == "burst_skill_over_hint" then
        local badge = BattleScene.GetBurst(BATTLE_CAMP_FLAG.LEFT)
        if badge then
          local count = #badge.waitDealCardBurstSkillList
          if uid == badge.waitDealCardBurstSkillList[count].unitUid and false == UIMgr:IsWindowOpen(WinResConfig.GuideWindow.name) then
            OpenWindow(WinResConfig.GuideWindow.name, UILayer.Guide)
            BattleControl.Pause(false, true)
          end
        end
      end
    else
      cardInfo.c3.selectedIndex = 0
    end
  end
  if nil == curBurstState then
    BattleUIWindow.ShowBurstEffect(state)
    curBurstState = state
  elseif curBurstState ~= state then
    BattleUIWindow.ShowBurstEffect(state)
    BattleUIWindow.HideBurstEffect(curBurstState, state)
    curBurstState = state
  end
end

function BattleUIWindow.HideBurstEffect(lastState, newState)
  if lastState == BATTLE_BURST_STATE.NOT_ACTIVATED then
  elseif lastState == BATTLE_BURST_STATE.TO_BE_ACTIVATED_DISABLE then
    burstEffectDisableHolder:TweenFade(0, 0.3):OnComplete(function()
      if burstEffectDisableHolder then
        burstEffectDisableHolder.visible = false
        burstEffectDisableHolder.alpha = 1
      end
    end):SetIgnoreEngineTimeScale(true)
  elseif lastState == BATTLE_BURST_STATE.TO_BE_ACTIVATED_ENABLE then
    burstEffectHolder:TweenFade(0, 0.3):OnComplete(function()
      if burstEffectHolder then
        burstEffectHolder.visible = false
        burstEffectHolder.alpha = 1
      end
    end):SetIgnoreEngineTimeScale(true)
  elseif lastState == BATTLE_BURST_STATE.ACTIVATED then
    burstEffectPlayingHolder:TweenFade(0, 0.3):OnComplete(function()
      if burstEffectPlayingHolder then
        burstEffectPlayingHolder.visible = false
        burstEffectPlayingHolder.alpha = 1
      end
    end):SetIgnoreEngineTimeScale(true)
    if cardList then
      for uid, info in pairs(cardList) do
        BattleUIWindow.RemoveCardChosenEffect(uid)
      end
    end
  end
end

local curBurstSkillCardList = {}

function BattleUIWindow.ShowBurstEffect(newState)
  if newState == BATTLE_BURST_STATE.NOT_ACTIVATED then
  elseif newState == BATTLE_BURST_STATE.TO_BE_ACTIVATED_DISABLE then
    burstEffectDisableHolder.visible = true
  elseif newState == BATTLE_BURST_STATE.TO_BE_ACTIVATED_ENABLE then
    burstEffectHolder.visible = true
  elseif newState == BATTLE_BURST_STATE.ACTIVATED then
    burstEffectPlayingHolder.visible = true
  end
end

function BattleUIWindow.UpdateUIVisibleInBurst(show)
  if false == show then
    UICamera.enabled = false
    PlayUITrans(uis.Main.root, "BurstHide", nil, nil, nil, nil, nil, true)
    uis.Main.root.touchable = false
  else
    UICamera.enabled = true
    PlayUITrans(uis.Main.root, "BurstDisplay", nil, nil, nil, nil, nil, true)
    uis.Main.root.touchable = true
  end
end

function BattleUIWindow.ShowBurstChooseCard()
  BattleControl.Continue()
  BattleControl.SlowTime(BATTLE_CONFIG_ENUM.BURST_SLOW_TIMESCALE_RATIO)
  SoundManager:PlaySnapShot("snapshot:/battle/slow_motion")
  local progressBar = uis.Main.BurstCardHeadRegion.BurstCardHeadList.BurstAutoProgressBar
  progressBar.value = 100
  if nil == tempBurstNeedJobList then
    local burst = BattleScene.GetBurst(BATTLE_CAMP_FLAG.LEFT)
    local needJobs = burst.energyNeedJobs
    tempBurstNeedJobList = SimpleCopy(needJobs)
  end
  if 0 == #tempBurstNeedJobList then
    local aliveCardList = BattleScene.GetAliveCardByCamp(BATTLE_CAMP_FLAG.LEFT)
    for i, v in ipairs(aliveCardList) do
      if nil ~= v.burstSkill and v.burstSkillWaitFrame <= 0 then
        burst:AddEnergySkillCard(v, BattleControl.curFixedFrame)
      end
    end
    BattleUIWindow.ChooseBurstCardComplete()
    return
  else
    local listRoot = uis.Main.BurstCardHeadRegion.BurstCardHeadList
    local list = listRoot.BurstCardHeadList
    list.touchable = false
  end
  if burstBtn and burstBtn.visible == true then
    burstBtn.visible = false
  end
end

function BattleUIWindow.UpdateBurstChooseList()
  if nil == tempBurstNeedJobList then
    local burst = BattleScene.GetBurst(BATTLE_CAMP_FLAG.LEFT)
    local needJobs = burst.energyNeedJobs
    tempBurstNeedJobList = SimpleCopy(needJobs)
  end
  if tempBurstNeedJobList and #tempBurstNeedJobList > 0 then
    BattleUIWindow.UpdateBurstChooseCardList()
  end
end

function BattleUIWindow.UpdateBurstChooseCardList()
  local burst = BattleScene.GetBurst(BATTLE_CAMP_FLAG.LEFT)
  local unitType = burst.chooseCardConfig[burst.chooseCardIndex].unitType
  local allCannotChoose, tempChooseList = burst:IsAllCardCannotChooseByJob(unitType)
  if true == allCannotChoose then
    local curBurstChooseCardInfos = BattleData.savedBurstChooseCardInfos[burst.camp]
    if curBurstChooseCardInfos and #curBurstChooseCardInfos > 0 then
      table.remove(curBurstChooseCardInfos, 1)
    end
    return false
  end
  tempCardForChoose = tempChooseList
  local listRoot = uis.Main.BurstCardHeadRegion.BurstCardHeadList
  local list = listRoot.BurstCardHeadList
  list:RemoveChildrenToPool()
  for i, v in ipairs(tempCardForChoose) do
    local cardHand = list:AddItemFromPool()
    cardHand.data = v.uid
    cardHand.name = v.battleUnitType .. "_" .. i
    local com = cardHand:GetChild("BurstCardHead"):GetChild("BurstCardHead")
    local holder = com:GetChild("holder")
    if holder then
      holder:Dispose()
    end
    local configData = v:GetBaseCardOrMonsterConfig()
    local occupation = com:GetChild("Occupation")
    if occupation then
      ChangeUIController(occupation, nil, configData.type - 1)
      ChangeUIController(occupation, "c2", 1)
    end
    local elementList = com:GetChild("ElementList")
    UIUtil.ShowElementList(elementList, configData)
    local cardHead = com:GetChild("BurstCardHeadProgressBar")
    local headBg = cardHead:GetChild("BurstCardHeadBg")
    local headLoader = headBg:GetChild("HeadLoader")
    local fashionConfig = v:GetFashionConfig()
    headLoader.url = UIUtil.GetResUrl(fashionConfig.head_icon_rect)
    if v.burstSkillWaitFrame > 0 then
      ChangeUIController(com, "c2", 1)
      com.touchable = false
      local timeTxt = cardHead:GetChild("TimeTxt")
      timeTxt.text = math.ceil(v.burstSkillWaitFrame / BATTLE_CONFIG_ENUM.FIXED_FPS)
      cardHead.value = 100 * v.burstSkillWaitFrame / v.burstSkillCD
    else
      ChangeUIController(com, "c2", 0)
      com.touchable = true
    end
    local skillLevelUpConfig = v:GetSkillLevelUpConfig(v.burstSkill)
    local tagId = skillLevelUpConfig.tag_id
    if tagId then
      local tagConfig = TableData.GetConfig(tagId, "BaseSkillTag")
      if tagConfig then
        local wordTxt = com:GetChild("BurstCardHeadWord"):GetChild("WordTxt")
        wordTxt.text = tagConfig.name()
        local iconLoader = com:GetChild("BurstCardHeadWord"):GetChild("IconLoader")
        iconLoader.url = UIUtil.GetResUrl(tagConfig.icon)
      end
    end
    if v:IsDead() or v:IsDestroy() then
      ChangeUIController(com, "c1", 1)
    else
      ChangeUIController(com, "c1", 0)
    end
    if BattleData.forceAuto then
      cardHand.touchable = false
    else
      cardHand.touchable = true
    end
    com.onClick:Set(function()
      if BattleMgr.isPlayback then
        return
      end
      if BattleData.forceAuto == false then
        if false == v:IsDead() and false == v:IsDestroy() then
          if cardChooseTweener then
            cardChooseTweener:Kill()
            cardChooseTweener = nil
            BattleUIWindow.ChooseBurstCardCallback(v, BattleControl.curFixedFrame)
          end
        else
          FloatTipsUtil.ShowWarnTips(T(11035))
        end
      end
    end)
    if GuideMgr.guideBol then
      local stepData = GuideMgr.GetStepData()
      if stepData then
        GuideMgr.TestListenCompleteFunc()
      end
    end
    PlayUITrans(cardHand:GetChild("BurstCardHead"), "in", nil, 0, nil, nil, nil, true)
  end
  list:ResizeToFit()
  local wordTxt = listRoot.WordTxt
  wordTxt.text = T(11033)
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BURST_CARD_ANIM_IN)
  local com = uis.Main.BurstCardHeadRegion.root
  if com and com.visible == false then
    com.visible = true
    PlayUITrans(com, "in", function()
      if com then
        com.touchable = true
      end
    end, 0, nil, nil, nil, true)
  end
end

function BattleUIWindow.StartChooseCardTimer()
  local listRoot = uis.Main.BurstCardHeadRegion.BurstCardHeadList
  local list = listRoot.BurstCardHeadList
  list.touchable = true
  local progressBar = listRoot.BurstAutoProgressBar
  progressBar.value = 100
  local interval = BATTLE_CONFIG_ENUM.BURST_CHOOSE_CARD_INTERVAL
  local curChooseCard
  local burst = BattleScene.GetBurst(BATTLE_CAMP_FLAG.LEFT)
  local curBurstChooseCardInfos = BattleData.savedBurstChooseCardInfos[burst.camp]
  if curBurstChooseCardInfos then
    curChooseCard = curBurstChooseCardInfos[1]
  end
  cardChooseTweener = progressBar:TweenValue(0, interval):OnComplete(function()
    if tempCardForChoose then
      if GuideMgr.guideBol then
        local stepData = GuideMgr.GetStepData()
        if stepData and (stepData.trigger_in_battle == "burst_card_show_3" or stepData.trigger_in_battle == "burst_card_show_4") then
          UIMgr:SendWindowMessage(WinResConfig.GuideWindow.name, WindowMsgEnum.GuideWindow.CLEAR_HINT)
        end
      end
      for i, v in ipairs(tempCardForChoose) do
        if v:IsDead() == false and false == v:IsDestroy() and v.burstSkillWaitFrame <= 0 then
          BattleUIWindow.ChooseBurstCardCallback(v, BattleControl.curFixedFrame)
          return
        end
      end
      BattleUIWindow.ChooseBurstCardCallback(nil, BattleControl.curFixedFrame)
    end
  end):SetIgnoreEngineTimeScale(true):OnUpdate(function()
    local timeTxt = listRoot.TimeTxt
    local time = interval * cardChooseTweener.value.x / 100
    timeTxt.text = string.format("%.2f", time)
    if curChooseCard then
      local savedFrame = curChooseCard.chooseCostFrame
      if savedFrame <= BattleControl.curFixedFrame and cardChooseTweener then
        cardChooseTweener:Kill()
        cardChooseTweener = nil
        local unit = BattleScene.GetUnitByUid(curChooseCard.unitUid)
        BattleUIWindow.ChooseBurstCardCallback(unit, savedFrame)
      end
    else
      local allDead = true
      for i, v in ipairs(tempCardForChoose) do
        if v:IsDead() == false and false == v:IsDestroy() then
          allDead = false
          break
        end
      end
      if allDead then
        if cardChooseTweener then
          cardChooseTweener:Kill()
          cardChooseTweener = nil
        end
        BattleUIWindow.ChooseBurstCardCallback(nil, BattleControl.curFixedFrame)
      end
    end
  end)
  if true == GuideMgr.guideBol then
    local stepData = GuideMgr.GetStepData()
    if stepData then
      if stepData.type == GUIDE_STEP_TYPE_ENUM.SKILL_HINT and (stepData.trigger_in_battle == "burst_card_show_1" or stepData.trigger_in_battle == "burst_card_show_5") then
        BattleUIWindow.PlayBurstSkillChooseCardGuide()
      elseif stepData.type == GUIDE_STEP_TYPE_ENUM.GIRD and stepData.trigger_in_battle == "burst_card_show_2" then
        BattleUIWindow.PlayBurstSkillChooseCardGuide2()
      elseif stepData.type == GUIDE_STEP_TYPE_ENUM.GIRD and (stepData.trigger_in_battle == "burst_card_show_3" or stepData.trigger_in_battle == "burst_card_show_4") then
        BattleUIWindow.PlayBurstSkillChooseCardGuide3()
      end
    end
  end
end

function BattleUIWindow.UpdateCardDeadInBurst()
  if cardChooseTweener then
    local list = uis.Main.BurstCardHeadRegion.BurstCardHeadList.BurstCardHeadList
    local count = list.numItems
    if count > 0 then
      for i = 1, count do
        local cardHand = list:GetChildAt(i - 1)
        if cardHand then
          local uid = cardHand.data
          local com = cardHand:GetChild("BurstCardHead"):GetChild("BurstCardHead")
          local unit = BattleScene.GetUnitByUid(uid)
          if unit:IsDead() or unit:IsDestroy() then
            ChangeUIController(com, "c1", 1)
            cardHand.touchable = false
          else
            ChangeUIController(com, "c1", 0)
            if BattleData.forceAuto then
              cardHand.touchable = false
            else
              cardHand.touchable = true
            end
          end
        end
      end
    end
  end
end

function BattleUIWindow.ChooseBurstCardCallback(chooseCard, chooseCostFrame)
  local list = uis.Main.BurstCardHeadRegion.BurstCardHeadList.BurstCardHeadList
  list.touchable = false
  if GuideMgr.guideBol == true and true == BattleControl.isGuidePause then
    BattleControl.Continue()
  end
  local burst = BattleScene.GetBurst(BATTLE_CAMP_FLAG.LEFT)
  local success = burst:AddEnergySkillCard(chooseCard, chooseCostFrame)
  if false == success then
    return
  end
  BattleScene.UpdateSkillInfo({
    camp = burst.camp,
    skillId = burst.energySkillId,
    frame = burst.energySkillStartFrame,
    burstId = burst.id,
    burstChooseCardInfos = SimpleCopy(burst.waitDealCardBurstSkillList)
  })
  local curBurstChooseCardInfos = BattleData.savedBurstChooseCardInfos[burst.camp]
  if curBurstChooseCardInfos and #curBurstChooseCardInfos > 0 then
    table.remove(curBurstChooseCardInfos, 1)
  end
  local count = list.numItems
  if count > 0 then
    for i = 1, count do
      local com = list:GetChildAt(i - 1)
      if com then
        if chooseCard and com.data == chooseCard.uid and false == chooseCard:IsDead() and false == chooseCard:IsDestroy() then
          local effect, holder = UIUtil.AddEffectToUITop("Assets/Art/Effects/Prefab/UI_prefab/SkillSelection/FX_ui_SkillSelection_01.prefab", com:GetChild("BurstCardHead"):GetChild("BurstCardHead"))
          effect:IgnoreTimeScale(true)
          holder.name = "holder"
          EffectUtil.SetAutoDestroyCallback(effect, function()
            if holder then
              holder:Dispose()
            end
          end, 0.5, true)
        end
        PlayUITrans(com:GetChild("BurstCardHead"), "out", nil, 0, nil, nil, nil, true)
      end
    end
  end
  if chooseCard then
    BattleUIWindow.AddCardChosenEffect(chooseCard.uid)
  end
  if burst.chooseCardConfig and burst.chooseCardIndex > #burst.chooseCardConfig then
    BattleUIWindow.ChooseBurstCardComplete()
  end
end

function BattleUIWindow.AutoChooseCardBurst(battleUnit, frame)
  if cardChooseTweener then
    cardChooseTweener:Kill()
    cardChooseTweener = nil
  end
  BattleUIWindow.ChooseBurstCardCallback(battleUnit, frame)
end

function BattleUIWindow.ChooseBurstCardComplete()
  if nil == uis then
    return
  end
  local com = uis.Main.BurstCardHeadRegion.root
  com.touchable = false
  PlayUITrans(com, "out", function()
    if uis then
      local listRoot = uis.Main.BurstCardHeadRegion.BurstCardHeadList
      local list = listRoot.BurstCardHeadList
      list:RemoveChildrenToPool()
    end
    if com and com.visible == true then
      com.visible = false
    end
  end, 0, nil, nil, nil, true)
  local burst = BattleScene.GetBurst(BATTLE_CAMP_FLAG.LEFT)
  burst:DealCardBurst(true)
  BattleControl.SlowTime()
  if burstBtn and burstBtn.visible == false then
    burstBtn.visible = true
  end
  SoundManager:StopSnapShot("snapshot:/battle/slow_motion")
end

function BattleUIWindow.UpdateBurstEffectRed(isActive)
  if burstPlayingEffectGameObject then
    local renderS = burstPlayingEffectGameObject:GetComponentsInChildren(typeof(Renderer), true)
    local count = renderS.Length
    for i = 0, count - 1 do
      local render = renderS[i]
      local name = render.name
      if "rocktime_up_red" == name then
        local mat = render.material
        if isActive then
          mat:EnableKeyword("_DISSO_ON")
          mat:EnableKeyword("_NOIS_ON")
        else
          mat:DisableKeyword("_DISSO_ON")
          mat:DisableKeyword("_NOIS_ON")
        end
      elseif "flash" == name or "rocktime_up_red (1)" == name then
        render.gameObject:SetActive(isActive)
      end
    end
  end
end

function BattleUIWindow.BossEnter(unit)
  uis.Main.BossBattleTips.root.visible = true
  uis.Main.BossBattleTips.root.touchable = true
  uis.Main.BossBattleTips.BossName.BossNameTxt.text = unit:GetName()
  UIUtil.SetHeadByFaceId(unit.baseCardOrMonsterConfig.fashion_id, uis.Main.BossBattleTips.BossBattleTips.BossHeadBg.PicLoader)
  local elementList = uis.Main.BossBattleTips.ElementList
  UIUtil.ShowElementList(elementList, unit.baseCardOrMonsterConfig)
  if unit.haveRage == false then
    uis.Main.BossBattleTips.RageBossProgressBar.visible = false
  end
  if BattleData.stageType == ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE and RaidBossMgr.IsHardestLevel(BattleData.stageId) then
    uis.Main.BossBattleTips.HpVolumeCtr.selectedIndex = 1
    uis.Main.BossBattleTips.Info1.WordTxt.text = T(11630)
  else
    uis.Main.BossBattleTips.HpVolumeCtr.selectedIndex = 0
  end
  uis.Main.BossBattleTips.root.onClick:Set(function()
    if BattleControl.isBurstPause then
      return
    end
    BattleControl.Pause()
    OpenWindow(WinResConfig.BuffTipsWindow.name, nil, unit.uid, function()
      BattleControl.Continue()
    end, BATTLE_CAMP_FLAG.RIGHT)
  end)
end

function BattleUIWindow.BossDie()
  BattleUIWindow.BossRageChange(0)
  ChangeUIController(uis.Main.BossBattleTips.root, "c1", 1)
  uis.Main.BossBattleTips.root.touchable = false
end

function BattleUIWindow.BossHpChange(data)
  local hpProgressBar = uis.Main.BossBattleTips.HpBossBigProgressBar
  local defenseProgressBar = uis.Main.BossBattleTips.DefenseBossBigProgressBar
  if BattleData.stageType == ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE and RaidBossMgr.IsHardestLevel(BattleData.stageId) then
    hpProgressBar.value = 100
  else
    hpProgressBar.value = data.hpPer * 100
  end
  if data.defenseValue > 0 then
    local width = hpProgressBar:GetChild("bar").width
    defenseProgressBar.visible = true
    defenseProgressBar.value = data.defenseValue
    defenseProgressBar.x = hpProgressBar.x + hpProgressBar.width - width - defenseProgressBar.width
  else
    defenseProgressBar.visible = false
  end
  local firmProgressBar = uis.Main.BossBattleTips.FirmProgressBar
  if data.tenacityPer and data.tenacityPer > 0 then
    firmProgressBar.visible = true
    firmProgressBar.value = data.tenacityPer * 100
  else
    firmProgressBar.visible = false
  end
end

function BattleUIWindow.BossRageChange(value)
  if 100 == value or 0 == value then
    uis.Main.BossBattleTips.RageBossProgressBar:TweenValue(value, 0.3)
  else
    uis.Main.BossBattleTips.RageBossProgressBar:TweenValue(value, 0.5)
  end
end

function BattleUIWindow.BossBuffChange(barInfo)
  if barInfo.buffDataList then
    local buffList = uis.Main.BossBattleTips.BuffIconList
    buffList:RemoveChildrenToPool()
    local item, buffLoader, buffProgressBar, numberTxt
    for i, data in ipairs(barInfo.buffDataList) do
      item = buffList:AddItemFromPool()
      buffLoader = item:GetChild("BuffIconLoader")
      buffProgressBar = item:GetChild("BuffIconProgressBar")
      numberTxt = item:GetChild("LoaderTxt")
      if data.count > 1 then
        numberTxt.text = data.count
      else
        numberTxt.text = ""
      end
      buffLoader.url = UIUtil.GetResUrl(data.iconPath)
      if data.remainFrames and data.remainMaxFrames then
        buffProgressBar.visible = true
        buffProgressBar.value = 100 * (data.remainMaxFrames - data.remainFrames) / data.remainMaxFrames
      else
        buffProgressBar.visible = false
      end
    end
  end
end

function BattleUIWindow.ShowKillEnemyCount()
  local needShow, curCount, targetCount = BattleScene.NeedShowKillEnemyCount()
  if needShow then
    local integral = uis.Main.Integral
    if integral.root.visible == false then
      integral.root.visible = true
      integral.c1Ctr.selectedIndex = 0
      integral.WordTxt.text = T(11023)
    end
    integral.NumberTxt.text = T(11024, curCount, targetCount)
  end
end

function BattleUIWindow.PreLoadBattleResource(completeCallback)
  local allUnit = BattleScene.GetAllUnit()
  local count = 0
  ResourceManager.PreloadAndInstantiate({
    "Assets/Art/Effects/Prefab/battle/FX_battle_rocktime_change.prefab",
    "Assets/Art/Effects/Prefab/UI_prefab/Rocktime/FX_ui_battle_rocktime_black.prefab",
    "Assets/Art/Effects/Prefab/UI_prefab/Rocktime/FX_ui_rocktime_posteff.prefab"
  })
  for i, unit in ipairs(allUnit) do
    local effectNameList = unit.preloadEffect
    if #effectNameList > 0 then
      count = count + #effectNameList
      ResourceManager.PreloadAndInstantiate(effectNameList)
    end
    local bankPathList = unit.preloadBank
    if #bankPathList > 0 then
      count = count + #bankPathList
      for _, bank in ipairs(bankPathList) do
        SoundManager:LoadBank(bank, true)
      end
    end
  end
  local interval = math.min(count * 0.1, 2)
  LeanTween.delayedCall(interval, completeCallback)
end

function BattleUIWindow.OnShowAnimationEnd()
  BattleUIWindow.PreLoadBattleResource(function()
    if uis then
      uis.Main.root.visible = false
      UIUtil.ChangeBattleScreenEffectOut(function()
        UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_SHOW_BATTLE_START)
      end)
    end
  end)
  LightManager:SetLightEnable(true)
  LightManager:SetCameraBloom(UICamera, true, 1, 255, 255, 255, 1.1, 0, "UI")
end

function BattleUIWindow.OnPreClose()
  DragDropManager.inst.dragAgent.onDragEnd:Remove(BattleUIWindow.OnDragEnd)
  DragDropManager.inst.dragAgent.onDragMove:Remove(BattleUIWindow.OnDragMove)
  LightManager:SetLightEnable(false)
  LightManager:SetCameraBloom(UICamera, false)
end

function BattleUIWindow.OnClose()
  SoundManager:StopSnapShot("snapshot:/battle/slow_motion")
  if cardChooseTweener then
    cardChooseTweener:Kill()
    cardChooseTweener = nil
  end
  if cardBuffTipsUnit then
    cardBuffTipsUnit:Dispose()
    cardBuffTipsUnit = nil
  end
  if cardListIndexInParent then
    if uis then
      local list = uis.Main.BurstRegion.CardHeadList
      list:RemoveFromParent()
      uis.Main.root:AddChild(list)
    end
    cardListIndexInParent = nil
  end
  originCardListX = nil
  originCardListY = nil
  if curTargetLineRed then
    curTargetLineRed:Dispose()
    curTargetLineRed = nil
  end
  if curTargetLineBlue then
    curTargetLineBlue:Dispose()
    curTargetLineBlue = nil
  end
  curTargetLine = nil
  curLineEffectRed = nil
  curLineEffectBlue = nil
  if maskTexture then
    ResourceManager.UnloadTexture(maskTexture)
    maskTexture = nil
  end
  if PlotBattleScript then
    PlotBattleScript.Close()
    PlotBattleScript = nil
  end
  BattleScene.Clear()
  BattleCamera.enabled = false
  BattleUIWindow.ClearSkillDrag()
  DragDropManager.inst:Cancel()
  skillList = {}
  targetSpValue = nil
  BattleUIWindow.BattleEnd()
  if battleUIWindowObjectPool then
    battleUIWindowObjectPool:Clear()
    battleUIWindowObjectPool = nil
  end
  if cardList then
    for i, v in pairs(cardList) do
      if false == IsNil(v.loader) then
        v.loader.image:SetGrayByShader(false)
      end
    end
  end
  cardHeadRegionList = {}
  curBurstSkillCardList = {}
  cardList = {}
  cachedCardBuffList = {}
  leftHpCountTestText = nil
  rightHpCountTestText = nil
  uis = nil
  contentPane = nil
  curTouchCardUid = nil
  btnInfoList = nil
  btnList = {}
  burstEffectBackHolder = nil
  burstEffectHolder = nil
  burstEffectPlayingHolder = nil
  burstEffectDisableHolder = nil
  burstFullEffectGameObject = nil
  burstPlayingEffectGameObject = nil
  burstDisableEffectGameObject = nil
  burstCDProgressBarFlash = nil
  burstEnergyEffect = nil
  curBurstState = nil
  playHint = nil
  burstBtn = nil
  burstTimeTxt = nil
  burstProgressBarHolder = nil
  burstProgressBarEffect = nil
  chargeFullEffect = nil
  chargeFullEffectHolder = nil
  lastDotCount = nil
  burstProgressBarDarkHolder = nil
  burstProgressBarDarkEffect = nil
  tempBurstNeedJobList = nil
  tempCardForChoose = nil
  ResourceManager.ClearAllTempCache()
end

function BattleUIWindow.HandleMessage(msgId, para)
  local windowMsgEnum = WindowMsgEnum.BattleUIWindow
  if msgId == windowMsgEnum.E_MSG_SHOW_BATTLE_START then
    BattleUIWindow.ShowPlayBattleStart(para)
  elseif msgId == windowMsgEnum.E_MSG_SHOW_BATTLE_OVER then
    BattleUIWindow.ShowPlayBattleOver(para)
  elseif msgId == windowMsgEnum.E_MSG_SHOW_BATTLE_STOP_UPDATE_SHOW then
    BattleUIWindow.StopUpdateShow()
  elseif msgId == windowMsgEnum.E_MSG_SHOW_WAVE_START then
    BattleUIWindow.ShowPlayWaveStart(para)
  elseif msgId == windowMsgEnum.E_MSG_BATTLE_START then
    local beforeBattleCallback = BattleMgr.beforeBattleCallback
    if beforeBattleCallback then
      beforeBattleCallback(function()
        BattleUIWindow.BattleStart()
      end)
      BattleMgr.beforeBattleCallback = nil
    else
      BattleUIWindow.BattleStart()
    end
  elseif msgId == windowMsgEnum.E_MSG_BATTLE_PAUSE then
    BattleUIWindow.UpdateStopBtn()
  elseif msgId == windowMsgEnum.E_MSG_BATTLE_REMAIN_TIME then
    BattleUIWindow.UpdateRemainTime()
  elseif msgId == windowMsgEnum.E_MSG_BOSS_ENTER then
    BattleUIWindow.BossEnter(para)
  elseif msgId == windowMsgEnum.E_MSG_BOSS_DIE then
    BattleUIWindow.BossDie(para)
  elseif msgId == windowMsgEnum.E_MSG_BOSS_HP_CHANGE then
    BattleUIWindow.BossHpChange(para)
  elseif msgId == windowMsgEnum.E_MSG_BOSS_RAGE_CHANGE then
    BattleUIWindow.BossRageChange(para)
  elseif msgId == windowMsgEnum.E_MSG_BOSS_BUFF_CHANGE then
    BattleUIWindow.BossBuffChange(para.barInfo)
  elseif msgId == windowMsgEnum.E_MSG_ADD_HEAD then
    BattleUIWindow.AddHeadToList(para.unit)
  elseif msgId == windowMsgEnum.E_MSG_UPDATE_HEAD then
    BattleUIWindow.UpdateCard(para.uid, para.unit, para.barInfo)
    if cardChooseTweener then
      BattleUIWindow.UpdateCardDeadInBurst()
    end
  elseif msgId == windowMsgEnum.E_MSG_SHOW_KILL_ENEMY_COUNT then
    BattleUIWindow.ShowKillEnemyCount()
  elseif msgId == windowMsgEnum.E_MSG_UPDATE_BURST then
    BattleUIWindow.UpdateBurstInfo()
  elseif msgId == windowMsgEnum.E_MSG_UPDATE_UI_IN_BURST then
    BattleUIWindow.UpdateUIVisibleInBurst(para)
  elseif msgId == windowMsgEnum.E_MSG_SHOW_BURST_CARD_CHOOSE then
    BattleUIWindow.ShowBurstChooseCard()
  elseif msgId == windowMsgEnum.E_MSG_BURST_CARD_CHOOSE_END then
    BattleUIWindow.ChooseBurstCardComplete()
  elseif msgId == windowMsgEnum.E_MSG_CHANGE_WAVE then
    BattleUIWindow.ChangeWaveUI()
  elseif msgId == windowMsgEnum.E_MSG_SHOW_CARD_BURST_EFFECT then
    BattleUIWindow.AddCardPlayBurstSkillEffect(para)
  elseif msgId == windowMsgEnum.E_MSG_REMOVE_CARD_BURST_EFFECT then
    BattleUIWindow.RemoveCardPlayBurstSkillEffect(para)
  elseif msgId == windowMsgEnum.E_MSG_SHOW_BURST_CD_EFFECT then
    BattleUIWindow.AddCardBurstCdEffect(para)
  elseif msgId == windowMsgEnum.E_MSG_AUTO_CHOOSE_CARD then
    BattleUIWindow.AutoChooseCardBurst(para.card, para.frame)
  elseif msgId == windowMsgEnum.E_MSG_START_CHOOSE_CARD_TIMER then
    BattleUIWindow.StartChooseCardTimer()
  elseif msgId == windowMsgEnum.E_MSG_UPDATE_CHOOSE_CARD_LIST then
    BattleUIWindow.UpdateBurstChooseList()
  elseif msgId == windowMsgEnum.E_MSG_PLAY_CARD_SKILL_OVER_GUIDE then
    BattleUIWindow.PlayBurstCardSkillOverGuide()
  elseif msgId == windowMsgEnum.E_MSG_UPDATE_PER_FRAME then
    BattleUIWindow.UpdateBurstInfo()
    BattleUIWindow.UpdateDamageCount()
    BattleUIWindow.UpdateScoreInfo()
    BattleUIWindow.UpdateSkillArea()
  elseif msgId == windowMsgEnum.E_MSG_UPDATE_MANUALLY_SKILL then
    BattleUIWindow.UpdateSkillArea(para)
  end
end

return BattleUIWindow
