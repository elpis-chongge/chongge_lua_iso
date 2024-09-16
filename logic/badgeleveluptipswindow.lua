require("Badge_LevelUpTipsWindowByName")
local BadgeLevelUpTipsWindow = {}
local uis, contentPane, info

function BadgeLevelUpTipsWindow.ReInitData()
end

function BadgeLevelUpTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BadgeLevelUpTipsWindow.package, WinResConfig.BadgeLevelUpTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetBadge_LevelUpTipsWindowUis(contentPane)
    info = bridgeObj.argTable[1]
    BadgeLevelUpTipsWindow.UpdateInfo()
    BadgeLevelUpTipsWindow.InitBtn()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BADGE_LV_TIPS)
  end)
end

function BadgeLevelUpTipsWindow.UpdateInfo()
  local lastInfo = BadgeMgr.lastBadgeInfo
  local tips = uis.Main.LevelUpTipsContent
  tips.TitleTxt.text = T(1242)
  tips.LevelAttribute1.Level1Txt.text = T(244, lastInfo.level)
  tips.LevelAttribute1.Level2Txt.text = T(244, info.level)
  local mainAttribute = UIMgr:CreateComponent("Badge", "LevelAttribute2")
  local data = TableData.GetConfig(info.mainAttribute, "BaseBadgeAttribute")
  if data then
    ChangeUIController(mainAttribute, "c1", BadgeMgr.mainAttributeCtr[data.type])
    UIUtil.SetText(mainAttribute, BadgeData.GetAttributeNameByInfo(data.type), "NameTxt")
    UIUtil.SetText(mainAttribute, BadgeData.GetAttribute(info.attributeLevels[info.mainAttribute], info.mainAttribute, false), "Number2Txt")
    UIUtil.SetText(mainAttribute, BadgeData.GetAttribute(lastInfo.attributeLevels[lastInfo.mainAttribute], lastInfo.mainAttribute, false), "Number1Txt")
    ChangeUIController(mainAttribute, "c2", 1)
  end
  tips.AttributeList:AddChild(mainAttribute)
  local sort = BadgeMgr.viceAttributeCtr
  local newViceAttribute = {}
  for i, v in pairs(info.viceAttributes) do
    local config = TableData.GetConfig(v, "BaseBadgeAttribute")
    if config then
      table.insert(newViceAttribute, config)
    end
  end
  if #newViceAttribute > 1 then
    table.sort(newViceAttribute, function(a, b)
      return sort[a.type] < sort[b.type]
    end)
  end
  local viceAttribute
  for i = 1, #newViceAttribute do
    viceAttribute = UIMgr:CreateComponent("Badge", "LevelAttribute3")
    data = newViceAttribute[i]
    ChangeUIController(viceAttribute, "c1", sort[data.type])
    UIUtil.SetText(viceAttribute, BadgeData.GetAttributeNameByInfo(data.type), "NameTxt")
    local curAtt = BadgeData.GetAttribute(info.attributeLevels[data.id], data.id, false)
    UIUtil.SetText(viceAttribute, curAtt, "NumberTxt")
    UIUtil.SetText(viceAttribute, curAtt, "Number2Txt")
    if lastInfo.attributeLevels[data.id] == nil then
      ChangeUIController(viceAttribute, "c3", 1)
      local data = TableData.GetConfig(data.id, "BaseBadgeAttribute")
      if data then
        if 2 == data.show_type or 4 == data.show_type then
          UIUtil.SetText(viceAttribute, T(1246, 0), "Number1Txt")
        else
          UIUtil.SetText(viceAttribute, "0", "Number1Txt")
        end
        ChangeUIController(viceAttribute, "c2", 1)
      end
    else
      ChangeUIController(viceAttribute, "c3", 0)
      local lastAtt = BadgeData.GetAttribute(lastInfo.attributeLevels[data.id], data.id, false)
      if curAtt ~= lastAtt then
        ChangeUIController(viceAttribute, "c2", 1)
        UIUtil.SetText(viceAttribute, lastAtt, "Number1Txt")
      else
        ChangeUIController(viceAttribute, "c2", 0)
      end
    end
    tips.AttributeList:AddChild(viceAttribute)
  end
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Badge/FX_ui_Badge_levelup_eff.prefab", uis.Main.LevelUpTipsContent.EffectHolder)
end

function BadgeLevelUpTipsWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.BadgeLevelUpTipsWindow.name)
end

function BadgeLevelUpTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(BadgeLevelUpTipsWindow.CloseWindow)
end

function BadgeLevelUpTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  info = nil
end

return BadgeLevelUpTipsWindow
