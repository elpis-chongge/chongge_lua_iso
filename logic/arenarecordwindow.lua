require("Arena_RecordWindowByName")
local ArenaRecordWindow = {}
local uis, contentPane, jumpTb

function ArenaRecordWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ArenaRecordWindow.package, WinResConfig.ArenaRecordWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetArena_RecordWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.ARENA_WINDOWS)
    ArenaRecordWindow.InitBtn()
    ArenaRecordWindow.UpdateTextDisplay()
    ArenaRecordWindow.Init()
  end)
end

function ArenaRecordWindow.UpdateTextDisplay()
  ArenaMgr.UpdateText(uis.Main.Title, T(391), T(392), T(393))
end

function ArenaRecordWindow.Init()
  uis.Main.RecordTipsList.itemRenderer = ArenaRecordWindow.RefreshRecordItem
  uis.Main.RecordTipsList.defaultItem = UIUtil.GetResUrl("Arena:RecordTipsAni")
  uis.Main.RecordTipsList:SetVirtual()
  if #ArenaData.records > 1 then
    table.sort(ArenaData.records, function(a, b)
      return a.stamp > b.stamp
    end)
  end
  uis.Main.RecordTipsList.numItems = #ArenaData.records
end

function ArenaRecordWindow.RefreshRecordItem(i, item)
  local data = ArenaData.records[i + 1]
  local tips = item:GetChild("RecordTips")
  UIUtil.SetText(tips, data.isDefend and T(883) or T(884), "SubtitleTxt")
  if data.isWin then
    tips:GetChild("ResultTxt").text = T(464)
    ChangeUIController(tips, nil, 0)
  else
    tips:GetChild("ResultTxt").text = T(465)
    ChangeUIController(tips, nil, 1)
  end
  if data.opponent then
    tips:GetChild("NameTxt").text = ArenaMgr.GetRobotName(data.opponent.randNameId, data.opponent.name)
    tips:GetChild("GuildTxt").text = data.opponent.guildName or ""
    tips:GetChild("TimeTxt").text = ArenaRecordWindow.FormatRemainTime(LoginData.GetCurServerTime() - data.stamp)
    UIUtil.ShowPlayerHead(data.opponent, tips:GetChild("Head"))
  end
  local dataBtn = tips:GetChild("DataBtn")
  UIUtil.SetBtnText(dataBtn, T(466))
  dataBtn.onClick:Set(function()
    local cachedRecord = ArenaData.GetBattleRecord(data.battleUid)
    if cachedRecord then
      ld("Battle", function()
        OpenWindow(WinResConfig.BattleDataWindow.name, nil, {cachedRecord})
      end)
    else
      ld("Battle", function()
        BattleService.GetBattleRecordReq(data.battleUid, function(msg)
          ArenaData.CacheBattleRecord(msg)
          local record = ArenaData.GetBattleRecord(msg.record.battleUid)
          if record then
            ld("Battle", function()
              OpenWindow(WinResConfig.BattleDataWindow.name, nil, {record})
            end)
          end
        end)
      end)
    end
  end)
  local playBackBtn = tips:GetChild("PlayBackBtn")
  UIUtil.SetBtnText(playBackBtn, T(467))
  playBackBtn.onClick:Set(function()
    local cachedRecord = ArenaData.GetBattleRecord(data.battleUid)
    if cachedRecord then
      ld("Battle", function()
        ArenaData.SaveChallengeStageRsp(cachedRecord)
        BattleMgr.InitBattle(cachedRecord.battleData, nil, true)
      end)
    else
      ld("Battle", function()
        BattleService.GetBattleRecordReq(data.battleUid, function(msg)
          ArenaData.CacheBattleRecord(msg)
          local record = ArenaData.GetBattleRecord(msg.record.battleUid)
          if record then
            ld("Battle", function()
              ArenaData.SaveChallengeStageRsp(record)
              BattleMgr.InitBattle(record.battleData, nil, true)
            end)
          end
        end)
      end)
    end
  end)
  local timeAxisBtn = tips:GetChild("TimeAxisBtn")
  timeAxisBtn.onClick:Set(function()
    local cachedRecord = ArenaData.GetBattleRecord(data.battleUid)
    if cachedRecord then
      ld("Battle", function()
        OpenWindow(WinResConfig.BattleAxisWindow.name, nil, {cachedRecord})
      end)
    else
      ld("Battle", function()
        BattleService.GetBattleRecordReq(data.battleUid, function(msg)
          ArenaData.CacheBattleRecord(msg)
          local record = ArenaData.GetBattleRecord(msg.record.battleUid)
          if record then
            ld("Battle", function()
              OpenWindow(WinResConfig.BattleAxisWindow.name, nil, {record})
            end)
          end
        end)
      end)
    end
  end)
end

function ArenaRecordWindow.FormatRemainTime(time)
  time = math.floor(time)
  if time <= 60 then
    return T(281, 1)
  end
  local hours, minutes, seconds
  hours = math.floor(time / 3600)
  time = time % 3600
  minutes = math.floor(time / 60)
  seconds = time % 60
  if hours > 0 then
    local day = math.floor(hours / 24)
    hours = hours % 24
    if 0 == day then
      return T(280, hours)
    else
      return T(279, day)
    end
  else
    return T(281, math.max(minutes, 1))
  end
end

function ArenaRecordWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ArenaRecordWindow.name, uis.Main.CurrencyReturn)
end

function ArenaRecordWindow.HandleMessage(msgId, para)
end

function ArenaRecordWindow.OnClose()
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return ArenaRecordWindow
