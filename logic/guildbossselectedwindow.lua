require("GuildBoss_BossBattleWindowByName")
local GuildBossSelectedWindow = {}
local uis, contentPane
local RefreshPanelInfo = function()
  local progressInfo = GuildWarData.GetGuildWarProgressInfo()
  local round = progressInfo.round
  uis.Main.Round.WordTxt.text = round
  local list = uis.Main.BossList
  local bossStates = progressInfo.bossStates
  local curStageId = progressInfo.stageId
  local allPassed = 0 == curStageId
  local chapterConf = TableData.GetConfig(progressInfo.chapterId, "BaseChapter")
  local stages = chapterConf.stages
  local latestIndex = table.keyof(stages, curStageId)
  
  function list.itemRenderer(i, gcmp)
    local stageIndex = i + 1
    local state = bossStates[stageIndex]
    local stageId = stages[stageIndex]
    local stageConf = TableData.GetConfig(stageId, "BaseStage")
    local child = gcmp:GetChild("Tips")
    child.alpha = 0
    PlayUITrans(gcmp, "up", nil, i * 0.08)
    UIUtil.SetText(child:GetChild("Name"), stageConf.name and stageConf.name() or stageConf.id, "NameTxt")
    local loader = child:GetChild("PicLoader")
    loader.url = UIUtil.GetResUrl(stageConf.icon)
    if not allPassed then
      if stageIndex == latestIndex then
        ChangeUIController(child, "c1", 1)
      elseif stageIndex < latestIndex then
        ChangeUIController(child, "c1", 2)
      else
        ChangeUIController(child, "c1", 0)
      end
    else
      ChangeUIController(child, "c1", 2)
    end
    local hpProgressBar = child:GetChild("HpProgressBar")
    local percent = state.hp / state.maxHp * 100
    hpProgressBar.value = percent
    UIUtil.SetText(hpProgressBar, string.format("%s%%", math.floor(percent)), "NumberTxt")
    local conf = CardData.GetBaseConfig(state.id)
    UIUtil.ShowElementList(child:GetChild("ElementList"), conf)
    local cmp = child:GetChild("Occupation")
    if cmp then
      ChangeUIController(cmp, "c1", conf.type - 1)
    end
    child.onClick:Set(function()
      if type(latestIndex) == "number" and stageIndex == latestIndex then
        OpenWindow(WinResConfig.GuildBossDetailInfoWindow.name, nil, stageConf)
      end
    end)
  end
  
  list.numItems = bossStates and #bossStates or 0
end

function GuildBossSelectedWindow.ReInitData()
end

function GuildBossSelectedWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildBossSelectedWindow.package, WinResConfig.GuildBossSelectedWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_BossBattleWindowUis(contentPane)
    GuildBossSelectedWindow.UpdateInfo()
    GuildBossSelectedWindow.InitBtn()
  end)
end

function GuildBossSelectedWindow.UpdateInfo()
end

function GuildBossSelectedWindow.InitBtn()
end

function GuildBossSelectedWindow.OnClose()
  uis = nil
  contentPane = nil
end

return GuildBossSelectedWindow
