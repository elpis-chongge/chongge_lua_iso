require("Team_TeamWindowByName")
local TeamWindow = {}
local uis, contentPane, curSelectTeamId, jumpTb

function TeamWindow.ReInitData()
end

function TeamWindow.Init()
  if nil == curSelectTeamId then
    curSelectTeamId = 1
  end
  local teamList = uis.Main.TeamList
  teamList.align = FairyGUI.AlignType.Center
  teamList:SetVirtual()
  teamList.itemRenderer = TeamWindow.RefreshCard
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.HOME_TEAM)
end

function TeamWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.TeamWindow.package, WinResConfig.TeamWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetTeam_TeamWindowUis(contentPane)
    TeamWindow.Init()
    TeamWindow.UpdateInfo()
    TeamWindow.InitBtn()
  end)
end

function TeamWindow.UpdateInfo()
  TeamWindow.UpdateTab()
  TeamWindow.UpdateTeamList()
end

function TeamWindow.UpdateTeamList()
  local maxNum = TeamData.GetTeamCardLimitNum()
  local onePageNum = 12
  local teamInfo = TeamData.GetTeamInfoById(curSelectTeamId)
  local curNum = teamInfo and #teamInfo.cardIds or 0
  local num = 0
  if onePageNum > curNum then
    num = onePageNum
  elseif maxNum > curNum then
    num = curNum + 1
  else
    num = maxNum
  end
  local teamList = uis.Main.TeamList
  teamList.numItems = num
  teamList:RefreshVirtualList()
end

function TeamWindow.UpdateTab()
  local tabBtnList = {
    uis.Main.TabRegion.Tab1Btn,
    uis.Main.TabRegion.Tab2Btn,
    uis.Main.TabRegion.Tab3Btn,
    uis.Main.TabRegion.Tab4Btn
  }
  local trans = uis.Main.root:GetTransition("up")
  local lastIndex = 0
  for teamId = 1, 4 do
    local tabBtn = tabBtnList[teamId]
    local editImg = tabBtn:GetChild("PutImage")
    if editImg then
      editImg.alpha = 1
    end
    UIUtil.SetBtnText(tabBtn, TeamData.GetTeamNameById(teamId), T(10056))
    if curSelectTeamId == teamId then
      tabBtn.selected = true
    end
    UIUtil.SetTagButtonSwitch(tabBtn, trans, function()
      if tabBtn.selected and curSelectTeamId == teamId then
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
        OpenWindow(WinResConfig.TeamRenameWindow.name, nil, curSelectTeamId)
        return false
      end
      if lastIndex ~= uis.Main.TabRegion.c1Ctr.selectedIndex then
        lastIndex = uis.Main.TabRegion.c1Ctr.selectedIndex
        return true
      end
    end, function()
      if tabBtn.selected then
        if curSelectTeamId ~= teamId then
          curSelectTeamId = teamId
          TeamWindow.UpdateTeamList()
        else
          OpenWindow(WinResConfig.TeamRenameWindow.name, nil, curSelectTeamId)
        end
      end
    end, uis.Main.TabRegion.root)
  end
end

function TeamWindow.RefreshCard(index, item)
  local teamInfo = TeamData.GetTeamInfoById(curSelectTeamId)
  if teamInfo and teamInfo.cardIds[index + 1] then
    local cardId = teamInfo.cardIds[index + 1]
    local cardInfo = CardData.GetCardDataById(cardId)
    ChangeUIController(item, "c1", 1)
    UIUtil.ShowCardTips(cardInfo, item:GetChild("CardTips"), nil, nil, HEAD_ICON_TYPE_ENUM.SQUARE)
  else
    ChangeUIController(item, "c1", 0)
  end
  item.onClick:Set(function()
    TeamWindow.TouchTeamCard(index + 1)
  end)
end

function TeamWindow.TouchTeamCard(index)
  OpenWindow(WinResConfig.TeamEditWindow.name, nil, curSelectTeamId, index)
end

function TeamWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.TeamWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_TEAM)
  uis.Main.DeleteBtn.onClick:Set(TeamWindow.DeleteTeam)
  UIUtil.SetText(uis.Main.AdjustmentBtn, T(10044), "WordTxt")
  uis.Main.AdjustmentBtn.onClick:Set(function()
    TeamWindow.TouchTeamCard()
  end)
end

function TeamWindow.DeleteTeam()
  MessageBox.Show(T(10054), {
    touchCallback = function()
      TeamService.SetCardTeamReq(curSelectTeamId, {}, TeamData.GetTeamNameById(curSelectTeamId))
    end
  }, {})
end

function TeamWindow.OnShown()
  if uis then
    TeamWindow.UpdateTeamList()
  end
end

function TeamWindow.OnHide()
end

function TeamWindow.RefreshName()
  local tabBtnList = {
    uis.Main.TabRegion.Tab1Btn,
    uis.Main.TabRegion.Tab2Btn,
    uis.Main.TabRegion.Tab3Btn,
    uis.Main.TabRegion.Tab4Btn
  }
  for teamId = 1, 4 do
    local tabBtn = tabBtnList[teamId]
    UIUtil.SetBtnText(tabBtn, TeamData.GetTeamNameById(teamId), T(10056))
  end
end

function TeamWindow.OnClose()
  uis = nil
  contentPane = nil
  curSelectTeamId = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

function TeamWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Team.TEAM_UPDATE then
    TeamWindow.UpdateTeamList()
  elseif msgId == WindowMsgEnum.Team.RENAME then
    TeamWindow.RefreshName()
  end
end

return TeamWindow
