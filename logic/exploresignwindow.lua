require("ExploreSign_ExploreSignWindowByName")
local ExploreSignWindow = {}
local uis, contentPane, data, activityData, signIndex, isAct, pos
local unChoose = "Assets/Art/Effects/Prefab/UI_prefab/spcheckin/FX_ui_spcheckin_unchoose.prefab"
local choose = "Assets/Art/Effects/Prefab/UI_prefab/spcheckin/FX_ui_spcheckin_choose.prefab"
local search = "Assets/Art/Effects/Prefab/UI_prefab/spcheckin/FX_ui_spcheckin_serch.prefab"
local effectIn = "Assets/Art/Effects/Prefab/UI_prefab/NewGuyCheckin/FX_ui_spcheckin_in.prefab"
local effBg = "Assets/Art/Effects/Prefab/UI_prefab/NewGuyCheckin/FX_ui_spcheckin_eff.prefab"
local showIndex

function ExploreSignWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExploreSignWindow.package, WinResConfig.ExploreSignWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExploreSign_ExploreSignWindowUis(contentPane)
    data = bridgeObj.argTable[1]
    signIndex = {}
    showIndex = 0
    ExploreSignWindow.UpdateTextDisplay()
    ExploreSignWindow.InitBtn()
    local trans = uis.Main.Map.root:GetTransition("in")
    if trans then
      trans:SetHook("Sign", ExploreSignWindow.ShowItem)
      trans:Play()
    end
  end)
end

function ExploreSignWindow.ShowItem()
  if data.isTodaySearch then
    signIndex[data.choosePos[1]] = data.dropRewards
    signIndex[data.choosePos[2]] = data.showRewards
    showIndex = data.choosePos[2]
    uis.Main.TipsWord.root.visible = false
  else
    uis.Main.TipsWord.root.visible = true
  end
  UIUtil.SetHolderCenter(uis.Main.Map.MapHolder)
  UIUtil.SetEffectToUI(effBg, uis.Main.Map.MapHolder)
  local map = uis.Main.Map
  local btn = {
    map.Place1Btn.PlaceBtn,
    map.Place2Btn.PlaceBtn,
    map.Place3Btn.PlaceBtn,
    map.Place4Btn.PlaceBtn,
    map.Place5Btn.PlaceBtn,
    map.Place6Btn.PlaceBtn,
    map.Place7Btn.PlaceBtn,
    map.Place8Btn.PlaceBtn
  }
  local animationNameList = table.randomSort({
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8
  })
  local timeIndex = 0
  for ind = 1, 8 do
    local i = animationNameList[ind]
    UIUtil.SetBtnText(btn[i]:GetChild("GetWord"), T(949), T(950))
    UIUtil.SetText(btn[i]:GetChild("SelectedWord"), T(951))
    UIUtil.SetText(btn[i]:GetChild("Searching"), T(953))
    if data.isTodaySearch then
      if signIndex[i] then
        TimerUtil.setTimeout(timeIndex * 0.08, function()
          ExploreSignWindow.ShowItemReward(btn[i], signIndex[i], showIndex == i)
          PlayUITrans(map[string.format("Place%dBtn", i)].root, "in")
        end)
        timeIndex = timeIndex + 1
      end
    else
      TimerUtil.setTimeout((ind - 1) * 0.08, function()
        UIUtil.SetEffectToUI(effectIn, btn[i]:GetChild("Effect"):GetChild("Effect1Holder"))
        PlayUITrans(map[string.format("Place%dBtn", i)].root, "in")
      end)
    end
    btn[i].onClick:Set(function()
      if data.isTodaySearch == false then
        if signIndex[i] then
          UIUtil.SetEffectToUI(unChoose, btn[i]:GetChild("Effect"):GetChild("Effect1Holder"))
          ChangeUIController(btn[i], "c2", 0)
          SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.SIGN_56_OFF)
          signIndex[i] = nil
          if 2 == table.getLen(signIndex) then
            uis.Main.c1Ctr.selectedIndex = 1
            isAct = true
          else
            uis.Main.c1Ctr.selectedIndex = 0
            isAct = false
          end
          return
        end
        local len = table.getLen(signIndex)
        if len >= 2 then
          FloatTipsUtil.ShowWarnTips(T(737))
          return
        end
        signIndex[i] = true
        ChangeUIController(btn[i], "c2", 1)
        UIUtil.SetEffectToUI(choose, btn[i]:GetChild("Effect"):GetChild("Effect1Holder"))
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.SIGN_56_ON)
        len = len + 1
        if 2 == len then
          uis.Main.c1Ctr.selectedIndex = 1
          isAct = true
        else
          uis.Main.c1Ctr.selectedIndex = 0
          isAct = false
        end
      end
    end)
  end
end

function ExploreSignWindow.UpdateTextDisplay()
  local configData = TableData.GetConfig(data.baseInfo.activityId, "BaseActivity")
  if configData then
    uis.Main.Title.NameTxt.text = configData.name()
    uis.Main.Title.SubtitleTxt.text = configData.name_english()
    uis.Main.Title.TimeTxt.text = TimeUtil.FormatDate("%m/%d %H:%M", data.baseInfo.endStamp)
    uis.Main.Title.TimeWordTxt.text = T(752)
  end
  UIUtil.SetBtnText(uis.Main.Explore.ExploreBtn, T(736))
  uis.Main.TipsWord.WordTxt.text = T(952)
end

function ExploreSignWindow.InitBtn()
  uis.Main.Explore.ExploreBtn.onClick:Set(function()
    if not data.isTodaySearch and 2 == table.getLen(signIndex) then
      pos = {}
      for i, v in pairs(signIndex) do
        table.insert(pos, i)
      end
      SignService.ActivitySearchReq(data.baseInfo.activityId, pos)
    end
  end)
  uis.Main.c1Ctr.selectedIndex = 0
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ExploreSignWindow.name)
  end)
end

function ExploreSignWindow.ShowItemReward(btn, itemTuple, show)
  if itemTuple and itemTuple[1] then
    btn:GetChild("Effect").visible = false
    UIUtil.SetIconById(btn:GetChild("ItemLoader"), itemTuple[1].itemId)
    UIUtil.SetText(btn, itemTuple[1].count, "NumberTxt")
    ChangeUIController(btn, "c2", show and 2 or 3)
    ChangeUIController(btn, "c3", 0)
  end
end

function ExploreSignWindow.ShowReward()
  signIndex[data.choosePos[1]] = data.dropRewards
  signIndex[data.choosePos[2]] = data.showRewards
  showIndex = data.choosePos[2]
  for i = 1, 8 do
    if not signIndex[i] then
      uis.Main.Map[string.format("Place%dBtn", i)].root.alpha = 0
    end
  end
  uis.Main.TipsWord.root.visible = false
  for i, v in pairs(signIndex) do
    ExploreSignWindow.ShowItemReward(uis.Main.Map[string.format("Place%dBtn", i)].PlaceBtn, v, i == showIndex)
  end
end

function ExploreSignWindow.ShowRewardEffect()
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.SIGN_56_EXPLORE)
  for i, v in pairs(signIndex) do
    local item = uis.Main.Map[string.format("Place%dBtn", i)].PlaceBtn
    ChangeUIController(item, "c3", 1)
    UIUtil.SetEffectToUI(search, item:GetChild("Effect"):GetChild("Effect1Holder"), nil, true)
  end
  LeanTween.delayedCall(1.7, function()
    if uis then
      OpenWindow(WinResConfig.ExploreSignEndWindow.name, nil, {
        reward = data.dropRewards
      })
      ExploreSignWindow.ShowReward()
    end
  end)
end

function ExploreSignWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.SignWindow.GET_REWARD then
    uis.Main.c1Ctr.selectedIndex = 0
    data.isTodaySearch = true
    data.showRewards = para.showRewards
    data.dropRewards = para.dropRewards
    data.specialRewards = para.specialRewards
    data.choosePos = pos
    SignData.activityData[data.baseInfo.activityId] = data
    ExploreSignWindow.ShowRewardEffect()
  end
end

function ExploreSignWindow.OnClose()
  if data then
    FunctionQueueUtil.SetFunEnd(tostring(data.baseInfo.activityId))
  end
  uis = nil
  contentPane = nil
  data = nil
  activityData = nil
  signIndex = nil
  isAct = nil
  showIndex = nil
end

return ExploreSignWindow
