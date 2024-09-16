require("Message_StarOneSkillWindowByName")
local StarOneSkillWindow = {}
local uis, contentPane, msg

function StarOneSkillWindow.ReInitData()
end

function StarOneSkillWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.StarOneSkillWindow.package, WinResConfig.StarOneSkillWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_StarOneSkillWindowUis(contentPane)
    msg = bridgeObj.argTable[1]
    StarOneSkillWindow.UpdateInfo()
    StarOneSkillWindow.InitBtn()
  end)
end

function StarOneSkillWindow.UpdateInfo()
  local configData = TableData.GetConfig(msg.id, "BaseSkill")
  if configData and configData.name then
    uis.Main.BadgeOneSkill1.TitleTxt.text = configData.name()
    uis.Main.BadgeOneSkill1.PicLoader.url = UIUtil.GetResUrl(configData.icon)
    local lv = msg.lv or 1
    local skillLvData = TableData.GetConfig(configData.id * 1000 + lv, "BaseSkillLevelUp")
    if skillLvData and skillLvData.des then
      uis.Main.BadgeOneSkill1.WordTxt.text = skillLvData.des()
    end
  end
  if msg.page then
    uis.Main.BadgeOneSkill1.SkillLock.WordTxt.text = msg.page + 1
  end
  uis.Main.BadgeOneSkill1.c1Ctr.selectedIndex = msg.lv and 1 or 0
end

function StarOneSkillWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.StarOneSkillWindow.name)
  end)
end

function StarOneSkillWindow.OnClose()
  uis = nil
  contentPane = nil
  msg = nil
end

return StarOneSkillWindow
