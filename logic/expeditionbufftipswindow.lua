require("Expedition_BuffTipsWindowByName")
local ExpeditionBuffTipsWindow = {}
local uis, contentPane

function ExpeditionBuffTipsWindow.ReInitData()
end

function ExpeditionBuffTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExpeditionBuffTipsWindow.package, WinResConfig.ExpeditionBuffTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExpedition_BuffTipsWindowUis(contentPane)
    local chapterIndex = bridgeObj.argTable[1]
    ExpeditionBuffTipsWindow.UpdateInfo(chapterIndex)
    ExpeditionBuffTipsWindow.InitBtn()
  end)
end

function ExpeditionBuffTipsWindow.UpdateInfo(chapterIndex)
  local buffId = ExpeditionMgr.GetChapterBuff(chapterIndex)
  if buffId then
    local buffConf = TableData.GetConfig(buffId, "BaseSkillBuffPre")
    local buffName = type(buffConf.name) == "function" and buffConf.name() or "未配置"
    local buffDesc = "function" == type(buffConf.des) and buffConf.des() or "未配置"
    uis.Main.NameTxt.text = buffName
    uis.Main.WordTxt.text = buffDesc
  end
end

function ExpeditionBuffTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ExpeditionBuffTipsWindow.name)
  end)
end

function ExpeditionBuffTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return ExpeditionBuffTipsWindow
