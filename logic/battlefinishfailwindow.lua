require("BattleData_BattleFinishFailWindowByName")
local BattleFinishFailWindow = {}
local uis, contentPane

function BattleFinishFailWindow.ReInitData()
end

local challengeResult, curTypingEffect, curSoundEventIns
local expChangeTime = 1
local remove

function BattleFinishFailWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BattleFinishFailWindow.package, WinResConfig.BattleFinishFailWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    challengeResult = bridgeObj.argTable[1]
    BattleMgr.CloseBattle()
    uis = GetBattleData_BattleFinishFailWindowUis(contentPane)
    if challengeResult.battleData then
      if 0 == #challengeResult.battleData.unitDamage then
        uis.Main.TimeBtn.visible = false
        uis.Main.DataBtn.visible = false
      end
      if challengeResult.battleData.initData.quickBattle or challengeResult.battleData.initData.sceneType == ProtoEnum.SCENE_TYPE.ROGUE then
        uis.Main.c1Ctr.selectedIndex = 1
      end
    end
    BattleFinishFailWindow.UpdateInfo()
    BattleFinishFailWindow.InitBtn()
    BattleFinishFailWindow.UpdateCardVoice()
    contentPane.touchable = false
    TimerUtil.setTimeout(expChangeTime, function()
      if contentPane then
        contentPane.touchable = true
      end
    end)
  end)
end

function BattleFinishFailWindow.UpdateInfo()
  BattleFinishFailWindow.UpdateResult()
end

function BattleFinishFailWindow.UpdateResult()
  local stageConfig = TableData.GetConfig(challengeResult.stageId, "BaseStage")
  if stageConfig then
    if challengeResult.sceneType == ProtoEnum.SCENE_TYPE.EXPEDITION then
      uis.Main.TitleWord.NameTxt.text = stageConfig.name and stageConfig.name() or ""
    else
      uis.Main.TitleWord.NameTxt.text = stageConfig.name and T(889, stageConfig.name()) or ""
    end
  elseif challengeResult.sceneType == ProtoEnum.SCENE_TYPE.ARENA then
    uis.Main.TitleWord.NameTxt.text = TableData.GetConfig(10303, "BaseFeature").name()
  end
  SoundUtil.PlaySfx(40002)
  local loader = uis.Main.BackGround.BackGroundLoader
  uis.Main.TitleWord.WordFailTxt.text = T(10315)
  local featureConfig = TableData.GetConfig(20009, "BaseFeature")
  loader.url = UIUtil.GetResUrl(featureConfig.back_ground)
  local list = uis.Main.WordList
  local text_list = featureConfig.go_to_des
  for i, v in ipairs(text_list) do
    local textHand = list:AddItemFromPool()
    local arr = Split(v, ":")
    if 2 == #arr then
      textHand:GetChild("WordTxt").text = T(tonumber(arr[1]))
      local jumpId = tonumber(arr[2])
      if jumpId and 0 ~= jumpId then
        local featureData = TableData.GetConfig(jumpId, "BaseFeature")
        if featureData then
          ChangeUIController(textHand, "c1", 1)
          CurrencyReturnWindow.SetJumpFun(textHand, featureData)
        end
      else
        ChangeUIController(textHand, "c1", 0)
      end
    end
  end
end

function BattleFinishFailWindow.UpdateCardVoice()
  local config = TableData.GetConfig(70010028, "BaseFixed").int_value
  if 1 ~= config then
    return
  end
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
    curTypingEffect, curSoundEventIns = UIUtil.ShowTalkWord(fashionId, BUBBLE_TYPE_ENUM.LOSE, nil, true)
  end
end

function BattleFinishFailWindow.InitBtn()
  uis.Main.FailOutBtn.onClick:Set(BattleFinishFailWindow.CloseWindow)
  uis.Main.FailAgainBtn.onClick:Set(BattleFinishFailWindow.TryAgain)
  UIUtil.SetText(uis.Main.FailOutBtn, T(10324), "NameTxt")
  UIUtil.SetText(uis.Main.FailAgainBtn, T(10323), "NameTxt")
  uis.Main.DataBtn.onClick:Set(BattleFinishFailWindow.OpenDataWindow)
  uis.Main.TimeBtn.onClick:Set(BattleFinishFailWindow.OpenAxisWindow)
  UIUtil.SetText(uis.Main.TimeBtn, T(1167), "WordTxt")
  UIUtil.SetText(uis.Main.DataBtn, T(1168), "WordTxt")
end

function BattleFinishFailWindow.TryAgain()
  remove = true
  ld("Formation")
  FormationMgr.ReopenFormationWindow()
end

function BattleFinishFailWindow.CloseWindow()
  local closeFun = function()
    SoundUtil.PlayLastMusic()
    local unlocked = false
    if challengeResult and challengeResult.firstPass then
      unlocked = EnterClampUtil.CheckBackHome(challengeResult.stageId)
    end
    if unlocked then
      UIMgr:CloseToWindow(WinResConfig.HomeWindow.name)
    else
      UIMgr:CloseWindow(WinResConfig.BattleFinishFailWindow.name)
    end
    challengeResult = nil
  end
  local startQuitFun = function()
    closeFun()
  end
  startQuitFun()
end

function BattleFinishFailWindow.OpenDataWindow()
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

function BattleFinishFailWindow.OpenAxisWindow()
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

function BattleFinishFailWindow.UpdateAutoBtnText()
  if uis.Main.SetAutoBtn.selected then
    UIUtil.SetBtnText(uis.Main.SetAutoBtn, T(10307), T(10306))
  else
    UIUtil.SetBtnText(uis.Main.SetAutoBtn, T(10305), T(10306))
  end
end

function BattleFinishFailWindow.OnShown()
end

function BattleFinishFailWindow.OnHide()
end

function BattleFinishFailWindow.StopTalk()
  if curTypingEffect then
    curTypingEffect:Cancel()
    curTypingEffect = nil
  end
  if curSoundEventIns then
    SoundUtil.StopSoundEvent(curSoundEventIns)
    curTypingEffect = nil
  end
end

function BattleFinishFailWindow.OnClose()
  BattleData.Clear()
  BattleFinishFailWindow.StopTalk()
  uis = nil
  contentPane = nil
  if remove then
    UIMgr:RemoveWindowList(WinResConfig.BattleFinishFailWindow.name)
  end
  remove = nil
  BattleData.tempLevel = nil
end

function BattleFinishFailWindow.HandleMessage(msgId, para)
end

return BattleFinishFailWindow
