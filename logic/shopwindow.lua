require("Shop_ShopWindowByName")
local ShopWindow = {}
local uis, contentPane, maxRefreshNum, recommendMap, teamGiftType, PLATFORM_TYPE, tabInit, MonthTime, jumpTb, notReopen
local tokenShopBar = {}
local firstTran, lastIndex
local oneGiftInterval = 0.05
local showAgreementEffect
local firstGiftId = 27000100
local JumpTargetType = {
  Gold = 1,
  Gift = 2,
  MonthCard = 3,
  Fashion = 4,
  Shop = 5,
  PassPort = 6,
  FirstGift = 7,
  OneGift = 8
}

function ShopWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ShopWindow.package, WinResConfig.ShopWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetShop_ShopWindowUis(contentPane)
    local page = bridgeObj.argTable[1]
    local twoPage = bridgeObj.argTable[2]
    if twoPage then
      UIMgr:SetWindowArgs(WinResConfig.ShopWindow.name, {
        bridgeObj.argTable[1],
        nil,
        bridgeObj.argTable[3]
      })
    end
    notReopen = bridgeObj.argTable[3]
    tabInit = {}
    lastIndex = 0
    showAgreementEffect = nil
    firstTran = {}
    ShopData.InitNew()
    MonthTime = {}
    ShopWindow.GetPlatform()
    ShopWindow.InitBtn()
    ShopWindow.UpdateTextDisplay()
    page = page or 1
    ShopWindow.TabOnClick(page, twoPage)
    ShopWindow.GetServerData()
    ShopWindow.InitReaDot()
  end)
end

function ShopWindow.InitReaDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.ShopWindow.name,
    com = uis.Main.TabRegion.Tab3Btn,
    visibleFunc = function()
      return RedDotShop.CanFreeGift() or RedDotShop.CanFirstGift() or RedDotShop.CanAgreementGift()
    end,
    dataType = RED_DOT_DATA_TYPE.SHOP
  })
end

function ShopWindow.SetAssetsTips(data)
  if data then
    UIUtil.InitAssetsTips(uis.Main.Collection.AssetsTipsGroup.AssetsTipsList, data)
  end
end

function ShopWindow.GetServerData()
  CardService.GetAllCardFashionReq()
end

function ShopWindow.GetPlatform()
  local platform = CS.UnityEngine.RuntimePlatform
  if Application.platform == platform.IPhonePlayer then
    PLATFORM_TYPE = ProtoEnum.PLATFORM_TYPE.PFT_IOS
  elseif Application.platform == platform.Android or Application.platform == platform.WindowsEditor or Application.platform == platform.WindowsPlayer then
    PLATFORM_TYPE = ProtoEnum.PLATFORM_TYPE.PFT_ANDROID
  end
end

function ShopWindow.UpdateTextDisplay()
  local TabRegion = uis.Main.TabRegion
  UIUtil.SetBtnText(TabRegion.Tab1Btn, T(452), T(453))
  UIUtil.SetBtnText(TabRegion.Tab2Btn, T(454), T(455))
  UIUtil.SetBtnText(TabRegion.Tab3Btn, T(456), T(457))
  UIUtil.SetBtnText(TabRegion.Tab4Btn, T(458), T(459))
  UIUtil.SetBtnText(TabRegion.Tab5Btn, T(460), T(461))
  UIUtil.SetText(uis.Main.Collection.Recharge.Jap1Btn, T(483))
  UIUtil.SetText(uis.Main.Collection.Recharge.Jap2Btn, T(484))
  UIUtil.SetText(uis.Main.Collection.Token.ExplainBtn, T(1017), "SpendTxt")
end

function ShopWindow.InitTab(data, list, callBack, initIndex)
  if #data > 0 and list and callBack then
    local index = initIndex or 0
    
    function list.itemRenderer(i, item)
      local nameEn = data[i + 1].name_english and data[i + 1].name_english() or ""
      UIUtil.SetBtnText(item, data[i + 1].name(), nameEn)
      if data[i + 1].icon then
        item:GetChild("PicLoader").url = data[i + 1].icon
      end
      item.soundFmod = SOUND_EVENT_ENUM.TAB_TAG1
      item.onClick:Set(function()
        if list.selectedIndex ~= i then
          list.selectedIndex = i
        end
        if callBack then
          callBack(data[i + 1])
        end
      end)
      if data[i + 1].visibleFunc then
        RedDotMgr.AddNode({
          windowName = WinResConfig.ShopWindow.name,
          com = item,
          visibleFunc = data[i + 1].visibleFunc,
          dataType = RED_DOT_DATA_TYPE.SHOP
        })
      end
      if i == index then
        item.onClick:Call()
      end
    end
    
    list.numItems = #data
  end
end

function ShopWindow.InitToken(page)
  tokenShopBar = {}
  local tokenData = ShopWindow.GetTokenData()
  uis.Main.Collection.Token.LeftTab.LeftTabList.selectedIndex = -1
  ShopWindow.InitTab(tokenData, uis.Main.Collection.Token.LeftTab.LeftTabList, function(data)
    ShopData.curShopType = data.type
    tokenShopBar[data.type] = data.bar_res
    ShopWindow.RefreshTokenShopList(data.bar_res)
  end, page)
end

function ShopWindow.RefreshTokenShopList(barRes)
  ShopWindow.SortGoods()
  
  function uis.Main.Collection.Token.TokenItem.TokenList.itemRenderer(i, tips)
    local data = TableData.GetConfig(ShopData.shopInfo[ShopData.curShopType].goods[i + 1].goodsId, "BaseShopPool")
    if data then
      local tokenCom = tips:GetChild("TokenTips")
      local item = tokenCom:GetChild("TokenTipsBtn")
      local itemData, ctrType = ShopWindow.ShowOneReward(data.item, item, "ItemLoader", "ItemNumberTxt", true)
      if itemData then
        item:GetChild("NameTxt").text = itemData.name()
        ChangeUIController(item, "c1", itemData.quality)
      end
      if ctrType then
        ChangeUIController(item, "c3", ctrType)
      end
      if 0 == ctrType then
        local type, detailData = ShopMgr.GetLookDetailsBtn(itemData.id)
        if detailData and #detailData > 0 then
          ChangeUIController(item:GetChild("UseMark"), "c1", type == USE_TYPE.CARD and 1 or 2)
          ChangeUIController(item, "c4", 1)
        else
          ChangeUIController(item, "c4", 0)
        end
      else
        ChangeUIController(item, "c4", 0)
      end
      local time = ShopData.shopInfo[ShopData.curShopType].goods[i + 1].nextRefreshTime - LoginData.GetCurServerTime()
      if time <= 0 and ShopData.shopInfo[ShopData.curShopType].goods[i + 1].endTime > 0 then
        time = ShopData.shopInfo[ShopData.curShopType].goods[i + 1].endTime - LoginData.GetCurServerTime()
      end
      if time > 0 then
        ChangeUIController(item, "time", 1)
        local timeCom = item:GetChild("Time")
        UIUtil.SetText(timeCom, TimeUtil.FormatEnTime(time), "TimeTxt")
        UIUtil.SetEffectToUI("Assets/Art/Models/UI_spine/prefab/ui_timeword_hourglass.prefab", timeCom:GetChild("TimeHolder"), 1.2)
      else
        ChangeUIController(item, "time", 0)
      end
      UIUtil.SetText(item, T(697), "Decorate1Txt")
      ShopWindow.ShowOneReward(data.sell_price, item, "PriceLoader", "PriceTxt", nil, true)
      local num = ShopWindow.GetLimitNum(data.grid_id)
      if num and num > ShopData.shopInfo[ShopData.curShopType].goods[i + 1].boughtNum or -1 == num then
        if -1 == num then
          item:GetChild("BuyTimesTxt").text = T(1549)
        else
          item:GetChild("BuyTimesTxt").text = T(438, num - ShopData.shopInfo[ShopData.curShopType].goods[i + 1].boughtNum)
        end
        item.onClick:Set(function()
          OpenWindow(WinResConfig.ShopTokensTipsWindow.name, nil, ShopData.shopInfo[ShopData.curShopType].goods[i + 1].goodsId, barRes)
        end)
        ChangeUIController(item, "c2", 0)
        ChangeUIController(tokenCom, "c1", 0)
      else
        item.onClick:Set(function()
          FloatTipsUtil.ShowWarnTips(T(481))
        end)
        item:GetChild("BuyTimesTxt").text = T(438, 0)
        UIUtil.SetText(tokenCom:GetChild("SellOut"), T(469), "NameTxt")
        ChangeUIController(tokenCom, "c1", 1)
        ChangeUIController(item, "c2", 1)
      end
      local OriginalPriceTxt = item:GetChild("OriginalPriceTxt")
      if data.sell_type and data.sell_price_original then
        item:GetChild("Discount"):GetChild("DiscountTxt").text = T(468, data.sell_type)
        item:GetChild("Discount").visible = true
        UIUtil.SetText(OriginalPriceTxt, data.sell_price_original, "OriginalPriceTxt")
        OriginalPriceTxt.visible = true
      else
        OriginalPriceTxt.visible = false
        item:GetChild("Discount").visible = false
      end
      tokenCom.alpha = 0
      PlayUITrans(tips, "up", nil, Const.gridSpeed * i)
    end
  end
  
  if ShopData.shopInfo[ShopData.curShopType] then
    uis.Main.Collection.Token.TokenItem.TokenList.numItems = #ShopData.shopInfo[ShopData.curShopType].goods
  end
  ShopWindow.SetAssetsTips(barRes)
  uis.Main.Collection.Token.TokenItem.TokenList.scrollPane.posX = 0
end

function ShopWindow.CanRefresh()
  local curTime = LoginData.GetCurServerTime()
  for i, v in pairs(ShopData.shopInfo) do
    for k, vv in pairs(v.goods) do
      if vv.nextRefreshTime > 0 and curTime >= vv.nextRefreshTime then
        return true
      end
    end
  end
end

function ShopWindow.SortGoods()
  local tempData = {}
  if ShopData.shopInfo[ShopData.curShopType] then
    for i, v in pairs(ShopData.shopInfo[ShopData.curShopType].goods) do
      tempData[v.gridId] = TableData.GetConfig(v.gridId, "BaseShopGrid")
    end
    if #ShopData.shopInfo[ShopData.curShopType].goods > 1 then
      table.sort(ShopData.shopInfo[ShopData.curShopType].goods, function(a, b)
        if tempData[a.gridId].sort_index and tempData[b.gridId].sort_index then
          return tempData[a.gridId].sort_index > tempData[b.gridId].sort_index
        end
      end)
    end
  end
end

function ShopWindow.GetTokenData()
  local config = TableData.GetTable("BaseShop")
  local tb = {}
  for i, v in pairs(config) do
    if v.show_type and 1 == v.show_type then
      v.icon = "ui://foo80bnvfcp34c"
      table.insert(tb, v)
    end
  end
  table.sort(tb, function(a, b)
    if a.sort_index or b.sort_index then
      return a.sort_index < b.sort_index
    end
  end)
  return tb
end

function ShopWindow.InitRecharge()
  local rechargeData = ShopWindow.GetRechargeData()
  local len = #rechargeData
  local numCom, giveCom
  
  function uis.Main.Collection.Recharge.RechargeList.itemRenderer(i, item)
    local data = TableData.GetConfig(rechargeData[i + 1].id, "BasePayProduct")
    if data then
      item:GetChild("NameTxt").text = data.name()
      item:GetChild("PriceTxt").text = T(518, 22, data.price)
      item:GetChild("PicLoader").url = UIUtil.GetResUrl(data.icon)
      UIUtil.SetText(item, T(713), "SubtitleTxt")
      ChangeUIController(item, "c2", i)
      numCom = item:GetChild("GetNumber")
      UIUtil.SetIconById(numCom:GetChild("PicLoader"), COMMON_ITEM_ID.RECHARGE_DIAMOND)
      UIUtil.SetText(numCom, data.diamond, "NumberTxt")
      giveCom = item:GetChild("GiveNumber")
      UIUtil.SetIconById(giveCom:GetChild("PicLoader"), COMMON_ITEM_ID.RECHARGE_DIAMOND)
      UIUtil.SetText(giveCom, T(517), "WordTxtTxt")
      if ShopData.limitRecord[data.id] == nil or 0 == ShopData.limitRecord[data.id] then
        ChangeUIController(item, nil, 0)
        item:GetChild("Double"):GetChild("WordTxt").text = T(694)
        item:GetChild("Double"):GetChild("Word1Txt").text = T(1016)
        giveCom.visible = true
        UIUtil.SetText(giveCom, data.extra_diamond + data.extra_bindDiamond + data.first_diamond + data.first_bindDiamond, "NumberTxt")
      else
        ChangeUIController(item, nil, 1)
        local diamond = data.extra_diamond + data.extra_bindDiamond
        giveCom.visible = diamond > 0
        UIUtil.SetText(giveCom, diamond, "NumberTxt")
      end
      if len - 2 == i then
        UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_recharge_1.prefab", item:GetChild("EffectHolder"))
      end
      if len - 1 == i then
        UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_recharge_2.prefab", item:GetChild("EffectHolder"))
      end
      item.onClick:Set(function()
        ShopMgr.BuyProduct(data.id)
      end)
    end
  end
  
  uis.Main.Collection.Recharge.RechargeList.numItems = len
end

function ShopWindow.GetRechargeData()
  local t = {}
  local curTime = LoginData.GetCurServerTime()
  if ShopData.productInfo[ProtoEnum.PRODUCT_TYPE.PT_RECHARGE] then
    for i, v in pairs(ShopData.productInfo[ProtoEnum.PRODUCT_TYPE.PT_RECHARGE]) do
      if -1 == v.endStamp or curTime < v.endStamp then
        table.insert(t, v)
      end
    end
  end
  table.sort(t, function(a, b)
    if a.sort == b.sort then
      return a.id < b.id
    else
      return a.sort < b.sort
    end
  end)
  return t
end

function ShopWindow.CheckRecommendTime()
  local curTime = LoginData.GetCurServerTime()
  for i = #ShopData.RecommendInfo, 1, -1 do
    if -1 ~= ShopData.RecommendInfo[i].endStamp and curTime > ShopData.RecommendInfo[i].endStamp then
      return true
    end
  end
end

function ShopWindow.DisposeRecommend()
  if recommendMap then
    for i, v in pairs(recommendMap) do
      v:Dispose()
    end
  end
  recommendMap = {}
end

function ShopWindow.RemoveFirstGiftByRecommend()
  if ShopData.isBought and ShopData.RecommendInfo then
    local arr
    for i, v in pairs(ShopData.RecommendInfo) do
      if v.boughtHide and v.jumpTargets[1] then
        arr = Split(v.jumpTargets[1], ":")
        if 2 == #arr and tonumber(arr[1]) == JumpTargetType.FirstGift then
          table.remove(ShopData.RecommendInfo, i)
          ShopMgr.recommendPage = 0
          return
        end
      end
    end
  end
end

function ShopWindow.InitRecommend()
  ShopWindow.RemoveFirstGiftByRecommend()
  if ShopData.RecommendInfo and #ShopData.RecommendInfo > 0 then
    local tb = {
      "Template1",
      "Template2",
      "Template3",
      "Month"
    }
    ShopWindow.DisposeRecommend()
    local allUid = {}
    ShopMgr.recommendPage = ShopMgr.recommendPage or 0
    local tabList = uis.Main.Collection.Recommend.LeftTab.LeftTabList
    table.sort(ShopData.RecommendInfo, function(a, b)
      return a.sortValue < b.sortValue
    end)
    
    function tabList.itemRenderer(i, item)
      if 1 == ShopData.RecommendInfo[i + 1].imgLayout then
        local arr = Split(ShopData.RecommendInfo[i + 1].jumpTargets[1], ":")
        if tonumber(arr[1]) == JumpTargetType.MonthCard then
          recommendMap[i] = UIMgr:CreateObject("Shop", tb[4])
        else
          recommendMap[i] = UIMgr:CreateObject("Shop", tb[ShopData.RecommendInfo[i + 1].imgLayout])
        end
      else
        recommendMap[i] = UIMgr:CreateObject("Shop", tb[ShopData.RecommendInfo[i + 1].imgLayout])
      end
      item:GetChild("PicLoader").url = "ui://foo80bnvfcp34b"
      UIUtil.SetBtnText(item, ShopData.RecommendInfo[i + 1].cnName, ShopData.RecommendInfo[i + 1].enName)
      allUid[ShopData.RecommendInfo[i + 1].uid] = true
      item:GetChild("New").visible = ShopData.NewIsShow(ShopData.RecommendInfo[i + 1].uid)
      item.onClick:Set(function()
        if -1 ~= ShopData.RecommendInfo[i + 1].endStamp and ShopData.RecommendInfo[i + 1].endStamp < LoginData.GetCurServerTime() then
          FloatTipsUtil.ShowWarnTips(1059)
          ShopService.GetAllRecommendImgReq()
          return
        end
        if tabList.selectedIndex ~= i then
          tabList.selectedIndex = i
        end
        ShopMgr.recommendPage = i
        item:GetChild("New").visible = false
        if ShopData.NewIsShow(ShopData.RecommendInfo[i + 1].uid) then
          ShopData.SaveNew(ShopData.RecommendInfo[i + 1].uid, allUid)
        end
        local Switch = function()
          ShopWindow.LoadTemplateInfo(ShopData.RecommendInfo[i + 1], recommendMap[i])
          local list = uis.Main.Collection.Recommend.TemplateList
          if list.numChildren > 0 then
            list:RemoveChildAt(0, false)
          end
          local index = uis.Main.Collection.Recommend.LeftTab.LeftTabList.selectedIndex
          recommendMap[index].visible = true
          list:AddChild(recommendMap[index])
          SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.SHOP_BANNER_OPEN)
        end
        if nil == firstTran[1] then
          Switch()
        else
          local trans = uis.Main.Collection.Recommend.root:GetTransition("switch")
          if trans then
            trans:SetHook("Sign", function()
              Switch()
            end)
            trans:Play()
          end
        end
      end)
      if i == ShopMgr.recommendPage then
        item.onClick:Call()
      end
    end
    
    tabList.numItems = #ShopData.RecommendInfo
    if nil == firstTran[1] then
      PlayUITrans(uis.Main.Collection.Recommend.root, "in")
    end
  end
end

local TableName = {
  "BasePayProduct",
  "BasePayProduct",
  "BasePayProduct",
  "BaseFashion",
  "BaseShopPool",
  "BasePayProduct",
  "BaseGift"
}

function ShopWindow.LoadTemplateInfo(data, com)
  for i = 1, data.imgLayout do
    local btn = com:GetChild(string.format("Push%dBtn", i))
    if nil == btn then
      btn = com:GetChild("MonthBuyBtn")
    end
    ShopWindow.LoadTexture(btn:GetChild("PicLoader"), data.images[i])
    local arr = Split(data.jumpTargets[i], ":")
    if #arr >= 2 then
      local recommendData, type, jumpId
      type = tonumber(arr[1])
      jumpId = tonumber(arr[2])
      if jumpId == firstGiftId then
        recommendData = TableData.GetConfig(jumpId, "BaseGift")
      elseif type == JumpTargetType.OneGift then
        recommendData = TableData.GetConfig(jumpId, "BasePayProduct")
      else
        recommendData = TableData.GetConfig(jumpId, TableName[type])
      end
      if recommendData then
        if type == JumpTargetType.MonthCard then
          local buyBtn = com:GetChild("MonthBuyBtn")
          UIUtil.SetText(buyBtn, T(518, 30, recommendData.price), "PriceTxt")
          MonthTime[recommendData.month_card_type] = buyBtn:GetChild("MonthTime")
          ShopWindow.UpdateMonthDay()
          local MonthExplainBtn = com:GetChild("MonthExplainBtn")
          if MonthExplainBtn then
            local productData = TableData.GetConfig(recommendData.id, "BasePayProduct")
            if productData and productData.rule_des then
              MonthExplainBtn.onClick:Set(function()
                OpenWindow(WinResConfig.ShopMonthExplainWindow.name, nil, productData.rule_des)
              end)
            end
          end
        end
        btn.onClick:Set(function()
          if data.jumpTypes then
            if jumpId == firstGiftId then
              ShopWindow.TabOnClick(3, 2)
              PlayUITrans(uis.Main.Collection.Gift.root, "FristIn")
              return
            end
            if type == JumpTargetType.OneGift then
              local allTab = ShopWindow.GetGiftData()
              local page = 3
              if allTab then
                for i, v in pairs(allTab) do
                  if 13 == v.type then
                    page = i - 1
                    break
                  end
                end
              end
              ShopWindow.TabOnClick(3, page)
              PlayUITrans(uis.Main.Collection.Gift.root, "FristIn")
              return
            end
            if type == JumpTargetType.PassPort then
              CurrencyReturnWindow.jumpPassport()
              return
            end
            if 1 == data.jumpTypes[i] then
              ShopWindow.JumpBuy(type, recommendData)
            else
              ShopWindow.Buy(type, recommendData)
            end
          end
        end)
      end
    end
  end
end

function ShopWindow.JumpBuy(type, recommendData)
  if type == JumpTargetType.Gold then
    uis.Main.TabRegion.Tab2Btn.onClick:Call()
  elseif type == JumpTargetType.Gift then
    if ShopMgr.ProductIsBuy(recommendData.id, ProtoEnum.PRODUCT_TYPE.PT_GIFT) then
      uis.Main.TabRegion.Tab3Btn.onClick:Call()
      OpenWindow(WinResConfig.ShopGiftTipsWindow.name, nil, recommendData.id)
    end
  elseif type == JumpTargetType.MonthCard then
    uis.Main.TabRegion.Tab3Btn.onClick:Call()
    OpenWindow(WinResConfig.ShopGiftTipsWindow.name, nil, recommendData.id)
  elseif type == JumpTargetType.Fashion then
    if ShopMgr.ProductIsBuy(recommendData.id, ProtoEnum.PRODUCT_TYPE.PT_FASHION) then
      uis.Main.TabRegion.Tab4Btn.onClick:Call()
      OpenWindow(WinResConfig.ShopClothesDetailsWindow.name, nil, recommendData.id)
    end
  elseif type == JumpTargetType.Shop and ShopMgr.TokenIsBuy(recommendData.id) then
    uis.Main.TabRegion.Tab5Btn.onClick:Call()
    OpenWindow(WinResConfig.ShopTokensTipsWindow.name, nil, recommendData.id, {21000201, 21000202})
  end
end

function ShopWindow.Buy(type, recommendData)
  if type == JumpTargetType.Gold then
    ShopMgr.BuyProduct(recommendData.id)
  elseif type == JumpTargetType.Gift then
    if ShopMgr.ProductIsBuy(recommendData.id, ProtoEnum.PRODUCT_TYPE.PT_GIFT) then
      OpenWindow(WinResConfig.ShopGiftTipsWindow.name, nil, recommendData.id)
    end
  elseif type == JumpTargetType.MonthCard then
    OpenWindow(WinResConfig.ShopGiftTipsWindow.name, nil, recommendData.id)
  elseif type == JumpTargetType.Fashion then
    if ShopMgr.ProductIsBuy(recommendData.id, ProtoEnum.PRODUCT_TYPE.PT_FASHION) then
      OpenWindow(WinResConfig.ShopClothesDetailsWindow.name, nil, recommendData.id)
    end
  elseif type == JumpTargetType.Shop and ShopMgr.TokenIsBuy(recommendData.id) then
    OpenWindow(WinResConfig.ShopTokensTipsWindow.name, nil, recommendData.id, {21000201, 21000202})
  end
end

function ShopWindow.UpdateMonthDay()
  if MonthTime then
    for i, v in pairs(MonthTime) do
      local time = ShopData.monthCardDay[i] or 0
      if v and ShopData.monthCardDay[i] and time > 0 then
        if ShopData.monthCardReward[i] == nil or ShopData.monthCardReward[i] == false then
          ChangeUIController(v, "c2", 0)
        else
          ChangeUIController(v, "c2", 1)
          UIUtil.SetText(v, T(1080), "GetWordTxt")
        end
        UIUtil.SetText(v, T(1036), "WordTxt")
        UIUtil.SetText(v, T(1069, ShopData.monthCardDay[i]), "TimeTxt")
        ChangeUIController(v, "c1", 1)
      else
        UIUtil.SetText(v, T(525), "NoneTxt")
        ChangeUIController(v, "c1", 0)
        ChangeUIController(v, "c2", 0)
      end
    end
  end
end

function ShopWindow.LoadTexture(loader, url)
  if loader then
    if string.find(url, "http") then
      loader.url = url
    else
      loader.url = UIUtil.GetResUrl(url)
    end
  end
end

function ShopWindow.DisposeMap()
  if recommendMap then
    for i, v in pairs(recommendMap) do
      v:Dispose()
    end
  end
  recommendMap = nil
end

function ShopWindow.InitClothes()
  ShopWindow.RefreshClothesList()
end

function ShopWindow.RemovePastTime(info)
  local data = {}
  if info then
    local curTime = LoginData.GetCurServerTime()
    for i, v in pairs(info) do
      if -1 == v.endStamp or curTime < v.endStamp then
        table.insert(data, v)
      end
    end
  end
  table.sort(data, function(a, b)
    if a.owned or CardData.FashionIsContain(a.id) then
      if b.owned or CardData.FashionIsContain(b.id) then
        if a.sort == b.sort then
          return a.id < b.id
        else
          return a.sort < b.sort
        end
      else
        return false
      end
    elseif b.owned or CardData.FashionIsContain(b.id) then
      return true
    elseif a.sort == b.sort then
      return a.id < b.id
    else
      return a.sort < b.sort
    end
  end)
  return data
end

function ShopWindow.RefreshClothesList()
  local data = ShopWindow.RemovePastTime(ShopData.productInfo[ProtoEnum.PRODUCT_TYPE.PT_FASHION])
  if nil ~= data then
    local curTime = LoginData.GetCurServerTime()
    
    function uis.Main.Collection.Clothes.ClothesList.itemRenderer(i, clothes)
      local info = TableData.GetConfig(data[i + 1].id, "BaseFashion")
      if info then
        local item = clothes:GetChild("ClothesTipsBtn")
        ChangeUIController(item, "c2", info.is_senior - 1)
        UIUtil.SetText(item, T(713), "SubtitleTxt")
        local ClothesName = item:GetChild("ClothesName")
        if info.name then
          UIUtil.SetText(ClothesName, info.name(), "ClothesNameTxt")
        end
        local clothesTime = item:GetChild("ClothesTime")
        if -1 ~= data[i + 1].endStamp and data[i + 1].endStamp - curTime > 0 then
          ChangeUIController(item, "c3", 1)
          clothesTime:GetChild("TipsTxt").text = TimeUtil.FormatEnTime(data[i + 1].endStamp - curTime, true)
        else
          ChangeUIController(item, "c3", 0)
        end
        local picCom = item:GetChild("PriceLoader")
        UIUtil.SetPrice(info.cost[1], picCom:GetChild("PriceTxt"), picCom:GetChild("PriceLoader"))
        local cardData = TableData.GetConfig(info.card_id, "BaseCard")
        UIUtil.SetText(ClothesName, cardData.name(), "CardNameTxt")
        UIUtil.SetText(ClothesName, cardData.name_english(), "CardNameENTxt")
        item:GetChild("ClothesShow"):GetChild("ClothesShowLoader").url = UIUtil.GetResUrl(info.head_icon_banner)
        if data[i + 1].owned or CardData.FashionIsContain(data[i + 1].id) then
          UIUtil.SetBtnText(item:GetChild("SellOut"), T(469), T(470))
          ChangeUIController(clothes, "c1", 1)
          UIUtil.SetText(item, T(698), "SellOutTxt")
          picCom.visible = false
          item:GetChild("New").visible = false
        else
          item:GetChild("New").visible = ShopData.NewIsShow(data[i + 1].id)
          picCom.visible = true
          ChangeUIController(clothes, "c1", 0)
        end
        item.onClick:Set(function()
          if LoginData.GetCurServerTime() >= data[i + 1].endStamp and -1 ~= data[i + 1].endStamp then
            FloatTipsUtil.ShowWarnTips(T(556))
            ShopWindow.RefreshClothesList()
            return
          end
          item:GetChild("New").visible = false
          if ShopData.NewIsShow(data[i + 1].id) then
            ShopData.SaveNew(data[i + 1].id)
          end
          OpenWindow(WinResConfig.ShopClothesDetailsWindow.name, nil, info.id)
        end)
      end
    end
    
    uis.Main.Collection.Clothes.ClothesList.numItems = #data
  end
end

function ShopWindow.GetGiftData()
  local RedFun = {
    [11] = function()
      return RedDotShop.CanFirstGift()
    end,
    [13] = function()
      return RedDotShop.CanAgreementGift()
    end,
    [1] = function()
      return RedDotShop.CanFreeGift(1)
    end,
    [2] = function()
      return RedDotShop.CanFreeGift(2)
    end
  }
  local pageData = TableData.GetTable("BaseGiftPage")
  local tb = {}
  local tempData
  for i, v in pairs(pageData) do
    tempData = SimpleCopy(v)
    tempData.icon = UIUtil.GetResUrl(tempData.icon)
    tempData.visibleFunc = RedFun[tempData.type]
    if 11 == tempData.type then
      local data = TableData.GetConfig(firstGiftId, "BaseGift")
      local giftInfo = ShopData.GetGiftInfoById(data.id)
      if nil == giftInfo then
        table.insert(tb, tempData)
      elseif data and giftInfo and not table.contain(giftInfo.rewards, data.gift_reward_ids[#data.gift_reward_ids]) then
        table.insert(tb, tempData)
      end
    else
      table.insert(tb, tempData)
    end
  end
  table.sort(tb, function(a, b)
    return a.sort > b.sort
  end)
  return tb
end

function ShopWindow.InitGift(initIndex)
  if nil == uis then
    return
  end
  local tabData = ShopWindow.GetGiftData()
  local list = uis.Main.Collection.Gift.LeftTab.LeftTabList
  ShopWindow.InitTab(tabData, list, function(data)
    teamGiftType = data.type
    if 11 == data.type then
      ShopService.GetGiftInfoReq(function()
        if uis then
          ShopWindow.RefreshFirstGift()
        end
      end)
    elseif 12 == data.type then
    elseif 13 == data.type then
      ShopWindow.ShowAgreementInfo()
    else
      ShopWindow.RefreshGiftShopList()
      uis.Main.Collection.Gift.c1Ctr.selectedIndex = 0
    end
  end, initIndex, true)
end

function ShopWindow.ShowAgreementInfo()
  ShopService.GetAgreementInfoReq(function()
    if uis then
      ShopWindow.RefreshOneGift()
    end
  end)
end

local GetState = function(groupId, data)
  if ShopData.agreementInfo and table.contain(ShopData.agreementInfo.openList, groupId) and data.need_day <= ShopData.agreementInfo.curDay then
    if table.contain(ShopData.agreementInfo.rewards, data.id) then
      return 2
    else
      return 0
    end
  end
  return 1
end

function ShopWindow.RefreshOneGift()
  ChangeController(uis.Main.Collection.Gift.c1Ctr, 2)
  local tips = uis.Main.Collection.Gift.OneYuanPassRegion.OneYuanPass
  tips.Activation.WordTxt.text = T(1508)
  tips.Word.WordTxt.text = T(1509)
  local ShowReward = function(groupId, up, playGet)
    local rewards = ShopMgr.GetOneGiftReward(groupId)
    for i = 1, #rewards do
      local data = rewards[i]
      local item = tips["Item" .. data.need_day]
      if item then
        item.NumberTxt.text = LuaUtil.FormatNum(data.need_day, "00")
        local root = up and item.Top.root or item.Below.root
        local addAttr = GetConfigItemList(data.reward, true)
        if addAttr[1] then
          local state = GetState(groupId, data)
          ChangeUIController(root, "c1", state)
          ChangeController(item.c1Ctr, state)
          if playGet and 0 == state then
            UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Onegift/FX_onegift_getitem.prefab", root:GetChild("Effect2Holder"))
          end
          if 0 ~= state then
            root:GetChild("Effect2Holder"):SetNativeObject(nil)
            root:GetChild("Effect1Holder"):SetNativeObject(nil)
          end
          ShopWindow.ShowAllItemFrame(addAttr[1], root, state, function()
            if 0 == state then
              ShopService.RewardAgreementReq(data.id, function()
                if uis then
                  ShopWindow.RefreshOneGift()
                  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SHOP)
                end
              end)
            else
              UIUtil.OpenPreviewTips(addAttr[1].id, addAttr[1].type)
            end
          end)
        end
      end
    end
  end
  if ShopData.agreementInfo then
    local data = TableData.GetConfig(ShopData.agreementInfo.season, "BaseActivityAgreement")
    if data then
      local playGet = ShopWindow.PlayInitGetEffect()
      ShowReward(data.free_group_id, true, playGet)
      ShowReward(data.pay_group_id, nil, playGet)
      if table.contain(ShopData.agreementInfo.openList, data.pay_group_id) then
        ChangeController(tips.c2Ctr, 1)
      else
        UIUtil.SetText(tips.BuyBtn, T(1507), "WordTxt")
        tips.BuyBtn.onClick:Set(function()
          local payData = ShopMgr.GetPayProductIdByType(8)
          if payData then
            ShopMgr.BuyProduct(payData.id)
          end
        end)
        ChangeController(tips.c2Ctr, 0)
      end
      if RedDotShop.CanAgreementGift() then
        ChangeController(tips.c1Ctr, 1)
        UIUtil.SetText(tips.GetBtn, T(1510), "WordTxt")
        tips.GetBtn.onClick:Set(function()
          ShopService.RewardAgreementReq(0, function()
            if uis then
              ShopWindow.RefreshOneGift()
              RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SHOP)
            end
          end)
        end)
      else
        ChangeController(tips.c1Ctr, 0)
      end
    end
  end
end

function ShopWindow.PlayInitGetEffect()
  if ShopData.agreementInfo then
    local day = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ONE_GIFT_DAY)
    if 7 == day and ShopData.agreementInfo.curDay < 7 then
      day = 0
    end
    if day < ShopData.agreementInfo.curDay then
      PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ONE_GIFT_DAY, ShopData.agreementInfo.curDay)
      local tips = uis.Main.Collection.Gift.OneYuanPassRegion.OneYuanPass
      local data = TableData.GetConfig(ShopData.agreementInfo.season, "BaseActivityAgreement")
      if data then
        local lock = table.contain(ShopData.agreementInfo.openList, data.pay_group_id)
        for i = day + 1, ShopData.agreementInfo.curDay do
          local item = tips["Item" .. i]
          if item then
            if lock then
              TimerUtil.setTimeout(i * oneGiftInterval, function()
                if uis and not item.Top.root.isDisposed then
                  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Onegift/FX_onegift_getitem_reflash.prefab", item.Top.root:GetChild("Effect2Holder"), nil, true, function()
                    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Onegift/FX_onegift_getitem.prefab", item.Below.root:GetChild("Effect2Holder"))
                    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Onegift/FX_onegift_getitem.prefab", item.Top.root:GetChild("Effect2Holder"))
                  end)
                end
              end)
            else
              TimerUtil.setTimeout(i * oneGiftInterval, function()
                if uis and not item.Top.root.isDisposed then
                  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Onegift/FX_onegift_getitem_reflash2.prefab", item.Top.root:GetChild("Effect2Holder"), nil, true, function()
                    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Onegift/FX_onegift_getitem.prefab", item.Top.root:GetChild("Effect2Holder"))
                  end)
                end
              end)
            end
          end
        end
      end
    end
    return not (day < ShopData.agreementInfo.curDay)
  end
  return true
end

function ShopWindow.PlayUnlockEffect()
  if ShopData.agreementInfo then
    local tips = uis.Main.Collection.Gift.OneYuanPassRegion.OneYuanPass
    local data = TableData.GetConfig(ShopData.agreementInfo.season, "BaseActivityAgreement")
    if data and table.contain(ShopData.agreementInfo.openList, data.pay_group_id) then
      for i = 1, ShopData.agreementInfo.curDay do
        local item = tips["Item" .. i]
        if item then
          TimerUtil.setTimeout(i * oneGiftInterval, function()
            if uis and not item.Below.root.isDisposed then
              UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Onegift/FX_onegift_getitem_reflash3.prefab", item.Below.root:GetChild("Effect2Holder"), nil, true, function()
                UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Onegift/FX_onegift_getitem.prefab", item.Below.root:GetChild("Effect2Holder"))
              end)
              UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Onegift/FX_onegift_getitem_unlock.prefab", item.Below.root:GetChild("Effect1Holder"), nil, true)
            end
          end)
        end
      end
    end
  end
end

function ShopWindow.RefreshGiftShopList()
  local data = ShopWindow.GetGiftDataByType(teamGiftType)
  local curTime = LoginData.GetCurServerTime()
  
  function uis.Main.Collection.Gift.RechargeList.RechargeList.itemRenderer(i, gift)
    local id = data[i + 1].id
    if data[i + 1].gift then
      local giftData = TableData.GetConfig(id, "BaseGift")
      if giftData then
        local item = gift:GetChild("GiftTipsBtn")
        ChangeUIController(item, "c3", 0)
        item:GetChild("NameTxt").text = giftData.name()
        UIUtil.SetText(item, T(713), "SubtitleTxt")
        UIUtil.SetText(item, T(695), "TitleTxt")
        if giftData.cost then
          local arr = Split(giftData.cost[1], ":")
          local price = item:GetChild("GiftBuyPrice")
          UIUtil.SetIconById(price:GetChild("PicLoader"), tonumber(arr[2]))
          UIUtil.SetText(price, tonumber(arr[3]), "NumberTxt")
          ChangeUIController(item, "c2", 1)
        else
          item:GetChild("FreeTxt").text = T(1067)
          ChangeUIController(item, "c2", 2)
        end
        local arr = Split(giftData.condition[1], ":")
        local lockLv = tonumber(arr[2])
        local tips = item:GetChild("Tips")
        local unLock = false
        if 2 == #arr and tonumber(arr[1]) == CONDITION_ENUM.LV and lockLv <= ActorData.GetLevel() then
          if giftData.sell_limit_max then
            local sellLimitType = {
              551,
              552,
              553,
              554
            }
            tips:GetChild("TipsTxt").text = T(sellLimitType[giftData.sell_limit_type], giftData.sell_limit_max)
            tips.visible = true
          else
            tips.visible = false
          end
          unLock = true
        else
          tips.visible = true
          tips:GetChild("TipsTxt").text = T(1068, lockLv)
        end
        ChangeUIController(item, "c1", giftData.quality)
        local canBuy = true
        if data[i + 1].buyNum then
          ChangeUIController(gift, "c1", 0)
          item.onClick:Set(function()
            if giftData.spd then
              ShopService.BuyGiftReq(giftData.id, function()
                UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.REFRESH_GIFT)
              end)
            else
              OpenWindow(WinResConfig.ShopGiftTipsWindow.name, nil, id, {
                COMMON_ITEM_ID.RECHARGE_DIAMOND
              })
            end
          end)
          if giftData.group_id and unLock and giftData.not_show_red == nil then
            item:GetChild("Red").visible = true
          else
            item:GetChild("Red").visible = false
          end
          canBuy = true
        else
          item:GetChild("Red").visible = false
          UIUtil.SetBtnText(gift:GetChild("SellOut"), T(469), T(470))
          ChangeUIController(gift, "c1", 1)
          tips.visible = false
          item.onClick:Set(function()
            FloatTipsUtil.ShowWarnTips(T(481))
          end)
          canBuy = false
        end
        local iconBg = item:GetChild("Bg")
        ShopMgr.LoadSpineByLoader(iconBg:GetChild("PicLoader"), iconBg:GetChild("PicHolder"), giftData, canBuy)
      end
    else
      local configGiftData = TableData.GetConfig(id, "BasePayProduct")
      if configGiftData then
        local item = gift:GetChild("GiftTipsBtn")
        item:GetChild("Red").visible = false
        item:GetChild("NameTxt").text = configGiftData.name()
        item:GetChild("PriceTxt").text = T(518, 18, configGiftData.price)
        ChangeUIController(item, "c2", 0)
        UIUtil.SetText(item, T(713), "SubtitleTxt")
        UIUtil.SetText(item, T(695), "TitleTxt")
        ChangeUIController(item, "c1", configGiftData.quality)
        local tips = item:GetChild("Tips")
        if data[i + 1].productType == ProtoEnum.PRODUCT_TYPE.PT_MONTH_CARD then
          local monthTime = item:GetChild("MonthTime")
          if ShopData.monthCardDay[configGiftData.month_card_type] and ShopData.monthCardDay[configGiftData.month_card_type] > 0 then
            monthTime:GetChild("TimeTxt").text = T(1069, ShopData.monthCardDay[configGiftData.month_card_type])
            ChangeUIController(item, "c3", 1)
          else
            ChangeUIController(item, "c3", 0)
          end
          tips.visible = false
        else
          if -1 == configGiftData.sell_limit_max then
            tips.visible = false
          else
            local sellLimitType = {
              551,
              552,
              553,
              554
            }
            if 0 ~= configGiftData.sell_limit_type and sellLimitType[configGiftData.sell_limit_type] then
              local buyNum = ShopData.limitRecord[id] or 0
              tips:GetChild("TipsTxt").text = T(sellLimitType[configGiftData.sell_limit_type], configGiftData.sell_limit_max - buyNum)
            end
            tips.visible = true
          end
          local monthTime = item:GetChild("MonthTime")
          if -1 ~= data[i + 1].endStamp and data[i + 1].endStamp - curTime > 0 then
            ChangeUIController(item, "c3", 1)
            monthTime:GetChild("TimeTxt").text = TimeUtil.FormatEnTime(data[i + 1].endStamp - curTime)
          else
            ChangeUIController(item, "c3", 0)
          end
        end
        local canBuy = true
        if nil == ShopData.limitRecord[id] or -1 == configGiftData.sell_limit_max or ShopData.limitRecord[id] < configGiftData.sell_limit_max then
          canBuy = true
          ChangeUIController(gift, "c1", 0)
        else
          canBuy = false
          UIUtil.SetBtnText(gift:GetChild("SellOut"), T(469), T(470))
          ChangeUIController(gift, "c1", 1)
          tips.visible = false
        end
        local iconBg = item:GetChild("Bg")
        ShopMgr.LoadSpineByLoader(iconBg:GetChild("PicLoader"), iconBg:GetChild("PicHolder"), configGiftData, canBuy)
        local originalPrice = item:GetChild("GiftTipsSale")
        if configGiftData.sell_type then
          UIUtil.SetText(originalPrice, configGiftData.sell_type(), "SaDLEtXT")
          ChangeUIController(item, "c4", 1)
        else
          ChangeUIController(item, "c4", 0)
        end
        item.onClick:Set(function()
          if -1 ~= data[i + 1].endStamp and data[i + 1].endStamp <= LoginData.GetCurServerTime() then
            ShopWindow.RefreshGiftShopList()
            FloatTipsUtil.ShowWarnTips(T(556))
            return
          end
          if ShopData.limitRecord[id] == nil or -1 == configGiftData.sell_limit_max or ShopData.limitRecord[id] < configGiftData.sell_limit_max then
            OpenWindow(WinResConfig.ShopGiftTipsWindow.name, nil, id, {
              COMMON_ITEM_ID.RECHARGE_DIAMOND
            })
          else
            FloatTipsUtil.ShowWarnTips(T(481))
          end
        end)
      end
    end
  end
  
  uis.Main.Collection.Gift.RechargeList.RechargeList.numItems = #data
end

function ShopWindow.GetGiftDataByType(shelfArea)
  local t = {}
  local config
  local curTime = LoginData.GetCurServerTime()
  local type = {
    ProtoEnum.PRODUCT_TYPE.PT_GIFT,
    ProtoEnum.PRODUCT_TYPE.PT_MONTH_CARD
  }
  for i = 1, #type do
    if ShopData.productInfo[type[i]] then
      for _, v in pairs(ShopData.productInfo[type[i]]) do
        if v.shelfArea == shelfArea and (-1 == v.endStamp or curTime < v.endStamp) then
          config = TableData.GetConfig(v.id, "BasePayProduct")
          if ShopData.limitRecord[v.id] == nil or -1 == config.sell_limit_max or ShopData.limitRecord[v.id] < config.sell_limit_max then
            v.buyNum = true
          else
            v.buyNum = false
          end
          table.insert(t, v)
        end
      end
    end
  end
  local id = ShopWindow.GetClientGift(shelfArea)
  for i, v in pairs(id) do
    table.insert(t, v)
  end
  table.sort(t, function(a, b)
    if a.buyNum then
      if b.buyNum then
        if a.sort == b.sort then
          return a.id < b.id
        else
          return a.sort < b.sort
        end
      else
        return true
      end
    elseif b.buyNum then
      return false
    elseif a.sort == b.sort then
      return a.id < b.id
    else
      return a.sort < b.sort
    end
  end)
  return t
end

function ShopWindow.GetClientGift(shelfArea)
  local data = TableData.GetTable("BaseGift")
  local gift = {}
  for i, v in pairs(data) do
    if 2 == v.type and shelfArea == v.banner_group then
      local bol = ShopData.GetGiftInfoById(v.id)
      if not bol then
        if gift[v.group_id] then
          if gift[v.group_id].id > v.id then
            gift[v.group_id] = {
              id = v.id,
              sort = v.sort,
              buyNum = true,
              gift = true
            }
          end
        else
          gift[v.group_id] = {
            id = v.id,
            sort = v.sort,
            buyNum = true,
            gift = true
          }
        end
      elseif v.next == nil and bol and nil == v.spd then
        gift[v.group_id] = {
          id = v.id,
          sort = v.sort,
          buyNum = false,
          gift = true
        }
      end
    end
  end
  return gift
end

function ShopWindow.RefreshFirstGift()
  local gift = uis.Main.Collection.Gift.FirstRechargeRegion
  local data = TableData.GetConfig(firstGiftId, "BaseGift")
  local showItem = function(list, rewardId, ctrPage)
    local rewardLvData = TableData.GetConfig(rewardId, "BaseGiftReward")
    if rewardLvData and list then
      local arr = GetConfigItemList(rewardLvData.rewards, true)
      
      function list.itemRenderer(i, item)
        ShopWindow.ShowAllItemFrame(arr[i + 1], item, ctrPage)
      end
      
      list.numItems = #arr
    end
  end
  local giftInfo = ShopData.GetGiftInfoById(data.id)
  local getReward = function(id)
    if giftInfo then
      return table.contain(giftInfo.rewards, id)
    end
  end
  showItem(gift.FirstRecharge.Day1List, data.gift_reward_ids[1], getReward(data.gift_reward_ids[1]) and 1 or 0)
  showItem(gift.FirstRecharge.Day2List, data.gift_reward_ids[2], getReward(data.gift_reward_ids[2]) and 1 or 0)
  showItem(gift.FirstRecharge.Day3List, data.gift_reward_ids[3], getReward(data.gift_reward_ids[3]) and 1 or 0)
  UIUtil.SetText(gift.FirstRecharge.GoBtn, T(1105), "NameTxt")
  UIUtil.SetText(gift.FirstRecharge.GetBtn, T(1106), "NameTxt")
  gift.FirstRecharge.GetBtn.onClick:Clear()
  local get = false
  local ctr = {
    gift.FirstRecharge.Day1.c1Ctr,
    gift.FirstRecharge.Day2.c1Ctr,
    gift.FirstRecharge.Day3.c1Ctr
  }
  for i = 1, #data.gift_reward_ids do
    if ShopData.canRewards and table.contain(ShopData.canRewards, data.gift_reward_ids[i]) then
      ChangeController(ctr[i], 1)
      get = true
    else
      ChangeController(ctr[i], 0)
    end
  end
  if ShopData.isBought then
    if giftInfo then
      if table.contain(giftInfo.rewards, data.gift_reward_ids[#data.gift_reward_ids]) then
        ChangeController(gift.FirstRecharge.c1Ctr, 3)
        gift.FirstRecharge.Complete.NameTxt.text = T(1108)
      elseif false == get then
        ChangeController(gift.FirstRecharge.c1Ctr, 2)
        gift.FirstRecharge.Complete.NameTxt.text = T(1107)
      else
        ChangeController(gift.FirstRecharge.c1Ctr, 1)
        local red = gift.FirstRecharge.GetBtn:GetChild("Red")
        if red then
          red.visible = true
        end
        gift.FirstRecharge.GetBtn.onClick:Set(function()
          ShopService.GetGiftRewardReq(giftInfo.giftId, 0, function(msg)
            if uis then
              GetItemTips.Show(msg.goods, true)
              ShopWindow.RefreshFirstGift()
            end
          end)
        end)
      end
    end
  else
    ChangeController(gift.FirstRecharge.c1Ctr, 0)
  end
  gift.FirstRecharge.GoBtn.onClick:Set(function()
    uis.Main.TabRegion.Tab2Btn.onClick:Call()
  end)
  ChangeController(uis.Main.Collection.Gift.c1Ctr, 1)
  PlayUITrans(uis.Main.Collection.root, "FristIn")
end

function ShopWindow.ShowAllItemFrame(addAttr, item, page, clickFun)
  if addAttr.type == ProtoEnum.TUPLE_TYPE.CARD then
    local loader = item:GetChild("CardFrame"):GetChild("ItemCardPic"):GetChild("ItemLoader")
    if loader then
      local data = TableData.GetConfig(addAttr.id, "BaseCard")
      if data then
        UIUtil.SetHeadByFaceId(data.fashion_id, loader, HEAD_ICON_TYPE_ENUM.RECT)
        ChangeUIController(item:GetChild("CardFrame"), "c1", data.star - 1)
      end
    end
    ChangeUIController(item, "c2", 1)
  elseif addAttr.type == ProtoEnum.TUPLE_TYPE.ITEM then
    local config = TableData.GetConfig(addAttr.id, "BaseItem")
    local itemFrame = item:GetChild("ItemFrame")
    local loader = itemFrame:GetChild("ItemLoader")
    if loader and config then
      loader.url = UIUtil.GetResUrl(config.icon)
    end
    ChangeUIController(item, "c2", 0)
    ChangeUIController(itemFrame, "c1", config.quality)
    local numberTxt = itemFrame:GetChild("NumberTxt")
    if numberTxt then
      numberTxt.text = addAttr.value
    end
  end
  item.onClick:Set(function()
    if nil == clickFun then
      UIUtil.OpenPreviewTips(addAttr.id, addAttr.type)
    else
      clickFun()
    end
  end)
  ChangeUIController(item, "c1", page)
end

function ShopWindow.ChallengeTableKey(tb)
  local t = {}
  for i, v in pairs(tb) do
    t[v.id] = v
  end
  return t
end

function ShopWindow.GetLimitNum(id)
  local config = TableData.GetConfig(id, "BaseShopGrid")
  if config then
    return config.sell_limit_time
  end
end

function ShopWindow.ShowOneReward(reward, item, loaderName, numberTxtName, showStr, smallIcon)
  local config, ctrType
  if item and reward then
    local arr = Split(reward, ":")
    if arr and 3 == #arr then
      if 2 == tonumber(arr[1]) then
        ctrType = 1
        local loader = item:GetChild("CardHead"):GetChild("PicLoader")
        if loader then
          local data = TableData.GetConfig(tonumber(arr[2]), "BaseCard")
          if data then
            local list = item:GetChild("StarList")
            
            function list.itemRenderer()
            end
            
            list.numItems = data.star
            UIUtil.SetHeadByFaceId(data.fashion_id, loader, HEAD_ICON_TYPE_ENUM.RECT)
            config = {
              quality = data.star - 1,
              name = data.name
            }
          end
        end
      else
        ctrType = 0
        local loader = item:GetChild(loaderName)
        if loader then
          config = TableData.GetConfig(tonumber(arr[2]), "BaseItem")
          if config then
            local icon = smallIcon and config.icon_small and config.icon_small or config.icon
            loader.url = UIUtil.GetResUrl(icon)
          end
        end
      end
      local numberTxt = item:GetChild(numberTxtName)
      if numberTxt then
        if showStr then
          ChangeUIController(item, "number", tonumber(arr[3]) > 1 and 0 or 1)
        end
        numberTxt.text = arr[3]
      end
    end
  end
  return config, ctrType
end

function ShopWindow.TabOnClick(index, page)
  lastIndex = index - 1
  uis.Main.Collection.c1Ctr.selectedIndex = index - 1
  uis.Main.TabRegion.c1Ctr.selectedIndex = index
  local bgId = {
    FEATURE_ENUM.SHOP_RECOMMEND,
    FEATURE_ENUM.SHOP_GOLD,
    FEATURE_ENUM.SHOP_GIFT,
    FEATURE_ENUM.SHOP_CLOTHES,
    FEATURE_ENUM.SHOP_TOKEN
  }
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(bgId[index])
  if nil == tabInit[index] or page then
    if 1 == index then
      ShopService.GetAllRecommendImgReq(function()
        firstTran[1] = true
      end)
    elseif 2 == index then
      ShopService.GetPurchaseProductsReq({
        ProtoEnum.PRODUCT_TYPE.PT_RECHARGE
      }, PLATFORM_TYPE, function()
        ShopWindow.InitRecharge()
      end)
    elseif 3 == index then
      if tabInit[index] then
        ShopWindow.InitGift(page)
      else
        ShopService.GetPurchaseProductsReq({
          ProtoEnum.PRODUCT_TYPE.PT_GIFT,
          ProtoEnum.PRODUCT_TYPE.PT_MONTH_CARD
        }, PLATFORM_TYPE, function()
          ShopWindow.InitGift(page)
        end, function()
          ShopWindow.InitGift()
        end)
      end
    elseif 4 == index then
      ShopService.GetPurchaseProductsReq({
        ProtoEnum.PRODUCT_TYPE.PT_FASHION
      }, PLATFORM_TYPE, function()
        ShopWindow.InitClothes()
      end)
    elseif 5 == index then
      ShopService.GetShopInfoReq({1, 2}, function()
        ShopWindow.InitToken(page)
      end)
    end
    tabInit[index] = true
  else
    if 3 == index then
      if 1 == uis.Main.Collection.Gift.c1Ctr.selectedIndex then
        ShopService.GetGiftInfoReq(function()
          if uis then
            ShopWindow.RefreshFirstGift()
          end
        end)
      end
    elseif 1 == index then
      ShopWindow.InitRecommend()
    elseif 4 == index then
      ShopWindow.InitClothes()
    elseif 5 == index and ShopWindow.CanRefresh() then
      ShopService.GetShopInfoReq({1, 2}, function()
        ShopWindow.RefreshTokenShopList()
      end)
    end
    ShopWindow.UpdateCheckTime(index)
  end
  if 3 == index or 4 == index then
    ShopWindow.SetAssetsTips({
      COMMON_ITEM_ID.RECHARGE_DIAMOND
    })
  elseif 5 == index then
    if tokenShopBar and tokenShopBar[ShopData.curShopType] then
      ShopWindow.SetAssetsTips(tokenShopBar[ShopData.curShopType])
    end
    uis.Main.Collection.Token.TokenItem.TokenList.scrollPane.posX = 0
  end
end

function ShopWindow.CheckProductInfoTime(types)
  local curTime = LoginData.GetCurServerTime()
  for _, type in pairs(types) do
    if ShopData.productInfo[type] then
      for i, v in pairs(ShopData.productInfo[type]) do
        if -1 ~= v.endStamp and curTime > v.endStamp then
          return true
        end
      end
    end
  end
end

function ShopWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ShopWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_SHOP, function()
    if notReopen then
      UIMgr:CloseWindow(WinResConfig.ShopWindow.name, true, true)
    else
      UIMgr:CloseWindow(WinResConfig.ShopWindow.name)
    end
  end, nil)
  local tab = uis.Main.TabRegion
  local tabBtn = {
    tab.Tab1Btn,
    tab.Tab2Btn,
    tab.Tab3Btn,
    tab.Tab4Btn,
    tab.Tab5Btn
  }
  local trans = uis.Main.root:GetTransition("up")
  for i = 1, 5 do
    tabBtn[i].soundFmod = SOUND_EVENT_ENUM.TAB_TAG_BOTTOM
    UIUtil.SetTagButtonSwitch(tabBtn[i], trans, function()
      if lastIndex ~= i - 1 then
        return true
      end
    end, function()
      ShopWindow.TabOnClick(i)
    end, tabBtn.root)
  end
  uis.Main.Collection.Token.ExplainBtn.onClick:Set(function()
    OpenWindow(WinResConfig.TokenExplainWindow.name)
  end)
end

function ShopWindow.UpdateAssetsTips()
  uis.Main.Collection.AssetsTipsGroup.AssetsTipsList.numItems = uis.Main.Collection.AssetsTipsGroup.AssetsTipsList.numItems
end

function ShopWindow.UpdateCheckTime(index, showTips)
  local page = index or uis.Main.TabRegion.c1Ctr.selectedIndex
  if 1 == page then
    if ShopWindow.CheckRecommendTime() then
      if showTips then
        FloatTipsUtil.ShowWarnTips(T(1060, T(452)))
      end
      ShopService.GetAllRecommendImgReq()
    end
  elseif 3 == page then
    if ShopWindow.CheckProductInfoTime({
      ProtoEnum.PRODUCT_TYPE.PT_GIFT,
      ProtoEnum.PRODUCT_TYPE.PT_MONTH_CARD
    }) then
      if showTips then
        FloatTipsUtil.ShowWarnTips(T(1060, T(456)))
      end
      ShopService.GetPurchaseProductsReq({
        ProtoEnum.PRODUCT_TYPE.PT_GIFT,
        ProtoEnum.PRODUCT_TYPE.PT_MONTH_CARD
      }, PLATFORM_TYPE, function()
        ShopWindow.InitGift()
      end)
    end
  elseif 4 == page and ShopWindow.CheckProductInfoTime({
    ProtoEnum.PRODUCT_TYPE.PT_FASHION
  }) then
    if showTips then
      FloatTipsUtil.ShowWarnTips(T(1060, T(458)))
    end
    ShopService.GetPurchaseProductsReq({
      ProtoEnum.PRODUCT_TYPE.PT_FASHION
    }, PLATFORM_TYPE, function()
      ShopWindow.InitClothes()
    end)
  end
end

function ShopWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.ShopWindow.GET_RECOMMEND then
    ShopWindow.InitRecommend()
  elseif msgId == WindowMsgEnum.ShopWindow.GET_GIFT then
    if 3 == uis.Main.TabRegion.c1Ctr.selectedIndex then
      uis.Main.Collection.Gift.RechargeList.RechargeList.numItems = uis.Main.Collection.Gift.RechargeList.RechargeList.numItems
    end
    ShopWindow.UpdateAssetsTips()
  elseif msgId == WindowMsgEnum.ShopWindow.REFRESH_GIFT then
    if 3 == uis.Main.TabRegion.c1Ctr.selectedIndex then
      ShopWindow.RefreshGiftShopList()
    end
    ShopWindow.UpdateAssetsTips()
  elseif msgId == WindowMsgEnum.ShopWindow.GET_CLOTHES then
    if 4 == uis.Main.TabRegion.c1Ctr.selectedIndex then
      uis.Main.Collection.Clothes.ClothesList.numItems = uis.Main.Collection.Clothes.ClothesList.numItems
      ShopWindow.UpdateAssetsTips()
    end
  elseif msgId == WindowMsgEnum.ShopWindow.REFRESH_NUM then
    ShopWindow.SortGoods()
    ShopWindow.UpdateAssetsTips()
    uis.Main.Collection.Token.TokenItem.TokenList.numItems = #ShopData.shopInfo[ShopData.curShopType].goods
  elseif msgId == WindowMsgEnum.ShopWindow.REFRESH_PRODUCT then
    if 2 == uis.Main.TabRegion.c1Ctr.selectedIndex then
      ShopWindow.InitRecharge()
    elseif 3 == uis.Main.TabRegion.c1Ctr.selectedIndex then
      uis.Main.Collection.Gift.RechargeList.RechargeList.numItems = uis.Main.Collection.Gift.RechargeList.RechargeList.numItems
    end
    ShopWindow.UpdateAssetsTips()
    ShopWindow.UpdateMonthDay()
  elseif msgId == WindowMsgEnum.ShopWindow.CHANG_PAGE then
    local tab = uis.Main.TabRegion
    local tabBtn = {
      tab.Tab1Btn,
      tab.Tab2Btn,
      tab.Tab3Btn,
      tab.Tab4Btn,
      tab.Tab5Btn
    }
    if para and tabBtn[para] then
      tabBtn[para].onClick:Call()
    end
  elseif msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    ShopService.PurchaseGetReq(function()
      tabInit[uis.Main.TabRegion.c1Ctr.selectedIndex] = nil
      ShopWindow.TabOnClick(uis.Main.TabRegion.c1Ctr.selectedIndex)
      if 3 == uis.Main.TabRegion.c1Ctr.selectedIndex then
        FloatTipsUtil.ShowWarnTips(T(1060, T(456)))
      end
    end)
  elseif msgId == WindowMsgEnum.Common.E_MSG_SERVER_TIME_CHANGE then
    ShopWindow.UpdateCheckTime(nil, true)
  elseif msgId == WindowMsgEnum.ShopWindow.REFRESH_ONE_GIFT and 3 == uis.Main.TabRegion.c1Ctr.selectedIndex and 2 == uis.Main.Collection.Gift.c1Ctr.selectedIndex then
    ShopWindow.ShowAgreementInfo()
    OpenWindow(WinResConfig.OneYuanPassTipsWindow.name)
    showAgreementEffect = true
  end
end

function ShopWindow.OnShown()
  if uis and showAgreementEffect and 2 == uis.Main.Collection.Gift.c1Ctr.selectedIndex then
    showAgreementEffect = nil
    ShopWindow.PlayUnlockEffect()
  end
end

function ShopWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.ShopWindow.name)
  uis = nil
  contentPane = nil
  maxRefreshNum = nil
  tabInit = nil
  notReopen = nil
  lastIndex = nil
  MonthTime = nil
  tokenShopBar = nil
  ShopWindow.DisposeMap()
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return ShopWindow
