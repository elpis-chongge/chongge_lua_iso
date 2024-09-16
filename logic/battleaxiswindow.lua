require("BattleData_BattleAxisWindowByName")
local BattleAxisWindow = {}
local uis, contentPane, timelineCom, showBurstCardSkill, showSpecialSkill, showDeath, showManuallySkill, totalFrame, totalSecond
local UNIT_INTERVAL = 10
local UNIT_PIXEL = 720
local MIN_INTERVAL = 0.1
local MIN_FRAME_INTERVAL = BATTLE_CONFIG_ENUM.FIXED_FPS * MIN_INTERVAL
local PIXEL_PER_INTERVAL = MIN_INTERVAL * UNIT_PIXEL / UNIT_INTERVAL
local showRange = 1 / MIN_INTERVAL
local maxIndex, burstSkillInfoList, burstCardSkillInfoList, uniqueSkillInfoList, smallSkillInfoList, deathInfoList, manuallySkillInfoList, burstSkillList, burstCardSkillList, uniqueSkillList, smallSkillList, deathList, manuallySkillList, curChallengeStageRsp, challengeStageRspList, curIndex, isWin
local HEAD_TYPE = {
  UNIQUE = "UNIQUE",
  SPECIAL = "SPECIAL",
  DEATH = "DEATH",
  BURST_CARD = "BURST_CARD",
  MANUALLY_SKILL = "MANUALLY_SKILL"
}
local HEAD_STATE_TEXT_ID = {
  UNIQUE = 10700,
  SPECIAL = 10701,
  DEATH = 10703,
  MANUALLY_SKILL = 10702
}
local HEAD_STATE_COLOR_TEXT_ID = {
  UNIQUE = 10711,
  SPECIAL = 10710,
  DEATH = 10712,
  BURST_CARD = 10709,
  MANUALLY_SKILL = 10717
}
local MONSTER_HEAD_STATE_COLOR_TEXT_ID = {UNIQUE = 10714, SPECIAL = 10713}
local MONSTER_HEAD_STATE_INDEX_COLOR_TEXT_ID = {UNIQUE = 10716, SPECIAL = 10715}
local overlapHeadTips, skillTips, cachedIsMonsterList

function BattleAxisWindow.ReInitData()
end

local campTop, campDown

function BattleAxisWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BattleAxisWindow.package, WinResConfig.BattleAxisWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    local param = bridgeObj.argTable[1]
    showBurstCardSkill, showSpecialSkill, showDeath, showManuallySkill = true, true, true, true
    uis = GetBattleData_BattleAxisWindowUis(contentPane)
    if BattleData.isMirror then
      campTop = BATTLE_CAMP_FLAG.RIGHT
      campDown = BATTLE_CAMP_FLAG.LEFT
    else
      campTop = BATTLE_CAMP_FLAG.LEFT
      campDown = BATTLE_CAMP_FLAG.RIGHT
    end
    if #param > 1 then
      challengeStageRspList = param
      uis.Main.roundCtr.selectedIndex = 1
      BattleAxisWindow.CreateWaveList()
    else
      uis.Main.roundCtr.selectedIndex = 0
      curChallengeStageRsp = param[1]
      BattleAxisWindow.UpdateAll()
    end
  end)
end

function BattleAxisWindow.CreateWaveList()
  local list = uis.Main.RoundList
  list:RemoveChildrenToPool()
  
  function list.itemRenderer(index, item)
    item.data = index + 1
    if 0 == index then
      UIUtil.SetText(item, T(10325))
    else
      UIUtil.SetText(item, T(10326))
    end
    item.onClick:Add(BattleAxisWindow.ClickRoundBtn)
    if nil == curIndex then
      item:FireClick(true, true)
    end
  end
  
  list.numItems = #challengeStageRspList
end

function BattleAxisWindow.ClickRoundBtn(eventContext)
  local index = eventContext.sender.data
  if index ~= curIndex then
    curIndex = index
    BattleAxisWindow.UpdateAll(index)
  end
end

function BattleAxisWindow.UpdateBattleData(index)
  if index then
    curChallengeStageRsp = challengeStageRspList[index]
  end
  if curChallengeStageRsp.sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
    uis.Main.guildskillCtr.selectedIndex = 1
  else
    uis.Main.guildskillCtr.selectedIndex = 0
  end
end

function BattleAxisWindow.IsWin()
  if curChallengeStageRsp.sceneType == ProtoEnum.SCENE_TYPE.GUILD_WAR then
    return true
  end
  if BattleData.isMirror then
    return not curChallengeStageRsp.win
  else
    return curChallengeStageRsp.win
  end
end

function BattleAxisWindow.UpdateAll(index)
  burstSkillInfoList = {}
  burstCardSkillInfoList = {}
  uniqueSkillInfoList = {}
  smallSkillInfoList = {}
  manuallySkillInfoList = {}
  deathInfoList = {}
  BattleAxisWindow.UpdateBattleData(index)
  isWin = BattleAxisWindow.IsWin()
  BattleAxisWindow.InitTimelineData()
  BattleAxisWindow.InitComp()
  BattleAxisWindow.UpdateInfo()
  BattleAxisWindow.InitBtn()
  BattleAxisWindow.UpdateHeadVisible()
end

function BattleAxisWindow.InitTimelineData()
  totalFrame = curChallengeStageRsp.battleData.totalFrame
  maxIndex = math.ceil(totalFrame / MIN_FRAME_INTERVAL)
  local unitRecords = curChallengeStageRsp.battleData.unitRecords
  for _, v in ipairs(unitRecords) do
    if v.deadTime >= 0 then
      local index = math.ceil(v.deadTime / MIN_FRAME_INTERVAL)
      if nil == deathInfoList[index] then
        deathInfoList[index] = {}
      end
      table.insert(deathInfoList[index], {
        camp = v.camp,
        unitInfo = v.unitInfo,
        deadTime = v.deadTime
      })
    end
    local skillInfos = v.skillInfos
    for _, skillInfo in ipairs(skillInfos) do
      local index = math.ceil(skillInfo.frame / MIN_FRAME_INTERVAL)
      if v.camp == campDown then
        skillInfo.level = nil
      end
      if skillInfo.type == SKILL_TYPE_ENUM.SMALL then
        if nil == smallSkillInfoList[index] then
          smallSkillInfoList[index] = {}
        end
        table.insert(smallSkillInfoList[index], {
          camp = v.camp,
          unitInfo = v.unitInfo,
          skillInfo = skillInfo
        })
      elseif skillInfo.type == SKILL_TYPE_ENUM.UNIQUE then
        if nil == uniqueSkillInfoList[index] then
          uniqueSkillInfoList[index] = {}
        end
        table.insert(uniqueSkillInfoList[index], {
          camp = v.camp,
          unitInfo = v.unitInfo,
          skillInfo = skillInfo
        })
      elseif skillInfo.type == SKILL_TYPE_ENUM.BURST_CARD then
        if nil == burstCardSkillInfoList[index] then
          burstCardSkillInfoList[index] = {}
        end
        table.insert(burstCardSkillInfoList[index], {
          camp = v.camp,
          unitInfo = v.unitInfo,
          skillInfo = skillInfo
        })
      end
    end
  end
  local burstSkillInfos = curChallengeStageRsp.battleData.skillInfos
  for _, skillInfo in ipairs(burstSkillInfos) do
    local index = math.ceil(skillInfo.frame / MIN_FRAME_INTERVAL)
    if nil == burstSkillInfoList[index] then
      burstSkillInfoList[index] = {}
    end
    table.insert(burstSkillInfoList[index], {
      camp = skillInfo.camp,
      skillInfo = skillInfo
    })
  end
  local skillInfos = curChallengeStageRsp.battleData.manuallySkillInfos
  for i, v in ipairs(skillInfos) do
    local index = math.ceil(v.frame / MIN_FRAME_INTERVAL)
    if nil == manuallySkillInfoList[index] then
      manuallySkillInfoList[index] = {}
    end
    table.insert(manuallySkillInfoList[index], v)
  end
  showBurstCardSkill = 1 == PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.BATTLE_TIMELINE_BURST_CARD)
  showSpecialSkill = 1 == PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.BATTLE_TIMELINE_SPECIAL)
  showDeath = 1 == PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.BATTLE_TIMELINE_DEATH)
  showManuallySkill = 1 == PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.BATTLE_TIMELINE_MANUALLY_SKILL)
end

function BattleAxisWindow.InitComp()
  if timelineCom then
    uis.Main.ScaleList:RemoveChildAt(0, true)
    timelineCom = nil
  end
  if nil == timelineCom then
    timelineCom = UIMgr:CreateComponent("BattleData", "Scale")
    timelineCom.height = uis.Main.ScaleList.height
    uis.Main.ScaleList:AddChild(timelineCom)
    totalSecond = math.ceil(totalFrame / BATTLE_CONFIG_ENUM.FIXED_FPS)
    timelineCom.width = UNIT_PIXEL * totalSecond / UNIT_INTERVAL
    local pot
    for i = 0, totalSecond do
      if 0 == i % UNIT_INTERVAL or i == totalSecond then
        pot = UIMgr:CreateObject("BattleData", "Spot")
        timelineCom:AddChild(pot)
        if 0 == i % UNIT_INTERVAL then
          pot:SetXY(math.floor(i / UNIT_INTERVAL) * UNIT_PIXEL, timelineCom.height / 2)
        elseif i == totalSecond then
          pot:SetXY(math.floor(i / UNIT_INTERVAL) * UNIT_PIXEL + totalSecond % UNIT_INTERVAL / UNIT_INTERVAL * UNIT_PIXEL, timelineCom.height / 2)
        end
      end
    end
  end
  local loader = uis.Main.BackGround.BackGroundLoader
  if isWin then
    uis.Main.c1Ctr.selectedIndex = 0
    uis.Main.NameWinTxt.text = T(10016)
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
    uis.Main.c1Ctr.selectedIndex = 1
    uis.Main.NameFailTxt.text = failText
    loader.url = url
  end
  uis.Main.AxisOwnTile.TitleTxt.text = T(10012)
  uis.Main.AxisEnemyTile.TitleTxt.text = T(10013)
  uis.Main.BattleTime.TimeTxt.text = T(10705, TimeUtil.GetTimeStr(totalSecond))
  UIUtil.SetBtnText(uis.Main.Switch1Btn, T(HEAD_STATE_TEXT_ID.UNIQUE))
  UIUtil.SetBtnText(uis.Main.Switch2Btn, T(HEAD_STATE_TEXT_ID.SPECIAL))
  UIUtil.SetBtnText(uis.Main.Switch4Btn, T(HEAD_STATE_TEXT_ID.DEATH))
  UIUtil.SetBtnText(uis.Main.Switch5Btn, T(HEAD_STATE_TEXT_ID.MANUALLY_SKILL))
end

function BattleAxisWindow.UpdateInfo()
  BattleAxisWindow.CreateBurst()
  BattleAxisWindow.CreateBurstCardSkill()
  BattleAxisWindow.CreateDeathSkill()
  BattleAxisWindow.CreateSmallSkill()
  BattleAxisWindow.CreateUniqueSkill()
  BattleAxisWindow.CreateManuallySkill()
end

function BattleAxisWindow.CreateHand(camp, index, headType)
  local hand
  if camp == campTop then
    hand = UIMgr:CreateObject("BattleData", "OwnPlayer")
  else
    hand = UIMgr:CreateObject("BattleData", "EnemyPlayer")
  end
  timelineCom:AddChild(hand)
  hand:SetXY(index * PIXEL_PER_INTERVAL, timelineCom.height / 2)
  hand:GetChild("TimeTxt").text = T(10704, FormatValidateNum(index * MIN_INTERVAL))
  local headCom = hand:GetChild("AxisHead")
  headCom.onClick:Set(function()
    BattleAxisWindow.ClickHand(camp, index, headType)
  end)
  return hand
end

function BattleAxisWindow.CreateHead(camp, leftCom, rightCom, unitInfo, manuallySkillInfo, stateTxt)
  local head = UIMgr:CreateObject("BattleData", "AxisHead")
  if camp == campTop then
    local childrenCount = leftCom.numChildren
    leftCom:AddChild(head)
    head:SetXY(childrenCount, childrenCount)
  else
    local childrenCount = rightCom.numChildren
    rightCom:AddChild(head)
    head:SetXY(childrenCount, childrenCount)
  end
  BattleAxisWindow.UpdateHead(head, unitInfo, manuallySkillInfo, stateTxt, false)
end

function BattleAxisWindow.UpdateHead(head, unitInfo, manuallySkillInfo, stateTxt, touchable)
  if unitInfo then
    local id = unitInfo.unitInfo.id
    local cardConfig, isMonster, isBuilding = CardData.GetBaseConfig(id)
    if isBuilding then
      ChangeUIController(head, "c1", 1)
      UIUtil.ShowBuildingHeadBtn(id, head:GetChild("BuildHeadBtn"))
    else
      ChangeUIController(head, "c1", 0)
      UIUtil.ShowHeadBtn(id, head:GetChild("HeadBtn"), unitInfo.unitInfo, nil, HEAD_ICON_TYPE_ENUM.RECT)
    end
    if unitInfo.deadTime then
      ChangeUIController(head, "c2", 1)
      head.touchable = false
    else
      ChangeUIController(head, "c2", 0)
      if touchable then
        head.touchable = true
        head.onClick:Set(function()
          local skillId, skillLevel = unitInfo.skillInfo.id, unitInfo.skillInfo.level
          if isMonster or isBuilding then
            skillLevel = nil
          end
          BattleAxisWindow.ShowSkillTips(skillId, skillLevel)
        end)
      else
        head.touchable = false
      end
    end
  elseif manuallySkillInfo then
    local skillConfig = TableData.GetConfig(manuallySkillInfo.skillId, "BaseSkill")
    ChangeUIController(head, "c1", 2)
    ChangeUIController(head, "c2", 0)
    local skill = head:GetChild("GuildSkillBtn"):GetChild("GuildSkill")
    skill:GetChild("PicLoader").url = UIUtil.GetResUrl(skillConfig.icon)
    if touchable then
      head.touchable = true
      head.onClick:Set(function()
        BattleAxisWindow.ShowSkillTips(manuallySkillInfo.skillId, manuallySkillInfo.skillLevel)
      end)
    else
      head.touchable = false
    end
  end
  local stateWord = head:GetChild("StateType"):GetChild("WordTxt")
  stateWord.text = stateTxt
end

function BattleAxisWindow.CreateBurst()
  burstSkillList = {}
  local hand
  for i = 0, maxIndex do
    local infos = burstSkillInfoList[i]
    if infos then
      for _, v in ipairs(infos) do
        if v.camp == campTop or v.camp == campDown then
          if v.camp == campTop then
            hand = UIMgr:CreateObject("BattleData", "OwnBurstBottom")
          else
            hand = UIMgr:CreateObject("BattleData", "EnemyBurstBottom")
          end
          timelineCom:AddChildAt(hand, 0)
          hand:SetXY(i * PIXEL_PER_INTERVAL, timelineCom.height / 2)
          hand:GetChild("BurstSign"):GetChild("TimeTxt").text = T(10704, FormatValidateNum(i * MIN_INTERVAL))
          local burstConfig = TableData.GetConfig(v.skillInfo.burstId, "BaseBurst")
          local lastTime = burstConfig.energy_cycle * BATTLE_CONFIG_ENUM.FIXED_FPS
          lastTime = math.min(lastTime, curChallengeStageRsp.battleData.totalFrame - v.skillInfo.frame)
          local width = lastTime * PIXEL_PER_INTERVAL / MIN_FRAME_INTERVAL
          hand.width = width
          table.insert(burstSkillList, hand)
        end
      end
    end
  end
end

function BattleAxisWindow.CreateManuallySkill()
  manuallySkillList = {}
  local hand
  for i = 0, maxIndex do
    local infos = manuallySkillInfoList[i]
    if infos then
      local leftHand, rightHand, leftAxisHead, rightAxisHead
      for _, v in ipairs(infos) do
        if v.camp == campTop and nil == leftHand or v.camp == campDown and nil == rightHand then
          hand = BattleAxisWindow.CreateHand(v.camp, i, HEAD_TYPE.MANUALLY_SKILL)
          ChangeUIController(hand, "c1", 0)
          table.insert(manuallySkillList, hand)
          if v.camp == campTop and nil == leftAxisHead then
            leftHand = hand
            leftAxisHead = hand:GetChild("AxisHead")
          elseif v.camp == campDown and nil == rightAxisHead then
            rightHand = hand
            rightAxisHead = hand:GetChild("AxisHead")
          end
        end
        BattleAxisWindow.CreateHead(v.camp, leftAxisHead, rightAxisHead, nil, v, T(HEAD_STATE_COLOR_TEXT_ID.MANUALLY_SKILL))
      end
    end
  end
end

function BattleAxisWindow.CreateUniqueSkill()
  uniqueSkillList = {}
  local hand
  for i = 0, maxIndex do
    local infos = uniqueSkillInfoList[i]
    if infos then
      local leftHand, rightHand, leftAxisHead, rightAxisHead
      for _, v in ipairs(infos) do
        if v.camp == campTop and nil == leftHand or v.camp == campDown and nil == rightHand then
          hand = BattleAxisWindow.CreateHand(v.camp, i, HEAD_TYPE.UNIQUE)
          ChangeUIController(hand, "c1", 1)
          table.insert(uniqueSkillList, hand)
          if v.camp == campTop and nil == leftAxisHead then
            leftHand = hand
            leftAxisHead = hand:GetChild("AxisHead")
          elseif v.camp == campDown and nil == rightAxisHead then
            rightHand = hand
            rightAxisHead = hand:GetChild("AxisHead")
          end
        end
        if BattleAxisWindow.IsMonster(v.unitInfo.id) then
          local skillId
          if v.skillId then
            skillId = v.skillId
          else
            skillId = v.skillInfo.id
          end
          local skillConfig = TableData.GetConfig(skillId, "BaseSkill")
          if skillConfig.rome_index then
            BattleAxisWindow.CreateHead(v.camp, leftAxisHead, rightAxisHead, v, nil, T(MONSTER_HEAD_STATE_INDEX_COLOR_TEXT_ID.UNIQUE, NumberUtil.IntToRome(skillConfig.rome_index)))
          else
            BattleAxisWindow.CreateHead(v.camp, leftAxisHead, rightAxisHead, v, nil, T(MONSTER_HEAD_STATE_COLOR_TEXT_ID.UNIQUE))
          end
        else
          BattleAxisWindow.CreateHead(v.camp, leftAxisHead, rightAxisHead, v, nil, T(HEAD_STATE_COLOR_TEXT_ID.UNIQUE))
        end
      end
    end
  end
end

function BattleAxisWindow.CreateBurstCardSkill()
  burstCardSkillList = {}
  local hand
  for i = 0, maxIndex do
    local infos = burstCardSkillInfoList[i]
    if infos then
      local leftHand, rightHand, leftAxisHead, rightAxisHead
      for _, v in ipairs(infos) do
        if v.camp == campTop and nil == leftHand or v.camp == campDown and nil == rightHand then
          hand = BattleAxisWindow.CreateHand(v.camp, i, HEAD_TYPE.BURST_CARD)
          ChangeUIController(hand, "c1", 1)
          table.insert(burstCardSkillList, hand)
          if v.camp == campTop and nil == leftAxisHead then
            leftHand = hand
            leftAxisHead = hand:GetChild("AxisHead")
          elseif v.camp == campDown and nil == rightAxisHead then
            rightHand = hand
            rightAxisHead = hand:GetChild("AxisHead")
          end
        end
        BattleAxisWindow.CreateHead(v.camp, leftAxisHead, rightAxisHead, v, nil, T(HEAD_STATE_COLOR_TEXT_ID.BURST_CARD))
      end
    end
  end
end

function BattleAxisWindow.CreateSmallSkill()
  smallSkillList = {}
  local hand
  for i = 0, maxIndex do
    local infos = smallSkillInfoList[i]
    if infos then
      local leftHand, rightHand, leftAxisHead, rightAxisHead
      for _, v in ipairs(infos) do
        if v.camp == campTop and nil == leftHand or v.camp == campDown and nil == rightHand then
          hand = BattleAxisWindow.CreateHand(v.camp, i, HEAD_TYPE.SPECIAL)
          ChangeUIController(hand, "c1", 2)
          if BattleAxisWindow.IsMonster(v.unitInfo.id) == false then
            table.insert(smallSkillList, hand)
          end
          if v.camp == campTop and nil == leftAxisHead then
            leftHand = hand
            leftAxisHead = hand:GetChild("AxisHead")
          elseif v.camp == campDown and nil == rightAxisHead then
            rightHand = hand
            rightAxisHead = hand:GetChild("AxisHead")
          end
        end
        if BattleAxisWindow.IsMonster(v.unitInfo.id) then
          local skillId
          if v.skillId then
            skillId = v.skillId
          else
            skillId = v.skillInfo.id
          end
          local skillConfig = TableData.GetConfig(skillId, "BaseSkill")
          if skillConfig.rome_index then
            BattleAxisWindow.CreateHead(v.camp, leftAxisHead, rightAxisHead, v, nil, T(MONSTER_HEAD_STATE_INDEX_COLOR_TEXT_ID.SPECIAL, NumberUtil.IntToRome(skillConfig.rome_index)))
          else
            BattleAxisWindow.CreateHead(v.camp, leftAxisHead, rightAxisHead, v, nil, T(MONSTER_HEAD_STATE_COLOR_TEXT_ID.SPECIAL))
          end
        else
          BattleAxisWindow.CreateHead(v.camp, leftAxisHead, rightAxisHead, v, nil, T(HEAD_STATE_COLOR_TEXT_ID.SPECIAL))
        end
      end
    end
  end
end

function BattleAxisWindow.CreateDeathSkill()
  deathList = {}
  local hand
  for i = 0, maxIndex do
    local infos = deathInfoList[i]
    if infos then
      local leftHand, rightHand, leftAxisHead, rightAxisHead
      for _, v in ipairs(infos) do
        if v.camp == campTop and nil == leftHand or v.camp == campDown and nil == rightHand then
          hand = BattleAxisWindow.CreateHand(v.camp, i, HEAD_TYPE.DEATH)
          ChangeUIController(hand, "c1", 3)
          if BattleAxisWindow.IsMonster(v.unitInfo.id) == false then
            table.insert(deathList, hand)
          end
          if v.camp == campTop and nil == leftAxisHead then
            leftHand = hand
            leftAxisHead = hand:GetChild("AxisHead")
          elseif v.camp == campDown and nil == rightAxisHead then
            rightHand = hand
            rightAxisHead = hand:GetChild("AxisHead")
          end
        end
        BattleAxisWindow.CreateHead(v.camp, leftAxisHead, rightAxisHead, v, nil, T(HEAD_STATE_COLOR_TEXT_ID.DEATH))
      end
    end
  end
end

function BattleAxisWindow.UpdateHeadVisible()
  for _, v in ipairs(burstCardSkillList) do
    v.visible = showBurstCardSkill
  end
  for _, v in ipairs(burstSkillList) do
    v.visible = showBurstCardSkill
  end
  for _, v in ipairs(smallSkillList) do
    v.visible = showSpecialSkill
  end
  for _, v in ipairs(deathList) do
    v.visible = showDeath
  end
  for _, v in ipairs(manuallySkillList) do
    v.visible = showManuallySkill
  end
end

function BattleAxisWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.BattleAxisWindow.name)
  end)
  uis.Main.Switch1Btn.onClick:Add(BattleAxisWindow.ClickUniqueSkillBtn)
  uis.Main.Switch1Btn.selected = not showBurstCardSkill
  uis.Main.Switch2Btn.onClick:Add(BattleAxisWindow.ClickSpecialSkillBtn)
  uis.Main.Switch2Btn.selected = not showSpecialSkill
  uis.Main.Switch5Btn.onClick:Add(BattleAxisWindow.ClickManuallySkillBtn)
  uis.Main.Switch5Btn.selected = not showManuallySkill
  uis.Main.Switch4Btn.onClick:Add(BattleAxisWindow.ClickDeathBtn)
  uis.Main.Switch4Btn.selected = not showDeath
end

function BattleAxisWindow.ClickUniqueSkillBtn()
  showBurstCardSkill = not showBurstCardSkill
  PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.BATTLE_TIMELINE_BURST_CARD, showBurstCardSkill and 1 or 0)
  BattleAxisWindow.UpdateHeadVisible()
end

function BattleAxisWindow.ClickSpecialSkillBtn()
  showSpecialSkill = not showSpecialSkill
  PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.BATTLE_TIMELINE_SPECIAL, showSpecialSkill and 1 or 0)
  BattleAxisWindow.UpdateHeadVisible()
end

function BattleAxisWindow.ClickDeathBtn()
  showDeath = not showDeath
  PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.BATTLE_TIMELINE_DEATH, showDeath and 1 or 0)
  BattleAxisWindow.UpdateHeadVisible()
end

function BattleAxisWindow.ClickManuallySkillBtn()
  showManuallySkill = not showManuallySkill
  PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.BATTLE_TIMELINE_MANUALLY_SKILL, showManuallySkill and 1 or 0)
  BattleAxisWindow.UpdateHeadVisible()
end

function BattleAxisWindow.ClickHand(camp, index, headType)
  local headDataList = BattleAxisWindow.GetShowHeadDataList(camp, index, headType)
  if 1 == #headDataList then
    if headType == HEAD_TYPE.DEATH then
      return
    end
    local data = headDataList[1]
    local skillId, skillLevel
    if data.skillId then
      skillId = data.skillId
    else
      skillId = data.skillInfo.id
      skillLevel = data.skillInfo.level
    end
    BattleAxisWindow.ShowSkillTips(skillId, skillLevel)
    return
  end
  if nil == overlapHeadTips then
    overlapHeadTips = UIMgr:CreateComponent("BattleData", "OverlapHeadTips")
    contentPane:AddChild(overlapHeadTips)
    overlapHeadTips:Center()
    overlapHeadTips:GetChild("TouchScreenBtn").onClick:Add(BattleAxisWindow.CloseHeadTips)
  else
    contentPane:SetChildIndex(overlapHeadTips, contentPane.numChildren - 1)
    overlapHeadTips.visible = true
  end
  local headList = overlapHeadTips:GetChild("HeadList")
  headList:RemoveChildrenToPool()
  local width, height
  for i, v in ipairs(headDataList) do
    local head = headList:AddItemFromPool()
    width = head.width
    height = head.height
    if headType == HEAD_TYPE.MANUALLY_SKILL then
      BattleAxisWindow.UpdateHead(head:GetChild("AxisHead"), nil, v, T(HEAD_STATE_COLOR_TEXT_ID[headType]), true)
    else
      BattleAxisWindow.UpdateHead(head:GetChild("AxisHead"), v, nil, T(HEAD_STATE_COLOR_TEXT_ID[headType]), true)
    end
    head:GetChild("TimeTxt").text = T(10704, FormatValidateNum(math.ceil((not v.deadTime and not v.frame and v.skillInfo and v.skillInfo.frame) / MIN_FRAME_INTERVAL) * MIN_INTERVAL))
  end
  local columnNumber = headList.numItems >= headList.columnCount and headList.columnCount or headList.numItems % headList.columnCount
  local lineNumber = math.ceil(headList.numItems / headList.columnCount)
  width = width * columnNumber + (columnNumber - 1) * headList.columnGap
  height = height * lineNumber + (lineNumber - 1) * headList.lineGap
  headList:SetSize(width, height)
  overlapHeadTips:Center()
end

function BattleAxisWindow.ShowSkillTips(skillId, skillLevel)
  local skillConfig = TableData.GetConfig(skillId, "BaseSkill")
  if nil == skillTips then
    skillTips = UIMgr:CreateComponent("BattleData", "BattleSkillTips")
    contentPane:AddChild(skillTips)
    skillTips:Center()
    skillTips:GetChild("TouchScreenBtn").onClick:Add(BattleAxisWindow.CloseSkillTips)
  else
    contentPane:SetChildIndex(skillTips, contentPane.numChildren - 1)
    skillTips.visible = true
  end
  if skillConfig.name then
    ChangeUIController(skillTips, "c1", 0)
    skillTips:GetChild("NameTxt").text = skillConfig.name()
  else
    ChangeUIController(skillTips, "c1", 1)
  end
  if skillLevel then
    ChangeUIController(skillTips, "c2", 0)
    local levelTxt = skillTips:GetChild("LevelTxt")
    levelTxt.text = T(244, skillLevel)
  else
    ChangeUIController(skillTips, "c2", 1)
  end
  local list = skillTips:GetChild("UnitList")
  list:RemoveChildrenToPool()
  local skill = list:AddItemFromPool()
  local levelData = TableData.GetConfig(skillConfig.id * 1000 + (skillLevel or 1), "BaseSkillLevelUp")
  if levelData then
    skill:GetChild("WordTxt").text = levelData.des()
  end
end

function BattleAxisWindow.IsMonster(id)
  if nil == cachedIsMonsterList then
    cachedIsMonsterList = {}
  end
  if nil ~= cachedIsMonsterList[id] then
    return cachedIsMonsterList[id]
  end
  local config, isMonster = CardData.GetBaseConfig(id)
  cachedIsMonsterList[id] = isMonster
  return isMonster
end

function BattleAxisWindow.CloseSkillTips()
  if skillTips then
    skillTips.visible = false
  end
end

function BattleAxisWindow.GetShowHeadDataList(camp, index, headType)
  local dataList = {}
  local list
  if headType == HEAD_TYPE.UNIQUE then
    list = uniqueSkillInfoList
  elseif headType == HEAD_TYPE.BURST_CARD then
    list = burstCardSkillInfoList
  elseif headType == HEAD_TYPE.SPECIAL then
    list = smallSkillInfoList
  elseif headType == HEAD_TYPE.DEATH then
    list = deathInfoList
  elseif headType == HEAD_TYPE.MANUALLY_SKILL then
    list = manuallySkillInfoList
  end
  for i = index - showRange, index + showRange do
    local infos = list[i]
    if infos then
      for _, v in ipairs(infos) do
        if camp == v.camp then
          table.insert(dataList, v)
        end
      end
    end
  end
  return dataList
end

function BattleAxisWindow.CloseHeadTips()
  if overlapHeadTips then
    overlapHeadTips.visible = false
  end
end

function BattleAxisWindow.OnShown()
end

function BattleAxisWindow.OnHide()
end

function BattleAxisWindow.OnClose()
  uis = nil
  contentPane = nil
  showBurstCardSkill, showSpecialSkill, showDeath, showManuallySkill = nil, nil, nil, nil
  timelineCom = nil
  totalFrame = nil
  curChallengeStageRsp = nil
  challengeStageRspList = nil
  curIndex = nil
  overlapHeadTips = nil
  skillTips = nil
  burstSkillList = nil
  burstCardSkillList = nil
  uniqueSkillList = nil
  smallSkillList = nil
  manuallySkillList = nil
  deathList = nil
  burstSkillInfoList = nil
  burstCardSkillInfoList = nil
  uniqueSkillInfoList = nil
  smallSkillInfoList = nil
  manuallySkillInfoList = nil
  deathInfoList = nil
  cachedIsMonsterList = nil
end

function BattleAxisWindow.HandleMessage(msgId, para)
end

return BattleAxisWindow
