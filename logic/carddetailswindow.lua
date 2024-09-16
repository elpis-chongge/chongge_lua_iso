require("Card_CardDetailsWindowByName")
require("CardLevelUpWindow")
require("CardStarUpWindow")
require("CardSkillUpWindow")
require("CardStoryWindow")
require("CardClothesWindow")
require("CardBreachUpWindow")
local CardDetailsWindow = {}
local uis, contentPane, cardId, previewFashionId, jumpTb
local showIndex = 0
local Left, Right, PicImage
local lerp = Mathf.Lerp
local leftStartPos = -1
local leftEndPos = -667
local rightStartPos = 977
local rightEndPos = 1320
local cardTouchable = true
local curTypingEffect, curSoundEventIns

function CardDetailsWindow.ReInitData()
end

function CardDetailsWindow.OnInit(bridgeObj)
  cardId = bridgeObj.argTable[1]
  bridgeObj:SetView(WinResConfig.CardDetailsWindow.package, WinResConfig.CardDetailsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetCard_CardDetailsWindowUis(contentPane)
    CardMgr.InitData(cardId)
    CardDetailsWindow.InitBtn()
    CardDetailsWindow.UpdateInfo()
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    CardDetailsWindow.SwitchDetailsBgEffect(WindowMsgEnum.COM_TYPE.INFO)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Roledetail/FX_UI_roledetail_eff.prefab", uis.Main.Details.EffectHolder)
    cardTouchable = true
    uis.Main.CardShow.root.touchable = false
    PlayUITrans(uis.Main.Details.root, "DetailsIn", function()
      if CardMgr.ctrIndex == WindowMsgEnum.COM_TYPE.INFO then
        uis.Main.CardShow.root.touchable = cardTouchable
      end
    end)
    CardDetailsWindow.InitCardShow()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.SLIDE_EFFECT)
    CardDetailsWindow.InitRedDot()
    CardDetailsWindow.InitSet()
    CardDetailsWindow.ShowLeaderGuide()
  end)
end

function CardDetailsWindow.ChangeCard(id)
  cardId = id
  CardMgr.InitData(id)
  CardDetailsWindow.UpdateInfo()
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.CardDetailsWindow.name)
  UIMgr:SetWindowArgs(WinResConfig.CardDetailsWindow.name, {cardId})
end

function CardDetailsWindow.RefreshFashion(fashionId)
  if previewFashionId == fashionId then
    return
  end
  local curShowItem = uis.Main.CardShow.CardShowList:GetChildAt(showIndex)
  CardDetailsWindow.LoadCardTexture(fashionId, nil, curShowItem)
  curShowItem = nil
  previewFashionId = fashionId
end

function CardDetailsWindow.SetCardSpineAlpha(bol)
  local list = uis.Main.CardShow.CardShowList
  local item
  for i = 0, list.numChildren - 1 do
    item = list:GetChildAt(i)
    if bol then
      item.alpha = 1
    else
      item.alpha = showIndex == i and 1 or 0
    end
  end
end

local SetAnimOut = function(t)
  local a = lerp(1, 0, t)
  Left.alpha = a
  Right.alpha = a
  local m = lerp(0, 0.7, t)
  PicImage.alpha = m
  local rp = lerp(rightStartPos, rightEndPos, t)
  Right:SetXY(rp, Right.y)
  local lp = lerp(leftStartPos, leftEndPos, t)
  Left:SetXY(lp, Left.y)
end
local SetAnimIn = function(t)
  local a = lerp(0, 1, t)
  Left.alpha = a
  Right.alpha = a
  local m = lerp(0.7, 0, t)
  PicImage.alpha = m
  local rp = lerp(rightEndPos, rightStartPos, t)
  Right:SetXY(rp, Right.y)
  local lp = lerp(leftEndPos, leftStartPos, t)
  Left:SetXY(lp, Left.y)
end

function CardDetailsWindow.Sort(listData)
  local left = {}
  local right = {}
  local bol
  for i, v in ipairs(listData) do
    if v.cardId == cardId then
      table.insert(right, v)
      bol = true
    elseif bol then
      table.insert(right, v)
    else
      table.insert(left, v)
    end
  end
  for i = 1, #left do
    table.insert(right, left[i])
  end
  return right
end

function CardDetailsWindow.InitCardShow()
  Left = uis.Main.Details.root:GetChild("Left")
  Right = uis.Main.Details.root:GetChild("Right")
  PicImage = uis.Main.Details.root:GetChild("PicImage")
  local list = uis.Main.CardShow.CardShowList
  local listData = CardData.GetDetailsSortData()
  if nil == listData or #listData < 1 then
    listData = CardData.GetSortCardList()
  end
  listData = CardDetailsWindow.Sort(listData)
  local curIndex = -1
  local cardLen = #listData
  local t, move, tween, curBannerIndex, tempIndex
  list.scrollPane.mouseWheelEnabled = false
  if cardLen > 1 then
    list:SetVirtualAndLoop()
  else
    list:SetVirtual()
  end
  
  function list.itemRenderer(i, item)
    CardDetailsWindow.LoadCardTexture(listData[i + 1].fashionId, listData[i + 1].cardId == cardId, item)
  end
  
  list.numItems = cardLen
  for i, v in ipairs(listData) do
    if v.cardId == cardId then
      curIndex = i - 1
      previewFashionId = v.fashionId
      break
    end
  end
  if cardLen > 1 and curIndex > 0 then
    list.scrollPane:SetCurrentPageX(curIndex)
  end
  local percX = list.scrollPane.percX
  local maxPer = list.scrollPane.viewWidth / list.scrollPane.contentWidth
  local ChangeUI = function(bannerIndex)
    if listData[bannerIndex] then
      curBannerIndex = bannerIndex
      list.scrollPane:CancelDragging()
      list:StopDrag()
      CardDetailsWindow.ChangeCard(listData[bannerIndex].cardId)
      list.scrollPane:SetCurrentPageX(list.scrollPane.currentPageX, true)
      uis.Main.CardShow.root.touchable = false
      tween = LeanTween.value(0, 1, 0.3):setOnUpdate(function(value)
        if uis then
          SetAnimIn(value)
        end
      end):setOnComplete(function()
        if uis then
          uis.Main.CardShow.root.touchable = true
          tween = nil
          previewFashionId = listData[bannerIndex].fashionId
          SetAnimIn(1)
        end
      end)
    end
  end
  list.scrollPane.onScrollEnd:Set(function()
    local bannerIndex = list.scrollPane.currentPageX % cardLen + 1
    if listData[bannerIndex] and listData[bannerIndex].cardId ~= cardId then
      CardDetailsWindow.ChangeCard(listData[bannerIndex].cardId)
    end
    showIndex = list:ItemIndexToChildIndex(list.scrollPane.currentPageX % cardLen)
    CardDetailsWindow.SetCardSpineAlpha()
    percX = list.scrollPane.percX
    move = true
    PicImage.alpha = 0
    PicImage.visible = true
  end)
  list.onTouchBegin:Set(function()
    curBannerIndex = list.scrollPane.currentPageX % cardLen + 1
  end)
  list.scrollPane.onScroll:Add(function()
    if nil == curBannerIndex then
      return
    end
    if move then
      curBannerIndex = list.scrollPane.currentPageX % cardLen + 1
      CardDetailsWindow.SetCardSpineAlpha(true)
      move = nil
    end
    t = Mathf.Abs((list.scrollPane.percX - percX) / maxPer)
    if t > 0.5 then
      if not tween then
        SetAnimIn((t - 0.5) * 2)
      end
    else
      SetAnimOut(t * 2)
    end
    if t >= 1 and 1 == tempIndex then
      PicImage.visible = false
    end
    tempIndex = list.scrollPane.currentPageX % cardLen + 1
    if curBannerIndex ~= tempIndex then
      ChangeUI(tempIndex)
    end
  end)
  move = true
  showIndex = 1 == curIndex and 1 or 0
  CardDetailsWindow.SetCardSpineAlpha()
  showIndex = 0
  cardTouchable = cardLen > 1
end

function CardDetailsWindow.SwitchDetailsBgEffect(type)
  if nil == type then
    uis.Main.BackGround.BackGroundHolder.visible = false
    return
  end
  if type == WindowMsgEnum.COM_TYPE.SKILL_UP then
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Roleskills/FX_UI_roleskills_back.prefab", uis.Main.BackGround.BackGroundHolder)
  elseif type == WindowMsgEnum.COM_TYPE.BREACH_UP then
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/NoiseUIBack/FX_ui_CardBreach_1000.prefab", uis.Main.BackGround.BackGroundHolder)
  elseif type == WindowMsgEnum.COM_TYPE.INFO then
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Roledetail/FX_UI_roledetail_backeff.prefab", uis.Main.BackGround.BackGroundHolder)
  elseif type == WindowMsgEnum.COM_TYPE.CLOTHES then
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/NoiseUIBack/FX_ui_Watch_1000.prefab", uis.Main.BackGround.BackGroundHolder)
  end
  uis.Main.BackGround.BackGroundHolder.visible = true
end

function CardDetailsWindow.InitRedDot()
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CARD_LEVELUP, false) then
    RedDotMgr.AddNode({
      windowName = WinResConfig.CardDetailsWindow.name,
      com = uis.Main.Details.LvUpBtn,
      visibleFunc = function()
        return RedDotCard.CanCardUp(cardId)
      end,
      dataType = RED_DOT_DATA_TYPE.CARD
    })
  end
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CARD_SKILL_LEVELUP, false) then
    RedDotMgr.AddNode({
      windowName = WinResConfig.CardDetailsWindow.name,
      com = uis.Main.Details.SkillUpBtn,
      visibleFunc = function()
        return RedDotCard.CanSkillUp(cardId)
      end,
      dataType = RED_DOT_DATA_TYPE.CARD
    })
  end
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CARD_AWAKE, false) then
    RedDotMgr.AddNode({
      windowName = WinResConfig.CardDetailsWindow.name,
      com = uis.Main.Details.StarUpBtn,
      visibleFunc = function()
        return RedDotCard.CanStarUp(cardId)
      end,
      dataType = RED_DOT_DATA_TYPE.CARD
    })
  end
  RedDotMgr.AddNode({
    windowName = WinResConfig.CardDetailsWindow.name,
    com = uis.Main.Details.Label1.PlotBtn,
    visibleFunc = function()
      return RedDotCard.CanPlot(cardId)
    end,
    dataType = RED_DOT_DATA_TYPE.CARD
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.CardDetailsWindow.name,
    com = uis.Main.Details.Label1.ClothesBtn,
    visibleFunc = function()
      return RedDotCard.CanClothes(cardId)
    end,
    dataType = RED_DOT_DATA_TYPE.CARD
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.CardDetailsWindow.name,
    com = uis.Main.Details.Label1.BadgeBtn,
    visibleFunc = function()
      return RedDotBadge.CanCardWear(cardId)
    end,
    dataType = RED_DOT_DATA_TYPE.BADGE
  })
end

function CardDetailsWindow.InitSet()
  if CardMgr.ctrIndex == WindowMsgEnum.COM_TYPE.BREACH_UP then
    uis.Main.Details.LvUpBtn.onClick:Call()
  elseif CardMgr.ctrIndex == WindowMsgEnum.COM_TYPE.CLOTHES then
    uis.Main.Details.Label1.ClothesBtn.onClick:Call()
  elseif CardMgr.ctrIndex == WindowMsgEnum.COM_TYPE.LV_UP then
    uis.Main.Details.LvUpBtn.onClick:Call()
  elseif CardMgr.ctrIndex == WindowMsgEnum.COM_TYPE.PLOT then
    uis.Main.Details.Label1.PlotBtn.onClick:Call()
  elseif CardMgr.ctrIndex == WindowMsgEnum.COM_TYPE.SKILL_UP then
    uis.Main.Details.SkillUpBtn.onClick:Call()
  elseif CardMgr.ctrIndex == WindowMsgEnum.COM_TYPE.STAR_UP then
    uis.Main.Details.StarUpBtn.onClick:Call()
  else
    PlayUITrans(uis.Main.root, "DetailsIn")
  end
  CardDetailsWindow.SetCtrIndex()
end

function CardDetailsWindow.LoadCardTexture(id, showAlpha, cardShowItem)
  if nil == cardShowItem then
    return
  end
  local fashion_id = id
  local fashionConfig = TableData.GetConfig(fashion_id, "BaseFashion")
  if fashionConfig.show_spine then
    UIUtil.SetCardShowSpineAutoAlpha(fashion_id, cardShowItem:GetChild("CardShowLoader"), cardShowItem:GetChild("CardShowHolder"), true ~= showAlpha)
  elseif fashionConfig.show_texture then
    UIUtil.SetCardShowTexture(cardShowItem:GetChild("CardShowLoader"), CardMgr.cardConfigData.fashion_id)
  end
end

function CardDetailsWindow.UpdateInfo()
  CardDetailsWindow.UpdateTextDisplay()
  local StarList = uis.Main.Details.StarList
  
  function StarList.itemRenderer()
  end
  
  StarList.numItems = CardMgr.cardConfigData.star
  CardDetailsWindow.RefreshUI()
end

function CardDetailsWindow.UpdateTextDisplay()
  local details = uis.Main.Details
  UIUtil.SetBtnText(details.StarUpBtn, T(30), T(33))
  UIUtil.SetBtnText(details.LvUpBtn, T(40), T(42))
  UIUtil.SetBtnText(details.SkillUpBtn, T(32), T(34))
  local CardName = uis.Main.Details.CardName
  CardName.CardNameTxt.text = CardMgr.cardConfigData.name()
  CardName.CardNameENTxt.text = CardMgr.cardConfigData.name_english()
  CardName.WordTxt.text = FormatStrByLen(CardMgr.cardConfigData.des(), 34)
  if CardMgr.cardConfigData.des1 then
    CardName.SignatureTxt.text = CardMgr.cardConfigData.des1()
  end
end

function CardDetailsWindow.InitAttribute()
  local cardAttributeList = uis.Main.Details.CardAttributeStrip.CardAttributeList
  local attributeIndex = {
    1,
    2,
    0
  }
  local attributeWord = {
    T(880),
    T(881),
    T(882)
  }
  local attributeNun = {
    ProtoEnum.ATTR_ID.ATK,
    ProtoEnum.ATTR_ID.DEF,
    ProtoEnum.ATTR_ID.MAX_HP
  }
  local badgeAttribute = CardData.GetBadgeAddAttribute()
  
  function cardAttributeList.itemRenderer(i, item)
    local index = i + 1
    ChangeUIController(item, nil, attributeIndex[index])
    local num = badgeAttribute[attributeNun[index]] or 0
    item:GetChild("NumberTxt").text = CardMgr.cardInfoData.attributes[attributeNun[index]] + num
    item:GetChild("ENTxt").text = attributeWord[index]
  end
  
  cardAttributeList.numItems = #attributeIndex
end

function CardDetailsWindow.RefreshUI()
  local info = uis.Main.Details
  uis.Main.Details.Level.LevelTxt.text = T(605, CardMgr.cardLevelUpData.level_show)
  ChangeController(info.CardBreach.c1Ctr, CardMgr.cardInfoData.quality)
  UIUtil.ShowElementList(uis.Main.Details.ElementList, CardMgr.cardConfigData)
  ChangeController(uis.Main.Details.Occupation.c1Ctr, CardMgr.cardConfigData.type - 1)
  ChangeController(uis.Main.Occupation.c1Ctr, CardMgr.cardConfigData.type - 1)
  ChangeController(uis.Main.Details.CardName.c1Ctr, CardMgr.cardConfigData.star - 1)
  CardDetailsWindow.InitAttribute()
  CardDetailsWindow.ShowUnlockSkill()
  CardDetailsWindow.ShowGradeStar()
  CardDetailsWindow.RefreshDetailsNum()
end

function CardDetailsWindow.ShowUnlockSkill()
  local skillList = uis.Main.Details.SkillList
  local skillData = {
    CardMgr.cardConfigData.leader_skill,
    CardMgr.cardConfigData.special_skill,
    CardMgr.cardConfigData.burst_skill
  }
  local skillInfo = {}
  local GetSkillLv = function(skillId)
    local lv = CardMgr.cardInfoData.skill2Level[skillId] or 1
    local addLv = CardMgr.cardInfoData.gradeUpSkills[skillId] or 0
    return lv + addLv
  end
  
  function skillList.itemRenderer(i, item)
    local data = TableData.GetConfig(skillData[i + 1], "BaseSkill")
    local skill = item:GetChild("Skill")
    skill:GetChild("IconLoader").url = UIUtil.GetResUrl(data.icon)
    CardMgr.ShowSkillTypeInfo(data, item, true)
    table.insert(skillInfo, {
      id = data.id,
      type = data.type,
      level = GetSkillLv(data.id),
      cardInfo = CardMgr.cardInfoData
    })
    if data.type == SKILL_TYPE_ENUM.LEADER then
      ChangeUIController(item, "c2", CardMgr.cardInfoData.skill2Level[data.id] and 0 or 1)
      UIUtil.SetText(skill:GetChild("SkillLock"), T(1311), "LevelTxt")
    end
  end
  
  skillList.numItems = #skillData
  table.insert(skillInfo, 2, {
    id = CardMgr.cardConfigData.normal_skill,
    type = 1,
    level = GetSkillLv(CardMgr.cardConfigData.normal_skill),
    cardInfo = CardMgr.cardInfoData
  })
  skillList.onClick:Set(function()
    OpenWindow(WinResConfig.DetailsAllSkillWindow.name, nil, skillInfo)
  end)
end

function CardDetailsWindow.ShowGradeStar()
  local StarList = uis.Main.Details.StarList
  
  function StarList.itemRenderer(i, item)
    ChangeUIController(item, nil, CardMgr.cardInfoData.grade >= i + 1 and 1 or 0)
  end
  
  StarList.numItems = math.max(CardMgr.cardConfigData.star, CardMgr.cardInfoData.grade)
end

function CardDetailsWindow.RefreshDetailsNum()
  local id = cardId * 1000 + CardMgr.cardInfoData.grade
  local num = CardData.GetCardStarDebrisNum(id)
  uis.Main.Details.StarUpBtn:GetChild("NumberTxt").visible = CardMgr.cardInfoData.grade < CardMgr.cardConfigData.grade_max
  local str = num >= 1 and T(604, num, 1) or T(886, 22, num, 1)
  UIUtil.SetText(uis.Main.Details.StarUpBtn, str, "NumberTxt")
end

function CardDetailsWindow.SetCtrIndex()
  CardMgr.ctrIndex = uis.Main.c1Ctr.selectedIndex
  local featureId
  if CardMgr.ctrIndex == WindowMsgEnum.COM_TYPE.BREACH_UP then
    featureId = FEATURE_ENUM.CARD_STAR
  elseif CardMgr.ctrIndex == WindowMsgEnum.COM_TYPE.CLOTHES then
    featureId = FEATURE_ENUM.CARD_CLOTHES
  elseif CardMgr.ctrIndex == WindowMsgEnum.COM_TYPE.LV_UP then
    featureId = FEATURE_ENUM.CARD_LEVELUP
  elseif CardMgr.ctrIndex == WindowMsgEnum.COM_TYPE.PLOT then
    featureId = FEATURE_ENUM.CARD_STORY
  elseif CardMgr.ctrIndex == WindowMsgEnum.COM_TYPE.SKILL_UP then
    featureId = FEATURE_ENUM.CARD_SKILL
  elseif CardMgr.ctrIndex == WindowMsgEnum.COM_TYPE.STAR_UP then
    featureId = FEATURE_ENUM.CARD_AWAKE
  else
    featureId = FEATURE_ENUM.CARD_DETAILS
  end
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.CardDetailsWindow.name, uis.Main.CurrencyReturn, featureId, function()
    CardDetailsWindow.Back()
  end)
end

function CardDetailsWindow.InitBtn()
  uis.Main.Details.LvUpBtn.onClick:Set(function()
    if CardMgr.cardLevelUpData.level_show >= CardMgr.cardQualityUpData.card_level_max_show and not CardMgr.StarIsMax() and CardData.CanJump(CardMgr.cardInfoData.cardId) and EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CARD_STAR, false) then
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_ROLE_SLIDE)
      CardDetailsWindow.SwitchDetailsBgEffect(WindowMsgEnum.COM_TYPE.BREACH_UP)
      ChangeController(uis.Main.c1Ctr, WindowMsgEnum.COM_TYPE.BREACH_UP)
      CardBreachUpWindow.Open(uis.Main.CardBreachUp, uis.Main.CardBreachUpBack)
      uis.Main.c1Ctr.selectedIndex = WindowMsgEnum.COM_TYPE.BREACH_UP
    elseif EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CARD_LEVELUP) then
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_ROLE_SLIDE)
      CardDetailsWindow.SwitchDetailsBgEffect(WindowMsgEnum.COM_TYPE.SKILL_UP)
      ChangeController(uis.Main.c1Ctr, WindowMsgEnum.COM_TYPE.LV_UP)
      CardLevelUpWindow.Open(uis.Main.CardLevelUp)
      uis.Main.c1Ctr.selectedIndex = WindowMsgEnum.COM_TYPE.LV_UP
    end
    CardDetailsWindow.SetCtrIndex()
  end)
  uis.Main.Details.SkillUpBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CARD_SKILL_LEVELUP) then
      ChangeController(uis.Main.c1Ctr, WindowMsgEnum.COM_TYPE.SKILL_UP)
      CardDetailsWindow.SwitchDetailsBgEffect(WindowMsgEnum.COM_TYPE.SKILL_UP)
      CardSkillUpWindow.Open(uis.Main.CardSkillUp, cardId)
      CardDetailsWindow.SetCtrIndex()
    end
  end)
  uis.Main.Details.StarUpBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.CARD_AWAKE) then
      CardDetailsWindow.SwitchDetailsBgEffect()
      uis.Main.CardStarUp.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.CARD_AWAKE)
      ChangeController(uis.Main.c1Ctr, WindowMsgEnum.COM_TYPE.STAR_UP)
      CardStarUpWindow.Open(uis.Main.CardStarUp)
      uis.Main.c1Ctr.selectedIndex = WindowMsgEnum.COM_TYPE.STAR_UP
    end
    CardDetailsWindow.SetCtrIndex()
  end)
  uis.Main.Details.CardAttributeStrip.root.onClick:Set(function()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
    OpenWindow(WinResConfig.AttributeDesWindow.name)
  end)
  uis.Main.Details.Label1.PlotBtn.onClick:Set(function()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_ROLE_SLIDE)
    CardDetailsWindow.SwitchDetailsBgEffect(WindowMsgEnum.COM_TYPE.INFO)
    ChangeController(uis.Main.c1Ctr, WindowMsgEnum.COM_TYPE.PLOT)
    CardStoryWindow.Open(uis.Main.CardStory)
    CardDetailsWindow.SetCtrIndex()
  end)
  uis.Main.Details.Label1.ClothesBtn.onClick:Set(function()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_ROLE_SLIDE)
    CardDetailsWindow.SwitchDetailsBgEffect(WindowMsgEnum.COM_TYPE.CLOTHES)
    ChangeController(uis.Main.c1Ctr, WindowMsgEnum.COM_TYPE.CLOTHES)
    CardClothesWindow.Open(uis.Main.CardClothes)
    CardDetailsWindow.SetCtrIndex()
  end)
  uis.Main.Details.Label1.BadgeBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BADGE) then
      OpenWindow(WinResConfig.BadgeWindow.name, nil, cardId)
    end
  end)
end

function CardDetailsWindow.UpdateFuncUnlock()
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.HOME_BADGE, function(isUnlock)
    ChangeUIController(uis.Main.Details.Label1.BadgeBtn, "lock", isUnlock and 0 or 1)
  end)
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.CARD_SKILL_LEVELUP, function(isUnlock)
    ChangeUIController(uis.Main.Details.SkillUpBtn, "lock", isUnlock and 0 or 1)
  end)
end

function CardDetailsWindow.Back()
  if uis.Main.c1Ctr.selectedIndex == WindowMsgEnum.COM_TYPE.INFO then
    UIMgr:CloseWindow(WinResConfig.CardDetailsWindow.name, nil, true)
    UIMgr:SendWindowMessage(WinResConfig.CardListWindow.name, WindowMsgEnum.COM_TYPE.INFO)
  else
    if uis.Main.c1Ctr.selectedIndex == WindowMsgEnum.COM_TYPE.LV_UP then
      CardLevelUpWindow.QuitHide()
    elseif uis.Main.c1Ctr.selectedIndex == WindowMsgEnum.COM_TYPE.BREACH_UP then
      CardBreachUpWindow.QuitHide()
    elseif uis.Main.c1Ctr.selectedIndex == WindowMsgEnum.COM_TYPE.STAR_UP then
      uis.Main.CardShow.root.visible = true
      CardStarUpWindow.OnHide()
    elseif uis.Main.c1Ctr.selectedIndex == WindowMsgEnum.COM_TYPE.CLOTHES then
      CardDetailsWindow.RefreshFashion(CardMgr.cardInfoData.fashionId)
    elseif uis.Main.c1Ctr.selectedIndex == WindowMsgEnum.COM_TYPE.SKILL_UP then
      uis.Main.CardShow.root.alpha = 1
      CardSkillUpWindow.QuitHide()
    elseif uis.Main.c1Ctr.selectedIndex == WindowMsgEnum.COM_TYPE.PLOT then
      CardStoryWindow.DestroyEffect()
    end
    RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.CARD)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.SLIDE_EFFECT)
    CardDetailsWindow.RefreshUI()
    CardDetailsWindow.SwitchDetailsBgEffect(WindowMsgEnum.COM_TYPE.INFO)
    ChangeController(uis.Main.c1Ctr, WindowMsgEnum.COM_TYPE.INFO)
    CardDetailsWindow.SetCtrIndex()
    uis.Main.CardShow.root.touchable = false
    PlayUITrans(uis.Main.Details.root, "DetailsIn", function()
      if uis and cardTouchable and uis.Main.c1Ctr.selectedIndex == WindowMsgEnum.COM_TYPE.INFO then
        uis.Main.CardShow.root.touchable = true
      end
    end)
  end
end

function CardDetailsWindow.ShowCurrencyReturn(bol)
  uis.Main.CurrencyReturn.root.visible = bol
end

function CardDetailsWindow.StopTalk()
  if curTypingEffect then
    curTypingEffect:Cancel()
    curTypingEffect = nil
  end
  if curSoundEventIns then
    SoundUtil.StopSoundEvent(curSoundEventIns)
    curSoundEventIns = nil
  end
end

function CardDetailsWindow.OnClose()
  CardDetailsWindow.StopTalk()
  RedDotMgr.RemoveNode(WinResConfig.CardDetailsWindow.name)
  CardSkillUpWindow.OnClose()
  CardStarUpWindow.OnClose()
  CardLevelUpWindow.OnClose()
  CardStoryWindow.OnClose()
  CardClothesWindow.OnClose()
  CardBreachUpWindow.OnClose()
  uis = nil
  contentPane = nil
  previewFashionId = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  Left = nil
  Right = nil
  PicImage = nil
end

function CardDetailsWindow.OnShown()
  if uis then
    CardDetailsWindow.ShowLeaderGuide()
    if uis.Main.c1Ctr.selectedIndex == WindowMsgEnum.COM_TYPE.STAR_UP then
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_STAR_IN)
    end
  end
end

function CardDetailsWindow.ShowLeaderGuide()
  local leaderGuideId = 70735110
  if GuideData.CanShowCaption(leaderGuideId) then
    local CheckBreach = function()
      local allCard = ActorData.GetCardList()
      for i, v in pairs(allCard) do
        if v.quality > 0 then
          return true
        end
      end
    end
    if CheckBreach() then
      WindowLoadPackages[WinResConfig.GuidePicLookWindow.name] = {
        "Guide_" .. Language.curLanguage
      }
      uis.root.touchable = false
      LeanTween.delayedCall(0.25, function()
        OpenWindow(WinResConfig.GuidePicLookWindow.name, nil, leaderGuideId, nil, true)
        uis.root.touchable = true
      end)
      GuideData.SaveCaptionOpen(leaderGuideId)
    end
  end
end

function CardDetailsWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.CardWindow.CHANGE_CARD then
    CardDetailsWindow.RefreshDetailsNum()
  elseif msgId == WindowMsgEnum.CardWindow.CLOTHES_PREVIEW then
    CardDetailsWindow.RefreshFashion(para)
  elseif msgId == WindowMsgEnum.CardWindow.BACK then
    CardDetailsWindow.Back()
  elseif msgId == WindowMsgEnum.Common.E_MSG_CARD_SKILL_UP then
    CardMgr.cardInfoData = CardData.GetCardDataById(cardId)
  elseif msgId == WindowMsgEnum.CardWindow.BREACH_UP then
    CardDetailsWindow.RefreshFashion(CardMgr.cardInfoData.fashionId)
  elseif msgId == WindowMsgEnum.CardWindow.OPEN_BREACH_UP then
    uis.Main.Details.LvUpBtn.onClick:Call()
  elseif msgId == WindowMsgEnum.CardWindow.SHOW_BACK then
    CardDetailsWindow.ShowCurrencyReturn(true)
  elseif msgId == WindowMsgEnum.CardWindow.HIDE_BACK then
    CardDetailsWindow.ShowCurrencyReturn(false)
  elseif msgId == WindowMsgEnum.CardWindow.CHANGE_CLOTHES then
    CardClothesWindow.UpdateCardInfo()
  elseif msgId == WindowMsgEnum.COM_TYPE.SKILL_TO_LEFT then
    PlayUITrans(uis.Main.root, "toleft")
  elseif msgId == WindowMsgEnum.COM_TYPE.SKILL_TO_RIGHT then
    PlayUITrans(uis.Main.root, "toright")
  elseif msgId == WindowMsgEnum.COM_TYPE.CHANGE_CARD then
    cardId = CardMgr.cardInfoData.cardId
    uis.Main.CardShow.CardShowList.numItems = 0
    CardDetailsWindow.InitCardShow()
    CardDetailsWindow.ChangeCard(cardId)
  elseif msgId == WindowMsgEnum.CardWindow.PLAY_GROW_UP_VOICE then
    CardDetailsWindow.StopTalk()
    LeanTween.delayedCall(para.delayTime, function()
      curTypingEffect, curSoundEventIns = UIUtil.ShowTalkWord(para.fashionId, para.bubbleType, nil, true, nil, para.level)
    end)
  end
end

return CardDetailsWindow
