require("RaidBoss_ActionRecordWindowByName")
local RaidBossActionRecordWindow = {}
local uis, contentPane, uin, challenges, selfInfo, stageId, showCurDamage
local RefreshRecordsInfo = function(challenges)
  local maxRounds = 3
  if stageId then
    local conf = TableData.GetConfig(stageId, "BaseStage")
    if conf and conf.rounds then
      maxRounds = conf.rounds
    end
  end
  local list = uis.Main.ActionRecordTipsList.RewardTipsList
  
  function list.itemRenderer(i, gcmp)
    local recordIndex = i + 1
    local child = gcmp:GetChild("ActionRecordTips")
    child.alpha = 0
    PlayUITrans(gcmp, "up", nil)
    local rndText = T(20266, recordIndex)
    UIUtil.SetText(child, T(20300), "TipsTxt")
    UIUtil.SetText(child, rndText, "RoundTxt")
    if recordIndex <= maxRounds then
      local kvlist
      local hasRecord = recordIndex <= #challenges
      if hasRecord then
        local record = challenges[recordIndex]
        local score = record.score
        ChangeUIController(child, "c1", 0)
        local dmgText = T(20267, string.formatNum(score, 3))
        UIUtil.SetText(child, dmgText, "NumberTxt")
        local map = record.cardList
        kvlist = {}
        for k, v in pairs(map) do
          table.insert(kvlist, {cardId = k, fashionId = v})
        end
        table.sort(kvlist, function(x, y)
          local xConf = TableData.GetConfig(x.cardId, "BaseCard")
          local yConf = TableData.GetConfig(y.cardId, "BaseCard")
          return xConf.type > yConf.type
        end)
      else
        ChangeUIController(child, "c1", 1)
      end
      local headlist = child:GetChild("HeadList")
      
      function headlist.itemRenderer(j, subgcmp)
        if hasRecord and j + 1 <= #kvlist then
          ChangeUIController(subgcmp, "c1", 0)
          local item = kvlist[j + 1]
          local cardId = item.cardId
          local fashionId = item.fashionId
          local cardHeadBtn = subgcmp:GetChild("CardHeadBtn")
          local loader = cardHeadBtn:GetChild("CardPic"):GetChild("CardPicLoader")
          local occupation = cardHeadBtn:GetChild("Occupation")
          local elementList = cardHeadBtn:GetChild("ElementList")
          local cardConf = TableData.GetConfig(cardId, "BaseCard")
          UIUtil.SetHeadByFaceId(fashionId, loader, HEAD_ICON_TYPE_ENUM.RECT)
          UIUtil.SetText(cardHeadBtn, cardConf.name(), "NameTxt")
          ChangeUIController(occupation, "c1", cardConf.type - 1)
          ChangeUIController(cardHeadBtn, "c1", cardConf.star - 1)
          UIUtil.ShowElementList(elementList, cardConf)
          cardHeadBtn.alpha = 0
          PlayUITrans(subgcmp, "in", nil)
        else
          ChangeUIController(subgcmp, "c1", 1)
        end
      end
      
      headlist.numItems = 8
      ChangeUIController(child, "c2", 0)
    else
      ChangeUIController(child, "c2", 1)
    end
  end
  
  list.numItems = 3
end

function RaidBossActionRecordWindow.ReInitData()
end

function RaidBossActionRecordWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RaidBossActionRecordWindow.package, WinResConfig.RaidBossActionRecordWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uin = bridgeObj.argTable[1]
    challenges = bridgeObj.argTable[2]
    stageId = bridgeObj.argTable[3]
    showCurDamage = bridgeObj.argTable[4]
    uis = GetRaidBoss_ActionRecordWindowUis(contentPane)
    RaidBossActionRecordWindow.UpdateInfo()
    RaidBossActionRecordWindow.InitBtn()
  end)
end

function RaidBossActionRecordWindow.UpdateInfo()
  local titleText = T(20268)
  selfInfo = ActorData.GetUin() == uin
  local descText, scoreDiff
  if selfInfo then
    descText = T(20269)
    scoreDiff = RaidBossData.GetRaidBossData().highScoreDiff
  else
    local rankInfo = RaidBossData.GetPlayerRankInfo(uin)
    scoreDiff = rankInfo.scoreDiff
    descText = T(20318, rankInfo.name)
  end
  local rankTitleText = T(20278)
  uis.Main.ActionRecordTitle.TitleTxt.text = titleText
  uis.Main.ActionRecordTitle.WordTxt.text = descText
  uis.Main.NowRank.WordTxt.text = rankTitleText
  uis.Main.NowRank.c1Ctr.selectedIndex = selfInfo and 1 or 0
  local score = 0
  for i, v in pairs(challenges) do
    score = score + v.score
  end
  local scoreText
  if score > 0 then
    scoreText = string.formatNum(score, 3)
  else
    scoreText = T(20330)
  end
  local content
  if scoreDiff > 0 then
    local levelId = RaidBossData.GetLevelIdByDifficult(scoreDiff)
    local conf = TableData.GetConfig(levelId, "BaseStage")
    content = string.format("%s%s", T(20288), conf.name_detail())
  else
    content = T(20300)
  end
  uis.Main.NowRank.WordTxt.text = content
  if not selfInfo then
    uis.Main.NowRank.RankTxt.text = scoreText
  else
    local highScoreText
    local highScore = RaidBossData.GetRaidBossData().highScore
    if highScore > 0 then
      highScoreText = string.formatNum(highScore, 3)
    else
      highScoreText = T(20330)
    end
    uis.Main.NowRank.RankTxt.text = highScoreText
    uis.Main.NowRank.Word1Txt.text = T(20314)
    uis.Main.NowRank.Rank1Txt.text = scoreText
    uis.Main.NowRank.Word1Txt.visible = showCurDamage
    uis.Main.NowRank.Rank1Txt.visible = showCurDamage
    uis.Main.NowRank.root:GetChild("n33").visible = showCurDamage
  end
  if challenges then
    RefreshRecordsInfo(challenges)
  end
end

function RaidBossActionRecordWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RaidBossActionRecordWindow.name)
  end)
end

function RaidBossActionRecordWindow.OnClose()
  uis = nil
  contentPane = nil
  challenges = nil
end

function RaidBossActionRecordWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.RaidBossActionRecordWindow.REFRESH_RECORDS then
    RefreshRecordsInfo(para)
  end
end

return RaidBossActionRecordWindow
