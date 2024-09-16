require("GuildBoss_GuildCompensateWindowByName")
local GuildWarCompensateWindow = {}
local uis, contentPane, formations, simulated, stageId

function GuildWarCompensateWindow.ReInitData()
end

function GuildWarCompensateWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildWarCompensateWindow.package, WinResConfig.GuildWarCompensateWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_GuildCompensateWindowUis(contentPane)
    formations = bridgeObj.argTable[1]
    stageId = bridgeObj.argTable[2]
    simulated = bridgeObj.argTable[3]
    GuildWarCompensateWindow.UpdateInfo()
    GuildWarCompensateWindow.InitBtn()
  end)
end

function GuildWarCompensateWindow.UpdateInfo()
  local tipsPanel = uis.Main.Tips
  tipsPanel.Title1.WordTxt.text = T(11700)
  tipsPanel.Title2.WordTxt.text = T(11701)
  local alreadyCount = GuildWarData.GetGuildPlayerInfo().fightCount
  local maxFightCnt = TableData.GetConfig(70011405, "BaseFixed").int_value
  local remainCount = math.max(maxFightCnt - alreadyCount, 0)
  local numberTxt
  if remainCount > 0 then
    numberTxt = T(11702, remainCount, maxFightCnt)
  else
    numberTxt = T(11743, remainCount, maxFightCnt)
  end
  tipsPanel.Number.NumberTxt.text = numberTxt
  if simulated then
    tipsPanel.c1Ctr.selectedIndex = 0
    UIUtil.SetBtnText(tipsPanel.BattleBtn, T(11742))
    tipsPanel.BattleBtn.onClick:Add(GuildWarCompensateWindow.TouchNormalBattle)
  elseif alreadyCount >= maxFightCnt then
    tipsPanel.c1Ctr.selectedIndex = 1
    tipsPanel.ZeroNumber.WordTxt.text = T(11703)
  else
    tipsPanel.c1Ctr.selectedIndex = 0
    UIUtil.SetBtnText(tipsPanel.BattleBtn, T(11707))
    tipsPanel.BattleBtn.onClick:Add(GuildWarCompensateWindow.TouchNormalBattle)
  end
  GuildWarCompensateWindow.UpdateList()
end

function GuildWarCompensateWindow.UpdateList()
  local list = uis.Main.Tips.LineupList
  
  function list.itemRenderer(index, item)
    local formation = formations[index + 1]
    item:GetChild("TimeTxt").text = T(11704, TimeUtil.GetTimeStr(formation.compensateTime))
    local headList = item:GetChild("HeadList")
    local cardList = GuildWarCompensateWindow.GetCardList(formation)
    
    function headList.itemRenderer(headIndex, headItem)
      local card = cardList[headIndex + 1]
      if card then
        ChangeUIController(headItem, "c1", 0)
        local cardId = card.cardId
        local fashionId = card.fashionId
        local cardHeadBtn = headItem:GetChild("CardHeadBtn")
        local loader = cardHeadBtn:GetChild("CardPic"):GetChild("CardPicLoader")
        local occupation = cardHeadBtn:GetChild("Occupation")
        local elementList = cardHeadBtn:GetChild("ElementList")
        local cardConf = TableData.GetConfig(cardId, "BaseCard")
        UIUtil.SetHeadByFaceId(fashionId, loader, HEAD_ICON_TYPE_ENUM.RECT)
        UIUtil.SetText(cardHeadBtn, cardConf.name(), "NameTxt")
        ChangeUIController(occupation, "c1", cardConf.type - 1)
        ChangeUIController(cardHeadBtn, "c1", cardConf.star - 1)
        UIUtil.ShowElementList(elementList, cardConf)
      else
        ChangeUIController(headItem, "c1", 1)
      end
    end
    
    headList.numItems = 8
    local btn = item:GetChild("BattleBtn")
    if simulated then
      UIUtil.SetBtnText(btn, T(11742))
    else
      UIUtil.SetBtnText(btn, T(11707))
    end
    btn.onClick:Set(function()
      GuildWarCompensateWindow.CompensateBattle(formation)
    end)
  end
  
  list.numItems = #formations
end

function GuildWarCompensateWindow.CompensateBattle(formation)
  local params = {
    stageId = stageId,
    simulate = simulated,
    sceneType = ProtoEnum.SCENE_TYPE.GUILD_WAR,
    backFunc = function()
      UIMgr:CloseWindow(WinResConfig.FormationWindow.name)
    end,
    guildWarCompensateUid = formation.compensateUid
  }
  ld("Formation")
  FormationMgr.TryOpenFormationWindow(params, true)
end

function GuildWarCompensateWindow.GetCardList(formation)
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

function GuildWarCompensateWindow.TouchNormalBattle()
  GuildWarMgr.PrepareEnterBattle(stageId, simulated)
end

function GuildWarCompensateWindow.TouchClose()
  UIMgr:CloseWindow(WinResConfig.GuildWarCompensateWindow.name)
end

function GuildWarCompensateWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(GuildWarCompensateWindow.TouchClose)
  uis.Main.TouchScreenBtn.onClick:Set(GuildWarCompensateWindow.TouchClose)
  uis.Main.Tips.CloseBtn.onClick:Set(GuildWarCompensateWindow.TouchClose)
end

function GuildWarCompensateWindow.OnClose()
  uis = nil
  contentPane = nil
end

return GuildWarCompensateWindow
