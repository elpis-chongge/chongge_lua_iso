require("Badge_BadgeWindowByName")
require("Badge_PartsByName")
local BadgeWindow = {}
local uis, contentPane, jumpTb, curTypePartData, selectBadgeData, isPlayAnim, timeIndex, playAnim, homePartData, showFirstUid, wearBadgeList, cardId, lvUpItem, spendItemData, costLvMoney, longSpeed, tempLv, tempExp, maxLv, upDataId, curMaxLvExp, tatalMaxExp, tweener, lvTween, addAttr, upAttr, totalMoney, mainAddRoot, lvUpItemCost, costMoneyTxt, costGoldRoot, costMoney, curBadgeInfo, upInfoTips, animTime, reverseSort, tempSortUid, badgeEffEct, partBtn, partInfoRoot, maskTexture, lastEffUid, changeEffect
local starColor = {
  [1] = {
    r = 73,
    g = 191,
    b = 96,
    a = 0,
    intensity = 2
  },
  [2] = {
    r = 26,
    g = 113,
    b = 191,
    a = 0,
    intensity = 2.5
  },
  [3] = {
    r = 70,
    g = 25,
    b = 191,
    a = 0,
    intensity = 2.5
  },
  [4] = {
    r = 191,
    g = 38,
    b = 0,
    a = 0,
    intensity = 2.5
  }
}
local defaultColor = {
  r = 0,
  g = 0,
  b = 0,
  a = 0,
  intensity = 0
}
local lightEffect, playCardHeadSound, playWearEffect, recommendWear

function BadgeWindow.ReInitData()
end

function BadgeWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BadgeWindow.package, WinResConfig.BadgeWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    reverseSort = false
    cardId = bridgeObj.argTable[1]
    BadgeData.InitScreeningData()
    BadgeData.InitSortData()
    lastEffUid, changeEffect = {}, {}
    uis = GetBadge_BadgeWindowUis(contentPane)
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.HOME_BADGE)
    maskTexture = ResourceManager.LoadTexture("Assets/Art/TextureSingle/UI/badge_head_mask.png")
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Rolesmask/FX_UI_rolesmask_back.prefab", uis.Main.BackGround.BackGroundHolder)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Rolesmask/FX_UI_rolesmask_front.prefab", uis.Main.Shade2Holder)
    lightEffect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Badge/FX_ui_badge_light.prefab", uis.Main.EffectHolder)
    BadgeWindow.LoadPartEffect()
    BadgeWindow.UpdateInfo()
    BadgeWindow.InitBtn()
  end)
end

function BadgeWindow.InitRedDot()
end

function BadgeWindow.InitFixedData()
  lvUpItem = {}
  local str = TableData.GetConfig(70010036, "BaseFixed").array_value
  if str then
    local arr = Split(str, "|")
    for i = 1, #arr do
      lvUpItem[i] = tonumber(arr[i])
    end
  end
end

function BadgeWindow.UpdateInfo()
  BadgeWindow.IintCard()
  BadgeWindow.InitFixedData()
end

function BadgeWindow.LoadPartEffect()
  local path = {
    "ui_badge_1",
    "ui_badge_2",
    "ui_badge_3",
    "ui_badge_di",
    "ui_badge_suipian"
  }
  local holder = {
    uis.Main.EffectHolder2,
    uis.Main.EffectHolder3,
    uis.Main.EffectHolder4,
    uis.Main.Shade1Holder,
    uis.Main.EffectHolder1,
    uis.Main.EffectDistortHolder
  }
  badgeEffEct = {}
  partInfoRoot = {}
  uis.Main.EmptyEffect.root.touchable = true
  for i = 1, 5 do
    badgeEffEct[i] = UIUtil.SetEffectToUI(string.format("Assets/Art/Models/UI_spine/prefab/%s.prefab", path[i]), holder[i], Const.DefaultShowSpineScale)
    if i < 4 then
      local ponit = badgeEffEct[i].transform:Find("point_badge")
      local uiPanel = ponit.gameObject:GetOrAddComponent(typeof(FairyGUI.UIPanel))
      local ui = uiPanel.ui
      local scale = Const.DefaultUIScale / ponit.localScale.x * ui.scaleX / Const.DefaultShowSpineScale
      ui:SetScale(scale, scale)
      ui.visible = false
      local tempBtn = BadgeWindow.GetPartBtn(i)
      partInfoRoot[i] = GetBadge_PartsUis(tempBtn)
      partInfoRoot[i].c2Ctr.selectedIndex = 1
      uis.Main.EmptyEffect.root:AddChild(tempBtn)
      partInfoRoot[i].root.displayObject.gameObject.transform.parent = ponit
      partInfoRoot[i].root.displayObject.gameObject.transform.localPosition = ui.displayObject.gameObject.transform.localPosition
      partInfoRoot[i].root.displayObject.gameObject.transform.localRotation = ui.displayObject.gameObject.transform.localRotation
      partInfoRoot[i].root.displayObject.gameObject.transform.localScale = ui.displayObject.gameObject.transform.localScale
    end
  end
  BadgeWindow.SetSpineEffectAnimation("idle", true, nil, 0)
end

function BadgeWindow.SetSpineEffectAnimation(animName, loop, callBack, track, from)
  local layer = track or 1
  for i = 1, 5 do
    if string.isEmptyOrNil(from) == false then
      SkeletonAnimationUtil.SetMix(badgeEffEct[i], from, animName, 0)
    end
    SkeletonAnimationUtil.SetAnimation(badgeEffEct[i], layer, animName, loop, 0, function()
      if callBack then
        callBack()
      end
    end)
  end
end

function BadgeWindow.GetPartBtn(index)
  if nil == partBtn then
    partBtn = {}
  end
  if nil == partBtn[index] then
    partBtn[index] = UIMgr:CreateObject("Badge", "Parts")
  end
  ChangeUIController(partBtn[index], "c3", index - 1)
  return partBtn[index]
end

function BadgeWindow.IintCard()
  local list = uis.Main.HomePage.CardList
  local cardData = CardData.GetSortCardList()
  local toIndex
  if cardId then
    for i = 1, #cardData do
      if cardData[i].cardId == cardId then
        toIndex = i - 1
        break
      end
    end
  end
  local isPlayAnim = true
  local index = 0
  list:SetVirtual()
  list.selectedIndex = -1
  
  function list.itemRenderer(i, item)
    ChangeUIController(item, "c1", 0)
    local cardConfig = TableData.GetConfig(cardData[i + 1].cardId, "BaseCard")
    local headFrame = item:GetChild("HeadFrame")
    local levelTxt = headFrame:GetChild("LevelTxt")
    local lvId = cardConfig.grow_model_id * 1000 + cardData[i + 1].level
    local lvData = TableData.GetConfig(lvId, "BaseCardLevelUp")
    levelTxt.text = T(10041, lvData.level_show)
    local fashionConfig = TableData.GetConfig(cardData[i + 1].fashionId, "BaseFashion")
    local loader = headFrame:GetChild("HeadFrameBg"):GetChild("PicLoader")
    loader.url = UIUtil.GetResUrl(fashionConfig.head_icon_rect)
    if nil ~= maskTexture then
      loader:SetMaskTexture(maskTexture)
    end
    ChangeUIController(headFrame, "c1", cardConfig.star - 1)
    local occupation = headFrame:GetChild("Occupation")
    ChangeUIController(occupation, "c1", cardConfig.type - 1)
    ChangeUIController(headFrame:GetChild("CardBreach"), "c1", cardData[i + 1].quality)
    local starList = headFrame:GetChild("StarList")
    if starList then
      UIUtil.ShowStarList(starList, cardData[i + 1], cardConfig)
    end
    BadgeWindow.ShowCardWarnMask(headFrame, cardData[i + 1].cardId)
    local elementList = headFrame:GetChild("ElementList")
    UIUtil.ShowElementList(elementList, cardConfig)
    item.onClick:Set(function()
      if list.selectedIndex ~= i then
        list.selectedIndex = i
        cardId = cardData[i + 1].cardId
        UIMgr:SetWindowArgs(WinResConfig.CardDetailsWindow.name, {cardId})
        BadgeMgr.curCardId = cardId
        UIUtil.SetCardShowSpineAutoAlpha(cardData[i + 1].fashionId, uis.Main.CardShow.CardShowLoader, uis.Main.CardShow.CardShowHolder, nil, nil, 0.2)
        BadgeWindow.CardItemClick()
      end
    end)
    if -1 == list.selectedIndex then
      if cardId then
        if cardId == cardConfig.id then
          item.onClick:Call()
        end
      elseif 0 == i then
        item.onClick:Call()
      end
    end
    if isPlayAnim and (nil == toIndex or i >= toIndex - 3) then
      headFrame.alpha = 0
      PlayUITrans(item, "up", nil, index * Const.listSpeed)
      index = index + 1
    end
  end
  
  list.numItems = #cardData
  if toIndex then
    toIndex = math.min(toIndex + 4, #cardData - 1)
    list:ScrollToView(toIndex)
  end
  isPlayAnim = nil
  index = nil
end

function BadgeWindow.ShowCardWarnMask(maskRoot, wearCardId)
  local cardInfo = CardData.GetCardDataById(wearCardId)
  local bol = {}
  if cardInfo then
    local info, teamBadge
    for i, v in ipairs(cardInfo.wearBadgeUids) do
      info = ActorData.GetBadgeInfoByUid(v)
      if info then
        teamBadge = TableData.GetConfig(info.badgeId, "BaseBadge")
        if teamBadge then
          bol[teamBadge.type] = true
        end
      end
    end
  end
  for i = 1, 3 do
    ChangeUIController(maskRoot:GetChild("Mark" .. i), "c1", bol[i] and 1 or 0)
  end
  local cardList = CardData.GetSortCardList()
  if LevelIsWithTheRange(70011108) and PowerRankIsWithTheRange(70011107, wearCardId, cardList) and table.getLen(bol) < 3 and BadgeWindow.CheckHave(bol) then
    maskRoot:GetChild("Red").visible = true
  else
    maskRoot:GetChild("Red").visible = false
  end
end

function BadgeWindow.CheckHave(findType)
  local all = ActorData.GetAllBadge()
  local teamBadge
  for i, v in pairs(all) do
    if 0 == v.wearCardId then
      teamBadge = TableData.GetConfig(v.badgeId, "BaseBadge")
      if teamBadge and not findType[teamBadge.type] then
        return true
      end
    end
  end
end

function BadgeWindow.InitHomePartData(cardInfo)
  homePartData = {}
  for i, v in ipairs(cardInfo.wearBadgeUids) do
    local info = ActorData.GetBadgeInfoByUid(v)
    if info then
      local teamBadge = TableData.GetConfig(info.badgeId, "BaseBadge")
      if teamBadge then
        homePartData[teamBadge.type] = {data = teamBadge, info = info}
      end
    end
  end
end

function BadgeWindow.CardItemClick()
  local cardInfo = CardData.GetCardDataById(cardId)
  if cardInfo then
    PlayUITransToComplete(uis.Main.BadgeDetailsLevelUp.BadgeDetails.root, "out")
    BadgeWindow.InitHomePartData(cardInfo)
    BadgeWindow.InitPartInfo(function(i)
      selectBadgeData = nil
      ChangeController(uis.Main.BadgeDetailsLevelUp.BadgeDetails.WearBadgeContainer.TabRegion.c1Ctr, i - 1)
      BadgeWindow.SetSpineEffectAnimation(string.format("change_%s", i), false)
      local callBack = function()
        if uis then
          local info = uis.Main.BadgeDetailsLevelUp.BadgeDetails
          PlayUITrans(info.root, "in")
          PlayUITrans(uis.Main.BadgeDetailsLevelUp.root, "in")
          BadgeWindow.SetTouchable(false)
        end
      end
      if 1 == i then
        partInfoRoot[3].root:TweenFade(0, 0.22):OnComplete(function()
          callBack()
        end)
        partInfoRoot[2].root:TweenFade(0, 0.4)
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BADGE_LEFT_RIGHT_ON)
      elseif 2 == i then
        partInfoRoot[1].root:TweenFade(0, 0.25)
        partInfoRoot[3].root:TweenFade(0, 0.25):OnComplete(callBack)
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BADGE_MIDDLE_ON)
      elseif 3 == i then
        partInfoRoot[1].root:TweenFade(0, 0.22):OnComplete(function()
          callBack()
        end)
        partInfoRoot[2].root:TweenFade(0, 0.4)
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BADGE_RIGHT_LEFT_ON)
      end
      if 0 == uis.Main.c1Ctr.selectedIndex then
        BadgeWindow.InitCurrencyReturn(FEATURE_ENUM.BADGE_DETAILS)
      end
      ChangeController(uis.Main.c1Ctr, 1)
      BadgeWindow.ChangePage(i)
    end, 1)
  end
  BadgeWindow.UpdateAutoWearState()
end

function BadgeWindow.InitPartInfo(itemOnClick, page)
  for i = 1, #partInfoRoot do
    if homePartData[i] then
      partInfoRoot[i].IconLoader.url = UIUtil.GetResUrl(homePartData[i].data.icon)
      BadgeMgr.ShowLevel(partInfoRoot[i].Level.LevelTxt, homePartData[i].info.level)
      if page then
        partInfoRoot[i].Level.root.alpha = 1
      end
      if lastEffUid[i] and lastEffUid[i] ~= homePartData[i].info.badgeUid then
        BadgeWindow.PlayWearEffect(i)
      end
      lastEffUid[i] = homePartData[i].info.badgeUid
      ChangeController(partInfoRoot[i].c1Ctr, 1)
      local colorData = starColor[homePartData[i].data.star]
      if colorData then
        LuaUtil.ChangeBadgeColorProperty(badgeEffEct[i], "_EmissionColor", colorData.r, colorData.g, colorData.b, colorData.a, colorData.intensity)
      end
    else
      partInfoRoot[i].IconLoader.url = ""
      LuaUtil.ChangeBadgeColorProperty(badgeEffEct[i], "_EmissionColor", defaultColor.r, defaultColor.g, defaultColor.b, defaultColor.a, defaultColor.intensity)
      lastEffUid[i] = 0
      ChangeController(partInfoRoot[i].c1Ctr, 0)
    end
    if itemOnClick then
      partInfoRoot[i].TouchBtn.onClick:Set(function()
        itemOnClick(i)
        partInfoRoot[i].Level.root.alpha = 0
      end)
      uis.Main.GuideBtn.onClick:Set(function()
        itemOnClick(1)
        partInfoRoot[i].Level.root.alpha = 0
      end)
    end
  end
end

function BadgeWindow.WearBadge(badgeUid)
  local btn = uis.Main.BadgeDetailsLevelUp.BadgeDetails.DetailsInfo.DownBtn
  UIUtil.SetText(btn, T(1233), "NameTxt")
  btn.onClick:Set(function()
    if selectBadgeData then
      local targetInfo = ActorData.GetBadgeInfoByUid(badgeUid)
      if 0 ~= targetInfo.wearCardId then
        OpenWindow(WinResConfig.BadgeExchangeWindow.name, nil, cardId, badgeUid, showFirstUid)
      else
        BadgeService.WearBadgeReq(cardId, {badgeUid})
      end
    end
  end)
end

function BadgeWindow.TakeoffBadge(badgeUid)
  local btn = uis.Main.BadgeDetailsLevelUp.BadgeDetails.DetailsInfo.DownBtn
  UIUtil.SetText(btn, T(1192), "NameTxt")
  btn.onClick:Set(function()
    BadgeService.TakeoffBadgeReq(cardId, badgeUid)
  end)
end

function BadgeWindow.ReverseData(data)
  local team
  local new = table.reverseTable(data)
  for i, v in pairs(new) do
    if v.info.badgeUid == showFirstUid and 1 ~= i then
      team = SimpleCopy(v)
      table.remove(new, i)
      break
    end
  end
  if team then
    table.insert(new, 1, team)
  end
  return new
end

function BadgeWindow.ShowSortBtnName()
  local info = uis.Main.BadgeDetailsLevelUp.BadgeDetails
  if BadgeData.sortType == BADGE_SORT_TYPE_ENUM.STAR then
    UIUtil.SetText(info.WearBadgeContainer.ChoiceSort.ChoiceSortBtn, T(1217), "NameTxt")
  elseif BadgeData.sortType == BADGE_SORT_TYPE_ENUM.LEVEL then
    UIUtil.SetText(info.WearBadgeContainer.ChoiceSort.ChoiceSortBtn, T(1230), "NameTxt")
  end
end

function BadgeWindow.ChangePage(page)
  local info = uis.Main.BadgeDetailsLevelUp.BadgeDetails
  UIUtil.SetText(info.WearBadgeContainer.ChoiceBtn, T(1193), "NameTxt")
  info.WearBadgeContainer.ChoiceBtn.onClick:Set(function()
    OpenWindow(WinResConfig.BadgeScreenWindow.name)
  end)
  BadgeWindow.ShowSortBtnName()
  info.WearBadgeContainer.ChoiceSort.ChoiceSortBtn.onClick:Set(function()
    OpenWindow(WinResConfig.BadgeFilterSortWindow.name)
  end)
  wearBadgeList = info.WearBadgeContainer.BadgeList
  wearBadgeList:SetVirtual()
  wearBadgeList.itemRenderer = BadgeWindow.PartListItem
  reverseSort = info.WearBadgeContainer.ChoiceSort.SortBtn.selected
  info.WearBadgeContainer.ChoiceSort.SortBtn.onClick:Set(function()
    reverseSort = info.WearBadgeContainer.ChoiceSort.SortBtn.selected
    BadgeWindow.StopAnim()
    timeIndex = 0
    curTypePartData = BadgeWindow.ReverseData(curTypePartData)
    local bol
    if selectBadgeData and tempSortUid then
      for i = 1, #curTypePartData do
        if curTypePartData[i].info.badgeUid == tempSortUid then
          wearBadgeList.selectedIndex = i - 1
          bol = true
        end
      end
    end
    wearBadgeList.numItems = #curTypePartData
    if bol then
      wearBadgeList:ScrollToView(wearBadgeList.selectedIndex)
    end
  end)
  local lastIndex = 0
  local lastAnimName = ""
  for i = 1, 3 do
    local btn = info.WearBadgeContainer.TabRegion[string.format("Tab%dBtn", i)]
    if btn then
      ChangeUIController(btn, "c1", i - 1)
      btn.onClick:Set(function()
        if i == lastIndex then
          return
        end
        BadgeWindow.StopAnim()
        wearBadgeList.selectedIndex = -1
        wearBadgeList.numItems = 0
        isPlayAnim = true
        timeIndex = 0
        showFirstUid = BadgeWindow.GetWearBadgeIdByType(i)
        partInfoRoot[i].Level.root.alpha = 0
        if nil == showFirstUid then
          local tempPage = uis.Main.BadgeDetailsLevelUp.BadgeDetails.WearBadgeContainer.TabRegion.c1Ctr.selectedIndex + 1
          ChangeController(partInfoRoot[tempPage].c1Ctr, 0)
          ChangeController(uis.Main.BadgeDetailsLevelUp.BadgeDetails.DetailsInfo.c1Ctr, 0)
          ChangeController(info.c1Ctr, 0)
          info.DetailsInfo.ContrastBtn.selected = false
          UIUtil.SetText(info.DetailsInfo.ContrastBtn, T(1189), "NameTxt")
        end
        if 0 ~= lastIndex then
          BadgeWindow.SetSpineEffectAnimation(string.format("slip%s_%s", lastIndex, i), false, nil, nil, lastAnimName)
          partInfoRoot[lastIndex].root:TweenFade(0, 0.15):SetDelay(0.1)
          lastAnimName = string.format("slip%s_%s", lastIndex, i)
          if lastIndex < i then
            SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BADGE_RIGHT_LEFT_ON)
          else
            SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BADGE_LEFT_RIGHT_ON)
          end
        end
        BadgeWindow.GetClearNew()
        if BadgeData.IsScreen() then
          curTypePartData = BadgeData.GetDefaultScreeningResult(i, showFirstUid, reverseSort)
        else
          curTypePartData = BadgeData.GetBadgeByPart(i, showFirstUid, reverseSort)
        end
        wearBadgeList.numItems = #curTypePartData
        isPlayAnim = nil
        if 0 == #curTypePartData then
          BadgeWindow.ShowDetailsInfo()
          uis.Main.BadgeDetailsLevelUp.PartsInfo.root.visible = false
        else
          uis.Main.BadgeDetailsLevelUp.PartsInfo.root.visible = true
        end
        partInfoRoot[i].root:TweenFade(1, 0.1)
        lastIndex = i
      end)
    end
    if i == page then
      btn.onClick:Call()
    end
  end
end

function BadgeWindow.GetClearNew()
  local new = {}
  if curTypePartData then
    for i, v in pairs(curTypePartData) do
      if v.info and v.info.isNew then
        table.insert(new, v.info.badgeUid)
      end
    end
  end
  if #new > 0 then
    BadgeService.ClearBadgeNewTagReq(new, false)
  end
end

function BadgeWindow.ShowDetailsInfo(partData, oldPartData)
  local info = uis.Main.BadgeDetailsLevelUp.BadgeDetails
  if nil == partData then
    ChangeController(info.DetailsInfo.c1Ctr, 0)
    return
  end
  local badgeInfo = partData.info
  local badgeData = partData.data
  BadgeMgr.ShowBadgeTextInfo(info.DetailsInfo, badgeData, badgeInfo)
  if oldPartData then
    local oldBadgeInfo = oldPartData.info
    local oldBadgeData = oldPartData.data
    local showContrast = function()
      local selected = info.DetailsInfo.ContrastBtn.selected
      if selected and oldPartData then
        BadgeMgr.ShowBadgeTextInfo(info.ContrastTips, oldBadgeData, oldBadgeInfo)
        if oldBadgeInfo.wearCardId > 0 then
          BadgeMgr.ShowHead(info.ContrastTips.ContrastUser.HeadShow.root, oldBadgeInfo.wearCardId)
          ChangeController(info.ContrastTips.c1Ctr, 1)
        else
          ChangeController(info.ContrastTips.c1Ctr, 0)
        end
      end
      ChangeController(info.c1Ctr, selected and 1 or 0)
      UIUtil.SetText(info.DetailsInfo.ContrastBtn, selected and T(1190) or T(1189), "NameTxt")
    end
    info.DetailsInfo.ContrastBtn.onClick:Set(showContrast)
    showContrast()
    if badgeInfo.badgeUid ~= oldBadgeInfo.badgeUid then
      BadgeWindow.WearBadge(badgeInfo.badgeUid)
    else
      BadgeWindow.TakeoffBadge({
        oldBadgeInfo.badgeUid
      })
    end
    ChangeController(uis.Main.BadgeDetailsLevelUp.BadgeDetails.DetailsInfo.c2Ctr, 1)
  else
    ChangeController(uis.Main.BadgeDetailsLevelUp.BadgeDetails.DetailsInfo.c2Ctr, 0)
    BadgeWindow.WearBadge(badgeInfo.badgeUid)
  end
  ChangeController(info.DetailsInfo.c1Ctr, 1)
  UIUtil.SetText(info.DetailsInfo.LeveUpBtn, T(1191), "NameTxt")
  info.DetailsInfo.LeveUpBtn.onClick:Set(function()
    BadgeWindow.OpenLevelTips(partData)
    BadgeWindow.InitCurrencyReturn(FEATURE_ENUM.BADGE_LV_UP)
    ChangeController(uis.Main.BadgeDetailsLevelUp.c1Ctr, 1)
    PlayUITrans(uis.Main.BadgeDetailsLevelUp.BadgeLevelUp.root, "in")
  end)
end

function BadgeWindow.PartListItem(i, icon)
  local data = curTypePartData[i + 1].data
  local info = curTypePartData[i + 1].info
  BadgeMgr.ShowBadgeItem(icon, data, info)
  icon.onClick:Set(function()
    if i ~= wearBadgeList.selectedIndex then
      selectBadgeData = curTypePartData[i + 1]
      tempSortUid = info.badgeUid
      BadgeWindow.UpdateCurPart(data, info)
      BadgeWindow.ShowDetailsInfo(selectBadgeData, homePartData[data.type])
      wearBadgeList.selectedIndex = i
      ChangeUIController(icon, "new", 0)
      if curTypePartData[i + 1].info.isNew then
        curTypePartData[i + 1].info.isNew = false
        BadgeService.ClearBadgeNewTagReq({
          info.badgeUid
        }, false, function()
          ActorData.UpdateBadgeNew({
            info.badgeUid
          })
        end)
      end
    end
  end)
  if isPlayAnim and (tempSortUid and info.badgeUid == tempSortUid or 0 == i) then
    playCardHeadSound = nil
    icon.onClick:Call()
    playCardHeadSound = true
  end
  if isPlayAnim and timeIndex < 25 and i > 0 then
    icon.alpha = 0
    animTime[icon] = PlayUITrans(icon, "up", function()
      icon.alpha = 1
      animTime[icon] = nil
    end, timeIndex * 0.025)
    timeIndex = timeIndex + 1
  end
end

function BadgeWindow.PlayChangeEffect(i)
  if nil == changeEffect[i] then
    local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Badge/FX_ui_badge_reflash.prefab")
    UIUtil.SetObjectToUI(effect, partInfoRoot[i].EffectHolder)
    changeEffect[i] = effect
  end
  LuaUtil.PlayEffect(changeEffect[i])
end

function BadgeWindow.PlayWearEffect(i)
  if badgeEffEct[i] then
    local effect = LuaUtil.FindChild(badgeEffEct[i], "change_light")
    if effect then
      LuaUtil.PlayEffect(effect.gameObject)
    end
  end
end

function BadgeWindow.UpdateCurPart(data, info)
  if nil == data or nil == info then
    return
  end
  local tempPage = uis.Main.BadgeDetailsLevelUp.BadgeDetails.WearBadgeContainer.TabRegion.c1Ctr.selectedIndex + 1
  partInfoRoot[tempPage].IconLoader.url = UIUtil.GetResUrl(data.icon)
  ChangeController(partInfoRoot[tempPage].c1Ctr, 1)
  local colorData = starColor[data.star]
  if colorData then
    LuaUtil.ChangeBadgeColorProperty(badgeEffEct[data.type], "_EmissionColor", colorData.r, colorData.g, colorData.b, colorData.a, colorData.intensity)
  end
  if lastEffUid[data.type] and lastEffUid[data.type] ~= info.badgeUid then
    BadgeWindow.PlayChangeEffect(tempPage)
    lastEffUid[data.type] = info.badgeUid
  end
  local partInfo = uis.Main.BadgeDetailsLevelUp.PartsInfo
  partInfo.root.touchable = true
  partInfo.PartsCard.root.onClick:Clear()
  BadgeMgr.ShowPartInfo(partInfo, data.star, info.level)
  if 0 ~= info.wearCardId then
    local cardInfo = CardData.GetCardDataById(info.wearCardId)
    if cardInfo then
      UIUtil.SetHeadByFaceId(cardInfo.fashionId, partInfo.PartsCard.PartsCardBg.PicLoader, HEAD_ICON_TYPE_ENUM.RECT)
      ChangeController(partInfo.c1Ctr, 0)
      if playCardHeadSound then
        UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Badge/FX_bradge_peace_char_change.prefab", partInfo.PartsCard.root:GetChild("EffectHolder"), nil, true)
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BADGE_CARD_HEAD)
      end
      BadgeWindow.ShowAttribute(cardInfo, partInfo.PartsCard.AttributeList)
      partInfo.PartsCard.root.onClick:Set(function()
        OpenWindow(WinResConfig.BadgeCardInfoWindow.name, nil, cardInfo)
      end)
    else
      ChangeController(partInfo.c1Ctr, 1)
    end
  else
    ChangeController(partInfo.c1Ctr, 1)
  end
  ChangeController(partInfo.c2Ctr, 0 == uis.Main.BadgeDetailsLevelUp.c1Ctr.selectedIndex and 1 or 0)
  UIUtil.SetText(partInfo.RecommendWearBtn, T(1392), "WordTxt")
  partInfo.RecommendWearBtn.onClick:Set(function()
    OpenWindow(WinResConfig.BadgeRecommendWindow.name, nil, cardId)
  end)
end

function BadgeWindow.ShowAttribute(cardInfo, attList)
  local badgeAtt = CardData.GetBadgeAddAttribute(cardInfo.cardId)
  local cardAtt = cardInfo.attributes
  local attributeNun = {
    ProtoEnum.ATTR_ID.ATK,
    ProtoEnum.ATTR_ID.DEF,
    ProtoEnum.ATTR_ID.MAX_HP
  }
  
  function attList.itemRenderer(i, att)
    ChangeUIController(att, "c1", i)
    local id = attributeNun[i + 1]
    local cardAttribute = cardAtt[id] or 0
    local attributeBadge = badgeAtt[id] or 0
    UIUtil.SetText(att, cardAttribute + attributeBadge, "NumberTxt")
  end
  
  attList.numItems = #attributeNun
end

function BadgeWindow.StopAnim()
  if animTime then
    for i, v in pairs(animTime) do
      v:Stop(true, true)
    end
  end
  animTime = {}
end

function BadgeWindow.GetWearBadgeIdByType(type)
  if homePartData[type] and homePartData[type].info then
    return homePartData[type].info.badgeUid
  end
end

local longStop

function BadgeWindow.InitLvUp(badgeInfo, badgeData)
  curBadgeInfo = badgeInfo
  spendItemData = {}
  lvUpItemCost = {}
  totalMoney = ActorData.GetItemCount(COMMON_ITEM_ID.GAME_COIN)
  tempLv = badgeInfo.level
  tempExp = badgeInfo.exp
  maxLv = badgeData.level_max
  costMoney = 0
  addAttr = 0
  upAttr = 0
  upDataId = badgeData.grow_model_id * 1000 + badgeInfo.level
  tatalMaxExp = BadgeWindow.GetTatalMaxExp()
  ChangeController(uis.Main.BadgeDetailsLevelUp.PartsInfo.c2Ctr, 0)
  local levelUp = uis.Main.BadgeDetailsLevelUp.BadgeLevelUp
  levelUp.LevelUpList.AssetsTips.NumberTxt.text = UIUtil.GetFormatCount(ActorData.GetItemCount(COMMON_ITEM_ID.GAME_COIN))
  UIUtil.SetIconById(levelUp.LevelUpList.AssetsTips.IconLoader, COMMON_ITEM_ID.GAME_COIN, true)
  ChangeController(levelUp.LevelUpList.AssetsTips.c1Ctr, 1)
  levelUp.LevelUpList.Word.WordTxt.text = T(1550)
  local tempPage = uis.Main.BadgeDetailsLevelUp.BadgeDetails.WearBadgeContainer.TabRegion.c1Ctr.selectedIndex + 1
  BadgeMgr.ShowLevel(uis.Main.BadgeDetailsLevelUp.PartsInfo.LevelTxt, badgeInfo.level)
  local cardInfo = CardData.GetCardDataById(cardId)
  BadgeWindow.ShowAttribute(cardInfo, uis.Main.BadgeDetailsLevelUp.PartsInfo.PartsCard.AttributeList)
  mainAddRoot.Number1Txt.text = BadgeData.GetAttribute(curBadgeInfo.level, curBadgeInfo.mainAttribute)
  BadgeMgr.ShowBadgeTextInfo(levelUp.LevelUpInfo, badgeData, badgeInfo, true)
  ChangeController(mainAddRoot.c2Ctr, 0)
  BadgeWindow.ShowAddLvUpTips()
  upInfoTips = levelUp.LevelUpInfo.LevelUpInfo1
  if badgeInfo.level >= badgeData.level_max then
    upInfoTips.ExpTxt.text = T(405)
    BadgeMgr.ShowLevel(upInfoTips.LevelTxt, badgeInfo.level)
    upInfoTips.ExpProgressBar.value = upInfoTips.ExpProgressBar.max
    levelUp.LevelUpList.Max.WordTxt.text = T(405)
    ChangeController(levelUp.LevelUpList.c1Ctr, 1)
  else
    local upData = TableData.GetConfig(upDataId, "BaseBadgeLevelUp")
    if upData then
      costLvMoney = upData.cost_money
      upInfoTips.ExpProgressBar.max = upData.next_exp
      upInfoTips.ExpProgressBar.value = badgeInfo.exp
      upInfoTips.ExpAddProgressBar.max = upData.next_exp
      upInfoTips.ExpAddProgressBar.value = badgeInfo.exp
      curMaxLvExp = upData.next_exp
      ChangeController(upInfoTips.c1Ctr, 0)
    end
    BadgeMgr.ShowLevel(upInfoTips.LevelTxt, badgeInfo.level)
    upInfoTips.ExpTxt.text = T(610, curBadgeInfo.exp, curMaxLvExp)
    ChangeController(levelUp.LevelUpList.c1Ctr, 0)
  end
  costGoldRoot.visible = costMoney > 0
end

function BadgeWindow.OpenLevelTips(partData)
  if partData then
    local listTips = uis.Main.BadgeDetailsLevelUp.BadgeLevelUp.LevelUpList
    costGoldRoot = listTips.UpGoldSpend.root
    mainAddRoot = uis.Main.BadgeDetailsLevelUp.BadgeLevelUp.LevelUpInfo.DetailsInfo2.DetailsInfo2_1
    BadgeWindow.InitLvUp(partData.info, partData.data)
    UIUtil.SetIconById(listTips.UpGoldSpend.PicLoader, COMMON_ITEM_ID.GAME_COIN)
    listTips.UpGoldSpend.WordTxt.text = T(1239)
    costMoneyTxt = listTips.UpGoldSpend.NumberTxt
    UIUtil.SetText(listTips.ClearBtn, T(1235))
    listTips.ClearBtn.onClick:Set(function()
      if curBadgeInfo.level >= maxLv then
        return
      end
      spendItemData = {}
      BadgeWindow.ShowLvUpItem()
      BadgeWindow.UpdateCostGold()
    end)
    UIUtil.SetText(listTips.UpBtn, T(1236))
    listTips.UpBtn.onClick:Set(function()
      local items = BadgeWindow.GetLevelUpItem()
      if table.getLen(items) > 0 then
        BadgeMgr.lastBadgeInfo = SimpleCopy(curBadgeInfo)
        BadgeService.LevelupBadgeReq(curBadgeInfo.badgeUid, items)
      end
    end)
    BadgeWindow.ShowLvUpItem()
  end
end

function BadgeWindow.ShowLvUpItem()
  local tips = uis.Main.BadgeDetailsLevelUp.BadgeLevelUp.LevelUpList
  
  function tips.BadgeList.itemRenderer(i, item)
    local itemData = TableData.GetConfig(lvUpItem[i + 1], "BaseItem")
    local count = ActorData.GetItemCount(itemData.id)
    local addBtn = item:GetChild("LevelUpItemBtn")
    addBtn:GetChild("IconLoader").url = UIUtil.GetResUrl(itemData.icon)
    UIUtil.SetText(addBtn, T(1238, count), "NumberTxt")
    UIUtil.SetText(addBtn, itemData.name(), "NameTxt")
    lvUpItemCost[itemData.id] = tonumber(itemData.effect_value)
    local reduceBtn = item:GetChild("LevelUpItemReduceBtn")
    ChangeUIController(addBtn, "c1", itemData.quality)
    addBtn.soundFmod = SOUND_EVENT_ENUM.BADGE_LV_ITEM
    addBtn.onClick:Set(function()
      if spendItemData[itemData.id] == nil then
        spendItemData[itemData.id] = 0
      end
      if tempLv >= maxLv then
        FloatTipsUtil.ShowWarnTips(T(79))
        return
      end
      if spendItemData[itemData.id] + 1 > count then
        FloatTipsUtil.ShowWarnTips(T(81, itemData.name()))
        return
      end
      local goldValue = lvUpItemCost[itemData.id] * costLvMoney + costMoney
      if goldValue > totalMoney then
        FloatTipsUtil.ShowWarnTips(T(80))
        return
      end
      spendItemData[itemData.id] = spendItemData[itemData.id] + 1
      UIUtil.SetText(addBtn, T(1237, count, spendItemData[itemData.id]), "NumberTxt")
      BadgeWindow.UpdateCostGold()
      reduceBtn.visible = spendItemData[itemData.id] and spendItemData[itemData.id] > 0 and true or false
    end)
    reduceBtn.onClick:Set(function()
      if spendItemData[itemData.id] == nil or 0 == spendItemData[itemData.id] then
        return
      end
      spendItemData[itemData.id] = math.max(spendItemData[itemData.id] - 1, 0)
      if 0 == spendItemData[itemData.id] then
        UIUtil.SetText(addBtn, T(1238, count), "NumberTxt")
      else
        UIUtil.SetText(addBtn, T(1237, count, spendItemData[itemData.id]), "NumberTxt")
      end
      BadgeWindow.UpdateCostGold()
      reduceBtn.visible = spendItemData[itemData.id] and spendItemData[itemData.id] > 0 and true or false
    end)
    reduceBtn.visible = spendItemData[itemData.id] and spendItemData[itemData.id] > 0 and true or false
    local spNum = 1
    local speed = 2
    local gesture = BadgeWindow.GetGesture(addBtn)
    gesture.onAction:Set(function()
      if longStop then
        return
      end
      if spNum > 2 then
        longSpeed = longSpeed + speed
        spNum = 1
      end
      if spendItemData[itemData.id] == nil then
        spendItemData[itemData.id] = 0
      end
      if tempLv >= maxLv then
        FloatTipsUtil.ShowWarnTips(T(79))
        longStop = true
        return
      end
      if spendItemData[itemData.id] + longSpeed > count then
        if count > spendItemData[itemData.id] then
          longSpeed = count - spendItemData[itemData.id]
        else
          FloatTipsUtil.ShowWarnTips(T(81, itemData.name()))
          longStop = true
          return
        end
      end
      local curExp = 0
      for key, vv in pairs(spendItemData) do
        curExp = curExp + lvUpItemCost[key] * vv
      end
      curExp = tatalMaxExp - curExp
      if curExp > 0 then
        local addItemNum = math.ceil(curExp / lvUpItemCost[itemData.id])
        longSpeed = addItemNum > longSpeed and longSpeed or addItemNum
        local goldValue = longSpeed * lvUpItemCost[itemData.id] + costMoney
        if goldValue > totalMoney then
          FloatTipsUtil.ShowWarnTips(T(80))
          longStop = true
          local otherGold = 0
          for costId, vv in pairs(spendItemData) do
            if costId ~= itemData.id then
              otherGold = otherGold + lvUpItemCost[costId] * vv * costLvMoney
            end
          end
          spendItemData[itemData.id] = math.floor((totalMoney - otherGold) / lvUpItemCost[itemData.id])
          UIUtil.SetText(addBtn, T(1237, count, spendItemData[itemData.id]), "NumberTxt")
          BadgeWindow.UpdateCostGold()
          return
        end
        spendItemData[itemData.id] = spendItemData[itemData.id] + longSpeed
        UIUtil.SetText(addBtn, T(1237, count, spendItemData[itemData.id]), "NumberTxt")
        BadgeWindow.UpdateCostGold()
        spNum = spNum + 1
      else
        UIUtil.SetText(addBtn, T(1237, count, spendItemData[itemData.id]), "NumberTxt")
        BadgeWindow.UpdateCostGold()
        longStop = true
      end
      reduceBtn.visible = spendItemData[itemData.id] and spendItemData[itemData.id] > 0 and true or false
    end)
    gesture.onBegin:Set(function()
      longStop = nil
      longSpeed = 1
      spNum = 1
    end)
    gesture.onEnd:Set(function()
      longSpeed = 1
      spNum = 1
    end)
    local gestureReduce = BadgeWindow.GetGesture(reduceBtn)
    gestureReduce.onAction:Set(function()
      if longStop then
        return
      end
      if spNum > 2 then
        longSpeed = longSpeed + speed
        spNum = 1
      end
      spNum = spNum + 1
      if spendItemData[itemData.id] == nil then
        return
      end
      spendItemData[itemData.id] = math.max(spendItemData[itemData.id] - longSpeed, 0)
      if 0 == spendItemData[itemData.id] then
        UIUtil.SetText(addBtn, T(1238, count), "NumberTxt")
        longStop = true
      else
        UIUtil.SetText(addBtn, T(1237, count, spendItemData[itemData.id]), "NumberTxt")
      end
      BadgeWindow.UpdateCostGold()
      reduceBtn.visible = spendItemData[itemData.id] and spendItemData[itemData.id] > 0 and true or false
    end)
    gestureReduce.onBegin:Set(function()
      longStop = nil
      longSpeed = 1
      spNum = 1
    end)
    gestureReduce.onEnd:Set(function()
      longSpeed = 1
      spNum = 1
    end)
  end
  
  tips.BadgeList.numItems = #lvUpItem
  costMoneyTxt.text = ""
end

function BadgeWindow.UpdateCostGold()
  local gold = 0
  local addExp = 0
  for i, v in pairs(spendItemData) do
    gold = gold + lvUpItemCost[i] * v * costLvMoney
    addExp = addExp + lvUpItemCost[i] * v
  end
  BadgeWindow.SetTempLv(addExp)
  costMoney = gold
  costMoneyTxt.text = math.min(tatalMaxExp, gold)
  if tempLv > curBadgeInfo.level then
    upInfoTips.LevelTxt.text = T(1241, curBadgeInfo.level, tempLv - curBadgeInfo.level)
    upInfoTips.ExpTxt.text = T(1240, curBadgeInfo.exp, addExp, curMaxLvExp)
    mainAddRoot.Number2Txt.text = BadgeData.GetAttribute(tempLv, curBadgeInfo.mainAttribute)
    ChangeController(mainAddRoot.c2Ctr, 1)
  else
    BadgeMgr.ShowLevel(upInfoTips.LevelTxt, curBadgeInfo.level)
    if addExp > 0 then
      upInfoTips.ExpTxt.text = T(1240, curBadgeInfo.exp, addExp, curMaxLvExp)
    else
      ChangeController(upInfoTips.c1Ctr, 0)
      upInfoTips.ExpTxt.text = T(610, curBadgeInfo.exp, curMaxLvExp)
    end
    ChangeController(mainAddRoot.c2Ctr, 0)
  end
  BadgeWindow.ShowAddLvUpTips()
  BadgeWindow.PlayAddItemExpAnim(addExp)
  costGoldRoot.visible = costMoney > 0
end

function BadgeWindow.ShowAddLvUpTips()
  local wordList = uis.Main.BadgeDetailsLevelUp.BadgeLevelUp.LevelUpInfo.DetailsInfo2.WordList
  local tb = {}
  if upAttr and upAttr > 0 then
    table.insert(tb, T(1253, upAttr))
  end
  if addAttr and addAttr > 0 then
    table.insert(tb, T(1254, addAttr))
  end
  
  function wordList.itemRenderer(i, item)
    UIUtil.SetText(item, tb[i + 1], "NameTxt")
  end
  
  wordList.numItems = #tb
  wordList:ResizeToFit()
end

function BadgeWindow.PlayAddItemExpAnim(addExp)
  BadgeWindow.StopTween()
  local tatal = upInfoTips.ExpProgressBar.value + addExp
  if tatal > upInfoTips.ExpAddProgressBar.max and upInfoTips.ExpAddProgressBar.value > upInfoTips.ExpAddProgressBar.max then
    upInfoTips.ExpAddProgressBar.value = upInfoTips.ExpAddProgressBar.max
  else
    tweener = LeanTween.value(upInfoTips.ExpAddProgressBar.value, tatal, 0.25):setOnUpdate(function(val)
      upInfoTips.ExpAddProgressBar.value = val
    end):setOnComplete(function()
      upInfoTips.ExpAddProgressBar.value = tatal
      tweener = nil
      if 0 == addExp then
        ChangeController(upInfoTips.c1Ctr, 0)
      end
    end)
    ChangeController(upInfoTips.c1Ctr, 1)
  end
end

function BadgeWindow.SetTempLv(addExp)
  local configData = TableData.GetTable("BaseBadgeLevelUp")
  if configData[upDataId] then
    addAttr = 0
    upAttr = 0
    tempLv = curBadgeInfo.level
    tempExp = curBadgeInfo.exp
    local curExpLv = configData[upDataId].next_exp - tempExp
    local tatalExp = addExp - curExpLv
    if tatalExp > 0 then
      tempLv = tempLv + 1
      local id = upDataId + 1
      if 1 == configData[id].vice_type then
        addAttr = addAttr + 1
      elseif 2 == configData[id].vice_type then
        upAttr = upAttr + 1
      end
      while configData[id] and 0 ~= configData[id].next_exp and tatalExp > configData[id].next_exp do
        tatalExp = tatalExp - configData[id].next_exp
        tempLv = tempLv + 1
        id = id + 1
        if 1 == configData[id].vice_type then
          addAttr = addAttr + 1
        elseif 2 == configData[id].vice_type then
          upAttr = upAttr + 1
        end
      end
      tempExp = tatalExp
    end
  end
end

function BadgeWindow.ShowExpBarAnim(lastLv, callBack)
  if lvTween then
    LeanTween.cancel(lvTween.uniqueId)
    lvTween = nil
  end
  local addExp = 0
  for i, v in pairs(spendItemData) do
    addExp = addExp + lvUpItemCost[i] * v
  end
  local expBar = upInfoTips.ExpProgressBar
  local configData = TableData.GetTable("BaseBadgeLevelUp")
  local id = upDataId
  local preExp = expBar.value
  local tMax = 0
  local tLv = lastLv
  lvTween = LeanTween.value(0, addExp, 1):setOnUpdate(function(v)
    local tExp = preExp + v - tMax
    if tExp <= expBar.max then
      expBar.value = tExp
    else
      tMax = expBar.max + tMax
      id = id + 1
      tLv = tLv + 1
      expBar.value = 0
      if configData[id] then
        expBar.max = configData[id].next_exp
      end
      BadgeMgr.ShowLevel(upInfoTips.LevelTxt, math.min(maxLv, tLv))
    end
  end):setOnComplete(function()
    lvTween = nil
    if uis then
      ChangeController(upInfoTips.c1Ctr, 0)
      callBack()
    end
  end)
end

function BadgeWindow.GetTatalMaxExp()
  local configData = TableData.GetTable("BaseBadgeLevelUp")
  local tatalExp = 0
  if configData[upDataId] then
    tatalExp = configData[upDataId].next_exp - curBadgeInfo.exp
    local id = upDataId + 1
    while configData[id] and 0 ~= configData[id].next_exp do
      tatalExp = tatalExp + configData[id].next_exp
      id = id + 1
    end
  end
  return tatalExp
end

function BadgeWindow.GetLevelUpItem()
  local t = {}
  for i, v in pairs(spendItemData) do
    local uid = ActorData.GetItemUid(i)
    local num = ActorData.GetItemCount(i)
    if uid then
      v = v > num and num or v
      t[uid] = v
    end
  end
  return t
end

function BadgeWindow.LevelUpUpdate(info)
  if info then
    local data = TableData.GetConfig(info.badgeId, "BaseBadge")
    uis.Main.root.touchable = false
    BadgeWindow.ShowExpBarAnim(curBadgeInfo.level, function()
      uis.Main.root.touchable = true
      local cardInfo = CardData.GetCardDataById(cardId)
      if cardInfo then
        BadgeWindow.InitHomePartData(cardInfo)
      end
      for i, v in pairs(info.viceAttributes) do
        if BadgeMgr.lastBadgeInfo.attributeLevels[v] == nil then
          if nil == BadgeMgr.newTag[info.badgeUid] then
            BadgeMgr.newTag[info.badgeUid] = {}
          end
          table.insert(BadgeMgr.newTag[info.badgeUid], v)
        end
      end
      BadgeWindow.InitLvUp(info, data)
      BadgeWindow.ShowLvUpItem()
      if info.level > BadgeMgr.lastBadgeInfo.level then
        OpenWindow(WinResConfig.BadgeLevelUpTipsWindow.name, nil, info)
        local tempPage = uis.Main.BadgeDetailsLevelUp.BadgeDetails.WearBadgeContainer.TabRegion.c1Ctr.selectedIndex + 1
        partInfoRoot[tempPage].EffectHolder1:SetNativeObject(nil)
      end
    end)
    if info.level > BadgeMgr.lastBadgeInfo.level then
      local tempPage = uis.Main.BadgeDetailsLevelUp.BadgeDetails.WearBadgeContainer.TabRegion.c1Ctr.selectedIndex + 1
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Badge/FX_ui_badge_levelup_new.prefab", partInfoRoot[tempPage].EffectHolder1)
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BADGE_LV)
    end
  end
end

function BadgeWindow.GetGesture(btn)
  local gesture = LongPressGesture.GetLongPressGesture(btn)
  gesture.trigger = 0.5
  gesture.interval = 0.125
  return gesture
end

function BadgeWindow.StopTween()
  if tweener then
    LeanTween.cancel(tweener.uniqueId)
    tweener = nil
  end
end

function BadgeWindow.UpdateItemList()
  if curTypePartData then
    for i, v in pairs(curTypePartData) do
      v.info = ActorData.GetBadgeInfoByUid(v.info.badgeUid)
    end
    wearBadgeList:RefreshVirtualList()
  end
end

function BadgeWindow.SetTouchable(bol)
  for i = 1, 3 do
    partBtn[i].touchable = bol
  end
end

function BadgeWindow.Back()
  if 1 == uis.Main.c1Ctr.selectedIndex then
    if 1 == uis.Main.BadgeDetailsLevelUp.c1Ctr.selectedIndex then
      PlayUITrans(uis.Main.BadgeDetailsLevelUp.BadgeLevelUp.root, "out")
      ChangeController(uis.Main.BadgeDetailsLevelUp.PartsInfo.c2Ctr, 1)
      if selectBadgeData then
        BadgeWindow.UpdateItemList()
        selectBadgeData.info = ActorData.GetBadgeInfoByUid(selectBadgeData.info.badgeUid)
        if selectBadgeData.info then
          BadgeWindow.ShowDetailsInfo(selectBadgeData, homePartData[selectBadgeData.data.type])
        end
      end
      uis.Main.BadgeDetailsLevelUp.c1Ctr.selectedIndex = 0
      BadgeWindow.InitCurrencyReturn(FEATURE_ENUM.BADGE_DETAILS)
    else
      BadgeWindow.InitCurrencyReturn(FEATURE_ENUM.HOME_BADGE)
      tempSortUid = nil
      uis.Main.BadgeDetailsLevelUp.BadgeDetails.DetailsInfo.ContrastBtn.selected = false
      ChangeController(uis.Main.BadgeDetailsLevelUp.BadgeDetails.c1Ctr, 0)
      PlayUITrans(uis.Main.BadgeDetailsLevelUp.BadgeDetails.root, "out")
      PlayUITrans(uis.Main.BadgeDetailsLevelUp.root, "out")
      local tempPage = uis.Main.BadgeDetailsLevelUp.BadgeDetails.WearBadgeContainer.TabRegion.c1Ctr.selectedIndex + 1
      BadgeWindow.SetSpineEffectAnimation(string.format("back%s", tempPage), false)
      if 1 == tempPage then
        partInfoRoot[2].root:TweenFade(1, 0.1):OnComplete(function()
          partInfoRoot[3].root:TweenFade(1, 0.1)
        end)
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BADGE_LEFT_RIGHT_OFF)
      elseif 2 == tempPage then
        partInfoRoot[1].root:TweenFade(1, 0.2)
        partInfoRoot[3].root:TweenFade(1, 0.2)
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BADGE_MIDDLE_OFF)
      elseif 3 == tempPage then
        partInfoRoot[1].root:TweenFade(1, 0.1):OnComplete(function()
          partInfoRoot[2].root:TweenFade(1, 0.1)
        end)
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BADGE_RIGHT_LEFT_OFF)
      end
      uis.Main.HomePage.CardList:RefreshVirtualList()
      BadgeWindow.InitPartInfo(nil, 1)
      BadgeWindow.UpdateAutoWearState()
      BadgeWindow.ShowSortBtnName()
      uis.Main.c1Ctr.selectedIndex = 0
      BadgeData.InitScreeningData()
      BadgeData.SortAttribute = {}
      BadgeWindow.SetTouchable(true)
      selectBadgeData = nil
    end
  else
    UIMgr:CloseWindow(WinResConfig.BadgeWindow.name)
  end
end

function BadgeWindow.InitCurrencyReturn(featureId)
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.BadgeWindow.name, uis.Main.CurrencyReturn, featureId, function()
    BadgeWindow.Back()
  end)
end

function BadgeWindow.InitBtn()
  BadgeWindow.InitCurrencyReturn(FEATURE_ENUM.HOME_BADGE)
  uis.Main.HomePage.DecomposeBtn.onClick:Set(function()
    BadgeMgr.OpenBadgeDecompose()
  end)
  uis.Main.BadgeDetailsLevelUp.BadgeLevelUp.LevelUpList.DecomposeBtn.onClick:Set(function()
    BadgeWindow.GetClearNew()
    BadgeMgr.OpenBadgeDecompose(true)
  end)
  UIUtil.SetText(uis.Main.HomePage.DecomposeBtn, T(1231), "WordTxt")
  UIUtil.SetText(uis.Main.BadgeDetailsLevelUp.BadgeLevelUp.LevelUpList.DecomposeBtn, T(1231), "WordTxt")
  UIUtil.SetText(uis.Main.HomePage.RecommendWearBtn, T(1392), "WordTxt")
  uis.Main.HomePage.RecommendWearBtn.onClick:Set(function()
    OpenWindow(WinResConfig.BadgeRecommendWindow.name, nil, cardId)
  end)
  uis.Main.HomePage.AllWearBtn.onClick:Set(function()
    local bol = true
    local tempUid = {}
    for type = 1, 3 do
      if nil == homePartData[type] then
        bol = false
      else
        table.insert(tempUid, homePartData[type].info.badgeUid)
      end
    end
    if bol then
      BadgeService.TakeoffBadgeReq(cardId, tempUid, function()
        BadgeWindow.CardItemClick()
        uis.Main.HomePage.CardList:RefreshVirtualList()
      end)
    else
      BadgeWindow.AutoWear()
    end
  end)
  uis.Main.BadgeDetailsLevelUp.BadgeDetails.DetailsInfo.WordTxt.text = T(1232)
end

function BadgeWindow.UpdateAutoWearState()
  local bol = true
  for type = 1, 3 do
    if nil == homePartData[type] then
      bol = false
    end
  end
  RedDotMgr.AddNode({
    windowName = WinResConfig.BadgeWindow.name,
    com = uis.Main.HomePage.AllWearBtn,
    visibleFunc = function()
      return RedDotBadge.CanCardWear(cardId)
    end,
    dataType = RED_DOT_DATA_TYPE.BADGE
  })
  ChangeUIController(uis.Main.HomePage.AllWearBtn, "c1", bol and 1 or 0)
  UIUtil.SetText(uis.Main.HomePage.AllWearBtn, bol and T(1260) or T(1259), "NameTxt")
end

local GetAllSuitSortData = function(suitId)
  local suitData = {}
  local newId = {}
  for _, v in pairs(suitId) do
    local data = TableData.GetConfig(v, "BaseBadgeSuit")
    if data then
      table.insert(suitData, data)
      local new = {}
      for i = 1, #data.badge_ids do
        new[data.badge_ids[i]] = true
      end
      newId[v] = new
    end
  end
  table.sort(suitData, function(a, b)
    if a.equip_num == b.equip_num then
      return a.id < b.id
    else
      return a.equip_num > b.equip_num
    end
  end)
  return suitData, newId
end
local FindMaxLvPart = function(equipNum, addFun, partTabal)
  local badges = ActorData.GetAllBadge()
  local config = TableData.GetTable("BaseBadge")
  local part = {
    [1] = nil,
    [2] = nil,
    [3] = nil
  }
  local partOldIndex = {}
  local partOldData = {}
  local data, oldIndex, oldData
  local SetPart = function(i)
    part[data.type] = badges[i].badgeUid
    partOldIndex[data.type] = i
    partOldData[data.type] = config[badges[i].badgeId]
  end
  for i = 1, #badges do
    if nil == addFun or addFun(badges[i].badgeId) then
      data = config[badges[i].badgeId]
      if data and (nil == partTabal or nil == partTabal[data.type]) and (0 == badges[i].wearCardId or badges[i].wearCardId == cardId) then
        if nil == part[data.type] then
          SetPart(i)
        else
          oldIndex = partOldIndex[data.type]
          oldData = partOldData[data.type]
          if badges[i].level > badges[oldIndex].level then
            SetPart(i)
          elseif badges[i].level == badges[oldIndex].level then
            if data.star > oldData.star then
              SetPart(i)
            elseif data.star == oldData.star then
              if #badges[i].viceAttributes > #badges[oldIndex].viceAttributes then
                SetPart(i)
              elseif #badges[i].viceAttributes == #badges[oldIndex].viceAttributes and badges[i].badgeUid > badges[oldIndex].badgeUid then
                SetPart(i)
              end
            end
          end
        end
      end
    end
  end
  if partTabal then
    for i, v in pairs(partTabal) do
      part[i] = v
    end
  end
  local num = 0
  for i = 1, 3 do
    if part[i] then
      num = num + 1
    end
  end
  return equipNum <= num, part
end

function BadgeWindow.GetSuitPart()
  local cardData = TableData.GetConfig(cardId, "BaseCard")
  if cardData.badge_suit_ids then
    local groupData, tempId, part, bol
    for i = 1, #cardData.badge_suit_ids do
      groupData = TableData.GetConfig(cardData.badge_suit_ids[i], "BaseBadgeSuitGroup")
      if groupData and groupData.suit_id then
        local sortData, newBadgeId = GetAllSuitSortData(groupData.suit_id)
        for sortIndex = 1, #sortData do
          tempId = sortData[sortIndex].id
          bol, part = FindMaxLvPart(sortData[sortIndex].equip_num, function(tempBadgeId)
            return newBadgeId[tempId][tempBadgeId]
          end)
          if bol and part then
            if 3 == table.getLen(part) then
              return bol, part
            end
            bol, part = FindMaxLvPart(3, nil, part)
            return true, part
          end
        end
      end
    end
  end
end

local GetFindSuitId = function()
  for type = 1, 3 do
    if homePartData[type] then
      return homePartData[type].data.suit_group_id
    end
  end
end
local GetWearUid = function()
  local uid = {}
  for type = 1, 3 do
    if homePartData[type] then
      uid[type] = homePartData[type].info.badgeUid
    end
  end
  return uid
end

function BadgeWindow.GetSuitPartByWear()
  local groupId = GetFindSuitId()
  local wearUid = GetWearUid()
  if groupId and table.getLen(wearUid) > 0 then
    local tempId, part, bol
    local groupData = TableData.GetConfig(groupId, "BaseBadgeSuitGroup")
    if groupData and groupData.suit_id then
      local sortData, newBadgeId = GetAllSuitSortData(groupData.suit_id)
      for sortIndex = 1, #sortData do
        tempId = sortData[sortIndex].id
        bol, part = FindMaxLvPart(sortData[sortIndex].equip_num, function(tempBadgeId)
          return newBadgeId[tempId][tempBadgeId]
        end, wearUid)
        if bol and part then
          if 3 == table.getLen(part) then
            return bol, part
          end
          bol, part = FindMaxLvPart(3, nil, part)
          return true, part
        end
      end
      wearUid = part and table.getLen(part) > table.getLen(wearUid) and part or wearUid
      bol, part = FindMaxLvPart(3, nil, wearUid)
      if table.getLen(part) > 0 then
        return true, part
      end
    end
  end
end

function BadgeWindow.AutoWear()
  local Req = function(part)
    local newPart = {}
    for i, v in pairs(part) do
      if v then
        table.insert(newPart, v)
      end
    end
    if #newPart > 0 then
      BadgeService.WearBadgeReq(cardId, newPart, function()
        if uis then
          BadgeWindow.CardItemClick()
          uis.Main.HomePage.CardList:RefreshVirtualList()
          SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BADGE_AUTO_WEAR)
        end
      end)
    end
    if 3 ~= #newPart then
      FloatTipsUtil.ShowWarnTips(T(1256))
    end
  end
  local bol, part = BadgeWindow.GetSuitPartByWear()
  if bol then
    Req(part)
    return
  end
  bol, part = BadgeWindow.GetSuitPart()
  if not bol then
    bol, part = FindMaxLvPart(3)
  end
  Req(part)
end

function BadgeWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.BadgeWindow.REFRESH_WEAR_BADGE then
    ChangeController(uis.Main.BadgeDetailsLevelUp.BadgeDetails.c1Ctr, 0)
    uis.Main.BadgeDetailsLevelUp.BadgeDetails.DetailsInfo.ContrastBtn.selected = false
    local cardInfo = CardData.GetCardDataById(cardId)
    if cardInfo then
      BadgeWindow.InitHomePartData(cardInfo)
      if selectBadgeData then
        selectBadgeData.info = ActorData.GetBadgeInfoByUid(selectBadgeData.info.badgeUid)
        showFirstUid = BadgeWindow.GetWearBadgeIdByType(selectBadgeData.data.type)
        BadgeWindow.ShowDetailsInfo(selectBadgeData, homePartData[selectBadgeData.data.type])
        BadgeWindow.UpdateCurPart(selectBadgeData.data, selectBadgeData.info)
        BadgeWindow.UpdateItemList()
        if selectBadgeData.info.wearCardId > 0 then
          local tempPage = uis.Main.BadgeDetailsLevelUp.BadgeDetails.WearBadgeContainer.TabRegion.c1Ctr.selectedIndex + 1
          BadgeWindow.PlayWearEffect(tempPage)
        end
      end
    end
  elseif msgId == WindowMsgEnum.BadgeWindow.LV_UP then
    BadgeWindow.LevelUpUpdate(para)
  elseif msgId == WindowMsgEnum.BadgeWindow.SCREENING_SHOW then
    local c1Ctr = uis.Main.BadgeDetailsLevelUp.BadgeDetails.WearBadgeContainer.TabRegion.c1Ctr
    showFirstUid = BadgeWindow.GetWearBadgeIdByType(c1Ctr.selectedIndex + 1)
    curTypePartData = BadgeData.GetDefaultScreeningResult(c1Ctr.selectedIndex + 1, showFirstUid, reverseSort)
    timeIndex = 0
    isPlayAnim = true
    wearBadgeList.selectedIndex = -1
    wearBadgeList.numItems = #curTypePartData
    BadgeWindow.ShowSortBtnName()
    isPlayAnim = nil
  elseif msgId == WindowMsgEnum.BadgeWindow.REFRESH_LIST then
    BadgeWindow.UpdateItemList()
  elseif msgId == WindowMsgEnum.BadgeWindow.CLOSE_DECOMPOSE then
    if selectBadgeData then
      selectBadgeData.info = ActorData.GetBadgeInfoByUid(selectBadgeData.info.badgeUid)
      if selectBadgeData.info == nil then
        tempSortUid = nil
        wearBadgeList.selectedIndex = -1
        PlayUITransToComplete(uis.Main.BadgeDetailsLevelUp.BadgeLevelUp.root, "out")
        uis.Main.BadgeDetailsLevelUp.c1Ctr.selectedIndex = 0
      end
    end
    for i = #curTypePartData, 1, -1 do
      if curTypePartData[i].info then
        curTypePartData[i].info = ActorData.GetBadgeInfoByUid(curTypePartData[i].info.badgeUid)
      end
      if tempSortUid and curTypePartData[i].info and curTypePartData[i].info.badgeUid == tempSortUid then
        wearBadgeList.selectedIndex = i - 1
      end
      if curTypePartData[i].info == nil then
        table.remove(curTypePartData, i)
      end
    end
    wearBadgeList.numItems = #curTypePartData
    if nil == tempSortUid then
      if wearBadgeList.numChildren > 0 then
        wearBadgeList.selectedIndex = -1
        wearBadgeList:GetChildAt(0).onClick:Call()
      else
        BadgeWindow.InitPartInfo()
        local info = uis.Main.BadgeDetailsLevelUp.BadgeDetails
        ChangeController(info.DetailsInfo.c1Ctr, 0)
      end
    end
    if 1 == uis.Main.BadgeDetailsLevelUp.c1Ctr.selectedIndex then
      BadgeWindow.ShowLvUpItem()
    end
    uis.Main.HomePage.CardList:RefreshVirtualList()
  elseif msgId == WindowMsgEnum.BadgeWindow.PLAY_WEAR_EFFECT then
    playWearEffect = true
  elseif msgId == WindowMsgEnum.BadgeWindow.RECOMMEND_WEAR then
    recommendWear = true
  end
end

function BadgeWindow.OnShown()
  if uis and playWearEffect and badgeEffEct then
    local tempPage = uis.Main.BadgeDetailsLevelUp.BadgeDetails.WearBadgeContainer.TabRegion.c1Ctr.selectedIndex + 1
    BadgeWindow.PlayWearEffect(tempPage)
    playWearEffect = nil
  end
  if uis and recommendWear then
    if 0 == uis.Main.c1Ctr.selectedIndex then
      BadgeWindow.CardItemClick()
      uis.Main.HomePage.CardList:RefreshVirtualList()
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BADGE_AUTO_WEAR)
    elseif 1 == uis.Main.c1Ctr.selectedIndex and 0 == uis.Main.BadgeDetailsLevelUp.c1Ctr.selectedIndex then
      UIMgr:SendWindowMessage(WinResConfig.BadgeWindow.name, WindowMsgEnum.BadgeWindow.REFRESH_WEAR_BADGE)
    end
    recommendWear = nil
  end
end

function BadgeWindow.OnClose()
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  curTypePartData = nil
  selectBadgeData = nil
  isPlayAnim = nil
  timeIndex = nil
  homePartData = nil
  showFirstUid = nil
  wearBadgeList = nil
  cardId = nil
  lvUpItem = nil
  spendItemData = nil
  costLvMoney = nil
  longSpeed = nil
  tempLv = nil
  tempExp = nil
  maxLv = nil
  upDataId = nil
  curMaxLvExp = nil
  totalMoney = nil
  lvUpItemCost = nil
  costMoneyTxt = nil
  costMoney = nil
  curBadgeInfo = nil
  upInfoTips = nil
  animTime = nil
  reverseSort = nil
  tempSortUid = nil
  costGoldRoot = nil
  addAttr, upAttr = nil, nil
  if badgeEffEct then
    for i = 1, 3 do
      if badgeEffEct[i] then
        ResourceManager.DestroyGameObject(badgeEffEct[i], false)
      end
    end
  end
  badgeEffEct = nil
  partBtn = nil
  partInfoRoot = nil
  BadgeMgr.newTag = {}
  ResourceManager.UnloadTexture(maskTexture)
  RedDotMgr.RemoveNode(WinResConfig.BadgeWindow.name)
  ResourceManager.DestroyGameObject(lightEffect, false)
  lightEffect = nil
  maskTexture = nil
  lastEffUid = nil
  changeEffect = nil
  playCardHeadSound = nil
  playWearEffect = nil
end

return BadgeWindow
