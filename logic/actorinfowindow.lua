require("ActorInfo_ActorInfoWindowByName")
local ActorInfoWindow = {}
local uis, contentPane, _tab_list, curSettingList, curSettingType, openSettingType, jumpTb
local cachedHandByKey = {}

function ActorInfoWindow.ReInitData()
end

function ActorInfoWindow.RefreshWindow()
  curSettingType = nil
  openSettingType = openSettingType or SETTING_TYPE_ENUM.ACCOUNT
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.HOME_SETTING)
  ActorInfoWindow.InitTabListData()
  ActorInfoWindow.UpdateInfo()
  ActorInfoWindow.InitBtn()
  local curBgm = SoundUtil.GetCurMusic()
  if curBgm then
    SoundManager:SetEventParameter(curBgm, "music_menu_main", 1)
  end
end

function ActorInfoWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActorInfoWindow.package, WinResConfig.ActorInfoWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActorInfo_ActorInfoWindowUis(contentPane)
    ActorInfoWindow.RefreshWindow()
  end)
end

function ActorInfoWindow.InitTabListData()
  _tab_list = {
    {
      title = T(10232),
      c1Index = 3,
      subTitle = T(10233),
      type = SETTING_TYPE_ENUM.ACCOUNT,
      func = ActorInfoWindow.UpdateAccount
    },
    {
      title = T(10175),
      c1Index = 0,
      subTitle = T(10176),
      type = SETTING_TYPE_ENUM.GAME,
      func = ActorInfoWindow.UpdateGame
    },
    {
      title = T(10177),
      c1Index = 1,
      subTitle = T(10178),
      type = SETTING_TYPE_ENUM.BATTLE,
      func = ActorInfoWindow.UpdateBattle
    },
    {
      title = T(10179),
      c1Index = 2,
      subTitle = T(10180),
      type = SETTING_TYPE_ENUM.SOUND,
      func = ActorInfoWindow.UpdateSound
    }
  }
end

function ActorInfoWindow.UpdateInfo()
  ActorInfoWindow.UpdateTabList()
end

function ActorInfoWindow.UpdateTabList()
  local list = uis.Main.TabRegion.TabList
  list:RemoveChildrenToPool()
  local selectTab
  for i, v in ipairs(_tab_list) do
    local tab = list:AddItemFromPool()
    tab.soundFmod = SOUND_EVENT_ENUM.TAB_TAG1
    ActorInfoWindow.UpdateTab(tab, v)
    ChangeUIController(tab, "c1", v.c1Index)
    if v.type == openSettingType then
      selectTab = tab
    end
  end
  selectTab.onClick:Call()
end

function ActorInfoWindow.UpdateTab(tab, info)
  if tab and info then
    ChangeUIController(tab, "c1", info.c1_Index)
    UIUtil.SetBtnText(tab, info.title, info.subTitle)
    tab.onClick:Add(ActorInfoWindow.TouchTab)
  end
end

function ActorInfoWindow.TouchTab(eventContext)
  local list = uis.Main.TabRegion.TabList
  local item = eventContext.sender
  local childIndex = list:GetChildIndex(item)
  local itemIndex = list:ChildIndexToItemIndex(childIndex)
  local tabInfo = _tab_list[itemIndex + 1]
  if tabInfo.type == curSettingType then
    return
  end
  local GearXY = CS.FairyGUI.GearXY
  GearXY.disableAllTweenEffect = true
  curSettingType = tabInfo.type
  ActorInfoWindow.UpdatePanel(tabInfo)
  GearXY.disableAllTweenEffect = false
  openSettingType = curSettingType
end

function ActorInfoWindow.UpdatePanel(tabInfo)
  ChangeUIController(uis.Main.root, "c1", tabInfo.c1_Index)
  if tabInfo.func then
    tabInfo.func()
  end
end

function ActorInfoWindow.UpdateAccount()
  print("账号设置")
  local list = uis.Main.GameSet.SetUI.SetTipsList
  list:RemoveChildrenToPool()
  if SDKManager.UseSDK == true then
    local sdk = SDKManager:GetSDKChannel()
    if "Bilibili" == sdk then
      curSettingList = {
        {
          iconIndex = 12,
          name = T(10237),
          c1Index = 4,
          tips = T(10238),
          iconName = "Account_2",
          btnTxt = T(10239),
          clickFunc = SettingUtil.ChangeAccount
        },
        {
          iconIndex = 13,
          name = T(10240),
          c1Index = 4,
          tips = T(10241),
          iconName = "Account_3",
          btnTxt = T(10242),
          clickFunc = SettingUtil.CustomService
        },
        {
          iconIndex = 15,
          name = T(10276),
          c1Index = 4,
          tips = T(10277),
          iconName = "Account_4",
          btnTxt = T(10276),
          clickFunc = SettingUtil.CloseAccount
        }
      }
    elseif "PnSDK_CN" == sdk then
      curSettingList = {
        {
          iconIndex = 15,
          name = T(10263),
          c1Index = 4,
          tips = T(10264),
          iconName = "Account_1",
          btnTxt = T(10265),
          clickFunc = SettingUtil.AccountCenter
        },
        {
          iconIndex = 12,
          name = T(10237),
          c1Index = 4,
          tips = T(10238),
          iconName = "Account_2",
          btnTxt = T(10239),
          clickFunc = SettingUtil.ChangeAccount
        },
        {
          iconIndex = 13,
          name = T(10240),
          c1Index = 4,
          tips = T(10241),
          iconName = "Account_3",
          btnTxt = T(10242),
          clickFunc = SettingUtil.CustomService
        }
      }
    end
  else
    curSettingList = {
      {
        iconIndex = 15,
        name = T(10263),
        c1Index = 4,
        tips = T(10264),
        iconName = "Account_1",
        btnTxt = T(10265),
        clickFunc = SettingUtil.AccountCenter
      },
      {
        iconIndex = 12,
        name = T(10237),
        c1Index = 4,
        tips = T(10238),
        iconName = "Account_2",
        btnTxt = T(10239),
        clickFunc = SettingUtil.ChangeAccount
      },
      {
        iconIndex = 13,
        name = T(10240),
        c1Index = 4,
        tips = T(10241),
        iconName = "Account_3",
        btnTxt = T(10242),
        clickFunc = SettingUtil.CustomService
      }
    }
  end
  ActorInfoWindow.UpdateTipsList()
end

function ActorInfoWindow.UpdateGame()
  print("游戏设置")
  local list = uis.Main.GameSet.SetUI.SetTipsList
  list:RemoveChildrenToPool()
  curSettingList = {
    {
      iconIndex = 1,
      name = T(10192),
      c1Index = 0,
      tips = T(10193),
      iconName = "Game_2",
      openTxt = T(10196),
      closeTxt = T(10197),
      key = "UI_HIGH_FPS_ENABLE",
      func = SettingUtil.UpdateFPS
    },
    {
      iconIndex = 2,
      name = T(10194),
      c1Index = 0,
      tips = T(10195),
      iconName = "Game_3",
      openTxt = T(10198),
      closeTxt = T(10199),
      key = "ANNOUNCEMENT_ALWAYS_ENABLE"
    },
    {
      iconIndex = 8,
      name = T(10209),
      c1Index = 2,
      tips = T(10210),
      btnTxt = T(10211),
      slideKey = "SCREEN_ADAPT_RATIO",
      slideFunc = function(ratio)
        SettingUtil.UpdateScreenAdaptRatio(ratio)
      end,
      clickFunc = SettingUtil.ResetScreenAdaptRatio
    },
    {
      iconIndex = 9,
      name = T(10222),
      c1Index = 3,
      tips = T(10227),
      weather = true,
      btnKey = "WEATHER_SHOW_TYPE",
      func = SettingUtil.UpdateWeatherType
    },
    {
      iconIndex = 20,
      name = T(11620),
      c1Index = 0,
      tips = T(11621),
      iconName = "Game_9",
      openTxt = T(10198),
      closeTxt = T(10199),
      key = "SHOW_SPINE_LIGHT"
    },
    {
      iconIndex = 14,
      name = T(10261),
      c1Index = 0,
      tips = T(10262),
      iconName = "Game_6",
      openTxt = T(10198),
      closeTxt = T(10199),
      key = "HOME_ROLE_TEXT_ENABLE"
    },
    {
      iconIndex = 18,
      name = T(10272),
      c1Index = 5,
      tips = T(10273),
      language = true,
      btnKey = PLAYER_PREF_ENUM.LANGUAGE_VOICE,
      defaultValue = PLAYER_PREF_DEFAULT_VALUE.LANGUAGE_VOICE
    }
  }
  ActorInfoWindow.UpdateTipsList()
end

function ActorInfoWindow.UpdateBattle()
  print("战斗设置")
  local list = uis.Main.GameSet.SetUI.SetTipsList
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
  ActorInfoWindow.UpdateTipsList()
end

function ActorInfoWindow.UpdateSound()
  print("声音设置")
  cachedHandByKey = {}
  local list = uis.Main.GameSet.SetUI.SetTipsList
  list:RemoveChildrenToPool()
  curSettingList = {
    {
      iconIndex = 5,
      name = T(10206),
      c1Index = 1,
      iconName = "Voice_1",
      openTxt = T(10198),
      closeTxt = T(10199),
      key = "SFX_ENABLE",
      func = SettingUtil.UpdateSfx,
      slideKey = "SFX_VOLUME",
      slideFunc = function(volume)
        SettingUtil.UpdateSfxVolume(volume)
      end,
      sliderEndFunc = function(volume)
        SettingUtil.UpdateSfxVolume(volume, true)
      end
    },
    {
      iconIndex = 6,
      name = T(10207),
      c1Index = 1,
      iconName = "Voice_2",
      openTxt = T(10198),
      closeTxt = T(10199),
      key = "MUSIC_ENABLE",
      func = SettingUtil.UpdateMusic,
      slideKey = "MUSIC_VOLUME",
      slideFunc = function(volume)
        SettingUtil.UpdateMusicVolume(volume)
      end,
      sliderEndFunc = function(volume)
        SettingUtil.UpdateMusicVolume(volume, true)
      end
    },
    {
      iconIndex = 7,
      name = T(10208),
      c1Index = 1,
      iconName = "Voice_3",
      openTxt = T(10198),
      closeTxt = T(10199),
      key = "VOICE_ENABLE",
      func = SettingUtil.UpdateVoice,
      slideKey = "VOICE_VOLUME",
      slideFunc = function(volume)
        SettingUtil.UpdateVoiceVolume(volume)
      end,
      sliderEndFunc = function(volume)
        SettingUtil.UpdateVoiceVolume(volume, true)
      end
    }
  }
  ActorInfoWindow.UpdateTipsList()
end

function ActorInfoWindow.UpdateTipsList()
  if nil == curSettingList then
    return
  end
  local list = uis.Main.GameSet.SetUI.SetTipsList
  for i, v in ipairs(curSettingList) do
    local tips = list:AddItemFromPool()
    ActorInfoWindow.UpdateSetTips(tips, v)
  end
end

function ActorInfoWindow.UpdateSetTips(tipsHand, info, value)
  if tipsHand and info then
    require("ActorInfo_SetTipsByName")
    local tips = GetActorInfo_SetTipsUis(tipsHand)
    tips.SetIcon.c1Ctr.selectedIndex = info.iconIndex
    tips.NameTxt.text = info.name
    tips.c1Ctr.selectedIndex = info.c1Index
    tips.TipsTxt.text = info.tips
    ChangeUIController(tipsHand, "c2", 0)
    if info.openTxt then
      UIUtil.SetText(tips.SetSwitchBtn, info.openTxt, "OpenTxt")
    end
    if info.closeTxt then
      UIUtil.SetText(tips.SetSwitchBtn, info.closeTxt, "CloseTxt")
    end
    if info.key then
      cachedHandByKey[info.key] = tipsHand
      tips.SetSwitchBtn.changeStateOnClick = false
      tips.SetSwitchBtn.soundFmod = SOUND_EVENT_ENUM.SETTING_CHANGE
      tips.SetSwitchBtn.onClick:Add(ActorInfoWindow.TouchSwitchBtn)
      value = value or PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM[info.key], PLAYER_PREF_DEFAULT_VALUE[info.key])
      ActorInfoWindow.UpdateSwitchBtn(tips.SetSwitchBtn, value)
      if info.iconName then
        local icon = tips.SetIcon[info.iconName].root
        ChangeUIController(icon, "state", value)
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
          ChangeUIController(hand, "c2", 0)
          hand.touchable = true
        else
          ChangeUIController(hand, "c2", 1)
          hand.touchable = false
        end
      end
    end
    if info.clickFunc then
      if info.btnTxt then
        UIUtil.SetText(tips.AdaptBtn, info.btnTxt)
      end
      tips.AdaptBtn.onClick:Set(function()
        info.clickFunc()
        ActorInfoWindow.UpdateSetTips(tipsHand, info)
      end)
    end
    if info.weather then
      local weather = tips.Weather
      weather.c1Ctr.selectedIndex = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM[info.btnKey], PLAYER_PREF_DEFAULT_VALUE[info.btnKey])
      local btnList = {
        {
          btn = weather.AutoBtn,
          index = 0,
          text = T(10223)
        },
        {
          btn = weather.DayBtn,
          index = 1,
          text = T(10224)
        },
        {
          btn = weather.DuskBtn,
          index = 2,
          text = T(10225)
        },
        {
          btn = weather.NightBtn,
          index = 3,
          text = T(10226)
        }
      }
      for i, v in ipairs(btnList) do
        UIUtil.SetBtnText(v.btn, v.text)
        v.btn.onClick:Set(function()
          if info.func then
            info.func(v.index)
          end
        end)
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
        item.onClick:Add(ActorInfoWindow.UpdateRatioListBtn)
        if configInfo.value == curValue then
          item.selected = true
        end
      end
      
      burstShowList.numItems = #btnList
      if info.iconName then
        local icon = tips.SetIcon[info.iconName].root
        ChangeUIController(icon, "state", curValue)
      end
    end
    if info.language then
      local languageArray
      if info.btnKey == PLAYER_PREF_ENUM.LANGUAGE then
        languageArray = ListToTable(LocalizationManager:GetSupportLanguageList())
      elseif info.btnKey == PLAYER_PREF_ENUM.LANGUAGE_VOICE then
        languageArray = ListToTable(LocalizationManager:GetSupportLanguageVoiceList())
      end
      local languageList = tips.Language.LanguageList
      languageList:RemoveChildrenToPool()
      
      function languageList.itemRenderer(index, item)
        local languageConfig = languageArray[index + 1]
        UIUtil.SetBtnText(item, T(languageConfig.luaTextId))
        item.data = {languageConfig = languageConfig, info = info}
        item.onClick:Add(ActorInfoWindow.UpdateLanguageListBtn)
        if info.btnKey == PLAYER_PREF_ENUM.LANGUAGE and LocalizationManager.curLanguage == languageConfig.language or info.btnKey == PLAYER_PREF_ENUM.LANGUAGE_VOICE and LocalizationManager.curLanguageVoice == languageConfig.language then
          item.selected = true
        end
      end
      
      languageList.numItems = #languageArray
    end
  end
end

function ActorInfoWindow.UpdateLanguageListBtn(eventContext)
  local data = eventContext.sender.data
  local info = data.info
  local key = info.btnKey
  local defaultValue = info.defaultValue
  local curValue = PlayerPrefsUtil.GetString(key, defaultValue)
  local languageConfig = data.languageConfig
  if languageConfig.languageFlag ~= curValue then
    PlayerPrefsUtil.SetString(key, languageConfig.languageFlag)
    if key == PLAYER_PREF_ENUM.LANGUAGE then
      LocalizationManager:ChangeLanguage(languageConfig.language)
      Language.UpdateLanguage(languageConfig.languageFlag)
      ActorInfoWindow.RefreshWindow()
      UIMgr:SendBroadcastMessage(WindowMsgEnum.Common.E_MSG_CHANGE_LANGUAGE)
    elseif key == PLAYER_PREF_ENUM.LANGUAGE_VOICE then
      LocalizationManager:ChangeLanguageVoice(languageConfig.language)
      Language.UpdateLanguageVoice(languageConfig.languageFlag)
    end
  end
end

function ActorInfoWindow.UpdateRatioListBtn(eventContext)
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
      ChangeUIController(icon, "state", changeIconStateValue)
    end
  end
end

function ActorInfoWindow.UpdateSwitchBtn(btn, value)
  btn.selected = 1 == value
end

function ActorInfoWindow.TouchSwitchBtn(eventContext)
  local list = uis.Main.GameSet.SetUI.SetTipsList
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
  ActorInfoWindow.UpdateSetTips(item, info, value)
  if info.func then
    info.func()
  end
end

function ActorInfoWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ActorInfoWindow.name, uis.Main.CurrencyReturn)
end

function ActorInfoWindow.OnShown()
end

function ActorInfoWindow.OnHide()
end

function ActorInfoWindow.OnClose()
  local curBgm = SoundUtil.GetCurMusic()
  if curBgm then
    SoundManager:SetEventParameter(curBgm, "music_menu_main", 0)
  end
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  cachedHandByKey = {}
  uis = nil
  contentPane = nil
  curSettingType = nil
  openSettingType = nil
  curSettingList = nil
end

function ActorInfoWindow.HandleMessage(msgId, para)
end

return ActorInfoWindow
