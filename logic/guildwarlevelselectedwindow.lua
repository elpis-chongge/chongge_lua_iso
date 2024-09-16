require("GuildBoss_BossBattleWindowByName")
local GuildWarLevelSelectedWindow = {}
local uis, contentPane, timer
local LevelItemRenderer = function(i, gcmp)
  local progressInfo = GuildWarData.GetGuildWarProgressInfo()
  local bossStates = progressInfo.bossStates
  local curStageId = progressInfo.stageId
  local allPassed = 0 == curStageId
  local chapterConf = TableData.GetConfig(progressInfo.chapterId, "BaseChapter")
  local stages = chapterConf.stages
  local latestIndex = table.keyof(stages, curStageId)
  local stageIndex = i + 1
  local stageId = stages[stageIndex]
  local stageConf = TableData.GetConfig(stageId, "BaseStage")
  local child = gcmp
  UIUtil.SetText(child:GetChild("Name"), stageConf.name and stageConf.name() or stageConf.id, "NameTxt")
  UIUtil.SetText(child:GetChild("Lock"), T(20364), "WordTxt")
  UIUtil.SetText(child:GetChild("Kill"), T(20514), "WordTxt")
  UIUtil.SetText(child:GetChild("Ing"), T(20567), "WordTxt")
  local loader = child:GetChild("PicLoader")
  loader.url = UIUtil.GetResUrl(stageConf.icon)
  if not allPassed then
    if stageIndex == latestIndex then
      local hpProgressBar = child:GetChild("HpProgressBar")
      local percent = 100
      if bossStates and _G.next(bossStates) then
        local totalMaxHp, totalHp = 0, 0
        for _, state in ipairs(bossStates) do
          totalHp = totalHp + state.hp
          totalMaxHp = totalMaxHp + state.maxHp
        end
        percent = totalHp / totalMaxHp * 100
      end
      hpProgressBar.value = percent
      local integer, frac = math.modf(percent)
      local content = frac > 0 and string.format("%.2f%%", percent) or string.format("%s%%", integer)
      UIUtil.SetText(hpProgressBar, content, "NumberTxt")
      ChangeUIController(child, "c1", 1)
    elseif latestIndex > stageIndex then
      ChangeUIController(child, "c1", 2)
    else
      ChangeUIController(child, "c1", 0)
    end
  else
    ChangeUIController(child, "c1", 2)
  end
  local monsterConf = TableData.GetConfig(stageConf.boss_id, "BaseMonster")
  UIUtil.ShowElementList(child:GetChild("ElementList"), monsterConf)
  local cmp = child:GetChild("Occupation")
  if cmp then
    if monsterConf.type then
      cmp.visible = true
      ChangeUIController(cmp, "c1", monsterConf.type - 1)
    else
      cmp.visible = false
    end
  end
  child.onClick:Set(function()
    if type(latestIndex) == "number" and stageIndex == latestIndex then
      OpenWindow(WinResConfig.GuildWarLevelDetailInfoWindow.name, nil, stageConf)
    end
  end)
end
local RefreshPanelInfo = function()
  local progressInfo = GuildWarData.GetGuildWarProgressInfo()
  local round = progressInfo.round
  uis.Main.Round.WordTxt.text = T(20502, round)
  for i = 1, 5 do
    local child = uis.Main.root:GetChild(string.format("Tips%s", i))
    LevelItemRenderer(i - 1, child)
  end
end

function GuildWarLevelSelectedWindow.ReInitData()
end

function GuildWarLevelSelectedWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildWarLevelSelectedWindow.package, WinResConfig.GuildWarLevelSelectedWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_BossBattleWindowUis(contentPane)
    GuildWarLevelSelectedWindow.UpdateInfo()
    GuildWarLevelSelectedWindow.InitBtn()
  end)
end

function GuildWarLevelSelectedWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(FEATURE_ENUM.GUILD_WAR_LEVEL_SELECTED, "BaseFeature").back_ground)
  RefreshPanelInfo()
  timer = TimerUtil.setInterval(60, -1, function()
    GuildWarService.GetGuildWarAllInfoReq()
  end)
  timer:start()
end

function GuildWarLevelSelectedWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuildWarLevelSelectedWindow.name)
  end)
  local data = TableData.GetConfig(FEATURE_ENUM.GUILD_WAR_LEVEL_SELECTED, "BaseFeature")
  local detailBtn = uis.Main.FunctionDetailsBtn
  if data and data.caption_id then
    detailBtn.visible = true
    local root = uis.Main.root
    detailBtn.onClick:Set(function()
      WindowLoadPackages[WinResConfig.GuidePicLookWindow.name] = {
        "Guide_" .. Language.curLanguage
      }
      OpenWindow(WinResConfig.GuidePicLookWindow.name, nil, data.caption_id, nil, true)
    end)
    if data.auto_open_caption and GuideData.CanShowCaption(data.id) then
      root.touchable = false
      LeanTween.delayedCall(0.25, function()
        detailBtn.onClick:Call()
        root.touchable = true
      end)
      GuideData.SaveCaptionOpen(data.id)
    end
  else
    detailBtn.visible = false
  end
end

function GuildWarLevelSelectedWindow.OnClose()
  uis = nil
  contentPane = nil
  if timer then
    timer:stop()
  end
  timer = nil
end

function GuildWarLevelSelectedWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.GuildWar.RECV_GUILD_WAR_ALL_INFO then
    RefreshPanelInfo()
  end
end

return GuildWarLevelSelectedWindow
