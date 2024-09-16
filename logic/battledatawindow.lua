require("BattleData_BattleDataWindowByName")
local BattleDataWindow = {}
local uis, contentPane, curDataType
local DATA_TYPE_ENUM = {UNIT = 1, SKILL = 2}
local battleData, curChallengeStageRsp, challengeStageRspList, curIndex, dataOwnComp, dataOwnSkillComp, dataEnemyComp, dataEnemySkillComp
local leftUnitDamage, rightUnitDamage = {}, {}
local leftSkillDamage, rightSkillDamage = {}, {}
local maxDamageUnit, maxDamagedUnit, maxTreatUnit, maxTreatedUnit = 0, 0, 0, 0
local maxDamageSkill, maxTreatSkill, maxShieldSkill = 0, 0, 0, 0
local isWin, leftHaveSkill, rightHaveSkill
local tweenInterval = 0.45

function BattleDataWindow.ReInitData()
end

local statType, showCampLeft, showCampRight

function BattleDataWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BattleDataWindow.package, WinResConfig.BattleDataWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetBattleData_BattleDataWindowUis(contentPane)
    if BattleData.isMirror then
      showCampLeft, showCampRight = BATTLE_CAMP_FLAG.RIGHT, BATTLE_CAMP_FLAG.LEFT
    else
      showCampLeft, showCampRight = BATTLE_CAMP_FLAG.LEFT, BATTLE_CAMP_FLAG.RIGHT
    end
    dataOwnComp = uis.Main.Own
    dataOwnSkillComp = uis.Main.OwnSkill
    dataEnemyComp = uis.Main.Enemy
    dataEnemySkillComp = uis.Main.EnemySkill
    curDataType = DATA_TYPE_ENUM.UNIT
    local param = bridgeObj.argTable[1]
    if #param > 1 then
      challengeStageRspList = param
      uis.Main.roundCtr.selectedIndex = 1
      BattleDataWindow.CreateWaveList()
    else
      uis.Main.roundCtr.selectedIndex = 0
      curChallengeStageRsp = param[1]
      BattleDataWindow.UpdateAll()
    end
  end)
end

function BattleDataWindow.CreateWaveList()
  local list = uis.Main.RoundList
  list:RemoveChildrenToPool()
  
  function list.itemRenderer(index, item)
    item.data = index + 1
    if 0 == index then
      UIUtil.SetText(item, T(10325))
    else
      UIUtil.SetText(item, T(10326))
    end
    item.onClick:Add(BattleDataWindow.ClickRoundBtn)
    if nil == curIndex then
      item:FireClick(true, true)
    end
  end
  
  list.numItems = #challengeStageRspList
end

function BattleDataWindow.ClickRoundBtn(eventContext)
  local index = eventContext.sender.data
  if index ~= curIndex then
    curIndex = index
    BattleDataWindow.UpdateAll(index)
  end
end

function BattleDataWindow.UpdateBattleData(index)
  if index then
    curChallengeStageRsp = challengeStageRspList[index]
  end
  battleData = SimpleCopy(curChallengeStageRsp.battleData)
  local stageId = battleData.initData.stageId
  if stageId then
    local stageConfig = TableData.GetConfig(stageId, "BaseStage")
    if stageConfig then
      statType = stageConfig.stat_type
    end
  end
  if 1 == statType then
    dataEnemyComp.c1Ctr.selectedIndex = 1
  else
    dataEnemyComp.c1Ctr.selectedIndex = 0
  end
end

function BattleDataWindow.IsWin()
  if curChallengeStageRsp.sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
    return true
  end
  if BattleData.isMirror then
    return not curChallengeStageRsp.win
  else
    return curChallengeStageRsp.win
  end
end

function BattleDataWindow.UpdateAll(index)
  BattleDataWindow.UpdateBattleData(index)
  isWin = BattleDataWindow.IsWin()
  BattleDataWindow.InitDamageData()
  BattleDataWindow.InitTextAndBtn()
  if curDataType == DATA_TYPE_ENUM.UNIT then
    BattleDataWindow.UpdateUnitInfo()
  else
    BattleDataWindow.UpdateSkillInfo()
  end
end

function BattleDataWindow.InitTextAndBtn()
  local loader = uis.Main.BackGround.BackGroundLoader
  if isWin then
    uis.Main.TitleWinTxt.text = T(10016)
    ChangeUIController(uis.Main.root, "c1", 0)
    loader.url = UIUtil.GetResUrl(TableData.GetConfig(20003, "BaseFeature").back_ground)
  else
    local failText = T(10018)
    local url = UIUtil.GetResUrl(TableData.GetConfig(20004, "BaseFeature").back_ground)
    if curChallengeStageRsp.sceneType == ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE then
      failText = T(20400)
      url = UIUtil.GetResUrl(TableData.GetConfig(20003, "BaseFeature").back_ground)
    elseif curChallengeStageRsp.sceneType == ProtoEnum.SCENE_TYPE.BUFF_STAGE then
      failText = T(20400)
      url = UIUtil.GetResUrl(TableData.GetConfig(20003, "BaseFeature").back_ground)
    elseif BattleData.IsGuildTrain(curChallengeStageRsp.sceneType) then
      failText = T(20400)
    end
    uis.Main.TitleFailTxt.text = failText
    ChangeUIController(uis.Main.root, "c1", 1)
    loader.url = url
  end
  dataOwnComp.TitleTxt.text = T(10012)
  if dataOwnSkillComp then
    dataOwnSkillComp.TitleTxt.text = T(10012)
  end
  dataEnemyComp.TitleTxt.text = T(10013)
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.BattleDataWindow.name)
  end)
  if curChallengeStageRsp.sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
    uis.Main.SwitchBtn.visible = true
    uis.Main.SwitchBtn.changeStateOnClick = false
    uis.Main.SwitchBtn.onClick:Set(BattleDataWindow.SwitchData)
  else
    uis.Main.SwitchBtn.visible = false
  end
  local leftCamp = showCampLeft
  local rightCamp = showCampRight
  if curChallengeStageRsp.sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
    if dataOwnSkillComp then
      UIUtil.SetBtnText(dataOwnSkillComp.DataLabel1Btn, T(10020))
      dataOwnSkillComp.DataLabel1Btn.onClick:Set(function()
        BattleDataWindow.RefreshSkillBtn(dataOwnSkillComp.DataLabel1Btn, leftCamp, function(a, b)
          return a.damage > b.damage
        end, function(a, b)
          return a.damage < b.damage
        end)
      end)
      UIUtil.SetBtnText(dataOwnSkillComp.DataLabel2Btn, T(10022))
      dataOwnSkillComp.DataLabel2Btn.onClick:Set(function()
        BattleDataWindow.RefreshSkillBtn(dataOwnSkillComp.DataLabel2Btn, leftCamp, function(a, b)
          return a.treat > b.treat
        end, function(a, b)
          return a.treat < b.treat
        end)
      end)
      UIUtil.SetBtnText(dataOwnSkillComp.DataLabel3Btn, T(10025))
      dataOwnSkillComp.DataLabel3Btn.onClick:Set(function()
        BattleDataWindow.RefreshSkillBtn(dataOwnSkillComp.DataLabel3Btn, leftCamp, function(a, b)
          return a.shield > b.shield
        end, function(a, b)
          return a.shield < b.shield
        end)
      end)
    end
    if dataEnemySkillComp then
    end
  end
  UIUtil.SetBtnText(dataOwnComp.DataLabel1Btn, T(10020))
  dataOwnComp.DataLabel1Btn.onClick:Set(function()
    BattleDataWindow.RefreshBtn(dataOwnComp.DataLabel1Btn, leftCamp, function(a, b)
      return a.damage > b.damage
    end, function(a, b)
      return a.damage < b.damage
    end)
  end)
  UIUtil.SetBtnText(dataOwnComp.DataLabel2Btn, T(10021))
  dataOwnComp.DataLabel2Btn.onClick:Set(function()
    if curDataType == DATA_TYPE_ENUM.UNIT then
      BattleDataWindow.RefreshBtn(dataOwnComp.DataLabel2Btn, leftCamp, function(a, b)
        return a.damaged > b.damaged
      end, function(a, b)
        return a.damaged < b.damaged
      end)
    end
  end)
  UIUtil.SetBtnText(dataOwnComp.DataLabel3Btn, T(10022))
  dataOwnComp.DataLabel3Btn.onClick:Set(function()
    BattleDataWindow.RefreshBtn(dataOwnComp.DataLabel3Btn, leftCamp, function(a, b)
      return a.treat > b.treat
    end, function(a, b)
      return a.treat < b.treat
    end)
  end)
  UIUtil.SetBtnText(dataOwnComp.DataLabel4Btn, T(10023))
  dataOwnComp.DataLabel4Btn.onClick:Set(function()
    if curDataType == DATA_TYPE_ENUM.UNIT then
      BattleDataWindow.RefreshBtn(dataOwnComp.DataLabel4Btn, leftCamp, function(a, b)
        return a.treated > b.treated
      end, function(a, b)
        return a.treated < b.treated
      end)
    end
  end)
  UIUtil.SetBtnText(dataEnemyComp.DataLabel1Btn, T(10020))
  dataEnemyComp.DataLabel1Btn.onClick:Set(function()
    BattleDataWindow.RefreshBtn(dataEnemyComp.DataLabel1Btn, rightCamp, function(a, b)
      return a.damage > b.damage
    end, function(a, b)
      return a.damage < b.damage
    end)
  end)
  UIUtil.SetBtnText(dataEnemyComp.DataLabel2Btn, T(10021))
  dataEnemyComp.DataLabel2Btn.onClick:Set(function()
    if curDataType == DATA_TYPE_ENUM.UNIT then
      BattleDataWindow.RefreshBtn(dataEnemyComp.DataLabel2Btn, rightCamp, function(a, b)
        return a.damaged > b.damaged
      end, function(a, b)
        return a.damaged < b.damaged
      end)
    end
  end)
  UIUtil.SetBtnText(dataEnemyComp.DataLabel3Btn, T(10022))
  dataEnemyComp.DataLabel3Btn.onClick:Set(function()
    BattleDataWindow.RefreshBtn(dataEnemyComp.DataLabel3Btn, rightCamp, function(a, b)
      return a.treat > b.treat
    end, function(a, b)
      return a.treat < b.treat
    end)
  end)
  UIUtil.SetBtnText(dataEnemyComp.DataLabel4Btn, T(10023))
  dataEnemyComp.DataLabel4Btn.onClick:Set(function()
    if curDataType == DATA_TYPE_ENUM.UNIT then
      BattleDataWindow.RefreshBtn(dataEnemyComp.DataLabel4Btn, rightCamp, function(a, b)
        return a.treated > b.treated
      end, function(a, b)
        return a.treated < b.treated
      end)
    end
  end)
end

function BattleDataWindow.GetKilledCountByUid(uid)
  local unitDamage = battleData.unitDamage
  local count = 0
  for i, v in ipairs(unitDamage) do
    if v.deadTime and v.deadTime >= 0 and v.killedByUid == uid then
      count = count + 1
    end
  end
  return count
end

function BattleDataWindow.InitDamageData()
  leftUnitDamage = {}
  rightUnitDamage = {}
  leftSkillDamage = {}
  rightSkillDamage = {}
  local unitDamage = battleData.unitDamage
  if 1 == statType then
    for i, v in ipairs(unitDamage) do
      if v.camp == showCampLeft then
        maxDamageUnit = math.max(maxDamageUnit, v.damage)
        maxDamagedUnit = math.max(maxDamagedUnit, v.damaged)
        maxTreatUnit = math.max(maxTreatUnit, v.treat)
        maxTreatedUnit = math.max(maxTreatedUnit, v.treated)
        v.killCount = BattleDataWindow.GetKilledCountByUid(v.uid)
        table.insert(leftUnitDamage, v)
        table.sort(leftUnitDamage, function(a, b)
          return a.damage > b.damage
        end)
      else
        local find = false
        for _, right in ipairs(rightUnitDamage) do
          if right.unitInfo.id == v.unitInfo.id then
            if v.deadTime and v.deadTime >= 0 then
              right.deadCount = right.deadCount + 1
            end
            find = true
            break
          end
        end
        if false == find then
          if v.deadTime and v.deadTime >= 0 then
            v.deadCount = 1
          else
            v.deadCount = 0
          end
          local config = CardData.GetBaseConfig(v.unitInfo.id)
          v.monsterRank = config.rank or 0
          table.insert(rightUnitDamage, v)
        end
        table.sort(rightUnitDamage, function(a, b)
          if a.monsterRank == b.monsterRank then
            return a.unitInfo.id < b.unitInfo.id
          else
            return a.monsterRank > b.monsterRank
          end
        end)
      end
    end
  else
    for i, v in ipairs(unitDamage) do
      maxDamageUnit = math.max(maxDamageUnit, v.damage)
      maxDamagedUnit = math.max(maxDamagedUnit, v.damaged)
      maxTreatUnit = math.max(maxTreatUnit, v.treat)
      maxTreatedUnit = math.max(maxTreatedUnit, v.treated)
      if v.camp == showCampLeft then
        table.insert(leftUnitDamage, v)
      elseif v.camp == showCampRight then
        table.insert(rightUnitDamage, v)
      end
      table.sort(leftUnitDamage, function(a, b)
        return a.damage > b.damage
      end)
      table.sort(rightUnitDamage, function(a, b)
        return a.damage > b.damage
      end)
    end
  end
  local skillDamage = battleData.manuallySkillDamage
  for i, v in ipairs(skillDamage) do
    maxDamageSkill = math.max(maxDamageSkill, v.damage)
    maxTreatSkill = math.max(maxTreatSkill, v.treat)
    maxShieldSkill = math.max(maxShieldSkill, v.shield)
    if v.camp == showCampLeft then
      table.insert(leftSkillDamage, v)
      leftHaveSkill = true
    elseif v.camp == showCampRight then
      table.insert(rightSkillDamage, v)
      rightHaveSkill = true
    end
    table.sort(leftSkillDamage, function(a, b)
      return a.damage > b.damage
    end)
    table.sort(rightSkillDamage, function(a, b)
      return a.damage > b.damage
    end)
  end
  if curDataType == DATA_TYPE_ENUM.UNIT then
    dataOwnComp.DataLabel1Btn.selected = true
    BattleDataWindow.RefreshBtn(dataOwnComp.DataLabel1Btn, showCampLeft)
    dataEnemyComp.DataLabel1Btn.selected = true
    BattleDataWindow.RefreshBtn(dataEnemyComp.DataLabel1Btn, showCampRight)
  elseif curDataType == DATA_TYPE_ENUM.SKILL then
    dataOwnSkillComp.DataLabel1Btn.selected = true
    BattleDataWindow.RefreshSkillBtn(dataOwnSkillComp.DataLabel1Btn, showCampLeft)
  end
end

function BattleDataWindow.UpdateUnitInfo()
  uis.Main.WordTxt.text = T(10014)
  BattleDataWindow.UpdateList(dataOwnComp.OwnCardList, leftUnitDamage)
  BattleDataWindow.UpdateList(dataEnemyComp.EnemyCardList, rightUnitDamage)
  if uis.Main.SwitchBtn.visible == true then
    UIUtil.SetBtnText(uis.Main.SwitchBtn, T(10011))
  end
end

function BattleDataWindow.UpdateList(list, damageInfo)
  if list and damageInfo then
    list:RemoveChildrenToPool()
    local hand
    for i, v in ipairs(damageInfo) do
      hand = list:AddItemFromPool()
      BattleDataWindow.UpdateOneItem(hand, v)
    end
  end
end

function BattleDataWindow.UpdateOneItem(hand, damageInfo)
  if damageInfo.skillId then
    local damageInfoCopy = damageInfo
    if damageInfoCopy.activeCount then
      local tipsList = hand:GetChild("TipsList")
      tipsList:RemoveChildrenToPool()
      local useTime = tipsList:AddItemFromPool()
      if damageInfoCopy.activeCount > 0 then
        useTime.visible = true
        local wordTxt = useTime:GetChild("WordTxt")
        if wordTxt then
          wordTxt.text = T(10026)
        end
        local numberTxt = useTime:GetChild("NumberTxt")
        if numberTxt then
          numberTxt.text = damageInfoCopy.activeCount
        end
      else
        useTime.visible = false
      end
    end
    local comp = hand:GetChild("Damage")
    if damageInfoCopy.damage > 0 then
      ChangeUIController(comp, "c1", 0)
      comp:GetChild("NumberTxt").text = damageInfoCopy.damage
      local progressBar = comp:GetChild("DamageProgressBar")
      progressBar.value = 0
      progressBar:TweenValue(100 * damageInfoCopy.damage / maxDamageSkill, tweenInterval)
    else
      ChangeUIController(comp, "c1", 0)
      comp:GetChild("NumberTxt").text = ""
      local progressBar = comp:GetChild("DamageProgressBar")
      progressBar.value = 0
    end
    comp = hand:GetChild("Cure")
    if damageInfoCopy.treat > 0 then
      ChangeUIController(comp, "c1", 0)
      comp:GetChild("NumberTxt").text = damageInfoCopy.treat
      local progressBar = comp:GetChild("CureProgressBar")
      progressBar.value = 0
      progressBar:TweenValue(100 * damageInfoCopy.treat / maxTreatSkill, tweenInterval)
    else
      ChangeUIController(comp, "c1", 0)
      comp:GetChild("NumberTxt").text = ""
      local progressBar = comp:GetChild("CureProgressBar")
      progressBar.value = 0
    end
    comp = hand:GetChild("Shield")
    if damageInfoCopy.shield > 0 then
      ChangeUIController(comp, "c1", 0)
      comp:GetChild("NumberTxt").text = damageInfoCopy.shield
      local progressBar = comp:GetChild("ShieldProgressBar")
      progressBar.value = 0
      progressBar:TweenValue(100 * damageInfoCopy.shield / maxShieldSkill, tweenInterval)
    else
      ChangeUIController(comp, "c1", 0)
      comp:GetChild("NumberTxt").text = ""
      local progressBar = comp:GetChild("ShieldProgressBar")
      progressBar.value = 0
    end
    local skillConfig = TableData.GetConfig(damageInfo.skillId, "BaseSkill")
    local skillLevelUpConfig = TableData.GetConfig(damageInfo.skillId * 1000 + damageInfo.skillLevel, "BaseSkillLevelUp")
    comp = hand:GetChild("NameTxt")
    comp.text = skillConfig.name()
    comp = hand:GetChild("LevelTxt")
    comp.text = T(10009, damageInfoCopy.skillLevel)
    comp = hand:GetChild("SkillWordTxt")
    comp.text = skillLevelUpConfig.des()
    comp = hand:GetChild("ElementList")
    if comp then
      UIUtil.ShowElementList(comp, skillConfig)
    end
    local frame = hand:GetChild("HeadBtn"):GetChild("Head")
    comp = frame:GetChild("PicLoader")
    comp.url = UIUtil.GetResUrl(skillConfig.icon)
  else
    local damageInfoCopy = damageInfo
    local cardId = damageInfo.unitInfo.id
    local baseConfig = CardData.GetBaseConfig(cardId)
    local headBtn = hand:GetChild("HeadBtn")
    UIUtil.ShowHeadBtn(cardId, headBtn, damageInfo.unitInfo, nil, HEAD_ICON_TYPE_ENUM.RECT)
    if 1 == statType and damageInfoCopy.camp == showCampRight then
      ChangeUIController(hand, "c1", 1)
      hand:GetChild("MonsterNumber"):GetChild("NumberTxt").text = T(11310, damageInfoCopy.deadCount)
    else
      ChangeUIController(hand, "c1", 0)
      local tipsList = hand:GetChild("TipsList")
      tipsList:RemoveChildrenToPool()
      if damageInfoCopy.deadTime and damageInfoCopy.deadTime >= 0 then
        local dead = tipsList:AddItemFromPool(UIUtil.GetResUrl("BattleData:DieTime"))
        dead:GetChild("TimeTxt").text = T(10024, math.ceil(damageInfoCopy.deadTime / 30))
      end
      if 1 == statType and damageInfoCopy.killCount > 0 then
        local kill = tipsList:AddItemFromPool(UIUtil.GetResUrl("BattleData:KillNumber"))
        kill:GetChild("WordTxt").text = T(11309)
        kill:GetChild("NumberTxt").text = damageInfoCopy.killCount
      end
    end
    local comp = hand:GetChild("DamageProgressBar")
    if damageInfoCopy.damage > 0 then
      ChangeUIController(comp, "c1", 0)
      comp:GetChild("NumberTxt").text = damageInfoCopy.damage
      local progressBar = comp:GetChild("DamageProgressBar")
      progressBar.value = 0
      progressBar:TweenValue(100 * damageInfoCopy.damage / maxDamageUnit, tweenInterval)
    else
      ChangeUIController(comp, "c1", 1)
    end
    comp = hand:GetChild("SufferDamage")
    if damageInfoCopy.damaged > 0 then
      ChangeUIController(comp, "c1", 0)
      comp:GetChild("NumberTxt").text = damageInfoCopy.damaged
      local progressBar = comp:GetChild("SufferDamage2ProgressBar")
      progressBar.value = 0
      progressBar:TweenValue(100 * damageInfoCopy.damaged / maxDamagedUnit, tweenInterval)
    else
      ChangeUIController(comp, "c1", 1)
    end
    comp = hand:GetChild("Cure")
    if damageInfoCopy.treat > 0 then
      ChangeUIController(comp, "c1", 0)
      comp:GetChild("NumberTxt").text = damageInfoCopy.treat
      local progressBar = comp:GetChild("CureProgressBar")
      progressBar.value = 0
      progressBar:TweenValue(100 * damageInfoCopy.treat / maxTreatUnit, tweenInterval)
    else
      ChangeUIController(comp, "c1", 1)
    end
    comp = hand:GetChild("SufferCure")
    if damageInfoCopy.treated > 0 then
      ChangeUIController(comp, "c1", 0)
      comp:GetChild("NumberTxt").text = damageInfoCopy.treated
      local progressBar = comp:GetChild("SufferCure2ProgressBar")
      progressBar.value = 0
      progressBar:TweenValue(100 * damageInfoCopy.treated / maxTreatedUnit, tweenInterval)
    else
      ChangeUIController(comp, "c1", 1)
    end
    comp = hand:GetChild("Occupation")
    if comp then
      ChangeUIController(comp, nil, baseConfig.type - 1)
      ChangeUIController(comp, "c2", 1)
    end
    comp = hand:GetChild("ElementList")
    UIUtil.ShowElementList(comp, baseConfig)
    hand:GetChild("NameTxt").text = baseConfig.name()
  end
end

function BattleDataWindow.UpdateSkillInfo()
  if dataOwnSkillComp then
    BattleDataWindow.UpdateList(dataOwnSkillComp.OwnSkillList, leftSkillDamage)
  end
  UIUtil.SetBtnText(uis.Main.SwitchBtn, T(10010))
end

function BattleDataWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.BattleDataWindow.name)
end

function BattleDataWindow.RefreshBtn(clickBtn, camp, sortFunc, sortFuncRevert)
  local leftBtnList = {
    dataOwnComp.DataLabel1Btn,
    dataOwnComp.DataLabel2Btn,
    dataOwnComp.DataLabel3Btn,
    dataOwnComp.DataLabel4Btn
  }
  local rightBtnList = {
    dataEnemyComp.DataLabel1Btn,
    dataEnemyComp.DataLabel2Btn,
    dataEnemyComp.DataLabel3Btn,
    dataEnemyComp.DataLabel4Btn
  }
  if camp == showCampLeft then
    local isRevert = false
    local btnSelected = false
    for i, v in ipairs(leftBtnList) do
      if v == clickBtn then
        btnSelected = true
        ChangeUIController(v, "c1", 1)
        if v.selected == false then
          isRevert = true
        else
        end
      else
        ChangeUIController(v, "c1", 0)
        v.selected = false
      end
      ChangeUIController(v, "c2", i - 1)
    end
    if btnSelected and sortFunc and sortFuncRevert then
      if curDataType == DATA_TYPE_ENUM.UNIT then
        table.sort(leftUnitDamage, isRevert and sortFuncRevert or sortFunc)
      else
        table.sort(leftSkillDamage, isRevert and sortFuncRevert or sortFunc)
      end
    end
  elseif camp == showCampRight then
    local isRevert = false
    local btnSelected = false
    for i, v in ipairs(rightBtnList) do
      if v == clickBtn then
        btnSelected = true
        ChangeUIController(v, "c1", 1)
        if v.selected == false then
          isRevert = true
        else
        end
      else
        ChangeUIController(v, "c1", 0)
        v.selected = false
      end
      ChangeUIController(v, "c2", i - 1)
    end
    if btnSelected and sortFunc and sortFuncRevert then
      table.sort(rightUnitDamage, isRevert and sortFuncRevert or sortFunc)
    end
  end
  if sortFunc and sortFuncRevert then
    if curDataType == DATA_TYPE_ENUM.UNIT then
      BattleDataWindow.UpdateUnitInfo()
    else
      BattleDataWindow.UpdateSkillInfo()
    end
  end
end

function BattleDataWindow.RefreshSkillBtn(clickBtn, camp, sortFunc, sortFuncRevert)
  local leftBtnList = {
    dataOwnSkillComp.DataLabel1Btn,
    dataOwnSkillComp.DataLabel2Btn,
    dataOwnSkillComp.DataLabel3Btn
  }
  local rightBtnList = {}
  if camp == showCampLeft then
    local isRevert = false
    local btnSelected = false
    for i, v in ipairs(leftBtnList) do
      if v == clickBtn then
        btnSelected = true
        ChangeUIController(v, "c1", 1)
        if v.selected == false then
          isRevert = true
        else
        end
      else
        ChangeUIController(v, "c1", 0)
        v.selected = false
      end
      ChangeUIController(v, "c2", (i - 1) * 2)
    end
    if btnSelected and sortFunc and sortFuncRevert then
      table.sort(leftSkillDamage, isRevert and sortFuncRevert or sortFunc)
    end
  elseif camp == showCampRight then
    local isRevert = false
    local btnSelected = false
    for i, v in ipairs(rightBtnList) do
      if v == clickBtn then
        btnSelected = true
        ChangeUIController(v, "c1", 1)
        if v.selected == false then
          isRevert = true
        else
        end
      else
        ChangeUIController(v, "c1", 0)
        v.selected = false
      end
      ChangeUIController(v, "c2", (i - 1) * 2)
    end
    if btnSelected and sortFunc and sortFuncRevert then
      table.sort(rightSkillDamage, isRevert and sortFuncRevert or sortFunc)
    end
  end
  if sortFunc and sortFuncRevert then
    BattleDataWindow.UpdateSkillInfo()
  end
end

function BattleDataWindow.SwitchData()
  if curDataType == DATA_TYPE_ENUM.UNIT then
    local skillDamage = battleData.manuallySkillDamage
    if nil == skillDamage or 0 == #skillDamage then
      FloatTipsUtil.ShowWarnTips(T(11744))
      return
    end
    ChangeUIController(uis.Main.SwitchBtn, "button", 1)
    uis.Main.c2Ctr.selectedIndex = 1
    curDataType = DATA_TYPE_ENUM.SKILL
    BattleDataWindow.InitDamageData()
    BattleDataWindow.UpdateSkillInfo()
  else
    ChangeUIController(uis.Main.SwitchBtn, "button", 0)
    uis.Main.c2Ctr.selectedIndex = 0
    curDataType = DATA_TYPE_ENUM.UNIT
    BattleDataWindow.InitDamageData()
    BattleDataWindow.UpdateUnitInfo()
  end
end

function BattleDataWindow.OnShown()
end

function BattleDataWindow.OnHide()
end

function BattleDataWindow.OnClose()
  curChallengeStageRsp = nil
  challengeStageRspList = nil
  curIndex = nil
  leftUnitDamage, rightUnitDamage = {}, {}
  leftSkillDamage, rightSkillDamage = {}, {}
  leftHaveSkill, rightHaveSkill = nil, nil
  maxDamageUnit, maxDamagedUnit, maxTreatUnit, maxTreatedUnit = 0, 0, 0, 0
  maxDamageSkill, maxTreatSkill = 0, 0
  dataOwnComp = nil
  dataEnemyComp = nil
  dataOwnSkillComp = nil
  uis = nil
  contentPane = nil
  battleData = nil
  statType = nil
  curDataType = nil
end

function BattleDataWindow.HandleMessage(msgId, para)
end

return BattleDataWindow
