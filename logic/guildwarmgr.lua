GuildWarMgr = {}

function GuildWarMgr.OpenGuildWarWindow()
  GuildWarService.GetGuildWarScheduleReq(function(msg)
    if msg.inGuild then
      ld("Guild")
      GuildService.GetMyGuildSimpleInfoReq()
      local state = msg.schedule.state
      if state == ProtoEnum.GuildWarState.GWS_NOTICE then
        OpenWindow(WinResConfig.GuildBossPreviewWindow.name)
      elseif state == ProtoEnum.GuildWarState.GWS_FIGHT then
        GuildWarService.GetGuildWarAllInfoReq(function()
          AbyssExploreMgr.Enter(EXPLORE_MAP_ID.GUILD_WAR_1)
        end)
      else
        GuildWarService.GetGuildWarAllInfoReq(function()
          OpenWindow(WinResConfig.GuildBossEndWindow.name)
        end)
      end
    else
      MessageBox.Show(T(1605), {
        touchCallback = function()
          if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_GUILD, false) then
            ld("Guild", function()
              GuildService.EnterGuild()
            end)
          end
        end
      }, {})
    end
  end)
end

local params = {
  sceneType = ProtoEnum.SCENE_TYPE.GUILD_WAR,
  backFunc = function()
    UIMgr:CloseWindow(WinResConfig.FormationWindow.name)
  end,
  errorCallback = function(code)
    if code == ProtoEnum.RET_CODE.RC_GUILD_WAR_BOSS_DEAD then
      GuildWarService.GetGuildWarAllInfoReq()
      UIMgr:CloseWindow(WinResConfig.GuildWarLevelDetailInfoWindow.name)
    end
  end
}

function GuildWarMgr.PrepareEnterBattle(stageId, simulate, formation)
  params.stageId = stageId
  params.simulate = simulate
  params.guildWarRecommendFormation = formation
  ld("Formation")
  FormationMgr.TryOpenFormationWindow(params, true)
end

function GuildWarMgr.OnBattleComplete()
  GuildWarService.GetGuildWarAllInfoReq()
end

function GuildWarMgr.IsFightCountEnough()
  local fightCnt = GuildWarData.GetGuildPlayerInfo().fightCount
  local maxFightCnt = TableData.GetConfig(70011405, "BaseFixed").int_value
  return fightCnt < maxFightCnt, fightCnt
end

function GuildWarMgr.SetFontSize(str, size)
  return string.format("[size=%d]%s[/size]", size, str)
end

return GuildWarMgr
