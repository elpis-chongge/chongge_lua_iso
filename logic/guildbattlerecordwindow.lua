require("GuildBoss_GuildBattleRecordWindowByName")
local GuildBattleRecordWindow = {}
local uis, contentPane

function GuildBattleRecordWindow.ReInitData()
end

function GuildBattleRecordWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildBattleRecordWindow.package, WinResConfig.GuildBattleRecordWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_GuildBattleRecordWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.GUILD_WAR_WINDOW_BG)
    GuildBattleRecordWindow.UpdateInfo()
    GuildBattleRecordWindow.InitBtn()
  end)
end

function GuildBattleRecordWindow.UpdateInfo()
  uis.Main.Title.TitleTxt.text = T(1615)
  uis.Main.Title.WordTxt.text = T(1616)
  local record = GuildWarData.GetBattleRecord()
  if record then
    local playAnim = true
    local list = uis.Main.RewardTipsList
    list:SetVirtual()
    
    function list.itemRenderer(i, item)
      local tips = item:GetChild("RankTips")
      local data = record[i + 1]
      if data and tips then
        UIUtil.SetText(tips, T(1591, data.round), "RoundTxt")
        UIUtil.SetText(tips, string.formatNum(data.damageHp, 3), "NumberTxt")
        local stageData = TableData.GetConfig(data.stageId, "BaseStage")
        if stageData and stageData.boss_id then
          local bossData = TableData.GetConfig(stageData.boss_id, "BaseMonster")
          if bossData then
            UIUtil.SetText(tips, bossData.name(), "NameTxt")
            UIUtil.SetText(tips, CardData.GetMonsterRankName(bossData.rank, nil, true), "LevelTxt")
            local fashionData = TableData.GetConfig(bossData.fashion_id, "BaseFashion")
            if fashionData then
              tips:GetChild("Head"):GetChild("Pic"):GetChild("PicLoader").url = UIUtil.GetResUrl(fashionData.head_icon_square)
            end
          end
        end
        local battleUid = data.battleUid
        tips:GetChild("TimeAxisBtn").onClick:Set(function()
          local cachedRecord = GuildWarData.GetCachedBattleDetailRecord(battleUid)
          if cachedRecord then
            ld("Battle", function()
              OpenWindow(WinResConfig.BattleAxisWindow.name, nil, {cachedRecord})
            end)
          else
            ld("Battle", function()
              BattleService.GetBattleRecordReq(battleUid, function(msg)
                GuildWarData.SetCachedBattleDetailRecord(msg)
                local _record = GuildWarData.GetCachedBattleDetailRecord(msg.record.battleUid)
                if _record then
                  ld("Battle", function()
                    OpenWindow(WinResConfig.BattleAxisWindow.name, nil, {_record})
                  end)
                end
              end)
            end)
          end
        end)
        tips:GetChild("DataBtn").onClick:Set(function()
          local cachedRecord = GuildWarData.GetCachedBattleDetailRecord(battleUid)
          if cachedRecord then
            ld("Battle", function()
              OpenWindow(WinResConfig.BattleDataWindow.name, nil, {cachedRecord})
            end)
          else
            ld("Battle", function()
              BattleService.GetBattleRecordReq(battleUid, function(msg)
                GuildWarData.SetCachedBattleDetailRecord(msg)
                local _record = GuildWarData.GetCachedBattleDetailRecord(msg.record.battleUid)
                if _record then
                  ld("Battle", function()
                    OpenWindow(WinResConfig.BattleDataWindow.name, nil, {_record})
                  end)
                end
              end)
            end)
          end
        end)
        tips:GetChild("PlayBackBtn").onClick:Set(function()
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
                local _record = GuildWarData.GetCachedBattleDetailRecord(msg.record.battleUid)
                if _record then
                  ld("Battle", function()
                    GuildWarData.SaveChallengeStageRsp(_record)
                    BattleMgr.InitBattle(_record.battleData, nil, true)
                  end)
                end
              end)
            end)
          end
        end)
        if playAnim then
          tips.alpha = 0
          PlayUITrans(item, "up", nil, i * 0.04)
        end
      end
    end
    
    list.numItems = #record
    playAnim = nil
  end
end

function GuildBattleRecordWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuildBattleRecordWindow.name)
  end)
end

function GuildBattleRecordWindow.OnClose()
  uis = nil
  contentPane = nil
end

return GuildBattleRecordWindow
