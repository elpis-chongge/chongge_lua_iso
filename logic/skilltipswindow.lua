require("Message_SkillTipsWindowByName")
local SkillTipsWindow = {}
local uis, contentPane, msg

function SkillTipsWindow.ReInitData()
end

function SkillTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.SkillTipsWindow.package, WinResConfig.SkillTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_SkillTipsWindowUis(contentPane)
    msg = bridgeObj.argTable[1]
    SkillTipsWindow.InitBtn()
    SkillTipsWindow.Init()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_SHOW)
  end)
end

function SkillTipsWindow.Init()
  local skillData = TableData.GetConfig(msg.id, "BaseSkill")
  local lv = msg.lv or 1
  local id = msg.id * 1000 + lv
  local skillLvData = TableData.GetConfig(id, "BaseSkillLevelUp")
  if skillData and skillLvData then
    if skillData.cd then
      ChangeController(uis.Main.SkillTips1.c1Ctr, 1)
      uis.Main.SkillTips1.Info.WordTxt.text = T(1121, skillData.cd)
    else
      ChangeController(uis.Main.SkillTips1.c1Ctr, 0)
    end
    
    function uis.Main.SkillTips1.UnitList.itemRenderer(i, item)
      UIUtil.SetText(item, skillLvData.des(), "WordTxt")
    end
    
    uis.Main.SkillTips1.UnitList.numItems = 1
    uis.Main.SkillTips1.TitleTxt.text = skillData.name()
    if skillData.type == SKILL_TYPE_ENUM.LEADER then
      ChangeController(uis.Main.SkillTips1.c2Ctr, 1)
    else
      if msg.lv then
        uis.Main.SkillTips1.LevelTxt.text = T(244, msg.lv)
      end
      ChangeController(uis.Main.SkillTips1.c2Ctr, 0)
    end
    uis.Main.SkillTips1.SkillType.NameTxt.text = CardData.GetSkillTypeName(skillData.type)
    uis.Main.SkillTips1.Sikll.IconLoader.url = UIUtil.GetResUrl(skillData.icon)
  end
end

function SkillTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_CLOSE)
    UIMgr:CloseWindow(WinResConfig.SkillTipsWindow.name)
  end)
end

function SkillTipsWindow.OnShown()
end

function SkillTipsWindow.OnHide()
end

function SkillTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

function SkillTipsWindow.HandleMessage(msgId, para)
end

return SkillTipsWindow
