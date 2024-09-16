require("Guild_VoteWindowByName")
local GuildVoteWindow = {}
local uis, contentPane, timeInfo

function GuildVoteWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildVoteWindow.package, WinResConfig.GuildVoteWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuild_VoteWindowUis(contentPane)
    GuildVoteWindow.UpdateTextDisplay()
    GuildVoteWindow.InitBtn()
  end)
end

function GuildVoteWindow.UpdateTextDisplay()
  local name = GuildVoteWindow.GetVoteName()
  if name then
    uis.Main.Vote1.NameTxt.text = T(282, name)
  end
  uis.Main.Vote1.AgreeTxt.text = T(275)
  uis.Main.Vote1.DisagreeTxt.text = T(276)
  GuildVoteWindow.RefreshUI()
end

function GuildVoteWindow.RefreshUI()
  if 0 == GuildData.GuildInfo.impeachInfo.myVote and GuildData.myRoleType ~= ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER then
    UIUtil.SetBtnText(uis.Main.Vote1.AgreeBtn, T(275), T(284))
    UIUtil.SetBtnText(uis.Main.Vote1.DisagreeBtn, T(276), T(285))
  else
    uis.Main.Vote1.AgreeBtn.visible = false
    uis.Main.Vote1.DisagreeBtn.visible = false
  end
  local total = GuildData.GuildInfo.impeachInfo.approveCount + GuildData.GuildInfo.impeachInfo.opposeCount
  local InitBar = function(bar)
    bar.value = 1
    bar.max = 1
  end
  if GuildData.GuildInfo.impeachInfo.approveCount > GuildData.GuildInfo.impeachInfo.opposeCount then
    InitBar(uis.Main.Vote1.AgreeProgressBar)
    uis.Main.Vote1.DisagreeProgressBar.value = GuildData.GuildInfo.impeachInfo.opposeCount
    uis.Main.Vote1.DisagreeProgressBar.max = GuildData.GuildInfo.impeachInfo.approveCount
  elseif GuildData.GuildInfo.impeachInfo.approveCount == GuildData.GuildInfo.impeachInfo.opposeCount then
    InitBar(uis.Main.Vote1.AgreeProgressBar)
    InitBar(uis.Main.Vote1.DisagreeProgressBar)
  elseif GuildData.GuildInfo.impeachInfo.approveCount < GuildData.GuildInfo.impeachInfo.opposeCount then
    InitBar(uis.Main.Vote1.DisagreeProgressBar)
    uis.Main.Vote1.AgreeProgressBar.value = GuildData.GuildInfo.impeachInfo.approveCount
    uis.Main.Vote1.AgreeProgressBar.max = GuildData.GuildInfo.impeachInfo.opposeCount
  end
  uis.Main.Vote1.AgreeNumberTxt.text = T(283, GuildData.GuildInfo.impeachInfo.approveCount, GetPreciseDecimal(GuildData.GuildInfo.impeachInfo.approveCount / total * 100))
  uis.Main.Vote1.DisagreeNumberTxt.text = T(283, GuildData.GuildInfo.impeachInfo.opposeCount, GetPreciseDecimal(GuildData.GuildInfo.impeachInfo.opposeCount / total * 100))
  local endTimeout = math.floor(GuildData.GuildInfo.impeachInfo.endTimeout)
  uis.Main.Vote1.TimeTxt.text = T(1322, TimeUtil.FormatEnTime(endTimeout))
  timeInfo = TimerUtil.new(1, endTimeout, function(timer, tickTime)
    uis.Main.Vote1.TimeTxt.text = T(1322, TimeUtil.FormatEnTime(endTimeout - tickTime))
  end, function()
    uis.Main.Vote1.TimeTxt.text = ""
  end)
  timeInfo:start()
end

function GuildVoteWindow.GetVoteName()
  local uin = GuildData.GuildInfo.impeachInfo.initiatorUin
  for i, v in pairs(GuildData.GuildInfo.members) do
    if v.uin == uin then
      return v.name
    end
  end
end

function GuildVoteWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.GuildVoteWindow.name)
end

function GuildVoteWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(GuildVoteWindow.CloseWindow)
  uis.Main.Vote1.AgreeBtn.onClick:Set(function()
    if GuildData.myRoleType ~= ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER then
      GuildService.VoteImpeachGuildLeaderReq(true)
    end
  end)
  uis.Main.Vote1.DisagreeBtn.onClick:Set(function()
    if GuildData.myRoleType ~= ProtoEnum.GUILD_ROLE_TYPE.GRT_LEADER then
      GuildService.VoteImpeachGuildLeaderReq(false)
    end
  end)
  UIUtil.SetPopupBtnGroup(uis.Main.Popup_B.BtnGroup.root, {
    touchCallback = GuildVoteWindow.CloseWindow
  })
end

function GuildVoteWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.GuildWindow.IMPEACH then
    GuildVoteWindow.StopTime()
    GuildVoteWindow.RefreshUI()
  end
end

function GuildVoteWindow.StopTime()
  if timeInfo then
    timeInfo:stop()
    timeInfo = nil
  end
end

function GuildVoteWindow.OnClose()
  GuildVoteWindow.StopTime()
  uis = nil
  contentPane = nil
end

return GuildVoteWindow
