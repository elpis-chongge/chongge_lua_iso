require("RogueBuild01_SweepWindowByName")
local RogueSweepWindow = {}
local uis, contentPane, sweepResult

function RogueSweepWindow.ReInitData()
end

function RogueSweepWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueSweepWindow.package, WinResConfig.RogueSweepWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_SweepWindowUis(contentPane)
    sweepResult = bridgeObj.argTable[1]
    RogueSweepWindow.UpdateInfo()
    RogueSweepWindow.InitBtn()
  end)
end

function RogueSweepWindow.UpdateInfo()
  local exp = sweepResult.gainExp
  local talent = sweepResult.gainTalent
  local themeInfo = sweepResult.themeInfo
  UIUtil.SetText(uis.Main.SweepTips.CloseBtn, T(302), "NameTxt")
  local panel = uis.Main.SweepTips
  panel.TitleTxt.text = T(20496)
  panel.WordTxt.text = T(20497)
  panel.NumberTxt.text = themeInfo.topScore
  panel.Exp.LevelTxt.text = T(1303, themeInfo.level)
  panel.Exp.WordTxt.text = T(20405)
  panel.Exp.MaxTxt.text = T(20479)
  local levelConf = TableData.GetConfig(themeInfo.themeId * 1000 + themeInfo.level, "BaseRogueLevel")
  local threshold = levelConf.next_exp
  panel.Exp.ExpProgressBar.value = themeInfo.exp / threshold * 100
  panel.Exp.NumberTxt.text = string.format("+%s", exp)
  local curPhase, maxPhase = 0, 0
  local curLevel = themeInfo.level
  local buffer = {}
  local tbl = TableData.GetTable("BaseRogueLevel")
  for i, v in pairs(tbl) do
    local tempId = (v.id - v.level) / 1000
    if tempId == themeInfo.themeId then
      local phase = v.unlock_phase
      if not buffer[phase] then
        buffer[phase] = {minLevel = 999, maxLevel = -1}
      end
      buffer[phase].minLevel = math.min(v.level, buffer[phase].minLevel)
      buffer[phase].maxLevel = math.max(v.level, buffer[phase].maxLevel)
      if v.title then
        buffer[phase].title = v.title()
      end
    end
  end
  local unlockedLevel = RogueData.GetRogueInfo().themeUnlockLevel
  for phase, v in pairs(buffer) do
    if curLevel >= v.minLevel and curLevel <= v.maxLevel then
      curPhase = phase
    end
    maxPhase = math.max(maxPhase, phase)
  end
  local upgradable = curLevel < unlockedLevel
  local noRewards = not upgradable and curLevel >= buffer[curPhase].maxLevel
  panel.Exp.c1Ctr.selectedIndex = upgradable and 0 or 1
  panel.Exp.c2Ctr.selectedIndex = noRewards and 1 or 0
  if noRewards then
    local title = buffer[curPhase].title
    local content = T(20473, title)
    panel.Exp.TipsTxt.text = content
  end
  panel.c1Ctr.selectedIndex = talent > 0 and 0 or 1
  panel.Talent.WordTxt.text = T(20406)
  panel.Talent.NumberTxt.text = string.format("+%s", talent)
end

function RogueSweepWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RogueSweepWindow.name)
  end)
  uis.Main.SweepTips.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RogueSweepWindow.name)
  end)
end

function RogueSweepWindow.OnClose()
  uis = nil
  contentPane = nil
end

return RogueSweepWindow
