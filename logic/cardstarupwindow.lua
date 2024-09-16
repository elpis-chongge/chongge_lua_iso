CardStarUpWindow = {}
local uis, starUpBol, backEffect, checkEffect

function CardStarUpWindow.Open(_uis)
  uis = _uis
  PlayUITrans(uis.root, "in")
  CardStarUpWindow.UpdateTextDisplay()
  CardStarUpWindow.OnInit()
  CardStarUpWindow.InitBtn()
end

function CardStarUpWindow.UpdateTextDisplay()
  UIUtil.SetText(uis.StarUp1.SkillAllLookBtn, T(1127))
  UIUtil.SetBtnText(uis.StarUpBtn, T(1281), T(33))
end

function CardStarUpWindow.ShowStarEffect()
  if backEffect then
    local func = function(root)
      if root then
        local star
        for i = 1, 5 do
          star = root:Find("star_" .. i)
          if star then
            star:Find("lead_par (1)").gameObject:SetActive(i > CardMgr.cardInfoData.grade)
            if 5 == i then
              if CardMgr.cardInfoData.grade >= 5 then
                star:Find("lead_par (2)").gameObject:SetActive(true)
                star:Find("lead_par (3)").gameObject:SetActive(false)
              else
                star:Find("lead_par (2)").gameObject:SetActive(false)
                star:Find("lead_par (3)").gameObject:SetActive(true)
              end
            end
          end
        end
      end
    end
    local root = LuaUtil.FindChild(backEffect.transform, "GameObject (2)", true)
    root = LuaUtil.FindChild(root, "mesh_loft_circle_2", true)
    func(root)
    root = LuaUtil.FindChild(backEffect.transform, "GameObject (3)", true)
    root = LuaUtil.FindChild(root, "mesh_loft_circle_2", true)
    func(root)
  end
end

function CardStarUpWindow.OnInit()
  UIUtil.InitAssetsTips(uis.AssetsTipsList, {
    COMMON_ITEM_ID.GAME_COIN
  })
  if nil == backEffect then
    backEffect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/starrank/FX_ui_starrank_back.prefab", uis.ResourcesHolder)
  end
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_STAR_IN)
  backEffect:SetActive(true)
  CardStarUpWindow.ShowStarEffect()
  
  function uis.StarUp1.StarList.itemRenderer(i, starItem)
    if CardMgr.cardInfoData.grade >= i + 1 then
      ChangeUIController(starItem, nil, 1)
    elseif CardMgr.cardInfoData.grade == i then
      ChangeUIController(starItem, nil, 2)
    else
      ChangeUIController(starItem, nil, 0)
    end
  end
  
  uis.StarUp1.StarList.numItems = math.max(CardMgr.cardConfigData.star, CardMgr.cardInfoData.grade)
  local skillList = uis.StarUp1.SkillList
  local skillData = CardMgr.cardConfigData.unlock_skill_ids
  
  function skillList.itemRenderer(i, item)
    local data = TableData.GetConfig(skillData[i + 1], "BaseSkill")
    item:GetChild("PicLoader").url = UIUtil.GetResUrl(data.icon)
    if CardMgr.cardInfoData.skill2Level[data.id] then
      ChangeUIController(item, "c2", 1)
    else
      ChangeUIController(item, "c2", 0)
    end
    local lock = item:GetChild("Lock")
    if lock then
      lock.visible = CardMgr.cardInfoData.grade == i
      UIUtil.SetText(lock, i + 1)
    end
    ChangeUIController(item, "c1", i)
    item.onClick:Set(function()
      OpenWindow(WinResConfig.StarOneSkillWindow.name, nil, {
        page = i,
        lv = CardMgr.cardInfoData.skill2Level[data.id],
        id = data.id
      })
    end)
  end
  
  skillList.numItems = #skillData
  uis.StarUp1.SkillAllLookBtn.onClick:Set(function()
    OpenWindow(WinResConfig.StarSkillWindow.name, nil, CardMgr.cardInfoData.cardId)
  end)
  CardStarUpWindow.RefreshSpendItem()
  if CardStarUpWindow.StarIsMax() then
    ChangeController(uis.c1Ctr, 1)
  else
    ChangeController(uis.c1Ctr, 0)
  end
  if starUpBol and CardMgr.cardInfoData.grade < CardMgr.cardConfigData.grade_max then
    if nil == checkEffect then
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/starrank/FX_ui_weakup.prefab", uis.StarUpBtn:GetChild("EffectHolder"))
    end
    CardStarUpWindow.ShowCheckEffect(true)
  end
end

function CardStarUpWindow.ShowCheckEffect(bol)
  uis.StarUpBtn:GetChild("EffectHolder").visible = bol
end

function CardStarUpWindow.RefreshSpendItem()
  local spendList = uis.StarUp2.StarList
  local tb = GetConfigItemList(CardMgr.CardGradeUpData.cost, true)
  starUpBol = true
  table.sort(tb, function(a, b)
    if a.id and b.id then
      return a.id < b.id
    end
  end)
  
  function spendList.itemRenderer(i, item)
    if tb[i + 1] then
      CardStarUpWindow.SpendItem(tb[i + 1], item)
    end
  end
  
  spendList.numItems = #tb
end

function CardStarUpWindow.SpendItem(data, item)
  local count = ActorData.GetItemCount(data.id)
  if count >= data.value then
    ChangeUIController(item, "c1", 0)
  else
    starUpBol = false
    ChangeUIController(item, "c1", 1)
  end
  if data.id == COMMON_ITEM_ID.GAME_COIN then
    if count >= data.value then
      UIUtil.SetText(item, T(828, data.value), "NumberTxt")
    else
      UIUtil.SetText(item, T(622, data.value), "NumberTxt")
    end
  elseif count >= data.value then
    UIUtil.SetText(item, T(946, count, data.value), "NumberTxt")
  else
    UIUtil.SetText(item, T(827, count, data.value), "NumberTxt")
  end
  local itemData = TableData.GetConfig(data.id, "BaseItem")
  if itemData then
    item:GetChild("PicLoader").url = UIUtil.GetResUrl(itemData.icon)
  end
  item.onClick:Set(function()
    local needCount = data.value - count
    if needCount <= 0 then
      needCount = nil
    end
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
    OpenWindow(WinResConfig.ItemGetTipsWindow.name, nil, {
      id = data.id,
      needCount = needCount,
      fromCardId = CardMgr.cardId
    })
  end)
end

function CardStarUpWindow.RefreshStarUp()
  if uis then
    CardStarUpWindow.OnInit()
  end
end

function CardStarUpWindow.StarIsMax()
  return CardMgr.cardInfoData.grade == CardMgr.cardConfigData.grade_max
end

function CardStarUpWindow.InitBtn()
  uis.StarUpBtn.onClick:Set(function()
    if CardMgr.cardInfoData.grade >= 5 then
      return
    end
    if starUpBol and CardMgr.cardInfoData.grade < CardMgr.cardConfigData.grade_max then
      CardService.StarUpCardReq(CardMgr.cardId)
    else
      FloatTipsUtil.ShowWarnTips(T(78))
    end
  end)
  uis.StarExchangeBtn.onClick:Set(function()
    ld("Message", function()
      OpenWindow(WinResConfig.DebrisWindow.name, nil, CardMgr.cardConfigData.convert_item)
    end)
  end)
  UIUtil.SetText(uis.StarExchangeBtn, T(1475))
  CardStarUpWindow.ShowStarExchangeBtn()
end

function CardStarUpWindow.RefreshDebrisExchange()
  CardStarUpWindow.RefreshSpendItem()
  CardStarUpWindow.ShowStarExchangeBtn()
end

function CardStarUpWindow.ShowStarExchangeBtn()
  local id = CardMgr.cardInfoData.cardId * 1000 + CardMgr.cardInfoData.grade
  local num = CardData.GetCardStarDebrisNum(id)
  uis.StarExchangeBtn.visible = num < CardMgr.cardConfigData.grade_max - CardMgr.cardInfoData.grade
  local itemId = CardMgr.GetItemIdByStarLv(CardMgr.cardConfigData.star)
  local bol = false
  if itemId and ActorData.GetItemCount(itemId) > 0 then
    bol = true
  end
  local redCom = uis.StarExchangeBtn:GetChild("Red")
  if redCom then
    redCom.visible = bol
  end
end

function CardStarUpWindow.HandleMessage(msgId, para)
end

function CardStarUpWindow.OnHide()
  if backEffect then
    backEffect:SetActive(false)
  end
  CardStarUpWindow.ShowCheckEffect(false)
end

function CardStarUpWindow.OnClose()
  uis = nil
  starUpBol = nil
  backEffect = nil
  checkEffect = nil
end

return CardStarUpWindow
