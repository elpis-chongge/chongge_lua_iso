require("GuildBoss_RecommendWindowByName")
local GuildWarRecommendWindow = {}
local uis, contentPane
local filterCardIdList = {}
local stageId

function GuildWarRecommendWindow.ReInitData()
end

function GuildWarRecommendWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildWarRecommendWindow.package, WinResConfig.GuildWarRecommendWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_RecommendWindowUis(contentPane)
    stageId = bridgeObj.argTable[1]
    uis.Main.TipsList:SetVirtual()
    GuildWarRecommendWindow.UpdateInfo()
    GuildWarRecommendWindow.InitBtn()
  end)
end

function GuildWarRecommendWindow.GetFilterFormations()
  local formations = GuildWarData.GetRecommendFormations()
  if nil == filterCardIdList or 0 == #filterCardIdList then
    return formations
  end
  local filterFormations = {}
  for _, v in ipairs(formations) do
    local cardList = v.cardInfos
    local find = false
    for _, cardInfo in ipairs(cardList) do
      if table.contain(filterCardIdList, cardInfo.cardId) == true then
        find = true
        break
      end
    end
    if false == find then
      table.insert(filterFormations, v)
    end
  end
  return filterFormations
end

function GuildWarRecommendWindow.UpdateInfo()
  local formations = GuildWarRecommendWindow.GetFilterFormations()
  if formations and #formations > 0 then
    table.sort(formations, function(a, b)
      if a.damageHp ~= b.damageHp then
        return a.damageHp > b.damageHp
      else
        return a.battleTime < b.battleTime
      end
    end)
    uis.Main.c1Ctr.selectedIndex = 0
    GuildWarRecommendWindow.UpdateList(formations)
  else
    uis.Main.c1Ctr.selectedIndex = 1
    uis.Main.Nothing.WordTxt.text = T(11710)
  end
  UIUtil.SetBtnText(uis.Main.ScreenBtn, T(11719))
end

function GuildWarRecommendWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuildWarRecommendWindow.name)
  end)
  uis.Main.ScreenBtn.onClick:Set(function()
    OpenWindow(WinResConfig.GuildWarRecommendScreenWindow.name, nil, filterCardIdList)
  end)
end

function GuildWarRecommendWindow.UpdateList(formations)
  local list = uis.Main.TipsList
  
  function list.itemRenderer(index, tips)
    local formation = formations[index + 1]
    local item = tips:GetChild("Tips")
    item:GetChild("NameTxt").text = formation.fighterName
    item:GetChild("TimeTxt").text = T(11732, TimeUtil.GetTimeStr(formation.battleTime))
    item:GetChild("Integral"):GetChild("WordTxt").text = T(11711)
    item:GetChild("Integral"):GetChild("NumberTxt").text = string.formatNum(formation.damageHp, 3)
    local headList = item:GetChild("HeadList")
    local cardList = GuildWarRecommendWindow.GetCardList(formation)
    
    function headList.itemRenderer(headIndex, headItem)
      local card = cardList[headIndex + 1]
      if card then
        ChangeUIController(headItem, "c1", 0)
        local cardId = card.cardId
        local cardHeadBtn = headItem:GetChild("CardHeadBtn")
        UIUtil.ShowCardTips(card, cardHeadBtn, nil, nil, HEAD_ICON_TYPE_ENUM.RECT)
        local configData = TableData.GetConfig(cardId, "BaseCard")
        ChangeUIController(cardHeadBtn, "c1", configData.star - 1)
        local state = GuildWarData.GetCardState(cardId)
        if state == GUILD_WAR_CARD_STATE.NOT_OBTAINED then
          ChangeUIController(cardHeadBtn, "c2", 1)
          cardHeadBtn:GetChild("State"):GetChild("WordTxt").text = T(11717)
        elseif state == GUILD_WAR_CARD_STATE.USED_TODAY then
          ChangeUIController(cardHeadBtn, "c2", 1)
          cardHeadBtn:GetChild("State"):GetChild("WordTxt").text = T(11718)
        elseif state == GUILD_WAR_CARD_STATE.NORMAL then
          ChangeUIController(cardHeadBtn, "c2", 0)
        end
      else
        ChangeUIController(headItem, "c1", 1)
      end
    end
    
    headList.numItems = 8
    local skillList = item:GetChild("SkillList")
    local skillLevels = formation.skillLevels or {}
    
    function skillList.itemRenderer(_index, _item)
      local skill = skillLevels[_index + 1]
      if skill then
        ChangeUIController(_item, "c1", 1)
        local skillConfig = TableData.GetConfig(skill.skillId, "BaseSkill")
        _item:GetChild("PicLoader").url = UIUtil.GetResUrl(skillConfig.icon)
        _item:GetChild("LevelTxt").text = T(244, skill.level or 1)
      else
        ChangeUIController(_item, "c1", 0)
      end
    end
    
    skillList.numItems = 3
    local battleUid = formation.battleUid
    local timeAxisBtn = item:GetChild("TimeAxisBtn")
    timeAxisBtn.onClick:Set(function()
      local cachedRecord = GuildWarData.GetCachedBattleDetailRecord(battleUid)
      if cachedRecord then
        ld("Battle", function()
          OpenWindow(WinResConfig.BattleAxisWindow.name, nil, {cachedRecord})
        end)
      else
        ld("Battle", function()
          BattleService.GetBattleRecordReq(battleUid, function(msg)
            GuildWarData.SetCachedBattleDetailRecord(msg)
            local record = GuildWarData.GetCachedBattleDetailRecord(msg.record.battleUid)
            if record then
              ld("Battle", function()
                OpenWindow(WinResConfig.BattleAxisWindow.name, nil, {record})
              end)
            end
          end)
        end)
      end
    end)
    local dataBtn = item:GetChild("DataBtn")
    dataBtn.onClick:Set(function()
      local cachedRecord = GuildWarData.GetCachedBattleDetailRecord(battleUid)
      if cachedRecord then
        ld("Battle", function()
          OpenWindow(WinResConfig.BattleDataWindow.name, nil, {cachedRecord})
        end)
      else
        ld("Battle", function()
          BattleService.GetBattleRecordReq(battleUid, function(msg)
            GuildWarData.SetCachedBattleDetailRecord(msg)
            local record = GuildWarData.GetCachedBattleDetailRecord(msg.record.battleUid)
            if record then
              ld("Battle", function()
                OpenWindow(WinResConfig.BattleDataWindow.name, nil, {record})
              end)
            end
          end)
        end)
      end
    end)
    local playbackBtn = item:GetChild("PlayBackBtn")
    playbackBtn.onClick:Set(function()
      local cachedRecord = GuildWarData.GetCachedBattleDetailRecord(battleUid)
      if cachedRecord then
        ld("Battle", function()
          GuildWarData.SaveChallengeStageRsp(cachedRecord)
          BattleMgr.InitBattle(cachedRecord.battleData, nil, true)
        end)
      else
        ld("Battle", function()
          BattleService.GetBattleRecordReq(battleUid, function(msg)
            GuildWarData.SetCachedBattleDetailRecord(msg)
            local record = GuildWarData.GetCachedBattleDetailRecord(msg.record.battleUid)
            if record then
              ld("Battle", function()
                GuildWarData.SaveChallengeStageRsp(record)
                BattleMgr.InitBattle(record.battleData, nil, true)
              end)
            end
          end)
        end)
      end
    end)
    local useBtn = item:GetChild("UseBtn")
    UIUtil.SetBtnText(useBtn, T(11712))
    useBtn.onClick:Set(function()
      GuildWarRecommendWindow.TouchUseFormation(formation)
    end)
  end
  
  list.numItems = #formations
end

function GuildWarRecommendWindow.TouchUseFormation(formation)
  MessageBox.Show(T(11735), {
    titleText = T(11736),
    touchCallback = function()
      if GuildWarMgr.IsFightCountEnough() then
        GuildWarRecommendWindow.TestFormationCardAvailable(false, formation)
      else
        FloatTipsUtil.ShowWarnTips(T(11739))
      end
    end
  }, {
    titleText = T(11737),
    touchCallback = function()
      GuildWarRecommendWindow.TestFormationCardAvailable(true, formation)
    end
  }, {touchable = false}, {})
end

function GuildWarRecommendWindow.TestFormationCardAvailable(simulate, formation)
  local cardInfoList = formation.cardInfos
  local haveUnavailableCard = false
  for _, cardInfo in ipairs(cardInfoList) do
    local state = GuildWarData.GetCardState(cardInfo.cardId)
    if state ~= GUILD_WAR_CARD_STATE.NORMAL then
      haveUnavailableCard = true
      break
    end
  end
  if haveUnavailableCard then
    MessageBox.Show(T(11738), {
      touchCallback = function()
        GuildWarMgr.PrepareEnterBattle(stageId, simulate, formation)
      end
    })
  else
    GuildWarMgr.PrepareEnterBattle(stageId, simulate, formation)
  end
end

function GuildWarRecommendWindow.GetCardList(formation)
  local cardList = formation.cardInfos
  table.sort(cardList, function(a, b)
    local xConf = TableData.GetConfig(a.cardId, "BaseCard")
    local yConf = TableData.GetConfig(b.cardId, "BaseCard")
    if xConf.type ~= yConf.type then
      return xConf.type > yConf.type
    else
      return a.cardId > b.cardId
    end
  end)
  return cardList
end

function GuildWarRecommendWindow.OnClose()
  GuildWarData.ClearCachedBattleDetailRecord()
  uis = nil
  contentPane = nil
  stageId = nil
  filterCardIdList = {}
end

function GuildWarRecommendWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.GuildWarRecommendWindow.UPDATE_FILTER then
    filterCardIdList = para
    GuildWarRecommendWindow.UpdateInfo()
  end
end

return GuildWarRecommendWindow
