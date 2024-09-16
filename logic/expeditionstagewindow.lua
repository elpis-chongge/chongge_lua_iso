require("Expedition_ArrangeWindowByName")
local ExpeditionStageWindow = {}
local uis, contentPane, buffId, stageId, stageIndex

function ExpeditionStageWindow.ReInitData()
end

local jumpTb

function ExpeditionStageWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExpeditionStageWindow.package, WinResConfig.ExpeditionStageWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    buffId = bridgeObj.argTable[1]
    stageId = bridgeObj.argTable[2]
    stageIndex = bridgeObj.argTable[3]
    uis = GetExpedition_ArrangeWindowUis(contentPane)
    jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ExpeditionStageWindow.name, uis.Main.CurrencyReturn)
    ExpeditionStageWindow.UpdateInfo()
    ExpeditionStageWindow.InitBtn()
    ld("Formation")
    FormationService.GetStagePrepareInfoReq(ProtoEnum.SCENE_TYPE.EXPEDITION, stageId, function()
      if UIMgr:IsWindowOpen(WinResConfig.ExpeditionStageWindow.name) then
        local stageConfig = TableData.GetConfig(stageId, "BaseStage")
        local count, limit = UIUtil.SetExpeditionCardList(uis.Main.BattleWave1.CardList, nil, nil, stageConfig, 1)
        uis.Main.BattleWave1.NumberTxt.text = count > 0 and T(20242, count, limit) or T(20238, count, limit)
        count, limit = UIUtil.SetExpeditionCardList(uis.Main.BattleWave2.CardList, nil, nil, stageConfig, 2)
        uis.Main.BattleWave2.NumberTxt.text = count > 0 and T(20242, count, limit) or T(20238, count, limit)
      end
    end)
  end)
end

function ExpeditionStageWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(11704, "BaseFeature").back_ground)
  local buffDescPanel = uis.Main.ArrangeTips1
  local goalPanel = uis.Main.ArrangeTips2
  local firstFormationPanel = uis.Main.BattleWave1
  local secondFormationPanel = uis.Main.BattleWave2
  ChangeUIController(uis.Main.ArrangeLevel.root, "c1", stageIndex - 1)
  local buffConf = TableData.GetConfig(buffId, "BaseSkillBuffPre")
  local buffName = type(buffConf.name) == "function" and buffConf.name() or "未配置"
  local buffDesc = "function" == type(buffConf.des) and buffConf.des() or "未配置"
  buffDescPanel.NameTxt.text = buffName
  buffDescPanel.WordTxt.text = buffDesc
  local startBtnTitle = T(20235)
  UIUtil.SetBtnText(uis.Main.ArrangeStartBtn, startBtnTitle)
  local challenges = ExpeditionMgr.GetAchievedChallenges(stageId)
  local goalTitle = T(20234)
  UIUtil.SetText(goalPanel.Title.root, goalTitle)
  local goallist = goalPanel.TipsList
  goallist.defaultItem = "ui://sksayrjcu7ph31"
  
  function goallist.itemRenderer(i, gcmp)
    local challenge = challenges[i + 1]
    local name = challenge.name
    local achieved = challenge.achieved
    UIUtil.SetText(gcmp, name(), "WordTxtTxt")
    ChangeUIController(gcmp, "c1", achieved and 1 or 0)
  end
  
  goallist.numItems = #challenges
  firstFormationPanel.CardList.OffsetX = 40
  firstFormationPanel.CardList.lineCount = 2
  firstFormationPanel.WaveTxt.text = T(20236)
  secondFormationPanel.CardList.OffsetX = 40
  secondFormationPanel.CardList.lineCount = 2
  secondFormationPanel.WaveTxt.text = T(20237)
end

function ExpeditionStageWindow.InitBtn()
  uis.Main.ArrangeStartBtn.onClick:Set(function()
    ld("Formation")
    local param = {
      stageId = stageId,
      sceneType = ProtoEnum.SCENE_TYPE.EXPEDITION,
      backFunc = function()
        UIMgr:CloseWindow(WinResConfig.FormationWindow.name)
        ExpeditionMgr.restart_timeline_animator = false
      end,
      buffId = buffId
    }
    FormationMgr.TryOpenFormationWindow(param)
  end)
end

function ExpeditionStageWindow.OnClose()
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
  end
  jumpTb = nil
end

return ExpeditionStageWindow
