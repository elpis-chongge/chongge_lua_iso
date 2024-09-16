BattleMessageBar = {}
local min = math.min
local ceil = math.ceil

function BattleMessageBar.BindInfo(unit)
  require("CommonResource_PlayerHPByName")
  require("CommonResource_PlayerBuffByName")
  local headInfo = {}
  local headObject, curProgressBar, rageProgressBar, defenseProgressBar, firmProgressBar, soulProgressBar, buildingScale, uiPanel, percentageTxt, rageTxt, defenseTxt, buffList, headInfoObj, originParent, c1Ctr, c2Ctr, c3Ctr, monsterCtr, barWidth
  
  function headInfo:Init(bindUnit)
    originParent = bindUnit.model or bindUnit.effectModel
    local headInfoUI = originParent.transform:Find("HeadInfo")
    if nil == headInfoUI then
      originParent = nil
      return
    end
    headInfoObj = headInfoUI.gameObject
    if headInfoObj then
      headInfoObj:SetActiveSafe(true)
      uiPanel = headInfoObj.transform:GetComponent(typeof(FairyGUI.UIPanel))
      headObject = uiPanel.ui
      local unitScale = bindUnit.fashionScale
      headObject.scaleX = 5.25 / unitScale
      headObject.scaleY = 5.25 / unitScale
      if bindUnit.camp == BATTLE_CAMP_FLAG.LEFT and bindUnit.isBuilding == false and nil == bindUnit.summonId then
        bindUnit.showHeadInList = true
        UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_ADD_HEAD, {unit = bindUnit})
      end
      self.lastHp = bindUnit:GetHp()
      self.lastShield = bindUnit:GetAttr(ATTR_ENUM.shield)
      self.lastTenacity = bindUnit:GetAttr(ATTR_ENUM.tenacity)
      self.lastShieldSpecial = bindUnit:GetAttr(ATTR_ENUM.shield_special)
      self.haveRage = bindUnit.haveRage
      local uis = GetCommonResource_PlayerHPUis(headObject)
      c1Ctr = uis.c1Ctr
      c2Ctr = uis.c2Ctr
      c3Ctr = uis.c3Ctr
      monsterCtr = uis.monsterCtr
      rageProgressBar = uis.RageProgressBar
      defenseProgressBar = uis.DefenseProgressBar
      defenseProgressBar.visible = false
      rageTxt = uis.RageTxt
      defenseTxt = uis.DefenseTxt
      percentageTxt = uis.PercentageTxt
      buffList = uis.BuffList
      self:UpdateVisible()
      self:UpdateBuffVisible()
      if bindUnit.camp == BATTLE_CAMP_FLAG.RIGHT then
        c1Ctr.selectedIndex = 1
      else
        c1Ctr.selectedIndex = 0
      end
      if bindUnit.isMonster then
        c2Ctr.selectedIndex = 1
        local monsterRank = bindUnit.monsterRank
        if monsterRank == BATTLE_MONSTER_RANK.NORMAL or monsterRank == BATTLE_MONSTER_RANK.ELITE then
          curProgressBar = uis.HpMonsterProgressBar
        elseif monsterRank == BATTLE_MONSTER_RANK.BOSS then
          curProgressBar = uis.HpEliteProgressBar
        elseif monsterRank == BATTLE_MONSTER_RANK.LORD or monsterRank == BATTLE_MONSTER_RANK.DISASTER then
          curProgressBar = uis.HpBossProgressBar
        end
        monsterCtr.selectedIndex = bindUnit.monsterRank
      elseif bindUnit.isBuilding then
        curProgressBar = uis.HpBuildProgressBar
        buildingScale = curProgressBar:GetChild("ScaleStrip")
        c2Ctr.selectedIndex = 2
        monsterCtr.selectedIndex = 0
      else
        if bindUnit.camp == BATTLE_CAMP_FLAG.RIGHT then
          c2Ctr.selectedIndex = 1
          curProgressBar = uis.HpMonsterProgressBar
        else
          c2Ctr.selectedIndex = 0
          curProgressBar = uis.HpProgressBar
        end
        monsterCtr.selectedIndex = 0
      end
      curProgressBar.value = 100
      barWidth = curProgressBar:GetChild("bar").width
      firmProgressBar = curProgressBar:GetChild("FirmProgressBar")
      soulProgressBar = curProgressBar:GetChild("SoulProgressBar")
      uis.BuffList.isReverse = true
      self:UpdateHp(bindUnit, true)
      if true == self.haveRage then
        rageProgressBar.visible = true
        self:UpdateRage(bindUnit)
        rageTxt.visible = true
      else
        rageProgressBar.visible = false
        rageTxt.visible = false
      end
      if Application.platform == RuntimePlatform.Android or Application.platform == RuntimePlatform.IPhonePlayer then
        rageTxt.visible = false
        percentageTxt.visible = false
        defenseTxt.visible = false
      elseif true == BattleMgr.showCardUidTest and uis.UIDTxt then
        uis.UIDTxt.visible = true
        uis.UIDTxt.text = bindUnit.uid
      end
      if bindUnit.isBuilding == true and nil ~= buildingScale then
        buildingScale:RemoveChildren(0, -1, true)
        local maxHp = bindUnit:GetAttr(ATTR_ENUM.max_hp)
        if maxHp > 1 then
          local startX = 0
          local intervalX = buildingScale.width / maxHp
          for i = 1, maxHp - 1 do
            local scale = UIMgr:CreateObject("CommonResource", "Scale")
            buildingScale:AddChild(scale)
            scale.x = startX + i * intervalX
          end
        end
      end
      c3Ctr.selectedIndex = 1
    end
  end
  
  function headInfo:UpdateHp(bindUnit, isInit)
    local lastHp = self.lastHp
    local nowHp = bindUnit:GetHp()
    local maxHp = bindUnit:GetAttr(ATTR_ENUM.max_hp)
    if bindUnit.camp == BATTLE_CAMP_FLAG.RIGHT and BattleData.stageType == ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE and RaidBossMgr.IsHardestLevel(BattleData.stageId) then
      nowHp = maxHp
    end
    local lastShield = self.lastShield
    local lastTenacity = self.lastTenacity
    local lastShieldSpecial = self.lastShieldSpecial
    local nowShield = bindUnit:GetAttr(ATTR_ENUM.shield)
    local nowTenacity = bindUnit:GetAttr(ATTR_ENUM.tenacity)
    local nowShieldSpecial = bindUnit:GetAttr(ATTR_ENUM.shield_special)
    local nowValue = nowHp + nowShield
    local lastValue = lastHp + lastShield
    local targetValue = 100 * nowValue / maxHp
    if targetValue < 0 then
      targetValue = 0
    elseif targetValue > 100 then
      targetValue = 100
    end
    if nowShield > 0 then
      defenseProgressBar.visible = true
    else
      defenseProgressBar.visible = false
    end
    local tenacityPer
    if nowTenacity > 0 then
      firmProgressBar.visible = true
      tenacityPer = nowTenacity / bindUnit.tenacityMax
      firmProgressBar.value = 100 * tenacityPer
    else
      tenacityPer = 0
      firmProgressBar.visible = false
    end
    local shieldSpecialPer
    if soulProgressBar then
      if nowShieldSpecial > 0 then
        soulProgressBar.visible = true
        shieldSpecialPer = nowShieldSpecial / bindUnit.shieldSpecialMax
        soulProgressBar.value = 100 * shieldSpecialPer
      else
        shieldSpecialPer = 0
        soulProgressBar.visible = false
      end
    end
    local hpPer
    local defenseValue = 0
    if maxHp <= nowValue then
      hpPer = nowHp / nowValue
      local value = 100 * hpPer
      if isInit then
        curProgressBar:SetValue(value)
      else
        curProgressBar.value = value
      end
      local hpWidth = math.floor(barWidth * value / 100)
      defenseProgressBar.x = curProgressBar.x + hpWidth
      defenseValue = 100 * (barWidth - hpWidth) / barWidth
      defenseProgressBar.value = defenseValue
    else
      hpPer = nowHp / maxHp
      local value = 100 * hpPer
      if isInit then
        curProgressBar:SetValue(value)
      else
        curProgressBar.value = value
      end
      local hpWidth = math.floor(barWidth * value / 100)
      defenseProgressBar.x = curProgressBar.x + hpWidth
      defenseValue = 100 * nowShield / maxHp
      defenseProgressBar.value = defenseValue
    end
    if nowShield > 0 then
      defenseTxt.text = nowShield
    else
      defenseTxt.text = ""
    end
    local num = ceil(100 * nowHp / maxHp)
    percentageTxt.text = num .. "%"
    self.lastHp = nowHp
    self.lastShield = nowShield
    self.lastTenacity = nowTenacity
    self.lastShieldSpecial = nowShieldSpecial
    if bindUnit.showBossMessage then
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_BOSS_HP_CHANGE, {
        hpValue = targetValue,
        defenseValue = defenseValue,
        hpPer = hpPer,
        tenacityPer = tenacityPer,
        shieldSpecialPer = shieldSpecialPer
      })
    end
    if bindUnit.showHeadInList then
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_UPDATE_HEAD, {
        unit = bindUnit,
        barInfo = {
          defenseValue = defenseValue,
          hpPer = hpPer,
          tenacityPer = tenacityPer,
          shieldSpecialPer = shieldSpecialPer
        }
      })
    end
  end
  
  function headInfo:UpdateRage(bindUnit)
    local nowRage = bindUnit:GetRage()
    local maxRage = bindUnit:GetAttr(ATTR_ENUM.max_rage)
    local value = min(100 * nowRage / maxRage, 100)
    if headObject and headObject.visible then
      if 100 == value or 0 == value then
        rageProgressBar:TweenValue(value, 0.3)
      else
        rageProgressBar:TweenValue(value, 0.5)
      end
      self.lastRage = nowRage
      rageTxt.text = nowRage
    end
    if bindUnit.showBossMessage then
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_BOSS_RAGE_CHANGE, value)
    end
    if bindUnit.showHeadInList then
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_UPDATE_HEAD, {
        unit = bindUnit,
        barInfo = {rageValue = value}
      })
    end
  end
  
  function headInfo:UpdateBuffList(bindUnit)
    local buffDataList = bindUnit:GetBuffIconList()
    if headObject and headObject.visible and buffList then
      buffList:RemoveChildrenToPool()
      for i = 1, #buffDataList do
        self:CreateOneBuff(buffDataList[i])
      end
    end
    if bindUnit.showBossMessage then
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_BOSS_BUFF_CHANGE, {
        barInfo = {buffDataList = buffDataList}
      })
    end
    if bindUnit.showHeadInList then
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_UPDATE_HEAD, {
        unit = bindUnit,
        barInfo = {buffDataList = buffDataList}
      })
    end
  end
  
  function headInfo:CreateOneBuff(data)
    if buffList then
      local item = buffList:AddItemFromPool()
      local uis = GetCommonResource_PlayerBuffUis(item)
      if data.count > 1 then
        uis.NumberTxt.text = data.count
      else
        uis.NumberTxt.text = ""
      end
      uis.BuffLoader.url = UIUtil.GetResUrl(data.iconPath)
      if data.remainFrames and data.remainMaxFrames then
        uis.BuffIconProgressBar.visible = true
        uis.BuffIconProgressBar.value = 100 * (data.remainMaxFrames - data.remainFrames) / data.remainMaxFrames
      else
        uis.BuffIconProgressBar.visible = false
      end
    end
  end
  
  function headInfo:Hide()
    if headInfoObj then
      headInfoObj:SetActiveSafe(false)
    end
  end
  
  function headInfo:UpdateVisible()
    local visible = 1 == PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.BATTLE_BLOOD_ENABLE)
    if headObject and headObject.visible ~= visible then
      headObject.visible = visible
    end
  end
  
  function headInfo:UpdateBuffVisible()
    local visible = 1 == PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.BATTLE_BUFF_ENABLE)
    if buffList and buffList.visible ~= visible then
      buffList.visible = visible
    end
  end
  
  function headInfo:UpdateSortingOrder(sortingOrder)
    if headObject then
    end
  end
  
  function headInfo:SetAlpha(alpha)
    if headObject then
      headObject.alpha = alpha
    end
  end
  
  function headInfo:Destroy()
    c1Ctr = nil
    c2Ctr = nil
    c3Ctr = nil
    monsterCtr = nil
    headInfo:SetAlpha(1)
    uiPanel = nil
    headObject = nil
    curProgressBar = nil
    rageProgressBar = nil
    percentageTxt = nil
    defenseProgressBar = nil
    originParent = nil
    buildingScale = nil
    rageTxt = nil
    defenseTxt = nil
    if headInfoObj then
      headInfoObj:SetActiveSafe(false)
    end
    headInfoObj = nil
    if buffList then
      buffList:RemoveChildrenToPool()
      buffList:ClearPool()
    end
    buffList = nil
    self = nil
  end
  
  headInfo:Init(unit)
  return headInfo
end
