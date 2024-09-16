require("TideDungeon_DungeonTipsWindowByName")
local TideDungeonTipsWindow = {}
local uis, contentPane, stageId, sceneType
local BuffItemRenderer = function(i, gcmp)
  local stageConf = TableData.GetConfig(stageId, "BaseStage")
  local buffId = stageConf.buff_list[i + 1]
  local conf = TableData.GetConfig(buffId, "BaseSkillBuffPre")
  local buffName = type(conf.name) == "function" and conf.name() or "未配置"
  local buffDesc = "function" == type(conf.des) and conf.des() or "未配置"
  UIUtil.SetText(gcmp, buffName, "NameTxt")
  UIUtil.SetText(gcmp, buffDesc, "WordTxt")
end

function TideDungeonTipsWindow.ReInitData()
end

function TideDungeonTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.TideDungeonTipsWindow.package, WinResConfig.TideDungeonTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    stageId = bridgeObj.argTable[1]
    sceneType = bridgeObj.argTable[2]
    uis = GetTideDungeon_DungeonTipsWindowUis(contentPane)
    TideDungeonTipsWindow.UpdateInfo()
    TideDungeonTipsWindow.InitBtn()
  end)
end

function TideDungeonTipsWindow.UpdateInfo()
  local panel = uis.Main.ExplainTips
  local buffPanel = panel.Buff
  local titlePanel = panel.Title
  local conf = TableData.GetConfig(stageId, "BaseStage")
  titlePanel.TitleTxt.text = conf.name()
  titlePanel.Word1Txt.text = T(663)
  titlePanel.Word2Txt.text = ""
  buffPanel.TitleTxt.text = T(20359)
  local bufflist = buffPanel.BuffList
  bufflist.itemRenderer = BuffItemRenderer
  local buff_list = conf.buff_list
  bufflist.numItems = buff_list and #buff_list or 0
  local startBtnText = T(20358)
  local closeBtnText = T(20273)
  UIUtil.SetBtnText(panel.SureBtn, startBtnText)
  UIUtil.SetBtnText(panel.CloseBtn, closeBtnText)
  ChangeUIController(panel.root, "c1", sceneType - 61)
end

function TideDungeonTipsWindow.InitBtn()
  uis.Main.ExplainTips.SureBtn.onClick:Set(function()
    ld("Formation")
    FormationMgr.TryOpenFormationWindow({
      stageId = stageId,
      sceneType = sceneType,
      extData = nil,
      backFunc = function()
        UIMgr:CloseWindow(WinResConfig.FormationWindow.name)
      end
    })
  end)
  uis.Main.ExplainTips.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.TideDungeonTipsWindow.name)
  end)
end

function TideDungeonTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return TideDungeonTipsWindow
