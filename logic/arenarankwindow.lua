require("Arena_RankWindowByName")
local ArenaRankWindow = {}
local uis, contentPane, rankData, jumpTb

function ArenaRankWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ArenaRankWindow.package, WinResConfig.ArenaRankWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetArena_RankWindowUis(contentPane)
    rankData = ArenaData.Rank.rankList
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.ARENA_WINDOWS)
    ArenaRankWindow.InitBtn()
    ArenaRankWindow.UpdateTextDisplay()
    ArenaRankWindow.Init()
  end)
end

function ArenaRankWindow.UpdateTextDisplay()
  ArenaMgr.UpdateText(uis.Main.Title, T(388), T(389), T(390))
  uis.Main.Glory.WordTxt.text = T(402)
  uis.Main.NowRank.WordTxt.text = T(401)
end

function ArenaRankWindow.Init()
  uis.Main.RewardTipsList.itemRenderer = ArenaRankWindow.RefreshRankItem
  uis.Main.RewardTipsList.defaultItem = UIUtil.GetResUrl("Arena:RankTipsAni")
  uis.Main.RewardTipsList:SetVirtual()
  uis.Main.RewardTipsList.numItems = #rankData
  uis.Main.NowRank.RankTxt.text = ArenaMgr.GetRank(true)
  local j, y = ArenaRankWindow.GetArenaMedal(ArenaData.Rank.arenaMedal)
  
  function uis.Main.Glory.GloryList.itemRenderer(index, icon)
    if index + 1 <= j then
      ChangeUIController(icon, nil, 1)
    else
      ChangeUIController(icon, nil, 0)
    end
  end
  
  uis.Main.Glory.GloryList.numItems = j + y
  ChangeController(uis.Main.c1Ctr, uis.Main.Glory.GloryList.numItems > 0 and 1 or 0)
end

function ArenaRankWindow.RefreshRankItem(i, item)
  local data = rankData[i + 1]
  local tips = item:GetChild("RankTips")
  if data.rank < 10 then
    tips:GetChild("RankTxt").text = data.rank
    ChangeUIController(tips, "c3", 0)
  else
    tips:GetChild("RankTxt").text = data.rank
    ChangeUIController(tips, "c3", 1)
  end
  if data.info.uin == ActorData.GetUin() then
    ChangeUIController(tips, "c2", 1)
  else
    ChangeUIController(tips, "c2", 0)
  end
  tips:GetChild("NameTxt").text = ArenaMgr.GetRobotName(data.info.randNameId, data.info.name)
  tips:GetChild("LevelTxt").text = T(870, data.info.level)
  tips:GetChild("GuildTxt").text = data.info.guildName or ""
  if i > 3 then
    ChangeUIController(tips, nil, 3)
  else
    ChangeUIController(tips, nil, i)
  end
  UIUtil.ShowPlayerHead(data.info, tips:GetChild("Head"))
  if data.info.arenaMedal > 0 then
    local j, y = ArenaRankWindow.GetArenaMedal(data.info.arenaMedal)
    local list = tips:GetChild("GloryList")
    
    function list.itemRenderer(index, icon)
      if index + 1 <= j then
        ChangeUIController(icon, nil, 1)
      else
        ChangeUIController(icon, nil, 0)
      end
    end
    
    list.numItems = j + y
  end
end

function ArenaRankWindow.GetArenaMedal(num)
  local j = 0
  local y = num % 4
  if 0 == y then
    j = num / 4
  else
    j = (num - y) / 4
  end
  return j, y
end

function ArenaRankWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ArenaRankWindow.name, uis.Main.CurrencyReturn)
end

function ArenaRankWindow.HandleMessage(msgId, para)
end

function ArenaRankWindow.OnClose()
  uis = nil
  ArenaData.Rank = nil
  contentPane = nil
  rankData = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return ArenaRankWindow
