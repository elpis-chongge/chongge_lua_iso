require("RaidBoss_RankChangeWindowByName")
local RaidBossRankChangeWindow = {}
local uis, contentPane, rankUpInfo

function RaidBossRankChangeWindow.ReInitData()
end

function RaidBossRankChangeWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RaidBossRankChangeWindow.package, WinResConfig.RaidBossRankChangeWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    rankUpInfo = bridgeObj.argTable[1]
    uis = GetRaidBoss_RankChangeWindowUis(contentPane)
    RaidBossRankChangeWindow.UpdateInfo()
    RaidBossRankChangeWindow.InitBtn()
  end)
end

function RaidBossRankChangeWindow.UpdateInfo()
  local panel = uis.Main.RankChangeContent
  panel.TitleTxt.text = T(20296)
  local rankStr
  if rankUpInfo.curRankRatio > 0 then
    rankStr = string.format("%s%%", math.floor(100 * (rankUpInfo.curRankRatio / 10000)))
  else
    rankStr = rankUpInfo.curRank
  end
  panel.ChangeNumber.RankTxt.text = T(20298, rankStr)
  local up = rankUpInfo.upRank
  if up < 0 then
    panel.ChangeNumber.ChangeTxt.visible = false
  end
  panel.ChangeNumber.ChangeTxt.text = T(20299, up)
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_fz_rkup")
  local stageId
  if type(rankUpInfo.highScoreDiff) == "number" and rankUpInfo.highScoreDiff > 0 then
    stageId = RaidBossData.GetLevelIdByDifficult(rankUpInfo.highScoreDiff)
  end
  if type(stageId) ~= "number" or RaidBossMgr.IsHardestLevel(stageId) then
    panel.ChangeRecord.RecordTxt.text = T(20297, string.formatNum(rankUpInfo.highScore, 3))
  else
    local conf = TableData.GetConfig(stageId, "BaseStage")
    panel.ChangeRecord.RecordTxt.text = T(20352, string.format("%s%s", T(20288), conf.name_detail()))
  end
  uis.Main.RankChangeContent.root.opaque = false
end

function RaidBossRankChangeWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RaidBossRankChangeWindow.name)
  end)
end

function RaidBossRankChangeWindow.OnClose()
  uis = nil
  contentPane = nil
  rankUpInfo = nil
end

return RaidBossRankChangeWindow
