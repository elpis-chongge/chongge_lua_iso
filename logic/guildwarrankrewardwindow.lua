require("GuildBoss_GuildRankRewardWindowByName")
local GuildWarRankRewardWindow = {}
local uis, contentPane

function GuildWarRankRewardWindow.ReInitData()
end

function GuildWarRankRewardWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildWarRankRewardWindow.package, WinResConfig.GuildWarRankRewardWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    local rank = bridgeObj.argTable[1]
    uis = GetGuildBoss_GuildRankRewardWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.GUILD_WAR_WINDOW_BG)
    GuildWarRankRewardWindow.UpdateInfo(rank)
    GuildWarRankRewardWindow.InitBtn()
  end)
end

function GuildWarRankRewardWindow.UpdateInfo(rank)
  local title = uis.Main.Title
  title.TitleTxt.text = T(1582)
  title.WordTxt.text = T(1583)
  local info = uis.Main.Info
  info.TimeWordTxt.text = T(1584)
  info.RankWordTxt.text = T(1585)
  local infoData = GuildWarData.GetGuildScheduleInfo()
  if infoData then
    info.TimeTxt.text = TimeUtil.FormatEnTime(infoData.endStamp - LoginData.GetCurServerTime())
    if rank then
      if rank > 0 and rank < 101 then
        info.RankNumberTxt.text = rank
      elseif 0 == rank then
        info.RankNumberTxt.text = T(1394)
      else
        info.RankNumberTxt.text = T(1640, math.floor(rank / 100))
      end
    end
    local list = uis.Main.RewardTipsList
    local rewardData = GuildWarRankRewardWindow.GetRewardData(infoData.phase)
    
    function list.itemRenderer(i, item)
      local tips = item:GetChild("RankRewardTips")
      local data = rewardData[i + 1]
      if data and tips then
        local numberCom = tips:GetChild("RankRewardNumber")
        ChangeUIController(numberCom, "c1", i > 2 and 2 or i)
        ChangeUIController(numberCom, "c2", i > 2 and 2 or i)
        if 1 == data.rank_type then
          UIUtil.SetText(numberCom, T(1586, data.rank_high, data.rank_low), "NumberTxt")
        else
          UIUtil.SetText(numberCom, T(1581, data.rank_text), "NumberTxt")
        end
        local newReward = SimpleCopy(data.reward)
        if data.guild_head_id then
          table.insert(newReward, 1, data.guild_head_id)
        end
        GuildWarRankRewardWindow.ShowRewardIcon(tips:GetChild("RewardList"), newReward)
        if i < 8 then
          tips.alpha = 0
          PlayUITrans(item, "up", nil, Const.gridSpeed * i)
          TimerUtil.setTimeout(i * Const.gridSpeed, function()
            SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LIST_MOVE)
          end)
        end
      end
    end
    
    list.numItems = #rewardData
  end
end

function GuildWarRankRewardWindow.ShowRewardIcon(list, reward)
  function list.itemRenderer(i, item)
    if type(reward[i + 1]) == "number" then
      local headData = TableData.GetConfig(reward[i + 1], "BaseGuildHeadIcon")
      
      if headData then
        item:GetChild("ItemLoader").url = UIUtil.GetResUrl(headData.icon)
        ChangeUIController(item, "c1", headData.quality)
        item.onClick:Set(function()
          OpenWindow(WinResConfig.ItemGetTipsWindow.name, nil, {
            id = headData.id,
            notShowWay = true
          })
        end)
      end
      ChangeUIController(item, "number", 1)
    else
      local data = GetConfigItemList({
        reward[i + 1]
      }, true)
      for _, v in pairs(data) do
        UIUtil.ShowItemFrame(v.id, item, v.value, nil, function()
          UIUtil.CommonItemClickCallback(v.id, v.type)
        end)
      end
    end
    ChangeUIController(item, "c3", 1)
  end
  
  list.numItems = #reward
  list.opaque = false
end

function GuildWarRankRewardWindow.GetRewardData(phase)
  local tb = {}
  local config = TableData.GetTable("BaseGuildWarReward")
  for i, v in pairs(config) do
    if v.phase == phase then
      table.insert(tb, v)
    end
  end
  table.sort(tb, function(a, b)
    return a.rank_low < b.rank_low
  end)
  return tb
end

function GuildWarRankRewardWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuildWarRankRewardWindow.name)
  end)
end

function GuildWarRankRewardWindow.OnClose()
  uis = nil
  contentPane = nil
end

return GuildWarRankRewardWindow
