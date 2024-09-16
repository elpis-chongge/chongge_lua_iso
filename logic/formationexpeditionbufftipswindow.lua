require("Formation_ExpeditionBuffTipsWindowByName")
local FormationExpeditionBuffTipsWindow = {}
local uis, contentPane

function FormationExpeditionBuffTipsWindow.ReInitData()
end

function FormationExpeditionBuffTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.FormationExpeditionBuffTipsWindow.package, WinResConfig.FormationExpeditionBuffTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetFormation_ExpeditionBuffTipsWindowUis(contentPane)
    local buffId = bridgeObj.argTable[1]
    FormationExpeditionBuffTipsWindow.UpdateInfo(buffId)
    FormationExpeditionBuffTipsWindow.InitBtn()
  end)
end

function FormationExpeditionBuffTipsWindow.UpdateInfo(buffId)
  local buffConf = TableData.GetConfig(buffId, "BaseSkillBuffPre")
  local buffName = type(buffConf.name) == "function" and buffConf.name() or "未配置"
  local buffDesc = "function" == type(buffConf.des) and buffConf.des() or "未配置"
  uis.Main.NameTxt.text = buffName
  uis.Main.WordTxt.text = buffDesc
end

function FormationExpeditionBuffTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.FormationExpeditionBuffTipsWindow.name)
  end)
end

function FormationExpeditionBuffTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return FormationExpeditionBuffTipsWindow
