require("GuildBoss_GuildBossWindowByName")
local GuildBossMainWindow = {}
local uis, contentPane
local RefreshPanelInfo = function()
  local title = uis.Main.Title
  title.NameTxt.text = GuildData.GuildInfo.info.name
  title.NumberTxt.text = GuildData.GuildInfo.info.memberCount
  title.LevelTxt.text = GuildData.GuildInfo.info.level
  local headData = TableData.GetConfig(GuildData.GuildInfo.info.iconId, "BaseGuildHeadIcon")
  if headData then
    title.GulidIconLoader.url = UIUtil.GetResUrl(headData.icon)
  end
  local playerInfo = GuildWarData.GetGuildPlayerInfo()
  local scheduleInfo = GuildWarData.GetGuildScheduleInfo()
  local progressInfo = GuildWarData.GetGuildWarProgressInfo()
  local startTimestamp, endTimestamp = scheduleInfo.startStamp, scheduleInfo.endStamp
  local fightCnt = playerInfo.fightCount
  local restTimestamp = playerInfo.dailyResetStamp
  uis.Main.EndTime.WordTxt.text = endTimestamp
  uis.Main.BattleNumber.WordTxt.text = fightCnt
  uis.Main.Round.WordTxt.text = progressInfo.round
end

function GuildBossMainWindow.ReInitData()
end

function GuildBossMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildBossMainWindow.package, WinResConfig.GuildBossMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_GuildBossWindowUis(contentPane)
    GuildBossMainWindow.UpdateInfo()
    GuildBossMainWindow.InitBtn()
  end)
end

function GuildBossMainWindow.UpdateInfo()
  GuildWarService.GetGuildWarAllInfoReq(RefreshPanelInfo)
end

function GuildBossMainWindow.InitBtn()
  uis.Main.MemberBtn.onClick:Set(function()
    OpenWindow(WinResConfig.CardListWindow.name)
  end)
  uis.Main.BadgeBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BADGE) then
      ld("Badge")
      OpenWindow(WinResConfig.BadgeWindow.name)
    end
  end)
  uis.Main.BattleBtn.onClick:Set(function()
    OpenWindow(WinResConfig.GuildBossSelectedWindow.name)
  end)
end

function GuildBossMainWindow.OnClose()
  uis = nil
  contentPane = nil
end

return GuildBossMainWindow
