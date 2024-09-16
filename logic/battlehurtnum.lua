BattleHurtNum = {}
local BattleBuffWordType = {
  MISS = "Battle:buff_miss",
  INVINCIBLE = "Battle:buff_wudi",
  IMMUNE = "Battle:buff_mianyi"
}
local hudCom, battlePopObjectPool
local floor = math.floor
local BattleHurtNumType = {
  NOR_HURT = "NormalHitNumberTips",
  NOR_TREATMENT = "GreenHpNumberTips",
  BUFF_HURT = "BuffHitNumberTips",
  ABSORB_HURT = "ShieldHitNumberTips",
  BLOCK_HURT = "BlockHitNumberTips",
  CRI_HURT = "CritHitNumberTips",
  BURST_NOR_HURT = "BurstNormalHitNumberTips",
  BURST_NOR_TREATMENT = "BurstGreenHpNumberTips",
  BURST_BUFF_HURT = "BurstBuffHitNumberTips",
  BURST_ABSORB_HURT = "BurstShieldHitNumberTips",
  BURST_BLOCK_HURT = "BurstBlockHitNumberTips",
  BURST_CRI_HURT = "BurstCritHitNumberTips"
}
local BattleHurtNumComName = {
  NOR_HURT = "NormalHitNumber",
  NOR_TREATMENT = "GreenHpNumber",
  BUFF_HURT = "BuffHitNumber",
  ABSORB_HURT = "ShieldHitNumber",
  BLOCK_HURT = "BlockHitNumber",
  CRI_HURT = "CritHitNumber",
  BURST_NOR_HURT = "NormalHitNumber",
  BURST_NOR_TREATMENT = "GreenHpNumber",
  BURST_BUFF_HURT = "BuffHitNumber",
  BURST_ABSORB_HURT = "ShieldHitNumber",
  BURST_BLOCK_HURT = "BlockHitNumber",
  BURST_CRI_HURT = "CritHitNumber"
}
local BattleExpressionCom = {ANGRY = "Angry", SURPRISE = "Surprise"}
local battleHurtNumUrlList = {}
local buffWordUrl, talkWordUrl, smallSkillUrl, uniqueSkillUrl, burstSKillUrl, showNormalHurt

function BattleHurtNum.Init()
  BattleHurtNum.UpdateNormalHurtVisible()
  if nil == battlePopObjectPool then
    battlePopObjectPool = FairyGUI.GObjectPool(CS.Launch.Singleton.transform)
  end
  if nil == hudCom then
    hudCom = UIMgr:GetLayerRoot("Bottom")
  end
  for i, v in pairs(BattleHurtNumType) do
    local url = UIMgr:GetItemUrl("Battle", v)
    battleHurtNumUrlList[i] = url
  end
  buffWordUrl = UIMgr:GetItemUrl("Battle", "BuffWord")
  talkWordUrl = UIMgr:GetItemUrl("Battle", "Talk")
  smallSkillUrl = UIMgr:GetItemUrl("Battle", "SmallSkillTipsAni")
  uniqueSkillUrl = UIMgr:GetItemUrl("Battle", "UniqueSkillTipsAni")
  burstSKillUrl = UIMgr:GetItemUrl("Battle", "BurstUniqueSkillTipsAni")
end

function BattleHurtNum.UpdateNormalHurtVisible()
  showNormalHurt = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.NORMAL_HURT_NUMBER, PLAYER_PREF_DEFAULT_VALUE.NORMAL_HURT_NUMBER)
end

function BattleHurtNum.ClearPool()
  if battlePopObjectPool then
    battlePopObjectPool:Clear()
  end
  battlePopObjectPool = nil
end

local GetHurtNumRes = function(hurt_type)
  local url = battleHurtNumUrlList[hurt_type]
  local hurtObject = battlePopObjectPool:GetObject(url)
  local resName = BattleHurtNumComName[hurt_type]
  local text = hurtObject:GetChild(resName):GetChild("NumberTxt")
  return hurtObject, text
end

function BattleHurtNum.ShowHurtNum(hurt_type, num, bindObject, hurtExtraParams)
  if hurt_type == HURT_NUM_ENUM.MISS_HURT then
    BattleHurtNum.ShowBuffWord(BattleBuffWordType.MISS, bindObject)
    return
  elseif hurt_type == HURT_NUM_ENUM.INVINCIBLE then
    BattleHurtNum.ShowBuffWord(BattleBuffWordType.INVINCIBLE, bindObject)
    return
  elseif hurt_type == HURT_NUM_ENUM.IMMUNE then
    BattleHurtNum.ShowBuffWord(BattleBuffWordType.IMMUNE, bindObject)
    return
  end
  if hurtExtraParams and hurtExtraParams.alwaysShow == true then
  elseif 0 == showNormalHurt then
    if num >= 0 then
      return
    end
    if hurt_type == HURT_NUM_ENUM.CRI_HURT or hurt_type == HURT_NUM_ENUM.BLOCK_HURT then
    else
      return
    end
  end
  local pt = bindObject.UIPosition
  if nil == pt then
    return
  end
  local isBurstTime = BattleScene.IsBurstTime()
  if isBurstTime then
    hurt_type = BURST_HURT_NUM_ENUM[hurt_type]
  end
  local hurtObject, text
  hurtObject, text = GetHurtNumRes(hurt_type)
  if text then
    num = floor(math.abs(num))
    text.text = num
  end
  hurtObject:RemoveFromParent()
  hudCom:AddChild(hurtObject)
  table.insert(bindObject.cachedDisplayHurtTips, hurtObject)
  for i, v in ipairs(bindObject.cachedDisplayHurtTips) do
    v.y = v.y - v.height / 2
  end
  hurtObject:SetXY(floor(pt.x), floor(pt.y - 100))
  local trans
  if isBurstTime then
    if bindObject.camp == BATTLE_CAMP_FLAG.RIGHT then
      trans = hurtObject:GetTransition("RightIn")
    elseif bindObject.camp == BATTLE_CAMP_FLAG.LEFT then
      trans = hurtObject:GetTransition("LeftIn")
    elseif bindObject.camp == BATTLE_CAMP_FLAG.NEUTRAL then
      trans = hurtObject:GetTransition("in")
    end
    trans.timeScale = math.random(800, 1200) / 1000
  else
    trans = hurtObject:GetTransition("in")
  end
  if trans then
    trans:Play(function()
      if nil == battlePopObjectPool then
        if hurtObject then
          hurtObject:Dispose()
        end
        return
      end
      if hurtObject then
        battlePopObjectPool:ReturnObject(hurtObject)
        for i, v in ipairs(bindObject.cachedDisplayHurtTips) do
          if v == hurtObject then
            table.remove(bindObject.cachedDisplayHurtTips, i)
            return
          end
        end
      end
    end)
    trans.ignoreEngineTimeScale = false
  end
end

function BattleHurtNum.ShowBuffWord(path, bindObject)
  local pt = bindObject.UIPosition
  if nil == pt then
    return
  end
  local wordObject = battlePopObjectPool:GetObject(buffWordUrl)
  local wordUrl = UIUtil.GetResUrl(path)
  local battleWordLoader = wordObject:GetChild("BattleWordLoader")
  battleWordLoader.url = wordUrl
  wordObject:RemoveFromParent()
  hudCom:AddChild(wordObject)
  table.insert(bindObject.cachedDisplayHurtTips, wordObject)
  for i, v in ipairs(bindObject.cachedDisplayHurtTips) do
    v.y = v.y - v.height / 2
  end
  wordObject:SetXY(floor(pt.x), floor(pt.y - 100))
  local trans = wordObject:GetTransition("in")
  if trans then
    trans:Play(function()
      if nil == battlePopObjectPool then
        if wordObject then
          wordObject:Dispose()
        end
        return
      end
      if wordObject then
        battlePopObjectPool:ReturnObject(wordObject)
        for i, v in ipairs(bindObject.cachedDisplayHurtTips) do
          if v == wordObject then
            table.remove(bindObject.cachedDisplayHurtTips, i)
            return
          end
        end
      end
    end)
    trans.ignoreEngineTimeScale = false
  end
end

function BattleHurtNum.ShowPopWord(word, bindObject)
  if nil == bindObject then
    return
  end
  local pt = bindObject.UIPosition
  if nil == pt then
    return
  end
  local model = bindObject.model or bindObject.effectModel
  if nil == model or model.activeSelf == false then
    return
  end
  local wordObject = battlePopObjectPool:GetObject(talkWordUrl)
  local wordTxt = wordObject:GetChild("WordTxt")
  wordTxt.text = word
  wordObject:RemoveFromParent()
  hudCom:AddChild(wordObject)
  wordObject:SetXY(floor(pt.x), floor(pt.y - 100))
  local trans = wordObject:GetTransition("in")
  if trans then
    trans:Play(function()
      if nil == battlePopObjectPool then
        if wordObject then
          wordObject:Dispose()
        end
        return
      end
      if wordObject then
        battlePopObjectPool:ReturnObject(wordObject)
      end
    end)
    trans.ignoreEngineTimeScale = false
  end
end

function BattleHurtNum.ShowExpression(expressionType, bindObject, playTime)
  if nil == bindObject then
    return
  end
  local pt = bindObject.UIPosition
  if nil == pt then
    return
  end
  local model = bindObject.model or bindObject.effectModel
  if nil == model or model.activeSelf == false then
    return
  end
  local comName = BattleExpressionCom[expressionType]
  if nil == comName then
    return
  end
  local expression = battlePopObjectPool:GetObject(UIMgr:GetItemUrl("Battle", comName))
  expression:RemoveFromParent()
  hudCom:AddChild(expression)
  expression:SetXY(floor(pt.x), floor(pt.y - 100))
  PlayUITrans(expression, "in", function()
    if nil == battlePopObjectPool then
      if expression then
        expression:Dispose()
      end
      return
    end
    if expression then
      battlePopObjectPool:ReturnObject(expression)
    end
  end, 0, playTime or 1, nil, nil, false)
end

function BattleHurtNum.ShowBattleSkillTipsAni(bindObject, skillType, skillId, ignoreTimescale)
  if bindObject.isMonster or bindObject.isBuilding then
    return
  end
  local pt = bindObject.UIPosition
  if nil == pt then
    return
  end
  local url
  ignoreTimescale = ignoreTimescale or false
  if skillType == SKILL_TYPE_ENUM.SMALL then
    url = smallSkillUrl
  elseif skillType == SKILL_TYPE_ENUM.UNIQUE then
    url = uniqueSkillUrl
  elseif skillType == SKILL_TYPE_ENUM.BURST_CARD then
    url = burstSKillUrl
  else
    return
  end
  local skillConfig = TableData.GetConfig(skillId, "BaseSkill")
  if nil == skillConfig then
    return
  end
  local skillObject = battlePopObjectPool:GetObject(url)
  if nil ~= skillObject then
    skillObject:GetChild("SkillTips"):GetChild("WordTxt").text = skillConfig.name()
    skillObject:RemoveFromParent()
    hudCom:AddChild(skillObject)
    if skillType == SKILL_TYPE_ENUM.BURST_CARD then
      skillObject:SetXY(floor(pt.x), floor(pt.y))
    else
      skillObject:SetXY(floor(pt.x), floor(pt.y - 100))
    end
    if bindObject.camp == BATTLE_CAMP_FLAG.LEFT then
      PlayUITrans(skillObject, "Left", function()
        if nil == battlePopObjectPool then
          if skillObject then
            skillObject:Dispose()
          end
          return
        end
        if skillObject then
          battlePopObjectPool:ReturnObject(skillObject)
        end
      end, 0, 1, nil, nil, ignoreTimescale)
    elseif bindObject.camp == BATTLE_CAMP_FLAG.RIGHT then
      PlayUITrans(skillObject, "Right", function()
        if nil == battlePopObjectPool then
          if skillObject then
            skillObject:Dispose()
          end
          return
        end
        if skillObject then
          battlePopObjectPool:ReturnObject(skillObject)
        end
      end, 0, 1, nil, nil, ignoreTimescale)
    end
  end
end

function BattleHurtNum.SetGrayAll(isGray)
  local allCard = BattleScene.GetAllAliveUnit()
  for i, v in ipairs(allCard) do
    local list = v.cachedDisplayHurtTips
    if list and #list > 0 then
      for _, hurtObj in ipairs(list) do
        ChangeUIController(hurtObj, "color", isGray and 1 or 0)
      end
    end
  end
end

function BattleHurtNum.HideAll()
  local allCard = BattleScene.GetAllAliveUnit()
  for i, v in ipairs(allCard) do
    local list = v.cachedDisplayHurtTips
    if list and #list > 0 then
      for _, hurtObj in ipairs(list) do
        hurtObj:TweenFade(0, 0.2):SetIgnoreEngineTimeScale(true)
      end
    end
  end
end

function BattleHurtNum.ShowAll()
  local allCard = BattleScene.GetAllAliveUnit()
  for i, v in ipairs(allCard) do
    local list = v.cachedDisplayHurtTips
    if list and #list > 0 then
      for _, hurtObj in ipairs(list) do
        hurtObj:TweenFade(1, 0.2):SetIgnoreEngineTimeScale(true)
      end
    end
  end
end

function BattleHurtNum.ClearHurtNum()
  hudCom = nil
  showNormalHurt = nil
  buffWordUrl = nil
  talkWordUrl = nil
  smallSkillUrl = nil
  uniqueSkillUrl = nil
  battleHurtNumUrlList = {}
  BattleHurtNum.ClearPool()
end
