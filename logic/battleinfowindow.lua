require("ActorInfo_BattleInfoWindowByName")
local BattleInfoWindow = {}
local uis, contentPane, curSettingList
local cachedHandByKey = {}

function BattleInfoWindow.ReInitData()
end

function BattleInfoWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BattleInfoWindow.package, WinResConfig.BattleInfoWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActorInfo_BattleInfoWindowUis(contentPane)
    BattleInfoWindow.UpdateInfo()
    BattleInfoWindow.InitBtn()
  end)
end

function BattleInfoWindow.UpdateInfo()
  local BattleInfoTips = uis.Main.BattleInfoTips
  BattleInfoTips.TitleTxt.text = T(10187)
  local list = BattleInfoTips.SetTipsList
  list:RemoveChildrenToPool()
  curSettingList = {
    {
      iconIndex = 10,
      name = T(10230),
      c1Index = 0,
      tips = T(10231),
      iconName = "Battle_3",
      openTxt = T(10198),
      closeTxt = T(10199),
      key = "BATTLE_BUFF_ENABLE"
    },
    {
      iconIndex = 3,
      name = T(10200),
      c1Index = 0,
      tips = T(10201),
      iconName = "Battle_1",
      openTxt = T(10198),
      closeTxt = T(10199),
      key = "BATTLE_BLOOD_ENABLE",
      influenceKey = "BATTLE_BUFF_ENABLE"
    },
    {
      iconIndex = 4,
      name = T(10228),
      c1Index = 0,
      tips = T(10229),
      iconName = "Battle_2",
      openTxt = T(10198),
      closeTxt = T(10199),
      key = "NORMAL_HURT_NUMBER"
    },
    {
      iconIndex = 16,
      name = T(10266),
      c1Index = 0,
      tips = T(10267),
      iconName = "Battle_4",
      openTxt = T(10268),
      closeTxt = T(10269),
      key = "BATTLE_BURST_CARD_SHOW"
    },
    {
      iconIndex = 19,
      name = T(10274),
      c1Index = 0,
      tips = T(10275),
      iconName = "Battle_5",
      openTxt = T(10198),
      closeTxt = T(10199),
      key = "BATTLE_BURST_ANIM_SHOW"
    }
  }
  for i, v in ipairs(curSettingList) do
    local tips = list:AddItemFromPool()
    BattleInfoWindow.UpdateSetTips(tips, v)
  end
end

function BattleInfoWindow.UpdateSetTips(tipsHand, info, value)
  if tipsHand and info then
    require("ActorInfo_SetTipsByName")
    local tips = GetActorInfo_SetTipsUis(tipsHand)
    tips.SetIcon.c1Ctr.selectedIndex = info.iconIndex
    tips.NameTxt.text = info.name
    tips.c1Ctr.selectedIndex = info.c1Index
    tips.TipsTxt.text = info.tips
    ChangeUIController(tipsHand, "c2", 0, true)
    if info.openTxt then
      UIUtil.SetText(tips.SetSwitchBtn, info.openTxt, "OpenTxt")
    end
    if info.closeTxt then
      UIUtil.SetText(tips.SetSwitchBtn, info.closeTxt, "CloseTxt")
    end
    if info.key then
      cachedHandByKey[info.key] = tipsHand
      local switchBtn = tips.SetSwitchBtn
      SetControllerIgnoreTimeScale(switchBtn, "button", true)
      switchBtn.changeStateOnClick = false
      switchBtn.soundFmod = SOUND_EVENT_ENUM.SETTING_CHANGE
      switchBtn.onClick:Add(BattleInfoWindow.TouchSwitchBtn)
      value = value or PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM[info.key], PLAYER_PREF_DEFAULT_VALUE[info.key])
      BattleInfoWindow.UpdateSwitchBtn(switchBtn, value)
      if info.iconName then
        local icon = tips.SetIcon[info.iconName].root
        ChangeUIController(icon, "state", value, true)
      end
    end
    if info.slideKey then
      if info.key == nil or 1 == value then
        tips.VoiceSlider.grayed = false
        tips.VoiceSlider.touchable = true
      else
        tips.VoiceSlider.grayed = true
        tips.VoiceSlider.touchable = false
      end
      tips.VoiceSlider.min = 0
      tips.VoiceSlider.max = 100
      tips.VoiceSlider.value = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM[info.slideKey], PLAYER_PREF_DEFAULT_VALUE[info.slideKey])
      tips.VoiceSlider.onChanged:Set(function()
        if info.slideFunc then
          info.slideFunc(tips.VoiceSlider.valueInt)
        end
      end)
      tips.VoiceSlider.onGripTouchEnd:Set(function()
        if info.sliderEndFunc then
          info.sliderEndFunc(tips.VoiceSlider.valueInt)
        end
      end)
    end
    if info.influenceKey then
      local hand = cachedHandByKey[info.influenceKey]
      if hand then
        if 1 == value then
          ChangeUIController(hand, "c2", 0, true)
          hand.touchable = true
        else
          ChangeUIController(hand, "c2", 1, true)
          hand.touchable = false
        end
      end
    end
    if info.burstCard then
      local burstShowList = tips.BurstShow.BurstShowList
      burstShowList:RemoveChildrenToPool()
      local btnList = {
        {
          value = 1,
          text = T(10268),
          changeIconStateValue = 1
        },
        {
          value = 0,
          text = T(10269),
          changeIconStateValue = 0
        }
      }
      local curValue = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM[info.btnKey], PLAYER_PREF_DEFAULT_VALUE[info.btnKey])
      
      function burstShowList.itemRenderer(index, item)
        local configInfo = btnList[index + 1]
        item.data = {
          tips = tips,
          value = configInfo.value,
          changeIconStateValue = configInfo.value,
          info = info
        }
        UIUtil.SetBtnText(item, btnList[index + 1].text)
        item.onClick:Add(BattleInfoWindow.UpdateRatioListBtn)
        SetControllerIgnoreTimeScale(item, "button", true)
        if configInfo.value == curValue then
          item.selected = true
        end
      end
      
      burstShowList.numItems = #btnList
      if info.iconName then
        local icon = tips.SetIcon[info.iconName].root
        ChangeUIController(icon, "state", curValue, true)
      end
    end
  end
end

function BattleInfoWindow.UpdateRatioListBtn(eventContext)
  local data = eventContext.sender.data
  local info = data.info
  local key = info.btnKey
  local curValue = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM[key], PLAYER_PREF_DEFAULT_VALUE[key])
  local targetValue = data.value
  if targetValue ~= curValue then
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM[key], targetValue)
    local tips = data.tips
    local changeIconStateValue = data.changeIconStateValue
    if tips and info.iconName then
      local icon = tips.SetIcon[info.iconName].root
      ChangeUIController(icon, "state", changeIconStateValue, true)
    end
  end
end

function BattleInfoWindow.UpdateSwitchBtn(btn, value)
  btn.selected = 1 == value
end

function BattleInfoWindow.TouchSwitchBtn(eventContext)
  local list = uis.Main.BattleInfoTips.SetTipsList
  local item = eventContext.sender.parent
  local childIndex = list:GetChildIndex(item)
  local itemIndex = list:ChildIndexToItemIndex(childIndex)
  local info = curSettingList[itemIndex + 1]
  local value = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM[info.key], PLAYER_PREF_DEFAULT_VALUE[info.key])
  if 1 == value then
    value = 0
  else
    value = 1
  end
  PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM[info.key], value)
  BattleInfoWindow.UpdateSetTips(item, info, value)
  if info.func then
    info.func()
  end
end

function BattleInfoWindow.InitBtn()
  uis.Main.BattleInfoTips.CloseBtn.onClick:Set(BattleInfoWindow.Quit)
  uis.Main.TouchScreenBtn.onClick:Set(BattleInfoWindow.Quit)
end

function BattleInfoWindow.Quit()
  BattleHurtNum.UpdateNormalHurtVisible()
  BattleScene.UpdateHeadInfo()
  UIMgr:CloseWindow(WinResConfig.BattleInfoWindow.name)
end

function BattleInfoWindow.OnClose()
  uis = nil
  cachedHandByKey = {}
  curSettingList = nil
  contentPane = nil
end

return BattleInfoWindow
