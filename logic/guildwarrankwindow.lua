require("GuildBoss_GuildRankWindowByName")
local GuildWarRankWindow = {}
local uis, contentPane, rankInfo, guildPlayAnim, cardPlayAnim, myRank, showType

function GuildWarRankWindow.ReInitData()
end

function GuildWarRankWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildWarRankWindow.package, WinResConfig.GuildWarRankWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_GuildRankWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.GUILD_WAR_WINDOW_BG)
    rankInfo = GuildWarData.GetRankInfo()
    if rankInfo then
      GuildWarRankWindow.ShowGuildList()
      GuildWarRankWindow.ShowInfo()
    end
    GuildWarRankWindow.InitBtn()
  end)
end

function GuildWarRankWindow.ShowGuildList()
  showType = 0
  guildPlayAnim = true
  local list = uis.Main.TipsList
  list:SetVirtual()
  list.itemRenderer = GuildWarRankWindow.GuildRankRenderer
  list.numItems = #rankInfo.guildList
  guildPlayAnim = nil
  list.scrollPane:ScrollTop()
end

function GuildWarRankWindow.ShowCardList()
  showType = 1
  cardPlayAnim = true
  local cardTipsList = uis.Main.CardTipsList
  cardTipsList:SetVirtual()
  cardTipsList.itemRenderer = GuildWarRankWindow.CardRankRenderer
  cardTipsList.numItems = #rankInfo.memberList
  cardPlayAnim = nil
  cardTipsList.scrollPane:ScrollTop()
end

function GuildWarRankWindow.GuildRankRenderer(i, item)
  local tips = item:GetChild("RankTips")
  local info = rankInfo.guildList[i + 1]
  local myGuildUid = GuildData.simpleInfo.guildUid or 0
  if info and tips then
    local headData = TableData.GetConfig(info.iconId, "BaseGuildHeadIcon")
    if headData then
      tips:GetChild("GulidIconLoader").url = UIUtil.GetResUrl(headData.icon)
    end
    UIUtil.SetText(tips, info.rank, "RankTxt")
    UIUtil.SetText(tips, T(1590, info.actCount, info.memberCount), "CardNumberTxt")
    UIUtil.SetText(tips, T(1591, info.round), "RoundTxt")
    ChangeUIController(tips, "c1", info.rank > 3 and 3 or info.rank - 1)
    ChangeUIController(tips, "c3", info.rank > 9 and 1 or 0)
    ChangeUIController(tips, "c2", info.guildUid == myGuildUid and 1 or 0)
    UIUtil.SetText(tips, info.name, "NameTxt")
    UIUtil.SetText(tips, T(1592, info.level), "LevelTxt")
    UIUtil.SetText(tips, string.formatNum(info.score, 3), "NumberTxt")
    if guildPlayAnim and i < 8 then
      tips.alpha = 0
      PlayUITrans(item, "up", nil, Const.gridSpeed * i)
      TimerUtil.setTimeout(i * Const.gridSpeed, function()
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LIST_MOVE)
      end)
    end
  end
end

function GuildWarRankWindow.CardRankRenderer(i, item)
  local tips = item:GetChild("RankTips")
  local info = rankInfo.memberList[i + 1]
  if info and tips then
    if info.actorHead then
      UIUtil.ShowPlayerHead(info, tips:GetChild("Head"))
    end
    UIUtil.SetText(tips, info.rank, "RankTxt")
    UIUtil.SetText(tips, GuildData.simpleInfo and GuildData.simpleInfo.guildName or "", "GuildTxt")
    ChangeUIController(tips, "c1", info.rank > 3 and 3 or info.rank - 1)
    ChangeUIController(tips, "c3", info.rank > 9 and 1 or 0)
    ChangeUIController(tips, "c2", info.uin == ActorData.GetUin() and 1 or 0)
    UIUtil.SetText(tips, info.name, "NameTxt")
    UIUtil.SetText(tips, T(1592, info.level), "LevelTxt")
    UIUtil.SetText(tips, string.formatNum(info.score, 3), "NumberTxt")
    UIUtil.SetText(tips, T(1589), "NumberWordTxt")
    if cardPlayAnim and i < 8 then
      tips.alpha = 0
      PlayUITrans(item, "up", nil, Const.gridSpeed * i)
      TimerUtil.setTimeout(i * Const.gridSpeed, function()
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LIST_MOVE)
      end)
    end
  end
end

function GuildWarRankWindow.GetChildSlefData()
  local memberRankInfo
  for i, v in pairs(rankInfo.memberList) do
    if v.uin == ActorData.GetUin() then
      memberRankInfo = v
      break
    end
  end
  return memberRankInfo
end

function GuildWarRankWindow.ShowInfo()
  local info = uis.Main.Info
  local memberRankInfo = GuildWarRankWindow.GetChildSlefData()
  local guildRankInfo = rankInfo.mineGuild
  if memberRankInfo then
    info.Own.RankTxt.text = GuildWarMgr.SetFontSize(T(406, memberRankInfo.rank), 19)
    ChangeController(info.Own.c1Ctr, memberRankInfo.rank > 3 and 3 or memberRankInfo.rank - 1)
    info.Own.NameTxt.text = memberRankInfo.name
    if memberRankInfo.score < 1 then
      info.Own.NumberTxt.text = T(1633)
    else
      info.Own.NumberTxt.text = string.formatNum(memberRankInfo.score, 3)
    end
    UIUtil.ShowPlayerHead(memberRankInfo, info.Own.Head.root)
    ChangeController(info.Own.c2Ctr, 0)
  else
    if GuildData.simpleInfo then
      info.Own.NameTxt.text = ActorData.GetName()
      UIUtil.ShowPlayerHead(ActorData.GetActorInfo(), info.Own.Head.root)
    end
    info.Own.NumberTxt.text = T(1633)
    info.Own.RankTxt.text = GuildWarMgr.SetFontSize(T(1634), 19)
    ChangeController(info.Own.c2Ctr, 1)
  end
  info.Own.NumberWordTxt.text = T(1589)
  if guildRankInfo then
    info.Guild.GuildTxt.text = T(1590, guildRankInfo.actCount, guildRankInfo.memberCount)
    info.Guild.NameTxt.text = guildRankInfo.name
    info.Guild.LevelTxt.text = T(1592, guildRankInfo.level)
    info.Guild.RoundTxt.text = T(1591, guildRankInfo.round)
    if guildRankInfo.score < 1 then
      info.Guild.NumberTxt.text = T(1633)
    else
      info.Guild.NumberTxt.text = string.formatNum(guildRankInfo.score, 3)
    end
    if 0 ~= rankInfo.rank and rankInfo.rank < 101 then
      if rankInfo.rank < 10 then
        info.Guild.RankTxt.text = GuildWarMgr.SetFontSize(rankInfo.rank, 43)
      else
        info.Guild.RankTxt.text = GuildWarMgr.SetFontSize(rankInfo.rank, 39)
      end
      myRank = rankInfo.rank
      ChangeController(info.Guild.c1Ctr, myRank > 3 and 3 or myRank - 1)
      ChangeController(info.Guild.c2Ctr, 0)
    else
      myRank = rankInfo.rankRatio
      if 0 == myRank then
        info.Guild.RankTxt.text = GuildWarMgr.SetFontSize(T(1634), 19)
        ChangeController(info.Guild.c1Ctr, 3)
        ChangeController(info.Guild.c2Ctr, 1)
      else
        info.Guild.RankTxt.text = GuildWarMgr.SetFontSize(T(1640, math.floor(rankInfo.rankRatio / 100)), 19)
        ChangeController(info.Guild.c1Ctr, myRank > 3 and 3 or myRank - 1)
        ChangeController(info.Guild.c2Ctr, 0)
      end
    end
    local headData = TableData.GetConfig(guildRankInfo.iconId, "BaseGuildHeadIcon")
    if headData then
      info.Guild.GulidIconLoader.url = UIUtil.GetResUrl(headData.icon)
    end
  else
    ChangeController(info.Guild.c2Ctr, 1)
  end
end

function GuildWarRankWindow.InitBtn()
  UIUtil.SetText(uis.Main.Tab1Btn, T(1587))
  uis.Main.Tab1Btn.onClick:Set(function()
    if 1 == showType then
      ChangeController(uis.Main.c1Ctr, 0)
      GuildWarRankWindow.ShowGuildList()
    end
  end)
  UIUtil.SetText(uis.Main.Tab2Btn, T(1588))
  uis.Main.Tab2Btn.onClick:Set(function()
    if 0 == showType then
      ChangeController(uis.Main.c1Ctr, 1)
      GuildWarRankWindow.ShowCardList()
    end
  end)
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuildWarRankWindow.name)
  end)
  local title = uis.Main.Title
  title.TitleTxt.text = T(1582)
  title.WordTxt.text = T(1583)
end

function GuildWarRankWindow.OnClose()
  uis = nil
  contentPane = nil
  rankInfo = nil
  guildPlayAnim = nil
  cardPlayAnim = nil
  myRank = nil
  showType = nil
end

return GuildWarRankWindow
