require("RaidBoss_PlayerRankWindowByName")
local RaidBossPlayerRankWindow = {}
local uis, contentPane
local PlayerRankInfoItemRenderer = function(i, gcmp)
  local rank = i + 1
  local info = RaidBossData.GetPlayerRankInfoAt(rank)
  local child = gcmp:GetChild("PlayerRankTips")
  local playerNumber = child:GetChild("PlayerNumber")
  UIUtil.SetText(playerNumber, rank, "NumberTxt")
  if rank <= 3 then
    ChangeUIController(playerNumber, "c1", rank - 1)
  else
    ChangeUIController(playerNumber, "c1", 3)
  end
  local length = #tostring(rank)
  ChangeUIController(playerNumber, "c2", math.min(length - 1, 1))
  if info then
    local lvTxt = T(20274, info.level)
    local uin = info.uin
    UIUtil.SetText(child, info.name, "NameTxt")
    UIUtil.SetText(child, lvTxt, "LevelTxt")
    UIUtil.SetText(child, info.guildName, "GuildTxt")
    local stageId
    if type(info.scoreDiff) == "number" and info.scoreDiff > 0 then
      stageId = RaidBossData.GetLevelIdByDifficult(info.scoreDiff)
    end
    if type(stageId) ~= "number" then
      UIUtil.SetText(child, T(20275), "NumberWordTxt")
    else
      local conf = TableData.GetConfig(stageId, "BaseStage")
      UIUtil.SetText(child, string.format("%s%s", T(20288), conf.name_detail()), "NumberWordTxt")
    end
    UIUtil.SetText(child, string.formatNum(info.score, 3), "NumberTxt")
    UIUtil.ShowPlayerHead(info, child:GetChild("Head"))
    ChangeUIController(child, "c1", ActorData.GetUin() == uin and 1 or 0)
    child:GetChild("PlayerLookBtn").onClick:Set(function()
      RaidBossService.GetSinglePlayerInfoReq(uin, stageId)
    end)
  else
    local data = RaidBossData.GetPlayersRankData()
    local count = data and data.rankCount or 50
    if rank <= count then
      UIUtil.SetText(child, T(20295), "NameTxt")
      UIUtil.SetText(child, T(20295), "LevelTxt")
      UIUtil.SetText(child, T(20295), "GuildTxt")
      UIUtil.SetText(child, T(20295), "NumberTxt")
      RaidBossMgr.RequireRankInfo(rank)
    else
      UIUtil.SetText(child, "", "NameTxt")
      UIUtil.SetText(child, "", "LevelTxt")
      UIUtil.SetText(child, "", "GuildTxt")
      UIUtil.SetText(child, "", "NumberTxt")
    end
    child:GetChild("PlayerLookBtn").onClick:Clear()
  end
end
local init
local RefreshPlayerRankInfo = function(maxCount)
  maxCount = type(maxCount) == "number" and math.max(0, maxCount) or 0
  if maxCount > 0 then
    uis.Main.c1Ctr.selectedIndex = 0
    local list = uis.Main.PlayerRankTipsList.RewardTipsList
    list.numItems = maxCount
    list:RefreshVirtualList()
  else
    uis.Main.c1Ctr.selectedIndex = 1
    uis.Main.PlayerRankEmpty.WordTxt.text = T(20337)
  end
end

function RaidBossPlayerRankWindow.ReInitData()
end

function RaidBossPlayerRankWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RaidBossPlayerRankWindow.package, WinResConfig.RaidBossPlayerRankWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRaidBoss_PlayerRankWindowUis(contentPane)
    RaidBossPlayerRankWindow.UpdateInfo()
    RaidBossPlayerRankWindow.InitBtn()
  end)
end

function RaidBossPlayerRankWindow.UpdateInfo()
  local titleText = T(20276)
  local descText = T(20277)
  local rankTitleText = T(20278)
  uis.Main.PlayerRankTitle.WordTxt.text = descText
  uis.Main.PlayerRankTitle.TitleTxt.text = titleText
  uis.Main.NowRank.WordTxt.text = rankTitleText
  local rank = RaidBossData.GetPlayerRank(false)
  local rankRatio = RaidBossData.GetPlayerRank(true)
  local data = RaidBossData.GetRaidBossData()
  local stageId = RaidBossData.GetLevelIdByDifficult(data.highScoreDiff)
  if stageId then
    local conf = TableData.GetConfig(stageId, "BaseStage")
    uis.Main.NowRank2.WordTxt.text = string.format("%s%s", T(20288), conf.name_detail())
    uis.Main.NowRank2.RankTxt.text = string.formatNum(data.highScore, 3)
  end
  local rankText
  if rankRatio > 0 then
    rankText = T(20319, string.format("%s%%", math.ceil(rankRatio * 100 / 10000)))
    uis.Main.NowRank2.root.visible = true
  elseif rank > 0 then
    rankText = rank
    uis.Main.NowRank2.root.visible = true
  else
    rankText = T(20311)
    uis.Main.NowRank2.root.visible = false
  end
  uis.Main.NowRank.RankTxt.text = rankText
  RaidBossMgr.ClearPlayerRankCache()
  local list = uis.Main.PlayerRankTipsList.RewardTipsList
  list.itemRenderer = PlayerRankInfoItemRenderer
  list:SetVirtual()
  RaidBossMgr.RequireRankInfo(1, function(msg)
    RefreshPlayerRankInfo(msg.rankCount)
    init = true
  end)
end

function RaidBossPlayerRankWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RaidBossPlayerRankWindow.name)
  end)
end

function RaidBossPlayerRankWindow.OnClose()
  uis = nil
  contentPane = nil
  init = nil
end

function RaidBossPlayerRankWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.RaidBossPlayerRankWindow.REFRESH_RANK_LIST then
    if not init then
      return
    end
    RefreshPlayerRankInfo(para.rankCount)
  end
end

return RaidBossPlayerRankWindow
