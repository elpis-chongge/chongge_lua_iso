require("GuildBoss_DungeonInfoWindowByName")
local GuildWarLevelDetailInfoWindow = {}
local uis, contentPane, conf

function GuildWarLevelDetailInfoWindow.ReInitData()
end

function GuildWarLevelDetailInfoWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildWarLevelDetailInfoWindow.package, WinResConfig.GuildWarLevelDetailInfoWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_DungeonInfoWindowUis(contentPane)
    conf = bridgeObj.argTable[1]
    GuildWarLevelDetailInfoWindow.UpdateInfo()
    GuildWarLevelDetailInfoWindow.InitBtn()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_SHOW)
  end)
end

function GuildWarLevelDetailInfoWindow.UpdateInfo()
  local panel = uis.Main.DungeonInfoTips
  panel.NameTxt.text = conf.name and conf.name() or conf.id
  panel.TitleTxt.text = conf.name_detail and conf.name_detail() or conf.id
  panel.ExplainTitle.WordTxt.text = T(20509)
  local buff_list = conf.buff_list
  if buff_list and _G.next(buff_list) then
    panel.c1Ctr.selectedIndex = 0
    local skilllist = panel.SkillList
    
    function skilllist.itemRenderer(i, gcmp)
      local buffId = buff_list[i + 1]
      local preBuffConfig = TableData.GetConfig(tonumber(buffId), "BaseSkillBuffPre")
      if preBuffConfig then
        UIUtil.SetText(gcmp, preBuffConfig.name and preBuffConfig.name(), "NameTxt")
        UIUtil.SetText(gcmp, preBuffConfig.des and preBuffConfig.des(), "WordTxt")
      end
    end
    
    skilllist.numItems = #buff_list
  else
    panel.c1Ctr.selectedIndex = 1
    local wordlist = panel.WordList
    
    function wordlist.itemRenderer(i, gcmp)
      UIUtil.SetText(gcmp, conf.des and conf.des() or "", "WordTxt")
    end
    
    wordlist.numItems = 1
  end
  UIUtil.SetText(panel.RecommendBtn, T(20510), "WordTxt")
  UIUtil.SetText(panel.StartBtn, T(20511), "WordTxt")
  UIUtil.SetText(panel.TestBtn, T(20522), "WordTxt")
  local score = GuildWarData.GetGuildWarProgressInfo().score
  local fightCnt = GuildWarData.GetGuildPlayerInfo().fightCount
  local maxFightCnt = TableData.GetConfig(70011405, "BaseFixed").int_value
  local remainFightCnt = maxFightCnt - fightCnt
  panel.BattleNumber.WordTxt.text = T(11702, remainFightCnt, maxFightCnt)
  panel.Integral.WordTxt.text = T(20517, (conf.boss_score_ratio or 0) / 10000)
  panel.StartBtn.onClick:Set(function()
    local simulated = 1 == panel.TestBtn:GetController("button").selectedIndex
    GuildWarService.GetGuildWarCompensateFormationReq(function()
      local formations = GuildWarData.GetCompensateFormations()
      if formations and #formations > 0 then
        OpenWindow(WinResConfig.GuildWarCompensateWindow.name, nil, formations, conf.id, simulated)
      else
        if false == simulated and not GuildWarMgr.IsFightCountEnough() then
          FloatTipsUtil.ShowWarnTips(T(20516))
          return
        end
        GuildWarMgr.PrepareEnterBattle(conf.id, simulated)
      end
    end)
  end)
  panel.RecommendBtn.onClick:Set(function()
    GuildWarService.GetGuildWarRecommendFormationReq(conf.id, function()
      OpenWindow(WinResConfig.GuildWarRecommendWindow.name, nil, conf.id)
    end)
  end)
end

function GuildWarLevelDetailInfoWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuildWarLevelDetailInfoWindow.name)
  end)
end

function GuildWarLevelDetailInfoWindow.OnClose()
  uis = nil
  contentPane = nil
  conf = nil
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_CLOSE)
end

return GuildWarLevelDetailInfoWindow
